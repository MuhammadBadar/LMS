-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `Id` int NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `RoleId` varchar(255) DEFAULT NULL,
  `EntityId` int NOT NULL,
  `ScheduleTypeId` int NOT NULL,
  `WorkingTypeId` int NOT NULL,
  `WorkingHours` varchar(500) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedBy` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (3,'1ff17d74-c7f6-42f9-a399-0db27da282b3',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-20 17:13:13',NULL,NULL,_binary ''),(4,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-20 17:20:35',NULL,NULL,_binary ''),(5,'1ff17d74-c7f6-42f9-a399-0db27da282b3',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-20 17:25:44',NULL,NULL,_binary ''),(6,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 11:19:12',NULL,NULL,_binary ''),(7,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 11:23:49',NULL,NULL,_binary ''),(8,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 11:26:56',NULL,NULL,_binary ''),(9,'1ff17d74-c7f6-42f9-a399-0db27da282b3',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 11:30:16',NULL,NULL,_binary ''),(10,'1ff17d74-c7f6-42f9-a399-0db27da282b3',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 11:30:16',NULL,NULL,_binary ''),(11,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 11:51:04',NULL,NULL,_binary '\0'),(12,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:30:23',NULL,NULL,_binary ''),(13,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:48:03',NULL,NULL,_binary ''),(14,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:49:09',NULL,NULL,_binary ''),(15,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:52:03',NULL,NULL,_binary ''),(16,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:53:55',NULL,NULL,_binary ''),(17,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:55:36',NULL,NULL,_binary ''),(18,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:57:55',NULL,NULL,_binary ''),(19,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 12:58:25',NULL,NULL,_binary ''),(20,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 13:00:53',NULL,NULL,_binary ''),(21,NULL,NULL,0,1006002,0,NULL,NULL,NULL,0,'2023-09-21 13:22:45',NULL,NULL,_binary ''),(22,NULL,NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 13:22:45',NULL,NULL,_binary ''),(23,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:39:51',NULL,NULL,_binary ''),(24,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:40:22',NULL,NULL,_binary ''),(25,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:41:30',NULL,NULL,_binary ''),(26,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:42:20',NULL,NULL,_binary ''),(27,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:43:01',NULL,NULL,_binary ''),(28,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:43:50',NULL,NULL,_binary ''),(29,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,0,0,NULL,NULL,NULL,0,'2023-09-21 14:44:30',NULL,NULL,_binary ''),(30,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 14:47:33',NULL,NULL,_binary ''),(31,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 14:51:06',NULL,NULL,_binary ''),(32,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 14:52:32',NULL,NULL,_binary ''),(33,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 14:53:16',NULL,NULL,_binary ''),(34,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 14:53:50',NULL,NULL,_binary ''),(35,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:00:07',NULL,NULL,_binary ''),(36,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:02:45',NULL,NULL,_binary ''),(37,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:07:40',NULL,NULL,_binary ''),(38,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:27:06',NULL,NULL,_binary ''),(39,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:28:45',NULL,NULL,_binary ''),(40,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:38:50',NULL,NULL,_binary ''),(41,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:38:50',NULL,NULL,_binary ''),(42,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 15:46:27',NULL,NULL,_binary ''),(43,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 16:36:19',NULL,NULL,_binary ''),(44,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-21 16:40:17',NULL,NULL,_binary ''),(45,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:07:25',NULL,NULL,_binary ''),(46,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:08:37',NULL,NULL,_binary ''),(47,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:26:23',NULL,NULL,_binary ''),(48,'0a714c07-6881-4740-8bcb-5a6bfd833eda','0fa6617b-be51-4a7d-b8c4-9f90dc841997',1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:28:25',NULL,NULL,_binary ''),(49,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:30:23',NULL,NULL,_binary ''),(50,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:31:28',NULL,NULL,_binary ''),(51,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 11:41:13',NULL,NULL,_binary ''),(52,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:02:08',NULL,NULL,_binary ''),(53,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:05:07',NULL,NULL,_binary ''),(54,'1ff17d74-c7f6-42f9-a399-0db27da282b3',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:06:41',NULL,NULL,_binary ''),(55,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:13:04',NULL,NULL,_binary ''),(56,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:16:21',NULL,NULL,_binary ''),(57,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:19:11',NULL,NULL,_binary ''),(58,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:20:59',NULL,NULL,_binary ''),(59,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:28:05',NULL,NULL,_binary ''),(60,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:33:37',NULL,NULL,_binary ''),(61,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:46:23',NULL,NULL,_binary ''),(62,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:47:59',NULL,NULL,_binary ''),(63,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:48:44',NULL,NULL,_binary ''),(64,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:49:31',NULL,NULL,_binary ''),(65,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:57:09',NULL,NULL,_binary ''),(66,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:58:02',NULL,NULL,_binary ''),(67,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 12:59:25',NULL,NULL,_binary ''),(68,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:00:16',NULL,NULL,_binary ''),(69,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:17:26',NULL,NULL,_binary ''),(70,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:18:59',NULL,NULL,_binary ''),(71,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:20:28',NULL,NULL,_binary ''),(72,'1ff17d74-c7f6-42f9-a399-0db27da282b3',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:21:45',NULL,NULL,_binary ''),(73,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:23:36',NULL,NULL,_binary ''),(74,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:27:19',NULL,NULL,_binary ''),(75,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:30:54',NULL,NULL,_binary ''),(76,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:32:06',NULL,NULL,_binary ''),(77,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:32:39',NULL,NULL,_binary ''),(78,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:38:31',NULL,NULL,_binary ''),(79,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:39:53',NULL,NULL,_binary ''),(80,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:41:46',NULL,NULL,_binary ''),(81,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:42:59',NULL,NULL,_binary ''),(82,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:44:04',NULL,NULL,_binary ''),(83,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:44:42',NULL,NULL,_binary ''),(84,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:46:24',NULL,NULL,_binary ''),(85,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:47:56',NULL,NULL,_binary ''),(86,'1c75d06f-45f4-4877-b2cd-d88b21091f96',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:48:40',NULL,NULL,_binary ''),(87,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:49:49',NULL,NULL,_binary ''),(88,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:49:49',NULL,NULL,_binary ''),(89,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:49:49',NULL,NULL,_binary ''),(90,'0a714c07-6881-4740-8bcb-5a6bfd833eda',NULL,1005001,1006002,0,NULL,NULL,NULL,0,'2023-09-22 13:49:49',NULL,NULL,_binary '');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduleday`
--

