package org.example.resume.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.List;



@Data
public class ResumeSaveRequest {
    @TableId(type = IdType.AUTO)
    private String imgUrl;
    private String name;
    private String job;
    private List<String> infos;
    private List<Contacts> contacts;
    private List<String> titles;
    private List<Practices> practices;
    private List<Projects> projects;
    private List<String> skills;
    private List<Prizes> prizes;
    private String username;
    private String template;
    private Object resume; // 假设 resume 是一个通用对象，根据实际情况调整类型
}