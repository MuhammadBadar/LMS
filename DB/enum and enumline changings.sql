-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `enumline`
--

DROP TABLE IF EXISTS `enumline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumline` (
  `Id` int NOT NULL,
  `EnumTypeId` int NOT NULL,
  `ParentId` int DEFAULT NULL,
  `KeyCode` varchar(2000) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `IsSystemDefined` bit(1) DEFAULT NULL,
  `UploadStatus` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumline`
--

LOCK TABLES `enumline` WRITE;
/*!40000 ALTER TABLE `enumline` DISABLE KEYS */;
INSERT INTO `enumline` VALUES (1003001,1003,0,'Week_Days_Monday','Monday',NULL,_binary '',_binary '\0','2023-05-19 23:33:08',0,'2023-05-19 23:33:08',0,_binary ''),(1003002,1003,0,'Week_Days_Tuesday','Tuesday',NULL,_binary '',_binary '\0','2023-05-19 23:33:27',0,'2023-05-19 23:33:27',0,_binary ''),(1003003,1003,0,'Week_Days_Wednesday','Wednesday',NULL,_binary '',_binary '\0','2023-05-19 23:33:39',0,'2023-05-19 23:33:39',0,_binary ''),(1003004,1003,0,'Week_Days_Thursday','Thursday',NULL,_binary '',_binary '\0','2023-05-19 23:34:03',0,'2023-05-19 23:34:03',0,_binary ''),(1003005,1003,0,'Week_Days_Friday','Friday',NULL,_binary '',_binary '\0','2023-05-19 23:34:11',0,'2023-05-19 23:34:11',0,_binary ''),(1003006,1003,0,'Week_Days_Saturday','Saturday',NULL,_binary '',_binary '\0','2023-05-19 23:34:22',0,'2023-05-19 23:34:22',0,_binary ''),(1003007,1003,0,'Week_Days_Sunday','Sunday',NULL,_binary '',_binary '\0','2023-05-19 23:34:29',0,'2023-05-19 23:34:29',0,_binary ''),(1001001,1001,0,'/security','Security',NULL,_binary '',_binary '\0','2023-07-25 23:55:41',0,'2023-07-25 23:55:41',0,_binary ''),(1002001,1002,1001001,'/security/users','Manage User',NULL,_binary '',_binary '\0','2023-07-25 23:57:16',0,'2023-07-25 23:57:16',0,_binary ''),(1002002,1002,1001001,'/security/roles','Manage Role',NULL,_binary '',_binary '\0','2023-07-25 23:58:39',0,'2023-07-25 23:58:39',0,_binary '\0'),(1002003,1002,1001001,'/security/userrole','User Roles',NULL,_binary '',_binary '\0','2023-07-25 23:59:55',0,'2023-07-25 23:59:55',0,_binary '\0'),(1001002,1001,0,'/lms/TRN','TRN',NULL,_binary '',_binary '\0','2023-07-26 00:10:23',0,'2023-07-26 00:10:23',0,_binary ''),(1002004,1002,1001002,'/lms/Student','ManageStudent',NULL,_binary '',_binary '\0','2023-07-26 00:10:53',0,'2023-07-26 00:10:53',0,_binary '\0'),(1002005,1002,1001002,'/lms/course','Manage Course',NULL,_binary '',_binary '\0','2023-07-26 04:08:33',0,'2023-07-26 04:08:33',0,_binary ''),(1002006,1002,1001002,'/lms/topic','Manage Topic',NULL,_binary '',_binary '\0','2023-07-26 04:12:08',0,'2023-07-26 04:12:08',0,_binary '\0'),(1002007,1002,1001002,'/lms/lecture','Manage Lecture',NULL,_binary '',_binary '\0','2023-07-26 04:13:18',0,'2023-07-26 04:13:18',0,_binary '\0'),(1002008,1002,1001002,'/lms/City','Manage City',NULL,_binary '',_binary '\0','2023-07-26 04:13:42',0,'2023-07-26 04:13:42',0,_binary '\0'),(1002009,1002,1001002,'/lms/assignTask','Manage AssignTask',NULL,_binary '',_binary '\0','2023-07-26 04:14:35',0,'2023-07-26 04:14:35',0,_binary ''),(1001003,1001,0,'Back_OfficeIMS','IMS',NULL,_binary '',_binary '\0','2023-07-26 04:16:00',0,'2023-07-26 04:16:00',0,_binary ''),(1002011,1002,1001003,'/lms/inquiry','Manage Inquiry',NULL,_binary '',_binary '\0','2023-07-26 04:16:32',0,'2023-07-26 04:16:32',0,_binary '\0'),(1001004,1001,0,'Back_OfficeSCH','SCH',NULL,_binary '',_binary '\0','2023-07-26 04:16:56',0,'2023-07-26 04:16:56',0,_binary ''),(1002012,1002,1001004,'/lms/schedule','Manage Schedule',NULL,_binary '',_binary '\0','2023-07-26 05:18:02',0,'2023-07-26 05:18:02',0,_binary ''),(1002013,1002,1001004,'/lms/schList','ScheduleList',NULL,_binary '',_binary '\0','2023-07-26 05:19:26',0,'2023-07-26 05:19:26',0,_binary ''),(1002014,1002,1001004,'/lms/ScheduleFH','Manage ScheduleFH',NULL,_binary '',_binary '\0','2023-07-26 05:21:39',0,'2023-07-26 05:21:39',0,_binary ''),(1004001,1004,0,'','Lahore',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:03',0,'2023-08-04 00:51:03',0,_binary ''),(1004002,1004,0,'','IslamAbad',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:17',0,'2023-08-04 00:51:17',0,_binary ''),(1004003,1004,0,'','Gujjraat',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:26',0,'2023-08-04 00:51:26',0,_binary '');
/*!40000 ALTER TABLE `enumline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enums`
--

DROP TABLE IF EXISTS `enums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enums` (
  `Id` int NOT NULL,
  `ParentId` int DEFAULT NULL,
  `KeyCode` varchar(2000) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `IsSystemDefined` bit(1) DEFAULT NULL,
  `UploadStatus` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enums`
--

LOCK TABLES `enums` WRITE;
/*!40000 ALTER TABLE `enums` DISABLE KEYS */;
INSERT INTO `enums` VALUES (1001,0,'Back_Office','Back Office',NULL,_binary '',_binary '\0','2023-05-17 22:44:18',0,'2023-05-17 22:44:18',0,_binary ''),(1002,1001,'Side_Menu','Side Menu',NULL,_binary '',_binary '\0','2023-05-17 22:44:34',0,'2023-05-17 22:44:34',0,_binary ''),(1003,0,'Week_Days','Week Days',NULL,_binary '',_binary '\0','2023-05-19 23:32:54',0,'2023-05-19 23:32:54',0,_binary ''),(1004,0,'cities','cities',NULL,_binary '',_binary '\0','2023-07-31 23:06:31',0,'2023-07-31 23:06:31',0,_binary '');
/*!40000 ALTER TABLE `enums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-04  5:42:08
