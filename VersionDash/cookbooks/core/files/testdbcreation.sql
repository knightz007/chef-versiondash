-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Current Database: `testdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `testdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `testdb`;

--
-- Table structure for table `componentlist`
--

DROP TABLE IF EXISTS `componentlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componentlist` (
  `component` varchar(45) NOT NULL,
  `component_artifact_location` varchar(100) NOT NULL,
  `component_server_location` varchar(100) NOT NULL,
  `component_current_version` varchar(45) DEFAULT NULL,
  `component_qa_version` varchar(45) DEFAULT NULL,
  `component_stage_version` varchar(45) DEFAULT NULL,
  `component_perf_version` varchar(45) DEFAULT NULL,
  `component_prod_version` varchar(45) DEFAULT NULL,
  `qaComponentsInSync` varchar(45) NOT NULL,
  `stageComponentsInSync` varchar(45) NOT NULL,
  `perfComponentsInSync` varchar(45) NOT NULL,
  `prodComponentsInSync` varchar(45) NOT NULL,
  PRIMARY KEY (`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentlist`
--

LOCK TABLES `componentlist` WRITE;
/*!40000 ALTER TABLE `componentlist` DISABLE KEYS */;
INSERT INTO `componentlist` VALUES ('astra','http://path/to/astra/artifact','/path/to/artifact','714_128','714_128','713_127','713_127','712_126','Yes','No','Yes','Yes'),('stella','http://path/to/stella/artifact','/path/to/artifact','714_206','713_205','713_205','713_205','712_202','No','Yes','Yes','Yes');
/*!40000 ALTER TABLE `componentlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environmentlist`
--

DROP TABLE IF EXISTS `environmentlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environmentlist` (
  `environment` varchar(20) NOT NULL,
  `IsEnvInSync` varchar(45) NOT NULL,
  PRIMARY KEY (`environment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environmentlist`
--

LOCK TABLES `environmentlist` WRITE;
/*!40000 ALTER TABLE `environmentlist` DISABLE KEYS */;
INSERT INTO `environmentlist` VALUES ('prod','Yes'),('qa','No'),('stage','No');
/*!40000 ALTER TABLE `environmentlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releaseartifactinfo`
--

DROP TABLE IF EXISTS `releaseartifactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releaseartifactinfo` (
  `release_number` varchar(15) NOT NULL,
  `component` varchar(45) NOT NULL,
  `certifiedartifactversion` varchar(20) DEFAULT NULL,
  `release_component` varchar(100) NOT NULL,
  `currentartifactversion` varchar(20) DEFAULT NULL,
  `qa_env_version` varchar(20) DEFAULT NULL,
  `stage_env_version` varchar(20) DEFAULT NULL,
  `prod_env_version` varchar(20) DEFAULT NULL,
  `ProdComponentsInSync` varchar(45) NOT NULL,
  `QaComponentsInSync` varchar(45) NOT NULL,
  `stageComponentsInSync` varchar(45) NOT NULL,
  PRIMARY KEY (`release_component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds atifact info related to a release';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releaseartifactinfo`
--

LOCK TABLES `releaseartifactinfo` WRITE;
/*!40000 ALTER TABLE `releaseartifactinfo` DISABLE KEYS */;
INSERT INTO `releaseartifactinfo` VALUES ('7.11','astra','711_124','7.11_astra','711_124','711_124','711_124','711_124','Yes','No','Yes'),('7.11','stella','711_200','7.11_stella','711_200','711_200','711_200','711_200','Yes','No','No'),('7.12','astra','712_125','7.12_astra','712_125','712_125','712_125','712_125','No','No',''),('7.12','stella','712_203','7.12_stella','712_203','712_203','712_203','712_203','Yes','No',''),('7.13','astra','713_127','7.13_astra','713_127','714_128','713_127','712_126','Yes','Yes','No'),('7.13','stella','713_205','7.13_stella','713_205','713_205','713_205','712_202','Yes','No','Yes'),('7.14','astra','714_128','7.14_astra','714_128','713_127','714_128','713_127','Yes','No','Yes'),('7.14','stella','714_206','7.14_stella','714_206','713_205','714_206','713_205','Yes','Yes','No');
/*!40000 ALTER TABLE `releaseartifactinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releaselist`
--

DROP TABLE IF EXISTS `releaselist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releaselist` (
  `release_number` varchar(20) NOT NULL,
  `IsCurrentRelease` varchar(20) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`release_number`),
  UNIQUE KEY `release_number_UNIQUE` (`release_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releaselist`
--

LOCK TABLES `releaselist` WRITE;
/*!40000 ALTER TABLE `releaselist` DISABLE KEYS */;
INSERT INTO `releaselist` VALUES ('7.11','No'),('7.12','No'),('7.13','Yes'),('7.14','No'),('7.15','No');
/*!40000 ALTER TABLE `releaselist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverlist`
--

DROP TABLE IF EXISTS `serverlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serverlist` (
  `hostname` varchar(20) NOT NULL,
  `environment` varchar(45) NOT NULL,
  `components` varchar(45) NOT NULL,
  `components_version` varchar(100) NOT NULL,
  PRIMARY KEY (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverlist`
--

LOCK TABLES `serverlist` WRITE;
/*!40000 ALTER TABLE `serverlist` DISABLE KEYS */;
INSERT INTO `serverlist` VALUES ('awsnode','prod','astra','astra:712_126'),('gnode1','prod','stella','stella:712_202'),('gnode2','stage','astra stella','astra:713_127 stella:713_205'),('myserver1','prod','astra stella','astra:712_126 stella:712_202'),('myserver2','qa','stella','stella:714_206'),('myserver3','stage','astra','astra:713_127'),('myserver4','stage','astra stella','astra:712_126 stella:713_205'),('teast','qa','astra','astra:714_128'),('testhost','stage','stella','stella:713_205'),('testhost1','stage','stella','stella:713_205'),('testhstname','qa','astra stella','astra:714_128 stella:713_205');
/*!40000 ALTER TABLE `serverlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `User_Name` varchar(50) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('Anup','pass123','anup.kumar@outlook.com');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-17 23:51:12
