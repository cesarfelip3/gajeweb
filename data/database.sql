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
  `comment_uuid` char(128) DEFAULT NULL,
  `user_uuid` char(128) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `create_date` int(20) DEFAULT NULL,
  `modified_date` int(20) DEFAULT NULL,
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
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image 的数据：~0 rows (大约)
DELETE FROM `image`;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


-- 导出  表 gajeapp.image_brander 结构
DROP TABLE IF EXISTS `image_brander`;
CREATE TABLE IF NOT EXISTS `image_brander` (
  `image_brander_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_uuid` char(128) NOT NULL,
  `user_uuid` char(128) NOT NULL,
  `create_date` int(20) NOT NULL,
  PRIMARY KEY (`image_brander_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image_brander 的数据：~0 rows (大约)
DELETE FROM `image_brander`;
/*!40000 ALTER TABLE `image_brander` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_brander` ENABLE KEYS */;


-- 导出  表 gajeapp.image_comment 结构
DROP TABLE IF EXISTS `image_comment`;
CREATE TABLE IF NOT EXISTS `image_comment` (
  `image_comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_uuid` char(50) NOT NULL,
  `image_uuid` char(50) NOT NULL,
  PRIMARY KEY (`image_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.image_comment 的数据：~0 rows (大约)
DELETE FROM `image_comment`;
/*!40000 ALTER TABLE `image_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_comment` ENABLE KEYS */;


-- 导出  表 gajeapp.theme 结构
DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `theme_id` int(20) NOT NULL AUTO_INCREMENT,
  `theme_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text DEFAULT '',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.theme 的数据：~0 rows (大约)
DELETE FROM `theme`;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;

-- 导出  表 gajeapp.theme 结构
DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `note_id` int(20) NOT NULL AUTO_INCREMENT,
  `note_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.theme 的数据：~0 rows (大约)
DELETE FROM `theme`;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;


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
  `comment_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user 的数据：~0 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 gajeapp.user_follow 结构
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE IF NOT EXISTS `user_follow` (
  `user_follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_followed_uuid` char(50) NOT NULL,
  `user_following_uuid` char(50) NOT NULL,
  `is_mutual` int(20) NOT NULL DEFAULT '0',
  `create_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user_follow 的数据：~0 rows (大约)
DELETE FROM `user_follow`;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- 导出  表 gajeapp.user_follow 结构
DROP TABLE IF EXISTS `user_block`;
CREATE TABLE IF NOT EXISTS `user_block` (
  `user_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(50) NOT NULL,
  `user_block_uuid` char(50) NOT NULL,
  `create_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  gajeapp.user_follow 的数据：~0 rows (大约)
DELETE FROM `user_block`;