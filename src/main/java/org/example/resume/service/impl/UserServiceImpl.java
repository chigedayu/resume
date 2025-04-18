package org.example.resume.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.example.resume.entity.User;
import org.example.resume.exception.ServiceException;
import org.example.resume.mapper.UserMapper;
import org.example.resume.service.UserService;
import org.example.resume.util.JwtUtils;
import org.example.resume.util.PasswordUtil;
import org.example.resume.util.Result;
import org.example.resume.util.ResultEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    /**
     *
     * @param user
     * @return
     * 1.用户名不能为空
     * 2.密码不能为空
     * 3.两次输入的密码不一致
     * 4.用户已存在
     */
    @Override
    public Result register(User user) {
        //参数校验
        if(!StringUtils.hasText(user.getUsername())){
            throw new ServiceException(ResultEnum.USERNAME_NOT_NULL);
        }if(!StringUtils.hasText(user.getPassword())){
            throw new ServiceException(ResultEnum.PASSWORD_NOT_NULL);
        }if(!Objects.equals(user.getPassword(), user.getConfirmPassword())){
            throw new ServiceException(ResultEnum.PASSWORD_MISMATCH);
        }
        synchronized (user){
            //根据用户名查询用户是否已存在
            QueryWrapper<User> qw = new QueryWrapper<>();
            qw.eq("username", user.getUsername());
            User one = userMapper.selectOne(qw);
            if(!Objects.isNull(one)){
                throw new ServiceException(ResultEnum.USER_ALREADY_EXISTS);
            }
            //设置角色默认值为admin
            user.setRole("admin");
            //密码加密后入库
            user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
            //插入用户
            userMapper.insert(user);
        }


        return Result.success();
    }
    @Override
    public Result<User> login(User user) {
        // 参数校验
        if (!StringUtils.hasText(user.getUsername())) {
            throw new ServiceException(ResultEnum.USERNAME_NOT_NULL);
        }
        if (!StringUtils.hasText(user.getPassword())) {
            throw new ServiceException(ResultEnum.PASSWORD_NOT_NULL);
        }
        // 查询用户
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("username", user.getUsername());
        User one = userMapper.selectOne(qw);
        if (one == null) {
            // 抛出用户不存在异常
            throw new ServiceException(ResultEnum.USER_NOT_EXIST);
        }
        // 将用户密码加密后与数据库密码进行比较
        // user.getPassword()是用户输入的明文密码
        // one.getPassword()是数据库存储的密文密码
        if (!PasswordUtil.checkPassword(user.getPassword(), one.getPassword())) {
            throw new ServiceException(ResultEnum.PASSWORD_ERROR);
        }
        // 以上错误不成立, 说明用户是存在的, 密码也是对的
        // 生成token令牌
        Map<String,Object> map = new HashMap<>();
        map.put("userId", one.getUserId());
        map.put("username", user.getUsername());
        map.put("role", one.getRole());
        String token = JwtUtils.generateAccessToken(map);
        // 返回数据库查询到的user对象给前端
        // 把密码去除后返回
        one.setPassword(null);
        // 把token放入user一起返回 (User类中需要定义token字段, 并标注起于数据库无关)
        one.setToken(token);
        return Result.success(one);
    }
}
