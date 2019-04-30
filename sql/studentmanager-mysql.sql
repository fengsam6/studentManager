/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50558
Source Host           : 127.0.0.1:3306
Source Database       : studentmanager

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2019-02-21 17:39:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT '',
  `comment` varchar(50) DEFAULT '',
  `create_time` varchar(60) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES ('1', '1501', '不错', '2019-02-21 15:56:39');
INSERT INTO `tb_class` VALUES ('2', '1502', '不错', '2019年02月21日 04:45:25');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '普通用户');
INSERT INTO `tb_role` VALUES ('2', '教学秘书');
INSERT INTO `tb_role` VALUES ('3', '管理员');
INSERT INTO `tb_role` VALUES ('4', '超级管理员');

-- ----------------------------
-- Table structure for tb_school
-- ----------------------------
DROP TABLE IF EXISTS `tb_school`;
CREATE TABLE `tb_school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_school
-- ----------------------------
INSERT INTO `tb_school` VALUES ('1', '湖北师范大学', '黄石');
INSERT INTO `tb_school` VALUES ('2', '21312', '武汉        ');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(35) NOT NULL DEFAULT '',
  `student_num` varchar(30) NOT NULL DEFAULT '0',
  `gender` tinyint(4) NOT NULL DEFAULT '1',
  `major` varchar(35) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `enter_school_time` varchar(40) NOT NULL DEFAULT '',
  `phone` varchar(35) NOT NULL DEFAULT '',
  `aver_path` varchar(40) NOT NULL DEFAULT '',
  `class_id` int(30) NOT NULL DEFAULT '0',
  `school_id` int(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('1', '', '11', '1', '计算机', '', '', '', '', '1', '1');
INSERT INTO `tb_student` VALUES ('2', '4563', '23123', '1', '6456', '18327853685@qq.com', '2019-02-21 16:01:59', '3123', '', '1', '1');
INSERT INTO `tb_student` VALUES ('3', '问题问题我', '23123', '1', '6456', '18327853685@qq.com', '2019-02-21 16:01:59', '3123', '', '1', '1');
INSERT INTO `tb_student` VALUES ('4', '4563', '23123', '1', '6456', '18327853685@qq.com', '2019-02-21 16:01:59', '3123', '', '1', '1');
INSERT INTO `tb_student` VALUES ('5', '4563', '23123', '1', '6456', '18327853685@qq.com', '2019-02-21 16:01:59', '3123', '', '1', '1');

-- ----------------------------
-- Table structure for tb_systemlog
-- ----------------------------
DROP TABLE IF EXISTS `tb_systemlog`;
CREATE TABLE `tb_systemlog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `operation` varchar(120) NOT NULL DEFAULT '',
  `method` varchar(100) NOT NULL DEFAULT '',
  `params` varchar(250) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `time` varchar(100) NOT NULL DEFAULT '',
  `create_date` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_systemlog
