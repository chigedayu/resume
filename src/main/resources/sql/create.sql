/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : resume

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 18/04/2025 15:20:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for infos
-- ----------------------------
DROP TABLE IF EXISTS `infos`;
CREATE TABLE `infos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `info_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `infos_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of infos
-- ----------------------------

-- ----------------------------
-- Table structure for practices
-- ----------------------------
DROP TABLE IF EXISTS `practices`;
CREATE TABLE `practices`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `practices_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of practices
-- ----------------------------

-- ----------------------------
-- Table structure for prizes
-- ----------------------------
DROP TABLE IF EXISTS `prizes`;
CREATE TABLE `prizes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `prizes_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prizes
-- ----------------------------

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `art` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------

-- ----------------------------
-- Table structure for resume_save
-- ----------------------------
DROP TABLE IF EXISTS `resume_save`;
CREATE TABLE `resume_save`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `resume_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resume_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `template` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `resume_save_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume_save
-- ----------------------------
INSERT INTO `resume_save` VALUES (1, 1, NULL, NULL, NULL);
INSERT INTO `resume_save` VALUES (2, 1, NULL, NULL, NULL);
INSERT INTO `resume_save` VALUES (3, 1, 'default', 'username=user01&template=default&resume%5BimgUrl%5D=https%3A%2F%2Fi.loli.net%2F2018%2F05%2F27%2F5b0a6c40ae11c.jpg&resume%5BskinColor%5D=&resume%5Bname%5D=%E5%A7%93%E5%90%8D&resume%5Bjob%5D=%E5%BA%94%E8%81%98%E5%89%8D%E7%AB%AF%E5%BC%80%E5%8F%91%E5%B7%A5%E7%A8%8B%E5%B8%88&resume%5Binfos%5D%5B0%5D=%E7%94%B7+%2F+24%E5%B2%81&resume%5Binfos%5D%5B1%5D=xx%E5%A4%A7%E5%AD%A6&resume%5Binfos%5D%5B2%5D=xx%E4%B8%93%E4%B8%9A&resume%5Binfos%5D%5B3%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Binfos%5D%5B4%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bcontacts%5D%5B0%5D%5Bicon%5D=icon-homepage&resume%5Bcontacts%5D%5B0%5D%5Blink%5D=***&resume%5Bcontacts%5D%5B1%5D%5Bicon%5D=icon-github&resume%5Bcontacts%5D%5B1%5D%5Blink%5D=***&resume%5Bcontacts%5D%5B2%5D%5Bicon%5D=icon-email&resume%5Bcontacts%5D%5B2%5D%5Blink%5D=2015081a%40sina.com&resume%5Bcontacts%5D%5B3%5D%5Bicon%5D=icon-phone&resume%5Bcontacts%5D%5B3%5D%5Blink%5D=%E7%82%B9%E5%87%BB%E5%A1%AB%E5%86%99%E7%94%B5%E8%AF%9D&resume%5Bcontacts%5D%5B4%5D%5Bicon%5D=icon-link&resume%5Bcontacts%5D%5B4%5D%5Blink%5D=%E7%82%B9%E5%87%BB%E5%A1%AB%E5%86%99%E7%A4%BE%E4%BA%A4%E8%B4%A6%E5%8F%B7&resume%5Btitles%5D%5B0%5D=%E5%AE%9E%E8%B7%B5%E7%BB%8F%E5%8E%86&resume%5Btitles%5D%5B1%5D=%E9%A1%B9%E7%9B%AE%E7%BB%8F%E9%AA%8C&resume%5Btitles%5D%5B2%5D=%E4%B8%93%E4%B8%9A%E6%8A%80%E8%83%BD&resume%5Btitles%5D%5B3%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bpractices%5D%5B0%5D%5Btime%5D=2015.07+%7E+2016.10&resume%5Bpractices%5D%5B0%5D%5Bcompany%5D=ABC%E7%BD%91%E7%BB%9C%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&resume%5Bpractices%5D%5B0%5D%5Bdescription%5D=%E6%88%91%E5%9C%A8%E8%AF%A5%E5%85%AC%E5%8F%B8%E8%B4%9F%E8%B4%A3%E4%BA%86%E5%93%AA%E4%BA%9B%E5%B7%A5%E4%BD%9C%EF%BC%8C%E5%88%86%E5%88%AB%E5%9C%A8%E5%93%AA%E4%BA%9B%E5%9C%B0%E6%96%B9%E5%81%9A%E5%BE%97%E5%87%BA%E8%89%B2%2F%E5%92%8C%E5%88%AB%E4%BA%BA%E4%B8%8D%E4%B8%80%E6%A0%B7%2F%E6%88%90%E9%95%BF%E5%BF%AB%EF%BC%8C%E5%B7%A5%E4%BD%9C%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E5%9B%B0%E9%9A%BE%E7%9A%84%E9%97%AE%E9%A2%98%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E6%88%91%E9%87%87%E5%8F%96%E4%BA%86%E4%BB%80%E4%B9%88%E6%8E%AA%E6%96%BD%EF%BC%8C%E6%9C%80%E5%90%8E%E7%BB%93%E6%9E%9C%E5%A6%82%E4%BD%95%E3%80%82%E5%B7%A5%E4%BD%9C%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E8%87%AA%E8%B1%AA%E7%9A%84%E6%8A%80%E6%9C%AF%E7%BB%86%E8%8A%82%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E4%B8%BA%E4%BB%80%E4%B9%88%EF%BC%8C%E5%AE%9E%E6%96%BD%E5%89%8D%E5%92%8C%E5%AE%9E%E6%96%BD%E5%90%8E%E7%9A%84%E6%95%B0%E6%8D%AE%E5%AF%B9%E6%AF%94%E5%A6%82%E4%BD%95%EF%BC%8C%E5%90%8C%E4%BA%8B%E5%92%8C%E9%A2%86%E5%AF%BC%E5%AF%B9%E6%AD%A4%E7%9A%84%E5%8F%8D%E5%BA%94%E5%A6%82%E4%BD%95%E3%80%82&resume%5Bpractices%5D%5B1%5D%5Btime%5D=2016.11+%7E+2017.10&resume%5Bpractices%5D%5B1%5D%5Bcompany%5D=DEF%E7%BD%91%E7%BB%9C%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&resume%5Bpractices%5D%5B1%5D%5Bdescription%5D=%E6%88%91%E5%9C%A8%E8%AF%A5%E5%85%AC%E5%8F%B8%E8%B4%9F%E8%B4%A3%E4%BA%86%E5%93%AA%E4%BA%9B%E5%B7%A5%E4%BD%9C%EF%BC%8C%E5%88%86%E5%88%AB%E5%9C%A8%E5%93%AA%E4%BA%9B%E5%9C%B0%E6%96%B9%E5%81%9A%E5%BE%97%E5%87%BA%E8%89%B2%2F%E5%92%8C%E5%88%AB%E4%BA%BA%E4%B8%8D%E4%B8%80%E6%A0%B7%2F%E6%88%90%E9%95%BF%E5%BF%AB%EF%BC%8C%E5%B7%A5%E4%BD%9C%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E5%9B%B0%E9%9A%BE%E7%9A%84%E9%97%AE%E9%A2%98%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E6%88%91%E9%87%87%E5%8F%96%E4%BA%86%E4%BB%80%E4%B9%88%E6%8E%AA%E6%96%BD%EF%BC%8C%E6%9C%80%E5%90%8E%E7%BB%93%E6%9E%9C%E5%A6%82%E4%BD%95%E3%80%82%E5%B7%A5%E4%BD%9C%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E8%87%AA%E8%B1%AA%E7%9A%84%E6%8A%80%E6%9C%AF%E7%BB%86%E8%8A%82%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E4%B8%BA%E4%BB%80%E4%B9%88%EF%BC%8C%E5%AE%9E%E6%96%BD%E5%89%8D%E5%92%8C%E5%AE%9E%E6%96%BD%E5%90%8E%E7%9A%84%E6%95%B0%E6%8D%AE%E5%AF%B9%E6%AF%94%E5%A6%82%E4%BD%95%EF%BC%8C%E5%90%8C%E4%BA%8B%E5%92%8C%E9%A2%86%E5%AF%BC%E5%AF%B9%E6%AD%A4%E7%9A%84%E5%8F%8D%E5%BA%94%E5%A6%82%E4%BD%95%E3%80%82&resume%5Bpractices%5D%5B2%5D%5Btime%5D=%E5%A1%AB%E5%86%99%E6%97%B6%E9%97%B4&resume%5Bpractices%5D%5B2%5D%5Bcompany%5D=%E5%A1%AB%E5%86%99%E5%85%AC%E5%8F%B8%E5%90%8D&resume%5Bpractices%5D%5B2%5D%5Bdescription%5D=%E5%A1%AB%E5%86%99%E8%AF%A6%E7%BB%86%E5%86%85%E5%AE%B9&resume%5Bprojects%5D%5B0%5D%5Btime%5D=2017.02&resume%5Bprojects%5D%5B0%5D%5Bart%5D=%E5%A1%AB%E5%86%99%E9%A1%B9%E7%9B%AE%E5%90%8D%E7%A7%B0&resume%5Bprojects%5D%5B0%5D%5Bdescription%5D=%E6%88%91%E5%9C%A8%E8%AF%A5%E9%A1%B9%E7%9B%AE%E8%B4%9F%E8%B4%A3%E4%BA%86%E5%93%AA%E4%BA%9B%E5%B7%A5%E4%BD%9C%EF%BC%8C%E5%88%86%E5%88%AB%E5%9C%A8%E5%93%AA%E4%BA%9B%E5%9C%B0%E6%96%B9%E5%81%9A%E5%BE%97%E5%87%BA%E8%89%B2%2F%E5%92%8C%E5%88%AB%E4%BA%BA%E4%B8%8D%E4%B8%80%E6%A0%B7%2F%E6%88%90%E9%95%BF%E5%BF%AB%EF%BC%8C%E8%BF%99%E4%B8%AA%E9%A1%B9%E7%9B%AE%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E5%9B%B0%E9%9A%BE%E7%9A%84%E9%97%AE%E9%A2%98%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E6%88%91%E9%87%87%E5%8F%96%E4%BA%86%E4%BB%80%E4%B9%88%E6%8E%AA%E6%96%BD%EF%BC%8C%E6%9C%80%E5%90%8E%E7%BB%93%E6%9E%9C%E5%A6%82%E4%BD%95%E3%80%82%E8%BF%99%E4%B8%AA%E9%A1%B9%E7%9B%AE%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E8%87%AA%E8%B1%AA%E7%9A%84%E6%8A%80%E6%9C%AF%E7%BB%86%E8%8A%82%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E4%B8%BA%E4%BB%80%E4%B9%88%EF%BC%8C%E5%AE%9E%E6%96%BD%E5%89%8D%E5%92%8C%E5%AE%9E%E6%96%BD%E5%90%8E%E7%9A%84%E6%95%B0%E6%8D%AE%E5%AF%B9%E6%AF%94%E5%A6%82%E4%BD%95%EF%BC%8C%E5%90%8C%E4%BA%8B%E5%92%8C%E9%A2%86%E5%AF%BC%E5%AF%B9%E6%AD%A4%E7%9A%84%E5%8F%8D%E5%BA%94%E5%A6%82%E4%BD%95%E3%80%82&resume%5Bprojects%5D%5B0%5D%5Blink%5D=https%3A%2F%2Fwww.github.com&resume%5Bprojects%5D%5B1%5D%5Btime%5D=2016.12&resume%5Bprojects%5D%5B1%5D%5Bart%5D=%E5%A1%AB%E5%86%99%E9%A1%B9%E7%9B%AE%E5%90%8D%E7%A7%B0&resume%5Bprojects%5D%5B1%5D%5Bdescription%5D=%E6%88%91%E5%9C%A8%E8%AF%A5%E9%A1%B9%E7%9B%AE%E8%B4%9F%E8%B4%A3%E4%BA%86%E5%93%AA%E4%BA%9B%E5%B7%A5%E4%BD%9C%EF%BC%8C%E5%88%86%E5%88%AB%E5%9C%A8%E5%93%AA%E4%BA%9B%E5%9C%B0%E6%96%B9%E5%81%9A%E5%BE%97%E5%87%BA%E8%89%B2%2F%E5%92%8C%E5%88%AB%E4%BA%BA%E4%B8%8D%E4%B8%80%E6%A0%B7%2F%E6%88%90%E9%95%BF%E5%BF%AB%EF%BC%8C%E8%BF%99%E4%B8%AA%E9%A1%B9%E7%9B%AE%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E5%9B%B0%E9%9A%BE%E7%9A%84%E9%97%AE%E9%A2%98%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E6%88%91%E9%87%87%E5%8F%96%E4%BA%86%E4%BB%80%E4%B9%88%E6%8E%AA%E6%96%BD%EF%BC%8C%E6%9C%80%E5%90%8E%E7%BB%93%E6%9E%9C%E5%A6%82%E4%BD%95%E3%80%82%E8%BF%99%E4%B8%AA%E9%A1%B9%E7%9B%AE%E4%B8%AD%EF%BC%8C%E6%88%91%E6%9C%80%E8%87%AA%E8%B1%AA%E7%9A%84%E6%8A%80%E6%9C%AF%E7%BB%86%E8%8A%82%E6%98%AF%E4%BB%80%E4%B9%88%EF%BC%8C%E4%B8%BA%E4%BB%80%E4%B9%88%EF%BC%8C%E5%AE%9E%E6%96%BD%E5%89%8D%E5%92%8C%E5%AE%9E%E6%96%BD%E5%90%8E%E7%9A%84%E6%95%B0%E6%8D%AE%E5%AF%B9%E6%AF%94%E5%A6%82%E4%BD%95%EF%BC%8C%E5%90%8C%E4%BA%8B%E5%92%8C%E9%A2%86%E5%AF%BC%E5%AF%B9%E6%AD%A4%E7%9A%84%E5%8F%8D%E5%BA%94%E5%A6%82%E4%BD%95%E3%80%82&resume%5Bprojects%5D%5B1%5D%5Blink%5D=https%3A%2F%2Fwww.github.com&resume%5Bprojects%5D%5B2%5D%5Btime%5D=%E5%A1%AB%E5%86%99%E6%97%B6%E9%97%B4&resume%5Bprojects%5D%5B2%5D%5Bart%5D=%E5%A1%AB%E5%86%99%E9%A1%B9%E7%9B%AE%E5%90%8D%E7%A7%B0&resume%5Bprojects%5D%5B2%5D%5Bdescription%5D=%E5%A1%AB%E5%86%99%E8%AF%A6%E7%BB%86%E5%86%85%E5%AE%B9&resume%5Bskills%5D%5B0%5D=%E7%86%9F%E6%82%89%E4%BD%BF%E7%94%A8HTML5%E3%80%81CSS3%E3%80%81Sass%EF%BC%8C%E8%83%BD%E5%87%86%E7%A1%AE%E8%BF%98%E5%8E%9F%E8%AE%BE%E8%AE%A1%E7%A8%BF%E3%80%82&resume%5Bskills%5D%5B1%5D=%E4%BC%9A%E7%82%B9%E8%AE%BE%E8%AE%A1%EF%BC%8C%E6%9C%89%E7%82%B9%E5%AE%A1%E7%BE%8E%E8%83%BD%E5%8A%9B%EF%BC%8C%E9%87%8D%E8%A7%86%E7%94%A8%E6%88%B7%E4%BD%93%E9%AA%8C&resume%5Bskills%5D%5B2%5D=%E4%BA%86%E8%A7%A3+MVVM%E6%A1%86%E6%9E%B6+Vue%E3%80%81%E5%BE%AE%E4%BF%A1%E5%B0%8F%E7%A8%8B%E5%BA%8F&resume%5Bskills%5D%5B3%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bskills%5D%5B4%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bprizes%5D%5B0%5D%5Btime%5D=2013-2017&resume%5Bprizes%5D%5B0%5D%5Bdescription%5D=xx%E5%A4%A7%E5%AD%A6%E4%B8%93%E4%B8%9A%E4%BA%8C%E7%AD%89%E5%A5%96%E5%AD%A6%E9%87%91%C2%B7%E5%A4%9A%E6%AC%A1%E8%8E%B7%E5%BE%97&resume%5Bprizes%5D%5B1%5D%5Btime%5D=2015.05&resume%5Bprizes%5D%5B1%5D%5Bdescription%5D=xx%E5%A4%A7%E5%AD%A6%E9%A6%96%E5%B1%8A%E6%95%B0%E5%AD%A6%E5%BB%BA%E6%A8%A1%E5%A4%A7%E8%B5%9B%C2%B7%E4%BA%8C%E7%AD%89%E5%A5%96&resume%5Bprizes%5D%5B2%5D%5Btime%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bprizes%5D%5B2%5D%5Bdescription%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bprizes%5D%5B3%5D%5Btime%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91&resume%5Bprizes%5D%5B3%5D%5Bdescription%5D=%E7%82%B9%E5%87%BB%E7%BC%96%E8%BE%91', NULL);
INSERT INTO `resume_save` VALUES (4, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (5, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (6, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (7, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (8, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (9, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (10, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (11, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (12, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (13, 1, 'default', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', NULL);
INSERT INTO `resume_save` VALUES (14, 1, '啊大苏打', '{\"imgUrl\":\"https://i.loli.net/2018/05/27/5b0a6c40ae11c.jpg\",\"skinColor\":\"\",\"name\":\"姓名\",\"job\":\"应聘前端开发工程师\",\"infos\":[\"男 / 24岁\",\"xx大学\",\"xx专业\",\"点击编辑\",\"点击编辑\"],\"contacts\":[{\"icon\":\"icon-homepage\",\"link\":\"***\"},{\"icon\":\"icon-github\",\"link\":\"***\"},{\"icon\":\"icon-email\",\"link\":\"2015081a@sina.com\"},{\"icon\":\"icon-phone\",\"link\":\"点击填写电话\"},{\"icon\":\"icon-link\",\"link\":\"点击填写社交账号\"}],\"titles\":[\"实践经历\",\"项目经验\",\"专业技能\",\"点击编辑\"],\"practices\":[{\"time\":\"2015.07 ~ 2016.10\",\"company\":\"ABC网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"2016.11 ~ 2017.10\",\"company\":\"DEF网络有限公司\",\"description\":\"我在该公司负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，工作中，我最困难的问题是什么，我采取了什么措施，最后结果如何。工作中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\"},{\"time\":\"填写时间\",\"company\":\"填写公司名\",\"description\":\"填写详细内容\"}],\"projects\":[{\"time\":\"2017.02\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"2016.12\",\"art\":\"填写项目名称\",\"description\":\"我在该项目负责了哪些工作，分别在哪些地方做得出色/和别人不一样/成长快，这个项目中，我最困难的问题是什么，我采取了什么措施，最后结果如何。这个项目中，我最自豪的技术细节是什么，为什么，实施前和实施后的数据对比如何，同事和领导对此的反应如何。\",\"link\":\"https://www.github.com\"},{\"time\":\"填写时间\",\"art\":\"填写项目名称\",\"description\":\"填写详细内容\"}],\"skills\":[\"熟悉使用HTML5、CSS3、Sass，能准确还原设计稿。\",\"会点设计，有点审美能力，重视用户体验\",\"了解 MVVM框架 Vue、微信小程序\",\"点击编辑\",\"点击编辑\"],\"prizes\":[{\"time\":\"2013-2017\",\"description\":\"xx大学专业二等奖学金·多次获得\"},{\"time\":\"2015.05\",\"description\":\"xx大学首届数学建模大赛·二等奖\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"},{\"time\":\"点击编辑\",\"description\":\"点击编辑\"}]}', 'default');

-- ----------------------------
-- Table structure for resumes
-- ----------------------------
DROP TABLE IF EXISTS `resumes`;
CREATE TABLE `resumes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `skin_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resumes
-- ----------------------------

-- ----------------------------
-- Table structure for skillbars
-- ----------------------------
DROP TABLE IF EXISTS `skillbars`;
CREATE TABLE `skillbars`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flex` int NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `skillbars_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skillbars
-- ----------------------------

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `skill_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sort_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resume_id`(`resume_id` ASC) USING BTREE,
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skills
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户角色，如admin, manager, staff',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user01', '$2a$10$LRR1kQQeixDy4upnYXGy..e2Y9RiRb1St.QLvsqA/EXwwMfFYv31K', NULL, NULL, NULL, NULL, 'admin', '2025-04-15 14:55:05', '2025-04-15 14:55:05');

SET FOREIGN_KEY_CHECKS = 1;
