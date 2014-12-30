-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.32 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 gajeapp.administrator 结构
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `admin_id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_uuid` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `create_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.administrator 的数据：~0 rows (大约)
DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;


-- 导出  表 gajeapp.comment 结构
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_uuid` char(128) NOT NULL,
  `user_uuid` char(128) NOT NULL,
  `content` varchar(512) NOT NULL,
  `is_read` int(11) NOT NULL,
  `create_date` int(20) NOT NULL,
  `modified_date` int(20) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.comment 的数据：~0 rows (大约)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- 导出  表 gajeapp.image 结构
DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `image_id` int(20) NOT NULL AUTO_INCREMENT,
  `image_uuid` char(50) NOT NULL DEFAULT '',
  `user_uuid` varchar(255) NOT NULL DEFAULT '',
  `theme_uuid` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(512) NOT NULL DEFAULT '',
  `mime` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `status` varchar(32) NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_path` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(20) NOT NULL DEFAULT '0',
  `brander_count` int(20) NOT NULL DEFAULT '0',
  `follower_count` int(20) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image 的数据：~3 rows (大约)
DELETE FROM `image`;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`image_id`, `image_uuid`, `user_uuid`, `theme_uuid`, `name`, `description`, `mime`, `type`, `status`, `approved`, `width`, `height`, `thumbnail`, `file_name`, `file_path`, `sort_order`, `comment_count`, `brander_count`, `follower_count`, `create_date`, `modified_date`) VALUES
	(2, '544efa05cc2a5', '544ef98e33706', '544ef69da4a6f', '', '<Image: 0x14ee0c40>', 'image/jpeg', '', '', 0, 2448, 3264, 'image544efa05cc13b_280x373.jpg', 'image544efa05cc13b.jpg', '/home/hellogajeapp/public_html/upload/image/', 0, 0, 2, 0, 1414461957, 1414461957),
	(3, '544f5eca6ff2a', '544f5e9946ac5', '544ef69da4a6f', '', '<Image: 0x7a0d4880>', 'image/jpeg', '', '', 0, 1008, 669, 'image544f5eca6fdbf_280x185.jpg', 'image544f5eca6fdbf.jpg', '/home/hellogajeapp/public_html/upload/image/', 0, 0, 0, 0, 1414487754, 1414487754),
	(4, '544f5fbcd8a7b', '544f5e9946ac5', '544ef69da4a6f', '', '', 'image/jpeg', '', '', 0, 1500, 1001, 'image544f5fbcd8916_280x186.jpg', 'image544f5fbcd8916.jpg', '/home/hellogajeapp/public_html/upload/image/', 0, 0, 0, 0, 1414487996, 1414487996);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


-- 导出  表 gajeapp.image_brander 结构
DROP TABLE IF EXISTS `image_brander`;
CREATE TABLE IF NOT EXISTS `image_brander` (
  `image_brander_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_uuid` char(128) NOT NULL,
  `user_uuid` char(128) NOT NULL,
  `is_read` tinyint(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  PRIMARY KEY (`image_brander_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image_brander 的数据：~2 rows (大约)
DELETE FROM `image_brander`;
/*!40000 ALTER TABLE `image_brander` DISABLE KEYS */;
INSERT INTO `image_brander` (`image_brander_id`, `image_uuid`, `user_uuid`, `is_read`, `create_date`) VALUES
	(1, '544efa05cc2a5', '544ef5981c4a9', 0, 1414462061),
	(2, '544efa05cc2a5', '544f5e9946ac5', 0, 1414488104);
/*!40000 ALTER TABLE `image_brander` ENABLE KEYS */;


