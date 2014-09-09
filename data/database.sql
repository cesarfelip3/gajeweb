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
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image 的数据：~0 rows (大约)
DELETE FROM `image`;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


-- 导出  表 gajeapp.image_brander 结构
CREATE TABLE IF NOT EXISTS `image_brander` (
  `image_brander_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_uuid` char(128) NOT NULL,
  `user_uuid` char(128) NOT NULL,
  `is_read` tinyint(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  PRIMARY KEY (`image_brander_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image_brander 的数据：~0 rows (大约)
DELETE FROM `image_brander`;
/*!40000 ALTER TABLE `image_brander` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_brander` ENABLE KEYS */;


-- 导出  表 gajeapp.image_comment 结构
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
CREATE TABLE IF NOT EXISTS `theme` (
  `theme_id` int(20) NOT NULL AUTO_INCREMENT,
  `theme_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.theme 的数据：~0 rows (大约)
DELETE FROM `theme`;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;


-- 导出  表 gajeapp.update 结构
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
  `comment_id` int(20) NOT NULL DEFAULT '0',
  `brander_id` int(20) NOT NULL DEFAULT '0',
  `follower_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user 的数据：~0 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 gajeapp.user_block 结构
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


-- 导出  表 gajeapp.user_follow 结构
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
	`comment_id` INT(20) NOT NULL,
	`brander_id` INT(20) NOT NULL,
	`follower_id` INT(20) NOT NULL,
	`date_added` INT(11) NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_image_comment_collection 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_image_comment_collection` (
	`comment_id` INT(20) NOT NULL,
	`comment_uuid` CHAR(128) NOT NULL COLLATE 'utf8_general_ci',
	`user_uuid` CHAR(128) NOT NULL COLLATE 'utf8_general_ci',
	`content` VARCHAR(512) NOT NULL COLLATE 'utf8_general_ci',
	`create_date` INT(20) NOT NULL,
	`modified_date` INT(20) NOT NULL,
	`user_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_image_latest_collection 结构
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
	`user_token` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`fullname` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_user_follower_collection 结构
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
	`comment_id` INT(20) NOT NULL,
	`brander_id` INT(20) NOT NULL,
	`follower_id` INT(20) NOT NULL,
	`is_mutual` INT(11) NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_user_following_collection 结构
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
	`comment_id` INT(20) NOT NULL,
	`brander_id` INT(20) NOT NULL,
	`follower_id` INT(20) NOT NULL,
	`is_mutual` INT(11) NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 gajeapp.view_image_brander_collection 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_image_brander_collection`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` VIEW `view_image_brander_collection` AS SELECT 
	usr.*, 
	imgb.create_date AS date_added 
FROM image_brander imgb INNER JOIN user usr 
ON imgb.user_uuid=usr.user_uuid 
ORDER BY imgb.create_date ASC ;


-- 导出  视图 gajeapp.view_image_comment_collection 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_image_comment_collection`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` VIEW `view_image_comment_collection` AS SELECT 
	cmt.*,
	usr.facebook_token AS user_token, 
	usr.fullname AS fullname, 
	usr.username AS username	
FROM image_comment imgc INNER JOIN comment cmt 
ON imgc.comment_uuid=cmt.comment_uuid 
INNER JOIN user usr 
ON cmt.user_uuid=usr.user_uuid 
ORDER BY cmt.create_date ASC ;


-- 导出  视图 gajeapp.view_image_latest_collection 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_image_latest_collection`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` VIEW `view_image_latest_collection` AS SELECT 
	img.image_uuid, 
	img.name, 
	img.description, 
	img.width, 
	img.height, 
	img.create_date, 
	img.modified_date, 
	img.file_name, 
	img.thumbnail,
	img.user_uuid AS user_uuid, 
	usr.facebook_token AS user_token,
	usr.fullname AS fullname, 
	usr.username AS username 
FROM image img INNER JOIN user usr 
ON img.user_uuid=usr.user_uuid 
ORDER BY img.modified_date ;


-- 导出  视图 gajeapp.view_user_follower_collection 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_user_follower_collection`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_user_follower_collection` AS SELECT DISTINCT 
	usr.*, 
	fol.is_mutual AS is_mutual 
FROM user usr INNER JOIN user_follow fol 
ON usr.user_uuid=fol.user_following_uuid 
ORDER BY fol.create_date DESC ;


-- 导出  视图 gajeapp.view_user_following_collection 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_user_following_collection`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_user_following_collection` AS SELECT DISTINCT 
	usr.*, 
	fol.is_mutual AS is_mutual 
FROM user usr INNER JOIN user_follow fol 
ON usr.user_uuid=fol.user_followed_uuid 
ORDER BY fol.create_date DESC ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
