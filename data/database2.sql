-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gajeapp
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `admin_id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_uuid` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `create_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_uuid` char(128) NOT NULL,
  `user_uuid` char(128) NOT NULL,
  `content` varchar(512) NOT NULL,
  `is_read` int(11) NOT NULL,
  `create_date` int(20) NOT NULL,
  `modified_date` int(20) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (2,'544efa05cc2a5','544ef98e33706','544ef69da4a6f','','<Image: 0x14ee0c40>','image/jpeg','','',0,2448,3264,'image544efa05cc13b_280x373.jpg','image544efa05cc13b.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,2,0,1414461957,1414461957),(3,'544f5eca6ff2a','544f5e9946ac5','544ef69da4a6f','','<Image: 0x7a0d4880>','image/jpeg','','',0,1008,669,'image544f5eca6fdbf_280x185.jpg','image544f5eca6fdbf.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,0,0,1414487754,1414487754),(4,'544f5fbcd8a7b','544f5e9946ac5','544ef69da4a6f','','','image/jpeg','','',0,1500,1001,'image544f5fbcd8916_280x186.jpg','image544f5fbcd8916.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,0,0,1414487996,1414487996);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_brander`
--

DROP TABLE IF EXISTS `image_brander`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_brander` (
  `image_brander_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_uuid` char(128) NOT NULL,
  `user_uuid` char(128) NOT NULL,
  `is_read` tinyint(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  PRIMARY KEY (`image_brander_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_brander`
--

LOCK TABLES `image_brander` WRITE;
/*!40000 ALTER TABLE `image_brander` DISABLE KEYS */;
INSERT INTO `image_brander` VALUES (1,'544efa05cc2a5','544ef5981c4a9',0,1414462061),(2,'544efa05cc2a5','544f5e9946ac5',0,1414488104);
/*!40000 ALTER TABLE `image_brander` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_comment`
--

DROP TABLE IF EXISTS `image_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_comment` (
  `image_comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_uuid` char(50) NOT NULL,
  `image_uuid` char(50) NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_comment`
--

LOCK TABLES `image_comment` WRITE;
/*!40000 ALTER TABLE `image_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(20) NOT NULL AUTO_INCREMENT,
  `note_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `theme_id` int(20) NOT NULL AUTO_INCREMENT,
  `theme_uuid` char(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `create_date` int(11) NOT NULL DEFAULT '0',
  `modified_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'544ef69da4a6f','Falling Autumn','',1414461085,1414461085);
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update`
--

DROP TABLE IF EXISTS `update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update` (
  `update_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uuid` char(32) NOT NULL DEFAULT '0',
  `object_uuid` char(32) NOT NULL,
  `type` char(32) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update`
--

LOCK TABLES `update` WRITE;
/*!40000 ALTER TABLE `update` DISABLE KEYS */;
/*!40000 ALTER TABLE `update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'544ef5981c4a9','100001024326699','http://graph.facebook.com/100001024326699/picture?type=large','Grant','grfawson89@gmail.com','','','','Grant Fawson','','','','','','','','',0,1414460824,1414460824,0,0,0),(2,'544ef98e33706','10152813928988035','http://graph.facebook.com/10152813928988035/picture?type=large','CÃ©sar','cesarfelip3@gmail.com','','','','CÃ©sar Felipe Alves','','','','','','','','',0,1414461838,1414461838,0,0,0),(3,'544f5e9946ac5','1486770218272211','http://graph.facebook.com/1486770218272211/picture?type=large','Felipe','felip3app@gmail.com','','','','Felipe Alves','','','','','','','','',0,1414487705,1414487946,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_block`
--

DROP TABLE IF EXISTS `user_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_block` (
  `user_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(50) NOT NULL,
  `user_block_uuid` char(50) NOT NULL,
  `create_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_block`
--

LOCK TABLES `user_block` WRITE;
/*!40000 ALTER TABLE `user_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_exclude_image`
--

DROP TABLE IF EXISTS `user_exclude_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exclude_image` (
  `user_exclude_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(50) NOT NULL,
  `image_uuid` char(50) NOT NULL,
  `create_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_exclude_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_exclude_image`
--

LOCK TABLES `user_exclude_image` WRITE;
/*!40000 ALTER TABLE `user_exclude_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_exclude_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follow`
--

DROP TABLE IF EXISTS `user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_follow` (
  `user_follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_followed_uuid` char(50) NOT NULL,
  `user_following_uuid` char(50) NOT NULL,
  `is_mutual` int(11) NOT NULL DEFAULT '0',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follow`
--

LOCK TABLES `user_follow` WRITE;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_update`
--

DROP TABLE IF EXISTS `user_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_update` (
  `user_update_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_uuid` char(32) NOT NULL,
  `user_from_uuid` char(32) NOT NULL,
  `type` enum('image.comment','image.brander','user.follower') NOT NULL DEFAULT 'image.comment',
  `reference_uuid` char(32) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_update`
--

LOCK TABLES `user_update` WRITE;
/*!40000 ALTER TABLE `user_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_image_brander_collection`
--

DROP TABLE IF EXISTS `view_image_brander_collection`;
/*!50001 DROP VIEW IF EXISTS `view_image_brander_collection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_image_brander_collection` (
  `user_id` tinyint NOT NULL,
  `user_uuid` tinyint NOT NULL,
  `facebook_token` tinyint NOT NULL,
  `facebook_icon` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `longtitude` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `image_latest` tinyint NOT NULL,
  `images` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `modified_date` tinyint NOT NULL,
  `comment_count` tinyint NOT NULL,
  `brander_count` tinyint NOT NULL,
  `follower_count` tinyint NOT NULL,
  `date_added` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_image_comment_collection`
--

DROP TABLE IF EXISTS `view_image_comment_collection`;
/*!50001 DROP VIEW IF EXISTS `view_image_comment_collection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_image_comment_collection` (
  `comment_id` tinyint NOT NULL,
  `comment_uuid` tinyint NOT NULL,
  `user_uuid` tinyint NOT NULL,
  `content` tinyint NOT NULL,
  `is_read` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `modified_date` tinyint NOT NULL,
  `user_token` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `username` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_image_latest_collection`
--

DROP TABLE IF EXISTS `view_image_latest_collection`;
/*!50001 DROP VIEW IF EXISTS `view_image_latest_collection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_image_latest_collection` (
  `image_uuid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `width` tinyint NOT NULL,
  `height` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `modified_date` tinyint NOT NULL,
  `file_name` tinyint NOT NULL,
  `thumbnail` tinyint NOT NULL,
  `user_uuid` tinyint NOT NULL,
  `user_token` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `username` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_follower_collection`
--

DROP TABLE IF EXISTS `view_user_follower_collection`;
/*!50001 DROP VIEW IF EXISTS `view_user_follower_collection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_follower_collection` (
  `user_id` tinyint NOT NULL,
  `user_uuid` tinyint NOT NULL,
  `facebook_token` tinyint NOT NULL,
  `facebook_icon` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `longtitude` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `image_latest` tinyint NOT NULL,
  `images` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `modified_date` tinyint NOT NULL,
  `comment_count` tinyint NOT NULL,
  `brander_count` tinyint NOT NULL,
  `follower_count` tinyint NOT NULL,
  `is_mutual` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_following_collection`
--

DROP TABLE IF EXISTS `view_user_following_collection`;
/*!50001 DROP VIEW IF EXISTS `view_user_following_collection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_following_collection` (
  `user_id` tinyint NOT NULL,
  `user_uuid` tinyint NOT NULL,
  `facebook_token` tinyint NOT NULL,
  `facebook_icon` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `longtitude` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `image_latest` tinyint NOT NULL,
  `images` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `modified_date` tinyint NOT NULL,
  `comment_count` tinyint NOT NULL,
  `brander_count` tinyint NOT NULL,
  `follower_count` tinyint NOT NULL,
  `is_mutual` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_image_brander_collection`
--

/*!50001 DROP TABLE IF EXISTS `view_image_brander_collection`*/;
/*!50001 DROP VIEW IF EXISTS `view_image_brander_collection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_image_brander_collection` AS select `usr`.`user_id` AS `user_id`,`usr`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `facebook_token`,`usr`.`facebook_icon` AS `facebook_icon`,`usr`.`username` AS `username`,`usr`.`email` AS `email`,`usr`.`password` AS `password`,`usr`.`firstname` AS `firstname`,`usr`.`lastname` AS `lastname`,`usr`.`fullname` AS `fullname`,`usr`.`location` AS `location`,`usr`.`longtitude` AS `longtitude`,`usr`.`latitude` AS `latitude`,`usr`.`city` AS `city`,`usr`.`state` AS `state`,`usr`.`country` AS `country`,`usr`.`phone` AS `phone`,`usr`.`image_latest` AS `image_latest`,`usr`.`images` AS `images`,`usr`.`create_date` AS `create_date`,`usr`.`modified_date` AS `modified_date`,`usr`.`comment_count` AS `comment_count`,`usr`.`brander_count` AS `brander_count`,`usr`.`follower_count` AS `follower_count`,`imgb`.`create_date` AS `date_added` from (`image_brander` `imgb` join `user` `usr` on((`imgb`.`user_uuid` = `usr`.`user_uuid`))) order by `imgb`.`create_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_image_comment_collection`
--

/*!50001 DROP TABLE IF EXISTS `view_image_comment_collection`*/;
/*!50001 DROP VIEW IF EXISTS `view_image_comment_collection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_image_comment_collection` AS select `cmt`.`comment_id` AS `comment_id`,`cmt`.`comment_uuid` AS `comment_uuid`,`cmt`.`user_uuid` AS `user_uuid`,`cmt`.`content` AS `content`,`cmt`.`is_read` AS `is_read`,`cmt`.`create_date` AS `create_date`,`cmt`.`modified_date` AS `modified_date`,`usr`.`facebook_token` AS `user_token`,`usr`.`fullname` AS `fullname`,`usr`.`username` AS `username` from ((`image_comment` `imgc` join `comment` `cmt` on((`imgc`.`comment_uuid` = `cmt`.`comment_uuid`))) join `user` `usr` on((`cmt`.`user_uuid` = `usr`.`user_uuid`))) order by `cmt`.`create_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_image_latest_collection`
--

/*!50001 DROP TABLE IF EXISTS `view_image_latest_collection`*/;
/*!50001 DROP VIEW IF EXISTS `view_image_latest_collection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_image_latest_collection` AS select `img`.`image_uuid` AS `image_uuid`,`img`.`name` AS `name`,`img`.`description` AS `description`,`img`.`width` AS `width`,`img`.`height` AS `height`,`img`.`create_date` AS `create_date`,`img`.`modified_date` AS `modified_date`,`img`.`file_name` AS `file_name`,`img`.`thumbnail` AS `thumbnail`,`img`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `user_token`,`usr`.`fullname` AS `fullname`,`usr`.`username` AS `username` from (`image` `img` join `user` `usr` on((`img`.`user_uuid` = `usr`.`user_uuid`))) order by `img`.`modified_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_follower_collection`
--

/*!50001 DROP TABLE IF EXISTS `view_user_follower_collection`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_follower_collection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_follower_collection` AS select distinct `usr`.`user_id` AS `user_id`,`usr`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `facebook_token`,`usr`.`facebook_icon` AS `facebook_icon`,`usr`.`username` AS `username`,`usr`.`email` AS `email`,`usr`.`password` AS `password`,`usr`.`firstname` AS `firstname`,`usr`.`lastname` AS `lastname`,`usr`.`fullname` AS `fullname`,`usr`.`location` AS `location`,`usr`.`longtitude` AS `longtitude`,`usr`.`latitude` AS `latitude`,`usr`.`city` AS `city`,`usr`.`state` AS `state`,`usr`.`country` AS `country`,`usr`.`phone` AS `phone`,`usr`.`image_latest` AS `image_latest`,`usr`.`images` AS `images`,`usr`.`create_date` AS `create_date`,`usr`.`modified_date` AS `modified_date`,`usr`.`comment_count` AS `comment_count`,`usr`.`brander_count` AS `brander_count`,`usr`.`follower_count` AS `follower_count`,`fol`.`is_mutual` AS `is_mutual` from (`user` `usr` join `user_follow` `fol` on((`usr`.`user_uuid` = `fol`.`user_following_uuid`))) order by `fol`.`create_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_following_collection`
--

/*!50001 DROP TABLE IF EXISTS `view_user_following_collection`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_following_collection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_following_collection` AS select distinct `usr`.`user_id` AS `user_id`,`usr`.`user_uuid` AS `user_uuid`,`usr`.`facebook_token` AS `facebook_token`,`usr`.`facebook_icon` AS `facebook_icon`,`usr`.`username` AS `username`,`usr`.`email` AS `email`,`usr`.`password` AS `password`,`usr`.`firstname` AS `firstname`,`usr`.`lastname` AS `lastname`,`usr`.`fullname` AS `fullname`,`usr`.`location` AS `location`,`usr`.`longtitude` AS `longtitude`,`usr`.`latitude` AS `latitude`,`usr`.`city` AS `city`,`usr`.`state` AS `state`,`usr`.`country` AS `country`,`usr`.`phone` AS `phone`,`usr`.`image_latest` AS `image_latest`,`usr`.`images` AS `images`,`usr`.`create_date` AS `create_date`,`usr`.`modified_date` AS `modified_date`,`usr`.`comment_count` AS `comment_count`,`usr`.`brander_count` AS `brander_count`,`usr`.`follower_count` AS `follower_count`,`fol`.`is_mutual` AS `is_mutual` from (`user` `usr` join `user_follow` `fol` on((`usr`.`user_uuid` = `fol`.`user_followed_uuid`))) order by `fol`.`create_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-28  9:39:19