DROP TABLE IF EXISTS `scheduleday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduleday` (
  `Id` int NOT NULL,
  `SchId` int DEFAULT NULL,
  `DayId` varchar(255) DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedBy` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduleday`
--

LOCK TABLES `scheduleday` WRITE;
/*!40000 ALTER TABLE `scheduleday` DISABLE KEYS */;
INSERT INTO `scheduleday` VALUES (0,1,'1003001',0,'2023-09-20 16:36:13',NULL,NULL,_binary ''),(1,2,'1003001',0,'2023-09-20 17:12:02',NULL,NULL,_binary ''),(2,2,'1003002',0,'2023-09-20 17:12:08',NULL,NULL,_binary ''),(3,3,'1003001',0,'2023-09-20 17:13:13',NULL,NULL,_binary ''),(4,3,'1003002',0,'2023-09-20 17:13:15',NULL,NULL,_binary ''),(5,4,'1003001',0,'2023-09-20 17:20:35',NULL,NULL,_binary ''),(6,4,'1003003',0,'2023-09-20 17:20:42',NULL,NULL,_binary ''),(7,5,'1003001',0,'2023-09-20 17:25:44',NULL,NULL,_binary ''),(8,5,'1003002',0,'2023-09-20 17:25:44',NULL,NULL,_binary ''),(9,6,'1003001',0,'2023-09-21 11:19:12',NULL,NULL,_binary ''),(10,6,'1003002',0,'2023-09-21 11:19:12',NULL,NULL,_binary ''),(11,7,'1003001',0,'2023-09-21 11:23:50',NULL,NULL,_binary ''),(12,8,'1003001',0,'2023-09-21 11:26:56',NULL,NULL,_binary ''),(13,9,'1003001',0,'2023-09-21 11:30:16',NULL,NULL,_binary ''),(14,9,'1003002',0,'2023-09-21 11:30:16',NULL,NULL,_binary ''),(15,10,'1003001',0,'2023-09-21 11:35:13',NULL,NULL,_binary ''),(16,10,'1003002',0,'2023-09-21 11:50:01',NULL,NULL,_binary ''),(17,11,'1003001',0,'2023-09-21 11:51:06',NULL,NULL,_binary ''),(18,12,'1003001',0,'2023-09-21 12:30:26',NULL,NULL,_binary ''),(19,13,'1003001',0,'2023-09-21 12:48:06',NULL,NULL,_binary ''),(20,14,'1003001',0,'2023-09-21 12:49:13',NULL,NULL,_binary ''),(21,15,'1003001',0,'2023-09-21 12:52:03',NULL,NULL,_binary ''),(22,16,'1003001',0,'2023-09-21 12:53:55',NULL,NULL,_binary ''),(23,17,'1003002',0,'2023-09-21 12:55:36',NULL,NULL,_binary ''),(24,18,'1003001',0,'2023-09-21 12:57:56',NULL,NULL,_binary ''),(25,19,'1003001',0,'2023-09-21 12:58:25',NULL,NULL,_binary ''),(26,20,'1003001',0,'2023-09-21 13:00:54',NULL,NULL,_binary ''),(27,21,'1003001',0,'2023-09-21 13:22:45',NULL,NULL,_binary ''),(28,22,'1003001',0,'2023-09-21 13:23:05',NULL,NULL,_binary ''),(29,32,'1003003',0,'2023-09-21 14:52:32',NULL,NULL,_binary ''),(30,33,'0',0,'2023-09-21 14:53:16',NULL,NULL,_binary ''),(31,34,'1003004',0,'2023-09-21 14:53:50',NULL,NULL,_binary ''),(32,35,'1003001',0,'2023-09-21 15:00:07',NULL,NULL,_binary ''),(33,35,'1003002',0,'2023-09-21 15:00:07',NULL,NULL,_binary ''),(34,36,'1003003',0,'2023-09-21 15:02:45',NULL,NULL,_binary ''),(35,36,'1003004',0,'2023-09-21 15:02:45',NULL,NULL,_binary ''),(36,37,'1003002',0,'2023-09-21 15:07:40',NULL,NULL,_binary ''),(37,38,'1003003',0,'2023-09-21 15:27:06',NULL,NULL,_binary ''),(38,39,'1003004',0,'2023-09-21 15:28:45',NULL,NULL,_binary ''),(39,40,'1003004',0,'2023-09-21 15:38:50',NULL,NULL,_binary ''),(40,41,'1003004',0,'2023-09-21 15:40:33',NULL,NULL,_binary ''),(41,42,'1003003',0,'2023-09-21 15:46:27',NULL,NULL,_binary ''),(42,43,'1003001',0,'2023-09-21 16:36:19',NULL,NULL,_binary ''),(43,43,'1003003',0,'2023-09-21 16:36:19',NULL,NULL,_binary ''),(44,44,'1003004',0,'2023-09-21 16:40:17',NULL,NULL,_binary ''),(45,45,'1003001',0,'2023-09-22 11:07:26',NULL,NULL,_binary ''),(46,45,'1003002',0,'2023-09-22 11:07:26',NULL,NULL,_binary ''),(47,46,'1003004',0,'2023-09-22 11:08:37',NULL,NULL,_binary ''),(48,47,'1003003',0,'2023-09-22 11:26:23',NULL,NULL,_binary ''),(49,47,'1003004',0,'2023-09-22 11:26:23',NULL,NULL,_binary ''),(50,48,'1003002',0,'2023-09-22 11:28:25',NULL,NULL,_binary ''),(51,48,'1003003',0,'2023-09-22 11:28:25',NULL,NULL,_binary ''),(52,49,'1003005',0,'2023-09-22 11:30:23',NULL,NULL,_binary ''),(53,50,'1003004',0,'2023-09-22 11:31:28',NULL,NULL,_binary ''),(54,51,'1003004',0,'2023-09-22 11:41:13',NULL,NULL,_binary ''),(55,52,'1003004',0,'2023-09-22 12:02:08',NULL,NULL,_binary ''),(56,53,'1003004',0,'2023-09-22 12:05:07',NULL,NULL,_binary ''),(57,54,'1003005',0,'2023-09-22 12:06:41',NULL,NULL,_binary ''),(58,55,'1003004',0,'2023-09-22 12:13:04',NULL,NULL,_binary ''),(59,56,'1003004',0,'2023-09-22 12:16:21',NULL,NULL,_binary ''),(60,57,'1003004',0,'2023-09-22 12:19:11',NULL,NULL,_binary ''),(61,58,'1003004',0,'2023-09-22 12:20:59',NULL,NULL,_binary ''),(62,59,'1003004',0,'2023-09-22 12:28:05',NULL,NULL,_binary ''),(63,60,'1003001',0,'2023-09-22 12:33:37',NULL,NULL,_binary ''),(64,60,'1003003',0,'2023-09-22 12:33:37',NULL,NULL,_binary ''),(65,61,'1003003',0,'2023-09-22 12:46:23',NULL,NULL,_binary ''),(66,62,'1003005',0,'2023-09-22 12:47:59',NULL,NULL,_binary ''),(67,63,'1003005',0,'2023-09-22 12:48:44',NULL,NULL,_binary ''),(68,64,'1003005',0,'2023-09-22 12:49:31',NULL,NULL,_binary ''),(69,65,'1003005',0,'2023-09-22 12:57:09',NULL,NULL,_binary ''),(70,66,'1003004',0,'2023-09-22 12:58:02',NULL,NULL,_binary ''),(71,67,'1003001',0,'2023-09-22 12:59:25',NULL,NULL,_binary ''),(72,68,'1003003',0,'2023-09-22 13:00:16',NULL,NULL,_binary ''),(73,69,'1003004',0,'2023-09-22 13:17:26',NULL,NULL,_binary ''),(74,70,'1003005',0,'2023-09-22 13:18:59',NULL,NULL,_binary ''),(75,71,'1003005',0,'2023-09-22 13:20:28',NULL,NULL,_binary ''),(76,72,'1003005',0,'2023-09-22 13:21:45',NULL,NULL,_binary ''),(77,73,'1003005',0,'2023-09-22 13:23:36',NULL,NULL,_binary ''),(78,74,'1003005',0,'2023-09-22 13:27:19',NULL,NULL,_binary ''),(79,75,'1003005',0,'2023-09-22 13:30:54',NULL,NULL,_binary ''),(80,76,'1003005',0,'2023-09-22 13:32:06',NULL,NULL,_binary ''),(81,77,'1003005',0,'2023-09-22 13:32:39',NULL,NULL,_binary ''),(82,78,'1003004',0,'2023-09-22 13:38:31',NULL,NULL,_binary ''),(83,79,'1003005',0,'2023-09-22 13:39:53',NULL,NULL,_binary ''),(84,80,'1003005',0,'2023-09-22 13:41:46',NULL,NULL,_binary ''),(85,81,'1003005',0,'2023-09-22 13:42:59',NULL,NULL,_binary ''),(86,82,'1003005',0,'2023-09-22 13:44:04',NULL,NULL,_binary ''),(87,83,'1003005',0,'2023-09-22 13:44:42',NULL,NULL,_binary ''),(88,84,'1003004',0,'2023-09-22 13:46:24',NULL,NULL,_binary ''),(89,85,'1003004',0,'2023-09-22 13:47:56',NULL,NULL,_binary ''),(90,86,'1003004',0,'2023-09-22 13:48:40',NULL,NULL,_binary ''),(91,87,'1003004',0,'2023-09-22 13:49:49',NULL,NULL,_binary ''),(92,88,'1003004',0,'2023-10-03 11:47:52',NULL,NULL,_binary ''),(93,89,'1003005',0,'2023-10-03 11:50:51',NULL,NULL,_binary ''),(94,90,'1003005',0,'2023-10-03 14:07:17',NULL,NULL,_binary '');
/*!40000 ALTER TABLE `scheduleday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduledayevent`
--

DROP TABLE IF EXISTS `scheduledayevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduledayevent` (
  `Id` int NOT NULL,
  `SchId` int DEFAULT NULL,
  `ScheduleDayId` int DEFAULT NULL,
  `StartTime` varchar(45) DEFAULT NULL,
  `EndTime` varchar(45) DEFAULT NULL,
  `LocationId` int DEFAULT NULL,
  `EventTypeId` int DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledayevent`
--

LOCK TABLES `scheduledayevent` WRITE;
/*!40000 ALTER TABLE `scheduledayevent` DISABLE KEYS */;
INSERT INTO `scheduledayevent` VALUES (3,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-20 17:25:54',0,'2023-09-20 17:25:54',_binary '\0'),(4,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-20 17:26:38',0,'2023-09-20 17:26:38',_binary '\0'),(5,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-21 11:21:49',0,'2023-09-21 11:21:49',_binary '\0'),(6,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-21 11:29:59',0,'2023-09-21 11:29:59',_binary '\0'),(7,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-21 11:31:23',0,'2023-09-21 11:31:23',_binary '\0'),(8,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-21 12:49:58',0,'2023-09-21 12:49:58',_binary '\0'),(9,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-22 11:29:11',0,'2023-09-22 11:29:11',_binary '\0'),(10,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-22 11:30:35',0,'2023-09-22 11:30:35',_binary '\0'),(11,0,NULL,NULL,'12:00',1009001,1008001,0,'2023-09-22 11:31:49',0,'2023-09-22 11:31:49',_binary '\0'),(13,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-22 12:19:32',0,'2023-09-22 12:19:32',_binary '\0'),(14,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-22 12:21:20',0,'2023-09-22 12:21:20',_binary '\0'),(15,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-22 12:21:42',0,'2023-09-22 12:21:42',_binary '\0'),(16,0,NULL,'11:00','12:00',1009001,1008001,0,'2023-09-20 17:25:54',0,'2023-09-20 17:25:54',_binary '\0'),(17,0,NULL,'11:00','12:00',1009002,1008001,0,'2023-09-20 17:25:54',0,'2023-09-20 17:25:54',_binary '\0');
/*!40000 ALTER TABLE `scheduledayevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_schedule`
--

DROP TABLE IF EXISTS `vw_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_schedule` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `User`,
 1 AS `RoleId`,
 1 AS `Role`,
 1 AS `EntityId`,
 1 AS `Entity`,
 1 AS `StartDate`,
 1 AS `EndDate`,
 1 AS `ScheduleTypeId`,
 1 AS `ScheduleType`,
 1 AS `WorkingTypeId`,
 1 AS `WorkingType`,
 1 AS `WorkingHours`,
 1 AS `CreatedOn`,
 1 AS `CreatedBy`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedBy`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_scheduleday`
--

DROP TABLE IF EXISTS `vw_scheduleday`;
/*!50001 DROP VIEW IF EXISTS `vw_scheduleday`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_scheduleday` AS SELECT 
 1 AS `Id`,
 1 AS `SchId`,
 1 AS `DAYId`,
 1 AS `DAY`,
 1 AS `CreatedOn`,
 1 AS `CreatedBy`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedBy`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_scheduledayevent`
--

DROP TABLE IF EXISTS `vw_scheduledayevent`;
/*!50001 DROP VIEW IF EXISTS `vw_scheduledayevent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_scheduledayevent` AS SELECT 
 1 AS `Id`,
 1 AS `SchId`,
 1 AS `SchDayId`,
 1 AS `StartTime`,
 1 AS `EndTime`,
 1 AS `LocationId`,
 1 AS `Location`,
 1 AS `EventTypeId`,
 1 AS `EventType`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'lms'
--

--
-- Dumping routines for database 'lms'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxId`(IN `prm_TableName` VARCHAR ( 200 ))
BEGIN
	
	SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` );
	PREPARE stmt1 
	FROM
		@QueryStr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxLineId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxLineId`(IN `prm_TableName` VARCHAR ( 200 ) ,
								IN `prm_HeaderId` int ,
                                IN `prm_ColumnName` varchar(200))
BEGIN
	
	SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` , ' where ' ,`prm_ColumnName`, ' = ' ,`prm_HeaderId` );
	PREPARE stmt1 
	FROM
		@QueryStr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_City` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_City`(prm_WhereClause VARCHAR ( 2000 ))
BEGIN
 set @queryStr= "select * from `City`";
 set @queryStr= concat(@queryStr, prm_WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Vocabulary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Vocabulary`(prm_WhereClause VARCHAR ( 2000 ))
BEGIN 

	

		BEGIN

			DECLARE

				offsetVal INT DEFAULT 0;

			

			SET @QueryStr = "SELECT Count(vcb.Id) INTO @TotalRecords
													FROM Vocabulary as vcb
													";

			

			SET @QueryStr = CONCAT( @QueryStr, prm_WhereClause );

			PREPARE stmt1 

			FROM

				@QueryStr;

			EXECUTE stmt1;

			DEALLOCATE PREPARE stmt1;


					

					

	SET @QueryStr = "SELECT 	
    vcb.Id AS Id, 
		vcb.Word, 
        vcb.EnglishMeaning, 
        vcb.Reference,
         vcb.Sentance,
         vcb.Pronunciation,
         vcb.Translation,
         vcb.UrduMeaning,
       vcb.CreatedOn,
		-- Func_Get_FullName(crs.CreatedBy) As CreatedName,
        vcb.CreatedBy,
		vcb.ModifiedOn,
		-- Func_Get_FullName(crs.ModifiedBy) As ModifiedName,
        vcb.ModifiedBy,
		vcb.IsActive
FROM
		Vocabulary AS vcb;
";

			
			SET @QueryStr = CONCAT( @QueryStr, prm_WhereClause );

			PREPARE stmt1 

			FROM

				@QueryStr;

			EXECUTE stmt1;

			DEALLOCATE PREPARE stmt1;

			SELECT

				@querystr;

		END;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageAssignTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAssignTask`(in id int,
        in courseId int,
        in topicId int,
		 in lectureId int,
          in studentId int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into  assignTask (Id,CourseId,TopicId,LectureId,StudentId, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,courseId,topicId,lectureId,studentId, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  assignTask set 
                         CourseId = courseId,
                          TopicId=topicId,
                          LectureId = lectureId,
                      StudentId = studentId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where    assignTask.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from  assignTask
			where
			  assignTask.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   assignTask set IsActive=1
			where 
			 assignTask.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   assignTask set IsActive=0
			where
			 assignTask.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAttendance`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_UserId   Varchar(255),
  In prm_InTime  Varchar(50) ,
   In prm_OutTime Varchar(50) ,
  In prm_WorkedHours Varchar(50) ,
  In prm_Date datetime ,
  In prm_LateAttReason Varchar(2000) ,
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN
 
			insert into Attendance (Id, UserId ,InTime ,OutTime ,WorkedHours ,Date,LateAttReason, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId  ,prm_InTime ,prm_OutTime ,prm_WorkedHours ,prm_Date,prm_LateAttReason,  prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update Attendance
				Set 
             UserId= prm_UserId,
			  UserId= prm_UserId  ,
			  InTime=prm_InTime ,
			  OutTime=prm_OutTime ,
			  WorkedHours= prm_WorkedHours ,
			  Date= prm_Date,
              LateAttReason=prm_LateAttReason,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Attendance` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Attendance` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCityStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCityStudent`(
		in id int,
     
       in cityId int,
        in studentId int,
        in createdOn datetime,
        in createdBy int,
        in modifiedOn datetime,
        in modifiedBy int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into  CityStudent (Id,CityId,StudentId, CreatedOn, CreatedBy,
           ModifiedOn, ModifiedBy, IsActive ) 
           values (id,cityId,studentId, createdOn, createdBy, modifiedOn,
           modifiedBy, isActive );
 end if;   

 if DBoperation ='Update'
 then
            update  CityStudent set 
                         CityId = cityId,
                          StudentId=studentId,
                          CreatedOn=createdOn,
                          CreatedBy=createdBy,
                          ModifiedOn=modifiedOn,
                          ModifiedBy=modifiedBy,
						  IsActive=isActive						 
             where   CityStudent.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from CityStudent
			where
			 CityStudent.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   CityStudent set IsActive=1
			where 
			 Lecture.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  CityStudent set IsActive=0
			where
			 CityStudent.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageClassTiming` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageClassTiming`(in id int,
        in schId int,
		in weekDayId int,
        in timeFrom varchar(200),
		in timeTo varchar(200),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into classtiming (Id,schId,WeekDayId,TimeFrom,TimeTo, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values 
           (id,schId,weekDayId,timeFrom,timeTo, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
 if DBoperation ='Update'
       then     
          update classtiming set  
						 
                          weekDayId=weekDayId,
                          TimeFrom=timeFrom,
                          TimeTo=timeTo,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where classtiming.Id =id and classtiming.schId=schId;
      end if;
IF DBoperation = 'Delete'
       then
            delete from classtiming
			 where classtiming.Id =id and classtiming.schId=schId;
        END if;
IF DBoperation = 'Activate'
        then
            update classtiming set IsActive=1
			 where classtiming.Id =id and classtiming.schId=schId;
        END if;
IF DBoperation = 'DeActivate'
        then
            update classtiming set IsActive=0
			 where classtiming.Id =id and classtiming.schId=schId;
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageClient`(
		in id int,
        in clientName varchar(100),      
		in cnic varchar(15),
		in cell varchar(16),
        in address varchar(1000),
        in email varchar(500),
		in joiningDate datetime,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into  Client (Id,ClientName,Cnic,Cell,Address,Email,JoiningDate, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,clientName,cnic,cell,address,email,joiningDate, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  Client set 
						  ClientName = clientName,
						  Cnic=cnic,
						  Cell=cell,                                                    
						  Address=address,
						  Email=email,
						  JoiningDate=joiningDate,
						  CreatedOn=createdOn,
						  CreatedById=createdById,
						  ModifiedOn=modifiedOn,
						  ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   Client.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from Client
			where
			 Client.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   Client set IsActive=1
			where 
			 Client.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  Client set IsActive=0
			where
			 Client.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCourse`(in id int,
        in title varchar(200),
		in shortDescription text,
        in logoBase64Path LONGTEXT,
        in fee double,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into   course (Id,Title,ShortDescription,LogoBase64Path,Fee, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,title,shortDescription,logoBase64Path,fee, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update   course set 
                          Title=title,
                          ShortDescription=shortDescription,
                          LogoBase64Path=logoBase64Path,
                          Fee=fee,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   course.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from   course
			where
			  course.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   course set IsActive=1
			where 
			  course.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   course set IsActive=0
			where
			  course.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCourseDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCourseDetail`(in id int,
        in projectTitle varchar(200),
		in projectLogoBase64Path varchar(200),
        in projectKeyPoints varchar(200),
        in reasonToJoin varchar(200),
		in courseCurriculum varchar(200),
		in iconBase64Path text,
        in title varchar(200),
		in shortDetail text,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into   coursedetail (Id,ProjectTitle,ProjectLogoBase64Path,ProjectKeyPoints,ReasonToJoin,CourseCurriculum,
           IconBase64Path,Title,ShortDetail,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,projectTitle,projectLogoBase64Path,projectKeyPoints,reasonToJoin,courseCurriculum, 
           iconBase64Path,title,shortDetail,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update   coursedetail set 
                          ProjectTitle=projectTitle,
                          ProjectLogoBase64Path=projectLogoBase64Path,
                          ProjectKeyPoints=projectKeyPoints,
                          ReasonToJoin=reasonToJoin,
                          CourseCurriculum=courseCurriculum,
                          IconBase64Path=iconBase64Path,
                          Title=title,
                          ShortDetail=shortDetail,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   coursedetail.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from   coursedetail
			where
			  coursedetail.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   coursedetail set IsActive=1
			where 
			  coursedetail.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   coursedetail set IsActive=0
			where
			  coursedetail.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageCourseSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCourseSchedule`(in id int,
        in courseId int,
		in orientationClass datetime,
        in startDate datetime,
        in description text,
		in logoBase64Path longtext,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into   courseschedule (Id,CourseId,OrientationClass,StartDate,Description,LogoBase64Path, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,courseId,orientationClass,startDate,description,logoBase64Path, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update   courseschedule set 
                          CourseId=courseId,
                          OrientationClass=orientationClass,
                          StartDate=startDate,
                          Description=description,
                          LogoBase64Path=logoBase64Path,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   courseschedule.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
			delete from classtiming where classtiming.SchId=id;
            delete from   courseschedule
			where
			  courseschedule.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   courseschedule set IsActive=1
			where 
			  courseschedule.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   courseschedule set IsActive=0
			where
			  courseschedule.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageInquiry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageInquiry`(in id int,
        in name varchar(50),
        in cell varchar(50),
        in servicesId int,
        in email varchar(500),
        in comments longtext,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into lms.inquiry (Id,Name,Cell,ServicesId,Email,Comments, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,cell,servicesId,email,comments, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update lms.inquiry set 
                          Name=name,
                          Cell=cell,
                          ServicesId=servicesId,
                          Email=email,
                          Comments=comments,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where lms.inquiry.Id =id;
   end if;
    IF DBoperation = 'Delete'
    then
            delete from   lms.inquiry
			where
			  lms.inquiry.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   lms.inquiry set IsActive=1
			where 
			  lms.inquiry.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   lms.inquiry set IsActive=0
			where
			  lms.inquiry.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageLecture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageLecture`(in id int,
        in courseId int,
        in topicId int,
		in title varchar(200),
		in description Longtext,
		in url varchar(45),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into  Lecture (Id,CourseId,TopicId,Title,Description,URL, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,courseId,topicId,title,description,url, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  Lecture set 
                         CourseId = courseId,
                          TopicId=topicId,
                          Title=title,
                          Description=description,
                          URL=url,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   Lecture.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from Lecture
			where
			 Lecture.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   Lecture set IsActive=1
			where 
			 Lecture.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  Lecture set IsActive=0
			where
			 Lecture.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManagePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePatient`(
		in id int,
        in patientName varchar(100),
        in dateofBirth datetime,
		in gender varchar(6),
		in contactNo VARCHAR(45),
		in houseNo varchar(45),
        in address varchar(200),
        in remarks varchar(1000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into  Patient (Id,PatientName,DateofBirth,Gender,ContactNo,HouseNo,Address,Remarks, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,patientName,dateofBirth,gender,contactNo,houseNo,address,remarks, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  Patient set 
                         PatientName = patientName,
                          DateofBirth=dateofBirth,
                          Gender=gender,
                          ContactNo=contactNo,
                          HouseNo=houseNo,
                          Address=address,
                          Remarks=remarks,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   Patient.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from Patient
			where
			 Patient.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   Patient set IsActive=1
			where 
			 Patient.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  Patient set IsActive=0
			where
			 Patient.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSchedule`(in id int,
        in courseId int,
		in orientationClass datetime,
        in startDate datetime,
        in description text,
		in logoBase64Path longtext,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into   schedule (Id,CourseId,OrientationClass,StartDate,Description,LogoBase64Path, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,courseId,orientationClass,startDate,description,logoBase64Path, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update   schedule set 
                          CourseId=courseId,
                          OrientationClass=orientationClass,
                          StartDate=startDate,
                          Description=description,
                          LogoBase64Path=logoBase64Path,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   schedule.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
			delete from classtiming where classtiming.SchId=id;
            delete from   schedule
			where
			  schedule.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   schedule set IsActive=1
			where 
			  schedule.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   schedule set IsActive=0
			where
			  schedule.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageScheduleDayEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageScheduleDayEvent`(
in Id int, 
in StartTime varchar(45),
in EndTime varchar(45),
in LocationId int,
in EventTypeId int,
in SchId int,
in ScheduleDayId int,
in createdOn datetime,
in createdById int,
in modifiedOn datetime,
in modifiedById int,
in isActive bool,
in DbOperation varchar(200))
BEGIN

if DbOperation='Insert'
then 
 insert into scheduleDayEvent (Id, StartTime, EndTime,LocationId,EventTypeId,SchId,ScheduleDayId, CreatedOn,CreatedById,ModifiedOn,ModifiedById,IsActive ) 
 values(Id, StartTime, EndTime,LocationId,EventTypeId,SchId,ScheduleDayId, createdOn,createdById,modifiedOn,modifiedById,isActive );
end If;

if DbOperation='Update'
then 
update scheduleDaysEvents set 
 StartTime=startTime,
 EndTime=endTime,
LocationId=LocationId,
EventTypeId=EventTypeId,
 ScheduleDayId = ScheduleDayId ,
 SchId=SchId,
 CreatedOn=createdOn,
 CreatedById=createdById,
 ModifiedOn=modifiedOn,
 ModifiedById=modifiedById,
 IsActive=isActive
 where scheduleDayEvent.Id= id ;
end If;

if DbOperation='Delete'
then
DELETE FROM scheduleDayEvent where scheduleDayEvent.Id=id ;
end if;

if DbOperation='Activate'
then 
update scheduleDayEvent set IsActive=1
 where scheduleDayEvent.Id=id;
end iF;

if DbOperation='DeActivate'
then 
update scheduleDayEvent set IsActive=0
 where scheduleDayEvent.Id=id;
end iF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageScheduleDayEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageScheduleDayEvents`(
in Id int, 
in StartTime varchar(45),
in EndTime varchar(45),
in LocationId int,
in EventTypeId int,
in schId int,
in prm_DAYId int,
in createdOn datetime,
in createdById int,
in modifiedOn datetime,
in modifiedById int,
in isActive bool,
in DbOperation varchar(200))
BEGIN

if DbOperation='Insert'
then 
 insert into scheduleDaysEvents (Id, StartTime, EndTime,LocationId,EventTypeId,SchId,DAYId, CreatedOn,CreatedById,ModifiedOn,ModifiedById,IsActive ) 
 values(Id, StartTime, EndTime,LocationId,EventTypeId,schId,prm_DAYId, createdOn,createdById,modifiedOn,modifiedById,isActive );
end If;

if DbOperation='Update'
then 
update scheduleDaysEvents set 
 StartTime=startTime,
 EndTime=endTime,
LocationId=LocationId,
EventTypeId=EventTypeId,
 DAYId = prm_DAYId ,
 SchId=schId,
 CreatedOn=createdOn,
 CreatedById=createdById,
 ModifiedOn=modifiedOn,
 ModifiedById=modifiedById,
 IsActive=isActive
 where scheduleDaysEvents.Id= id ;
end If;

if DbOperation='Delete'
then
DELETE FROM scheduleDaysEvents where scheduleDaysEvents.Id=id ;
end if;

if DbOperation='Activate'
then 
update scheduleDaysEvents set IsActive=1
 where scheduleDaysEvents.Id=id;
end iF;

if DbOperation='DeActivate'
then 
update scheduleDaysEvents set IsActive=0
 where scheduleDaysEvents.Id=id;
end iF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSettings`(in id int,
        in enumTypeId int,
        in parentId int,
        in uploadStatus bit,
        in keyCode varchar(2000),
        in isSystemDefined bit,
        in name varchar(500),
        in description varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into enumline (Id,KeyCode,IsSystemDefined,UploadStatus,EnumTypeId,ParentId,Name,Description, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,keyCode,isSystemDefined,uploadStatus,enumTypeId,parentId,name,description, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
if DBoperation ='Update'
 then
            update enumline set 
            KeyCode=keyCode,
            IsSystemDefined=isSystemDefined,
            UploadStatus=uploadStatus,
						  EnumTypeId=enumTypeId,
                          ParentId=parentId,
                          Name=name,
                          Description=description,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where enumline.Id =id;
   end if;
IF DBoperation = 'Delete'
    then
            delete from enumline
			where
			enumline.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update enumline set IsActive=1
			where 
			enumline.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update enumline set IsActive=0
			where
			enumline.Id=id;            
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSettingsType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSettingsType`(in id int,
        in parentId int,
        in name varchar(500),
		in keyCode varchar(2000),
        in isSystemDefined bit,
         in uploadStatus bit,
        in description varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
    
           insert into enums (Id,KeyCode,IsSystemDefined,UploadStatus,ParentId,Name,Description, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,keyCode,isSystemDefined,uploadStatus,parentId,name,description, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update enums set 
                          KeyCode=keyCode,
						UploadStatus=uploadStatus,
                          IsSystemDefined=isSystemDefined,
                          ParentId=parentId,
                          Name=name,
                          Description=description,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where enums.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from enums
			where
			enums.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update enums set IsActive=1
			where 
			enums.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update enums set IsActive=0
			where
			enums.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageTeachers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTeachers`(
in id int,  
/* in topicTitle varchar(200),*/

in courseId int,
in topicId int,
in name varchar(45),
in email varchar(45),
in address varchar(200),

in createdOn datetime,
in createdById int,
in modifiedOn datetime,
in modifiedById int,
in isActive bool,	
in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
insert into  teachers (Id,CourseId,TopicId,Name,Email,Address,CreatedOn,CreatedById,ModifiedOn,ModifiedById,IsActive) 
values (id,courseId,topicId,name,email,address,createdOn, createdById, modifiedOn,modifiedById,isActive);
end if;   
/*update*/
 if DBoperation ='Update'
 then
update  teachers set 
CourseId=courseId,
TopicId=topicId,
Name = name,
Email = email,
Address = address,
CreatedOn=createdOn,
CreatedById=createdById,
ModifiedOn=modifiedOn,
ModifiedById=modifiedById,
IsActive=isActive					  
where   teachers.Id =id;
end if;
if DbOperation='Delete'
then
DELETE FROM teachers where teachers.Id=id;
end if;

if DbOperation='Activate'
then 
update teachers set IsActive=1 where teachers.Id=id;
end iF;

if DbOperation='DeActivate'
then 
update teachers set IsActive=0 where teachers.Id=id;
end iF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageTopic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTopic`(
in id int,
in topicTitle varchar(200),

in courseId int,
in description varchar(1000),

in createdOn datetime,
in createdById int,
in modifiedOn datetime,
in modifiedById int,
in isActive bool,
in DbOperation varchar(200))
BEGIN

if DbOperation='Insert'
then 
 insert into topic (Id, CourseId, TopicTitle,Description,CreatedOn,CreatedById,ModifiedOn,ModifiedById,IsActive ) 
 values(id,courseId, topicTitle,description,createdOn,createdById,modifiedOn,modifiedById,isActive );
end If;

if DbOperation='Update'
then 
update topic set 
 TopicTitle=topicTitle,
 CourseId=courseId,
 Description=description,
 CreatedOn=createdOn,
 CreatedById=createdById,
 ModifiedOn=modifiedOn,
 ModifiedById=modifiedById,
 IsActive=isActive
 where topic.Id= id;
end If;

if DbOperation='Delete'
then
DELETE FROM topic where topic.Id=id;
end if;

if DbOperation='Activate'
then 
update topic set IsActive=1 where topic.Id=id;
end iF;

if DbOperation='DeActivate'
then 
update topic set IsActive=0 where topic.Id=id;
end iF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageUser`(in id int,
		in email varchar(200),
        in password varchar(200),
		in rememberMe bool,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into   user (Id,Email,Password,RememberMe, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,email,password,rememberMe, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update   user set 
                          Email=email,
                          Password=password,
                          RememberMe=rememberMe,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   user.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from   user
			where
			  user.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   user set IsActive=1
			where 
			  user.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update   user set IsActive=0
			where
			  user.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageUseraccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageUseraccount`(
		in id int,
        in UserName varchar(45),
        in Cell varchar(16),
		in Email varchar(50),
		in Password VARCHAR(1000),
		in RetypePassword varchar(1000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into  useraccount (Id,UserName,Cell,Email,Password,RetypePassword, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,userName,cell,email,password,retypePassword, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  useraccount set 
                         UserName=userName,
                          Cell=cell,
                          Email=emai,
                          Password=password,
                          RetypePassword=retypePassword,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   useraccount.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from useraccount
			where
			 useraccount.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   useraccount set IsActive=1
			where 
			 useraccount.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  useraccount set IsActive=0
			where
			 useraccount.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageVocabulary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageVocabulary`(
  in Id int ,
  in Word  Varchar(50),
  in EnglishMeaning Varchar(50) ,
  in Reference  Varchar(500),
  in Sentance Varchar(5000) ,
  in Pronunciation  Varchar(1000),
  in Comment Varchar(1000) ,
  in UrduMeaning Varchar(500) ,
  in CreatedById INT,
  in CreatedOn datetime,
  in ModifiedById INT,
  in ModifiedOn datetime,
  in IsActive bit,
  in DBoperation varchar(50)
        )
BEGIN
if DBoperation = 'Insert'
then
           insert into Vocabulary (Id, Word, EnglishMeaning, Reference, Sentance, Pronunciation, Comment,UrduMeaning,  CreatedById, CreatedOn,ModifiedOn, ModifiedById, IsActive) 
			values (id, word,englishMeaning,reference,sentance,pronunciation,comment,urduMeaning, createdById, createdOn,modifiedOn, modifiedById, isActive );
           
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  Vocabulary set 
                           Word = word ,
						   EnglishMeaning=englishMeaning,
						   Reference=reference,
						   Sentance=sentance  ,
						   Pronunciation =pronunciation,
						   Comment=comment,
                           UrduMeaning=urduMeaning,
						   CreatedById =createdById ,
						   CreatedOn=createdOn ,
						   ModifiedById=modifiedById,
						   ModifiedOn=modifiedOn,
						   IsActive=isActive
             where   Vocabulary.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from Vocabulary
			where
			 Vocabulary.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   Vocabulary set IsActive=1
			where 
			 Vocabulary.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  Vocabulary set IsActive=0
			where
			 Vocabulary.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Attendance`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_UserId   Varchar(255),
  In prm_InTime  Varchar(50) ,
   In prm_OutTime Varchar(50) ,
  In prm_WorkedHours Varchar(50) ,
  In prm_Date datetime ,
  In prm_LateAttReason Varchar(2000) ,
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN
 
			insert into Tasks (Id, UserId ,InTime ,OutTime ,WorkedHours ,Date,LateAttReason, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId  ,prm_InTime ,prm_OutTime ,prm_WorkedHours ,prm_Date,prm_LateAttReason,prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update tasks
				Set 
             UserId= prm_UserId,
			  UserId= prm_UserId  ,
			  InTime=prm_InTime ,
			  OutTime=prm_OutTime ,
			  WorkedHours= prm_WorkedHours ,
			  Date= prm_Date,
              LateAttReason=prm_LateAttReason,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Tasks` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Tasks` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_City` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_City`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_Name  Varchar(50),
 IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into City (Id, Name,CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_Name, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update City
				Set 
				Name = prm_Name,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `City` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `City` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Sch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Sch`( In prm_Filter varchar (50),
	In prm_Id int ,
	In prm_UserId   Varchar(255),  
    In prm_RoleId  Varchar(50) ,
	In prm_ScheduleTypeId  int,  
    In prm_EffectiveDate  datetime,  
	IN prm_CreatedBy INT,
	IN prm_CreatedOn datetime ( 0 ),
	IN prm_ModifiedBy INT,
	IN prm_ModifiedOn datetime ( 0 ),
	In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into Sch (Id, UserId,RoleId, ScheduleTypeId ,EffectiveDate, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId, prm_RoleId, prm_ScheduleTypeId , prm_EffectiveDate,  prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update Sch
				Set 
             UserId= prm_UserId,    
             RoleId= prm_RoleId,
             ScheduleTypeId = prm_ScheduleTypeId,
             EffectiveDate = prm_EffectiveDate,            
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Sch` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Sch` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Schedule`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_UserId   Varchar(50),
  In prm_RoleId  Varchar(50) ,
   In prm_EntityId int ,
   In prm_ScheduleTypeId  int ,
  In prm_WorkingTypeId int ,
  In prm_WorkingHours Varchar(500) ,
  In prm_StartDate datetime ,
  In prm_EndDate datetime ,
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into Schedule (Id, UserId, RoleId, EntityId,ScheduleTypeId ,WorkingTypeId ,WorkingHours,StartDate, EndDate, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId, prm_RoleId,prm_EntityId, prm_ScheduleTypeId , prm_WorkingTypeId ,prm_WorkingHours ,prm_StartDate, prm_EndDate,  prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update Schedule
				Set 
             UserId= prm_UserId,
             RoleId= prm_RoleId,
             EntityId= prm_EntityId,
             ScheduleTypeId = prm_ScheduleTypeId,
            WorkingTypeId = prm_WorkingTypeId ,
            WorkingHours= prm_WorkingHours ,
             StartDate = prm_StartDate,
            EndDate = prm_EndDate,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Schedule` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Schedule` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_scheduleday` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_scheduleday`( In prm_Filter varchar (50),
	In prm_Id  int, 
    In prm_DayId  int, 
    In prm_SchId  int, 
	IN prm_CreatedBy INT,
	IN prm_CreatedOn datetime ( 0 ),
	IN prm_ModifiedBy INT,
	IN prm_ModifiedOn datetime ( 0 ),
	In prm_IsActive bit ( 1 )
    
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into scheduleday (Id, DayId,SchId, CreatedBy, CreatedOn, IsActive)
			values (prm_Id, prm_DayId,prm_SchId, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update scheduleday
				Set                      
				ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where  scheduleday.SchId=prm_SchId and scheduleday.DayId =prm_dayId;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `scheduleday` 
					Where  scheduleday.SchId=prm_SchId and scheduleday.DayId =prm_dayId;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `scheduleday` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

							Where  scheduleday.SchId=prm_SchId and scheduleday.DayId =prm_dayId;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_SchLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_SchLine`( In prm_Filter varchar (50),

    In prm_DayId  int, 
    In prm_SchId  int, 
	IN prm_CreatedBy INT,
	IN prm_CreatedOn datetime ( 0 ),
	IN prm_ModifiedBy INT,
	IN prm_ModifiedOn datetime ( 0 ),
	In prm_IsActive bit ( 1 )
    
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into SchLine ( DayId,SchId, CreatedBy, CreatedOn, IsActive)
			values (  prm_DayId,prm_SchId, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update SchLine
				Set                      
				ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where  SchLine.SchId=prm_SchId and SchLine.DayId =prm_dayId;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `SchLine` 
					Where  SchLine.SchId=prm_SchId and SchLine.DayId =prm_dayId;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `SchLine` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

							Where  SchLine.SchId=prm_SchId and SchLine.DayId =prm_dayId;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Student`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_CityId  int,
  In prm_CellNo  Varchar(45),
 In prm_Name  Varchar(50),
  In prm_Email  Varchar(50),
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into Student (Id, CityId,CellNo,  Name, Email, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_CityId,prm_CellNo, prm_Name, prm_Email, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update Student
				Set 
                	CityId = prm_CityId,
            CellNo = prm_CellNo,
				Name = prm_Name,
               Email = prm_Email,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Student` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Student` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Task`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_UserId   Varchar(255),
  In prm_PriorityId  int ,
   In prm_StatusId int ,
   In prm_ModuleId  int ,
  In prm_TaskTitle  Varchar(255) ,
  In prm_StoryPoints Varchar(500) ,
  In prm_SPs double ,
  In prm_Date datetime ,
    In prm_DayEndStatus INT ,
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into Tasks (Id, UserId, PriorityId, StatusId,ModuleId ,TaskTitle ,StoryPoints,SPs ,Date, DayEndStatus, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId, prm_PriorityId,prm_StatusId, prm_ModuleId , prm_TaskTitle ,prm_StoryPoints ,prm_SPs, prm_Date,prm_DayEndStatus,  prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update Tasks
				Set 
             UserId= prm_UserId,
             PriorityId=prm_PriorityId,
            StatusId= prm_StatusId, 
             ModuleId=prm_ModuleId ,
            TaskTitle= prm_TaskTitle ,
             StoryPoints=prm_StoryPoints ,
             SPs=prm_SPs, 
             Date=prm_Date,
             DayEndStatus=prm_DayEndStatus,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Tasks` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Taska` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Vocabulary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Vocabulary`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_Word  Varchar(50),
  In prm_Meaning Varchar(50) ,
  In prm_Reference  Varchar(500),
  In prm_Sentance Varchar(5000) ,
  In prm_Pronunciation  Varchar(1000),
  In prm_Translation Varchar(100) ,
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into Vocabulary (Id, Word, Meaning, Reference, Sentance, Pronunciation, Translation,  CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_Word, prm_Meaning,prm_Reference,prm_Sentance,prm_Pronunciation,prm_Translation, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update Vocabulary
				Set 
				Word = prm_Word,
               Meaning = prm_Meaning,
             Reference = prm_Reference,
              Sentance = prm_Sentance,
              Pronunciation = prm_Pronunciation, 
             Translation = prm_Translation,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `Vocabulary` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `Vocabulary` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchAssignTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAssignTask`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_assigntask`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAttendance`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_Attendance`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCityStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCityStudent`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_CityStudent`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchClassTiming` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchClassTiming`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`vw_classtiming`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchClient`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * FROM Client ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourse`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`course`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCourseDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourseDetail`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`coursedetail`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCourseSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourseSchedule`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`vw_courseschedule`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchInquiry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchInquiry`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`inquiry`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchLecture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchLecture`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * FROM vw_lecture ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPatient`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * FROM Patient ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSch`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_Sch`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSchDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSchDay`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_scheduleday`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSchedule`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_Schedule`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchScheduleDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchScheduleDay`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_scheduleday`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchScheduleDayEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchScheduleDayEvent`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_scheduledayevent`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchScheduleDayEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchScheduleDayEvents`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_scheduledayevents`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSchLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSchLine`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_scheduleday`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSettings`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_settings`';
           
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchSettingsType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSettingsType`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_settingstype`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStudent`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_Student`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTask`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_Task`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchTeachers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTeachers`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * FROM vw_teachers ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchTopic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTopic`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_topic`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUser`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`user`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserAccount`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `useraccount`";
 set @queryStr= concat(@queryStr, WhereClause);
 prepare stm1
 from @queryStr;
 execute stm1;
 deallocate prepare stm1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserattbydate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserattbydate`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_userattbydate`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserreport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserreport`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_userreport`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUsertaskbydate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUsertaskbydate`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_usertaskbydate`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchVocabulary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchVocabulary`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * FROM vocabulary ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_schedule` AS select `schedule`.`Id` AS `Id`,`schedule`.`UserId` AS `UserId`,`aspnetusers`.`UserName` AS `User`,`schedule`.`RoleId` AS `RoleId`,`aspnetroles`.`Name` AS `Role`,`schedule`.`EntityId` AS `EntityId`,`entity`.`Name` AS `Entity`,`schedule`.`StartDate` AS `StartDate`,`schedule`.`EndDate` AS `EndDate`,`schedule`.`ScheduleTypeId` AS `ScheduleTypeId`,`scheduletype`.`Name` AS `ScheduleType`,`schedule`.`WorkingTypeId` AS `WorkingTypeId`,`workingtype`.`Name` AS `WorkingType`,`schedule`.`WorkingHours` AS `WorkingHours`,`schedule`.`CreatedOn` AS `CreatedOn`,`schedule`.`CreatedBy` AS `CreatedBy`,`schedule`.`ModifiedOn` AS `ModifiedOn`,`schedule`.`ModifiedBy` AS `ModifiedBy`,`schedule`.`IsActive` AS `IsActive` from (((((`schedule` left join `aspnetusers` on((`aspnetusers`.`Id` = `schedule`.`UserId`))) left join `aspnetroles` on((`aspnetroles`.`Id` = `schedule`.`RoleId`))) left join `enumline` `entity` on((`entity`.`Id` = `schedule`.`EntityId`))) left join `enumline` `scheduletype` on((`scheduletype`.`Id` = `schedule`.`ScheduleTypeId`))) left join `enumline` `workingtype` on((`workingtype`.`Id` = `schedule`.`WorkingTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_scheduleday`
--

/*!50001 DROP VIEW IF EXISTS `vw_scheduleday`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_scheduleday` AS select `scheduleday`.`Id` AS `Id`,`scheduleday`.`SchId` AS `SchId`,`scheduleday`.`DayId` AS `DAYId`,`day`.`Name` AS `DAY`,`scheduleday`.`CreatedOn` AS `CreatedOn`,`scheduleday`.`CreatedBy` AS `CreatedBy`,`scheduleday`.`ModifiedOn` AS `ModifiedOn`,`scheduleday`.`ModifiedBy` AS `ModifiedBy`,`scheduleday`.`IsActive` AS `IsActive` from (`scheduleday` left join `enumline` `day` on((`day`.`Id` = `scheduleday`.`DayId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_scheduledayevent`
--

/*!50001 DROP VIEW IF EXISTS `vw_scheduledayevent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_scheduledayevent` AS select `schday`.`Id` AS `Id`,`schday`.`SchId` AS `SchId`,`schday`.`ScheduleDayId` AS `SchDayId`,`schday`.`StartTime` AS `StartTime`,`schday`.`EndTime` AS `EndTime`,`schday`.`LocationId` AS `LocationId`,`location`.`Name` AS `Location`,`schday`.`EventTypeId` AS `EventTypeId`,`eventtype`.`Name` AS `EventType`,`schday`.`CreatedOn` AS `CreatedOn`,`schday`.`CreatedById` AS `CreatedById`,`schday`.`ModifiedOn` AS `ModifiedOn`,`schday`.`ModifiedById` AS `ModifiedById`,`schday`.`IsActive` AS `IsActive` from ((`scheduledayevent` `schday` left join `enumline` `eventtype` on((`eventtype`.`Id` = `schday`.`EventTypeId`))) left join `enumline` `location` on((`location`.`Id` = `schday`.`LocationId`))) */;
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

-- Dump completed on 2023-10-05 14:40:53