-- ----------------------------
INSERT INTO `tb_systemlog` VALUES ('1', 'admin', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"admin\",\"password\":\"123456\"}', '127.0.0.1', '82', '2019年02月21日 03:56:00');
INSERT INTO `tb_systemlog` VALUES ('2', 'admin', '添加学校', 'cn.feng.controller.SchoolController.add()', '{\"schoolId\":2,\"schoolName\":\"21312\",\"address\":\"武汉        \"}', '127.0.0.1', '76', '2019年02月21日 04:01:41');
INSERT INTO `tb_systemlog` VALUES ('3', 'admin', '添加学生', 'cn.feng.controller.StudentController.add()', '{\"id\":5,\"studentName\":\"4563\",\"studentNum\":\"23123\",\"gender\":1,\"major\":\"6456\",\"email\":\"18327853685@qq.com\",\"enterSchoolTime\":\"2019-02-21 16:01:59\",\"phone\":\"3123\",\"classId\":1,\"schoolId\":1}', '127.0.0.1', '77', '2019年02月21日 04:12:08');
INSERT INTO `tb_systemlog` VALUES ('4', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":1,\"username\":\"admin\",\"password\":\"123456\",\"roleId\":4}', '127.0.0.1', '76', '2019年02月21日 04:12:27');
INSERT INTO `tb_systemlog` VALUES ('5', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":1,\"username\":\"admin\",\"password\":\"123456\",\"roleId\":4}', '127.0.0.1', '111', '2019年02月21日 04:12:27');
INSERT INTO `tb_systemlog` VALUES ('6', 'admin', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"admin\",\"password\":\"123456\"}', '127.0.0.1', '154', '2019年02月21日 04:13:32');
INSERT INTO `tb_systemlog` VALUES ('7', 'admin', '更新学生', 'cn.feng.controller.StudentController.update()', '{\"id\":3,\"studentName\":\"问题问题我\",\"studentNum\":\"23123\",\"gender\":1,\"major\":\"6456\",\"email\":\"18327853685@qq.com\",\"enterSchoolTime\":\"2019-02-21 16:01:59\",\"phone\":\"3123\",\"classId\":1,\"schoolId\":1}', '127.0.0.1', '71', '2019年02月21日 04:31:00');
INSERT INTO `tb_systemlog` VALUES ('8', 'admin', '添加用户', 'cn.feng.controller.UserController.add()', '{\"id\":2,\"username\":\"admin2\",\"password\":\"11\",\"roleId\":1,\"createTime\":\"2019年02月21日 04:35:41\"}', '127.0.0.1', '89', '2019年02月21日 04:35:41');
INSERT INTO `tb_systemlog` VALUES ('9', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":1,\"username\":\"admin\",\"password\":\"123456\",\"roleId\":4}', '127.0.0.1', '53', '2019年02月21日 04:36:48');
INSERT INTO `tb_systemlog` VALUES ('10', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":1,\"username\":\"admin\",\"password\":\"123456\",\"roleId\":4}', '127.0.0.1', '34', '2019年02月21日 04:36:48');
INSERT INTO `tb_systemlog` VALUES ('11', 'admin', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"admin\",\"password\":\"123456\"}', '127.0.0.1', '86', '2019年02月21日 04:37:00');
INSERT INTO `tb_systemlog` VALUES ('12', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":2,\"username\":\"admin2\",\"password\":\"11\",\"roleId\":1}', '127.0.0.1', '110', '2019年02月21日 04:41:21');
INSERT INTO `tb_systemlog` VALUES ('13', 'admin', '添加班级', 'cn.feng.controller.ClassController.add()', '{\"Id\":2,\"className\":\"1502\",\"comment\":\"不错\",\"createTime\":\"2019年02月21日 04:45:25\"}', '127.0.0.1', '57', '2019年02月21日 04:45:25');
INSERT INTO `tb_systemlog` VALUES ('14', 'admin', '更新班级', 'cn.feng.controller.ClassController.update()', '{\"Id\":1,\"className\":\"1501\",\"comment\":\"不错\"}', '127.0.0.1', '61', '2019年02月21日 04:45:33');
INSERT INTO `tb_systemlog` VALUES ('15', 'admin', '更新学校', 'cn.feng.controller.SchoolController.update()', '{\"schoolId\":1,\"schoolName\":\"湖北师范大学\",\"address\":\"黄石\"}', '127.0.0.1', '60', '2019年02月21日 04:46:21');
INSERT INTO `tb_systemlog` VALUES ('16', 'admin', '添加用户', 'cn.feng.controller.UserController.add()', '{\"id\":3,\"username\":\"test\",\"password\":\"123456\",\"roleId\":1,\"createTime\":\"2019年02月21日 04:46:43\"}', '127.0.0.1', '61', '2019年02月21日 04:46:43');
INSERT INTO `tb_systemlog` VALUES ('17', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":2,\"username\":\"admin2\",\"password\":\"11\",\"roleId\":2}', '127.0.0.1', '48', '2019年02月21日 04:46:52');
INSERT INTO `tb_systemlog` VALUES ('18', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":3,\"username\":\"test\",\"password\":\"123456\",\"roleId\":3}', '127.0.0.1', '86', '2019年02月21日 04:47:24');
INSERT INTO `tb_systemlog` VALUES ('19', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":2,\"username\":\"admin2\",\"password\":\"11\",\"roleId\":2}', '127.0.0.1', '93', '2019年02月21日 04:48:10');
INSERT INTO `tb_systemlog` VALUES ('20', 'test', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"test\",\"password\":\"123456\"}', '127.0.0.1', '97', '2019年02月21日 05:17:20');
INSERT INTO `tb_systemlog` VALUES ('21', 'test', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":3,\"username\":\"test\",\"password\":\"123456\",\"roleId\":1}', '127.0.0.1', '79', '2019年02月21日 05:17:36');
INSERT INTO `tb_systemlog` VALUES ('22', 'test', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"test\",\"password\":\"123456\"}', '127.0.0.1', '88', '2019年02月21日 05:17:54');
INSERT INTO `tb_systemlog` VALUES ('23', 'admin', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"admin\",\"password\":\"123456\"}', '127.0.0.1', '972', '2019年02月21日 05:20:40');
INSERT INTO `tb_systemlog` VALUES ('24', 'admin', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"admin\",\"password\":\"123456\"}', '127.0.0.1', '290', '2019年02月21日 05:22:05');
INSERT INTO `tb_systemlog` VALUES ('25', 'admin', '用户登录', 'cn.feng.controller.UserController.login()', '{\"username\":\"admin\",\"password\":\"123456\"}', '127.0.0.1', '1155', '2019年02月21日 05:24:03');
INSERT INTO `tb_systemlog` VALUES ('26', 'admin', '更新用户', 'cn.feng.controller.UserController.update()', '{\"id\":2,\"username\":\"admin2\",\"password\":\"1146464\",\"roleId\":2}', '127.0.0.1', '61', '2019年02月21日 05:25:12');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(35) NOT NULL DEFAULT '',
  `num` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT '',
  `role_id` int(30) DEFAULT NULL,
  `create_time` varchar(50) NOT NULL DEFAULT '',
  `last_login_time` varchar(50) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', '2', '123456', '4', '0000-00-00 00:00:00', '2019年02月 05:24:02');
INSERT INTO `tb_user` VALUES ('2', 'admin2', '', '1146464', '2', '2019年02月21日 04:35:41', '');
INSERT INTO `tb_user` VALUES ('3', 'test', '', '123456', '1', '2019年02月21日 04:46:43', '2019年02月 05:17:54');

-- ----------------------------
-- View structure for view_studentInfo
-- ----------------------------
DROP VIEW IF EXISTS `view_studentInfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_studentinfo` AS select `s`.`Id` AS `Id`,`s`.`student_name` AS `student_name`,`s`.`student_num` AS `student_num`,`s`.`gender` AS `gender`,`s`.`major` AS `major`,`s`.`email` AS `email`,`s`.`enter_school_time` AS `enter_school_time`,`s`.`phone` AS `phone`,`s`.`aver_path` AS `aver_path`,`s`.`class_id` AS `class_id`,`s`.`school_id` AS `school_id`,`c`.`class_name` AS `class_name`,`sc`.`school_name` AS `school_name` from ((`tb_student` `s` join `tb_class` `c` on((`s`.`class_id` = `c`.`Id`))) join `tb_school` `sc` on((`s`.`school_id` = `sc`.`school_id`))) ;

-- ----------------------------
-- View structure for view_userInfo
-- ----------------------------
DROP VIEW IF EXISTS `view_userInfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_userinfo` AS select `u`.`Id` AS `Id`,`u`.`username` AS `username`,`u`.`num` AS `num`,`u`.`password` AS `password`,`u`.`role_id` AS `role_id`,`u`.`create_time` AS `create_time`,`u`.`last_login_time` AS `last_login_time`,`r`.`role_name` AS `role_name` from (`tb_user` `u` join `tb_role` `r` on((`u`.`role_id` = `r`.`id`))) ;
