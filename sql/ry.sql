/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50633
Source Host           : localhost:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2019-01-03 10:10:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT '' COMMENT '通道名称',
  `channel_code` varchar(20) DEFAULT '',
  `show_file` varchar(500) DEFAULT '' COMMENT '显示内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_key` (`channel_code`) COMMENT '编码唯一'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='通道表';

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES ('1', '一号通道', '1', '');
INSERT INTO `channel` VALUES ('2', '二号通道', '2', '');
INSERT INTO `channel` VALUES ('3', '三号通道', '3', '');

-- ----------------------------
-- Table structure for plays_order
-- ----------------------------
DROP TABLE IF EXISTS `plays_order`;
CREATE TABLE `plays_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(10) NOT NULL DEFAULT '0' COMMENT 'channelid',
  `file_name` varchar(50) DEFAULT '',
  `types` int(20) DEFAULT '0' COMMENT '0 图片 1 视频 2 文字',
  `suffix` varchar(50) DEFAULT '' COMMENT '后缀',
  `file_id` bigint(11) DEFAULT '0' COMMENT '文件ID',
  `ur` varchar(50) DEFAULT '',
  `content` varchar(5000) DEFAULT '',
  `order_by` int(11) DEFAULT '0' COMMENT '播放顺序',
  `remark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='播放顺序表';

