CREATE DATABASE  IF NOT EXISTS `SEGURO` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `SEGURO`;
-- MySQL dump 10.13  Distrib 5.6.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: SEGURO
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `JSON_MESSAGE`
--

DROP TABLE IF EXISTS `JSON_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JSON_MESSAGE` (
  `fec_message` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `from_user` int(11) NOT NULL DEFAULT '0',
  `to_user` int(11) NOT NULL DEFAULT '0',
  `txt_message` varchar(178) DEFAULT NULL,
  `ind_read` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fec_message`,`from_user`,`to_user`),
  KEY `Json_message_idx01` (`to_user`),
  KEY `Json_message_idx02` (`fec_message`,`from_user`,`to_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JSON_MESSAGE`
--

LOCK TABLES `JSON_MESSAGE` WRITE;
/*!40000 ALTER TABLE `JSON_MESSAGE` DISABLE KEYS */;
INSERT INTO `JSON_MESSAGE` VALUES ('2015-02-01 17:55:20',2,3,'[\"01/02/2015 17:55:20\",\"Szwl actynpdl\"]',1),('2015-02-01 17:55:53',3,2,'[\"01/02/2015 17:55:52\",\"so nkxsuyu \"]',1),('2015-02-01 17:56:05',3,2,'[\"01/02/2015 17:56:05\",\"nurg\"]',1),('2015-02-01 17:56:15',2,3,'[\"01/02/2015 17:56:15\",\"Ep lxzzzz\"]',1),('2015-02-01 17:56:54',3,2,'[\"01/02/2015 17:56:54\",\" zk gjuxuuuuuu\"]',1),('2015-02-01 17:57:12',2,3,'[\"01/02/2015 17:57:12\",\"Dlmpd bfp pcpd wl xfupc xld spcxzdl opw fytgpcdz\"]',1),('2015-02-01 17:57:49',3,2,'[\"01/02/2015 17:57:48\",\"za kxky so nkxsuyu kyvuyu\"]',1),('2015-02-01 18:03:02',2,3,'[\"01/02/2015 18:03:02\",\"Ep lxu00f3 xfnszzzz\"]',1),('2015-02-01 18:07:07',2,3,'[\"01/02/2015 18:07:07\",\"Mpmp\"]',1),('2015-02-01 19:02:47',3,2,'[\"01/02/2015 19:02:46\",\"iuxgf\\u00f3t sou \"]',1),('2015-02-01 20:11:52',2,4,'[\"01/02/2015 20:11:52\",\"Szwl\"]',NULL);
/*!40000 ALTER TABLE `JSON_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-26 20:56:15
