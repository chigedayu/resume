package org.example.resume.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("resumes")
@Data
public class Resumes extends BaseEntity{
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer userId;
    private String imgUrl;
    private String name;
    private String job;
    private String skinColor;
}    