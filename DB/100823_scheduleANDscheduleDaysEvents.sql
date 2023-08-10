-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.21

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
INSERT INTO `enumline` VALUES (1003001,1003,0,'Week_Days_Monday','Monday',NULL,_binary '',_binary '\0','2023-05-19 23:33:08',0,'2023-05-19 23:33:08',0,_binary ''),(1003002,1003,0,'Week_Days_Tuesday','Tuesday',NULL,_binary '',_binary '\0','2023-05-19 23:33:27',0,'2023-05-19 23:33:27',0,_binary ''),(1003003,1003,0,'Week_Days_Wednesday','Wednesday',NULL,_binary '',_binary '\0','2023-05-19 23:33:39',0,'2023-05-19 23:33:39',0,_binary ''),(1003004,1003,0,'Week_Days_Thursday','Thursday',NULL,_binary '',_binary '\0','2023-05-19 23:34:03',0,'2023-05-19 23:34:03',0,_binary ''),(1003005,1003,0,'Week_Days_Friday','Friday',NULL,_binary '',_binary '\0','2023-05-19 23:34:11',0,'2023-05-19 23:34:11',0,_binary ''),(1003006,1003,0,'Week_Days_Saturday','Saturday',NULL,_binary '',_binary '\0','2023-05-19 23:34:22',0,'2023-05-19 23:34:22',0,_binary ''),(1003007,1003,0,'Week_Days_Sunday','Sunday',NULL,_binary '',_binary '\0','2023-05-19 23:34:29',0,'2023-05-19 23:34:29',0,_binary ''),(1001001,1001,0,'/security','Security',NULL,_binary '',_binary '\0','2023-07-25 23:55:41',0,'2023-07-25 23:55:41',0,_binary ''),(1002001,1002,1001001,'/security/users','Manage User',NULL,_binary '',_binary '\0','2023-07-25 23:57:16',0,'2023-07-25 23:57:16',0,_binary ''),(1002002,1002,1001001,'/security/roles','Manage Role',NULL,_binary '',_binary '\0','2023-07-25 23:58:39',0,'2023-07-25 23:58:39',0,_binary '\0'),(1002003,1002,1001001,'/security/userrole','User Roles',NULL,_binary '',_binary '\0','2023-07-25 23:59:55',0,'2023-07-25 23:59:55',0,_binary '\0'),(1001002,1001,0,'/lms/TRN','TRN',NULL,_binary '',_binary '\0','2023-07-26 00:10:23',0,'2023-07-26 00:10:23',0,_binary ''),(1002004,1002,1001002,'/lms/Student','ManageStudent',NULL,_binary '',_binary '\0','2023-07-26 00:10:53',0,'2023-07-26 00:10:53',0,_binary '\0'),(1002005,1002,1001002,'/lms/course','Manage Course',NULL,_binary '',_binary '\0','2023-07-26 04:08:33',0,'2023-07-26 04:08:33',0,_binary ''),(1002006,1002,1001002,'/lms/topic','Manage Topic',NULL,_binary '',_binary '\0','2023-07-26 04:12:08',0,'2023-07-26 04:12:08',0,_binary '\0'),(1002007,1002,1001002,'/lms/lecture','Manage Lecture',NULL,_binary '',_binary '\0','2023-07-26 04:13:18',0,'2023-07-26 04:13:18',0,_binary '\0'),(1002008,1002,1001002,'/lms/City','Manage City',NULL,_binary '',_binary '\0','2023-07-26 04:13:42',0,'2023-07-26 04:13:42',0,_binary '\0'),(1002009,1002,1001002,'/lms/assignTask','Manage AssignTask',NULL,_binary '',_binary '\0','2023-07-26 04:14:35',0,'2023-07-26 04:14:35',0,_binary ''),(1001003,1001,0,'Back_OfficeIMS','IMS',NULL,_binary '',_binary '\0','2023-07-26 04:16:00',0,'2023-07-26 04:16:00',0,_binary ''),(1002011,1002,1001003,'/lms/inquiry','Manage Inquiry',NULL,_binary '',_binary '\0','2023-07-26 04:16:32',0,'2023-07-26 04:16:32',0,_binary '\0'),(1001004,1001,0,'Back_OfficeSCH','SCH',NULL,_binary '',_binary '\0','2023-07-26 04:16:56',0,'2023-07-26 04:16:56',0,_binary ''),(1002012,1002,1001004,'/lms/schedule','Manage CourseSchedule',NULL,_binary '',_binary '\0','2023-07-26 05:18:02',0,'2023-07-26 05:18:02',0,_binary ''),(1002013,1002,1001004,'/lms/schList','ScheduleList',NULL,_binary '',_binary '\0','2023-07-26 05:19:26',0,'2023-07-26 05:19:26',0,_binary ''),(1002014,1002,1001004,'/lms/ScheduleFH','Manage Schedule',NULL,_binary '',_binary '\0','2023-07-26 05:21:39',0,'2023-07-26 05:21:39',0,_binary ''),(1004001,1004,0,'','Lahore',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:03',0,'2023-08-04 00:51:03',0,_binary ''),(1004002,1004,0,'','IslamAbad',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:17',0,'2023-08-04 00:51:17',0,_binary ''),(1004003,1004,0,'','Gujjraat',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:26',0,'2023-08-04 00:51:26',0,_binary ''),(1005001,1005,0,'EntitiesUser','User',NULL,_binary '',_binary '\0','2023-08-08 11:25:33',0,'2023-08-08 11:25:33',0,_binary ''),(1005002,1005,0,'EntitiesRole','Role',NULL,_binary '',_binary '\0','2023-08-08 11:26:14',0,'2023-08-08 11:26:14',0,_binary ''),(1006001,1006,0,'Schedule_Types_FH','FH',NULL,_binary '',_binary '\0','2023-08-08 11:27:46',0,'2023-08-08 11:27:46',0,_binary ''),(1006002,1006,0,'Schedule_Types_FWH','FWH',NULL,_binary '',_binary '\0','2023-08-08 11:28:05',0,'2023-08-08 11:28:05',0,_binary ''),(1006003,1006,0,'Schedule_Types','FHD',NULL,_binary '',_binary '\0','2023-08-08 11:38:39',0,'2023-08-08 11:38:39',0,_binary ''),(1007001,1007,0,'Working_Type_Day','Day',NULL,_binary '',_binary '\0','2023-08-08 11:38:58',0,'2023-08-08 11:38:58',0,_binary ''),(1007002,1007,0,'Working_Type_Week','Week',NULL,_binary '',_binary '\0','2023-08-08 11:39:13',0,'2023-08-08 11:39:13',0,_binary ''),(1007003,1007,0,'Working_Type_Month','Month',NULL,_binary '',_binary '\0','2023-08-08 11:39:29',0,'2023-08-08 11:39:29',0,_binary ''),(1008001,1008,0,'EventType_Work','Work',NULL,_binary '',_binary '\0','2023-08-08 16:30:39',0,'2023-08-08 16:30:39',0,_binary ''),(1008002,1008,0,'EventType_Break','Break',NULL,_binary '',_binary '\0','2023-08-08 16:31:13',0,'2023-08-08 16:31:13',0,_binary ''),(1009001,1009,0,'Location_RehmanPura','RehmanPura',NULL,_binary '',_binary '\0','2023-08-08 16:32:09',0,'2023-08-08 16:32:09',0,_binary ''),(1009002,1009,0,'Location_SiddiqueTradeCenter','Siddique Trade Center',NULL,_binary '',_binary '\0','2023-08-08 16:32:45',0,'2023-08-08 16:32:45',0,_binary '');
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
INSERT INTO `enums` VALUES (1001,0,'Back_Office','Back Office',NULL,_binary '',_binary '\0','2023-05-17 22:44:18',0,'2023-05-17 22:44:18',0,_binary ''),(1002,1001,'Side_Menu','Side Menu',NULL,_binary '',_binary '\0','2023-05-17 22:44:34',0,'2023-05-17 22:44:34',0,_binary ''),(1003,0,'Week_Days','Week Days',NULL,_binary '',_binary '\0','2023-05-19 23:32:54',0,'2023-05-19 23:32:54',0,_binary ''),(1004,0,'cities','cities',NULL,_binary '',_binary '\0','2023-07-31 23:06:31',0,'2023-07-31 23:06:31',0,_binary ''),(1005,0,'Entities','Entities',NULL,_binary '',_binary '\0','2023-08-07 19:44:04',0,'2023-08-07 19:44:04',0,_binary ''),(1006,0,'Schedule_Types','Schedule Types',NULL,_binary '',_binary '\0','2023-08-07 19:58:59',0,'2023-08-07 19:58:59',0,_binary ''),(1007,0,'Working_Type','Working Type',NULL,_binary '',_binary '\0','2023-08-07 20:01:45',0,'2023-08-07 20:01:45',0,_binary ''),(1008,0,'EventType','EventType',NULL,_binary '',_binary '\0','2023-08-08 16:30:08',0,'2023-08-08 16:30:08',0,_binary ''),(1009,0,'Location','Location',NULL,_binary '',_binary '\0','2023-08-08 16:30:20',0,'2023-08-08 16:30:20',0,_binary '\0');
/*!40000 ALTER TABLE `enums` ENABLE KEYS */;
UNLOCK TABLES;

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
  `WorkingHours` varchar(500) NOT NULL,
  `DAYId` int DEFAULT NULL,
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
INSERT INTO `schedule` VALUES (2,'91ada5ea-3265-4468-ad6a-e7c4e11c4e00',NULL,1004001,1005002,1006001,'120 hours',NULL,0,'2023-08-04 12:54:40',NULL,NULL,_binary ''),(3,'2aee83be-48fc-4b21-8376-579fba257f87',NULL,1004001,1005001,1006002,'1222',NULL,0,'2023-08-04 12:57:05',NULL,NULL,_binary ''),(4,'2aee83be-48fc-4b21-8376-579fba257f87',NULL,1004001,1005001,1006002,'2 hour',NULL,0,'2023-08-04 12:58:24',NULL,NULL,_binary ''),(5,'56806abb-eb43-4a7a-b386-799124333061','0fa6617b-be51-4a7d-b8c4-9f90dc841997',1004001,1005001,1006001,'09 hour',NULL,0,'2023-08-04 13:52:40',NULL,NULL,_binary ''),(7,'2aee83be-48fc-4b21-8376-579fba257f87','137467fd-bb73-42da-9854-e39d55fabaeb',1005002,1006002,1007001,'07 hours',NULL,0,'2023-08-08 11:48:57',NULL,NULL,_binary ''),(8,'2aee83be-48fc-4b21-8376-579fba257f87',NULL,1005001,1006001,1007001,'1',NULL,0,'2023-08-08 13:59:20',NULL,NULL,_binary ''),(9,'31eed8a7-69ef-4aa3-903d-b4e1bd17bd48','0fa6617b-be51-4a7d-b8c4-9f90dc841997',1005002,1006002,1007001,'1',NULL,0,'2023-08-08 14:09:48',NULL,NULL,_binary ''),(10,'d7d7f5f4-5dc1-4c32-9229-5f96c5157ad4','137467fd-bb73-42da-9854-e39d55fabaeb',1005001,1006002,1007001,'10 hours',1003001,0,'2023-08-09 10:13:21',NULL,NULL,_binary ''),(11,'d7d7f5f4-5dc1-4c32-9229-5f96c5157ad4','137467fd-bb73-42da-9854-e39d55fabaeb',1005001,1006001,1007001,'10 hours',NULL,0,'2023-08-09 10:13:21',NULL,NULL,_binary ''),(12,'d7d7f5f4-5dc1-4c32-9229-5f96c5157ad4','137467fd-bb73-42da-9854-e39d55fabaeb',1005001,1006001,1007001,'10 hours',NULL,0,'2023-08-09 10:13:21',NULL,NULL,_binary ''),(13,'d7d7f5f4-5dc1-4c32-9229-5f96c5157ad4','137467fd-bb73-42da-9854-e39d55fabaeb',1005001,1006002,1007001,'10 hours',1003001,0,'2023-08-09 10:13:21',NULL,NULL,_binary ''),(14,'56806abb-eb43-4a7a-b386-799124333061',NULL,1005001,1006001,1007001,'17 hours',1003003,0,'2023-08-09 15:46:53',NULL,NULL,_binary '');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduledaysevents`
--

DROP TABLE IF EXISTS `scheduledaysevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduledaysevents` (
  `Id` int NOT NULL,
  `StartTime` varchar(45) DEFAULT NULL,
  `EndTime` varchar(45) DEFAULT NULL,
  `LocationId` int DEFAULT NULL,
  `EventTypeId` int DEFAULT NULL,
  `ScheduleTypeId` int DEFAULT NULL,
  `DayId` int DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledaysevents`
--

LOCK TABLES `scheduledaysevents` WRITE;
/*!40000 ALTER TABLE `scheduledaysevents` DISABLE KEYS */;
INSERT INTO `scheduledaysevents` VALUES (1,'08:00','13:00',1009001,1008001,0,1003001,0,'2023-08-10 12:18:45',0,'2023-08-10 12:18:45',_binary ''),(2,'13:00','14:00',1,1008001,0,1003003,0,'2023-08-10 14:56:23',0,'2023-08-10 14:56:23',_binary ''),(3,'13:00','14:00',1,1008001,0,1003003,0,'2023-08-10 14:56:32',0,'2023-08-10 14:56:32',_binary '');
/*!40000 ALTER TABLE `scheduledaysevents` ENABLE KEYS */;
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
 1 AS `ScheduleTypeId`,
 1 AS `ScheduleType`,
 1 AS `WorkingTypeId`,
 1 AS `WorkingType`,
 1 AS `WorkingHours`,
 1 AS `DAYId`,
 1 AS `DAY`,
 1 AS `CreatedOn`,
 1 AS `CreatedBy`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedBy`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_scheduledayevents`
--

DROP TABLE IF EXISTS `vw_scheduledayevents`;
/*!50001 DROP VIEW IF EXISTS `vw_scheduledayevents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_scheduledayevents` AS SELECT 
 1 AS `Id`,
 1 AS `StartTime`,
 1 AS `EndTime`,
 1 AS `LocationId`,
 1 AS `Location`,
 1 AS `EventTypeId`,
 1 AS `EventType`,
 1 AS `ScheduleTypeId`,
 1 AS `ScheduleType`,
 1 AS `DayId`,
 1 AS `Day`,
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
        vcb.Meaning, 
        vcb.Reference,
         vcb.Sentance,
         vcb.Pronunciation,
         vcb.Translation,
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
in DayId int,
in ScheduleTypeId int,
in createdOn datetime,
in createdById int,
in modifiedOn datetime,
in modifiedById int,
in isActive bool,
in DbOperation varchar(200))
BEGIN

if DbOperation='Insert'
then 
 insert into scheduleDaysEvents (Id, StartTime, EndTime,LocationId,EventTypeId,ScheduleTypeId,DayId, CreatedOn,CreatedById,ModifiedOn,ModifiedById,IsActive ) 
 values(Id, StartTime, EndTime,LocationId,EventTypeId,ScheduleTypeId,DayId, createdOn,createdById,modifiedOn,modifiedById,isActive );
end If;

if DbOperation='Update'
then 
update scheduleDaysEvents set 
 StartTime=startTime,
 EndTime=endTime,
LocationId=LocationId,
EventTypeId=EventTypeId,
ScheduleTypeId=ScheduleTypeId,

DayId=DayId,
 CreatedOn=createdOn,
 CreatedById=createdById,
 ModifiedOn=modifiedOn,
 ModifiedById=modifiedById,
 IsActive=isActive
 where scheduleDaysEvents.Id= id;
end If;

if DbOperation='Delete'
then
DELETE FROM scheduleDaysEvents where scheduleDaysEvents.Id=id;
end if;

if DbOperation='Activate'
then 
update scheduleDaysEvents set IsActive=1 where scheduleDaysEvents.Id=id;
end iF;

if DbOperation='DeActivate'
then 
update scheduleDaysEvents set IsActive=0 where scheduleDaysEvents.Id=id;
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
    In prm_DAYId int,
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

			insert into Schedule (Id, UserId, RoleId, EntityId,ScheduleTypeId ,WorkingTypeId ,WorkingHours, DAYId, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId, prm_RoleId,prm_EntityId, prm_ScheduleTypeId , prm_WorkingTypeId ,prm_WorkingHours ,prm_DAYId, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

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
            DAYId = prm_DAYId ,
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
/*!50001 VIEW `vw_schedule` AS select `schedule`.`Id` AS `Id`,`schedule`.`UserId` AS `UserId`,`aspnetusers`.`UserName` AS `User`,`schedule`.`RoleId` AS `RoleId`,`aspnetroles`.`Name` AS `Role`,`schedule`.`EntityId` AS `EntityId`,`entity`.`Name` AS `Entity`,`schedule`.`ScheduleTypeId` AS `ScheduleTypeId`,`scheduletype`.`Name` AS `ScheduleType`,`schedule`.`WorkingTypeId` AS `WorkingTypeId`,`workingtype`.`Name` AS `WorkingType`,`schedule`.`WorkingHours` AS `WorkingHours`,`schedule`.`DAYId` AS `DAYId`,`day`.`Name` AS `DAY`,`schedule`.`CreatedOn` AS `CreatedOn`,`schedule`.`CreatedBy` AS `CreatedBy`,`schedule`.`ModifiedOn` AS `ModifiedOn`,`schedule`.`ModifiedBy` AS `ModifiedBy`,`schedule`.`IsActive` AS `IsActive` from ((((((`schedule` left join `aspnetusers` on((`aspnetusers`.`Id` = `schedule`.`UserId`))) left join `aspnetroles` on((`aspnetroles`.`Id` = `schedule`.`RoleId`))) left join `enumline` `entity` on((`entity`.`Id` = `schedule`.`EntityId`))) left join `enumline` `scheduletype` on((`scheduletype`.`Id` = `schedule`.`ScheduleTypeId`))) left join `enumline` `workingtype` on((`workingtype`.`Id` = `schedule`.`WorkingTypeId`))) left join `enumline` `day` on((`day`.`Id` = `schedule`.`DAYId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_scheduledayevents`
--

/*!50001 DROP VIEW IF EXISTS `vw_scheduledayevents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_scheduledayevents` AS select `schday`.`Id` AS `Id`,`schday`.`StartTime` AS `StartTime`,`schday`.`EndTime` AS `EndTime`,`schday`.`LocationId` AS `LocationId`,`location`.`Name` AS `Location`,`schday`.`EventTypeId` AS `EventTypeId`,`eventtype`.`Name` AS `EventType`,`schday`.`ScheduleTypeId` AS `ScheduleTypeId`,`schedule`.`Name` AS `ScheduleType`,`schday`.`DayId` AS `DayId`,`day`.`Name` AS `Day`,`schday`.`CreatedOn` AS `CreatedOn`,`schday`.`CreatedById` AS `CreatedById`,`schday`.`ModifiedOn` AS `ModifiedOn`,`schday`.`ModifiedById` AS `ModifiedById`,`schday`.`IsActive` AS `IsActive` from ((((`scheduledaysevents` `schday` left join `enumline` `day` on((`day`.`Id` = `schday`.`DayId`))) left join `enumline` `schedule` on((`schedule`.`Id` = `schday`.`ScheduleTypeId`))) left join `enumline` `eventtype` on((`eventtype`.`Id` = `schday`.`EventTypeId`))) left join `enumline` `location` on((`location`.`Id` = `schday`.`LocationId`))) */;
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

-- Dump completed on 2023-08-10 15:35:21
