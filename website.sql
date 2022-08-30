/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : website

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 30/08/2022 19:29:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES (1, 'admin', 'admin', '$6$rounds=656000$5vSgOB8ppqMZgl/N$qI0Dqc/l3Bnk8r4GAPtW5WuaqkO6jkHJmADevUdIFmWyY6ASNQWcyq/ljFGZYcfH2vY92DMASfVBgAwdOSW/A1', '2022-08-27 01:45:40');

SET FOREIGN_KEY_CHECKS = 1;
