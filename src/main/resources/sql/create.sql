drop database if exists resume;

create database resume default charset utf8mb4;

use resume;

-- 用户表
CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       real_name VARCHAR(50),
                       avatar VARCHAR(255),
                       email VARCHAR(100),
                       phone VARCHAR(20),
                       role VARCHAR(20) NOT NULL COMMENT '用户角色，如admin, manager, staff',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB COMMENT='用户信息表';

-- 简历主表
CREATE TABLE resumes (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         user_id INT NOT NULL,
                         img_url VARCHAR(255),
                         name VARCHAR(255),
                         job VARCHAR(255),
                         skin_color VARCHAR(50),
                         FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 个人信息表
CREATE TABLE infos (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       resume_id INT NOT NULL,
                       info_text TEXT,
                       sort_order INT,
                       FOREIGN KEY (resume_id) REFERENCES resumes(id)
);

-- 联系方式表
CREATE TABLE contacts (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          resume_id INT NOT NULL,
                          icon VARCHAR(50),
                          link VARCHAR(255),
                          sort_order INT,
                          FOREIGN KEY (resume_id) REFERENCES resumes(id)
);

-- 实践经历表
CREATE TABLE practices (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           resume_id INT NOT NULL,
                           time VARCHAR(50),
                           company VARCHAR(255),
                           description TEXT,
                           sort_order INT,
                           FOREIGN KEY (resume_id) REFERENCES resumes(id)
);

-- 项目经验表
CREATE TABLE projects (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          resume_id INT NOT NULL,
                          time VARCHAR(50),
                          art VARCHAR(255),
                          description TEXT,
                          link VARCHAR(255),
                          sort_order INT,
                          FOREIGN KEY (resume_id) REFERENCES resumes(id)
);

-- 专业技能表
CREATE TABLE skills (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        resume_id INT NOT NULL,
                        skill_text TEXT,
                        sort_order INT,
                        FOREIGN KEY (resume_id) REFERENCES resumes(id)
);

-- 获奖情况表
CREATE TABLE prizes (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        resume_id INT NOT NULL,
                        time VARCHAR(50),
                        description TEXT,
                        sort_order INT,
                        FOREIGN KEY (resume_id) REFERENCES resumes(id)
);

-- 技能条表
CREATE TABLE skillbars (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           resume_id INT NOT NULL,
                           name VARCHAR(255),
                           flex INT,
                           sort_order INT,
                           FOREIGN KEY (resume_id) REFERENCES resumes(id)
);