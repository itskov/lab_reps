-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lab_admin
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `General_box`
--

DROP TABLE IF EXISTS `General_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_name` varchar(256) NOT NULL,
  `created_on_date` datetime NOT NULL,
  `description` longtext NOT NULL,
  `fridge_id` int(11) NOT NULL,
  `columns` int(11) NOT NULL,
  `rows` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_box_5b09db49` (`fridge_id`),
  KEY `General_box_80945c99` (`stock_id`),
  CONSTRAINT `fridge_id_refs_id_6b053cde` FOREIGN KEY (`fridge_id`) REFERENCES `General_fridge` (`id`),
  CONSTRAINT `stock_id_refs_id_32e4f58a` FOREIGN KEY (`stock_id`) REFERENCES `General_boxstock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_box`
--

LOCK TABLES `General_box` WRITE;
/*!40000 ALTER TABLE `General_box` DISABLE KEYS */;
INSERT INTO `General_box` VALUES (1,'A1','2014-09-28 08:55:57','Working stock.',1,10,10,1),(2,'A2','2014-09-28 08:55:57','WorkingStock',1,10,10,1),(3,'A3','2014-09-28 08:55:57','Working Stock',1,10,10,1),(4,'A4','2014-09-28 08:55:57','Working stock.',1,10,10,1),(5,'A5','2014-09-28 08:55:57','Working Stock.',1,10,10,1),(6,'A6','2014-09-28 08:55:57','Working Stock.',1,10,10,1),(7,'A7','2014-09-28 08:55:57','Working Stock',1,10,10,1),(8,'A8','2014-09-28 08:55:57','Working Stock.',1,10,10,1),(9,'A9','2014-09-28 08:55:57','Working Stock.',1,10,10,1),(10,'B1','2014-09-28 08:55:57','Nahmias Lab.',2,10,10,2),(11,'B2','2014-09-28 08:55:57','Nahmias Lab.',2,10,10,2),(12,'B3','2014-09-28 08:55:57','Nahmias Lab.',2,10,10,2),(13,'B4','2014-09-28 08:55:57','Nahmias Lab.',2,10,10,2),(14,'1-1','2014-09-28 08:55:57','Nitrogen stock.',3,10,10,3),(15,'1-2','2014-09-28 08:55:57','Nitrogen stock.',3,10,10,3),(16,'1-3','2014-09-28 08:55:57','Nitrogen stock.',3,10,10,3),(17,'1-4','2014-09-28 08:55:57','Nitrogen stock.',3,10,10,3),(18,'EyalsBox','2014-09-28 09:03:59','Eyal\'s Strains',1,10,10,NULL),(19,'EBDBox','2014-09-28 09:03:59','This is Eyal\'s Box.',1,10,10,NULL);
/*!40000 ALTER TABLE `General_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_boxassociation`
--

DROP TABLE IF EXISTS `General_boxassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_boxassociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row` int(11) NOT NULL,
  `column` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `General_boxassociation_cdd9e3d2` (`box_id`),
  CONSTRAINT `box_id_refs_id_7c1bb899` FOREIGN KEY (`box_id`) REFERENCES `General_box` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_boxassociation`
--

