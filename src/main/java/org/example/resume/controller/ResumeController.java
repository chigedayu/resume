package org.example.resume.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.resume.entity.ResumeSave;
import org.example.resume.entity.ResumeSaveRequest;
import org.example.resume.entity.User;
import org.example.resume.exception.ServiceException;
import org.example.resume.mapper.ResumeSaveMapper;
import org.example.resume.mapper.UserMapper;
import org.example.resume.service.ResumeSaveService;
import org.example.resume.util.Result;
import org.example.resume.util.ResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    ResumeSaveMapper resumeSaveMapper;
    @Autowired
    ResumeSaveService resumeSaveService;
    @Autowired
    UserMapper userMapper;

    private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    @PostMapping("/saveResume")
    public Result<?> saveResume(@RequestBody ResumeSaveRequest request) {
        String username = request.getUsername();
        String template = request.getTemplate();
        Object resume = request.getResume();

        // 根据用户名查询用户
        Map<String, Object> columnMap = new HashMap<>();
        columnMap.put("username", username);
        User user = userMapper.selectByMap(columnMap).stream().findFirst().orElse(null);

        if (user == null) {
            // 抛出用户不存在异常
            throw new ServiceException(ResultEnum.USER_NOT_EXIST);
        }

        // 创建 ResumeSave 对象
        ResumeSave resumeSave = new ResumeSave();
        resumeSave.setUserId(user.getUserId());
        resumeSave.setResumeName(template);
        // 这里需要将 Resume 对象转换为 JSON 字符串存储
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String resumeJson = objectMapper.writeValueAsString(resume);
            resumeSave.setResumeJson(resumeJson);
        } catch (JsonProcessingException e) {
            throw new ServiceException(ResultEnum.ORDER_CREATE_FAIL);
        }

        // 调用服务层保存简历
        int result = resumeSaveService.save(resumeSave);

        if (result > 0) {
            return Result.success();
        } else {
            throw new ServiceException(ResultEnum.ORDER_CREATE_FAIL);
        }
    }
    @GetMapping("/getHistoryResumes")
    public Result<List<ResumeSave>> getHistoryResumes(@RequestParam String username) {
        logger.info("Received request to get history resumes for user: {}", username);
        // 根据用户名查询用户
        Map<String, Object> columnMap = new HashMap<>();
        columnMap.put("username", username);
        User user = userMapper.selectByMap(columnMap).stream().findFirst().orElse(null);

        if (user == null) {
            // 抛出用户不存在异常
            throw new ServiceException(ResultEnum.USER_NOT_EXIST);
        }
        // 根据用户ID查询历史简历
        Map<String, Object> resumeMap = new HashMap<>();
        resumeMap.put("user_id", user.getUserId());
        List<ResumeSave> historyResumes = resumeSaveMapper.selectByMap(resumeMap);
        return Result.success(historyResumes);
    }
}