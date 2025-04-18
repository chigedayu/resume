package org.example.resume.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("projects")
@Data
public class Projects extends BaseEntity{
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer resumeId;
    private String time;
    private String art;
    private String description;
    private String link;
    private Integer sortOrder;
}    