LOCK TABLES `General_boxassociation` WRITE;
/*!40000 ALTER TABLE `General_boxassociation` DISABLE KEYS */;
INSERT INTO `General_boxassociation` VALUES (35,0,0,1),(36,0,2,1),(37,1,4,1),(38,1,6,1),(39,1,8,1),(40,2,0,1),(41,2,4,1),(42,2,6,1),(43,3,0,1),(44,3,6,1),(45,4,2,1),(81,8,0,2),(82,8,1,2),(90,7,2,14),(92,7,2,10),(93,7,3,10),(94,8,5,2),(95,8,6,2),(96,8,7,2),(99,7,4,14),(101,7,4,10),(103,9,0,2),(104,9,1,2),(105,9,2,2),(106,9,3,2),(108,7,6,14),(109,7,7,14),(110,7,6,10),(112,1,0,3),(117,8,4,14),(119,8,4,10),(120,8,5,10),(121,2,0,3),(122,2,1,3),(123,2,2,3),(126,8,8,14),(128,8,8,10),(129,8,9,10),(130,2,5,3),(131,2,6,3),(132,2,7,3),(135,9,0,14),(137,9,0,10),(138,9,1,10),(139,5,0,3),(140,5,1,3),(141,5,2,3),(142,5,3,3),(143,5,4,3),(144,0,0,15),(146,0,0,11),(147,0,1,11),(148,7,5,3),(149,7,6,3),(150,7,7,3),(153,1,0,15),(155,1,0,11),(157,9,5,3),(158,9,6,3),(162,1,8,15),(164,1,8,11),(165,1,9,11),(166,0,0,4),(167,0,1,4),(168,0,2,4),(171,2,0,15),(173,2,0,11),(174,2,1,11),(180,2,2,15),(182,2,2,11),(183,2,3,11),(189,2,4,15),(191,2,4,11),(192,2,5,11),(193,2,0,4),(194,2,1,4),(195,2,2,4),(198,2,8,15),(199,2,9,15),(200,2,8,11),(201,2,9,11),(202,6,5,4),(203,6,6,4),(204,6,7,4),(207,4,6,15),(209,4,6,11),(210,4,7,11),(211,2,5,5),(216,7,0,15),(218,7,0,11),(220,3,5,5),(221,3,6,5),(225,7,4,15),(227,7,4,11),(228,7,5,11),(229,6,0,5),(230,6,1,5),(231,6,2,5),(234,8,4,15),(236,8,4,11),(238,8,0,5),(239,8,1,5),(243,9,2,15),(245,9,2,11),(247,2,5,6),(248,2,6,6),(249,2,7,6),(252,1,0,16),(254,1,0,12),(256,3,0,6),(257,3,1,6),(261,1,2,16),(263,1,2,12),(265,6,0,6),(266,6,1,6),(270,2,4,16),(272,2,4,12),(273,2,5,12),(274,9,0,6),(275,9,1,6),(276,9,2,6),(277,9,3,6),(279,3,6,16),(281,3,6,12),(282,3,7,12),(283,9,5,6),(284,9,6,6),(285,9,7,6),(288,3,8,16),(290,3,8,12),(291,3,9,12),(292,0,5,7),(293,0,6,7),(299,4,2,12),(300,4,3,12),(301,1,0,7),(302,1,1,7),(306,4,4,16),(308,4,4,12),(309,4,5,12),(310,1,5,7),(315,4,6,16),(317,4,6,12),(318,4,7,12),(319,2,0,7),(320,2,1,7),(324,4,8,16),(326,4,8,12),(327,4,9,12),(328,2,5,7),(329,2,6,7),(333,5,0,16),(335,5,0,12),(336,5,1,12),(337,3,0,7),(338,3,1,7),(342,5,2,16),(344,5,2,12),(345,5,3,12),(346,3,5,7),(347,3,6,7),(351,5,4,16),(353,5,4,12),(354,5,5,12),(355,4,0,7),(356,4,1,7),(360,5,6,16),(362,5,6,12),(363,5,7,12),(364,4,5,7),(365,4,6,7),(369,5,8,16),(371,5,8,12),(372,5,9,12),(373,5,0,7),(374,5,1,7),(378,6,0,16),(380,6,0,12),(381,6,1,12),(382,5,5,7),(383,5,6,7),(387,6,2,16),(389,6,2,12),(390,6,3,12),(396,6,4,16),(398,6,4,12),(399,6,5,12),(400,6,5,7),(401,6,6,7),(405,6,6,16),(407,6,6,12),(408,6,7,12),(409,7,0,7),(414,6,8,16),(416,6,8,12),(417,6,9,12),(418,7,5,7),(419,7,6,7),(423,7,0,16),(425,7,0,12),(427,8,0,7),(428,8,1,7),(432,7,2,16),(434,7,2,12),(436,8,5,7),(437,8,6,7),(441,7,4,16),(443,7,4,12),(445,9,0,7),(446,9,1,7),(447,9,2,7),(448,9,3,7),(449,9,4,7),(450,7,6,16),(452,7,6,12),(453,7,7,12),(454,9,5,7),(455,9,6,7),(456,9,7,7),(459,7,8,16),(461,7,8,12),(463,0,0,8),(464,0,1,8),(465,0,2,8),(468,8,0,16),(470,8,0,12),(472,1,0,8),(473,1,1,8),(477,8,4,16),(479,8,4,12),(481,1,5,8),(482,1,6,8),(483,1,7,8),(486,8,6,16),(488,8,6,12),(490,2,5,8),(491,2,6,8),(492,2,7,8),(495,9,0,16),(497,9,0,12),(504,0,4,15),(506,0,4,11),(507,0,5,11),(513,0,6,15),(515,0,6,11),(516,0,7,11),(517,6,5,8),(518,6,6,8),(519,6,7,8),(522,0,6,17),(524,0,6,13),(526,7,0,8),(527,7,1,8),(528,7,2,8),(531,0,8,17),(533,0,8,13),(535,4,5,8),(536,4,6,8),(540,9,8,16),(542,9,8,12),(544,4,5,5),(545,4,6,5),(549,7,8,15),(551,7,8,11);
/*!40000 ALTER TABLE `General_boxassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_boxstock`
--

DROP TABLE IF EXISTS `General_boxstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_boxstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `tubesAtATime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_boxstock`
--

LOCK TABLES `General_boxstock` WRITE;
/*!40000 ALTER TABLE `General_boxstock` DISABLE KEYS */;
INSERT INTO `General_boxstock` VALUES (1,'WorkinStock',5),(2,'Backup-Nahmias',2),(3,'Nitrogen Stock.',2);
/*!40000 ALTER TABLE `General_boxstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_entity`
--

DROP TABLE IF EXISTS `General_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `created_on_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `General_entity_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_836f8eb9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_entity`
--

LOCK TABLES `General_entity` WRITE;
/*!40000 ALTER TABLE `General_entity` DISABLE KEYS */;
INSERT INTO `General_entity` VALUES (2,'odr-7:: ChR2-YFP unc-119::GCaMP-1 unc-119::DsRed','2014-09-28 09:03:59',2),(3,'gcy-5:: ChR2-YFP unc-119::GCaMP1 unc-119::DsRed','2014-09-28 09:03:59',2),(4,'gcy-5:: ChR2-YFP gcy-8:: GCaMP-2','2014-09-28 09:03:59',2),(5,'pax-2::GFP glr-1::GCaMP-2 odr-7::ChR2-YFP ','2014-09-28 09:03:59',2),(6,'pax-2::GFP glr-1::GCaMP-2 odr-7::ChR2-YFP gcy-5::DsRed2','2014-09-28 09:03:59',2),(7,'gcy-5::GCaMP-2','2014-09-28 09:03:59',2),(8,'glr-1::GCaMP-2','2014-09-28 09:03:59',2),(9,'gcy-5: ChR2-cherry glr-1::GCaMP-2','2014-09-28 09:03:59',2),(10,'glr-1::ChR2-cherry gcy-5::GCaMP-2','2014-09-28 09:03:59',2),(11,'gcy-5:: ChR2-cherry gcy-8::GCaMP2','2014-09-28 09:03:59',2),(12,'gcy-5:: ChR2-cherry glr-1::GCaMP1','2014-09-28 09:03:59',2),(13,'gcy-5:: ChR2-cherry gcy-5:: GCaMP-1','2014-09-28 09:03:59',2),(14,'glr-1::ChR2-chry glr-1::GCaMP1','2014-09-28 09:03:59',2),(15,'eat-4::ChR2-cherry glr-1::GCaMP1','2014-09-28 09:03:59',2),(16,'sra-6:: ChR2-cherry sra-6:: GCaMP-1','2014-09-28 09:03:59',2),(17,'gcy-5::iGluR6-chry','2014-09-28 09:03:59',2),(18,'str-2::GCaMP-2','2014-09-28 09:03:59',2),(19,'myo-3::GFP-Aequorin','2014-09-28 09:03:59',2),(20,'dgk-1::GFP-Aequorin','2014-09-28 09:03:59',2),(21,'str-2::ChR2-chry(H134R) str-2::GCaMP-2','2014-09-28 09:03:59',2),(22,'gcy-5::ChR2-chry(H134R) gcy-5::GCaMP-2','2014-09-28 09:03:59',2),(23,'unc-119::GFP-Aequorin','2014-09-28 09:03:59',2),(24,'gcy-5::ChR2-chry(H134R)','2014-09-28 09:03:59',2),(25,'str-2::ChR2-chry(H134R)','2014-09-28 09:03:59',2),(26,'gcy-5::ChR2-chry(H134R) 1','2014-09-28 09:03:59',2),(27,'gcy-8::ChR2-chry(H134R) gcy-8::GCaMP-2','2014-09-28 09:03:59',2),(28,'gcy-8::GCaMP-2','2014-09-28 09:03:59',2),(29,'mec-4::ChR2-chry(H134R)','2014-09-28 09:03:59',2),(30,'myo-3::ChR2-chry(H134R)','2014-09-28 09:03:59',2),(31,'sra-6:: GFP-Aequorin ','2014-09-28 09:03:59',2),(32,'str-2:: GFP-Aequorin ','2014-09-28 09:03:59',2),(33,'C37::GFP ','2014-09-28 09:03:59',2),(34,'rpa-0::GFP ','2014-09-28 09:03:59',2),(35,'sra-6::GCaMP-3 ','2014-09-28 09:03:59',2),(36,'sra-6 lite (sharad)','2014-09-28 09:03:59',2),(37,'sra-6 (sharad)','2014-09-28 09:03:59',2),(38,'gcy-8::GCaMP-3','2014-09-28 09:03:59',2),(39,'str-1::GCaMP-3','2014-09-28 09:03:59',2),(40,'gpa-4::GCaMP-3','2014-09-28 09:03:59',2),(41,'str-2::GCaMP3','2014-09-28 09:03:59',2),(42,'str-1::GFP','2014-09-28 09:03:59',2),(43,'glr-3::GCaMP-3','2014-09-28 09:03:59',2),(44,'pha-1, lite-1','2014-09-28 09:03:59',2),(45,'eat-4::GCaMP-3','2014-09-28 09:03:59',2),(46,'gcy-5::GCaMP-3','2014-09-28 09:03:59',2),(47,'sra-6::ChR2, glr-3::GCaMP-3 ','2014-09-28 09:03:59',2),(48,'myo-2::HyLi-GFP-Plus','2014-09-28 09:03:59',2),(49,'sra-6::GCaMP3 ','2014-09-28 09:03:59',2),(50,'srh-142::GCaMP-3','2014-09-28 09:03:59',2),(51,'srg-8::GCaMP-3','2014-09-28 09:03:59',2),(52,'gpa-4::ChR2-cherry(zs)','2014-09-28 09:03:59',2),(53,'gcy-8::ChR2(zs)','2014-09-28 09:03:59',2),(54,'str-2::ChR2-cherry (zs)','2014-09-28 09:03:59',2),(55,'sra-6::ChR2-cherry (zs, C128S)','2014-09-28 09:03:59',2),(56,'dat-1::GCaMP3','2014-09-28 09:03:59',2),(57,'des-2::GCaMP3','2014-09-28 09:03:59',2),(58,'srsx-3::GCaMP3','2014-09-28 09:03:59',2),(59,'gcy-7::GCaMP3','2014-09-28 09:03:59',2),(61,'gpa-4::ChR2-cherry(zs) 1','2014-09-28 09:03:59',2),(62,'gcy-33::ChR2-cherry(zs)','2014-09-28 09:03:59',2),(64,'str-2(2)::GCaMP-3','2014-09-28 09:03:59',2),(65,'glr-3::ChR2-cherry(zs)','2014-09-28 09:03:59',2),(66,'gcy-8::ChR2-cherry(zs)','2014-09-28 09:03:59',2),(67,'myo-3::Arch-GFP','2014-09-28 09:03:59',2),(68,'mec-4(2)::ChR2-cherry(zs)','2014-09-28 09:03:59',2),(69,'ocr-4::ChR2-cherry(zs)','2014-09-28 09:03:59',2),(70,'unc-31(e928); pha-1(e2123ts)','2014-09-28 09:03:59',2),(71,'gcy-5:: ChR2-cherry(zs)','2014-09-29 07:44:01',2),(72,'unc-31(e928); pha-1(e2123ts) Ex[des-2::GCaMP-3; pha-1]','2014-09-29 07:44:01',2),(73,'srh-142::ChR2-cherry(zs)','2014-09-29 08:17:12',2),(74,'str-1::ChR2-cherry(zs)','2014-09-29 08:17:12',2),(75,'nmr-1::ChR2-cherry(zs)','2014-09-29 08:17:12',2),(76,'nmr-1::GCaMP3 ','2014-09-29 08:17:12',2),(77,'osm-3::GCaMP3','2014-09-29 08:17:12',2),(78,'unc-31(e928); pha-1(e2123ts) Ex[str-1::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(79,'unc-31(e928); pha-1(e2123ts) Ex[str-2::GCaMP-3; pha-1;him-5]','2014-09-29 08:17:12',2),(80,'gpa-4::Arch-GFP','2014-09-29 08:17:12',2),(81,'str-1::Arch-GFP','2014-09-29 08:17:12',2),(82,'ocr-4::GCaMP3','2014-09-29 08:17:12',2),(83,'myo-3::ChR2-cherry(zs)','2014-09-29 08:17:12',2),(84,'del-1::ChR2-cherry(zs)','2014-09-29 08:17:12',2),(85,'gpa-9::GCaMP3','2014-09-29 08:17:12',2),(86,'fut-1::GCaMP3','2014-09-29 08:17:12',2),(87,'unc-31(e928); pha-1(e2123ts) Ex[gcy-5::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(88,'sra-9::GCaMP3','2014-09-29 08:17:12',2),(89,'Combo-1','2014-09-29 08:17:12',2),(90,'sra-6::Arch','2014-09-29 08:17:12',2),(91,'str-2::Arch','2014-09-29 08:17:12',2),(92,'mec-4::GCaMP-3','2014-09-29 08:17:12',2),(93,'gcy-33::GCaMP-3','2014-09-29 08:17:12',2),(94,'combo-3','2014-09-29 08:17:12',2),(95,'sri-51::GCaMP-3','2014-09-29 08:17:12',2),(96,'Combo-4','2014-09-29 08:17:12',2),(97,'unc-13 mutant','2014-09-29 08:17:12',2),(98,'Combo-2','2014-09-29 08:17:12',2),(99,'unc-13(e51),str-2::GCaMP3 Ex[str-2::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(100,'Combo-5','2014-09-29 08:17:12',2),(101,'Combo-6','2014-09-29 08:17:12',2),(102,'Combo-7','2014-09-29 08:17:12',2),(103,'unc-13(e51),str-1::GCaMP3 Ex[str-1::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(104,'unc-13(e51),gcy-5::GCaMP3 Ex[gcy-5::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(105,'Combo-8','2014-09-29 08:17:12',2),(106,'unc-13(e51),fut-1::GCaMP3 Ex[fut-1::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(107,'unc-13(s69)','2014-09-29 08:17:12',2),(108,'srsx-3::ChR2-cherry(zs)','2014-09-29 08:17:12',2),(109,'Combo-9','2014-09-29 08:17:12',2),(110,'Combo-10','2014-09-29 08:17:12',2),(111,'Combo-11','2014-09-29 08:17:12',2),(112,'Combo-12','2014-09-29 08:17:12',2),(113,'Combo-13','2014-09-29 08:17:12',2),(114,'unc-13(S69),fut-1::GCaMP3 Ex[fut-1::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(115,'unc-13(S69),str-2::GCaMP3 Ex[str-2::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(116,'gpa-6::GCaMP-3','2014-09-29 08:17:12',2),(117,'Combo-14','2014-09-29 08:17:12',2),(118,'PY7502','2014-09-29 08:17:12',2),(119,'unc-31(e928); pha-1(e2123ts) Ex[fut-1::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(120,'Combo-15','2014-09-29 08:17:12',2),(121,'unc-13(S69),gcy-5::GCaMP3 Ex[gcy-5::GCaMP-3; pha-1]','2014-09-29 08:17:12',2),(122,'str-2::RCaMP','2014-09-29 08:17:12',2),(123,'gpa-4::ChR2 x str-2::G3','2014-09-29 08:17:12',2),(124,'Pha-1(e2123ts) ; him-5; lite-1(ce314) ','2014-09-29 08:17:12',2),(125,'Sra-6::GCaMP6m','2014-09-29 08:17:12',2),(126,'wdr-5.1 (ok1417)','2014-09-29 08:17:12',2),(127,'daf-2(e1370)','2014-09-29 08:17:12',2),(128,'hat-1(ok1265) ','2014-09-29 08:17:12',2),(129,'hcf-1 (pk924)','2014-09-29 08:17:12',2),(130,'met-2 (n4256)','2014-09-29 08:17:12',2),(131,'hda-2 (ok1479)','2014-09-29 08:17:12',2),(132,'hlp-2 (tm1489)','2014-09-29 08:17:12',2),(133,'hda-3 (ok1991)','2014-09-29 08:17:12',2),(134,'unc54::Abeta','2014-09-29 08:17:12',2),(135,'hda-4 (ok518)','2014-09-29 08:17:12',2),(136,'zfp-1 (ok554)','2014-09-29 08:17:12',2),(137,'unc-54::polyQ35','2014-09-29 08:17:12',2),(138,'F2513.3;polyQ40','2014-09-29 08:17:12',2),(139,'dat-1 (ok157) ','2014-09-29 08:17:12',2),(140,'tph-1 (mg280) ','2014-09-29 08:17:12',2),(141,'eat-4 (ky-5) ','2014-09-29 08:17:12',2),(142,'tdc-1 (n3420) ','2014-09-29 08:17:12',2),(143,'cat-2(e1112) ','2014-09-29 08:17:12',2),(144,'bas-1 (ad446)','2014-09-29 08:17:12',2),(145,'gcy-5::G3,gpa-4::ChR2','2014-09-29 08:17:12',2),(146,'odr-10 CX32','2014-09-29 08:17:12',2),(147,'odr-10 CX3410','2014-09-29 08:17:12',2),(148,'hen-1 (tm501) ','2014-09-29 08:17:12',2),(149,'ttx-3 (mg158) ','2014-09-29 08:17:12',1),(150,'fkh-7 (tm6093) ','2014-10-01 13:18:11',2),(151,' chd-7 (tm6139)','2014-10-01 13:18:11',2),(152,'nlg-1(ok259)','2014-10-01 13:18:11',2),(153,'nrx-1(ds1)','2014-10-01 13:18:11',2),(154,'pha-1(e2123ts); him-5 (e1490)','2014-10-01 13:18:11',2),(155,'daf-16p::DAF-16::GFP','2014-10-07 06:03:31',2),(156,'str-2::RCaMP, gpa-6::GCaMP3','2014-10-07 06:03:31',2),(157,'chd-7 (tm6183)','2014-10-07 11:10:18',2);
/*!40000 ALTER TABLE `General_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_fridge`
--

DROP TABLE IF EXISTS `General_fridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_fridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fridge_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_fridge`
--

LOCK TABLES `General_fridge` WRITE;
/*!40000 ALTER TABLE `General_fridge` DISABLE KEYS */;
INSERT INTO `General_fridge` VALUES (1,'Revco -80'),(2,'Nahmais'),(3,'Nitrogen.');
/*!40000 ALTER TABLE `General_fridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_instance`
--

DROP TABLE IF EXISTS `General_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frozen_on_date` datetime NOT NULL,
  `boxAssociation_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `boxAssociation_id` (`boxAssociation_id`),
  KEY `General_instance_c096cf48` (`entity_id`),
  CONSTRAINT `boxAssociation_id_refs_id_3a7879c3` FOREIGN KEY (`boxAssociation_id`) REFERENCES `General_boxassociation` (`id`),
  CONSTRAINT `entity_id_refs_id_d12aa8f1` FOREIGN KEY (`entity_id`) REFERENCES `General_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_instance`
--

LOCK TABLES `General_instance` WRITE;
/*!40000 ALTER TABLE `General_instance` DISABLE KEYS */;
INSERT INTO `General_instance` VALUES (35,'2014-09-29 07:44:01',35,31),(36,'2014-09-29 07:44:01',36,32),(37,'2014-09-29 07:44:01',37,9),(38,'2014-09-29 07:44:01',38,10),(39,'2014-09-29 07:44:01',39,11),(40,'2014-09-29 07:44:01',40,12),(41,'2014-09-29 07:44:01',41,14),(42,'2014-09-29 07:44:01',42,15),(43,'2014-09-29 07:44:01',43,17),(44,'2014-09-29 07:44:01',44,20),(45,'2014-09-29 07:44:01',45,23),(81,'2014-10-01 13:18:11',81,38),(82,'2014-10-01 13:18:11',82,38),(90,'2014-10-01 13:18:11',90,38),(92,'2014-10-01 13:18:11',92,38),(93,'2014-10-01 13:18:11',93,38),(94,'2014-10-01 13:18:11',94,39),(95,'2014-10-01 13:18:11',95,39),(96,'2014-10-01 13:18:11',96,39),(99,'2014-10-01 13:18:11',99,39),(101,'2014-10-01 13:18:11',101,39),(103,'2014-10-01 13:18:11',103,40),(104,'2014-10-01 13:18:11',104,40),(105,'2014-10-01 13:18:11',105,40),(106,'2014-10-01 13:18:11',106,40),(108,'2014-10-01 13:18:11',108,40),(109,'2014-10-01 13:18:11',109,40),(110,'2014-10-01 13:18:11',110,40),(112,'2014-10-01 13:18:11',112,44),(117,'2014-10-01 13:18:11',117,44),(119,'2014-10-01 13:18:11',119,44),(120,'2014-10-01 13:18:11',120,44),(121,'2014-10-01 13:18:11',121,46),(122,'2014-10-01 13:18:11',122,46),(123,'2014-10-01 13:18:11',123,46),(126,'2014-10-01 13:18:11',126,46),(128,'2014-10-01 13:18:11',128,46),(129,'2014-10-01 13:18:11',129,46),(130,'2014-10-01 13:18:11',130,47),(131,'2014-10-01 13:18:11',131,47),(132,'2014-10-01 13:18:11',132,47),(135,'2014-10-01 13:18:11',135,47),(137,'2014-10-01 13:18:11',137,47),(138,'2014-10-01 13:18:11',138,47),(139,'2014-10-01 13:18:11',139,52),(140,'2014-10-01 13:18:11',140,52),(141,'2014-10-01 13:18:11',141,52),(142,'2014-10-01 13:18:11',142,52),(143,'2014-10-01 13:18:11',143,52),(144,'2014-10-01 13:18:11',144,52),(146,'2014-10-01 13:18:11',146,52),(147,'2014-10-01 13:18:11',147,52),(148,'2014-10-01 13:18:11',148,57),(149,'2014-10-01 13:18:11',149,57),(150,'2014-10-01 13:18:11',150,57),(153,'2014-10-01 13:18:11',153,57),(155,'2014-10-01 13:18:11',155,57),(157,'2014-10-01 13:18:11',157,71),(158,'2014-10-01 13:18:11',158,71),(162,'2014-10-01 13:18:11',162,71),(164,'2014-10-01 13:18:11',164,71),(165,'2014-10-01 13:18:11',165,71),(166,'2014-10-01 13:18:11',166,62),(167,'2014-10-01 13:18:11',167,62),(168,'2014-10-01 13:18:11',168,62),(171,'2014-10-01 13:18:11',171,62),(173,'2014-10-01 13:18:11',173,62),(174,'2014-10-01 13:18:11',174,62),(180,'2014-10-01 13:18:11',180,64),(182,'2014-10-01 13:18:11',182,64),(183,'2014-10-01 13:18:11',183,64),(189,'2014-10-01 13:18:11',189,65),(191,'2014-10-01 13:18:11',191,65),(192,'2014-10-01 13:18:11',192,65),(193,'2014-10-01 13:18:11',193,67),(194,'2014-10-01 13:18:11',194,67),(195,'2014-10-01 13:18:11',195,67),(198,'2014-10-01 13:18:11',198,67),(199,'2014-10-01 13:18:11',199,67),(200,'2014-10-01 13:18:11',200,67),(201,'2014-10-01 13:18:11',201,67),(202,'2014-10-01 13:18:11',202,77),(203,'2014-10-01 13:18:11',203,77),(204,'2014-10-01 13:18:11',204,77),(207,'2014-10-01 13:18:11',207,77),(209,'2014-10-01 13:18:11',209,77),(210,'2014-10-01 13:18:11',210,77),(211,'2014-10-01 13:18:11',211,89),(216,'2014-10-01 13:18:11',216,89),(218,'2014-10-01 13:18:11',218,89),(220,'2014-10-01 13:18:11',220,91),(221,'2014-10-01 13:18:11',221,91),(225,'2014-10-01 13:18:11',225,91),(227,'2014-10-01 13:18:11',227,91),(228,'2014-10-01 13:18:11',228,91),(229,'2014-10-01 13:18:11',229,96),(230,'2014-10-01 13:18:11',230,96),(231,'2014-10-01 13:18:11',231,96),(234,'2014-10-01 13:18:11',234,96),(236,'2014-10-01 13:18:11',236,96),(238,'2014-10-01 13:18:11',238,100),(239,'2014-10-01 13:18:11',239,100),(243,'2014-10-01 13:18:11',243,100),(245,'2014-10-01 13:18:11',245,100),(247,'2014-10-01 13:18:11',247,109),(248,'2014-10-01 13:18:11',248,109),(249,'2014-10-01 13:18:11',249,109),(252,'2014-10-01 13:18:11',252,109),(254,'2014-10-01 13:18:11',254,109),(256,'2014-10-01 13:18:11',256,110),(257,'2014-10-01 13:18:11',257,110),(261,'2014-10-01 13:18:11',261,110),(263,'2014-10-01 13:18:11',263,110),(265,'2014-10-01 13:18:11',265,116),(266,'2014-10-01 13:18:11',266,116),(270,'2014-10-01 13:18:11',270,116),(272,'2014-10-01 13:18:11',272,116),(273,'2014-10-01 13:18:11',273,116),(274,'2014-10-01 13:18:11',274,122),(275,'2014-10-01 13:18:11',275,122),(276,'2014-10-01 13:18:11',276,122),(277,'2014-10-01 13:18:11',277,122),(279,'2014-10-01 13:18:11',279,122),(281,'2014-10-01 13:18:11',281,122),(282,'2014-10-01 13:18:11',282,122),(283,'2014-10-01 13:18:11',283,123),(284,'2014-10-01 13:18:11',284,123),(285,'2014-10-01 13:18:11',285,123),(288,'2014-10-01 13:18:11',288,123),(290,'2014-10-01 13:18:11',290,123),(291,'2014-10-01 13:18:11',291,123),(292,'2014-10-01 13:18:11',292,125),(293,'2014-10-01 13:18:11',293,125),(299,'2014-10-01 13:18:11',299,125),(300,'2014-10-01 13:18:11',300,125),(301,'2014-10-01 13:18:11',301,126),(302,'2014-10-01 13:18:11',302,126),(306,'2014-10-01 13:18:11',306,126),(308,'2014-10-01 13:18:11',308,126),(309,'2014-10-01 13:18:11',309,126),(310,'2014-10-01 13:18:11',310,127),(315,'2014-10-01 13:18:11',315,127),(317,'2014-10-01 13:18:11',317,127),(318,'2014-10-01 13:18:11',318,127),(319,'2014-10-01 13:18:11',319,128),(320,'2014-10-01 13:18:11',320,128),(324,'2014-10-01 13:18:11',324,128),(326,'2014-10-01 13:18:11',326,128),(327,'2014-10-01 13:18:11',327,128),(328,'2014-10-01 13:18:11',328,129),(329,'2014-10-01 13:18:11',329,129),(333,'2014-10-01 13:18:11',333,129),(335,'2014-10-01 13:18:11',335,129),(336,'2014-10-01 13:18:11',336,129),(337,'2014-10-01 13:18:11',337,130),(338,'2014-10-01 13:18:11',338,130),(342,'2014-10-01 13:18:11',342,130),(344,'2014-10-01 13:18:11',344,130),(345,'2014-10-01 13:18:11',345,130),(346,'2014-10-01 13:18:11',346,131),(347,'2014-10-01 13:18:11',347,131),(351,'2014-10-01 13:18:11',351,131),(353,'2014-10-01 13:18:11',353,131),(354,'2014-10-01 13:18:11',354,131),(355,'2014-10-01 13:18:11',355,132),(356,'2014-10-01 13:18:11',356,132),(360,'2014-10-01 13:18:11',360,132),(362,'2014-10-01 13:18:11',362,132),(363,'2014-10-01 13:18:11',363,132),(364,'2014-10-01 13:18:11',364,133),(365,'2014-10-01 13:18:11',365,133),(369,'2014-10-01 13:18:11',369,133),(371,'2014-10-01 13:18:11',371,133),(372,'2014-10-01 13:18:11',372,133),(373,'2014-10-01 13:18:11',373,135),(374,'2014-10-01 13:18:11',374,135),(378,'2014-10-01 13:18:11',378,135),(380,'2014-10-01 13:18:11',380,135),(381,'2014-10-01 13:18:11',381,135),(382,'2014-10-01 13:18:11',382,136),(383,'2014-10-01 13:18:11',383,136),(387,'2014-10-01 13:18:11',387,136),(389,'2014-10-01 13:18:11',389,136),(390,'2014-10-01 13:18:11',390,136),(396,'2014-10-01 13:18:11',396,134),(398,'2014-10-01 13:18:11',398,134),(399,'2014-10-01 13:18:11',399,134),(400,'2014-10-01 13:18:11',400,137),(401,'2014-10-01 13:18:11',401,137),(405,'2014-10-01 13:18:11',405,137),(407,'2014-10-01 13:18:11',407,137),(408,'2014-10-01 13:18:11',408,137),(409,'2014-10-01 13:18:11',409,138),(414,'2014-10-01 13:18:11',414,138),(416,'2014-10-01 13:18:11',416,138),(417,'2014-10-01 13:18:11',417,138),(418,'2014-10-01 13:18:11',418,139),(419,'2014-10-01 13:18:11',419,139),(423,'2014-10-01 13:18:11',423,139),(425,'2014-10-01 13:18:11',425,139),(427,'2014-10-01 13:18:11',427,140),(428,'2014-10-01 13:18:11',428,140),(432,'2014-10-01 13:18:11',432,140),(434,'2014-10-01 13:18:11',434,140),(436,'2014-10-01 13:18:11',436,141),(437,'2014-10-01 13:18:11',437,141),(441,'2014-10-01 13:18:11',441,141),(443,'2014-10-01 13:18:11',443,141),(445,'2014-10-01 13:18:11',445,142),(446,'2014-10-01 13:18:11',446,142),(447,'2014-10-01 13:18:11',447,142),(448,'2014-10-01 13:18:11',448,142),(449,'2014-10-01 13:18:11',449,142),(450,'2014-10-01 13:18:11',450,142),(452,'2014-10-01 13:18:11',452,142),(453,'2014-10-01 13:18:11',453,142),(454,'2014-10-01 13:18:11',454,143),(455,'2014-10-01 13:18:11',455,143),(456,'2014-10-01 13:18:11',456,143),(459,'2014-10-01 13:18:11',459,143),(461,'2014-10-01 13:18:11',461,143),(463,'2014-10-01 13:18:11',463,144),(464,'2014-10-01 13:18:11',464,144),(465,'2014-10-01 13:18:11',465,144),(468,'2014-10-01 13:18:11',468,144),(470,'2014-10-01 13:18:11',470,144),(472,'2014-10-01 13:18:11',472,146),(473,'2014-10-01 13:18:11',473,146),(477,'2014-10-01 13:18:11',477,146),(479,'2014-10-01 13:18:11',479,146),(481,'2014-10-01 13:18:11',481,147),(482,'2014-10-01 13:18:11',482,147),(483,'2014-10-01 13:18:11',483,147),(486,'2014-10-01 13:18:11',486,147),(488,'2014-10-01 13:18:11',488,147),(490,'2014-10-01 13:18:11',490,149),(491,'2014-10-01 13:18:11',491,149),(492,'2014-10-01 13:18:11',492,149),(495,'2014-10-01 13:18:11',495,149),(497,'2014-10-01 13:18:11',497,149),(504,'2014-10-01 13:18:11',504,54),(506,'2014-10-01 13:18:11',506,54),(507,'2014-10-01 13:18:11',507,54),(513,'2014-10-01 13:18:11',513,55),(515,'2014-10-01 13:18:11',515,55),(516,'2014-10-01 13:18:11',516,55),(517,'2014-10-01 13:18:11',517,152),(518,'2014-10-01 13:18:11',518,152),(519,'2014-10-01 13:18:11',519,152),(522,'2014-10-01 13:18:11',522,152),(524,'2014-10-01 13:18:11',524,152),(526,'2014-10-01 13:18:11',526,153),(527,'2014-10-01 13:18:11',527,153),(528,'2014-10-01 13:18:11',528,153),(531,'2014-10-01 13:18:11',531,153),(533,'2014-10-01 13:18:11',533,153),(535,'2014-10-01 13:18:11',535,154),(536,'2014-10-01 13:18:11',536,154),(540,'2014-10-01 13:18:11',540,154),(542,'2014-10-01 13:18:11',542,154),(544,'2014-10-02 12:34:43',544,93),(545,'2014-10-02 12:34:43',545,93),(549,'2014-10-02 12:34:43',549,93),(551,'2014-10-02 12:34:43',551,93);
/*!40000 ALTER TABLE `General_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WormRepository_wormstrain`
--

DROP TABLE IF EXISTS `WormRepository_wormstrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WormRepository_wormstrain` (
  `entity_ptr_id` int(11) NOT NULL,
  `origin` int(11) NOT NULL,
  `azNumber` int(11) NOT NULL,
  `madeBy` varchar(256) NOT NULL,
  `officialName` varchar(256) NOT NULL,
  `isChecked` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`entity_ptr_id`),
  UNIQUE KEY `azNumber` (`azNumber`),
  CONSTRAINT `entity_ptr_id_refs_id_08512c87` FOREIGN KEY (`entity_ptr_id`) REFERENCES `General_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WormRepository_wormstrain`
--

LOCK TABLES `WormRepository_wormstrain` WRITE;
/*!40000 ALTER TABLE `WormRepository_wormstrain` DISABLE KEYS */;
INSERT INTO `WormRepository_wormstrain` VALUES (2,2,1,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(3,2,2,'Alon','',0,'Made by alon in CalTech, no copies in Israel'),(4,2,3,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(5,2,4,'Alon','',0,'glr-1 with GCaMP\r\nAWA – ChR2\r\n\r\nOnly glr-1 neurons are seen\r\n\r\nMade by Alon in CalTech, no copies in Israel'),(6,2,5,'Alon','',0,'Glr-1 with GCaMP\r\nAWA – ChR2\r\n\r\nOnly glr-1 are seen\r\n\r\nMade by Alon in CalTech, no copies in Israel'),(7,2,6,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(8,2,7,'Alon','',0,'Made by Alon in CalTech, No copies in Israel'),(9,2,8,'Alon','',0,'AZ-8-1 Many mosaic, \r\nGCaMP is dim\r\n\r\nMade by Alon in CalTech'),(10,2,9,'Alon','',0,'Made by Alon in CalTech'),(11,2,10,'Alon','',0,'AZ-10-2 strong GCaMP, highly transmittable\r\n\r\nMade by ALon in CalTech,'),(12,2,11,'Alon','',0,'Made by Alon in CalTech'),(13,2,12,'Alon','',0,'Only ChR2 observed\r\n\r\nMade by Alon in CalTech, no copies in Israel'),(14,2,13,'Alon','',0,'Signal was detected in Ca imaging\r\n\r\nMade by ALon in CalTech'),(15,2,14,'Alon','',0,'Made by Alon in CalTeh'),(16,2,15,'Alon','',0,'Can see only the cherry\r\n\r\nMade by Alon in CalTech, no copies in Israel'),(17,2,16,'Alon','',0,'Chry is seen in many pharynx cells\r\n\r\nMade by Alon in CalTech'),(18,2,17,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(19,2,18,'Alon','',0,'Made by Alon in CalTech'),(20,2,19,'Alon','',0,'Made by Alon in CalTech'),(21,2,20,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(22,2,21,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(23,2,22,'Alon','',0,'Made by Alon in  CalTech'),(24,2,23,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(25,2,24,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(26,2,25,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(27,2,26,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(28,2,27,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(29,2,28,'Alon','',0,'Made by Alon in  CalTech, no copies in Israel '),(30,2,29,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(31,2,30,'Alon','',0,'pha-1 bkg\r\nMade by Alon in CalTech'),(32,2,31,'Alon','',0,'pha-1 bkg\r\nMade by Alon in CalTech'),(33,2,32,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(34,2,33,'Alon','',0,'Made by Alon in CalTech, no copies in Israel'),(35,2,34,'Alon','',0,'pha-1 bkg\r\nMade by Alon in CalTech'),(36,2,35,'?','',0,'Ex[psra-6::chop-2(H134R), posm-10::GcaMP, punc-122::mCherry]; pnmr-1::GCaMP V; lite-1(ce314) X\r\n'),(37,2,36,'?','',0,'Ex[psra-6::chop-2(H134R), posm-10::GcaMP, punc-122::mCherry]; pnmr-1::GCaMP V'),(38,2,37,'Alon','PS6389',1,'syEx1251[gcy-8::GCaMP3+pha-1]; pha-1(e2123ts)\r\nMade by Alon in CalTech'),(39,2,38,'Alon','PS6384',1,'syEx1245[str-1::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(40,2,39,'Alon','PS6410',0,'syEx1200[gpa-4::GCaMP3+pha-1]; pha-1(e2123ts)\r\nMade by Alon in CalTech'),(41,2,40,'Alon','',0,'Made by Alon in CalTech'),(42,2,41,'Alon','',0,'Made by Alon in CalTech'),(43,2,42,'Alon','',0,'Made by Alon in CalTech'),(44,3,43,'','',1,'lite-1(ce314) X , pha-1(e2123)III (From Zengcai)'),(45,2,44,'Alon','',0,'Made by Alon in CalTech'),(46,2,45,'Alon','PS6382',1,'syEx1243[gcy-5::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(47,2,46,'Alon','',0,'In lite-1 bkg (injected pha-1,lite1 strain)\r\nMade by Alon in CalTech'),(48,2,47,'Alon','',0,'In pha-1 bkg\r\nMade by Alon in CalTech'),(49,2,48,'Alon','PS6386',0,'syEx1246[sra-6::GCaMP3+pha-1]; pha-1(e2123ts)\r\nIn lite-1 bkg (injected pha-1,lite1 strain)\r\nMade by Alon in CalTech'),(50,2,49,'Alon','PS6377',0,'syEx1249[srh-142::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(51,2,50,'Alon','',0,'pha-1 bkg\r\nMade by Alon in CalTech'),(52,2,51,'Alon','',1,'Lite-1 bkg \r\nMade by Alon in CalTech'),(53,2,52,'Alon','PS6249',0,'NOT a lite-1 bkg \r\n\r\nMade by Alon in CalTech\r\n'),(54,2,53,'Alon','',0,'lite-1 bkg\r\nMade by Alon in CalTech'),(55,2,54,'Alon','',0,'C128S mutation done on the H134R ChR2-mCherry of ZS.\r\nInjected in lite-1 bkg \r\nMade by Alon in CalTech'),(56,2,55,'Alon','PS6250',0,'syEx1236[dat-1::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(57,2,56,'Alon','PS6252',1,'syEx1237[des-2::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(58,2,57,'Alon','PS6253',0,'syEx1238[srsx-3::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(59,2,58,'Alon','PS6383',0,'syEx1244[gcy-7::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 bkg\r\nMade by Alon in CalTech'),(61,3,59,'Zengcai','',0,'From Zengcai \r\nin pha-1;lite-1'),(62,2,61,'Alon','',0,'pha-1;lite-1 bkg.  \r\nMade by Alon in CalTech'),(64,2,62,'Alon','PS6374',1,'syEx1240[str-2::GCaMP3+pha-1]; pha-1(e2123ts); him-5 (e1490)\r\npha-1;him-5 bkg\r\n\r\nMade by Alon in CalTech'),(65,2,63,'Alon','',0,'pha-1;lite-1 bkg\r\n\r\nMade by Alon in CalTech'),(66,2,64,'Alon','',0,'pha-1; lite-1 \r\n\r\nMade by Alon in CalTech'),(67,2,65,'Alon','',0,'Injected plasmid from Zengcai\r\npha-1;lite-1 bkg\r\n'),(68,2,66,'Alon','',0,'Made by Alon in CalTech\r\npha-1; lite-1 bkg'),(69,2,67,'Alon','',0,'Made by Alon in CalTech\r\npha-1; lite-1 bkg'),(70,3,68,'','',0,'keep in 15degC'),(71,2,60,'Alon','PS6259',1,'pha-1; lite-1 bkg'),(72,2,69,'Alon','',0,'des-2::GCaMP-3 into unc-31bkg (AZ-68)'),(73,2,70,'Alon','',0,'pha-1; lite-1 bkg'),(74,2,71,'Alon','',0,'pha-1; lite-1 '),(75,2,72,'Alon','',0,'pha-1; lite-1 '),(76,2,73,'Alon','',0,'pha-1 '),(77,2,74,'Alon','PS6376',1,'syEx1242[osm-3::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1'),(78,2,75,'Alon','',0,'str-1::GCaMP-3 into unc-31 bkg (AZ-68)'),(79,2,76,'Alon','',0,'str-2::GCaMP-3 into unc-31 bkg (AZ-68)'),(80,2,77,'Alon','',0,'pha-1; lite-1 bkg'),(81,2,78,'Alon','',0,'pha-1; lite-1 '),(82,2,79,'Alon','PS6378',0,'syEx1250[ocr-4::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 '),(83,2,80,'Alon','',0,'pha-1; lite-1 '),(84,2,81,'Alon','',0,'pha-1; lite-1 '),(85,2,82,'Alon','PS6388',0,'syEx1248[gpa-9::GCaMP3+pha-1]; pha-1(e2123ts); him-5(e1490)\r\npha-1; him-5 '),(86,2,83,'Alon','',0,'pha-1; him-5 '),(87,2,84,'Alon','',0,'gcy-5::GCaMP-3 into unc-31 bkg (AZ-68)'),(88,2,85,'Alon','PS6387',0,'syEx1247[sra-9::GCaMP3+pha-1]; pha-1(e2123ts); him-5(e1490)\r\npha-1;him-5 '),(89,2,86,'Alon','',0,'pha-1;him-5 bkg. [sra-6::ChR2, sra-6:G3, nmr-1::G3, del-1::G3,myo-3::G3] '),(90,2,87,'Alon','',0,'pha-1,lite-1 '),(91,2,88,'Alon','',0,'pha-1,lite-1 '),(92,2,89,'Alon','PS6393',0,'syEx1254[mec-4::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1,him-5 '),(93,2,90,'Alon','PS6416',1,'syEx1206[gcy-33::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1 '),(94,2,91,'Alon','',0,'gpa-9::ChR2-cherry\r\ngpa-9::GCaMP3\r\nsra-9::GCaMP3\r\nin pha-1;lite-1\r\n'),(95,2,92,'Alon','PS6522',0,'sri-51::GCaMP3+pha-1]; pha-1(e2123ts)\r\npha-1; him-5 '),(96,2,93,'Alon','',1,'gcy-5::ChR2-cherry\r\ngcy-5::GCaMP3\r\nstr-2::GCaMP3\r\nin pha-1;lite-1 \r\n'),(97,1,94,'','MT7929 ',0,'unc-13(e51) '),(98,2,95,'Alon','',0,'mec-4::ChR2\r\ndat-1::G3\r\npha-1, lite-1 bkg \r\n'),(99,2,96,'Alon','',0,'str-2::GCaMP-3 into unc-13(e51)  '),(100,2,97,'Alon','',1,'str-2::ChR2-cherry\r\nstr-2::GCaMP3\r\nsrsx-3::GCaMP3\r\nin pha-1;lite-1\r\n'),(101,2,98,'Alon','',0,'str-1::ChR2-cherry\r\nstr-1::GCaMP3\r\nstr-2::GCaMP3\r\nin pha-1;lite-1 \r\n'),(102,2,99,'Alon','',0,'gcy-5::ChR2-cherry\r\ngcy-5::GCaMP3\r\nsrsx-3::GCaMP3\r\nin pha-1;lite-1 \r\n'),(103,2,100,'Alon','',0,'str-1::GCaMP-3 into unc-13(e51) '),(104,2,101,'Alon','',0,'gcy-5::GCaMP-3 into unc-13(e51) '),(105,2,102,'Alon','',0,'gpa-5::ChR2-cherry (seen)\r\ngpa-5::GCaMP3 (?)\r\ngcy-5::GCaMP3 (?)\r\nnot sure which of the G3 is obeserved\r\nin pha-1;lite-1 \r\n'),(106,2,103,'Alon','',0,'fut-1::GCaMP-3 into unc-13(e51)'),(107,1,104,'','BC168',0,'unc-13 mutant'),(108,2,105,'Alon','',0,'pha-1; lite-1 '),(109,2,106,'Alon','',1,'mec-4::ChR2-cherry\r\nmec-4::GCaMP3\r\nstr-2::GCaMP3\r\nsra-6::GCaMP3\r\nin pha-1;lite-1 \r\n'),(110,2,107,'Alon','',1,'dat-1::ChR2-cherry\r\ndat-1::GCaMP3\r\nmec-4::GCaMP3\r\nin pha-1;lite-1 \r\n'),(111,2,108,'Alon','',0,'str-2::ChR2-cherry\r\nstr-2::GCaMP3\r\nfut-1::GCaMP3\r\nin pha-1;lite-1 \r\n'),(112,2,109,'Alon','',0,'str-2::ChR2-cherry\r\nstr-2::GCaMP3\r\ngpa-4::GCaMP3\r\nin pha-1;lite-1 \r\n'),(113,2,110,'Alon','',0,'gcy-5::ChR2-cherry (seen)\r\ngcy-5::GCaMP3 (seen)\r\ngpa-5::GCaMP3 (not seen)\r\nin pha-1;lite-1 \r\n'),(114,2,111,'Alon','',0,'fut-1::GCaMP-3 into unc-13(S69) '),(115,2,112,'Alon','',0,'str-2-1::GCaMP-3 into unc-13(S69)'),(116,2,113,'Alon','PS6390',1,'syEx1252[gpa-6::GCaMP3+pha-1]; pha-1(e2123ts); him-5(e1490)\r\npha-1,him-5 '),(117,2,114,'Alon','',0,'mec-4::ChR2,\r\nmec-4::G3,\r\nstr-2::G3\r\nin pha-1; him-5\r\n'),(118,1,115,'','PY7502',0,'Genetically-ablated AWC. Beverly M….Sengupta P. J. Neurosc, June 2011 '),(119,2,116,'Alon','',0,'fut-1::GCaMP-3 into unc-31 bkg (AZ-68), '),(120,2,117,'Alon','',0,'srsx-3::ChR2,\r\nsrsx-3::G3,\r\nstr-2::G3\r\nin pha-1;lite-1 \r\n'),(121,2,118,'Alon','',0,'gcy-5::GCaMP-3 into unc-13(S69)  '),(122,0,119,'Yifat','',1,'In pha-1, him-5 '),(123,0,120,'Yifat','',1,'Cross of gpa-4::ChR2 with str-2::G3. \r\nBackground: pha-1, him-5, lite-1. \r\nNeed to pick doubles'),(124,0,121,'Moria','',0,'Made by cross of pha-1(e2123ts) ; him-5 with pha-1(e2123ts);lite-1(ce314) '),(125,0,122,'Yifat','',1,'In pha-1, him-5'),(126,1,123,'','RB1304',1,'  '),(127,3,124,'','CB1370',0,'From Ehud Cohen'),(128,1,125,'','VC764',1,'  '),(129,1,126,'','XA8106',1,'  '),(130,1,127,'','MT13293',1,'  '),(131,1,128,'','VC983',1,'  '),(132,1,129,'','PFR40',1,'   '),(133,1,130,'','RB1618',1,'  '),(134,3,133,'','CL2006',0,'express Abeta under unc54 promoter  [Punc-54::beta-peptide1-42; pRF4]\r\nfrom Ehud Cohen'),(135,1,131,'','RB758',1,'  '),(136,1,132,'','RB774',1,'  '),(137,3,134,'','',1,'from Ehud Cohen'),(138,3,135,'','AM101',1,'from Ehud Cohen'),(139,1,136,'','RM2702',1,'  '),(140,1,137,'','GR1321',1,'Serotonin release mutant'),(141,1,138,'','MT6308',1,'Glu release mutant'),(142,1,139,'','MT10661',1,'Tyramine and octopamine release mutant'),(143,1,140,'','CB1112',1,'Dopamine release mutant'),(144,1,141,'','MT7988',1,'Serotonin and Dopamine release mutant'),(145,0,142,'Yifat','',0,'Didn\'t freeze well. No survivers\r\nCross of gcy-5::G3 with gpa-4::ChR2. \r\nBackground: pha-1, him-5, lite-1. \r\nNeed to pick doubles'),(146,1,143,'','CX32',1,' '),(147,1,144,'','CX3410',1,'  '),(148,1,145,'','JC2154',0,'Ordered by Eyal I. Not frozen, no worms alive'),(149,1,146,'','OH1',1,'Ordered by Eyal I.'),(150,3,148,'','',1,'Ordered by Eyal B. from Mitani\r\n '),(151,3,149,'','',1,'From Mitani.\r\nht2 balancer'),(152,1,154,'','vc228',1,'Ordered by Eyal B.'),(153,1,155,'','SG1',1,'Ordered by Eyal B.'),(154,3,150,'','',1,'???'),(155,3,156,'','TJ356',1,'From Ehud Cohen'),(156,0,157,'Idan','',1,'A cross between str-2::RCaMP (AZ119) and gpa-6::GCaMP3 (AZ113).\r\nNeed to pick doubles.  '),(157,3,147,'','',1,'Mitani.\r\nOrdered by Eyal BD.');
/*!40000 ALTER TABLE `WormRepository_wormstrain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WormRepository_wormstraininstance`
--

DROP TABLE IF EXISTS `WormRepository_wormstraininstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WormRepository_wormstraininstance` (
  `instance_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`instance_ptr_id`),
  CONSTRAINT `instance_ptr_id_refs_id_84f7b46d` FOREIGN KEY (`instance_ptr_id`) REFERENCES `General_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WormRepository_wormstraininstance`
--

LOCK TABLES `WormRepository_wormstraininstance` WRITE;
/*!40000 ALTER TABLE `WormRepository_wormstraininstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `WormRepository_wormstraininstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add fridge',7,'add_fridge'),(20,'Can change fridge',7,'change_fridge'),(21,'Can delete fridge',7,'delete_fridge'),(22,'Can add entity',8,'add_entity'),(23,'Can change entity',8,'change_entity'),(24,'Can delete entity',8,'delete_entity'),(25,'Can add instance',9,'add_instance'),(26,'Can change instance',9,'change_instance'),(27,'Can delete instance',9,'delete_instance'),(28,'Can add box',10,'add_box'),(29,'Can change box',10,'change_box'),(30,'Can delete box',10,'delete_box'),(34,'Can add worm strain',12,'add_wormstrain'),(35,'Can change worm strain',12,'change_wormstrain'),(36,'Can delete worm strain',12,'delete_wormstrain'),(37,'Can add worm strain instance',13,'add_wormstraininstance'),(38,'Can change worm strain instance',13,'change_wormstraininstance'),(39,'Can delete worm strain instance',13,'delete_wormstraininstance'),(40,'Can add box association',14,'add_boxassociation'),(41,'Can change box association',14,'change_boxassociation'),(42,'Can delete box association',14,'delete_boxassociation'),(43,'Can add box stock',15,'add_boxstock'),(44,'Can change box stock',15,'change_boxstock'),(45,'Can delete box stock',15,'delete_boxstock');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$BW4VJ5FTEMAl$ZfOx5bBZzQq1w1Fd/l8V/bkaI92e4MEvHZ0SyJhrVJU=','2014-09-29 13:53:59',1,'itskov','','','itskov@gmail.com',1,1,'2014-09-22 12:39:57'),(2,'pbkdf2_sha256$12000$KO7fi7JsLsRt$34JGJ9p0AQH+6q37DRDn5ySpYOzbj50JLceBYoMI/TQ=','2014-10-05 06:32:49',1,'yifate','','','yifat.eliezer@mail.huji.ac.il',1,1,'2014-09-28 08:57:03');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,34),(32,2,35),(33,2,36),(34,2,37),(35,2,38),(36,2,39),(37,2,40),(38,2,41),(39,2,42),(40,2,43),(41,2,44),(42,2,45);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-09-22 12:40:58',1,7,'1','Fridge object',1,''),(3,'2014-09-22 13:13:49',1,12,'1','WormStrain object',1,''),(4,'2014-09-22 13:47:24',1,12,'2','WormStrain object',1,''),(5,'2014-09-22 15:33:27',1,12,'1','WormStrain object',1,''),(6,'2014-09-22 15:59:33',1,12,'2','WormStrain object',1,''),(7,'2014-09-23 06:40:17',1,12,'1','gpa6::GCamp3',1,''),(8,'2014-09-23 06:40:50',1,7,'1','Revo-80',1,''),(9,'2014-09-23 06:40:54',1,10,'1','Box1',1,''),(10,'2014-09-23 06:40:55',1,14,'1','Box1: 5,5',1,''),(11,'2014-09-23 06:40:59',1,13,'1','WormStrainInstance object',1,''),(12,'2014-09-23 06:41:28',1,12,'2','GalsStrainm',1,''),(13,'2014-09-23 06:49:03',1,12,'3','str-1:GFP',1,''),(14,'2014-09-23 07:06:42',1,13,'1','WormStrainInstance object',2,'No fields changed.'),(15,'2014-09-23 07:44:06',1,10,'2','Box2',1,''),(16,'2014-09-23 12:59:18',1,10,'1','Box1',2,'Changed columns and rows.'),(17,'2014-09-23 13:03:10',1,13,'1','gpa6::GCamp3 tube',2,'No fields changed.'),(18,'2014-09-23 13:03:23',1,14,'2','Box1: 1,1',1,''),(19,'2014-09-23 13:03:27',1,13,'2','GalsStrainm tube',1,''),(20,'2014-09-23 13:03:55',1,14,'3','Box2: 2,2',1,''),(21,'2014-09-23 13:03:58',1,13,'3','str-1:GFP tube',1,''),(22,'2014-09-26 15:19:01',1,12,'1','dfgdg',1,''),(23,'2014-09-26 15:19:13',1,7,'1','dgd',1,''),(24,'2014-09-26 15:19:17',1,10,'1','dgd',1,''),(25,'2014-09-28 06:47:55',1,12,'1','gpa6::GCaMP3',1,''),(26,'2014-09-28 07:01:56',1,12,'1','gpa6::GCaMP3',1,''),(27,'2014-09-28 07:02:26',1,12,'2','str-2::GCamp3',1,''),(28,'2014-09-28 07:03:10',1,7,'1','Revo-80',1,''),(29,'2014-09-28 07:03:22',1,10,'1','A1',1,''),(30,'2014-09-28 07:03:33',1,10,'2','A2',1,''),(31,'2014-09-28 07:05:46',1,15,'1','WorkingStock',1,''),(32,'2014-09-28 07:05:48',1,10,'1','A1',2,'Changed stock.'),(33,'2014-09-28 07:06:13',1,7,'2','NahmiasFridge',1,''),(34,'2014-09-28 07:06:24',1,15,'2','Backup',1,''),(35,'2014-09-28 07:06:25',1,10,'3','B1',1,''),(36,'2014-09-28 07:08:03',1,12,'3','yifat',1,''),(37,'2014-09-28 07:08:06',1,12,'3','yifat',2,'No fields changed.'),(38,'2014-09-28 07:09:24',1,12,'3','yifat',2,'Changed azNumber.'),(39,'2014-09-28 07:11:00',1,12,'2','str-2::GCamp3',2,'No fields changed.'),(40,'2014-09-28 07:11:15',1,12,'3','yifat',2,'No fields changed.'),(41,'2014-09-28 07:12:50',1,12,'4','fgdgdg',1,''),(42,'2014-09-28 07:13:54',1,12,'4','fgdgdg',2,'Changed azNumber.'),(43,'2014-09-28 07:14:53',1,10,'2','A2',2,'Changed stock.'),(44,'2014-09-28 07:32:30',1,12,'1','dgdg',1,''),(45,'2014-09-28 07:32:45',1,7,'1','Revco-80',1,''),(46,'2014-09-28 07:32:56',1,15,'1','NewStock',1,''),(47,'2014-09-28 07:32:58',1,10,'1','NewBox',1,''),(48,'2014-09-28 07:37:52',1,15,'2','SecondStock',1,''),(49,'2014-09-28 07:37:53',1,10,'2','SecondBox',1,''),(50,'2014-09-28 08:19:44',1,12,'2','SecondStrain',1,''),(51,'2014-09-28 08:57:03',1,4,'2','yifate',1,''),(52,'2014-09-28 08:57:38',1,4,'2','yifate',2,'Changed email, is_staff, is_superuser and user_permissions.'),(53,'2014-09-28 08:58:25',2,7,'1','Revco -80',1,''),(54,'2014-09-28 08:58:37',2,15,'1','WorkinStock',1,''),(55,'2014-09-28 08:58:40',2,10,'1','A1',1,''),(56,'2014-09-28 08:58:53',2,10,'2','A2',1,''),(57,'2014-09-28 08:59:04',2,10,'3','A3',1,''),(58,'2014-09-28 08:59:24',2,10,'4','A4',1,''),(59,'2014-09-28 08:59:37',2,10,'5','A5',1,''),(60,'2014-09-28 08:59:49',2,10,'6','A6',1,''),(61,'2014-09-28 09:00:00',2,10,'7','A7',1,''),(62,'2014-09-28 09:00:29',2,10,'8','A8',1,''),(63,'2014-09-28 09:00:45',2,10,'9','A9',1,''),(64,'2014-09-28 09:01:33',2,7,'2','Nahmais',1,''),(65,'2014-09-28 09:01:46',2,15,'2','Backup-Nahmias',1,''),(66,'2014-09-28 09:01:47',2,10,'10','B1',1,''),(67,'2014-09-28 09:01:58',2,10,'11','B2',1,''),(68,'2014-09-28 09:02:12',2,10,'12','B3',1,''),(69,'2014-09-28 09:02:26',2,10,'13','B4',1,''),(70,'2014-09-28 09:02:47',2,7,'3','Nitrogen.',1,''),(71,'2014-09-28 09:02:57',2,15,'3','Nitrogen Stock.',1,''),(72,'2014-09-28 09:02:59',2,10,'14','C1',1,''),(73,'2014-09-28 09:03:12',2,10,'15','C2',1,''),(74,'2014-09-28 09:03:23',2,10,'16','C3',1,''),(75,'2014-09-28 09:03:32',2,10,'17','C4',1,''),(76,'2014-09-28 09:14:28',1,12,'1','TempStrain',1,''),(77,'2014-09-28 09:15:21',1,12,'1','TempStrain',3,''),(78,'2014-09-28 09:16:09',1,14,'9','B1: 0,3',3,''),(79,'2014-09-28 09:16:09',1,14,'8','B1: 0,2',3,''),(80,'2014-09-28 09:16:09',1,14,'7','C1: 0,3',3,''),(81,'2014-09-28 09:16:09',1,14,'6','C1: 0,2',3,''),(82,'2014-09-28 09:16:09',1,14,'5','A1: 0,6',3,''),(83,'2014-09-28 09:16:09',1,14,'4','A1: 0,5',3,''),(84,'2014-09-28 09:16:09',1,14,'3','A1: 0,4',3,''),(85,'2014-09-28 09:16:10',1,14,'2','A1: 0,3',3,''),(86,'2014-09-28 09:16:10',1,14,'1','A1: 0,2',3,''),(87,'2014-09-28 09:19:29',2,10,'17','1-4',2,'Changed box_name.'),(88,'2014-09-28 09:19:37',2,10,'16','1-3',2,'Changed box_name.'),(89,'2014-09-28 09:19:45',2,10,'15','1-2',2,'Changed box_name.'),(90,'2014-09-28 09:19:53',2,10,'14','1-1',2,'Changed box_name.'),(91,'2014-09-28 09:23:50',2,12,'2','odr-7:: ChR2-YFP unc-119::GCaMP-1 unc-119::DsRed',1,''),(92,'2014-09-28 09:25:06',2,12,'3','gcy-5:: ChR2-YFP unc-119::GCaMP1 unc-119::DsRed',1,''),(93,'2014-09-28 09:26:11',2,12,'4','gcy-5:: ChR2-YFP gcy-8:: GCaMP-2',1,''),(94,'2014-09-28 09:27:50',2,12,'5','pax-2::GFP glr-1::GCaMP-2 odr-7::ChR2-YFP ',1,''),(95,'2014-09-28 09:29:26',2,12,'6','pax-2::GFP glr-1::GCaMP-2 odr-7::ChR2-YFP gcy-5::DsRed2',1,''),(96,'2014-09-28 09:30:14',2,12,'7','gcy-5::GCaMP-2',1,''),(97,'2014-09-28 09:31:07',2,12,'8','glr-1::GCaMP-2',1,''),(98,'2014-09-28 09:32:15',2,12,'9','gcy-5: ChR2-cherry glr-1::GCaMP-2',1,''),(99,'2014-09-28 09:33:00',2,12,'10','glr-1::ChR2-cherry gcy-5::GCaMP-2',1,''),(100,'2014-09-28 09:34:36',2,12,'11','gcy-5:: ChR2-cherry gcy-8::GCaMP2',1,''),(101,'2014-09-28 09:35:23',2,12,'12','gcy-5:: ChR2-cherry glr-1::GCaMP1',1,''),(102,'2014-09-28 09:36:23',2,12,'13','gcy-5:: ChR2-cherry gcy-5:: GCaMP-1',1,''),(103,'2014-09-28 09:37:25',2,12,'14','glr-1::ChR2-chry glr-1::GCaMP1',1,''),(104,'2014-09-28 09:39:08',2,12,'15','eat-4::ChR2-cherry glr-1::GCaMP1',1,''),(105,'2014-09-28 09:45:15',2,12,'16','sra-6:: ChR2-cherry sra-6:: GCaMP-1',1,''),(106,'2014-09-28 10:51:15',2,12,'17','gcy-5::iGluR6-chry',1,''),(107,'2014-09-28 10:52:22',2,12,'18','str-2::GCaMP-2',1,''),(108,'2014-09-28 10:52:47',2,12,'19','myo-3::GFP-Aequorin',1,''),(109,'2014-09-28 10:53:14',2,12,'20','dgk-1::GFP-Aequorin',1,''),(110,'2014-09-28 10:54:09',2,12,'21','str-2::ChR2-chry(H134R) str-2::GCaMP-2',1,''),(111,'2014-09-28 10:54:31',2,12,'22','gcy-5::ChR2-chry(H134R) gcy-5::GCaMP-2',1,''),(112,'2014-09-28 10:54:51',2,12,'23','unc-119::GFP-Aequorin',1,''),(113,'2014-09-28 10:55:22',2,12,'24','gcy-5::ChR2-chry(H134R)',1,''),(114,'2014-09-28 10:55:43',2,12,'25','str-2::ChR2-chry(H134R)',1,''),(115,'2014-09-28 10:56:28',2,12,'26','gcy-5::ChR2-chry(H134R) 1',1,''),(116,'2014-09-28 10:57:04',2,12,'27','gcy-8::ChR2-chry(H134R) gcy-8::GCaMP-2',1,''),(117,'2014-09-28 10:57:25',2,12,'28','gcy-8::GCaMP-2',1,''),(118,'2014-09-28 10:57:46',2,12,'29','mec-4::ChR2-chry(H134R)',1,''),(119,'2014-09-28 10:58:24',2,12,'30','myo-3::ChR2-chry(H134R)',1,''),(120,'2014-09-28 10:59:27',2,12,'31','sra-6:: GFP-Aequorin ',1,''),(121,'2014-09-28 11:00:08',2,12,'32','str-2:: GFP-Aequorin ',1,''),(122,'2014-09-28 11:03:48',2,12,'19','myo-3::GFP-Aequorin',2,'Changed description.'),(123,'2014-09-28 11:04:56',2,12,'33','C37::GFP ',1,''),(124,'2014-09-28 11:05:24',2,12,'34','rpa-0::GFP ',1,''),(125,'2014-09-28 11:06:05',2,12,'35','sra-6::GCaMP-3 ',1,''),(126,'2014-09-28 11:07:47',2,12,'36','sra-6 lite (sharad)',1,''),(127,'2014-09-28 11:08:11',2,12,'37','sra-6 (sharad)',1,''),(128,'2014-09-28 11:08:52',2,12,'38','gcy-8::GCaMP-3',1,''),(129,'2014-09-28 11:09:45',2,12,'39','str-1::GCaMP-3',1,''),(130,'2014-09-28 11:10:11',2,12,'40','gpa-4::GCaMP-3',1,''),(131,'2014-09-28 11:10:58',2,12,'39','str-1::GCaMP-3',2,'Changed description.'),(132,'2014-09-28 11:11:45',2,12,'41','str-2::GCaMP3',1,''),(133,'2014-09-28 11:12:12',2,12,'42','str-1::GFP',1,''),(134,'2014-09-28 11:12:49',2,12,'43','glr-3::GCaMP-3',1,''),(135,'2014-09-28 11:13:17',2,12,'44','pha-1, lite-1',1,''),(136,'2014-09-28 11:14:16',2,12,'45','eat-4::GCaMP-3',1,''),(137,'2014-09-28 11:14:52',2,12,'46','gcy-5::GCaMP-3',1,''),(138,'2014-09-28 11:15:33',2,12,'47','sra-6::ChR2, glr-3::GCaMP-3 ',1,''),(139,'2014-09-28 11:17:03',2,12,'48','myo-2::HyLi-GFP-Plus',1,''),(140,'2014-09-28 11:17:38',2,12,'49','sra-6::GCaMP3 ',1,''),(141,'2014-09-28 11:18:23',2,12,'50','srh-142::GCaMP-3',1,''),(142,'2014-09-28 11:19:25',2,12,'51','srh-142::GCaMP-3',1,''),(143,'2014-09-28 11:19:59',2,12,'51','srg-8::GCaMP-3',2,'Changed name.'),(144,'2014-09-28 11:20:41',2,12,'52','gpa-4::ChR2-cherry(zs)',1,''),(145,'2014-09-28 11:21:46',2,12,'53','gcy-8::ChR2(zs)',1,''),(146,'2014-09-28 11:22:18',2,12,'54','str-2::ChR2-cherry (zs)',1,''),(147,'2014-09-28 11:23:01',2,12,'55','sra-6::ChR2-cherry (zs, C128S)',1,''),(148,'2014-09-28 11:23:30',2,12,'56','dat-1::GCaMP3',1,''),(149,'2014-09-28 11:24:00',2,12,'57','des-2::GCaMP3',1,''),(150,'2014-09-28 11:24:24',2,12,'58','srsx-3::GCaMP3',1,''),(151,'2014-09-28 11:24:54',2,12,'59','gcy-7::GCaMP3',1,''),(152,'2014-09-28 11:27:18',1,12,'60','tempStrain',1,''),(153,'2014-09-28 11:28:51',2,12,'61','gpa-4::ChR2-cherry(zs) 1',1,''),(154,'2014-09-28 11:30:00',1,10,'18','EyalsBox',1,''),(155,'2014-09-28 11:31:07',1,12,'60','tempStrain',3,''),(156,'2014-09-28 12:48:31',2,12,'62','gcy-33::ChR2-cherry(zs)',1,''),(157,'2014-09-28 12:53:02',2,12,'44','pha-1, lite-1',2,'No fields changed.'),(158,'2014-09-29 06:44:30',1,10,'19','EBDBox',1,''),(159,'2014-09-29 06:44:57',1,12,'63','FoxP-Strain',1,''),(160,'2014-09-29 06:47:26',2,12,'64','str-2(2)::GCaMP-3',1,''),(161,'2014-09-29 06:47:27',1,12,'63','FoxP-Strain',3,''),(162,'2014-09-29 06:47:59',2,12,'65','glr-3::ChR2-cherry(zs)',1,''),(163,'2014-09-29 06:48:48',2,12,'66','gcy-8::ChR2-cherry(zs)',1,''),(164,'2014-09-29 06:57:34',2,12,'64','str-2(2)::GCaMP-3',2,'Changed azNumber.'),(165,'2014-09-29 06:57:53',2,12,'65','glr-3::ChR2-cherry(zs)',2,'Changed azNumber.'),(166,'2014-09-29 06:58:03',2,12,'66','gcy-8::ChR2-cherry(zs)',2,'Changed azNumber.'),(167,'2014-09-29 07:03:45',2,12,'67','myo-3::Arch-GFP',1,''),(168,'2014-09-29 07:04:38',2,12,'68','mec-4(2)::ChR2-cherry(zs)',1,''),(169,'2014-09-29 07:04:56',2,12,'69','ocr-4::ChR2-cherry(zs)',1,''),(170,'2014-09-29 07:06:53',2,12,'70','unc-31(e928); pha-1(e2123ts)',1,''),(171,'2014-09-29 07:42:31',1,12,'44','pha-1, lite-1',2,'Changed origin.'),(172,'2014-09-29 07:46:46',2,12,'32','str-2:: GFP-Aequorin ',2,'No fields changed.'),(173,'2014-09-29 07:52:30',2,12,'61','gpa-4::ChR2-cherry(zs) 1',2,'Changed azNumber.'),(174,'2014-09-29 07:53:49',2,12,'71','gcy-5:: ChR2-cherry(zs)',1,''),(175,'2014-09-29 07:54:24',2,12,'2','odr-7:: ChR2-YFP unc-119::GCaMP-1 unc-119::DsRed',2,'Changed origin, madeBy and description.'),(176,'2014-09-29 07:54:43',2,12,'3','gcy-5:: ChR2-YFP unc-119::GCaMP1 unc-119::DsRed',2,'Changed origin, madeBy and description.'),(177,'2014-09-29 07:55:04',2,12,'4','gcy-5:: ChR2-YFP gcy-8:: GCaMP-2',2,'Changed origin, madeBy and description.'),(178,'2014-09-29 07:55:27',2,12,'5','pax-2::GFP glr-1::GCaMP-2 odr-7::ChR2-YFP ',2,'Changed origin, madeBy and description.'),(179,'2014-09-29 07:55:45',2,12,'6','pax-2::GFP glr-1::GCaMP-2 odr-7::ChR2-YFP gcy-5::DsRed2',2,'Changed origin, madeBy and description.'),(180,'2014-09-29 07:56:05',2,12,'7','gcy-5::GCaMP-2',2,'Changed origin, madeBy and description.'),(181,'2014-09-29 07:56:21',2,12,'9','gcy-5: ChR2-cherry glr-1::GCaMP-2',2,'Changed origin, madeBy and description.'),(182,'2014-09-29 07:56:39',2,12,'8','glr-1::GCaMP-2',2,'Changed origin, madeBy and description.'),(183,'2014-09-29 07:57:05',2,12,'10','glr-1::ChR2-cherry gcy-5::GCaMP-2',2,'Changed origin, madeBy and description.'),(184,'2014-09-29 07:57:38',2,12,'11','gcy-5:: ChR2-cherry gcy-8::GCaMP2',2,'Changed origin, madeBy and description.'),(185,'2014-09-29 07:57:48',2,12,'10','glr-1::ChR2-cherry gcy-5::GCaMP-2',2,'Changed description.'),(186,'2014-09-29 07:57:59',2,12,'9','gcy-5: ChR2-cherry glr-1::GCaMP-2',2,'Changed description.'),(187,'2014-09-29 07:58:19',2,12,'12','gcy-5:: ChR2-cherry glr-1::GCaMP1',2,'Changed origin, madeBy and description.'),(188,'2014-09-29 07:58:41',2,12,'13','gcy-5:: ChR2-cherry gcy-5:: GCaMP-1',2,'Changed origin, madeBy and description.'),(189,'2014-09-29 07:59:02',2,12,'14','glr-1::ChR2-chry glr-1::GCaMP1',2,'Changed origin, madeBy and description.'),(190,'2014-09-29 07:59:27',2,12,'15','eat-4::ChR2-cherry glr-1::GCaMP1',2,'Changed origin, madeBy and description.'),(191,'2014-09-29 07:59:42',2,12,'16','sra-6:: ChR2-cherry sra-6:: GCaMP-1',2,'Changed origin and madeBy.'),(192,'2014-09-29 08:00:04',2,12,'17','gcy-5::iGluR6-chry',2,'Changed origin, madeBy and description.'),(193,'2014-09-29 08:00:18',2,12,'18','str-2::GCaMP-2',2,'Changed origin and madeBy.'),(194,'2014-09-29 08:00:42',2,12,'19','myo-3::GFP-Aequorin',2,'Changed origin and madeBy.'),(195,'2014-09-29 08:01:03',2,12,'20','dgk-1::GFP-Aequorin',2,'Changed origin, madeBy and description.'),(196,'2014-09-29 08:01:24',2,12,'21','str-2::ChR2-chry(H134R) str-2::GCaMP-2',2,'Changed origin and madeBy.'),(197,'2014-09-29 08:01:37',2,12,'22','gcy-5::ChR2-chry(H134R) gcy-5::GCaMP-2',2,'Changed origin and madeBy.'),(198,'2014-09-29 08:01:52',2,12,'23','unc-119::GFP-Aequorin',2,'Changed origin, madeBy and description.'),(199,'2014-09-29 08:02:05',2,12,'24','gcy-5::ChR2-chry(H134R)',2,'Changed origin and madeBy.'),(200,'2014-09-29 08:02:15',2,12,'25','str-2::ChR2-chry(H134R)',2,'Changed origin and madeBy.'),(201,'2014-09-29 08:02:27',2,12,'26','gcy-5::ChR2-chry(H134R) 1',2,'Changed origin and madeBy.'),(202,'2014-09-29 08:02:42',2,12,'27','gcy-8::ChR2-chry(H134R) gcy-8::GCaMP-2',2,'Changed origin and madeBy.'),(203,'2014-09-29 08:02:55',2,12,'28','gcy-8::GCaMP-2',2,'Changed origin and madeBy.'),(204,'2014-09-29 08:03:05',2,12,'29','mec-4::ChR2-chry(H134R)',2,'Changed origin and madeBy.'),(205,'2014-09-29 08:03:22',2,12,'30','myo-3::ChR2-chry(H134R)',2,'Changed origin and madeBy.'),(206,'2014-09-29 08:03:42',2,12,'31','sra-6:: GFP-Aequorin ',2,'Changed origin, madeBy and description.'),(207,'2014-09-29 08:04:02',2,12,'32','str-2:: GFP-Aequorin ',2,'Changed origin, madeBy and description.'),(208,'2014-09-29 08:04:16',2,12,'33','C37::GFP ',2,'Changed origin and madeBy.'),(209,'2014-09-29 08:04:34',2,12,'34','rpa-0::GFP ',2,'Changed origin and madeBy.'),(210,'2014-09-29 08:04:47',2,12,'35','sra-6::GCaMP-3 ',2,'Changed origin and madeBy.'),(211,'2014-09-29 08:05:20',2,12,'36','sra-6 lite (sharad)',2,'Changed origin and madeBy.'),(212,'2014-09-29 08:05:38',2,12,'37','sra-6 (sharad)',2,'Changed origin and madeBy.'),(213,'2014-09-29 08:05:56',2,12,'38','gcy-8::GCaMP-3',2,'Changed origin and madeBy.'),(214,'2014-09-29 08:06:24',2,12,'39','str-1::GCaMP-3',2,'Changed origin and madeBy.'),(215,'2014-09-29 08:06:42',2,12,'40','gpa-4::GCaMP-3',2,'Changed origin and madeBy.'),(216,'2014-09-29 08:06:54',2,12,'41','str-2::GCaMP3',2,'Changed origin and madeBy.'),(217,'2014-09-29 08:07:04',2,12,'42','str-1::GFP',2,'Changed origin and madeBy.'),(218,'2014-09-29 08:07:21',2,12,'43','glr-3::GCaMP-3',2,'Changed origin and madeBy.'),(219,'2014-09-29 08:07:45',2,12,'44','pha-1, lite-1',2,'No fields changed.'),(220,'2014-09-29 08:07:57',2,12,'45','eat-4::GCaMP-3',2,'Changed origin and madeBy.'),(221,'2014-09-29 08:08:17',2,12,'46','gcy-5::GCaMP-3',2,'Changed origin and madeBy.'),(222,'2014-09-29 08:08:30',2,12,'47','sra-6::ChR2, glr-3::GCaMP-3 ',2,'Changed origin and madeBy.'),(223,'2014-09-29 08:08:46',2,12,'48','myo-2::HyLi-GFP-Plus',2,'Changed origin and madeBy.'),(224,'2014-09-29 08:09:00',2,12,'49','sra-6::GCaMP3 ',2,'Changed origin and madeBy.'),(225,'2014-09-29 08:09:13',2,12,'50','srh-142::GCaMP-3',2,'Changed origin and madeBy.'),(226,'2014-09-29 08:09:26',2,12,'51','srg-8::GCaMP-3',2,'Changed origin and madeBy.'),(227,'2014-09-29 08:09:38',2,12,'52','gpa-4::ChR2-cherry(zs)',2,'Changed origin and madeBy.'),(228,'2014-09-29 08:10:10',2,12,'53','gcy-8::ChR2(zs)',2,'Changed origin, madeBy, officialName and description.'),(229,'2014-09-29 08:10:27',2,12,'54','str-2::ChR2-cherry (zs)',2,'Changed origin and madeBy.'),(230,'2014-09-29 08:10:48',2,12,'55','sra-6::ChR2-cherry (zs, C128S)',2,'Changed origin and madeBy.'),(231,'2014-09-29 08:11:03',2,12,'56','dat-1::GCaMP3',2,'Changed origin and madeBy.'),(232,'2014-09-29 08:11:21',2,12,'57','des-2::GCaMP3',2,'Changed origin and madeBy.'),(233,'2014-09-29 08:11:39',2,12,'58','srsx-3::GCaMP3',2,'Changed origin and madeBy.'),(234,'2014-09-29 08:12:31',2,12,'59','gcy-7::GCaMP3',2,'Changed origin and madeBy.'),(235,'2014-09-29 08:13:01',2,12,'61','gpa-4::ChR2-cherry(zs) 1',2,'Changed origin and madeBy.'),(236,'2014-09-29 08:13:13',2,12,'62','gcy-33::ChR2-cherry(zs)',2,'Changed origin and madeBy.'),(237,'2014-09-29 08:13:26',2,12,'64','str-2(2)::GCaMP-3',2,'Changed origin and madeBy.'),(238,'2014-09-29 08:13:37',2,12,'65','glr-3::ChR2-cherry(zs)',2,'Changed origin and madeBy.'),(239,'2014-09-29 08:13:50',2,12,'66','gcy-8::ChR2-cherry(zs)',2,'Changed origin and madeBy.'),(240,'2014-09-29 08:14:05',2,12,'67','myo-3::Arch-GFP',2,'Changed origin and madeBy.'),(241,'2014-09-29 08:14:18',2,12,'68','mec-4(2)::ChR2-cherry(zs)',2,'Changed origin and madeBy.'),(242,'2014-09-29 08:14:32',2,12,'69','ocr-4::ChR2-cherry(zs)',2,'Changed origin and madeBy.'),(243,'2014-09-29 08:14:51',2,12,'70','unc-31(e928); pha-1(e2123ts)',2,'Changed origin.'),(244,'2014-09-29 08:16:16',2,12,'72','unc-31(e928); pha-1(e2123ts) Ex[des-2::GCaMP-3; pha-1]',1,''),(245,'2014-09-29 08:18:12',2,12,'73','srh-142::ChR2-cherry(zs)',1,''),(246,'2014-09-29 08:19:06',2,12,'74','str-1::ChR2-cherry(zs)',1,''),(247,'2014-09-29 08:20:04',2,12,'75','nmr-1::ChR2-cherry(zs)',1,''),(248,'2014-09-29 08:20:36',2,12,'76','nmr-1::GCaMP3 ',1,''),(249,'2014-09-29 08:21:04',2,12,'77','osm-3::GCaMP3',1,''),(250,'2014-09-29 08:21:42',2,12,'78','unc-31(e928); pha-1(e2123ts) Ex[str-1::GCaMP-3; pha-1]',1,''),(251,'2014-09-29 08:22:50',2,12,'79','unc-31(e928); pha-1(e2123ts) Ex[str-2::GCaMP-3; pha-1;him-5]',1,''),(252,'2014-09-29 08:23:20',2,12,'80','gpa-4::Arch-GFP',1,''),(253,'2014-09-29 08:23:42',2,12,'81','str-1::Arch-GFP',1,''),(254,'2014-09-29 08:24:05',2,12,'82','ocr-4::GCaMP3',1,''),(255,'2014-09-29 08:25:12',2,12,'83','myo-3::ChR2-cherry(zs)',1,''),(256,'2014-09-29 08:25:40',2,12,'84','del-1::ChR2-cherry(zs)',1,''),(257,'2014-09-29 08:26:07',2,12,'85','gpa-9::GCaMP3',1,''),(258,'2014-09-29 08:27:01',2,12,'86','fut-1::GCaMP3',1,''),(259,'2014-09-29 08:27:30',2,12,'87','unc-31(e928); pha-1(e2123ts) Ex[gcy-5::GCaMP-3; pha-1]',1,''),(260,'2014-09-29 08:28:01',2,12,'88','sra-9::GCaMP3',1,''),(261,'2014-09-29 08:28:54',2,12,'89','Combo-1',1,''),(262,'2014-09-29 08:29:38',2,12,'90','sra-6::Arch',1,''),(263,'2014-09-29 08:30:05',2,12,'91','str-2::Arch',1,''),(264,'2014-09-29 08:30:35',2,12,'92','mec-4::GCaMP-3',1,''),(265,'2014-09-29 08:31:10',2,12,'93','gcy-33::GCaMP-3',1,''),(266,'2014-09-29 08:31:34',2,12,'94','combo-3',1,''),(267,'2014-09-29 09:16:44',2,12,'95','sri-51::GCaMP-3',1,''),(268,'2014-09-29 09:17:16',2,12,'96','Combo-4',1,''),(269,'2014-09-29 09:18:10',2,12,'97','unc-13 mutant',1,''),(270,'2014-09-29 09:18:52',2,12,'98','Combo-2',1,''),(271,'2014-09-29 09:19:24',2,12,'99','unc-13(e51),str-2::GCaMP3 Ex[str-2::GCaMP-3; pha-1]',1,''),(272,'2014-09-29 09:19:53',2,12,'100','Combo-5',1,''),(273,'2014-09-29 09:20:23',2,12,'101','Combo-6',1,''),(274,'2014-09-29 09:21:09',2,12,'102','Combo-7',1,''),(275,'2014-09-29 09:23:56',2,12,'103','unc-13(e51),str-1::GCaMP3 Ex[str-1::GCaMP-3; pha-1]',1,''),(276,'2014-09-29 09:24:40',2,12,'104','unc-13(e51),gcy-5::GCaMP3 Ex[gcy-5::GCaMP-3; pha-1]',1,''),(277,'2014-09-29 09:25:17',2,12,'105','Combo-8',1,''),(278,'2014-09-29 09:25:45',2,12,'106','unc-13(e51),fut-1::GCaMP3 Ex[fut-1::GCaMP-3; pha-1]',1,''),(279,'2014-09-29 09:26:40',2,12,'107','unc-13(s69)',1,''),(280,'2014-09-29 09:27:11',2,12,'108','srsx-3::ChR2-cherry(zs)',1,''),(281,'2014-09-29 09:27:44',2,12,'109','Combo-9',1,''),(282,'2014-09-29 09:28:07',2,12,'110','Combo-10',1,''),(283,'2014-09-29 09:28:37',2,12,'111','Combo-11',1,''),(284,'2014-09-29 09:29:09',2,12,'112','Combo-12',1,''),(285,'2014-09-29 09:29:38',2,12,'113','Combo-13',1,''),(286,'2014-09-29 09:31:16',2,12,'114','unc-13(S69),fut-1::GCaMP3 Ex[fut-1::GCaMP-3; pha-1]',1,''),(287,'2014-09-29 09:31:39',2,12,'115','unc-13(S69),str-2::GCaMP3 Ex[str-2::GCaMP-3; pha-1]',1,''),(288,'2014-09-29 09:32:07',2,12,'116','gpa-6::GCaMP-3',1,''),(289,'2014-09-29 09:32:35',2,12,'117','Combo-14',1,''),(290,'2014-09-29 09:35:03',2,12,'118','PY7502',1,''),(291,'2014-09-29 09:35:34',2,12,'119','unc-31(e928); pha-1(e2123ts) Ex[fut-1::GCaMP-3; pha-1]',1,''),(292,'2014-09-29 09:36:11',2,12,'120','Combo-15',1,''),(293,'2014-09-29 09:36:36',2,12,'121','unc-13(S69),gcy-5::GCaMP3 Ex[gcy-5::GCaMP-3; pha-1]',1,''),(294,'2014-09-29 09:37:18',2,12,'122','str-2::RCaMP',1,''),(295,'2014-09-29 09:38:24',2,12,'123','gpa-4::ChR2 x str-2::G3',1,''),(296,'2014-09-29 09:42:30',2,12,'124','Pha-1(e2123ts) ; him-5; lite-1(ce314) ',1,''),(297,'2014-09-29 09:43:29',2,12,'125','Sra-6::GCaMP6m',1,''),(298,'2014-09-29 09:44:12',2,12,'126','wbr-5.1 ',1,''),(299,'2014-09-29 09:44:54',2,12,'127','daf-2',1,''),(300,'2014-09-29 09:45:28',2,12,'128','hat-1 ',1,''),(301,'2014-09-29 09:45:58',2,12,'129','hcf-1 ',1,''),(302,'2014-09-29 09:46:27',2,12,'130','met-2 ',1,''),(303,'2014-09-29 09:46:53',2,12,'131','hda-2 ',1,''),(304,'2014-09-29 09:47:35',2,12,'132','hlp-2 ',1,''),(305,'2014-09-29 09:48:01',2,12,'133','hda-3 ',1,''),(306,'2014-09-29 09:56:34',2,12,'134','unc54::Abeta',1,''),(307,'2014-09-29 10:00:26',2,12,'135','hda-4 ',1,''),(308,'2014-09-29 10:00:54',2,12,'136','zfp-1 ',1,''),(309,'2014-09-29 10:02:29',2,12,'137','unc-54::polyQ35',1,''),(310,'2014-09-29 10:03:07',2,12,'138','F2513.3;polyQ40',1,''),(311,'2014-09-29 10:04:39',2,12,'135','hda-4 ',2,'Changed azNumber.'),(312,'2014-09-29 10:05:02',2,12,'136','zfp-1 ',2,'Changed azNumber.'),(313,'2014-09-29 10:05:17',2,12,'137','unc-54::polyQ35',2,'Changed azNumber.'),(314,'2014-09-29 10:05:26',2,12,'138','F2513.3;polyQ40',2,'Changed azNumber.'),(315,'2014-09-29 10:17:17',2,12,'126','wdr-5.1 (ok1417)',2,'Changed name and officialName.'),(316,'2014-09-29 10:19:34',2,12,'127','daf-2(e1370)',2,'Changed name and officialName.'),(317,'2014-09-29 10:20:34',2,12,'128','hat-1(ok1265) ',2,'Changed name and officialName.'),(318,'2014-09-29 10:21:33',2,12,'129','hcf-1 (pk924)',2,'Changed name and officialName.'),(319,'2014-09-29 10:22:26',2,12,'130','met-2 (n4256)',2,'Changed name and officialName.'),(320,'2014-09-29 10:23:21',2,12,'131','hda-2 (ok1479)',2,'Changed name and officialName.'),(321,'2014-09-29 10:24:12',2,12,'132','hlp-2 (tm1489)',2,'Changed name and officialName.'),(322,'2014-09-29 10:25:03',2,12,'133','hda-3 (ok1991)',2,'Changed name and officialName.'),(323,'2014-09-29 10:25:43',2,12,'135','hda-4 (ok518)',2,'Changed name, madeBy and officialName.'),(324,'2014-09-29 10:26:40',2,12,'136','zfp-1 (ok554)',2,'Changed name and officialName.'),(325,'2014-09-29 11:04:06',2,12,'139','dat-1 (ok157) ',1,''),(326,'2014-09-29 11:07:11',2,12,'140','tph-1 (mg280) ',1,''),(327,'2014-09-29 11:08:04',2,12,'141','eat-4 (ky-5) ',1,''),(328,'2014-09-29 11:10:10',2,12,'142','tdc-1 (n3420) ',1,''),(329,'2014-09-29 11:10:57',2,12,'143','cat-2(e1112) ',1,''),(330,'2014-09-29 11:12:25',2,12,'144','bas-1 (ad446)',1,''),(331,'2014-09-29 11:13:24',2,12,'145','gcy-5::G3,gpa-4::ChR2',1,''),(332,'2014-09-29 11:14:09',2,12,'146','odr-10 CX32',1,''),(333,'2014-09-29 11:14:33',2,12,'147','odr-10 CX3410',1,''),(334,'2014-09-29 11:14:59',2,12,'148','hen-1 (tm501) ',1,''),(335,'2014-09-29 11:15:43',2,12,'149','ttx-3 (mg158) ',1,''),(336,'2014-09-29 11:20:25',2,12,'38','gcy-8::GCaMP-3',2,'Changed isChecked.'),(337,'2014-10-02 06:28:03',2,12,'39','str-1::GCaMP-3',2,'Changed isChecked.'),(338,'2014-10-02 06:28:17',2,12,'40','gpa-4::GCaMP-3',2,'Changed isChecked.'),(339,'2014-10-02 06:30:15',2,12,'40','gpa-4::GCaMP-3',2,'Changed isChecked.'),(340,'2014-10-02 06:30:46',2,12,'44','pha-1, lite-1',2,'Changed isChecked.'),(341,'2014-10-02 06:34:37',2,12,'46','gcy-5::GCaMP-3',2,'Changed isChecked.'),(342,'2014-10-02 06:36:54',2,12,'47','sra-6::ChR2, glr-3::GCaMP-3 ',2,'No fields changed.'),(343,'2014-10-02 06:38:28',2,12,'52','gpa-4::ChR2-cherry(zs)',2,'Changed isChecked.'),(344,'2014-10-02 06:40:53',2,12,'57','des-2::GCaMP3',2,'Changed isChecked.'),(345,'2014-10-02 06:43:00',2,12,'71','gcy-5:: ChR2-cherry(zs)',2,'Changed isChecked.'),(346,'2014-10-02 06:45:04',2,12,'62','gcy-33::ChR2-cherry(zs)',2,'No fields changed.'),(347,'2014-10-02 06:47:41',2,12,'64','str-2(2)::GCaMP-3',2,'Changed isChecked.'),(348,'2014-10-02 06:50:15',2,12,'67','myo-3::Arch-GFP',2,'No fields changed.'),(349,'2014-10-02 06:52:25',2,12,'77','osm-3::GCaMP3',2,'Changed isChecked.'),(350,'2014-10-02 07:03:39',2,12,'96','Combo-4',2,'Changed isChecked.'),(351,'2014-10-02 07:06:05',2,12,'100','Combo-5',2,'Changed isChecked.'),(352,'2014-10-02 07:08:49',2,12,'109','Combo-9',2,'Changed isChecked.'),(353,'2014-10-02 07:12:08',2,12,'110','Combo-10',2,'Changed isChecked.'),(354,'2014-10-02 07:13:05',2,12,'116','gpa-6::GCaMP-3',2,'Changed isChecked.'),(355,'2014-10-02 07:18:33',2,12,'122','str-2::RCaMP',2,'Changed isChecked.'),(356,'2014-10-02 07:21:45',2,12,'123','gpa-4::ChR2 x str-2::G3',2,'Changed isChecked.'),(357,'2014-10-02 08:06:23',2,12,'125','Sra-6::GCaMP6m',2,'Changed isChecked.'),(358,'2014-10-02 08:09:54',2,12,'126','wdr-5.1 (ok1417)',2,'Changed isChecked.'),(359,'2014-10-02 08:12:33',2,12,'128','hat-1(ok1265) ',2,'Changed isChecked.'),(360,'2014-10-02 08:12:41',2,12,'129','hcf-1 (pk924)',2,'Changed isChecked.'),(361,'2014-10-02 08:13:22',2,12,'130','met-2 (n4256)',2,'Changed isChecked.'),(362,'2014-10-02 08:14:20',2,12,'131','hda-2 (ok1479)',2,'Changed isChecked.'),(363,'2014-10-02 08:15:10',2,12,'132','hlp-2 (tm1489)',2,'Changed isChecked.'),(364,'2014-10-02 08:16:24',2,12,'133','hda-3 (ok1991)',2,'Changed isChecked.'),(365,'2014-10-02 08:17:44',2,12,'135','hda-4 (ok518)',2,'Changed isChecked.'),(366,'2014-10-02 08:18:38',2,12,'136','zfp-1 (ok554)',2,'Changed isChecked.'),(367,'2014-10-02 08:19:50',2,12,'134','unc54::Abeta',2,'No fields changed.'),(368,'2014-10-02 08:22:03',2,12,'137','unc-54::polyQ35',2,'Changed isChecked.'),(369,'2014-10-02 08:22:45',2,12,'138','F2513.3;polyQ40',2,'Changed isChecked.'),(370,'2014-10-02 08:23:41',2,12,'139','dat-1 (ok157) ',2,'Changed isChecked.'),(371,'2014-10-02 08:41:54',2,12,'140','tph-1 (mg280) ',2,'Changed isChecked.'),(372,'2014-10-02 08:42:52',2,12,'141','eat-4 (ky-5) ',2,'Changed isChecked.'),(373,'2014-10-02 08:43:35',2,12,'142','tdc-1 (n3420) ',2,'Changed isChecked.'),(374,'2014-10-02 08:44:57',2,12,'143','cat-2(e1112) ',2,'Changed isChecked.'),(375,'2014-10-02 08:46:57',2,12,'144','bas-1 (ad446)',2,'Changed isChecked.'),(376,'2014-10-02 08:47:41',2,12,'146','odr-10 CX32',2,'Changed isChecked.'),(377,'2014-10-02 08:48:41',2,12,'147','odr-10 CX3410',2,'Changed isChecked.'),(378,'2014-10-02 08:56:16',2,12,'148','hen-1 (tm501) ',2,'Changed description.'),(379,'2014-10-02 08:56:34',2,12,'149','ttx-3 (mg158) ',2,'Changed description.'),(380,'2014-10-02 09:20:07',2,12,'64','str-2(2)::GCaMP-3',2,'Changed officialName and description.'),(381,'2014-10-02 09:20:53',2,12,'58','srsx-3::GCaMP3',2,'Changed officialName and description.'),(382,'2014-10-02 09:21:33',2,12,'116','gpa-6::GCaMP-3',2,'Changed officialName and description.'),(383,'2014-10-02 09:22:17',2,12,'39','str-1::GCaMP-3',2,'Changed officialName and description.'),(384,'2014-10-02 09:23:07',2,12,'46','gcy-5::GCaMP-3',2,'Changed officialName and description.'),(385,'2014-10-02 09:23:42',2,12,'59','gcy-7::GCaMP3',2,'Changed officialName and description.'),(386,'2014-10-02 09:24:28',2,12,'38','gcy-8::GCaMP-3',2,'Changed officialName and description.'),(387,'2014-10-02 09:25:21',2,12,'49','sra-6::GCaMP3 ',2,'Changed officialName and description.'),(388,'2014-10-02 09:25:56',2,12,'88','sra-9::GCaMP3',2,'Changed officialName and description.'),(389,'2014-10-02 09:26:50',2,12,'40','gpa-4::GCaMP-3',2,'Changed officialName and description.'),(390,'2014-10-02 09:27:33',2,12,'85','gpa-9::GCaMP3',2,'Changed officialName and description.'),(391,'2014-10-02 09:28:12',2,12,'93','gcy-33::GCaMP-3',2,'Changed officialName and description.'),(392,'2014-10-02 09:29:06',2,12,'95','sri-51::GCaMP-3',2,'Changed officialName and description.'),(393,'2014-10-02 09:29:42',2,12,'50','srh-142::GCaMP-3',2,'Changed officialName and description.'),(394,'2014-10-02 09:30:17',2,12,'77','osm-3::GCaMP3',2,'Changed officialName and description.'),(395,'2014-10-02 09:30:52',2,12,'57','des-2::GCaMP3',2,'Changed officialName and description.'),(396,'2014-10-02 09:31:20',2,12,'56','dat-1::GCaMP3',2,'Changed officialName and description.'),(397,'2014-10-02 09:31:57',2,12,'82','ocr-4::GCaMP3',2,'Changed officialName and description.'),(398,'2014-10-02 09:32:06',2,12,'69','ocr-4::ChR2-cherry(zs)',2,'No fields changed.'),(399,'2014-10-02 09:32:42',2,12,'92','mec-4::GCaMP-3',2,'Changed officialName and description.'),(400,'2014-10-02 11:02:44',2,12,'150','fkh-7 (tm6093) ',1,''),(401,'2014-10-02 11:03:03',2,12,'150','fkh-7 (tm6093) ',2,'Changed azNumber.'),(402,'2014-10-02 11:10:17',2,12,'151',' chd-7 (tm6139)',1,''),(403,'2014-10-02 11:10:54',2,12,'150','fkh-7 (tm6093) ',2,'Changed madeBy and description.'),(404,'2014-10-02 11:14:30',2,12,'152','nlg-1(ok259)',1,''),(405,'2014-10-02 11:15:44',2,12,'153','nrx-1(ds1)',1,''),(406,'2014-10-02 11:23:57',2,12,'154','pha-1(e2123ts); him-5 (e1490)',1,''),(407,'2014-10-02 11:26:03',2,12,'149','ttx-3 (mg158) ',2,'Changed isChecked.'),(408,'2014-10-02 11:33:02',2,12,'152','nlg-1(ok259)',2,'Changed isChecked.'),(409,'2014-10-02 11:34:06',2,12,'153','nrx-1(ds1)',2,'Changed isChecked.'),(410,'2014-10-02 11:35:14',2,12,'154','pha-1(e2123ts); him-5 (e1490)',2,'Changed isChecked.'),(411,'2014-10-02 12:40:32',2,12,'93','gcy-33::GCaMP-3',2,'Changed isChecked.'),(412,'2014-10-07 06:04:53',2,12,'145','gcy-5::G3,gpa-4::ChR2',2,'Changed description.'),(413,'2014-10-07 06:07:34',2,12,'155','daf-16p::DAF-16::GFP',1,''),(414,'2014-10-07 06:10:19',2,12,'156','str-2::RCaMP, gpa-6::GCaMP3',1,''),(415,'2014-10-07 12:14:25',2,12,'157','chd-7 (tm6183)',1,''),(416,'2014-10-07 12:14:44',2,12,'157','chd-7 (tm6183)',2,'Changed azNumber.'),(417,'2014-10-07 12:15:06',2,12,'150','fkh-7 (tm6093) ',2,'Changed isChecked.'),(418,'2014-10-07 12:15:18',2,12,'151',' chd-7 (tm6139)',2,'Changed isChecked.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'fridge','General','fridge'),(8,'entity','General','entity'),(9,'instance','General','instance'),(10,'box','General','box'),(12,'worm strain','WormRepository','wormstrain'),(13,'worm strain instance','WormRepository','wormstraininstance'),(14,'box association','General','boxassociation'),(15,'box stock','General','boxstock');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3xwdawax9nfdpr51doevaa3cpawwkm4t','YzY5MmNlOGE0MzEyMzFhNGFmZjZlMTRhNzdlZDRjYWQ1ODVmODhhNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-13 13:53:59'),('9vuigrlc3o0txqef8c1e7qdszrljytwd','YzY5MmNlOGE0MzEyMzFhNGFmZjZlMTRhNzdlZDRjYWQ1ODVmODhhNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-13 07:36:51'),('czk9c8nf47gcyt6wrcyjk9qygdi3h5sb','Y2RmYjE2ODBhNjFlNWM2YjY5NTg0NThmNTEzMTU2NTViOTRhOGFkYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-10-19 06:32:50'),('ns5sdtqd96eto2btt64ai5h6vgyp7y5g','YzY5MmNlOGE0MzEyMzFhNGFmZjZlMTRhNzdlZDRjYWQ1ODVmODhhNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-12 07:32:20'),('xe6c0sl1roi2ykvgonlm7cjxxnrx0yhl','YzY5MmNlOGE0MzEyMzFhNGFmZjZlMTRhNzdlZDRjYWQ1ODVmODhhNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-12 11:25:53');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourceLocator_wormstraininstance`
--

DROP TABLE IF EXISTS `resourceLocator_wormstraininstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourceLocator_wormstraininstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourceLocator_wormstraininstance`
--

LOCK TABLES `resourceLocator_wormstraininstance` WRITE;
/*!40000 ALTER TABLE `resourceLocator_wormstraininstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `resourceLocator_wormstraininstance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-07 17:00:53
