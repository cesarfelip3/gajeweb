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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'5471143a521de','5471133f54b26','haha, gross, I love it',0,1416696890,1416696890),(2,'547123e57a7a5','54712234584b8','those trees are beautiful! ;)',0,1416700901,1416700901),(3,'547124427f70a','54712234584b8','ha! you guys could be related!...... oh, I guess you guys are.',0,1416700994,1416700994),(4,'54712e04b3e0e','5471243f03e9e','yes those are nice trees, good job Grant!!',0,1416703492,1416703492),(5,'547152eb41edf','547112e50f4b7','you are really cute ',0,1416712939,1416712939),(6,'5472c29f76727','54712e3d93fef','wow beautiful',0,1416807071,1416807071),(7,'5473f0c3abb42','544ef98e33706','testing ',0,1416884419,1416884419),(8,'5473f32525f2c','544ef98e33706','other comment ',0,1416885029,1416885029),(9,'5473f359b2333','544f5e9946ac5','tested',0,1416885081,1416885081),(10,'54740811db2ab','5473f9c164582','catz',0,1416890385,1416890385),(11,'54740b3b2c460','54712234584b8','nice',0,1416891195,1416891195),(12,'547515c790f2a','5471133f54b26','where was this at?',0,1416959431,1416959431),(13,'5476d86c09f95','5472bb923d889','wow! best pic on gaje so far... hands down ',0,1417074796,1417074796),(14,'54788a1bbc1e3','544f5e9946ac5','nice',0,1417185819,1417185819),(15,'5478b6ed588a2','5471133f54b26','ma Maaan',0,1417197293,1417197293),(16,'5478f14e55f09','5472bb923d889','super smash in the theatre room',0,1417212238,1417212238),(17,'547d565a401f9','54712e3d93fef','hang out with my girls at the Hmong New Year',0,1417500250,1417500250),(18,'5484f2ae4e673','5471133f54b26','That\'s so sick dude',0,1417999022,1417999022),(19,'548506feb1542','5471133f54b26','That looks so sick. Like a ghost.',0,1418004222,1418004222),(20,'54850eb2caf8b','547111c1813b1','Ready for Santa!!',0,1418006194,1418006194),(21,'5485107c52067','5471133f54b26','haha, love it',0,1418006652,1418006652),(22,'5485155b11093','546fdc354ed26','very pretty.',0,1418007899,1418007899),(23,'548515ba010d8','546fdc354ed26','love it.',0,1418007994,1418007994);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (38,'5484f02fe0564','546eaec1847c8','5484eeb71ceb6','','','image/jpeg','','',0,1936,2592,'image5484f02fe036a_280x374.jpg','image5484f02fe036a.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,1,0,1417998383,1417998383),(39,'5484f27ab4e4f','5471133f54b26','5484eeb71ceb6','','','image/jpeg','','',0,3264,2448,'image5484f27ab4c68_280x210.jpg','image5484f27ab4c68.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,0,0,1417998970,1417998970),(41,'5484f957ae470','5484f7bded9c2','5484eeb71ceb6','Christmas Wreath','First Holiday decoration','image/jpeg','','',0,2448,3264,'image5484f957ae289_280x373.jpg','image5484f957ae289.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,2,0,1418000727,1418000727),(42,'5484ff35731b5','546fdc354ed26','5484eeb71ceb6','A Precious Gift','Grandson in gift bag.','image/jpeg','','',0,600,800,'image5484ff3572eee_280x373.jpg','image5484ff3572eee.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,1,0,1418002229,1418002229),(44,'548504a968680','5471133f54b26','5484eeb71ceb6','','I thought this was cool. It looks like a gingerbread house. ','image/jpeg','','',0,3264,2448,'image548504a968457_280x210.jpg','image548504a968457.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,1,0,1418003625,1418003625),(45,'548505a4ef202','548504aea1a47','5484eeb71ceb6','','','image/jpeg','','',0,2448,2446,'image548505a4ef004_280x279.jpg','image548505a4ef004.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,2,0,1418003876,1418003876),(46,'54850e7e141f5','547111c1813b1','5484eeb71ceb6','','','image/jpeg','','',0,750,1334,'image54850e7e13fff_280x498.jpg','image54850e7e13fff.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,1,0,1418006142,1418006142),(47,'548512f68d063','546eaec1847c8','5484eeb71ceb6','','','image/jpeg','','',0,3264,2448,'image548512f68ce09_280x210.jpg','image548512f68ce09.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,2,0,1418007286,1418007286),(48,'5485132496b33','546eaec1847c8','5484eeb71ceb6','','','image/jpeg','','',0,3264,2448,'image548513249698c_280x210.jpg','image548513249698c.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,1,0,1418007332,1418007332),(49,'54851d72b3b30','54710d914e44d','5484eeb71ceb6','','','image/jpeg','','',0,2448,3264,'image54851d72b38c4_280x373.jpg','image54851d72b38c4.jpg','/home/hellogajeapp/public_html/upload/image/',0,0,1,0,1418009970,1418009970);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_brander`
--

LOCK TABLES `image_brander` WRITE;
/*!40000 ALTER TABLE `image_brander` DISABLE KEYS */;
INSERT INTO `image_brander` VALUES (35,'5484f02fe0564','5471133f54b26',0,1417999000),(36,'5484f2ba9714e','5484f7bded9c2',1,1418000413),(37,'5484f2ba9714e','5471133f54b26',1,1418000745),(38,'5484f957ae470','5471133f54b26',1,1418000757),(39,'5484f957ae470','546fdc354ed26',0,1418000903),(40,'5484f2ba9714e','546fdc354ed26',1,1418000912),(41,'548505a4ef202','5471133f54b26',0,1418004224),(42,'54850e7e141f5','5471133f54b26',0,1418006652),(43,'5484ff35731b5','546eaec1847c8',0,1418007033),(44,'548504a968680','546eaec1847c8',0,1418007051),(45,'548505a4ef202','546fdc354ed26',0,1418007875),(46,'548512f68d063','546fdc354ed26',0,1418008012),(47,'548512f68d063','5471133f54b26',0,1418008203),(48,'5485132496b33','5471133f54b26',0,1418008246),(49,'54851d72b3b30','5471133f54b26',0,1418010561);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_comment`
--

LOCK TABLES `image_comment` WRITE;
/*!40000 ALTER TABLE `image_comment` DISABLE KEYS */;
INSERT INTO `image_comment` VALUES (18,'5484f2ae4e673','5484f02fe0564',0,0),(19,'548506feb1542','548505a4ef202',0,0),(20,'54850eb2caf8b','54850e7e141f5',0,0),(21,'5485107c52067','54850e7e141f5',0,0),(22,'5485155b11093','548505a4ef202',0,0),(23,'548515ba010d8','54850e7e141f5',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,'546fdd187bcaa','Fall','There it is',1416617240,1416617240),(2,'5470faa912ada','thyif','kuguyg',1416690345,1416690345),(3,'5470fe80cbce2','To Good Beginnings','',1416691328,1416691328),(4,'5470feb07e08c','Here\'s to good beginnings','Here\'s to good beginnings',1416691376,1416691376),(5,'547103bcabe4d','Here\'s to good beginnings','Here\'s to good beginnings\r\n\r\nGAJE began on the premise that there is someone, somewhere, going through the same experience as you and can relate to the situation.  Whether good, bad, happy or sad, we can lift each other.  That is our goal at GAJE, to realize that there are people in the world who care.\r\n\r\nWe will change the theme one to every two weeks.  Themes are chosen from a variety of topics.  If anyone has a good idea for a theme however, please email us at gajellcUT@gmail.com, and we would love to make your idea the headline.\r\n\r\nWith thanksgiving here, there are 1,000 ways to celebrate the food and festivities.  What\'s your version of celebration?\r\n\r\n\r\n\r\n',1416692668,1416692668),(6,'54711d578509f','Here\'s to good beginnings','Here\'s to good beginnings \r\n\r\nGAJE began on the premise that there is someone, somewhere, going through the same experience as you and can relate to the situation. Whether good, bad, happy or sad, we can lift each other. That is our goal at GAJE, to realize that there are people in the world who care.\r\n\r\n We will change the theme one to every two weeks. Themes are chosen from a variety of topics. If anyone has a good idea for a theme however, please email us at gajellcUT@gmail.com, and we would love to make your idea the headline. \r\n\r\nWith thanksgiving here, there are 1,000 ways to celebrate the food and festivities. What\'s your version of celebration?\r\n\r\nSo whether you \"brand\" a photo to give your stamp of approval, or \"track\" someone for new updates, let people know you\'re there.',1416699223,1416699223),(7,'54711ed94816b','	Here\'s to good beginnings','Here\'s to good beginnings GAJE began on the premise that there is someone, somewhere, going through the same experience as you and can relate to the situation. Whether good, bad, happy or sad, we can lift each other. That is our goal at GAJE, to realize that there are people in the world who care. \r\n\r\nWe will change the theme one to every two weeks. Themes are chosen from a variety of topics. If anyone has a good idea for a theme however, please email us at gajellcUT@gmail.com, and we would love to make your idea the headline. \r\n\r\nWith thanksgiving here, there are 1,000 ways to celebrate the food and festivities. What\'s your version of celebration? \r\n\r\nSo whether you \"brand\" a photo to give your stamp of approval or \"track\" someone for new updates, let people know you\'re there.',1416699609,1416699609),(8,'54712da0e38a4','Here\'s to good beginnings','Here\'s to good beginnings GAJE began on the premise that there is someone, somewhere, going through the same experience as you and can relate to the situation. Whether good, bad, happy or sad, we can lift each other. That is our goal at GAJE, to realize that there are people in the world who care. \r\n\r\nWe are a themed photo app where you post pictures to the themes. We will change the theme one to every two weeks. Themes are chosen from a variety of topics. If anyone has a good idea for a theme however, please email us at gajellcUT@gmail.com, and we would love to make your idea the headline.\r\n\r\nWith thanksgiving here, there are 1,000 ways to celebrate the food and festivities. What\'s your version of celebration? \r\n\r\nSo whether you \"brand\" a photo to give your stamp of approval or \"track\" someone for new updates, let people know you\'re there.',1416703392,1416703392),(9,'5484f58f63d00','In with the new','We will post a new theme about every 1-2 weeks.  With each theme change, photos will get deleted to make room for new moments.  \r\n\r\nWe donâ€™t want to be the only ones deciding the themes, so if you have a good idea, please email us at gajellcUT@gmail.com. We would love to make your idea the headline and give you full credit for the new theme.\r\n\r\nHereâ€™s to good beginnings',1417999759,1417999759);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (7,'5484eeb71ceb6','Deck the Halls','The holiday season is upon us and people everywhere are showing their festive spirit! Show us some decorations: garlands, wreaths, candles and lights. Whether they are yours or a neighbors, donâ€™t hold back.',1417998007,1417998007);
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
  `status` int(20) NOT NULL DEFAULT '1',
  `apn_token` binary(255) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `apn_enable` int(20) NOT NULL DEFAULT '0',
  `apn_date` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'544ef5981c4a9','100001024326699','http://graph.facebook.com/100001024326699/picture?type=large','Grant','grfawson89@gmail.com','','','','Grant Fawson','','','','','','','','',0,1414460824,1414460824,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1415796947),(2,'544ef98e33706','10152813928988035','http://graph.facebook.com/10152813928988035/picture?type=large','CÃ©sar','cesarfelip3@gmail.com','','','','CÃ©sar Felipe Alves','','','','','','','','',0,1414461838,1417552928,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1415796947),(3,'544f5e9946ac5','1486770218272211','http://graph.facebook.com/1486770218272211/picture?type=large','Felipe','felip3app@gmail.com','','','','Felipe Alves','','','','','','','','',0,1414487705,1418046244,0,0,0,1,'83242563def54daf1f78fb56fd9efaffe35324219bbebfdc1ea5e1838cfa2be\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(4,'546bc71d7d0af','477385552400265','http://graph.facebook.com/477385552400265/picture?type=large','Francis','flyflyerson2@gmail.com','','','','Francis Smith','','','','','','','','',0,1416349469,1416605079,0,0,0,1,'154756bab9f52f5c69f287df3eca239696ac81cee551e913dda228460d1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(5,'546eaec1847c8','10152673991601676','http://graph.facebook.com/10152673991601676/picture?type=large','Elliott','elliott.p.morgan@gmail.com','','','','Elliott Morgan','','','','','','','','',0,1416539841,1418007006,0,0,0,1,'42ee5dcbc6d54b725bd3d773d8804bb4e8a948427d3adb5da96f69e6263bf\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(6,'546fdc354ed26','673250796125988','http://graph.facebook.com/673250796125988/picture?type=large','Debra Miller','dmfawson@gmail.com','','','','Debra Miller Fawson','','','','','','','','',0,1416617013,1418001382,0,0,0,1,'7f3fd062d0a29a3b1ed6e0dc8f7814397edcd7de7f4e2cf792cc5681ee6d45a2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(7,'54710d914e44d','1032954513397393','http://graph.facebook.com/1032954513397393/picture?type=large','Scott','bsmaxfield@gmail.com','','','','Scott Maxfield','','','','','','','','',0,1416695185,1418006231,0,0,0,1,'b5d094e833b1482970afb23080fa24953ba3ddbd19ba74b02392eee8a12794\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(8,'54710e0495517','10205513326577786','http://graph.facebook.com/10205513326577786/picture?type=large','McKenzie','mckenziejohn1011@hotmail.com','','','','McKenzie John','','','','','','','','',0,1416695300,1417209953,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(9,'547111c1813b1','754776124570113','http://graph.facebook.com/754776124570113/picture?type=large','Parker','pfawsonjr@gmail.com','','','','Parker Fawson Jr','','','','','','','','',0,1416696257,1418006832,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(10,'547112e50f4b7','10204049646013932','http://graph.facebook.com/10204049646013932/picture?type=large','Rogelio','rogelio@hotmail.de','','','','Rogelio Bonilla','','','','','','','','',0,1416696549,1416859376,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(11,'5471133f54b26','861486813895455','http://graph.facebook.com/861486813895455/picture?type=large','Grant','grfawson89@gmail.com','','','','Grant Fawson','','','','','','','','',0,1416696639,1418018167,0,0,0,1,'3bbd1e167dc7fff131982cfecc67f4c6dd74fcf7f78dc67629b6d5a4b2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(12,'5471138983b0f','10152377390146688','http://graph.facebook.com/10152377390146688/picture?type=large','Brett','bsh805@gmail.com','','','','Brett Hafen','','','','','','','','',0,1416696713,1418006329,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(13,'54711422b832b','10101707164520589','http://graph.facebook.com/10101707164520589/picture?type=large','Craig','cnordo@gmail.com','','','','Craig Nordstrom','','','','','','','','',0,1416696866,1416723606,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(14,'54711c24e74dd','10154897393285574','http://graph.facebook.com/10154897393285574/picture?type=large','Megan','mlindmark@yahoo.com','','','','Megan Lindmark Stucki','','','','','','','','',0,1416698916,1417738911,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(15,'54712234584b8','10152906607667915','http://graph.facebook.com/10152906607667915/picture?type=large','Adam','adam.weston@aggiemail.usu.edu','','','','Adam Weston','','','','','','','','',0,1416700468,1417838231,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(16,'5471243f03e9e','10100715205730714','http://graph.facebook.com/10100715205730714/picture?type=large','Spencer','spencerrdame@gmail.com','','','','Spencer Dame','','','','','','','','',0,1416700991,1418008093,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(17,'54712e3d93fef','790015322244','http://graph.facebook.com/790015322244/picture?type=large','Sia','yang_sia@yahoo.com','','','','Sia Yang','','','','','','','','',0,1416703549,1417499888,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(18,'5471438d88363','10204892777462268','http://graph.facebook.com/10204892777462268/picture?type=large','Shelby','shelbyy.lynn@yahoo.com','','','','Shelby Johnson','','','','','','','','',0,1416709005,1416709005,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,0),(19,'54714712b64c2','766072960106536','http://graph.facebook.com/766072960106536/picture?type=large','Heather','rehtaehsnikwah@yahoo.com','','','','Heather Hawkins','','','','','','','','',0,1416709906,1417983233,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(20,'5471652dc711a','4835945432523','http://graph.facebook.com/4835945432523/picture?type=large','Amber','afgosnell@gmail.com','','','','Amber Fawson Gosnell','','','','','','','','',0,1416717613,1418001959,0,0,0,1,'ac5424d12baee731d031c1adb98b5714d42b280e0cad66988a3df64316f669\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(21,'547176a5bc0df','10154792615425167','http://graph.facebook.com/10154792615425167/picture?type=large','Chia','chiabls@gmail.com','','','','Chia Vang','','','','','','','','',0,1416722085,1418016267,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(22,'547203497137f','10152747273242107','http://graph.facebook.com/10152747273242107/picture?type=large','Paga','pagavang@gmail.com','','','','Paga Vang','','','','','','','','',0,1416758089,1417636197,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(23,'5472171bd3ee0','10152898328249766','http://graph.facebook.com/10152898328249766/picture?type=large','Sydney','sandibabe@gmail.com','','','','Sydney Wallace','','','','','','','','',0,1416763163,1418021734,0,0,0,1,'c9cce9607669ef3fc46813a7c7971bcc38ada46f27d5ba3332422fcbcad80\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(24,'5472bb923d889','10202656723809587','http://graph.facebook.com/10202656723809587/picture?type=large','Jordan','jordandelm@gmail.com','','','','Jordan Elmer','','','','','','','','',0,1416805266,1418012226,0,0,0,1,'6d5273ce3c4e45fb859e856ef4737f63dab7014c7eee446d36046bf5eb86ff3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(25,'5472bc79290ad','10152869554398638','http://graph.facebook.com/10152869554398638/picture?type=large','Sean','seangassaway13@gmail.com','','','','Sean Gassaway','','','','','','','','',0,1416805497,1416805497,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(26,'5473f488449d5','10153214560021729','http://graph.facebook.com/10153214560021729/picture?type=large','Brian','gossie86@hotmail.com','','','','Brian Gosnell','','','','','','','','',0,1416885384,1417609444,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(27,'5473f9c164582','10152876087994485','http://graph.facebook.com/10152876087994485/picture?type=large','Kirsten','schetsophrenic@hotmail.com','','','','Kirsten Schetselaar','','','','','','','','',0,1416886721,1417159069,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(28,'5473fa0342b9d','10153008442733273','http://graph.facebook.com/10153008442733273/picture?type=large','Chelyse','chelyse@gmail.com','','','','Chelyse Henderson','','','','','','','','',0,1416886787,1416886787,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(29,'54776a395cf02','10205358448346167','http://graph.facebook.com/10205358448346167/picture?type=large','Dave','','','','','Dave Noack','','','','','','','','',0,1417112121,1417282968,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(30,'54781ba82fae3','1009423445739807','http://graph.facebook.com/1009423445739807/picture?type=large','Katalina','katalina_herz@yahoo.com','','','','Katalina Her','','','','','','','','',0,1417157544,1417157544,0,0,0,1,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,0),(31,'547ff7d55502e','10152503150600547','http://graph.facebook.com/10152503150600547/picture?type=large','Deanna','','','','','Deanna Schetselaar','','','','','','','','',0,1417672661,1418003020,0,0,0,1,'46195840337ba53c282d6af1dd7ed5d12c1ea1c7f283ed413658edad1d6b1629\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(32,'5484c7a05d894','491253697684132','http://graph.facebook.com/491253697684132/picture?type=large','Flanders','flyflyerson3@gmail.com','','','','Flanders Smith','','','','','','','','',0,1417988000,1417988000,0,0,0,1,'d8408247d8a988d84af2b56f1bc3795e901570801dfb6fc49c18eafaca2ab2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(33,'5484f7bded9c2','1376571645971684','http://graph.facebook.com/1376571645971684/picture?type=large','Parker','pcfawson@gmail.com','','','','Parker Fawson','','','','','','','','',0,1418000317,1418000406,0,0,0,1,'664a1e80d977b2ed48f8a31a7b8dedd973487f391ae53d4cd18b803dc91b1ad0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(34,'548504aea1a47','10204804879669233','http://graph.facebook.com/10204804879669233/picture?type=large','Ariel','ariel_kuntz@yahoo.com','','','','Ariel Rawlings','','','','','','','','',0,1418003630,1418003630,0,0,0,1,'43b14ba6f4ac9e89a50e6a0746d4ed868c2a1f78be3999461128c6f9a9c283\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(35,'5485255c6fe8c','10153488182659152','http://graph.facebook.com/10153488182659152/picture?type=large','Ken','carlson.kendall@gmail.com','','','','Ken Carlson','','','','','','','','',0,1418011996,1418011996,0,0,0,1,'10c0d164fefd8846937291ba71425cb9e92b87f87a7f221ca734ee7f5139c525\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304),(36,'54854002e8518','10205527732663421','http://graph.facebook.com/10205527732663421/picture?type=large','Arianna','ballarianna@hotmail.com','','','','Arianna Ball','','','','','','','','',0,1418018818,1418018818,0,0,0,1,'676940fcca0e7112674d878aa9064854af18dbe12a3799cf9abcfbfa25bb72c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,1418046304);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_exclude_image`
--

LOCK TABLES `user_exclude_image` WRITE;
/*!40000 ALTER TABLE `user_exclude_image` DISABLE KEYS */;
INSERT INTO `user_exclude_image` VALUES (1,'5471133f54b26','547147c7b8a96',1416711125);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follow`
--

LOCK TABLES `user_follow` WRITE;
/*!40000 ALTER TABLE `user_follow` DISABLE KEYS */;
INSERT INTO `user_follow` VALUES (1,'544ef5981c4a9','54710d914e44d',0,0,1416695368),(2,'54710d914e44d','5471133f54b26',1,0,1416696802),(3,'5471133f54b26','5471243f03e9e',0,0,1416703366),(4,'547112e50f4b7','5471133f54b26',0,0,1416715826),(5,'5471133f54b26','544ef98e33706',1,0,1416719419),(6,'54712234584b8','54710d914e44d',0,0,1416720580),(7,'5471133f54b26','54710d914e44d',1,0,1416720603),(8,'54714712b64c2','5471138983b0f',0,0,1416743084),(9,'5471133f54b26','546eaec1847c8',0,0,1416775292),(10,'547203497137f','5471133f54b26',1,0,1416870490),(12,'5471138983b0f','5472bb923d889',0,0,1417074730),(13,'5471138983b0f','544ef98e33706',0,0,1417186271),(15,'5471652dc711a','544ef98e33706',0,0,1417187193),(17,'544ef98e33706','5471133f54b26',1,0,1417196527),(18,'5472bb923d889','544ef98e33706',0,0,1417489295),(25,'5471133f54b26','547203497137f',1,0,1417636232),(26,'5472bb923d889','5471133f54b26',0,0,1417994940),(27,'5472171bd3ee0','5471133f54b26',0,0,1417994988),(28,'54711c24e74dd','5471133f54b26',0,0,1417995053),(29,'5471133f54b26','5471133f54b26',0,1,1418000747),(30,'5484f7bded9c2','5471133f54b26',0,1,1418000805);
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
  `brander_count` tinyint NOT NULL,
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
/*!50001 VIEW `view_image_latest_collection` AS select `img`.`image_uuid` AS `image_uuid`,`img`.`name` AS `name`,`img`.`description` AS `description`,`img`.`width` AS `width`,`img`.`height` AS `height`,`img`.`create_date` AS `create_date`,`img`.`modified_date` AS `modified_date`,`img`.`file_name` AS `file_name`,`img`.`thumbnail` AS `thumbnail`,`img`.`user_uuid` AS `user_uuid`,`img`.`brander_count` AS `brander_count`,`usr`.`facebook_token` AS `user_token`,`usr`.`fullname` AS `fullname`,`usr`.`username` AS `username` from (`image` `img` join `user` `usr` on((`img`.`user_uuid` = `usr`.`user_uuid`))) order by `img`.`modified_date` */;
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

-- Dump completed on 2014-12-08 13:47:28
