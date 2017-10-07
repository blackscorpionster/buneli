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
-- Table structure for table `BUNELI_COUNTRY`
--

DROP TABLE IF EXISTS `BUNELI_COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUNELI_COUNTRY` (
  `cod_country` varchar(3) NOT NULL DEFAULT '',
  `txt_country` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cod_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUNELI_COUNTRY`
--

LOCK TABLES `BUNELI_COUNTRY` WRITE;
/*!40000 ALTER TABLE `BUNELI_COUNTRY` DISABLE KEYS */;
INSERT INTO `BUNELI_COUNTRY` VALUES ('AD','ANDORRA'),('AE','UNITED ARAB EMIRATES'),('AF','AFGHANISTAN'),('AG','ANTIGUA AND BARBUDA'),('AI','ANGUILLA'),('AL','ALBANIA'),('AM','ARMENIA'),('AO','ANGOLA'),('AQ','ANTARCTICA'),('AR','ARGENTINA'),('AS','AMERICAN SAMOA'),('AT','AUSTRIA'),('AU','AUSTRALIA'),('AW','ARUBA'),('AX','ALAND ISLANDS'),('AZ','AZERBAIJAN'),('BA','BOSNIA AND HERZEGOVINA'),('BB','BARBADOS'),('BD','BANGLADESH'),('BE','BELGIUM'),('BF','BURKINA FASO'),('BG','BULGARIA'),('BH','BAHRAIN'),('BI','BURUNDI'),('BJ','BENIN'),('BL','SAINT BARTH'),('BM','BERMUDA'),('BN','BRUNEI DARUSSALAM'),('BO','BOLIVIA, PLURINATIONAL STATE OF'),('BQ','BONAIRE, SINT EUSTATIUS AND SABA'),('BR','BRAZIL'),('BS','BAHAMAS'),('BT','BHUTAN'),('BV','BOUVET ISLAND'),('BW','BOTSWANA'),('BY','BELARUS'),('BZ','BELIZE'),('CA','CANADA'),('CC','COCOS (KEELING) ISLANDS'),('CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE'),('CF','CENTRAL AFRICAN REPUBLIC'),('CG','CONGO'),('CH','SWITZERLAND'),('CI','COTE D\'IVOIRE'),('CK','COOK ISLANDS'),('CL','CHILE'),('CM','CAMEROON'),('CN','CHINA'),('CO','COLOMBIA'),('CR','COSTA RICA'),('CU','CUBA'),('CV','CAPE VERDE'),('CW','CURA'),('CX','CHRISTMAS ISLAND'),('CY','CYPRUS'),('CZ','CZECH REPUBLIC'),('DE','GERMANY'),('DJ','DJIBOUTI'),('DK','DENMARK'),('DM','DOMINICA'),('DO','DOMINICAN REPUBLIC'),('DZ','ALGERIA'),('EC','ECUADOR'),('EE','ESTONIA'),('EG','EGYPT'),('EH','WESTERN SAHARA'),('ER','ERITREA'),('ES','SPAIN'),('ET','ETHIOPIA'),('FI','FINLAND'),('FJ','FIJI'),('FK','FALKLAND ISLANDS (MALVINAS)'),('FM','MICRONESIA, FEDERATED STATES OF'),('FO','FAROE ISLANDS'),('FR','FRANCE'),('GA','GABON'),('GB','UNITED KINGDOM'),('GD','GRENADA'),('GE','GEORGIA'),('GF','FRENCH GUIANA'),('GG','GUERNSEY'),('GH','GHANA'),('GI','GIBRALTAR'),('GL','GREENLAND'),('GM','GAMBIA'),('GN','GUINEA'),('GP','GUADELOUPE'),('GQ','EQUATORIAL GUINEA'),('GR','GREECE'),('GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS'),('GT','GUATEMALA'),('GU','GUAM'),('GW','GUINEA-BISSAU'),('GY','GUYANA'),('HK','HONG KONG'),('HM','HEARD ISLAND AND MCDONALD ISLANDS'),('HN','HONDURAS'),('HR','CROATIA'),('HT','HAITI'),('HU','HUNGARY'),('ID','INDONESIA'),('IE','IRELAND'),('IL','ISRAEL'),('IM','ISLE OF MAN'),('IN','INDIA'),('IO','BRITISH INDIAN OCEAN TERRITORY'),('IQ','IRAQ'),('IR','IRAN, ISLAMIC REPUBLIC OF'),('IS','ICELAND'),('IT','ITALY'),('JE','JERSEY'),('JM','JAMAICA'),('JO','JORDAN'),('JP','JAPAN'),('KE','KENYA'),('KG','KYRGYZSTAN'),('KH','CAMBODIA'),('KI','KIRIBATI'),('KM','COMOROS'),('KN','SAINT KITTS AND NEVIS'),('KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF'),('KR','KOREA, REPUBLIC OF'),('KW','KUWAIT'),('KY','CAYMAN ISLANDS'),('KZ','KAZAKHSTAN'),('LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC'),('LB','LEBANON'),('LC','SAINT LUCIA'),('LI','LIECHTENSTEIN'),('LK','SRI LANKA'),('LR','LIBERIA'),('LS','LESOTHO'),('LT','LITHUANIA'),('LU','LUXEMBOURG'),('LV','LATVIA'),('LY','LIBYA'),('MA','MOROCCO'),('MC','MONACO'),('MD','MOLDOVA, REPUBLIC OF'),('ME','MONTENEGRO'),('MF','SAINT MARTIN (FRENCH PART)'),('MG','MADAGASCAR'),('MH','MARSHALL ISLANDS'),('MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF'),('ML','MALI'),('MM','MYANMAR'),('MN','MONGOLIA'),('MO','MACAO'),('MP','NORTHERN MARIANA ISLANDS'),('MQ','MARTINIQUE'),('MR','MAURITANIA'),('MS','MONTSERRAT'),('MT','MALTA'),('MU','MAURITIUS'),('MV','MALDIVES'),('MW','MALAWI'),('MX','MEXICO'),('MY','MALAYSIA'),('MZ','MOZAMBIQUE'),('NA','NAMIBIA'),('NC','NEW CALEDONIA'),('NE','NIGER'),('NF','NORFOLK ISLAND'),('NG','NIGERIA'),('NI','NICARAGUA'),('NL','NETHERLANDS'),('NO','NORWAY'),('NP','NEPAL'),('NR','NAURU'),('NU','NIUE'),('NZ','NEW ZEALAND'),('OM','OMAN'),('PA','PANAMA'),('PE','PERU'),('PF','FRENCH POLYNESIA'),('PG','PAPUA NEW GUINEA'),('PH','PHILIPPINES'),('PK','PAKISTAN'),('PL','POLAND'),('PM','SAINT PIERRE AND MIQUELON'),('PN','PITCAIRN'),('PR','PUERTO RICO'),('PS','PALESTINIAN TERRITORY, OCCUPIED'),('PT','PORTUGAL'),('PW','PALAU'),('PY','PARAGUAY'),('QA','QATAR'),('RE','REUNION'),('RO','ROMANIA'),('RS','SERBIA'),('RU','RUSSIAN FEDERATION'),('RW','RWANDA'),('SA','SAUDI ARABIA'),('SB','SOLOMON ISLANDS'),('SC','SEYCHELLES'),('SD','SUDAN'),('SE','SWEDEN'),('SG','SINGAPORE'),('SH','SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA'),('SI','SLOVENIA'),('SJ','SVALBARD AND JAN MAYEN'),('SK','SLOVAKIA'),('SL','SIERRA LEONE'),('SM','SAN MARINO'),('SN','SENEGAL'),('SO','SOMALIA'),('SR','SURINAME'),('SS','SOUTH SUDAN'),('ST','SAO TOME AND PRINCIPE'),('SV','EL SALVADOR'),('SX','SINT MAARTEN (DUTCH PART)'),('SY','SYRIAN ARAB REPUBLIC'),('SZ','SWAZILAND'),('TC','TURKS AND CAICOS ISLANDS'),('TD','CHAD'),('TF','FRENCH SOUTHERN TERRITORIES'),('TG','TOGO'),('TH','THAILAND'),('TJ','TAJIKISTAN'),('TK','TOKELAU'),('TL','TIMOR-LESTE'),('TM','TURKMENISTAN'),('TN','TUNISIA'),('TO','TONGA'),('TR','TURKEY'),('TT','TRINIDAD AND TOBAGO'),('TV','TUVALU'),('TW','TAIWAN, PROVINCE OF CHINA'),('TZ','TANZANIA, UNITED REPUBLIC OF'),('UA','UKRAINE'),('UG','UGANDA'),('UM','UNITED STATES MINOR OUTLYING ISLANDS'),('US','UNITED STATES'),('UY','URUGUAY'),('UZ','UZBEKISTAN'),('VA','HOLY SEE (VATICAN CITY STATE)'),('VC','SAINT VINCENT AND THE GRENADINES'),('VE','VENEZUELA, BOLIVARIAN REPUBLIC OF'),('VG','VIRGIN ISLANDS, BRITISH'),('VI','VIRGIN ISLANDS, U.S.'),('VN','VIET NAM'),('VU','VANUATU'),('WF','WALLIS AND FUTUNA'),('WS','SAMOA'),('YE','YEMEN'),('YT','MAYOTTE'),('ZA','SOUTH AFRICA'),('ZM','ZAMBIA'),('ZW','ZIMBABWE');
/*!40000 ALTER TABLE `BUNELI_COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-26 20:56:14
