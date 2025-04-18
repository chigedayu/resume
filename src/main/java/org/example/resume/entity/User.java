package org.example.resume.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("users")
//@NoArgsConstructor
//@AllArgsConstructor
public class User extends BaseEntity{
    @TableId(type = IdType.AUTO)
    private Integer userId;
    private String username;
    private String password;
    //接收前端的确认密码，标识为数据库不存在字段，与数据库无关
    @TableField(exist = false)
    private String confirmPassword;
    private String realName;
    private String avatar;
    private String email;
    private String phone;
    private String role;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    @TableField(exist = false)
    private String token;
}    