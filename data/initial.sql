-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: koken
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

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
-- Table structure for table `koken_albums`
--

DROP TABLE IF EXISTS `koken_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_albums` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `old_slug` text,
  `summary` varchar(255) DEFAULT NULL,
  `description` text,
  `sort` varchar(255) DEFAULT 'manual ASC',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `left_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_on` int(10) DEFAULT NULL,
  `featured_order` int(11) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `video_count` int(11) NOT NULL DEFAULT '0',
  `published_on` int(10) DEFAULT NULL,
  `created_on` int(10) NOT NULL,
  `modified_on` int(10) NOT NULL,
  `album_type` tinyint(1) NOT NULL DEFAULT '0',
  `internal_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deleted` (`deleted`),
  KEY `level` (`level`),
  KEY `left_id` (`left_id`),
  KEY `right_id` (`right_id`),
  KEY `total_count` (`total_count`),
  KEY `video_count` (`video_count`),
  KEY `created_on` (`created_on`),
  KEY `published_on` (`published_on`),
  KEY `modified_on` (`modified_on`),
  KEY `album_type` (`album_type`),
  KEY `internal_id` (`internal_id`),
  KEY `featured_featured_order` (`featured`,`featured_order`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_albums`
--

LOCK TABLES `koken_albums` WRITE;
/*!40000 ALTER TABLE `koken_albums` DISABLE KEYS */;
INSERT INTO `koken_albums` VALUES (1,'Shows','shows',NULL,'A collection containing all shows','A collection containing all shows','manual ASC',0,1,1,2,0,0,NULL,NULL,9,0,1427722208,1427722208,1427722223,0,'899c2f0f09c2a4dc1ecc12b585e63ae7'),(2,'People','people',NULL,'','','manual ASC',0,1,3,4,0,0,NULL,NULL,29,0,1427722798,1427722798,1427722890,0,'a30882bde468016c06b7c85b167ea875');
/*!40000 ALTER TABLE `koken_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_applications`
--

DROP TABLE IF EXISTS `koken_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_applications` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `nonce` varchar(32) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'read',
  `name` varchar(255) DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `single_use` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `nonce` (`nonce`),
  KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_applications`
--

LOCK TABLES `koken_applications` WRITE;
/*!40000 ALTER TABLE `koken_applications` DISABLE KEYS */;
INSERT INTO `koken_applications` VALUES (2,1,NULL,'b38c32cb2c80bbe7548f988f95c41d75','god',NULL,1427722729,0);
/*!40000 ALTER TABLE `koken_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_categories`
--

DROP TABLE IF EXISTS `koken_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_categories` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `album_count` int(11) NOT NULL DEFAULT '0',
  `text_count` int(11) NOT NULL DEFAULT '0',
  `content_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `album_count` (`album_count`),
  KEY `content_count` (`content_count`),
  KEY `text_count` (`text_count`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_categories`
--

LOCK TABLES `koken_categories` WRITE;
/*!40000 ALTER TABLE `koken_categories` DISABLE KEYS */;
INSERT INTO `koken_categories` VALUES (3,'activePerson','activeperson',0,0,15),(4,'inactivePerson','inactiveperson',0,0,14),(5,'activeShow','activeshow',0,0,6),(6,'inactiveShow','inactiveshow',0,0,3);
/*!40000 ALTER TABLE `koken_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_content`
--

DROP TABLE IF EXISTS `koken_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_content` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `old_slug` text,
  `filename` varchar(255) DEFAULT NULL,
  `caption` text,
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `max_download` tinyint(1) NOT NULL DEFAULT '0',
  `license` char(3) NOT NULL DEFAULT 'all',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_order` int(11) DEFAULT NULL,
  `favorite_order` int(11) DEFAULT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT '0',
  `favorited_on` int(10) DEFAULT NULL,
  `featured_on` int(10) DEFAULT NULL,
  `uploaded_on` int(10) NOT NULL,
  `captured_on` int(10) NOT NULL,
  `published_on` int(10) DEFAULT NULL,
  `modified_on` int(10) NOT NULL,
  `file_modified_on` int(10) NOT NULL,
  `focal_point` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `aspect_ratio` decimal(5,3) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `file_type` tinyint(1) NOT NULL DEFAULT '0',
  `lg_preview` varchar(255) DEFAULT NULL,
  `internal_id` char(32) NOT NULL,
  `has_exif` tinyint(1) NOT NULL DEFAULT '0',
  `has_iptc` tinyint(1) NOT NULL DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `html` text,
  `storage_url` varchar(255) DEFAULT NULL,
  `storage_url_midsize` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filename` (`filename`),
  KEY `title` (`title`),
  KEY `deleted` (`deleted`),
  KEY `uploaded_on` (`uploaded_on`),
  KEY `captured_on` (`captured_on`),
  KEY `modified_on` (`modified_on`),
  KEY `published_on` (`published_on`),
  KEY `filesize` (`filesize`),
  KEY `file_type` (`file_type`),
  KEY `has_iptc` (`has_iptc`),
  KEY `has_exif` (`has_exif`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `aspect_ratio` (`aspect_ratio`),
  KEY `featured_featured_order` (`featured`,`featured_order`),
  KEY `favorite_favorite_order` (`favorite`,`favorite_order`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_content`
--

LOCK TABLES `koken_content` WRITE;
/*!40000 ALTER TABLE `koken_content` DISABLE KEYS */;
INSERT INTO `koken_content` VALUES (1,NULL,'11-v-kto-sa-boji',NULL,'11-v-Kto-sa-boji.JPG','Premi',0,0,'all',0,1,1,NULL,0,NULL,1427723182,1427722053,1206558427,1427722053,1427723182,1427722053,NULL,57858,473,328,1.442,NULL,0,NULL,'03a703d8d7639d197df7f0f05daf2ed9',1,1,NULL,NULL,NULL,NULL,NULL),(2,NULL,'aktovky-reper-nahl',NULL,'Aktovky-reper-nahl.gif',NULL,0,0,'all',0,1,1,NULL,0,NULL,1427723179,1427722053,1427729253,1427722053,1427723179,1427722053,NULL,4691,90,110,0.818,NULL,0,NULL,'884c897909d3bab48b0a43724487f63e',0,0,NULL,NULL,NULL,NULL,NULL),(3,NULL,'bezsitka-reper-nahl',NULL,'Bezsitka-reper-nahl.gif',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722054,1427729254,1427722054,1427722054,1427722054,NULL,1841,90,100,0.900,NULL,0,NULL,'599029c9ac8e48b38c2852d3de59e865',0,0,NULL,NULL,NULL,NULL,NULL),(4,NULL,'brahmani-repertoar-nahl',NULL,'Brahmani-repertoar-nahl.gif',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722055,1427729255,1427722055,1427722055,1427722055,NULL,1461,90,100,0.900,NULL,0,NULL,'b68eef194e5c3f79591650628c1791e6',0,0,NULL,NULL,NULL,NULL,NULL),(5,NULL,'equus-repertoar-nahl',NULL,'Equus-repertoar-nahl.gif',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722056,1427729256,1427722056,1427722056,1427722056,NULL,4949,90,100,0.900,NULL,0,NULL,'b5e2c3af3661486663912ee08b3c2df1',0,0,NULL,NULL,NULL,NULL,NULL),(6,NULL,'harvey-repertoar-nahl',NULL,'Harvey-repertoar-nahl.gif',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722056,1427729256,1427722056,1427722056,1427722056,NULL,3546,90,100,0.900,NULL,0,NULL,'18f5af80f95d872975bd2c3b5931f278',0,0,NULL,NULL,NULL,NULL,NULL),(7,NULL,'idiotka-reper-nahl',NULL,'Idiotka-reper-nahl.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722057,1427729257,1427722057,1427722057,1427722057,NULL,11521,90,100,0.900,NULL,0,NULL,'315e6e4e888e4af98596f072d10471f1',1,1,NULL,NULL,NULL,NULL,NULL),(8,NULL,'kompot-reper-nahl',NULL,'Kompot-reper-nahl.gif',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722058,1427729258,1427722058,1427722058,1427722058,NULL,2049,90,100,0.900,NULL,0,NULL,'e61754ffe0b985bf532929554e025711',0,0,NULL,NULL,NULL,NULL,NULL),(9,NULL,'mozart-program-web-velka',NULL,'Mozart-program-web-velka.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722058,1427729258,1427722058,1427722058,1427722058,NULL,42305,236,330,0.715,NULL,0,NULL,'b34a53ba26a2f7dfa25b7ffab52045d3',1,1,NULL,NULL,NULL,NULL,NULL),(10,NULL,'mg-0515',NULL,'MG-0515.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722834,1370893977,1427722834,1427722834,1427722834,NULL,19882,90,81,1.111,NULL,0,NULL,'540eb82512a0419c57eeead294cfbd27',1,1,NULL,NULL,NULL,NULL,NULL),(11,NULL,'mg-0524',NULL,'MG-0524.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722836,1370894027,1427722836,1427722836,1427722836,NULL,18666,90,83,1.084,NULL,0,NULL,'4bdedfb804ba4f7bfe22b9214764b26d',1,1,NULL,NULL,NULL,NULL,NULL),(12,NULL,'mg-0550',NULL,'MG-0550.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722838,1370894129,1427722838,1427722838,1427722838,NULL,22446,90,87,1.034,NULL,0,NULL,'ba46d0c7fbd35023fba63c0f2f8e43f4',1,1,NULL,NULL,NULL,NULL,NULL),(13,NULL,'mg-0568',NULL,'MG-0568.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722840,1370894197,1427722840,1427722840,1427722840,NULL,24958,90,84,1.071,NULL,0,NULL,'65070de65518464a33ca9ec33a3f6833',1,1,NULL,NULL,NULL,NULL,NULL),(14,NULL,'mg-0573',NULL,'MG-0573.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722842,1370894223,1427722842,1427722842,1427722841,NULL,19542,90,63,1.429,NULL,0,NULL,'274953ff355d74115710c3fd9e241eaa',1,1,NULL,NULL,NULL,NULL,NULL),(15,NULL,'mg-0625',NULL,'MG-0625.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722843,1370894407,1427722843,1427722843,1427722843,NULL,16484,90,73,1.233,NULL,0,NULL,'a3f1c7a5fd20505cd5f1febe2a6549ed',1,1,NULL,NULL,NULL,NULL,NULL),(16,NULL,'mg-0633',NULL,'MG-0633.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722845,1370894480,1427722845,1427722845,1427722845,NULL,14342,64,90,0.711,NULL,0,NULL,'0febd991a9c51aba2b71f0270fb58904',1,1,NULL,NULL,NULL,NULL,NULL),(17,NULL,'34984-1520224932520-5397771-n',NULL,'34984-1520224932520-5397771-n.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722847,1371573461,1427722847,1427722847,1427722847,NULL,21327,67,90,0.744,NULL,0,NULL,'542684b638dbf7519a8c2083bc11a00c',1,1,NULL,NULL,NULL,NULL,NULL),(18,'Alesek','alesek',',alesek-nahl,','alesek-nahl.jpg','Ales is a crazy man.\n',0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722848,1108742238,1427722848,1427723084,1427722848,NULL,20308,90,118,0.763,NULL,0,NULL,'413acd67babf9a85ca3da0f49c4d59b4',1,1,NULL,NULL,NULL,NULL,NULL),(19,NULL,'cadic',NULL,'cadic.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722850,1427730050,1427722850,1427722850,1427722850,NULL,54654,250,330,0.758,NULL,0,NULL,'1c9a21de175a4a9cdb022fd207898562',1,0,NULL,NULL,NULL,NULL,NULL),(20,NULL,'dagmar-nahled',NULL,'dagmar-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722852,1427730052,1427722852,1427722852,1427722852,NULL,16855,90,128,0.703,NULL,0,NULL,'9d0036c41ea7871d6035c325f3cb6324',1,0,NULL,NULL,NULL,NULL,NULL),(21,NULL,'daniela-nahled',NULL,'daniela-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722853,1110232273,1427722853,1427722853,1427722853,NULL,19775,90,136,0.662,NULL,0,NULL,'627cbede13463273933b705b47e7bc20',1,0,NULL,NULL,NULL,NULL,NULL),(22,NULL,'davidek-nahled',NULL,'davidek-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722855,1427730055,1427722855,1427722855,1427722855,NULL,17633,90,123,0.732,NULL,0,NULL,'f8b809bd04fd1b2284c444470160603e',1,0,NULL,NULL,NULL,NULL,NULL),(23,NULL,'karlos-nahled',NULL,'karlos-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722857,1427730057,1427722857,1427722857,1427722857,NULL,16839,90,122,0.738,NULL,0,NULL,'6bf3d7dc3c979da611ce8042db6e0d17',1,0,NULL,NULL,NULL,NULL,NULL),(24,NULL,'klarin',NULL,'klarin.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722859,1371571799,1427722859,1427722859,1427722859,NULL,12929,90,68,1.324,NULL,0,NULL,'ab42d1433665d4061317e095eee7e9c6',1,1,NULL,NULL,NULL,NULL,NULL),(25,NULL,'klarka-mala',NULL,'klarka-mala.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722861,1117225558,1427722861,1427722861,1427722861,NULL,17634,90,138,0.652,NULL,0,NULL,'9144c32716768d77caea41220132f86b',1,1,NULL,NULL,NULL,NULL,NULL),(26,NULL,'luca',NULL,'luca.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722863,1427730063,1427722863,1427722863,1427722863,NULL,57494,250,330,0.758,NULL,0,NULL,'910b0e73f4b56b0d33252bac2ab04428',1,0,NULL,NULL,NULL,NULL,NULL),(27,NULL,'mira',NULL,'mira.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722865,1427730065,1427722865,1427722865,1427722865,NULL,56049,250,330,0.758,NULL,0,NULL,'ac3b8f88802c29b90d0f84d4e34a165d',1,0,NULL,NULL,NULL,NULL,NULL),(28,NULL,'mysa-nahled',NULL,'mysa-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722867,1427730067,1427722867,1427722867,1427722867,NULL,16261,90,129,0.698,NULL,0,NULL,'3cb8dbf3ca9c8088b0fc1d26badad5e5',1,0,NULL,NULL,NULL,NULL,NULL),(29,NULL,'ondrej',NULL,'ondrej.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722869,1427730069,1427722869,1427722869,1427722869,NULL,48182,250,330,0.758,NULL,0,NULL,'77026f7bb481b047cd802439777453a1',1,0,NULL,NULL,NULL,NULL,NULL),(30,NULL,'patris',NULL,'patris.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722871,1427730071,1427722871,1427722871,1427722871,NULL,52084,250,330,0.758,NULL,0,NULL,'c6e52e80b0fb84a6b7c99935bdc6072e',1,0,NULL,NULL,NULL,NULL,NULL),(31,NULL,'petra-nahled',NULL,'petra-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722873,1427730073,1427722873,1427722873,1427722873,NULL,9693,90,123,0.732,NULL,0,NULL,'baa025af40e336a90ff2619daa381119',1,0,NULL,NULL,NULL,NULL,NULL),(32,NULL,'petros-nahled',NULL,'petros-nahled.jpg','                               ',0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722875,1108742217,1427722875,1427722875,1427722875,NULL,16512,90,132,0.682,NULL,0,NULL,'b4b0d90f9d08fcdd87ee83c086660c0e',1,1,NULL,NULL,NULL,NULL,NULL),(33,NULL,'puak',NULL,'puak.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722877,1427730077,1427722877,1427722877,1427722877,NULL,53479,250,330,0.758,NULL,0,NULL,'0a02b3f85ad5edd925158d6f732dd9a4',1,0,NULL,NULL,NULL,NULL,NULL),(34,NULL,'salome-nahled',NULL,'salome-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722879,1427730079,1427722879,1427722879,1427722879,NULL,18776,90,139,0.647,NULL,0,NULL,'495640074235ad8c2c8b9a9973bb8002',1,1,NULL,NULL,NULL,NULL,NULL),(35,NULL,'tata-nahl',NULL,'tata-nahl.jpg','                               ',0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722881,1108742238,1427722881,1427722881,1427722881,NULL,15162,90,118,0.763,NULL,0,NULL,'480109ad80419b63d69f64ebc01270e0',1,1,NULL,NULL,NULL,NULL,NULL),(36,NULL,'tomasek',NULL,'tomasek.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722883,1427730083,1427722883,1427722883,1427722883,NULL,58112,250,330,0.758,NULL,0,NULL,'9fda0bb03f255cb3b07d4e163335c8de',1,0,NULL,NULL,NULL,NULL,NULL),(37,NULL,'vaclav-mala',NULL,'vaclav-mala.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722885,1109366949,1427722885,1427722885,1427722885,NULL,21769,90,131,0.687,NULL,0,NULL,'3bcec8b0a1d5d7e2c6e753d7f48386f2',1,1,NULL,NULL,NULL,NULL,NULL),(38,NULL,'veronika-nahled',NULL,'veronika-nahled.jpg',NULL,0,0,'all',0,0,NULL,NULL,0,NULL,NULL,1427722887,1110228448,1427722887,1427722887,1427722887,NULL,17807,90,127,0.709,NULL,0,NULL,'c7f2f90d9967b58cb57b7a33e8000193',1,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `koken_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_drafts`
--

DROP TABLE IF EXISTS `koken_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_drafts` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `live_data` text,
  `data` text,
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `draft` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` int(10) NOT NULL,
  `modified_on` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`),
  KEY `current` (`current`),
  KEY `draft` (`draft`),
  KEY `created_on` (`created_on`),
  KEY `modified_on` (`modified_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_drafts`
--

LOCK TABLES `koken_drafts` WRITE;
/*!40000 ALTER TABLE `koken_drafts` DISABLE KEYS */;
INSERT INTO `koken_drafts` VALUES (1,'elementary','{\"navigation\":{\"items\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"timeline\",\"path\":\"\\/timeline\\/\",\"label\":\"Timeline\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}],\"groups\":[{\"key\":\"footer\",\"label\":\"Footer\",\"items\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}],\"items_nested\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}]},{\"key\":\"aside_links\",\"label\":\"Aside links\",\"items\":[],\"items_nested\":[]}],\"items_nested\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"timeline\",\"path\":\"\\/timeline\\/\",\"label\":\"Timeline\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}]},\"settings\":{\"__style\":\"white\"},\"custom_css\":\"\",\"routes\":{\"\\/content\\/tags\\/:slug\\/\":{\"template\":\"redirect:\\/tags\\/:slug\\/content\\/\"},\"\\/content\\/categories\\/:slug\\/\":{\"template\":\"redirect:\\/categories\\/:slug\\/content\\/\"},\"\\/albums\\/tags\\/:slug\\/\":{\"template\":\"redirect:\\/tags\\/:slug\\/albums\\/\"},\"\\/albums\\/categories\\/:slug\\/\":{\"template\":\"redirect:\\/categories\\/:slug\\/albums\\/\"},\"\\/essays\\/tags\\/:slug\\/\":{\"template\":\"redirect:\\/tags\\/:slug\\/essays\\/\"},\"\\/essays\\/categories\\/:slug\\/\":{\"template\":\"redirect:\\/categories\\/:slug\\/essays\\/\"},\"\\/content\\/:id\\/in_album\\/:album_id(?P<lightbox>\\/lightbox)?\\/\":{\"template\":\"redirect:content\"},\"\\/archives(?:\\/:year(?:\\/:month)?)?\\/\":{\"template\":\"redirect:timeline\"},\"\\/sets\\/\":{\"template\":\"redirect:soft:albums\"},\"\\/pages\\/:id\\/\":{\"template\":\"redirect:page\"}},\"pulse_groups\":{\"default\":{\"transition_duration\":\"0.5\",\"transition_type\":\"slide\",\"speed\":\"3\"}}}','{\"navigation\":{\"items\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"timeline\",\"path\":\"\\/timeline\\/\",\"label\":\"Timeline\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}],\"groups\":[{\"key\":\"footer\",\"label\":\"Footer\",\"items\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}],\"items_nested\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}]},{\"key\":\"aside_links\",\"label\":\"Aside links\",\"items\":[],\"items_nested\":[]}],\"items_nested\":[{\"auto\":\"home\",\"front\":true,\"path\":\"\\/home\\/\",\"label\":\"Home\"},{\"auto\":\"timeline\",\"path\":\"\\/timeline\\/\",\"label\":\"Timeline\"},{\"auto\":\"albums\",\"path\":\"\\/albums\\/\",\"label\":\"Albums\"},{\"auto\":\"contents\",\"path\":\"\\/content\\/\",\"label\":\"Content\"},{\"auto\":\"essays\",\"path\":\"\\/essays\\/\",\"label\":\"Essays\"}]},\"settings\":{\"__style\":\"white\"},\"custom_css\":\"\",\"routes\":{\"\\/content\\/tags\\/:slug\\/\":{\"template\":\"redirect:\\/tags\\/:slug\\/content\\/\"},\"\\/content\\/categories\\/:slug\\/\":{\"template\":\"redirect:\\/categories\\/:slug\\/content\\/\"},\"\\/albums\\/tags\\/:slug\\/\":{\"template\":\"redirect:\\/tags\\/:slug\\/albums\\/\"},\"\\/albums\\/categories\\/:slug\\/\":{\"template\":\"redirect:\\/categories\\/:slug\\/albums\\/\"},\"\\/essays\\/tags\\/:slug\\/\":{\"template\":\"redirect:\\/tags\\/:slug\\/essays\\/\"},\"\\/essays\\/categories\\/:slug\\/\":{\"template\":\"redirect:\\/categories\\/:slug\\/essays\\/\"},\"\\/content\\/:id\\/in_album\\/:album_id(?P<lightbox>\\/lightbox)?\\/\":{\"template\":\"redirect:content\"},\"\\/archives(?:\\/:year(?:\\/:month)?)?\\/\":{\"template\":\"redirect:timeline\"},\"\\/sets\\/\":{\"template\":\"redirect:soft:albums\"},\"\\/pages\\/:id\\/\":{\"template\":\"redirect:page\"}},\"pulse_groups\":{\"default\":{\"transition_duration\":\"0.5\",\"transition_type\":\"slide\",\"speed\":\"3\"}}}',1,1,1427720643,1427723987);
/*!40000 ALTER TABLE `koken_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_history`
--

DROP TABLE IF EXISTS `koken_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_history` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text,
  `created_on` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_history`
--

LOCK TABLES `koken_history` WRITE;
/*!40000 ALTER TABLE `koken_history` DISABLE KEYS */;
INSERT INTO `koken_history` VALUES (1,1,'s:14:\"system:install\";',1427720643);
/*!40000 ALTER TABLE `koken_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_albums_categories`
--

DROP TABLE IF EXISTS `koken_join_albums_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_albums_categories` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_albums_categories`
--

LOCK TABLES `koken_join_albums_categories` WRITE;
/*!40000 ALTER TABLE `koken_join_albums_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_join_albums_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_albums_content`
--

DROP TABLE IF EXISTS `koken_join_albums_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_albums_content` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `content_id` (`content_id`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_albums_content`
--

LOCK TABLES `koken_join_albums_content` WRITE;
/*!40000 ALTER TABLE `koken_join_albums_content` DISABLE KEYS */;
INSERT INTO `koken_join_albums_content` VALUES (1,1,2,1),(2,1,1,2),(3,1,3,3),(4,1,4,4),(5,1,5,5),(6,1,6,6),(7,1,7,7),(8,1,8,8),(9,1,9,9),(10,2,10,1),(11,2,11,2),(12,2,12,3),(13,2,13,4),(14,2,14,5),(15,2,15,6),(16,2,16,7),(17,2,17,8),(18,2,18,9),(19,2,19,10),(20,2,20,11),(21,2,21,12),(22,2,22,13),(23,2,23,14),(24,2,24,15),(25,2,25,16),(26,2,26,17),(27,2,27,18),(28,2,28,19),(29,2,29,20),(30,2,30,21),(31,2,31,22),(32,2,32,23),(33,2,33,24),(34,2,34,25),(35,2,35,26),(36,2,36,27),(37,2,37,28),(38,2,38,29);
/*!40000 ALTER TABLE `koken_join_albums_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_albums_covers`
--

DROP TABLE IF EXISTS `koken_join_albums_covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_albums_covers` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `cover_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `cover_id` (`cover_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_albums_covers`
--

LOCK TABLES `koken_join_albums_covers` WRITE;
/*!40000 ALTER TABLE `koken_join_albums_covers` DISABLE KEYS */;
INSERT INTO `koken_join_albums_covers` VALUES (1,1,2),(2,1,1),(3,1,3),(4,2,10),(5,2,11),(6,2,12);
/*!40000 ALTER TABLE `koken_join_albums_covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_albums_tags`
--

DROP TABLE IF EXISTS `koken_join_albums_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_albums_tags` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `album_id` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_albums_tags`
--

LOCK TABLES `koken_join_albums_tags` WRITE;
/*!40000 ALTER TABLE `koken_join_albums_tags` DISABLE KEYS */;
INSERT INTO `koken_join_albums_tags` VALUES (1,1,1);
/*!40000 ALTER TABLE `koken_join_albums_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_albums_text`
--

DROP TABLE IF EXISTS `koken_join_albums_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_albums_text` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `text_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `text_id` (`text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_albums_text`
--

LOCK TABLES `koken_join_albums_text` WRITE;
/*!40000 ALTER TABLE `koken_join_albums_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_join_albums_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_categories_content`
--

DROP TABLE IF EXISTS `koken_join_categories_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_categories_content` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_categories_content`
--

LOCK TABLES `koken_join_categories_content` WRITE;
/*!40000 ALTER TABLE `koken_join_categories_content` DISABLE KEYS */;
INSERT INTO `koken_join_categories_content` VALUES (2,10,3),(3,11,3),(4,12,3),(5,13,3),(6,14,3),(7,15,3),(8,16,3),(9,17,3),(10,18,3),(11,19,3),(12,20,3),(13,21,3),(14,22,3),(15,23,3),(16,24,3),(17,25,4),(18,26,4),(19,27,4),(20,28,4),(21,29,4),(22,30,4),(23,31,4),(24,32,4),(25,33,4),(26,34,4),(27,35,4),(28,36,4),(29,37,4),(30,38,4),(31,7,6),(32,8,6),(33,9,6),(34,1,5),(35,2,5),(36,3,5),(37,4,5),(38,5,5),(39,6,5);
/*!40000 ALTER TABLE `koken_join_categories_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_categories_text`
--

DROP TABLE IF EXISTS `koken_join_categories_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_categories_text` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `text_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text_id` (`text_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_categories_text`
--

LOCK TABLES `koken_join_categories_text` WRITE;
/*!40000 ALTER TABLE `koken_join_categories_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_join_categories_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_content_tags`
--

DROP TABLE IF EXISTS `koken_join_content_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_content_tags` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `content_id` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_content_tags`
--

LOCK TABLES `koken_join_content_tags` WRITE;
/*!40000 ALTER TABLE `koken_join_content_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_join_content_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_join_tags_text`
--

DROP TABLE IF EXISTS `koken_join_tags_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_join_tags_text` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `text_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text_id` (`text_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_join_tags_text`
--

LOCK TABLES `koken_join_tags_text` WRITE;
/*!40000 ALTER TABLE `koken_join_tags_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_join_tags_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_plugins`
--

DROP TABLE IF EXISTS `koken_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_plugins` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `setup` tinyint(1) NOT NULL DEFAULT '1',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_plugins`
--

LOCK TABLES `koken_plugins` WRITE;
/*!40000 ALTER TABLE `koken_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_settings`
--

DROP TABLE IF EXISTS `koken_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_settings` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_settings`
--

LOCK TABLES `koken_settings` WRITE;
/*!40000 ALTER TABLE `koken_settings` DISABLE KEYS */;
INSERT INTO `koken_settings` VALUES (1,'site_timezone','Europe/Berlin'),(2,'console_show_notifications','yes'),(3,'console_enable_keyboard_shortcuts','yes'),(4,'uploading_default_license','all'),(5,'uploading_default_visibility','public'),(6,'uploading_default_album_visibility','public'),(7,'uploading_default_max_download_size','none'),(8,'uploading_publish_on_captured_date','false'),(9,'site_title','Ryan Cole'),(10,'site_page_title','Ryan Cole'),(11,'site_tagline','Your site tagline'),(12,'site_copyright','© Ryan Cole'),(13,'site_description',''),(14,'site_keywords','photography, Ryan Cole'),(15,'site_date_format','F j, Y'),(16,'site_time_format','g:i a'),(17,'site_privacy','public'),(18,'site_hidpi','true'),(19,'site_url','/'),(20,'use_default_labels_links','true'),(21,'uuid','e30a0ad1156ffd580a7158207d5cefc6'),(22,'retain_image_metadata','false'),(23,'image_use_defaults','true'),(24,'image_tiny_quality','80'),(25,'image_small_quality','80'),(26,'image_medium_quality','85'),(27,'image_medium_large_quality','85'),(28,'image_large_quality','85'),(29,'image_xlarge_quality','90'),(30,'image_huge_quality','90'),(31,'image_tiny_sharpening','0.7'),(32,'image_small_sharpening','0.6'),(33,'image_medium_sharpening','0.6'),(34,'image_medium_large_sharpening','0.6'),(35,'image_large_sharpening','0.6'),(36,'image_xlarge_sharpening','0.3'),(37,'image_huge_sharpening','0'),(38,'last_upload','1427722833'),(39,'last_migration','41'),(40,'has_toured','true'),(41,'email_handler','DDI_Email'),(42,'email_delivery_address','ryan@askdesigners.eu'),(43,'image_processing_library','imagick');
/*!40000 ALTER TABLE `koken_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_slugs`
--

DROP TABLE IF EXISTS `koken_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_slugs` (
  `id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_slugs`
--

LOCK TABLES `koken_slugs` WRITE;
/*!40000 ALTER TABLE `koken_slugs` DISABLE KEYS */;
INSERT INTO `koken_slugs` VALUES ('album.people'),('album.shows'),('category.activeperson'),('category.activeshow'),('category.inactiveperson'),('category.inactiveshow'),('content.11-v-kto-sa-boji'),('content.34984-1520224932520-5397771-n'),('content.aktovky-reper-nahl'),('content.alesek'),('content.alesek-nahl'),('content.bezsitka-reper-nahl'),('content.brahmani-repertoar-nahl'),('content.cadic'),('content.dagmar-nahled'),('content.daniela-nahled'),('content.davidek-nahled'),('content.equus-repertoar-nahl'),('content.harvey-repertoar-nahl'),('content.idiotka-reper-nahl'),('content.karlos-nahled'),('content.klarin'),('content.klarka-mala'),('content.kompot-reper-nahl'),('content.luca'),('content.mg-0515'),('content.mg-0524'),('content.mg-0550'),('content.mg-0568'),('content.mg-0573'),('content.mg-0625'),('content.mg-0633'),('content.mira'),('content.mozart-program-web-velka'),('content.mysa-nahled'),('content.ondrej'),('content.patris'),('content.petra-nahled'),('content.petros-nahled'),('content.puak'),('content.salome-nahled'),('content.tata-nahl'),('content.tomasek'),('content.vaclav-mala'),('content.veronika-nahled'),('essay.o-nas'),('essay.trocha-historie'),('page.test-page');
/*!40000 ALTER TABLE `koken_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_tags`
--

DROP TABLE IF EXISTS `koken_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_tags` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_on` int(10) NOT NULL,
  `modified_on` int(10) NOT NULL,
  `last_used` int(10) DEFAULT NULL,
  `album_count` int(11) NOT NULL DEFAULT '0',
  `text_count` int(11) NOT NULL DEFAULT '0',
  `content_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_tags`
--

LOCK TABLES `koken_tags` WRITE;
/*!40000 ALTER TABLE `koken_tags` DISABLE KEYS */;
INSERT INTO `koken_tags` VALUES (1,'show',1427722209,1427722223,1427722209,1,0,0);
/*!40000 ALTER TABLE `koken_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_text`
--

DROP TABLE IF EXISTS `koken_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_text` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` text,
  `draft_title` text,
  `slug` varchar(255) DEFAULT NULL,
  `old_slug` text,
  `featured_image_id` int(10) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_on` int(10) DEFAULT NULL,
  `featured_order` int(11) DEFAULT NULL,
  `custom_featured_image` varchar(255) DEFAULT NULL,
  `content` longtext,
  `draft` longtext,
  `excerpt` varchar(255) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `page_type` int(1) NOT NULL DEFAULT '0',
  `published_on` int(10) DEFAULT NULL,
  `created_on` int(10) NOT NULL,
  `modified_on` int(10) NOT NULL,
  `internal_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `created_on` (`created_on`),
  KEY `modified_on` (`modified_on`),
  KEY `published_on` (`published_on`),
  KEY `page_type` (`page_type`),
  KEY `internal_id` (`internal_id`),
  KEY `featured_image_id` (`featured_image_id`),
  KEY `slug` (`slug`),
  KEY `featured_featured_order` (`featured`,`featured_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_text`
--

LOCK TABLES `koken_text` WRITE;
/*!40000 ALTER TABLE `koken_text` DISABLE KEYS */;
INSERT INTO `koken_text` VALUES (1,'O Nas','O Nas','o-nas',NULL,NULL,0,NULL,NULL,NULL,'<p class=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p class=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>',NULL,1,0,1427723744,1427723693,1427723744,'5c59d072e65056f0cc2f31870b85841f'),(2,'test page','test page','test-page',NULL,NULL,0,NULL,NULL,NULL,'<p class=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p class=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>',NULL,1,1,1427723770,1427723770,1427723783,'3aaafd0d8571abee64218a2f03c5cc98'),(3,'Trocha historie','Trocha historie','trocha-historie',NULL,NULL,0,NULL,NULL,NULL,'<p class=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>','<p class=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>',NULL,1,0,1427723817,1427723805,1427723817,'dd653dafdfcc5f89b268ce9809970f03');
/*!40000 ALTER TABLE `koken_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_trash`
--

DROP TABLE IF EXISTS `koken_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_trash` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `created_on` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_trash`
--

LOCK TABLES `koken_trash` WRITE;
/*!40000 ALTER TABLE `koken_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_urls`
--

DROP TABLE IF EXISTS `koken_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_urls` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `data` text,
  `created_on` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_urls`
--

LOCK TABLES `koken_urls` WRITE;
/*!40000 ALTER TABLE `koken_urls` DISABLE KEYS */;
INSERT INTO `koken_urls` VALUES (1,'a:10:{i:0;a:2:{s:4:\"type\";s:7:\"content\";s:4:\"data\";a:4:{s:8:\"singular\";s:7:\"Content\";s:6:\"plural\";s:7:\"Content\";s:5:\"order\";s:17:\"published_on DESC\";s:3:\"url\";s:4:\"slug\";}}i:1;a:2:{s:4:\"type\";s:8:\"favorite\";s:4:\"data\";a:3:{s:8:\"singular\";s:8:\"Favorite\";s:6:\"plural\";s:9:\"Favorites\";s:5:\"order\";s:10:\"manual ASC\";}}i:2;a:2:{s:4:\"type\";s:7:\"feature\";s:4:\"data\";a:3:{s:8:\"singular\";s:7:\"Feature\";s:6:\"plural\";s:8:\"Features\";s:5:\"order\";s:10:\"manual ASC\";}}i:3;a:2:{s:4:\"type\";s:5:\"album\";s:4:\"data\";a:4:{s:8:\"singular\";s:5:\"Album\";s:6:\"plural\";s:6:\"Albums\";s:5:\"order\";s:10:\"manual ASC\";s:3:\"url\";s:4:\"slug\";}}i:4;a:2:{s:4:\"type\";s:3:\"set\";s:4:\"data\";a:3:{s:8:\"singular\";s:3:\"Set\";s:6:\"plural\";s:4:\"Sets\";s:5:\"order\";s:9:\"title ASC\";}}i:5;a:2:{s:4:\"type\";s:5:\"essay\";s:4:\"data\";a:4:{s:8:\"singular\";s:5:\"Essay\";s:6:\"plural\";s:6:\"Essays\";s:5:\"order\";s:17:\"published_on DESC\";s:3:\"url\";s:9:\"date+slug\";}}i:6;a:2:{s:4:\"type\";s:4:\"page\";s:4:\"data\";a:3:{s:8:\"singular\";s:4:\"Page\";s:6:\"plural\";s:5:\"Pages\";s:3:\"url\";s:4:\"slug\";}}i:7;a:2:{s:4:\"type\";s:3:\"tag\";s:4:\"data\";a:2:{s:8:\"singular\";s:3:\"Tag\";s:6:\"plural\";s:4:\"Tags\";}}i:8;a:2:{s:4:\"type\";s:8:\"category\";s:4:\"data\";a:2:{s:8:\"singular\";s:8:\"Category\";s:6:\"plural\";s:10:\"Categories\";}}i:9;a:2:{s:4:\"type\";s:8:\"timeline\";s:4:\"data\";a:2:{s:8:\"singular\";s:8:\"Timeline\";s:6:\"plural\";s:8:\"Timeline\";}}}',1427720642),(2,'a:11:{i:0;a:2:{s:4:\"type\";s:7:\"content\";s:4:\"data\";a:4:{s:8:\"singular\";s:7:\"Content\";s:6:\"plural\";s:7:\"Content\";s:3:\"url\";s:4:\"slug\";s:5:\"order\";s:17:\"published_on DESC\";}}i:1;a:2:{s:4:\"type\";s:8:\"favorite\";s:4:\"data\";a:4:{s:8:\"singular\";s:8:\"Favorite\";s:6:\"plural\";s:9:\"Favorites\";s:3:\"url\";s:0:\"\";s:5:\"order\";s:10:\"manual ASC\";}}i:2;a:2:{s:4:\"type\";s:7:\"feature\";s:4:\"data\";a:4:{s:8:\"singular\";s:7:\"Feature\";s:6:\"plural\";s:8:\"Features\";s:3:\"url\";s:0:\"\";s:5:\"order\";s:10:\"manual ASC\";}}i:3;a:2:{s:4:\"type\";s:5:\"album\";s:4:\"data\";a:4:{s:8:\"singular\";s:5:\"Album\";s:6:\"plural\";s:6:\"Albums\";s:3:\"url\";s:4:\"slug\";s:5:\"order\";s:10:\"manual ASC\";}}i:4;a:2:{s:4:\"type\";s:3:\"set\";s:4:\"data\";a:3:{s:8:\"singular\";s:3:\"Set\";s:6:\"plural\";s:4:\"Sets\";s:5:\"order\";s:9:\"title ASC\";}}i:5;a:2:{s:4:\"type\";s:5:\"essay\";s:4:\"data\";a:4:{s:8:\"singular\";s:5:\"Essay\";s:6:\"plural\";s:6:\"Essays\";s:3:\"url\";s:9:\"date+slug\";s:5:\"order\";s:17:\"published_on DESC\";}}i:6;a:2:{s:4:\"type\";s:4:\"page\";s:4:\"data\";a:3:{s:8:\"singular\";s:4:\"Page\";s:6:\"plural\";s:5:\"Pages\";s:3:\"url\";s:7:\"sssslug\";}}i:7;a:2:{s:4:\"type\";s:3:\"tag\";s:4:\"data\";a:3:{s:8:\"singular\";s:3:\"Tag\";s:6:\"plural\";s:4:\"Tags\";s:5:\"order\";s:10:\"count DESC\";}}i:8;a:2:{s:4:\"type\";s:8:\"category\";s:4:\"data\";a:3:{s:8:\"singular\";s:8:\"Category\";s:6:\"plural\";s:10:\"Categories\";s:5:\"order\";s:9:\"title ASC\";}}i:9;a:2:{s:4:\"type\";s:8:\"timeline\";s:4:\"data\";a:2:{s:8:\"singular\";s:8:\"Timeline\";s:6:\"plural\";s:8:\"Timeline\";}}i:10;a:2:{s:4:\"type\";s:4:\"home\";s:4:\"data\";s:4:\"Home\";}}',1427721882);
/*!40000 ALTER TABLE `koken_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koken_users`
--

DROP TABLE IF EXISTS `koken_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_users` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_on` int(10) NOT NULL,
  `modified_on` int(10) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `public_first_name` varchar(255) DEFAULT NULL,
  `public_last_name` varchar(255) DEFAULT NULL,
  `public_display` varchar(255) DEFAULT 'both',
  `public_email` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `internal_id` char(32) NOT NULL,
  `remember_me` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password` (`password`),
  KEY `email` (`email`),
  KEY `internal_id` (`internal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_users`
--

LOCK TABLES `koken_users` WRITE;
/*!40000 ALTER TABLE `koken_users` DISABLE KEYS */;
INSERT INTO `koken_users` VALUES (1,'$2a$08$2TY9mJ13AYefB38CA9oaJONed.PTxeUsPMOxMYXb/x5bSV0eoo4B.','ryan@askdesigners.eu',1427720642,1427722416,'Ryan','Cole','Ryan','Cole','both','ryan@askdesigners.eu',NULL,NULL,NULL,'de7d652770fcc76e8998c9e23cd9ebf3',NULL);
/*!40000 ALTER TABLE `koken_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-30 14:00:29
