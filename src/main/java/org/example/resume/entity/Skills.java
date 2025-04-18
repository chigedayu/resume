package org.example.resume.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("skills")
@Data
public class Skills extends BaseEntity{
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer resumeId;
    private String skillText;
    private Integer sortOrder;
}    