-- 导出  表 gajeapp.image_comment 结构
DROP TABLE IF EXISTS `image_comment`;
CREATE TABLE IF NOT EXISTS `image_comment` (
  `image_comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_uuid` char(50) NOT NULL,
  `image_uuid` char(50) NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image_comment 的数据：~0 rows (大约)
DELETE FROM `image_comment`;
/*!40000 ALTER TABLE `image_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_comment` ENABLE KEYS */;


-- 导出  表 gajeapp.note 结构
DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `note_id` int(20) NOT NULL AUTO_INCREMENT,
  `note_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.note 的数据：~0 rows (大约)
DELETE FROM `note`;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;


-- 导出  表 gajeapp.theme 结构
DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `theme_id` int(20) NOT NULL AUTO_INCREMENT,
  `theme_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.theme 的数据：~1 rows (大约)
DELETE FROM `theme`;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` (`theme_id`, `theme_uuid`, `name`, `description`, `create_date`, `modified_date`) VALUES
	(1, '544ef69da4a6f', 'Falling Autumn', '', 1414461085, 1414461085);
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int(20) NOT NULL AUTO_INCREMENT,
  `notification_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- 导出  表 gajeapp.update 结构
DROP TABLE IF EXISTS `update`;
CREATE TABLE IF NOT EXISTS `update` (
  `update_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uuid` char(32) NOT NULL DEFAULT '0',
  `object_uuid` char(32) NOT NULL,
  `type` char(32) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.update 的数据：~0 rows (大约)
DELETE FROM `update`;
/*!40000 ALTER TABLE `update` DISABLE KEYS */;
/*!40000 ALTER TABLE `update` ENABLE KEYS */;


-- 导出  表 gajeapp.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(50) NOT NULL DEFAULT '',
  `facebook_token` varchar(255) NOT NULL DEFAULT '',
  `facebook_icon` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `longtitude` varchar(255) NOT NULL DEFAULT '',
  `latitude` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `image_latest` varchar(255) NOT NULL DEFAULT '',
  `images` int(20) NOT NULL DEFAULT '0',
  `create_date` int(20) NOT NULL DEFAULT '0',
  `modified_date` int(20) NOT NULL DEFAULT '0',
  `comment_count` int(20) NOT NULL DEFAULT '0',
  `brander_count` int(20) NOT NULL DEFAULT '0',
  `follower_count` int(20) NOT NULL DEFAULT '0',
  `status` int(20) NOT NULL DEFAULT '1',
  `apn_token` BINARY(255) NOT NULL DEFAULT '',
  `apn_enable` int(20) NOT NULL DEFAULT '0',
  `apn_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user 的数据：~3 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_uuid`, `facebook_token`, `facebook_icon`, `username`, `email`, `password`, `firstname`, `lastname`, `fullname`, `location`, `longtitude`, `latitude`, `city`, `state`, `country`, `phone`, `image_latest`, `images`, `create_date`, `modified_date`, `comment_count`, `brander_count`, `follower_count`) VALUES
	(1, '544ef5981c4a9', '100001024326699', 'http://graph.facebook.com/100001024326699/picture?type=large', 'Grant', 'grfawson89@gmail.com', '', '', '', 'Grant Fawson', '', '', '', '', '', '', '', '', 0, 1414460824, 1414460824, 0, 0, 0),
	(2, '544ef98e33706', '10152813928988035', 'http://graph.facebook.com/10152813928988035/picture?type=large', 'CÃ©sar', 'cesarfelip3@gmail.com', '', '', '', 'CÃ©sar Felipe Alves', '', '', '', '', '', '', '', '', 0, 1414461838, 1414461838, 0, 0, 0),
	(3, '544f5e9946ac5', '1486770218272211', 'http://graph.facebook.com/1486770218272211/picture?type=large', 'Felipe', 'felip3app@gmail.com', '', '', '', 'Felipe Alves', '', '', '', '', '', '', '', '', 0, 1414487705, 1414487946, 0, 0, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 gajeapp.user_block 结构
DROP TABLE IF EXISTS `user_block`;
CREATE TABLE IF NOT EXISTS `user_block` (
  `user_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(50) NOT NULL,
  `user_block_uuid` char(50) NOT NULL,
  `create_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user_block 的数据：~0 rows (大约)
DELETE FROM `user_block`;
/*!40000 ALTER TABLE `user_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_block` ENABLE KEYS */;


-- 导出  表 gajeapp.user_exclude_image 结构
DROP TABLE IF EXISTS `user_exclude_image`;
CREATE TABLE IF NOT EXISTS `user_exclude_image` (
  `user_exclude_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(50) NOT NULL,
  `image_uuid` char(50) NOT NULL,
  `create_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_exclude_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user_exclude_image 的数据：~0 rows (大约)
DELETE FROM `user_exclude_image`;
/*!40000 ALTER TABLE `user_exclude_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_exclude_image` ENABLE KEYS */;


-- 导出  表 gajeapp.user_follow 结构
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE IF NOT EXISTS `user_follow` (
  `user_follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_followed_uuid` char(50) NOT NULL,
  `user_following_uuid` char(50) NOT NULL,
  `is_mutual` int(11) NOT NULL DEFAULT '0',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user_follow 的数据：~0 rows (大约)
DELETE FROM `user_follow`;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;


-- 导出  表 gajeapp.user_update 结构
DROP TABLE IF EXISTS `user_update`;
CREATE TABLE IF NOT EXISTS `user_update` (
  `user_update_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(32) NOT NULL,
  `user_from_uuid` char(32) NOT NULL,
  `type` enum('image.comment','image.brander','user.follower') NOT NULL DEFAULT 'image.comment',
  `reference_uuid` char(32) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user_update 的数据：~0 rows (大约)
DELETE FROM `user_update`;
/*!40000 ALTER TABLE `user_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_update` ENABLE KEYS */;


-- 导出  视图 gajeapp.view_image_brander_collection 结构
DROP VIEW IF EXISTS `view_image_brander_collection`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_image_brander_collection` (
	`user_id` INT(11) NOT NULL,
	`user_uuid` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`facebook_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`facebook_icon` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci',
	`email` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`firstname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`lastname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`location` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`longtitude` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`latitude` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`city` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`state` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`country` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`phone` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`image_latest` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`images` INT(20) NOT NULL,
	`create_date` INT(20) NOT NULL,
	`modified_date` INT(20) NOT NULL,
	`comment_count` INT(20) NOT NULL,
	`brander_count` INT(20) NOT NULL,
	`follower_count` INT(20) NOT NULL,
	`date_added` INT(11) NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_image_comment_collection 结构
DROP VIEW IF EXISTS `view_image_comment_collection`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_image_comment_collection` (
	`comment_id` INT(20) NOT NULL,
	`comment_uuid` CHAR(128) NOT NULL COLLATE 'utf8_general_ci',
	`user_uuid` CHAR(128) NOT NULL COLLATE 'utf8_general_ci',
	`content` VARCHAR(512) NOT NULL COLLATE 'utf8_general_ci',
	`is_read` INT(11) NOT NULL,
	`create_date` INT(20) NOT NULL,
	`modified_date` INT(20) NOT NULL,
	`user_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_image_latest_collection 结构
DROP VIEW IF EXISTS `view_image_latest_collection`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_image_latest_collection` (
	`image_uuid` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(512) NOT NULL COLLATE 'utf8_general_ci',
	`width` INT(11) NOT NULL,
	`height` INT(11) NOT NULL,
	`create_date` INT(11) NOT NULL,
	`modified_date` INT(11) NOT NULL,
	`file_name` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`thumbnail` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`user_uuid` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`brander_count` INT(20) NOT NULL,
	`user_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_user_follower_collection 结构
DROP VIEW IF EXISTS `view_user_follower_collection`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_user_follower_collection` (
	`user_id` INT(11) NOT NULL,
	`user_uuid` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`facebook_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`facebook_icon` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci',
	`email` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`firstname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`lastname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`location` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`longtitude` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`latitude` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`city` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`state` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`country` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`phone` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`image_latest` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`images` INT(20) NOT NULL,
	`create_date` INT(20) NOT NULL,
	`modified_date` INT(20) NOT NULL,
	`comment_count` INT(20) NOT NULL,
	`brander_count` INT(20) NOT NULL,
	`follower_count` INT(20) NOT NULL,
	`is_mutual` INT(11) NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_user_following_collection 结构
DROP VIEW IF EXISTS `view_user_following_collection`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_user_following_collection` (
	`user_id` INT(11) NOT NULL,
	`user_uuid` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`facebook_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`facebook_icon` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci',
	`email` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`firstname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`lastname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`location` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`longtitude` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`latitude` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`city` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`state` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`country` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`phone` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`image_latest` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`images` INT(20) NOT NULL,
	`create_date` INT(20) NOT NULL,
	`modified_date` INT(20) NOT NULL,
	`comment_count` INT(20) NOT NULL,
	`brander_count` INT(20) NOT NULL,
	`follower_count` INT(20) NOT NULL,
	`is_mutual` INT(11) NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_image_brander_collection 结构
DROP VIEW IF EXISTS `view_image_brander_collection`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_image_brander_collection`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` VIEW `view_image_brander_collection` AS select `usr`.`user_id` AS `user_id`,`usr`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `facebook_token`,`usr`.`facebook_icon` AS `facebook_icon`,`usr`.`username` AS `username`,`usr`.`email` AS `email`,`usr`.`password` AS `password`,`usr`.`firstname` AS `firstname`,`usr`.`lastname` AS `lastname`,`usr`.`fullname` AS `fullname`,`usr`.`location` AS `location`,`usr`.`longtitude` AS `longtitude`,`usr`.`latitude` AS `latitude`,`usr`.`city` AS `city`,`usr`.`state` AS `state`,`usr`.`country` AS `country`,`usr`.`phone` AS `phone`,`usr`.`image_latest` AS `image_latest`,`usr`.`images` AS `images`,`usr`.`create_date` AS `create_date`,`usr`.`modified_date` AS `modified_date`,`usr`.`comment_count` AS `comment_count`,`usr`.`brander_count` AS `brander_count`,`usr`.`follower_count` AS `follower_count`,`imgb`.`create_date` AS `date_added` from (`image_brander` `imgb` join `user` `usr` on((`imgb`.`user_uuid` = `usr`.`user_uuid`))) order by `imgb`.`create_date` ;


-- 导出  视图 gajeapp.view_image_comment_collection 结构
DROP VIEW IF EXISTS `view_image_comment_collection`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_image_comment_collection`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` VIEW `view_image_comment_collection` AS select `cmt`.`comment_id` AS `comment_id`,`cmt`.`comment_uuid` AS `comment_uuid`,`cmt`.`user_uuid` AS `user_uuid`,`cmt`.`content` AS `content`,`cmt`.`is_read` AS `is_read`,`cmt`.`create_date` AS `create_date`,`cmt`.`modified_date` AS `modified_date`,`usr`.`facebook_token` AS `user_token`,`usr`.`fullname` AS `fullname`,`usr`.`username` AS `username` from ((`image_comment` `imgc` join `comment` `cmt` on((`imgc`.`comment_uuid` = `cmt`.`comment_uuid`))) join `user` `usr` on((`cmt`.`user_uuid` = `usr`.`user_uuid`))) order by `cmt`.`create_date` ;


-- 导出  视图 gajeapp.view_image_latest_collection 结构
DROP VIEW IF EXISTS `view_image_latest_collection`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_image_latest_collection`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` VIEW `view_image_latest_collection` AS select `img`.`image_uuid` AS `image_uuid`,`img`.`name` AS `name`,`img`.`description` AS `description`,`img`.`width` AS `width`,`img`.`height` AS `height`,`img`.`create_date` AS `create_date`,`img`.`modified_date` AS `modified_date`,`img`.`file_name` AS `file_name`,`img`.`thumbnail` AS `thumbnail`,`img`.`user_uuid` AS `user_uuid`, `img`.`brander_count` AS `brander_count`, `usr`.`facebook_token` AS `user_token`,`usr`.`fullname` AS `fullname`,`usr`.`username` AS `username` from (`image` `img` join `user` `usr` on((`img`.`user_uuid` = `usr`.`user_uuid`))) order by `img`.`modified_date` ;


-- 导出  视图 gajeapp.view_user_follower_collection 结构
DROP VIEW IF EXISTS `view_user_follower_collection`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_user_follower_collection`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_user_follower_collection` AS select distinct `usr`.`user_id` AS `user_id`,`usr`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `facebook_token`,`usr`.`facebook_icon` AS `facebook_icon`,`usr`.`username` AS `username`,`usr`.`email` AS `email`,`usr`.`password` AS `password`,`usr`.`firstname` AS `firstname`,`usr`.`lastname` AS `lastname`,`usr`.`fullname` AS `fullname`,`usr`.`location` AS `location`,`usr`.`longtitude` AS `longtitude`,`usr`.`latitude` AS `latitude`,`usr`.`city` AS `city`,`usr`.`state` AS `state`,`usr`.`country` AS `country`,`usr`.`phone` AS `phone`,`usr`.`image_latest` AS `image_latest`,`usr`.`images` AS `images`,`usr`.`create_date` AS `create_date`,`usr`.`modified_date` AS `modified_date`,`usr`.`comment_count` AS `comment_count`,`usr`.`brander_count` AS `brander_count`,`usr`.`follower_count` AS `follower_count`,`fol`.`is_mutual` AS `is_mutual` from (`user` `usr` join `user_follow` `fol` on((`usr`.`user_uuid` = `fol`.`user_following_uuid`))) order by `fol`.`create_date` desc ;


-- 导出  视图 gajeapp.view_user_following_collection 结构
DROP VIEW IF EXISTS `view_user_following_collection`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_user_following_collection`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_user_following_collection` AS select distinct `usr`.`user_id` AS `user_id`,`usr`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `facebook_token`,`usr`.`facebook_icon` AS `facebook_icon`,`usr`.`username` AS `username`,`usr`.`email` AS `email`,`usr`.`password` AS `password`,`usr`.`firstname` AS `firstname`,`usr`.`lastname` AS `lastname`,`usr`.`fullname` AS `fullname`,`usr`.`location` AS `location`,`usr`.`longtitude` AS `longtitude`,`usr`.`latitude` AS `latitude`,`usr`.`city` AS `city`,`usr`.`state` AS `state`,`usr`.`country` AS `country`,`usr`.`phone` AS `phone`,`usr`.`image_latest` AS `image_latest`,`usr`.`images` AS `images`,`usr`.`create_date` AS `create_date`,`usr`.`modified_date` AS `modified_date`,`usr`.`comment_count` AS `comment_count`,`usr`.`brander_count` AS `brander_count`,`usr`.`follower_count` AS `follower_count`,`fol`.`is_mutual` AS `is_mutual` from (`user` `usr` join `user_follow` `fol` on((`usr`.`user_uuid` = `fol`.`user_followed_uuid`))) order by `fol`.`create_date` desc ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
