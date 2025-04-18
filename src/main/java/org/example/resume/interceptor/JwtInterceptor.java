package org.example.resume.interceptor;

import io.jsonwebtoken.Claims;

import org.example.resume.exception.ServiceException;
import org.example.resume.util.JwtUtils;
import org.example.resume.util.ResultEnum;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 定义Jwt令牌校验拦截器
 * @Component 将Bean反转给IOC容器管理
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {
    // 定义存储token令牌的头部字段名 (要求前端将token令牌携带在http请求头里面)
    private static final String AUTH_HEADER = "Authorization";
    // 定义token令牌的前缀 (可选)
    private static final String TOKEN_PREFIX = "Bearer ";


    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        // 1. 获取并校验token
        String token = request.getHeader(AUTH_HEADER);
        // 如果令牌为null, 或者令牌的前缀不对, 抛出业务异常让全局异常处理器去返回
        if (token == null || !token.startsWith(TOKEN_PREFIX)) {
            // response.sendError(401, "未提供有效令牌");
            throw new ServiceException(ResultEnum.INVALID_TOKEN);
        }
        // 去除令牌前缀, 截取出真正的token
        token = token.substring(TOKEN_PREFIX.length());
        try {
            // 使用Jwt工具类校验token令牌
            // 如果令牌过期或者是伪造的令牌, 会抛出解析失败的异常
            Claims claims = JwtUtils.parseToken(token);
            // 4. 将token令牌中解析出来的用户信息存储到request对象中
            // 目的: 后续代码可以从request中取出用户信息, 识别当前用户是谁
            request.setAttribute("userId", claims.get("userId").toString());
            // 令牌解析成功 => 放行
            return true;
        } catch (Exception e) { // 这里最好catch Jwt的具体异常
            // 令牌解析识别, 抛出令牌已过期的异常
            throw new ServiceException(ResultEnum.EXPIRED_TOKEN);
        }
    }
}