-- ----------------------------
-- Records of plays_order
-- ----------------------------
INSERT INTO `plays_order` VALUES ('17', '1', '图片1', '0', 'jpg', '0', 'D:/profile/图片1.jpg', '', '1', '');
INSERT INTO `plays_order` VALUES ('18', '1', '视频', '1', 'mp4', '0', 'D:/profile/视频.mp4', '&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题<div>&nbsp; &nbsp; &nbsp;内容<span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span><span style=\"color: inherit;\">内容</span></div>', '2', '');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-6AE14EF1546479626524', '1546481433303', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1544154420000', '-1', '5', 'PAUSED', 'CRON', '1544154418000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1544154420000', '-1', '5', 'PAUSED', 'CRON', '1544154418000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2018-12-12 16:57:29', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '55', '', '66', 'N', 'admin', '2018-12-17 16:06:01', '', null, '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '机场集团', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '空港机电信息', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-12-12 16:53:21');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '实业公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-12-12 16:54:44');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '图片', '0', 'sys_file_type', '', 'danger', 'N', '0', 'admin', '2018-12-20 10:26:53', 'admin', '2018-12-20 10:26:58', '图片');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '视频', '1', 'sys_file_type', '', 'primary', 'N', '0', 'admin', '2018-12-20 10:26:53', 'admin', '2018-12-20 10:26:58', '视频');
INSERT INTO `sys_dict_data` VALUES ('29', '3', '文字', '2', 'sys_file_type', '', 'info', 'N', '0', 'admin', '2018-12-20 10:26:53', 'admin', '2018-12-20 10:26:58', '文字');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('10', '文件状态', 'sys_file_type', '0', 'admin', '2018-12-20 10:25:56', 'admin', '2018-12-20 10:26:01', '文件类型表');

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT '',
  `status` char(1) DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(5000) DEFAULT '' COMMENT '文字内容',
  `suffix` varchar(20) DEFAULT '' COMMENT '后缀',
  `type` varchar(10) NOT NULL DEFAULT '0' COMMENT '类型（0代表图片 1代表视频）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by_name` varchar(50) DEFAULT '' COMMENT '创建人姓名',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by_name` varchar(50) DEFAULT '' COMMENT '修改人名称',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unique_key` (`file_name`) COMMENT '文件名称唯一'
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO `sys_files` VALUES ('70', '', '0', '我是文字', '', '<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容<span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容</span><span style=\"color: inherit;\">我是内容。</span></div>', '', '2', '0', '管理员', 'admin', '2019-01-03 09:58:59', '', '', null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-07 11:49:05');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-12 16:43:56');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2018-12-12 16:44:41');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2018-12-12 16:44:52');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2018-12-12 16:45:08');
INSERT INTO `sys_logininfor` VALUES ('105', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-12 16:45:19');
INSERT INTO `sys_logininfor` VALUES ('106', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-12 16:45:23');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-12 16:47:00');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-12 17:01:51');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-12 17:02:47');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 08:45:23');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 09:32:39');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 09:52:34');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-13 09:52:49');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 09:52:52');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 10:15:35');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 10:33:27');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 10:51:48');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 10:57:58');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 10:59:57');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 11:03:06');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 11:05:59');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 11:09:20');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-13 11:14:48');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 09:49:24');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 11:28:11');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 11:34:33');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 11:43:58');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 11:46:00');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 14:54:01');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 15:12:59');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 15:49:13');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 15:54:21');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 15:58:12');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:01:06');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:08:38');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:10:09');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-17 16:15:53');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:15:55');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:41:35');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:44:51');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-17 16:46:44');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:46:46');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 16:47:35');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 17:50:38');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 14:20:54');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 14:39:00');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 14:49:08');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:16:13');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:23:31');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:27:39');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:29:59');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:33:20');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:48:02');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:50:49');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 15:56:20');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 16:00:16');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 16:29:15');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 09:23:52');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 09:31:47');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-20 09:40:19');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-20 09:40:21');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 09:40:23');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 09:46:04');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 09:59:08');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:06:43');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:15:37');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:29:47');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-20 10:52:15');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2018-12-20 10:52:19');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:52:24');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:56:12');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-20 11:28:53');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 11:29:02');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 14:10:42');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 14:33:40');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 14:37:12');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 14:49:41');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 16:25:01');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 16:29:39');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 16:31:23');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 16:37:18');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 16:52:36');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 17:01:28');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 17:14:23');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 17:24:41');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 08:47:09');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 08:49:42');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 09:34:04');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '115.195.89.232', '浙江 杭州', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-21 09:48:00');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '115.195.89.232', '浙江 杭州', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 09:48:17');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-21 09:57:59');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 09:58:05');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 10:39:43');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 10:54:10');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:13:05');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-21 11:14:36');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:14:39');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:17:40');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:26:21');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-21 11:30:27');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:30:32');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:36:22');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:06:36');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:29:47');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:33:17');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:37:16');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:42:25');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:43:32');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-21 15:11:37');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:11:47');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:12:08');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:13:12');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:15:49');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:38:13');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:38:35');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '111.47.23.89', '湖北 武汉', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-21 15:44:36');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '111.47.23.89', '湖北 武汉', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:44:43');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '115.195.89.232', '浙江 杭州', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 16:00:18');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '115.195.89.232', '浙江 杭州', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-21 16:00:44');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-21 16:23:54');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 16:23:59');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 16:26:09');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 16:27:56');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 16:34:56');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 08:34:35');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 08:39:56');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 09:19:49');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 09:35:35');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 09:43:48');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:05:25');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:20:52');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:24:08');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:24:28');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:26:22');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 14:08:53');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 15:52:57');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 16:03:08');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 09:33:55');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 12:41:25');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 14:12:39');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 14:18:20');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 14:20:11');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 14:22:12');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 16:48:15');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-25 16:52:23');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 16:52:25');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '115.195.86.76', '浙江 杭州', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-25 17:39:44');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '115.195.86.76', '浙江 杭州', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-25 17:39:47');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '115.195.86.76', '浙江 杭州', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-25 17:40:08');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 08:41:05');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 09:16:12');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 09:32:04');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 09:46:15');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 09:52:30');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 10:26:31');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 10:47:15');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 11:07:17');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 11:12:51');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 11:19:55');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 11:32:11');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 14:07:43');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2018-12-26 14:07:48');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2018-12-26 14:07:50');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2018-12-26 14:07:54');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 14:08:00');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 15:23:03');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 15:23:08');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 16:02:49');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:02:52');
INSERT INTO `sys_logininfor` VALUES ('270', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 16:19:01');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:19:06');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:19:11');
INSERT INTO `sys_logininfor` VALUES ('273', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:19:46');
INSERT INTO `sys_logininfor` VALUES ('274', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 16:23:51');
INSERT INTO `sys_logininfor` VALUES ('275', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:23:54');
INSERT INTO `sys_logininfor` VALUES ('276', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 16:27:47');
INSERT INTO `sys_logininfor` VALUES ('277', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:27:50');
INSERT INTO `sys_logininfor` VALUES ('278', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:29:26');
INSERT INTO `sys_logininfor` VALUES ('279', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-26 16:36:24');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:36:27');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:37:00');
INSERT INTO `sys_logininfor` VALUES ('282', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:37:53');
INSERT INTO `sys_logininfor` VALUES ('283', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-26 16:39:22');
INSERT INTO `sys_logininfor` VALUES ('284', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 08:31:44');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 08:43:12');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-27 08:45:40');
INSERT INTO `sys_logininfor` VALUES ('287', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 08:45:43');
INSERT INTO `sys_logininfor` VALUES ('288', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 08:51:38');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-27 08:57:20');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 08:57:24');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 08:58:58');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:06:16');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-27 10:10:40');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:18:16');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-27 10:18:26');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:18:29');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:33:51');
INSERT INTO `sys_logininfor` VALUES ('298', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:39:00');
INSERT INTO `sys_logininfor` VALUES ('299', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:41:22');
INSERT INTO `sys_logininfor` VALUES ('300', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 10:44:00');
INSERT INTO `sys_logininfor` VALUES ('301', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 11:32:46');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 14:03:09');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-27 15:01:09');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 15:08:10');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 15:24:11');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 16:12:04');
INSERT INTO `sys_logininfor` VALUES ('307', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 16:21:56');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 08:50:45');
INSERT INTO `sys_logininfor` VALUES ('309', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 09:10:08');
INSERT INTO `sys_logininfor` VALUES ('310', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 09:19:08');
INSERT INTO `sys_logininfor` VALUES ('311', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 09:23:01');
INSERT INTO `sys_logininfor` VALUES ('312', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 09:25:31');
INSERT INTO `sys_logininfor` VALUES ('313', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 10:00:11');
INSERT INTO `sys_logininfor` VALUES ('314', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:09:30');
INSERT INTO `sys_logininfor` VALUES ('315', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:10:29');
INSERT INTO `sys_logininfor` VALUES ('316', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:14:54');
INSERT INTO `sys_logininfor` VALUES ('317', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:16:26');
INSERT INTO `sys_logininfor` VALUES ('318', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:20:41');
INSERT INTO `sys_logininfor` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:32:01');
INSERT INTO `sys_logininfor` VALUES ('320', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:33:25');
INSERT INTO `sys_logininfor` VALUES ('321', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:34:39');
INSERT INTO `sys_logininfor` VALUES ('322', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:36:11');
INSERT INTO `sys_logininfor` VALUES ('323', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:50:25');
INSERT INTO `sys_logininfor` VALUES ('324', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:51:54');
INSERT INTO `sys_logininfor` VALUES ('325', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 12:00:04');
INSERT INTO `sys_logininfor` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:04:58');
INSERT INTO `sys_logininfor` VALUES ('327', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:20:50');
INSERT INTO `sys_logininfor` VALUES ('328', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:28:20');
INSERT INTO `sys_logininfor` VALUES ('329', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:40:12');
INSERT INTO `sys_logininfor` VALUES ('330', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:46:35');
INSERT INTO `sys_logininfor` VALUES ('331', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:48:59');
INSERT INTO `sys_logininfor` VALUES ('332', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 14:53:24');
INSERT INTO `sys_logininfor` VALUES ('333', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 15:16:17');
INSERT INTO `sys_logininfor` VALUES ('334', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 15:27:14');
INSERT INTO `sys_logininfor` VALUES ('335', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 15:33:08');
INSERT INTO `sys_logininfor` VALUES ('336', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 08:38:11');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 08:53:10');
INSERT INTO `sys_logininfor` VALUES ('338', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:07:33');
INSERT INTO `sys_logininfor` VALUES ('339', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-29 09:07:34');
INSERT INTO `sys_logininfor` VALUES ('340', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:07:35');
INSERT INTO `sys_logininfor` VALUES ('341', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:09:24');
INSERT INTO `sys_logininfor` VALUES ('342', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:16:39');
INSERT INTO `sys_logininfor` VALUES ('343', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:18:31');
INSERT INTO `sys_logininfor` VALUES ('344', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:28:05');
INSERT INTO `sys_logininfor` VALUES ('345', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:29:43');
INSERT INTO `sys_logininfor` VALUES ('346', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:31:55');
INSERT INTO `sys_logininfor` VALUES ('347', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:35:00');
INSERT INTO `sys_logininfor` VALUES ('348', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 09:42:03');
INSERT INTO `sys_logininfor` VALUES ('349', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 11:47:01');
INSERT INTO `sys_logininfor` VALUES ('350', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-29 14:27:41');
INSERT INTO `sys_logininfor` VALUES ('351', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 09:48:33');
INSERT INTO `sys_logininfor` VALUES ('352', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 09:59:44');
INSERT INTO `sys_logininfor` VALUES ('353', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 10:31:10');
INSERT INTO `sys_logininfor` VALUES ('354', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 11:10:00');
INSERT INTO `sys_logininfor` VALUES ('355', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 11:28:52');
INSERT INTO `sys_logininfor` VALUES ('356', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 11:52:22');
INSERT INTO `sys_logininfor` VALUES ('357', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 14:32:42');
INSERT INTO `sys_logininfor` VALUES ('358', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 14:40:33');
INSERT INTO `sys_logininfor` VALUES ('359', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 14:57:58');
INSERT INTO `sys_logininfor` VALUES ('360', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 15:22:38');
INSERT INTO `sys_logininfor` VALUES ('361', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 16:18:32');
INSERT INTO `sys_logininfor` VALUES ('362', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-02 16:23:05');
INSERT INTO `sys_logininfor` VALUES ('363', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 08:40:15');
INSERT INTO `sys_logininfor` VALUES ('364', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 08:56:59');
INSERT INTO `sys_logininfor` VALUES ('365', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-01-03 09:09:10');
INSERT INTO `sys_logininfor` VALUES ('366', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:39:27');
INSERT INTO `sys_logininfor` VALUES ('367', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:39:30');
INSERT INTO `sys_logininfor` VALUES ('368', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:39:47');
INSERT INTO `sys_logininfor` VALUES ('369', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:39:52');
INSERT INTO `sys_logininfor` VALUES ('370', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:39:53');
INSERT INTO `sys_logininfor` VALUES ('371', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:39:56');
INSERT INTO `sys_logininfor` VALUES ('372', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:40:38');
INSERT INTO `sys_logininfor` VALUES ('373', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-01-03 09:48:26');
INSERT INTO `sys_logininfor` VALUES ('374', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 09:49:03');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '重置密码', '100', '6', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '文件管理', '0', '1', '#', 'M', '0', '', 'fa fa-edit', 'admin', '2018-12-12 16:58:18', 'admin', '2018-12-13 08:49:19', '');
INSERT INTO `sys_menu` VALUES ('1058', '文件上传', '1057', '1', '/file', 'C', '0', 'file:view', '#', 'admin', '2018-12-13 09:51:05', 'admin', '2018-12-13 11:03:50', '');
INSERT INTO `sys_menu` VALUES ('1059', '上传', '1058', '2', '#', 'F', '0', 'file:upload', '#', 'admin', '2018-12-13 10:41:55', 'admin', '2018-12-13 11:04:47', '');
INSERT INTO `sys_menu` VALUES ('1060', '修改', '1058', '25', '#', 'F', '0', 'file:update', '#', 'admin', '2018-12-13 10:42:19', 'admin', '2018-12-13 11:04:59', '');
INSERT INTO `sys_menu` VALUES ('1061', '删除', '1058', '3', '#', 'F', '0', 'file:remove', '#', 'admin', '2018-12-13 10:42:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1062', '导出', '1058', '4', '#', 'F', '0', 'file:export', '#', 'admin', '2018-12-13 10:47:56', 'admin', '2018-12-13 11:01:41', '');
INSERT INTO `sys_menu` VALUES ('1063', '查询', '1058', '1', '/file', 'F', '0', 'file:list', '#', 'admin', '2018-12-13 11:04:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('1066', '通道设置', '1057', '4', '/system/channel', 'C', '0', 'system:channel:view', '#', 'admin', '2018-12-28 09:06:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('1067', '新增', '1066', '1', '#', 'F', '0', 'system:channel:add', '#', 'admin', '2018-12-28 09:06:56', 'admin', '2018-12-28 09:30:17', '');
INSERT INTO `sys_menu` VALUES ('1068', '修改', '1066', '2', '#', 'F', '0', 'system:channel:update', '#', 'admin', '2018-12-28 09:31:51', 'admin', '2018-12-28 09:53:49', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('3', '1111', '1', '<h1><span style=\"font-weight: bold; font-style: italic;\">我是内容啊</span></h1><div><span style=\"font-weight: bold; font-style: italic;\">&nbsp; &nbsp; &nbsp; 11111111111111111111111111111111111111111</span></div>', '0', 'admin', '2018-12-17 11:56:41', '', null, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"业务\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-audio-description\"],\"visible\":[\"0\"]}', '0', null, '2018-12-07 11:52:17');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"业务\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-audio-description\"],\"visible\":[\"0\"]}', '0', null, '2018-12-07 11:52:58');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-07 11:57:28');
INSERT INTO `sys_oper_log` VALUES ('103', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2018-12-12 16:47:31');
INSERT INTO `sys_oper_log` VALUES ('104', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2018-12-12 16:47:35');
INSERT INTO `sys_oper_log` VALUES ('105', '重置密码', '2', 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', '1', 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"oldPassword\":[\"admin123\"],\"password\":[\"123456\"],\"confirm\":[\"123456\"]}', '0', null, '2018-12-12 16:47:56');
INSERT INTO `sys_oper_log` VALUES ('106', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2018-12-12 16:48:29');
INSERT INTO `sys_oper_log` VALUES ('107', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"机场集团\"],\"deptName\":[\"空港机电信息\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2018-12-12 16:53:21');
INSERT INTO `sys_oper_log` VALUES ('108', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"机场集团\"],\"deptName\":[\"实业公司\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2018-12-12 16:54:44');
INSERT INTO `sys_oper_log` VALUES ('109', '参数管理', '2', 'com.ruoyi.project.system.config.controller.ConfigController.editSave()', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-yellow\"],\"configType\":[\"Y\"],\"remark\":[\"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\"]}', '0', null, '2018-12-12 16:56:48');
INSERT INTO `sys_oper_log` VALUES ('110', '参数管理', '2', 'com.ruoyi.project.system.config.controller.ConfigController.editSave()', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"Y\"],\"remark\":[\"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\"]}', '0', null, '2018-12-12 16:57:10');
INSERT INTO `sys_oper_log` VALUES ('111', '参数管理', '2', 'com.ruoyi.project.system.config.controller.ConfigController.editSave()', '1', 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-default\"],\"configType\":[\"Y\"],\"remark\":[\"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\"]}', '0', null, '2018-12-12 16:57:29');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"文件上传\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-12 16:58:18');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1057\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"文件上传\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-edit\"],\"visible\":[\"0\"]}', '0', null, '2018-12-12 16:58:50');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1057\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"文件管理\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-edit\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 08:49:19');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"文件上传\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 09:51:06');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1058\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"文件上传\"],\"url\":[\"/file/upload\"],\"perms\":[\"file:upload\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 09:52:10');
INSERT INTO `sys_oper_log` VALUES ('117', '岗位管理', '5', 'com.ruoyi.project.system.post.controller.PostController.export()', '1', 'admin', '研发部门', '/system/post/export', '127.0.0.1', '内网IP', '{\"postCode\":[\"\"],\"postName\":[\"\"],\"status\":[\"\"]}', '0', null, '2018-12-13 10:18:17');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1058\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"文件上传\"],\"url\":[\"/file/list\"],\"perms\":[\"file:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 10:33:57');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1058\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"文件上传\"],\"url\":[\"/file\"],\"perms\":[\"file:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 10:35:11');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"上传\"],\"url\":[\"\"],\"perms\":[\"file:upload\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 10:41:55');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"perms\":[\"file:update\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 10:42:19');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"perms\":[\"file:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 10:42:47');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"到处\"],\"url\":[\"\"],\"perms\":[\"file:export\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 10:47:56');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1062\"],\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"导出\"],\"url\":[\"#\"],\"perms\":[\"file:export\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 11:01:41');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1058\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"文件上传\"],\"url\":[\"/file\"],\"perms\":[\"file:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 11:03:50');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"/file\"],\"perms\":[\"file:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 11:04:31');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1059\"],\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"上传\"],\"url\":[\"#\"],\"perms\":[\"file:upload\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 11:04:47');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1060\"],\"parentId\":[\"1058\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"#\"],\"perms\":[\"file:update\"],\"orderNum\":[\"25\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-13 11:04:59');
INSERT INTO `sys_oper_log` VALUES ('129', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"1111\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<h1><span style=\\\"font-weight: bold; font-style: italic;\\\">我是内容啊</span></h1><div><span style=\\\"font-weight: bold; font-style: italic;\\\">&nbsp; &nbsp; &nbsp; 1111111111111111111111111111111111111', '0', null, '2018-12-17 11:56:42');
INSERT INTO `sys_oper_log` VALUES ('130', '参数管理', '1', 'com.ruoyi.project.system.config.controller.ConfigController.addSave()', '1', 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":[\"55\"],\"configValue\":[\"66\"],\"remark\":[\"\"]}', '0', null, '2018-12-17 16:06:01');
INSERT INTO `sys_oper_log` VALUES ('131', '文件上传', '1', 'com.ruoyi.project.file.controller.FileController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"我的名称\"],\"type\":[\"1\"],\"remark\":[\"备注备注\"]}', '0', null, '2018-12-19 14:51:00');
INSERT INTO `sys_oper_log` VALUES ('132', '文件上传', '1', 'com.ruoyi.project.file.controller.FileController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"图片 ~\"]}', '0', null, '2018-12-19 16:14:06');
INSERT INTO `sys_oper_log` VALUES ('133', '文件上传', '1', 'com.ruoyi.project.file.controller.FileController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"111\"]}', '0', null, '2018-12-19 16:18:01');
INSERT INTO `sys_oper_log` VALUES ('134', '文件上传', '1', 'com.ruoyi.project.file.controller.FileController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"111111111111\"]}', '0', null, '2018-12-19 16:19:03');
INSERT INTO `sys_oper_log` VALUES ('135', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/file', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-19 16:39:10');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_file', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-20 09:24:37');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_files', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-20 09:31:55');
INSERT INTO `sys_oper_log` VALUES ('138', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"备注\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'url\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.files.mapper.FilesMapper.insertFiles-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_files    ( file_name,    remark,    type )           values ( ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'url\' doesn\'t have a default value\n; ]; Field \'url\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'url\' doesn\'t have a default value', '2018-12-20 09:42:31');
INSERT INTO `sys_oper_log` VALUES ('139', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"\"],\"remark\":[\"\"]}', '0', null, '2018-12-20 09:46:26');
INSERT INTO `sys_oper_log` VALUES ('140', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"备注\"]}', '0', null, '2018-12-20 09:47:08');
INSERT INTO `sys_oper_log` VALUES ('141', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"备注2\"]}', '0', null, '2018-12-20 09:59:35');
INSERT INTO `sys_oper_log` VALUES ('142', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"撒法发\"]}', '0', null, '2018-12-20 10:01:42');
INSERT INTO `sys_oper_log` VALUES ('143', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '0', null, '2018-12-20 10:06:47');
INSERT INTO `sys_oper_log` VALUES ('144', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"我是备注\"]}', '0', null, '2018-12-20 10:07:29');
INSERT INTO `sys_oper_log` VALUES ('145', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '0', null, '2018-12-20 10:07:56');
INSERT INTO `sys_oper_log` VALUES ('146', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '0', null, '2018-12-20 10:08:22');
INSERT INTO `sys_oper_log` VALUES ('147', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"undefined\"]}', '0', null, '2018-12-20 10:08:59');
INSERT INTO `sys_oper_log` VALUES ('148', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2018-12-20 10:17:49');
INSERT INTO `sys_oper_log` VALUES ('149', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2018-12-20 10:17:52');
INSERT INTO `sys_oper_log` VALUES ('150', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"\"],\"remark\":[\"\"]}', '0', null, '2018-12-20 11:09:46');
INSERT INTO `sys_oper_log` VALUES ('151', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"我的名称\"],\"type\":[\"0\"],\"remark\":[\"备注 111111\"]}', '0', null, '2018-12-20 11:14:20');
INSERT INTO `sys_oper_log` VALUES ('152', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileInfo\":[\"[object FormData]\"]}', '0', null, '2018-12-20 11:34:38');
INSERT INTO `sys_oper_log` VALUES ('153', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 11:36:13');
INSERT INTO `sys_oper_log` VALUES ('154', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 11:38:29');
INSERT INTO `sys_oper_log` VALUES ('155', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '0', null, '2018-12-20 11:38:39');
INSERT INTO `sys_oper_log` VALUES ('156', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '0', null, '2018-12-20 11:38:40');
INSERT INTO `sys_oper_log` VALUES ('157', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '0', null, '2018-12-20 11:38:43');
INSERT INTO `sys_oper_log` VALUES ('158', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '0', null, '2018-12-20 11:38:46');
INSERT INTO `sys_oper_log` VALUES ('159', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 11:38:56');
INSERT INTO `sys_oper_log` VALUES ('160', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 11:42:09');
INSERT INTO `sys_oper_log` VALUES ('161', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 11:42:47');
INSERT INTO `sys_oper_log` VALUES ('162', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '0', null, '2018-12-20 11:44:22');
INSERT INTO `sys_oper_log` VALUES ('163', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '0', null, '2018-12-20 11:44:24');
INSERT INTO `sys_oper_log` VALUES ('164', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '0', null, '2018-12-20 11:44:26');
INSERT INTO `sys_oper_log` VALUES ('165', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 14:22:33');
INSERT INTO `sys_oper_log` VALUES ('166', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 14:23:05');
INSERT INTO `sys_oper_log` VALUES ('167', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13\"]}', '0', null, '2018-12-20 16:47:24');
INSERT INTO `sys_oper_log` VALUES ('168', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '0', null, '2018-12-20 16:47:26');
INSERT INTO `sys_oper_log` VALUES ('169', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 17:06:07');
INSERT INTO `sys_oper_log` VALUES ('170', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"14\"]}', '0', null, '2018-12-20 17:07:16');
INSERT INTO `sys_oper_log` VALUES ('171', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 17:07:49');
INSERT INTO `sys_oper_log` VALUES ('172', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 17:09:26');
INSERT INTO `sys_oper_log` VALUES ('173', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 17:16:29');
INSERT INTO `sys_oper_log` VALUES ('174', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 17:19:59');
INSERT INTO `sys_oper_log` VALUES ('175', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"15\"]}', '0', null, '2018-12-20 17:20:04');
INSERT INTO `sys_oper_log` VALUES ('176', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '0', null, '2018-12-20 17:20:06');
INSERT INTO `sys_oper_log` VALUES ('177', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '0', null, '2018-12-20 17:20:08');
INSERT INTO `sys_oper_log` VALUES ('178', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18\"]}', '0', null, '2018-12-20 17:20:10');
INSERT INTO `sys_oper_log` VALUES ('179', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"files\":[\"[object FormData]\"]}', '0', null, '2018-12-20 17:21:03');
INSERT INTO `sys_oper_log` VALUES ('180', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"dfsdfsdfs\"],\"type\":[\"undefined\"],\"remark\":[\"\"]}', '0', null, '2018-12-20 17:25:43');
INSERT INTO `sys_oper_log` VALUES ('181', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"fsfasf\"],\"type\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-12-20 17:27:47');
INSERT INTO `sys_oper_log` VALUES ('182', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-12-21 08:48:13');
INSERT INTO `sys_oper_log` VALUES ('183', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-12-21 08:50:36');
INSERT INTO `sys_oper_log` VALUES ('184', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-12-21 08:53:29');
INSERT INTO `sys_oper_log` VALUES ('185', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '0', null, '2018-12-21 09:22:02');
INSERT INTO `sys_oper_log` VALUES ('186', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '0', null, '2018-12-21 09:22:04');
INSERT INTO `sys_oper_log` VALUES ('187', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '0', null, '2018-12-21 09:22:05');
INSERT INTO `sys_oper_log` VALUES ('188', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"19\"]}', '0', null, '2018-12-21 09:22:07');
INSERT INTO `sys_oper_log` VALUES ('189', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '0', null, '2018-12-21 09:22:08');
INSERT INTO `sys_oper_log` VALUES ('190', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '0', null, '2018-12-21 09:22:10');
INSERT INTO `sys_oper_log` VALUES ('191', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 09:22:26');
INSERT INTO `sys_oper_log` VALUES ('192', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '0', null, '2018-12-21 09:29:50');
INSERT INTO `sys_oper_log` VALUES ('193', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"的发生大苏打\"],\"type\":[\"0\"],\"remark\":[\"对方是否\"]}', '0', null, '2018-12-21 09:30:09');
INSERT INTO `sys_oper_log` VALUES ('194', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"撒大苏打\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 09:33:43');
INSERT INTO `sys_oper_log` VALUES ('195', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"25\"]}', '0', null, '2018-12-21 09:34:12');
INSERT INTO `sys_oper_log` VALUES ('196', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"我是一张图片\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 09:35:12');
INSERT INTO `sys_oper_log` VALUES ('197', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片2\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:02:34');
INSERT INTO `sys_oper_log` VALUES ('198', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '0', null, '2018-12-21 10:05:04');
INSERT INTO `sys_oper_log` VALUES ('199', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'url\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.files.mapper.FilesMapper.insertFiles-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_files    ( file_name,        type,        create_by,             create_by_name )           values ( ?,        ?,        ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'url\' doesn\'t have a default value\n; ]; Field \'url\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'url\' doesn\'t have a default value', '2018-12-21 10:05:40');
INSERT INTO `sys_oper_log` VALUES ('200', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'url\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.files.mapper.FilesMapper.insertFiles-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_files    ( file_name,        type,        create_by,             create_by_name )           values ( ?,        ?,        ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'url\' doesn\'t have a default value\n; ]; Field \'url\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'url\' doesn\'t have a default value', '2018-12-21 10:05:48');
INSERT INTO `sys_oper_log` VALUES ('201', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:07:40');
INSERT INTO `sys_oper_log` VALUES ('202', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"28\"]}', '0', null, '2018-12-21 10:08:15');
INSERT INTO `sys_oper_log` VALUES ('203', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"的\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:08:38');
INSERT INTO `sys_oper_log` VALUES ('204', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:14:37');
INSERT INTO `sys_oper_log` VALUES ('205', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"30\"]}', '0', null, '2018-12-21 10:17:10');
INSERT INTO `sys_oper_log` VALUES ('206', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"29\"]}', '0', null, '2018-12-21 10:17:12');
INSERT INTO `sys_oper_log` VALUES ('207', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片2\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:25:12');
INSERT INTO `sys_oper_log` VALUES ('208', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"31\"]}', '0', null, '2018-12-21 10:25:55');
INSERT INTO `sys_oper_log` VALUES ('209', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"12\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:30:29');
INSERT INTO `sys_oper_log` VALUES ('210', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"32\"]}', '0', null, '2018-12-21 10:39:48');
INSERT INTO `sys_oper_log` VALUES ('211', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"我的名称\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:40:26');
INSERT INTO `sys_oper_log` VALUES ('212', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"]}', '0', null, '2018-12-21 10:42:29');
INSERT INTO `sys_oper_log` VALUES ('213', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"33\"]}', '0', null, '2018-12-21 10:43:00');
INSERT INTO `sys_oper_log` VALUES ('214', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"名称1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:44:46');
INSERT INTO `sys_oper_log` VALUES ('215', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"34\"]}', '0', null, '2018-12-21 10:44:50');
INSERT INTO `sys_oper_log` VALUES ('216', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片名称\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:46:19');
INSERT INTO `sys_oper_log` VALUES ('217', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"35\"]}', '0', null, '2018-12-21 10:46:51');
INSERT INTO `sys_oper_log` VALUES ('218', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"摩擦产生\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:48:29');
INSERT INTO `sys_oper_log` VALUES ('219', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"36\"]}', '0', null, '2018-12-21 10:54:14');
INSERT INTO `sys_oper_log` VALUES ('220', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"37\"]}', '0', null, '2018-12-21 10:54:16');
INSERT INTO `sys_oper_log` VALUES ('221', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"名称1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:54:27');
INSERT INTO `sys_oper_log` VALUES ('222', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"名称1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:55:07');
INSERT INTO `sys_oper_log` VALUES ('223', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"我是图片\"],\"type\":[\"undefined\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 10:57:36');
INSERT INTO `sys_oper_log` VALUES ('224', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"38\"]}', '0', null, '2018-12-21 11:14:53');
INSERT INTO `sys_oper_log` VALUES ('225', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试图片1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 11:15:22');
INSERT INTO `sys_oper_log` VALUES ('226', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 11:18:26');
INSERT INTO `sys_oper_log` VALUES ('227', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"39\"]}', '0', null, '2018-12-21 11:19:19');
INSERT INTO `sys_oper_log` VALUES ('228', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"40\"]}', '0', null, '2018-12-21 11:26:35');
INSERT INTO `sys_oper_log` VALUES ('229', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 11:30:41');
INSERT INTO `sys_oper_log` VALUES ('230', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"41\"]}', '0', null, '2018-12-21 11:30:45');
INSERT INTO `sys_oper_log` VALUES ('231', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 11:36:40');
INSERT INTO `sys_oper_log` VALUES ('232', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"视频1\"],\"type\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 11:38:28');
INSERT INTO `sys_oper_log` VALUES ('233', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"43\"]}', '0', null, '2018-12-21 14:53:54');
INSERT INTO `sys_oper_log` VALUES ('234', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试视频\"],\"type\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 14:54:32');
INSERT INTO `sys_oper_log` VALUES ('235', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"44\"]}', '0', null, '2018-12-21 14:56:16');
INSERT INTO `sys_oper_log` VALUES ('236', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试视频1\"],\"type\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 14:56:35');
INSERT INTO `sys_oper_log` VALUES ('237', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"45\"]}', '0', null, '2018-12-21 14:57:12');
INSERT INTO `sys_oper_log` VALUES ('238', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"测试1\"],\"type\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 14:58:23');
INSERT INTO `sys_oper_log` VALUES ('239', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"file\":[\"undefined\"],\"fileName\":[\"文字内容\"],\"type\":[\"2\"],\"remark\":[\"\"]}', '0', null, '2018-12-21 16:53:05');
INSERT INTO `sys_oper_log` VALUES ('240', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<p><br></p>\"],\"remark\":[\"我是图片2\"]}', '0', null, '2018-12-24 16:40:28');
INSERT INTO `sys_oper_log` VALUES ('241', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<p><br></p>\"],\"remark\":[\"我是图片2\"]}', '0', null, '2018-12-24 16:41:05');
INSERT INTO `sys_oper_log` VALUES ('242', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<p><br></p>\"],\"remark\":[\"我是图片2\"]}', '0', null, '2018-12-24 16:44:09');
INSERT INTO `sys_oper_log` VALUES ('243', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addSave()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片2\"],\"type\":[\"0\"],\"remark\":[\"我是图片2\"]}', '0', null, '2018-12-24 16:46:45');
INSERT INTO `sys_oper_log` VALUES ('244', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', null, '/tool/gen/genCode/play_order', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-25 12:49:37');
INSERT INTO `sys_oper_log` VALUES ('245', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', null, '/tool/gen/genCode/play_order', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-25 12:50:51');
INSERT INTO `sys_oper_log` VALUES ('246', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1><span style=\\\"font-weight: bold;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;我是标题</span></h1><div><span style=\\\"font-weight: bold;\\\">&nbsp; &nbsp;下面是一些描述的文件，你好我是描述我是描述。</span><span style=\\\"font-weight: 700; color: inherit;\\\">', '0', null, '2018-12-25 16:49:24');
INSERT INTO `sys_oper_log` VALUES ('247', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1><span style=\\\"font-weight: bold;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;我是标题</span></h1><div><span style=\\\"font-weight: bold;\\\">&nbsp; &nbsp;下面是一些描述的文件，你好我是描述我是描述。</span><span style=\\\"font-weight: 700; color: inherit;\\\">', '0', null, '2018-12-25 16:50:33');
INSERT INTO `sys_oper_log` VALUES ('248', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1><span style=\\\"font-weight: bold;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;我是标题</span></h1><div><span style=\\\"font-weight: bold;\\\">&nbsp; &nbsp;下面是一些描述的文件，你好我是描述我是描述。</span><span style=\\\"font-weight: 700; color: inherit;\\\">', '0', null, '2018-12-25 16:51:07');
INSERT INTO `sys_oper_log` VALUES ('249', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容，你好！<span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: inherit;\\\">我是内容，你好！</span><span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: in', '0', null, '2018-12-25 16:53:28');
INSERT INTO `sys_oper_log` VALUES ('250', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容，你好！<span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: inherit;\\\">我是内容，你好！</span><span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: in', '0', null, '2018-12-25 16:54:03');
INSERT INTO `sys_oper_log` VALUES ('251', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容，你好！<span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: inherit;\\\">我是内容，你好！</span><span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: in', '0', null, '2018-12-25 16:54:40');
INSERT INTO `sys_oper_log` VALUES ('252', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容，你好！<span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: inherit;\\\">我是内容，你好！</span><span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: in', '0', null, '2018-12-25 16:55:12');
INSERT INTO `sys_oper_log` VALUES ('253', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容，你好！<span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: inherit;\\\">我是内容，你好！</span><span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: in', '0', null, '2018-12-25 16:55:36');
INSERT INTO `sys_oper_log` VALUES ('254', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容，你好！<span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: inherit;\\\">我是内容，你好！</span><span style=\\\"color: inherit;\\\">&nbsp;</span><span style=\\\"color: in', '0', null, '2018-12-25 16:56:06');
INSERT INTO `sys_oper_log` VALUES ('255', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"47\"],\"file\":[\"undefined\"],\"fileName\":[\"图片3\"],\"type\":[\"0\"],\"remark\":[\"我是图片2\"]}', '0', null, '2018-12-26 08:57:19');
INSERT INTO `sys_oper_log` VALUES ('256', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"47\"],\"file\":[\"undefined\"],\"fileName\":[\"图片3\"],\"type\":[\"0\"],\"remark\":[\"我是图片2\"]}', '0', null, '2018-12-26 08:58:13');
INSERT INTO `sys_oper_log` VALUES ('257', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"图片2\"],\"type\":[\"0\"],\"remark\":[\"我是备注\"]}', '0', null, '2018-12-26 09:16:37');
INSERT INTO `sys_oper_log` VALUES ('258', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"49\"],\"file\":[\"undefined\"],\"fileName\":[\"图片3\"],\"type\":[\"0\"],\"remark\":[\"我是备注\"]}', '0', null, '2018-12-26 09:16:54');
INSERT INTO `sys_oper_log` VALUES ('259', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"49\"],\"file\":[\"undefined\"],\"fileName\":[\"图片3\"],\"type\":[\"0\"],\"remark\":[\"我是备注\"]}', '0', null, '2018-12-26 09:18:45');
INSERT INTO `sys_oper_log` VALUES ('260', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"49\"],\"file\":[\"undefined\"],\"fileName\":[\"图片3\"],\"type\":[\"0\"],\"remark\":[\"我是备注\"]}', '0', null, '2018-12-26 09:24:03');
INSERT INTO `sys_oper_log` VALUES ('261', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"我是测试图片4\"]}', '0', null, '2018-12-26 09:32:32');
INSERT INTO `sys_oper_log` VALUES ('262', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"50\"]}', '0', null, '2018-12-26 09:32:47');
INSERT INTO `sys_oper_log` VALUES ('263', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"51\"]}', '0', null, '2018-12-26 09:46:20');
INSERT INTO `sys_oper_log` VALUES ('264', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 09:46:45');
INSERT INTO `sys_oper_log` VALUES ('265', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\",\"1\"],\"id\":[\"52\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 09:47:53');
INSERT INTO `sys_oper_log` VALUES ('266', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\",\"1\"],\"id\":[\"52\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 09:48:06');
INSERT INTO `sys_oper_log` VALUES ('267', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\",\"1\"],\"id\":[\"52\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 09:52:12');
INSERT INTO `sys_oper_log` VALUES ('268', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\",\"1\"],\"id\":[\"52\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 09:53:10');
INSERT INTO `sys_oper_log` VALUES ('269', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"52\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 09:53:54');
INSERT INTO `sys_oper_log` VALUES ('270', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 10:23:09');
INSERT INTO `sys_oper_log` VALUES ('271', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"53\"]}', '0', null, '2018-12-26 10:23:43');
INSERT INTO `sys_oper_log` VALUES ('272', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:25:06');
INSERT INTO `sys_oper_log` VALUES ('273', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"54\"]}', '0', null, '2018-12-26 10:26:36');
INSERT INTO `sys_oper_log` VALUES ('274', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 10:27:40');
INSERT INTO `sys_oper_log` VALUES ('275', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"55\"]}', '0', null, '2018-12-26 10:29:26');
INSERT INTO `sys_oper_log` VALUES ('276', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 10:29:47');
INSERT INTO `sys_oper_log` VALUES ('277', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"56\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"我是图片4\"]}', '0', null, '2018-12-26 10:30:09');
INSERT INTO `sys_oper_log` VALUES ('278', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:31:09');
INSERT INTO `sys_oper_log` VALUES ('279', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"57\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:33:11');
INSERT INTO `sys_oper_log` VALUES ('280', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:47:35');
INSERT INTO `sys_oper_log` VALUES ('281', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"58\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:47:53');
INSERT INTO `sys_oper_log` VALUES ('282', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"58\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:48:29');
INSERT INTO `sys_oper_log` VALUES ('283', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"58\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:48:49');
INSERT INTO `sys_oper_log` VALUES ('284', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"58\"]}', '1', '', '2018-12-26 10:49:03');
INSERT INTO `sys_oper_log` VALUES ('285', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:49:43');
INSERT INTO `sys_oper_log` VALUES ('286', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"59\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:51:32');
INSERT INTO `sys_oper_log` VALUES ('287', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"59\"]}', '1', '', '2018-12-26 10:53:14');
INSERT INTO `sys_oper_log` VALUES ('288', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:53:33');
INSERT INTO `sys_oper_log` VALUES ('289', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"60\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 10:53:44');
INSERT INTO `sys_oper_log` VALUES ('290', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"60\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:07:30');
INSERT INTO `sys_oper_log` VALUES ('291', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"60\"]}', '0', null, '2018-12-26 11:08:58');
INSERT INTO `sys_oper_log` VALUES ('292', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:09:37');
INSERT INTO `sys_oper_log` VALUES ('293', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"61\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:10:30');
INSERT INTO `sys_oper_log` VALUES ('294', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"61\"]}', '0', null, '2018-12-26 11:10:47');
INSERT INTO `sys_oper_log` VALUES ('295', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:13:17');
INSERT INTO `sys_oper_log` VALUES ('296', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"62\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:13:34');
INSERT INTO `sys_oper_log` VALUES ('297', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"62\"]}', '0', null, '2018-12-26 11:14:03');
INSERT INTO `sys_oper_log` VALUES ('298', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:14:21');
INSERT INTO `sys_oper_log` VALUES ('299', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"63\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:15:09');
INSERT INTO `sys_oper_log` VALUES ('300', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', null, '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"63\"]}', '0', null, '2018-12-26 11:16:09');
INSERT INTO `sys_oper_log` VALUES ('301', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:16:24');
INSERT INTO `sys_oper_log` VALUES ('302', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"64\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:16:38');
INSERT INTO `sys_oper_log` VALUES ('303', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"64\"]}', '0', null, '2018-12-26 11:20:00');
INSERT INTO `sys_oper_log` VALUES ('304', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片4\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:20:15');
INSERT INTO `sys_oper_log` VALUES ('305', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"65\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:20:42');
INSERT INTO `sys_oper_log` VALUES ('306', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"65\"],\"updateFlag\":[\"1\"],\"fileName\":[\"图片4567\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-12-26 11:21:31');
INSERT INTO `sys_oper_log` VALUES ('307', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"显示页面\"],\"url\":[\"/file/show\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-26 16:20:31');
INSERT INTO `sys_oper_log` VALUES ('308', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"播放设置\"],\"url\":[\"/file/show\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-27 08:32:34');
INSERT INTO `sys_oper_log` VALUES ('309', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1065\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"播放设置\"],\"url\":[\"/file/showOrder\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-27 08:33:05');
INSERT INTO `sys_oper_log` VALUES ('310', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1065\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"播放设置\"],\"url\":[\"/file/listOrder\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-27 08:43:36');
INSERT INTO `sys_oper_log` VALUES ('311', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1065\"],\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"播放设置\"],\"url\":[\"/file/listOrderPage\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-27 08:46:09');
INSERT INTO `sys_oper_log` VALUES ('312', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"42\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"我使备注\"]}', '0', null, '2018-12-27 10:34:40');
INSERT INTO `sys_oper_log` VALUES ('313', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/channel', '127.0.0.1', '内网IP', '{}', '0', null, '2018-12-27 15:18:47');
INSERT INTO `sys_oper_log` VALUES ('314', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1057\"],\"menuType\":[\"C\"],\"menuName\":[\"通道设置\"],\"url\":[\"/system/channel\"],\"perms\":[\"system:channel:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-28 09:06:05');
INSERT INTO `sys_oper_log` VALUES ('315', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-28 09:06:56');
INSERT INTO `sys_oper_log` VALUES ('316', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1067\"],\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"#\"],\"perms\":[\"system:channel:add\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-28 09:30:18');
INSERT INTO `sys_oper_log` VALUES ('317', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-12-28 09:31:51');
INSERT INTO `sys_oper_log` VALUES ('318', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1068\"],\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"#\"],\"perms\":[\"system:channel:update\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-12-28 09:53:49');
INSERT INTO `sys_oper_log` VALUES ('319', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', '研发部门', '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"一号通道\"],\"channelCode\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelCode\' in \'field list\'\r\n### The error may involve com.ruoyi.project.system.channel.mapper.ChannelMapper.insertChannel-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into channel    ( name,               channelCode )           values ( ?,             ? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelCode\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelCode\' in \'field list\'', '2018-12-28 09:54:09');
INSERT INTO `sys_oper_log` VALUES ('320', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', '研发部门', '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"一号通道\"],\"channelCode\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelCode\' in \'field list\'\r\n### The error may involve com.ruoyi.project.system.channel.mapper.ChannelMapper.insertChannel-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into channel    ( name,               channelCode )           values ( ?,             ? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelCode\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelCode\' in \'field list\'', '2018-12-28 10:00:24');
INSERT INTO `sys_oper_log` VALUES ('321', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', null, '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"一号通道\"],\"channelCode\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.channel.mapper.ChannelMapper.insertChannel-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into channel    ( name,               channel_Code )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; ]; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2018-12-28 10:01:45');
INSERT INTO `sys_oper_log` VALUES ('322', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', null, '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"一号通道\"],\"channelCode\":[\"1\"]}', '0', null, '2018-12-28 10:02:22');
INSERT INTO `sys_oper_log` VALUES ('323', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', null, '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"二号通道\"],\"channelCode\":[\"2\"]}', '0', null, '2018-12-28 10:02:38');
INSERT INTO `sys_oper_log` VALUES ('324', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', null, '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"三号通道\"],\"channelCode\":[\"3\"]}', '0', null, '2018-12-28 10:02:52');
INSERT INTO `sys_oper_log` VALUES ('325', '通道', '1', 'com.ruoyi.project.system.channel.controller.ChannelController.addSave()', '1', 'admin', null, '/system/channel/add', '127.0.0.1', '内网IP', '{\"name\":[\"四号通道\"],\"channelCode\":[\"4\"]}', '0', null, '2018-12-28 10:03:18');
INSERT INTO `sys_oper_log` VALUES ('326', '通道', '3', 'com.ruoyi.project.system.channel.controller.ChannelController.remove()', '1', 'admin', null, '/system/channel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '0', null, '2018-12-28 10:24:21');
INSERT INTO `sys_oper_log` VALUES ('327', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"三号通道\"],\"channelCode\":[\"3\"]}', '0', null, '2018-12-29 11:50:47');
INSERT INTO `sys_oper_log` VALUES ('328', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"三号通道\"],\"channelCode\":[\"3\"]}', '0', null, '2019-01-02 11:18:14');
INSERT INTO `sys_oper_log` VALUES ('329', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:29:55');
INSERT INTO `sys_oper_log` VALUES ('330', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:32:23');
INSERT INTO `sys_oper_log` VALUES ('331', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:35:17');
INSERT INTO `sys_oper_log` VALUES ('332', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:36:21');
INSERT INTO `sys_oper_log` VALUES ('333', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:40:09');
INSERT INTO `sys_oper_log` VALUES ('334', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', null, '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:49:13');
INSERT INTO `sys_oper_log` VALUES ('335', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', null, '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:50:36');
INSERT INTO `sys_oper_log` VALUES ('336', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:52:58');
INSERT INTO `sys_oper_log` VALUES ('337', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"三号通道\"],\"channelCode\":[\"3\"]}', '0', null, '2019-01-02 11:53:25');
INSERT INTO `sys_oper_log` VALUES ('338', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{}', '1', '文件不能为空！', '2019-01-02 11:53:54');
INSERT INTO `sys_oper_log` VALUES ('339', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"[{\\\"id\\\":42},{\\\"id\\\":46}]\"]}', '1', '保存异常，请稍后重试！', '2019-01-02 11:55:01');
INSERT INTO `sys_oper_log` VALUES ('340', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"[{\\\"0\\\":true,\\\"searchValue\\\":null,\\\"createBy\\\":\\\"admin\\\",\\\"createTime\\\":\\\"2018-12-21 11:36:40\\\",\\\"updateBy\\\":\\\"\\\",\\\"updateTime\\\":\\\"2018-12-27 10:34:37\\\",\\\"remark\\\":\\\"我使备注\\\",\\\"params\\\":{},\\\"id\\\":42,\\\"url\\\":\\\"D:/profile/图片1.jpg\\\",\\\"status\\\":\\\"0\\\",', '1', '保存异常，请稍后重试！', '2019-01-02 11:57:00');
INSERT INTO `sys_oper_log` VALUES ('341', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"[{\\\"0\\\":true,\\\"searchValue\\\":null,\\\"createBy\\\":\\\"admin\\\",\\\"createTime\\\":\\\"2018-12-21 11:36:40\\\",\\\"updateBy\\\":\\\"\\\",\\\"updateTime\\\":\\\"2018-12-27 10:34:37\\\",\\\"remark\\\":\\\"我使备注\\\",\\\"params\\\":{},\\\"id\\\":42,\\\"url\\\":\\\"D:/profile/图片1.jpg\\\",\\\"status\\\":\\\"0\\\",', '1', '保存异常，请稍后重试！', '2019-01-02 11:59:03');
INSERT INTO `sys_oper_log` VALUES ('342', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"[{\\\"0\\\":true,\\\"searchValue\\\":null,\\\"createBy\\\":\\\"admin\\\",\\\"createTime\\\":\\\"2018-12-21 11:36:40\\\",\\\"updateBy\\\":\\\"\\\",\\\"updateTime\\\":\\\"2018-12-27 10:34:37\\\",\\\"remark\\\":\\\"我使备注\\\",\\\"params\\\":{},\\\"id\\\":42,\\\"url\\\":\\\"D:/profile/图片1.jpg\\\",\\\"status\\\":\\\"0\\\",', '1', '保存异常，请稍后重试！', '2019-01-02 12:00:05');
INSERT INTO `sys_oper_log` VALUES ('343', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"三号通道\"],\"channelCode\":[\"3\"]}', '0', null, '2019-01-02 14:33:20');
INSERT INTO `sys_oper_log` VALUES ('344', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"]}', '0', null, '2019-01-02 14:34:13');
INSERT INTO `sys_oper_log` VALUES ('345', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"3\"]}', '1', '', '2019-01-02 14:43:46');
INSERT INTO `sys_oper_log` VALUES ('346', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', null, '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"3\"]}', '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.file_name as fileName from plays_order a where a.channel_id=3 order by order_b\' at line 1\r\n### The error may exist in com/ruoyi/project/system/files/mapper/PlayOrderMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.system.files.mapper.PlayOrderMapper.selectMaxLimit-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.id as id, a.channel_id as channelId a.file_name as fileName from plays_order a where a.channel_id=? order by order_by desc limit 1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.file_name as fileName from plays_order a where a.channel_id=3 order by order_b\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.file_name as fileName from plays_order a where a.channel_id=3 order by order_b\' at line 1', '2019-01-02 14:46:16');
INSERT INTO `sys_oper_log` VALUES ('347', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', null, '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"3\"]}', '1', '', '2019-01-02 14:47:27');
INSERT INTO `sys_oper_log` VALUES ('348', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', null, '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"3\"]}', '1', '', '2019-01-02 14:47:41');
INSERT INTO `sys_oper_log` VALUES ('349', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', null, '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"3\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelId\' in \'field list\'\r\n### The error may involve com.ruoyi.project.system.files.mapper.PlayOrderMapper.insertOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into plays_order    ( file_Name,    types,    ur,        order_by,                 channel_id )           values ( ?,    ?,    ?,        ?,                 channelId )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelId\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'channelId\' in \'field list\'', '2019-01-02 14:51:02');
INSERT INTO `sys_oper_log` VALUES ('350', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"3\"]}', '0', null, '2019-01-02 14:58:26');
INSERT INTO `sys_oper_log` VALUES ('351', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"46,49\"],\"channelId\":[\"2\"]}', '0', null, '2019-01-02 15:00:05');
INSERT INTO `sys_oper_log` VALUES ('352', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"二号通道\"],\"channelCode\":[\"2\"]}', '0', null, '2019-01-02 15:00:16');
INSERT INTO `sys_oper_log` VALUES ('353', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"42,46\"],\"channelId\":[\"1\"]}', '0', null, '2019-01-02 15:58:30');
INSERT INTO `sys_oper_log` VALUES ('354', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"一号通道\"],\"channelCode\":[\"1\"]}', '0', null, '2019-01-02 15:58:35');
INSERT INTO `sys_oper_log` VALUES ('355', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"49\"],\"channelId\":[\"1\"]}', '0', null, '2019-01-02 16:03:29');
INSERT INTO `sys_oper_log` VALUES ('356', '通道', '2', 'com.ruoyi.project.system.channel.controller.ChannelController.editSave()', '1', 'admin', '研发部门', '/system/channel/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"一号通道\"],\"channelCode\":[\"1\"]}', '0', null, '2019-01-02 16:03:32');
INSERT INTO `sys_oper_log` VALUES ('357', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', null, '/system/menu/remove/1064', '127.0.0.1', '内网IP', '{}', '0', null, '2019-01-02 16:27:17');
INSERT INTO `sys_oper_log` VALUES ('358', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', null, '/system/menu/remove/1065', '127.0.0.1', '内网IP', '{}', '0', null, '2019-01-02 16:27:36');
INSERT INTO `sys_oper_log` VALUES ('359', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', null, '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"42\"],\"updateFlag\":[\"1\"],\"file\":[\"undefined\"],\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"我使备注\"]}', '0', null, '2019-01-02 16:29:09');
INSERT INTO `sys_oper_log` VALUES ('360', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"图片1\"],\"type\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-01-03 09:51:40');
INSERT INTO `sys_oper_log` VALUES ('361', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"fileName\":[\"视频\"],\"type\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2019-01-03 09:51:57');
INSERT INTO `sys_oper_log` VALUES ('362', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"id\":[\"67\"],\"updateFlag\":[\"1\"],\"content\":[\"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是标题<div>&nbsp; &nbsp; &nbsp;内容<span style=\\\"color: inher', '0', null, '2019-01-03 09:53:14');
INSERT INTO `sys_oper_log` VALUES ('363', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"content\":[\"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 我是文字<div><br></div><div>&nbsp; &nbsp; &nbsp; 内容如下<span style=\\\"color: inherit;\\\">内容如下</span><s', '0', null, '2019-01-03 09:54:48');
INSERT INTO `sys_oper_log` VALUES ('364', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"68\"]}', '0', null, '2019-01-03 09:55:40');
INSERT INTO `sys_oper_log` VALUES ('365', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"content\":[\"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;我是标题<div>&nbsp; &nbsp; &nbsp; &nbsp; 标题内容<span style=\\\"color: inherit;', '0', null, '2019-01-03 09:56:43');
INSERT INTO `sys_oper_log` VALUES ('366', '文件上传', '3', 'com.ruoyi.project.system.files.controller.FilesController.remove()', '1', 'admin', '研发部门', '/file/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"69\"]}', '0', null, '2019-01-03 09:58:20');
INSERT INTO `sys_oper_log` VALUES ('367', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.save()', '1', 'admin', '研发部门', '/file/add', '127.0.0.1', '内网IP', '{\"updateFlag\":[\"0\"],\"content\":[\"<h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 标题</h1><div>&nbsp; &nbsp; &nbsp; 我是内容<span style=\\\"color: inherit;\\\">我是内容</span><span style=\\\"color: inherit;\\\">我是内容</span><span style=\\\"color', '0', null, '2019-01-03 09:58:59');
INSERT INTO `sys_oper_log` VALUES ('368', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"66\"],\"channelId\":[\"1\"]}', '0', null, '2019-01-03 09:59:38');
INSERT INTO `sys_oper_log` VALUES ('369', '文件上传', '1', 'com.ruoyi.project.system.files.controller.FilesController.addFileToShow()', '1', 'admin', '研发部门', '/file/addFileToShow', '127.0.0.1', '内网IP', '{\"list\":[\"67\"],\"channelId\":[\"1\"]}', '0', null, '2019-01-03 09:59:44');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '管理员', '00', 'ry@163.com', '15888888888', '0', '9bb570b323da9d39bcc855b65ca65424.jpg', 'e6314415342e92e189629f2233b15e55', 'd86bae', '0', '0', '127.0.0.1', '2019-01-03 09:49:04', 'admin', '2018-03-16 11:33:00', 'ry', '2019-01-03 09:49:03', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '管理员', '00', 'ry@qq.com', '15666666666', '0', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('f8f94056-e748-4d4f-ab04-076be8355d7d', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-01-03 09:48:26', '2019-01-03 10:02:32', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
