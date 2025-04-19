package org.example.resume.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.List;



@Data
public class ResumeSaveRequest {
    private String username;
    private String template;
    private String resumeName;
    private Object resume; // 假设 resume 是一个通用对象，根据实际情况调整类型
}