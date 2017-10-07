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
-- Table structure for table `BUNELI_OPTION`
--

DROP TABLE IF EXISTS `BUNELI_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUNELI_OPTION` (
  `cod_app` tinyint(4) NOT NULL DEFAULT '0',
  `cod_option` mediumint(9) NOT NULL DEFAULT '0',
  `txt_option` varchar(25) DEFAULT NULL,
  `url_validate` varchar(200) DEFAULT NULL,
  `url_execute` varchar(200) DEFAULT NULL,
  `url_draw` varchar(200) DEFAULT NULL,
  `opt_menu` tinyint(4) DEFAULT NULL,
  `opt_father_menu` mediumint(9) DEFAULT NULL,
  `img_option` varchar(100) DEFAULT NULL,
  `pop_up` tinyint(4) DEFAULT NULL,
  `txt_command` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_app`,`cod_option`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUNELI_OPTION`
--

LOCK TABLES `BUNELI_OPTION` WRITE;
/*!40000 ALTER TABLE `BUNELI_OPTION` DISABLE KEYS */;
INSERT INTO `BUNELI_OPTION` VALUES (1,1,'VALIDATE LOGIN','../../buneli/php/admin/validate_login.php','exe_validate_login.php','show_main_screen.php',NULL,NULL,NULL,NULL,NULL),(1,2,'LOG OUT',NULL,'exe_log_out.php','showLogin.php',1,NULL,NULL,NULL,NULL),(1,3,'MANAGE YOU ACCOUNT',NULL,NULL,'showUserData.php',2,NULL,NULL,NULL,NULL),(1,4,'USERS',NULL,NULL,'showUsers.php',NULL,NULL,NULL,NULL,NULL),(1,5,'DIFFUSE A MESSAGE',NULL,NULL,'showDiffusingWindow.php',2,0,NULL,NULL,NULL),(1,6,'DIRECTORY','','','showDirectoryManagmentWindow.php',1,0,'',0,'drawDirectory(6)'),(1,7,'CONTACT REQUESTS',NULL,NULL,'showRequests.php',1,NULL,NULL,NULL,'drawPendingRequests(7)'),(1,8,'LOAD CONVERSATIONS',NULL,'exe_load_conversations.php','showUserUnreadMessages.php',NULL,NULL,NULL,NULL,NULL),(1,9,'GET NEW MESSAGES',NULL,'exe_load_conversations.php','ShowUserNewMessages.php',NULL,NULL,NULL,NULL,NULL),(1,10,'SEND MESSAGE',NULL,'exe_send_message.php','ShowMessageAltered.php',NULL,NULL,NULL,NULL,NULL),(1,11,'DRAW USER CHAT BOX',NULL,NULL,'showUserChatBox.php',NULL,NULL,NULL,NULL,NULL),(1,12,'ACCEPT OR DISCARD CONTACT',NULL,'exe_check_ContactRequest.php','showResultRequest.php',NULL,NULL,NULL,NULL,NULL),(1,13,'DELETE CONTACT','','exe_deleteContactInformation.php','showContactsChanges.php',NULL,NULL,NULL,NULL,NULL),(1,14,'FIND USER','','exe_findContact.php','showResultOfFinding.php',NULL,NULL,NULL,NULL,NULL),(1,15,'SEND CONTACT REQUEST','','exe_saveContactRequest.php','showResultOfContactRequest.php',NULL,NULL,NULL,NULL,NULL),(1,16,'UPDATE CONTACTS','','exe_updateContacts.php','showContactsUpdate.php',0,NULL,NULL,NULL,NULL),(1,17,'UPDATE DIRECTORY','','','showDirectoryUpdate.php',0,0,NULL,NULL,NULL),(1,18,'UPDATE REQUESTS LIST','','','showRequestsListUpdate.php',0,NULL,NULL,NULL,NULL),(1,19,'REGISTER USER','validate_new_user.php','exe_saveNewUser.php','showNewUserBegin.php',0,0,NULL,NULL,NULL),(1,20,'RESET PASSWORD','validate_email_user.php','exe_resetUserPassword.php','showPassOptions.php',NULL,NULL,NULL,NULL,NULL),(1,21,'YOUR INFORMATION','','','showYourInfo.php',1,0,'',0,'drawYourInfo(21)'),(1,22,'DELETE ACCOUNT','validate_account_deletion.php','exe_deleteAcoount.php','showLogin.php',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `BUNELI_OPTION` ENABLE KEYS */;
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
