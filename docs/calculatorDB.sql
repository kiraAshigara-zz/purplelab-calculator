-- MySQL dump 10.15  Distrib 10.0.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.0.28-MariaDB

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
-- Table structure for table `BASE_PRICING`
--

DROP TABLE IF EXISTS `BASE_PRICING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASE_PRICING` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biz_type_fk` int(11) NOT NULL,
  `biz_size_fk` int(11) NOT NULL,
  `base_annual_subscription` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BASE_PRICING_1_idx` (`biz_type_fk`),
  KEY `fk_BASE_PRICING_2_idx` (`biz_size_fk`),
  CONSTRAINT `fk_BASE_PRICING_1` FOREIGN KEY (`biz_type_fk`) REFERENCES `BUSINESS_TYPE_TBL` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_BASE_PRICING_2` FOREIGN KEY (`biz_size_fk`) REFERENCES `BUSINESS_SIZE_TBL` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BASE_PRICING`
--

LOCK TABLES `BASE_PRICING` WRITE;
/*!40000 ALTER TABLE `BASE_PRICING` DISABLE KEYS */;
INSERT INTO `BASE_PRICING` VALUES (1,1,1,15000.00),(2,1,2,20000.00),(3,1,3,27500.00),(4,1,4,35000.00),(5,1,5,50000.00),(6,1,6,75000.00),(7,1,7,100000.00),(8,2,1,15000.00),(9,2,2,20000.00),(10,2,3,27500.00),(11,2,4,35000.00),(12,2,5,50000.00),(13,2,6,65000.00),(14,2,7,80000.00),(15,3,1,15000.00),(16,3,2,20000.00),(17,3,3,27500.00),(18,3,4,35000.00),(19,3,5,50000.00),(20,3,6,65000.00),(21,3,7,80000.00),(22,4,1,15000.00),(23,4,2,20000.00),(24,4,3,27500.00),(25,4,4,35000.00),(26,4,5,50000.00),(27,4,6,65000.00),(28,4,7,80000.00),(29,7,1,15000.00),(30,7,2,20000.00),(31,7,3,27500.00),(32,7,4,35000.00),(33,7,5,50000.00),(34,7,6,65000.00),(35,7,7,80000.00),(36,5,1,15000.00),(37,5,2,20000.00),(38,5,3,27500.00),(39,5,4,35000.00),(40,5,5,50000.00),(41,5,6,65000.00),(42,5,7,80000.00),(43,6,1,15000.00),(44,6,2,20000.00),(45,6,3,27500.00),(46,6,4,35000.00),(47,6,5,50000.00),(48,6,6,65000.00),(49,6,7,80000.00),(50,8,8,7500.00);
/*!40000 ALTER TABLE `BASE_PRICING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_SIZE_TBL`
--

DROP TABLE IF EXISTS `BUSINESS_SIZE_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_SIZE_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biz_size` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_SIZE_TBL`
--

LOCK TABLES `BUSINESS_SIZE_TBL` WRITE;
/*!40000 ALTER TABLE `BUSINESS_SIZE_TBL` DISABLE KEYS */;
INSERT INTO `BUSINESS_SIZE_TBL` VALUES (1,'<25 million'),(2,'>=25 million to <50 million'),(3,'>=50 million to <100 million'),(4,'>=100 million to <500 million'),(5,'>=500 million to <2 billion'),(6,'>=2 billion to <5 billion'),(7,'>=5 billion'),(8,'N/A');
/*!40000 ALTER TABLE `BUSINESS_SIZE_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUSINESS_TYPE_TBL`
--

DROP TABLE IF EXISTS `BUSINESS_TYPE_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUSINESS_TYPE_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biz_type` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUSINESS_TYPE_TBL`
--

LOCK TABLES `BUSINESS_TYPE_TBL` WRITE;
/*!40000 ALTER TABLE `BUSINESS_TYPE_TBL` DISABLE KEYS */;
INSERT INTO `BUSINESS_TYPE_TBL` VALUES (1,'Lifescience:Pharma and Biotech'),(2,'Lifescience:Medical Device'),(3,'Payer/Provider:Payer'),(4,'Payer/Provider:Provider'),(5,'Services:Facilities Management/Logistics'),(6,'Services:Technology'),(7,'Research:For-Profit/Consulting'),(8,'Research:Non-Profit/Academic and Government');
/*!40000 ALTER TABLE `BUSINESS_TYPE_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GEOGRAPHIC_BLOCK_TBL`
--

DROP TABLE IF EXISTS `GEOGRAPHIC_BLOCK_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GEOGRAPHIC_BLOCK_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geo` varchar(250) NOT NULL,
  `geo_discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GEOGRAPHIC_BLOCK_TBL`
--

LOCK TABLES `GEOGRAPHIC_BLOCK_TBL` WRITE;
/*!40000 ALTER TABLE `GEOGRAPHIC_BLOCK_TBL` DISABLE KEYS */;
INSERT INTO `GEOGRAPHIC_BLOCK_TBL` VALUES (1,'Census Entity: NATIONAL',1.00),(2,'Census Entity: REGIONAL',0.75),(3,'Census Entity: DIVISIONAL',0.50),(4,'Census Entity: STATE',0.33),(5,'Census Entity: COUNTY',0.33),(6,'CBSA Entity: CBSA',0.33);
/*!40000 ALTER TABLE `GEOGRAPHIC_BLOCK_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVIDER_LEVEL_TBL`
--

DROP TABLE IF EXISTS `PROVIDER_LEVEL_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVIDER_LEVEL_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report` varchar(250) NOT NULL,
  `report_discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVIDER_LEVEL_TBL`
--

LOCK TABLES `PROVIDER_LEVEL_TBL` WRITE;
/*!40000 ALTER TABLE `PROVIDER_LEVEL_TBL` DISABLE KEYS */;
INSERT INTO `PROVIDER_LEVEL_TBL` VALUES (1,'ALL Tabs',1.00),(2,'HCP',0.80),(3,'HCO_Group',0.50),(4,'HCO_Facility',0.50);
/*!40000 ALTER TABLE `PROVIDER_LEVEL_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RETREIVER_REPORT_TBL`
--

DROP TABLE IF EXISTS `RETREIVER_REPORT_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RETREIVER_REPORT_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retreiver` varchar(250) NOT NULL,
  `retriever_discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RETREIVER_REPORT_TBL`
--

LOCK TABLES `RETREIVER_REPORT_TBL` WRITE;
/*!40000 ALTER TABLE `RETREIVER_REPORT_TBL` DISABLE KEYS */;
INSERT INTO `RETREIVER_REPORT_TBL` VALUES (1,'Experience',1.00),(2,'Outcomes',2.50),(3,'Appropriateness',2.50),(4,'Cost',2.50),(5,'ALL',2.50);
/*!40000 ALTER TABLE `RETREIVER_REPORT_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TERM_TBL`
--

DROP TABLE IF EXISTS `TERM_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TERM_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(250) NOT NULL,
  `term_discount` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TERM_TBL`
--

LOCK TABLES `TERM_TBL` WRITE;
/*!40000 ALTER TABLE `TERM_TBL` DISABLE KEYS */;
INSERT INTO `TERM_TBL` VALUES (1,'1 YEAR',1.000),(2,'2 YEARS',0.900),(3,'3 YEARS',0.825),(4,'5 YEARS',0.750),(5,'7 YEARS',0.700);
/*!40000 ALTER TABLE `TERM_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `THERAPEUTIC_CLASS_TBL`
--

DROP TABLE IF EXISTS `THERAPEUTIC_CLASS_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `THERAPEUTIC_CLASS_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_class` varchar(250) NOT NULL,
  `tpc_multiplier` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `THERAPEUTIC_CLASS_TBL`
--

LOCK TABLES `THERAPEUTIC_CLASS_TBL` WRITE;
/*!40000 ALTER TABLE `THERAPEUTIC_CLASS_TBL` DISABLE KEYS */;
INSERT INTO `THERAPEUTIC_CLASS_TBL` VALUES (1,'1 Code Group',1.00),(2,'2 Code Groups',2.00),(3,'1 Therapeutic Class',2.50),(4,'2 Therapeutic Classes',3.60),(5,'ALL Therapeutic Areas',5.00);
/*!40000 ALTER TABLE `THERAPEUTIC_CLASS_TBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS_TBL`
--

DROP TABLE IF EXISTS `USERS_TBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS_TBL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users` int(11) NOT NULL,
  `user_multiplier` decimal(10,2) NOT NULL,
  `academic_multiplier` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_TBL`
--

LOCK TABLES `USERS_TBL` WRITE;
/*!40000 ALTER TABLE `USERS_TBL` DISABLE KEYS */;
INSERT INTO `USERS_TBL` VALUES (1,1,1.00,1.00),(2,2,1.00,2.00),(3,3,1.00,3.00),(4,4,1.00,4.00),(5,5,1.00,5.00),(6,6,1.20,6.00),(7,7,1.40,7.00),(8,8,1.60,8.00),(9,9,1.80,9.00),(10,10,2.00,10.00);
/*!40000 ALTER TABLE `USERS_TBL` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-30 21:52:01
