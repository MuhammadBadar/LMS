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
  `Value` varchar(45) DEFAULT NULL,
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
INSERT INTO `enumline` VALUES (1003001,1003,0,'Week_Days_Monday','Monday','',NULL,_binary '',_binary '\0','2023-05-19 23:33:08',0,'2023-05-19 23:33:08',0,_binary ''),(1003002,1003,0,'Week_Days_Tuesday','Tuesday','',NULL,_binary '',_binary '\0','2023-05-19 23:33:27',0,'2023-05-19 23:33:27',0,_binary ''),(1003003,1003,0,'Week_Days_Wednesday','Wednesday','',NULL,_binary '',_binary '\0','2023-05-19 23:33:39',0,'2023-05-19 23:33:39',0,_binary ''),(1003004,1003,0,'Week_Days_Thursday','Thursday','',NULL,_binary '',_binary '\0','2023-05-19 23:34:03',0,'2023-05-19 23:34:03',0,_binary ''),(1003005,1003,0,'Week_Days_Friday','Friday','',NULL,_binary '',_binary '\0','2023-05-19 23:34:11',0,'2023-05-19 23:34:11',0,_binary ''),(1003006,1003,0,'Week_Days_Saturday','Saturday','',NULL,_binary '',_binary '\0','2023-05-19 23:34:22',0,'2023-05-19 23:34:22',0,_binary ''),(1003007,1003,0,'Week_Days_Sunday','Sunday','',NULL,_binary '',_binary '\0','2023-05-19 23:34:29',0,'2023-05-19 23:34:29',0,_binary ''),(1001001,1001,0,'/security','Security','',NULL,_binary '',_binary '\0','2023-07-25 23:55:41',0,'2023-07-25 23:55:41',0,_binary ''),(1002001,1002,1001001,'/security/users','Manage User','',NULL,_binary '',_binary '\0','2023-07-25 23:57:16',0,'2023-07-25 23:57:16',0,_binary ''),(1002002,1002,1001001,'/security/roles','Manage Role','',NULL,_binary '',_binary '\0','2023-07-25 23:58:39',0,'2023-07-25 23:58:39',0,_binary '\0'),(1002003,1002,1001001,'/security/userrole','User Roles','',NULL,_binary '',_binary '\0','2023-07-25 23:59:55',0,'2023-07-25 23:59:55',0,_binary '\0'),(1001002,1001,0,'/lms/TRN','TRN','',NULL,_binary '',_binary '\0','2023-07-26 00:10:23',0,'2023-07-26 00:10:23',0,_binary ''),(1002004,1002,1001002,'/lms/Student','ManageStudent','',NULL,_binary '',_binary '\0','2023-07-26 00:10:53',0,'2023-07-26 00:10:53',0,_binary '\0'),(1002005,1002,1001002,'/lms/course','Manage Course','',NULL,_binary '',_binary '\0','2023-07-26 04:08:33',0,'2023-07-26 04:08:33',0,_binary ''),(1002006,1002,1001002,'/lms/topic','Manage Topic','',NULL,_binary '',_binary '\0','2023-07-26 04:12:08',0,'2023-07-26 04:12:08',0,_binary '\0'),(1002007,1002,1001002,'/lms/lecture','Manage Lecture','',NULL,_binary '',_binary '\0','2023-07-26 04:13:18',0,'2023-07-26 04:13:18',0,_binary '\0'),(1002008,1002,1001002,'/lms/City','Manage City','',NULL,_binary '',_binary '\0','2023-07-26 04:13:42',0,'2023-07-26 04:13:42',0,_binary '\0'),(1002009,1002,1001002,'/lms/assignTask','Manage AssignTask','',NULL,_binary '',_binary '\0','2023-07-26 04:14:35',0,'2023-07-26 04:14:35',0,_binary ''),(1001003,1001,0,'Back_OfficeIMS','Inquiry','',NULL,_binary '',_binary '\0','2023-07-26 04:16:00',0,'2023-07-26 04:16:00',0,_binary ''),(1002011,1002,1001003,'/lms/inquiry','Manage Inquiry','',NULL,_binary '',_binary '\0','2023-07-26 04:16:32',0,'2023-07-26 04:16:32',0,_binary '\0'),(1001004,1001,0,'/sch/Schedule','Schedule','',NULL,_binary '\0',_binary '\0','2023-07-26 04:16:56',0,'2023-07-26 04:16:56',0,_binary ''),(1002012,1002,1001004,'/sch/schedule','Manage CourseSchedule','',NULL,_binary '',_binary '\0','2023-07-26 05:18:02',0,'2023-07-26 05:18:02',0,_binary ''),(1002013,1002,1001004,'/sch/schList','ScheduleList','',NULL,_binary '',_binary '\0','2023-07-26 05:19:26',0,'2023-07-26 05:19:26',0,_binary ''),(1002014,1002,1001004,'/sch/Schedule','Manage Schedule','',NULL,_binary '',_binary '\0','2023-07-26 05:21:39',0,'2023-07-26 05:21:39',0,_binary ''),(1004001,1004,0,'','Lahore','',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:03',0,'2023-08-04 00:51:03',0,_binary ''),(1004002,1004,0,'','IslamAbad','',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:17',0,'2023-08-04 00:51:17',0,_binary ''),(1004003,1004,0,'','Gujjraat','',NULL,_binary '\0',_binary '\0','2023-08-04 00:51:26',0,'2023-08-04 00:51:26',0,_binary ''),(1005001,1005,0,'EntitiesUser','User','',NULL,_binary '',_binary '\0','2023-08-08 11:25:33',0,'2023-08-08 11:25:33',0,_binary ''),(1005002,1005,0,'EntitiesRole','Role','',NULL,_binary '',_binary '\0','2023-08-08 11:26:14',0,'2023-08-08 11:26:14',0,_binary ''),(1006001,1006,0,'Schedule_Types_FH','FH','',NULL,_binary '',_binary '\0','2023-08-08 11:27:46',0,'2023-08-08 11:27:46',0,_binary ''),(1006002,1006,0,'Schedule_Types_FWH','FWH','',NULL,_binary '',_binary '\0','2023-08-08 11:28:05',0,'2023-08-08 11:28:05',0,_binary ''),(1006003,1006,0,'Schedule_Types','FHD','',NULL,_binary '',_binary '\0','2023-08-08 11:38:39',0,'2023-08-08 11:38:39',0,_binary ''),(1007001,1007,0,'Working_Type_Day','Day','',NULL,_binary '',_binary '\0','2023-08-08 11:38:58',0,'2023-08-08 11:38:58',0,_binary ''),(1007002,1007,0,'Working_Type_Week','Week','',NULL,_binary '',_binary '\0','2023-08-08 11:39:13',0,'2023-08-08 11:39:13',0,_binary ''),(1007003,1007,0,'Working_Type_Month','Month','',NULL,_binary '',_binary '\0','2023-08-08 11:39:29',0,'2023-08-08 11:39:29',0,_binary ''),(1008001,1008,0,'EventType_Work','Work','',NULL,_binary '',_binary '\0','2023-08-08 16:30:39',0,'2023-08-08 16:30:39',0,_binary ''),(1008002,1008,0,'EventType_Break','Break','',NULL,_binary '',_binary '\0','2023-08-08 16:31:13',0,'2023-08-08 16:31:13',0,_binary ''),(1009001,1009,0,'Location_RehmanPura','RehmanPura','',NULL,_binary '',_binary '\0','2023-08-08 16:32:09',0,'2023-08-08 16:32:09',0,_binary ''),(1009002,1009,0,'Location_SiddiqueTradeCenter','Siddique Trade Center','',NULL,_binary '',_binary '\0','2023-08-08 16:32:45',0,'2023-08-08 16:32:45',0,_binary ''),(1002015,1002,1001002,'/lms/CityStudent','Manage CityStudent','',NULL,_binary '',_binary '\0','2023-08-11 14:09:28',0,'2023-08-11 14:09:28',0,_binary ''),(1010001,1010,0,'Status_Open','Open','',NULL,_binary '',_binary '\0','2023-08-16 13:33:50',0,'2023-08-16 13:33:50',0,_binary ''),(1010002,1010,0,'Status_InProgress','InProgress','',NULL,_binary '',_binary '\0','2023-08-16 13:34:48',0,'2023-08-16 13:34:48',0,_binary ''),(1010003,1010,0,'Status_InTesting','InTesting','',NULL,_binary '',_binary '\0','2023-08-16 13:35:10',0,'2023-08-16 13:35:10',0,_binary ''),(1010004,1010,0,'Status_ReOpen','ReOpen','',NULL,_binary '',_binary '\0','2023-08-16 13:35:39',0,'2023-08-16 13:35:39',0,_binary ''),(1010005,1010,0,'Status_Resolve','Resolve','',NULL,_binary '',_binary '\0','2023-08-16 13:35:58',0,'2023-08-16 13:35:58',0,_binary ''),(1010006,1010,0,'Status_Closed','Closed','',NULL,_binary '',_binary '\0','2023-08-16 13:36:13',0,'2023-08-16 13:36:13',0,_binary ''),(1011001,1011,0,'PriorityEmergency','P0','Emergency',NULL,_binary '',_binary '\0','2023-08-16 13:37:51',0,'2023-08-16 13:37:51',0,_binary ''),(1011002,1011,0,'Priority_Highest','P1','Highest',NULL,_binary '',_binary '\0','2023-08-16 13:38:15',0,'2023-08-16 13:38:15',0,_binary ''),(1011003,1011,0,'Priority_High','P2','High',NULL,_binary '',_binary '\0','2023-08-16 13:38:34',0,'2023-08-16 13:38:34',0,_binary ''),(1011004,1011,0,'Priority_Medium','P3','Medium',NULL,_binary '',_binary '\0','2023-08-16 13:38:56',0,'2023-08-16 13:38:56',0,_binary ''),(1011005,1011,0,'Priority_Low','P4','Low',NULL,_binary '',_binary '\0','2023-08-16 13:39:17',0,'2023-08-16 13:39:17',0,_binary ''),(1012001,1012,0,'Modules_TMS','TMS','',NULL,_binary '',_binary '\0','2023-08-16 13:40:51',0,'2023-08-16 13:40:51',0,_binary ''),(1012002,1012,0,'Modules_SCH','SCH','',NULL,_binary '',_binary '\0','2023-08-16 13:41:06',0,'2023-08-16 13:41:06',0,_binary ''),(1012003,1012,0,'Modules_NOT','NOT','',NULL,_binary '\0',_binary '\0','2023-08-16 13:41:23',0,'2023-08-16 13:41:23',0,_binary ''),(1012004,1012,0,'Modules_ATT','ATT','',NULL,_binary '',_binary '\0','2023-08-16 13:41:38',0,'2023-08-16 13:41:38',0,_binary ''),(1012005,1012,0,'Modules_SCE','SCE','',NULL,_binary '',_binary '\0','2023-08-16 13:41:53',0,'2023-08-16 13:41:53',0,_binary ''),(1012006,1012,0,'Modules_IMS','IMS','',NULL,_binary '',_binary '\0','2023-08-16 13:42:10',0,'2023-08-16 13:42:10',0,_binary ''),(1012007,1012,0,'Modules_TST','TST','',NULL,_binary '',_binary '\0','2023-08-16 13:43:05',0,'2023-08-16 13:43:05',0,_binary ''),(1012008,1012,0,'Modules_TRN','TRN','',NULL,_binary '',_binary '\0','2023-08-16 13:43:48',0,'2023-08-16 13:43:48',0,_binary ''),(1012009,1012,0,'Modules_PRL','PRL','',NULL,_binary '',_binary '\0','2023-08-16 13:44:12',0,'2023-08-16 13:44:12',0,_binary ''),(1001005,1001,0,'/ATT','Attendance','',NULL,_binary '',_binary '\0','2023-08-18 17:34:55',0,'2023-08-18 17:34:55',0,_binary ''),(1002016,1002,1001005,'att/Attendance','Attendance','',NULL,_binary '',_binary '\0','2023-08-18 17:35:54',0,'2023-08-18 17:35:54',0,_binary ''),(1002017,1002,1001005,'lms/Userattbydate','Userattbydate','',NULL,_binary '',_binary '\0','2023-08-18 17:42:03',0,'2023-08-18 17:42:03',0,_binary ''),(1001006,1001,0,'tms/Task','Task','',NULL,_binary '',_binary '\0','2023-08-18 18:00:49',0,'2023-08-18 18:00:49',0,_binary ''),(1002020,1002,1001005,'/lms/Userreport','Userreport',NULL,NULL,_binary '',_binary '\0','2023-08-28 13:55:09',0,'2023-08-28 13:55:09',0,_binary ''),(1012010,1012,0,'Modules_Patient','PAT',NULL,NULL,_binary '',_binary '\0','2023-08-29 13:31:32',0,'2023-08-29 13:31:32',0,_binary ''),(1012011,1012,0,'Modules_SITE','SITE',NULL,NULL,_binary '',_binary '\0','2023-08-29 13:32:06',0,'2023-08-29 13:32:06',0,_binary '\0'),(1002021,1002,1001005,'/lms/LateAttReason','LateAttReason',NULL,NULL,_binary '',_binary '\0','2023-09-09 13:24:00',0,'2023-09-09 13:24:00',0,_binary ''),(1002023,1002,1001006,'/tms/managetask','Manage Task ',NULL,NULL,_binary '',_binary '\0','2023-09-28 14:02:27',0,'2023-09-28 14:02:27',0,_binary ''),(1002024,1002,1001006,'/tms/taskslist','Tasks List',NULL,NULL,_binary '',_binary '\0','2023-10-06 12:23:54',0,'2023-10-06 12:23:54',0,_binary ''),(1002025,1002,1001007,'/tms/managenotification',' Template List',NULL,NULL,_binary '',_binary '\0','2023-10-07 12:40:06',0,'2023-10-07 12:40:06',0,_binary ''),(1002026,1002,1001007,'/tms/notificationtemplate','Manage Template',NULL,NULL,_binary '',_binary '\0','2023-10-07 12:47:41',0,'2023-10-07 12:47:41',0,_binary ''),(1001007,1001,0,'/notification','Notifications',NULL,NULL,_binary '',_binary '\0','2023-10-23 11:37:03',0,'2023-10-23 11:37:03',0,_binary ''),(1002027,1001,0,'/lms/usertask','Day Start',NULL,NULL,_binary '',_binary '\0','2023-10-27 00:19:37',0,'2023-10-27 00:19:37',0,_binary ''),(1002028,1001,0,'/lms/daystatus','Day End',NULL,NULL,_binary '',_binary '\0','2023-10-31 14:01:07',0,'2023-10-31 14:01:07',0,_binary ''),(1013001,1013,0,'Claim100','100',NULL,NULL,_binary '',_binary '\0','2023-11-01 17:41:01',0,'2023-11-01 17:41:01',0,_binary ''),(1013002,1013,0,'Claim90','90',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:04:10',0,'2023-11-02 12:04:10',0,_binary ''),(1013003,1013,0,'Claim80','80',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:04:25',0,'2023-11-02 12:04:25',0,_binary ''),(1013004,1013,0,'Claim70','70',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:04:35',0,'2023-11-02 12:04:35',0,_binary ''),(1013005,1013,0,'Claim60','60',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:04:45',0,'2023-11-02 12:04:45',0,_binary ''),(1013006,1013,0,'Claim50','50',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:04:51',0,'2023-11-02 12:04:51',0,_binary ''),(1013007,1013,0,'Claim40','40',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:05:25',0,'2023-11-02 12:05:25',0,_binary ''),(1013008,1013,0,'Claim30','30',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:05:34',0,'2023-11-02 12:05:34',0,_binary ''),(1013009,1013,0,'Claim20','20',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:05:48',0,'2023-11-02 12:05:48',0,_binary ''),(1013010,1013,0,'Claim10','10',NULL,NULL,_binary '',_binary '\0','2023-11-02 12:05:58',0,'2023-11-02 12:05:58',0,_binary '');
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
  `Value` varchar(255) DEFAULT 'Null',
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
INSERT INTO `enums` VALUES (1001,0,'Back_Office','Back Office','Null',NULL,_binary '',_binary '\0','2023-05-17 22:44:18',0,'2023-05-17 22:44:18',0,_binary ''),(1002,1001,'Side_Menu','Side Menu','Null',NULL,_binary '',_binary '\0','2023-05-17 22:44:34',0,'2023-05-17 22:44:34',0,_binary ''),(1003,0,'Week_Days','Week Days','Null',NULL,_binary '',_binary '\0','2023-05-19 23:32:54',0,'2023-05-19 23:32:54',0,_binary ''),(1004,0,'cities','cities','Null',NULL,_binary '',_binary '\0','2023-07-31 23:06:31',0,'2023-07-31 23:06:31',0,_binary ''),(1005,0,'Entities','Entities','Null',NULL,_binary '',_binary '\0','2023-08-07 19:44:04',0,'2023-08-07 19:44:04',0,_binary ''),(1006,0,'Schedule_Types','Schedule Types','Null',NULL,_binary '',_binary '\0','2023-08-07 19:58:59',0,'2023-08-07 19:58:59',0,_binary ''),(1007,0,'Working_Type','Working Type','Null',NULL,_binary '',_binary '\0','2023-08-07 20:01:45',0,'2023-08-07 20:01:45',0,_binary ''),(1008,0,'EventType','EventType','Null',NULL,_binary '',_binary '\0','2023-08-08 16:30:08',0,'2023-08-08 16:30:08',0,_binary ''),(1009,0,'Location','Location','Null',NULL,_binary '',_binary '\0','2023-08-08 16:30:20',0,'2023-08-08 16:30:20',0,_binary '\0'),(1010,0,'Status','Status','Null',NULL,_binary '',_binary '\0','2023-08-16 13:31:44',0,'2023-08-16 13:31:44',0,_binary ''),(1011,0,'Priority','Priority','Null',NULL,_binary '',_binary '\0','2023-08-16 13:32:03',0,'2023-08-16 13:32:03',0,_binary ''),(1012,0,'Modules','Modules','Null',NULL,_binary '',_binary '\0','2023-08-16 13:32:18',0,'2023-08-16 13:32:18',0,_binary ''),(1013,1001,'Claim','Claim','Null',NULL,_binary '',_binary '\0','2023-11-01 15:18:52',0,'2023-11-01 15:18:52',0,_binary '');
/*!40000 ALTER TABLE `enums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `Id` int NOT NULL,
  `UserId` varchar(40) DEFAULT NULL,
  `ModuleId` int DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `PriorityId` int DEFAULT NULL,
  `Title` varchar(300) NOT NULL,
  `SP` int DEFAULT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1001,'1012003',1011003,1013001,NULL,'Title ABC',1,'Desc..','2021-12-09 00:00:00',1,'2021-12-09 00:00:00',1,0),(1002,'1012003',1011003,1013001,NULL,'Title B',1,'Desc..','2021-12-09 00:00:00',1,'2021-12-09 00:00:00',1,0),(1003,'1012003',1011002,1013001,NULL,'ABC',2,'DesABC','2021-12-09 04:57:36',0,'2021-12-09 04:57:36',0,0),(1004,'1012004',1011001,1013002,NULL,'AB',3,'XYZ','2021-12-09 04:58:33',0,'2021-12-09 04:58:33',0,0),(1005,'1012004',1011004,1013004,NULL,'A',4,'Des..XYZ','2021-12-09 04:58:33',0,'2021-12-09 04:58:33',0,0),(1006,'692d0e7d-335f-453b-a5ff-3073cb9343bb',1011003,1013001,0,'Sale Order Input Row Design',2,'First Row would be used as an Input Row. Desing of First Row should be as followings\n  1.1 Design ItemCode as TextBox in the first column\n  1.2 Desing Item Name as DropDownList in the 2nd column\n  1.3 Design UOM (Unit of Measure) as the text box. This text box should be Disabled so that UOM from API should be displayed here in 3rd column \n  1.4 Design Rate as a text box which can take just an integer value which should contain Rate from API (after searching an Item). User can change value received from API as per requirement\n  1.5 Desing Qty (Quantity) as an Integer Input TextBox field. Default value should be 1. Negative or zero values should shouldn\'t be allowed\n  1.6 Design Total field as a an integer input textbox which should be having its values base upon Qty multiplied by Rate\n  1.7 Design a button having text as \"+\", which when pressed should take values of above mentioned control and should place these values in the grid as a new row. After adding values as a new row, all input controls mentioned above should be emptied so that user can input another item\n\n','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,1),(1007,'0a714c07-6881-4740-8bcb-5a6bfd833eda',1011003,1013001,0,'Sale Order : Add a New Row in the Grid',3,'1. Type Item Code in \"Item Code\" text box and press Enter button. (e.g. 1101)\n1.1 When user presses enter button, a call to API with Item code should be sent to fetch item based upon this code \n1.2 Pre-Requisites:  Define an API (plus corresponding service method) to search item by code having the following Signatures  \n\nService Method Signatures:   \nItemVM GetItemByCode(string itemCode); // Define Service Method and against this method define the follwing API Action Method\n\nAPI Signarures\n[HttpGet]  \nActionResult GetItemByCode(string itemCode)\n\n1.3  Same class ItemVM should be defined in Angular Application to received data returned from API\n1.4 Data returend against searched Item should be filled in the following controls of Input Row\n 1.4.1 ItemName\n 1.4.2 UOM\n 1.4.3 Rate\n 1.4.4 Total (computed value)\n1.4 Cursor should be moved to Qty field so that user can change qty (Default is always 1) by Up/Down arrow keys\n1.5 Now pressing enter inside Qty field should move data of input row into the grid as a new row \n','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,0),(1008,'44fb345f-be12-4d99-8a0d-f1c5063f4999',1011003,1013001,0,'Sale Order - Edit & Delete Rows',4,'Delete Action/Mode:\n 1. Define an icon for delete in the Actions column of grid, which when pressed should prompt a message to user \"Are you sure you want to delete? Yes/No\" \n1.1 When user pressed Yes button, remove item from grid (by removing item from list)\n\nEdit Action/Mode:\n1. Define an icon for edit in the Actions column of grid, which when pressed should reflect grid row values in the Grid Input Line. \n1.2 Now Item Code and Item Name should be disabled (as moslty Qty and Price are modfied)\n1.3 Cursor should be moved to Qty field for its change (as mostly Qty chages)\n1.4 User can change Qty and price as well. Pressing enter on Price as well should add row in the gid. \n1.5. Pressing enter on Qty OR price in Edit mode should modify the same row which is currently in the edit mode.\n1.6. Now the input row should again be blank and cursor should move to ItemCode ','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,1),(1009,'4b556b8c-b456-47c2-a828-b96298406606',0,1010002,1011004,'Sale Order  - Item Searching by Item Name',4,'1. When cursor moves to ItemName and user types some characters (2 characters minimum) then application should call an API method having the following signatures\n \nList<ItemVM> GetItemsByName(string itemName); \n NOTE: This method should use SearchItem method internally to search item by name. So this method is a wrapper method around Search Method\n\n2. Use Angular Material\'s Autocomplete control (https://material.angular.io/components/autocomplete/overvie) to implement this functionality\n2.1 User can erase his/her input search and can type some words again to search again\n3. Now pressing any item (by name) should select corresponding ItemCode to seach Item from API in the same way as metnioned in some previous task\nNOTE: Each Search should fill item names along with ItemCodes in the AutoCompleted text box. so pressing any item, can search its corresponding item code which can be used again to select one and only one item\n','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,1),(1010,'0a714c07-6881-4740-8bcb-5a6bfd833eda',0,1010003,1011003,'twest',1,NULL,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,0),(1011,'0a714c07-6881-4740-8bcb-5a6bfd833eda',0,1010003,1011003,'twest',1,NULL,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,0),(1012,'44fb345f-be12-4d99-8a0d-f1c5063f4999',0,1010001,1011001,'Create a db and backend of manage usertask and get data from task.',4,NULL,'2023-10-27 09:58:20',0,'2023-10-27 09:58:20',0,0),(1013,'1c75d06f-45f4-4877-b2cd-d88b21091f96',0,1010002,1011001,'Find the username',1,NULL,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,0),(1014,'0a714c07-6881-4740-8bcb-5a6bfd833eda',0,1010001,1011002,'select row',0,NULL,'2023-11-01 11:37:49',0,'2023-11-01 11:37:49',0,0),(1015,'0a714c07-6881-4740-8bcb-5a6bfd833eda',0,1010001,1011002,'Create a table named usertask',1,NULL,'2023-11-01 11:39:25',0,'2023-11-01 11:39:25',0,1),(1016,'0a714c07-6881-4740-8bcb-5a6bfd833eda',0,1010001,1011003,'Day Start - Screen should have tasks for the Logged In User Only',1,NULL,'2023-11-01 11:43:48',0,'2023-11-01 11:43:48',0,1),(1017,'0a714c07-6881-4740-8bcb-5a6bfd833eda',0,1010001,1011005,'Define Day End Screen and Fill data according to the Day Start',1,NULL,'2023-11-01 11:45:20',0,'2023-11-01 11:45:20',0,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertask`
--

DROP TABLE IF EXISTS `usertask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertask` (
  `Id` int NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `TaskId` int DEFAULT NULL,
  `Parent` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `ClaimId` int DEFAULT NULL,
  `Sp` float DEFAULT NULL,
  `Comments` longtext,
  `ReviewedBy` varchar(255) DEFAULT NULL,
  `ReviewComments` varchar(255) DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertask`
--

LOCK TABLES `usertask` WRITE;
/*!40000 ALTER TABLE `usertask` DISABLE KEYS */;
INSERT INTO `usertask` VALUES (1,'0a714c07-6881-4740-8bcb-5a6bfd833eda',1017,NULL,'2023-11-03 09:34:18',1013001,1,'Day End Page is complete',NULL,NULL,0,'2023-11-03 16:13:41',0,'2023-11-03 16:13:41',_binary ''),(2,'0a714c07-6881-4740-8bcb-5a6bfd833eda',1015,NULL,'2023-11-03 11:14:33',1013001,1,'Done',NULL,NULL,0,'2023-11-03 16:14:36',0,'2023-11-03 16:14:36',_binary '');
/*!40000 ALTER TABLE `usertask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_task`
--

DROP TABLE IF EXISTS `vw_task`;
/*!50001 DROP VIEW IF EXISTS `vw_task`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_task` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `User`,
 1 AS `PriorityId`,
 1 AS `Priority`,
 1 AS `StatusId`,
 1 AS `Status`,
 1 AS `ModuleId`,
 1 AS `Module`,
 1 AS `Title`,
 1 AS `SP`,
 1 AS `Description`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usertask`
--

DROP TABLE IF EXISTS `vw_usertask`;
/*!50001 DROP VIEW IF EXISTS `vw_usertask`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usertask` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `User`,
 1 AS `TaskId`,
 1 AS `Title`,
 1 AS `Date`,
 1 AS `Parent`,
 1 AS `ClaimId`,
 1 AS `Claim`,
 1 AS `Sp`,
 1 AS `Comments`,
 1 AS `ReviewedBy`,
 1 AS `ReviewComments`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'lms'
--

--
-- Dumping routines for database 'lms'
--
/*!50003 DROP PROCEDURE IF EXISTS `AlterAction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterAction`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from action
			where
			action.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update action set IsActive=1
			where 
			action.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update action set IsActive=0
			where
			action.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterAttachments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterAttachments`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from attachments
			where
			attachments.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update attachments set IsActive=1
			where 
			attachments.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update attachments set IsActive=0
			where
			attachments.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterAttendance`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from attendance
			where
			attendance.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update attendance set IsActive=1
			where 
			attendance.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update attendance set IsActive=0
			where
			attendance.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterCompany`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from company
			where
			company.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update company set IsActive=1
			where 
			company.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update company set IsActive=0
			where
			company.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterController` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterController`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from controller
			where
			controller.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update controller set IsActive=1
			where 
			controller.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update controller set IsActive=0
			where
			controller.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterCustomer`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from customer
			where
			customer.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update customer set IsActive=1
			where 
			customer.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update customer set IsActive=0
			where
			customer.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterExpense` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterExpense`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from expense
			where
			expense.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update expense set IsActive=1
			where 
			expense.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update expense set IsActive=0
			where
			expense.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterExpenseType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterExpenseType`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from expensetype
			where
			expensetype.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update expensetype set IsActive=1
			where 
			expensetype.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update expensetype set IsActive=0
			where
			expensetype.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterFeature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterFeature`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from feature
			where
			feature.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update feature set IsActive=1
			where 
			feature.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update feature set IsActive=0
			where
			feature.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterField`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from field
			where
			field.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update field set IsActive=1
			where 
			field.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update field set IsActive=0
			where
			field.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterFieldPossibleValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterFieldPossibleValues`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from field_possible_values
			where
			field_possible_values.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update field_possible_values set IsActive=1
			where 
			field_possible_values.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update field_possible_values set IsActive=0
			where
			field_possible_values.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterInquiry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterInquiry`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from inquiry
			where
			inquiry.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update inquiry set IsActive=1
			where 
			inquiry.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update inquiry set IsActive=0
			where
			inquiry.Id=id; 
            update inquiry_field_data set IsActive=0
            where 
            inquiry_field_data.InquiryId=id;
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterInquiryFieldData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterInquiryFieldData`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from inquiry_field_data
			where
			inquiry_field_data.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update inquiry_field_data set IsActive=1
			where 
			inquiry_field_data.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update field set IsActive=0
			where
			inquiry_field_data.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterInvoice`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from invoice
			where
			invoice.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update invoice set IsActive=1
			where 
			invoice.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update invoice set IsActive=0
			where
			invoice.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterInvoiceLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterInvoiceLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from invoice_line
			where
			invoice_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update invoice_line set IsActive=1
			where 
			invoice_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update invoice_line set IsActive=0
			where
			invoice_line.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterItem`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from item
			where
			item.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update item set IsActive=1
			where 
			item.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update item set IsActive=0
			where
			item.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterLecture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterLecture`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from lecture
			where
			lecture.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update lecture set IsActive=1
			where 
			lecture.Id=id ;
             update studentlecture set IsActive=1
			where
			studentlecture.LectureId=id; 
        END if;
IF DBoperation = 'DeActivate'
        then
            update lecture set IsActive=0
			where
			lecture.Id=id; 
             update studentlecture set IsActive=0
			where
			studentlecture.LectureId=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterLogEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterLogEvent`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from logevent
			where
			logevent.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update logevent set IsActive=1
			where 
			logevent.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update logevent set IsActive=0
			where
			logevent.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterNotificationLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterNotificationLog`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from notification_log
			where
			notification_log.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update notification_log set IsActive=1
			where 
			notification_log.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update notification_log set IsActive=0
			where
			notification_log.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterNotificationTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterNotificationTemplate`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from notificationtemplate
			where
			notificationtemplate.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update notificationtemplate set IsActive=1
			where 
			notificationtemplate.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update notificationtemplate set IsActive=0
			where
			notificationtemplate.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterPermission`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from permissions
			where
			permissions.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update permissions set IsActive=1
			where 
			permissions.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update permissions set IsActive=0
			where
			permissions.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterQuotation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterQuotation`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from quotation
			where
			quotation.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update quotation set IsActive=1
			where 
			quotation.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update quotation set IsActive=0
			where
			quotation.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterQuotationLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterQuotationLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from quotation_line
			where
			quotation_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update quotation_line set IsActive=1
			where 
			quotation_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update quotation_line set IsActive=0
			where
			quotation_line.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterRequestNote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterRequestNote`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from request_note
			where
			request_note.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update request_note set IsActive=1
			where 
			request_note.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update request_note set IsActive=0
			where
			request_note.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterRequestNoteLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterRequestNoteLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from request_note_line
			where
			request_note_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update request_note_line set IsActive=1
			where 
			request_note_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update request_note_line set IsActive=0
			where
			request_note_line.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterResource`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from resource
			where
			resource.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update resource set IsActive=1
			where 
			resource.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update resource set IsActive=0
			where
			resource.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterResourcePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterResourcePermission`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from resourcepermission
			where
			resourcepermission.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update resourcepermission set IsActive=1
			where 
			resourcepermission.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update resourcepermission set IsActive=0
			where
			resourcepermission.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterRoles`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from role
			where
			role.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update role set IsActive=1
			where 
			role.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update role set IsActive=0
			where
			role.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterSaleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterSaleOrder`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from sale_order
			where
			sale_order.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update sale_order set IsActive=1
			where 
			sale_order.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update sale_order set IsActive=0
			where
			sale_order.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterSaleOrderLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterSaleOrderLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from sale_order_line
			where
			sale_order_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update sale_order_line set IsActive=1
			where 
			sale_order_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update sale_order_line set IsActive=0
			where
			sale_order_line.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterServices`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from services
			where
			services.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update services set IsActive=1
			where 
			services.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update services set IsActive=0
			where
			services.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterStudent`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from student
			where
			student.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update student set IsActive=1
			where 
			student.Id=id ;
              update studentlecture set IsActive=1
			where
			studentlecture.StudentId=id; 
        END if;
IF DBoperation = 'DeActivate'
        then
            update student set IsActive=0
			where
			student.Id=id;
              update studentlecture set IsActive=0
			where
			studentlecture.StudentId=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterStudentLecture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterStudentLecture`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from studentlecture
			where
			studentlecture.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update studentlecture set IsActive=1
			where 
			studentlecture.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update studentlecture set IsActive=0
			where
			studentlecture.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterTaskComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterTaskComments`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from taskComment
			where
			taskcomment.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update taskcomment set IsActive=1
			where 
			taskcomment.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update taskcomment set IsActive=0
			where
			taskcomment.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterTasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterTasks`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
		delete from taskcomment
        where taskcomment.TaskId=id;
            delete from task 
			where
			task.Id=id; 
        END if;
IF filter = 'Activate'
        then
            update taskcomment set IsActive=1
			where 
			taskcomment.TaskId=id ;
            update task set IsActive=1
			where 
			task.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update taskcomment set IsActive=0
			where 
			taskcomment.TaskId=id ;
            update task set IsActive=0
			where
			task.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterUserRole`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from userrole
			where
			userrole.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update userrole set IsActive=1
			where 
			userrole.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update userrole set IsActive=0
			where
			userrole.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AlterUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlterUsers`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from user
			where
			user.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update user set IsActive=1
			where 
			user.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update user set IsActive=0
			where
			user.Id=id; 
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEnumValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEnumValues`(in enumTypeId int)
BEGIN
	-- select * from enumvalue where enumvalue.EnumTypeId=enumTypeId;
    select * from enumLine where enumLine.EnumTypeId=enumTypeId;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetNextId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNextId`(IN `prm_TableName` VARCHAR ( 200 ))
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
/*!50003 DROP PROCEDURE IF EXISTS `GetScheduleForUserAndDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetScheduleForUserAndDate`(
    IN p_userId varchar(256),
    IN p_date Datetime
)
BEGIN
    SELECT
       *
    FROM
        vw_viewschedule
    WHERE
        userId = p_userId
        AND p_date BETWEEN vw_viewschedule.StartDate 
        AND vw_viewschedule.EndDate
         and dayname(p_date)= vw_viewschedule.Day;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageAction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAction`( 
        in id int,
        in controllerId int,
        in name varchar(50),
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
    
           insert into action (Id,ControllerId,Name, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,controllerId,name, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update action set 
                          ControllerId=controllerId,
                          Name=name,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where action.Id =id;
   end if;
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
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAssignTask`(in id int,
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
           insert into  assignTask (Id,LectureId,StudentId, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,lectureId,studentId, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update  assignTask set 
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageAttachments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAttachments`(in id int,
        in taskId int,
        in name varchar(700),
        in docPath varchar(7000),
        in size varchar(900),
        in base64File LONGTEXT,
        in createdOn datetime,
         in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into attachments (Id,TaskId,Name, DocPath,  Size, Base64File,CreatedOn,CreatedById, ModifiedOn, ModifiedById,  IsActive )  
           values 
           (id,taskId,name, docPath,  size, base64File,createdOn,createdById, modifiedOn, modifiedById, isActive);
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update attachments set 
                          TaskId=taskId,
                          Name=name,
                          DocPath=docPath,
                          Size=size,
                          Base64File=base64File,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where attachments.Id =id;
   end if;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAttendance`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_UserId   Varchar(255),
  In prm_InTime  Varchar(50) ,
   In prm_OutTime Varchar(50) ,
  In prm_WorkedHours Varchar(50) ,
  In prm_Date datetime ,
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
 
			insert into Attendance (Id, UserId ,InTime ,OutTime ,WorkedHours ,Date, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId  ,prm_InTime ,prm_OutTime ,prm_WorkedHours ,prm_Date,  prm_CreatedBy, prm_CreatedOn, prm_IsActive );

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
/*!50003 DROP PROCEDURE IF EXISTS `ManageCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCompany`(in id int,
        in cityId int,
         in provinceId int,
          in countryId int,
        in name varchar(255),
         in contactPerson varchar(5000),
          in cell varchar(45),
         in telephone varchar(45),
          in whatsApp varchar(45),
           in addressLine1 varchar(5000),
            in addressLine2 varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into company (Id,CityId,ProvinceId,CountryId,Name,ContactPerson,
           Cell,Telephone,WhatsApp,AddressLine1,AddressLine2,CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive )  
           values (id,cityId,provinceId,countryId,name,contactPerson,
           cell,telephone,whatsApp,addressLine1,addressLine2,createdOn, createdById,
           modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update company set 
            CityId=cityId,
            ProvinceId=provinceId,
            CountryId=countryId,
               Name=name,
            ContactPerson=contactPerson,
            Cell=cell,
            Telephone=telephone,
            WhatsApp=whatsApp,
            AddressLine1=addressLine1,
            AddressLine2=addressLine2,
                       
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where company.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageController` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageController`(
		in id int,
        in featureId int,
        in name varchar(50),
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
    
           insert into controller (Id,FeatureId,Name, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,name, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update controller set 
                          FeatureId=featureId,
                          Name=name,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where controller.Id =id;
   end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCustomer`(

        in id int ,
        in paymentTermsId int,
        in secondaryCellNo varchar(50) ,
        in secondaryEmail  varchar(150),
        in customerName varchar(150),
        in primaryCellNo varchar(50),
        in primaryEmail varchar(150),
        in customerSince datetime,
        in cityId int,
        in address varchar(500),
        in creditLimit int,
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
    
           insert into customer (Id,CustomerSince,CustomerName,PrimaryCellNo,SecondaryCellNo,PrimaryEmail,SecondaryEmail,PaymentTermsId,CityId,Address,CreditLimit, CreatedOn, 
           CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,customerSince,customerName,primaryCellNo,secondaryCellNo,primaryEmail,secondaryEmail,paymentTermsId,cityId,address,creditLimit, createdOn, createdById,
           modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update customer set 
						CustomerName=IFNULL(CustomerName, customerName ),
                          CustomerSince=IFNULL(CustomerSince, customerSince ),
                          PrimaryCellNo=IFNULL(PrimaryCellNo, primaryCellNo ),
                          SecondaryCellNo=IFNULL(SecondaryCellNo, secondaryCellNo ),
                          PrimaryEmail=IFNULL(PrimaryEmail, primaryEmail ),
                          SecondaryEmail=IFNULL(SecondaryEmail, secondaryEmail ),
                          PaymentTermsId=IFNULL(PaymentTermsId, paymentTermsId ),
                          CityId=IFNULL(CityId, cityId ),
                          Address=IFNULL(Address, address ),
                          CreditLimit=IFNULL(CreditLimit, creditLimit ),
                          CreatedOn=IFNULL(CreatedOn, createdOn ),
                          CreatedById=IFNULL(CreatedById, createdById ),
                          ModifiedOn=IFNULL(ModifiedOn, modifiedOn ),
                          ModifiedById=IFNULL(ModifiedById, modifiedById ),
						  IsActive=IFNULL(IsActive, isActive )						 
             where customer.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageEnumValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageEnumValue`(in id int,
in enumTypeId int,
in value varchar(255))
BEGIN
insert into enumline (Id, EnumTypeId, Value) values(id, enumTypeId,value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageExpense` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageExpense`(in id int,
        in expenseTypeId INT,
        in expenseDate datetime,
        in expenseTitle varchar(1000),
         in expenseDetail varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into expense (Id,ExpenseTypeId,ExpenseDate,ExpenseTitle,ExpenseDetail, CreatedOn,
           CreatedById,ModifiedOn, ModifiedById, IsActive ) 
           values (id,expenseTypeId,expenseDate,expenseTitle,expenseDetail, createdOn, createdById, 
           modifiedOn,modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update expense set 
                          ExpenseTypeId=expenseTypeId,
                          ExpenseDate=expenseDate,
                          ExpenseTitle=expenseTitle,
                          ExpenseDetail=expenseDetail,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where expense.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageExpenseType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageExpenseType`(in id int,
        in type varchar(1000),
        in comment varchar(7000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into expensetype (Id,Type,Comment, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,type,comment, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update expensetype set 
                          Type=type,
                          Comment=comment,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where expensetype.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageFeature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageFeature`(in id int,
        in name varchar(50),
        in description varchar(8000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into feature (Id,Name,Description, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,name,description, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
     
          update feature set  
						  Name= name,
                          Description= description,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where feature.Id =id;
      end if;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageField`(in id int,
        in title varchar(50),
        in typeId int,
        in isRequired bit,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into field (Id,Title,TypeId,IsRequired, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,title,typeId,isRequired, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update field set 
                          Title=title,
                          TypeId=typeId,
                          IsRequired=isRequired,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where field.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageFieldPossibleValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageFieldPossibleValues`(in id int,
        in fieldId int,
        in fieldValue varchar(4000),
        in createdOn datetime,
         in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into field_possible_values (Id,FieldId,FieldValue,CreatedOn,CreatedById, ModifiedOn, ModifiedById,  IsActive )  
           values 
           (id,fieldId,fieldValue,createdOn,createdById, modifiedOn, modifiedById, isActive);
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update field_possible_values set 
                          FieldId=fieldId,
                          FieldValue=fieldValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where field_possible_values.Id =id;
   end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageInquiryFieldData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageInquiryFieldData`(in id int,
        in inquiryId int,
        in fieldName varchar(4000),
        in fieldValue varchar(4000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into inquiry_field_data (Id,InquiryId,FieldName,FieldValue, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,inquiryId,fieldName,fieldValue, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update inquiry_field_data set 
                          InquiryId=inquiryId,
                          FieldName=fieldName,
                          FieldValue=fieldValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where inquiry_field_data.Id =id AND inquiry_field_data.InquiryId=inquiryId ;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageInvoice`(
             
			 in   id int ,			
	         in  clientName varchar(100) ,
			 in   clientPoNo int,
			 in  saleOrder varchar(45),
			 in  reference varchar(45),
			 in  task varchar(45),
			 in  deliverables varchar(45),
			 in  paymentTerm int,
			 in  paymentMethod int,
			 in  status int ,
			 in description varchar(8000),
			 in   taxMethod  int,
			 in   taxPercent int,
			 in  taxValue int,
			 in  shipmentCharges int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into invoice   (Id, ClientName, ClientPoNo, SaleOrder, Reference, Task,
           Deliverables,PaymentTerm,PaymentMethod, Status , Description , TaxMethod , TaxPercent,
           TaxValue,ShipmentCharges,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )values (id, clientName, clientPoNo, saleOrder, reference, task,
           deliverables,paymentTerm,paymentMethod, status , description , taxMethod , taxpercent,
           taxvalue,shipmentCharges,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update invoice set 
						  ClientName =clientName,
	                      ClientPoNo = clientPoNo,
						  SaleOrder =saleOrder,
						  Reference = reference,
						  Task = task,
						  Deliverables = deliverables,
						  PaymentTerm = paymentTerm,
						  PaymentMethod = paymentMethod,
						  Status = status,
						  Description = description,
						  TaxMethod = taxMethod,
						  Taxpercent = taxPercent,
						  Taxvalue=taxValue,
						  ShipmentCharges=shipmentCharges,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where invoice.Id =id;
   end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageInvoiceLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageInvoiceLine`(
	           in id int,
			   in invoiceId int ,
               in invoiceItemId int,
			   in invoiceStagedId int,
			   in invoiceGroupId int,
			   in itemType varchar(45),
			   in itemCategory varchar(45),
			   in itemName varchar(500),
			   in sKU int,
			   in qTY int,
			   in uOM int,
			   in currency int,
			   in unitPrice int,
			   in lineTotal int,
               in createdOn datetime,
               in createdById int,
			   in modifiedOn datetime,
               in modifiedById int,
               in isActive bit,
               in DBoperation varchar(500)
               )
BEGIN
/*insert*/
if DBoperation = 'Insert'
    then
           insert into invoice_line (Id, InvoiceId,InvoiceItemId, InvoiceStagedId, InvoiceGroupId, 
           ItemType,ItemCategory, ItemName,SKU,QTY, UOM , Currency , UnitPrice , LineTotal,
           CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive)
           values(id, invoiceId,invoiceItemId, invoiceStagedId, invoiceGroupId, 
           itemType,itemCategory, itemName,sKU,qTY, uOM , currency , unitPrice , lineTotal,
           createdOn, createdById, modifiedOn, modifiedById, isActive) ;
		   
   end if;
   /*update*/
 if DBoperation ='Update'
   then
            update invoice_line set  
                          InvoiceId= invoiceId,
                          InvoiceItemId=invoiceItemId,
	                      InvoiceStagedId = invoiceStagedId,
						  InvoiceGroupId =invoiceGroupId,
						  ItemType = itemType,
						  ItemCategory = itemCategory,
						  ItemName = itemName,
						  SKU = sKU,
						  QTY = qTY,
						  UOM = uOM,
						  Currency = currency,
						  UnitPrice = unitPrice,
						  LineTotal = lineTotal,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             WHERE   invoice_line.Id =id ;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageItem`(in id int,
        in itemCode int,
        in systemRefNo int,
        in itemName varchar(200),
        in salePrice int,
        in hSCode varchar(45),
        in itemDescription varchar(8000),
        in sourceId int,
        in brandId int,
		in categoryId int,
        in subCategoryId int,
        in uoMId int,
        in standardWeightId int,
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
           insert into item (Id,ItemCode,ItemName,SalePrice,SystemRefNo,HSCode,ItemDescription,SourceId,BrandId,CategoryId, 
           SubCategoryId,UoMId,StandardWeightId,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  
           values (id,itemCode,itemName,salePrice,systemRefNo,hSCode,itemDescription,sourceId,brandId,categoryId,subCategoryId
           , uoMId,standardWeightId,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update item set 
                          ItemCode=itemCode,
                          ItemName=itemName,
                          SalePrice=salePrice,
                          SystemRefNo=systemRefNo,
                          HSCode=hSCode,
                          ItemDescription=itemDescription,
                          SourceId=sourceId,
                          BrandId=brandId,
                          CategoryId=categoryId,
                          SubCategoryId=subCategoryId,
                          UoMId=uoMId,
                          StandardWeightId=standardWeightId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where item.Id =id;
   end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageLogEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageLogEvent`(in id int,
        in userId VARCHAR(255),
        in action varchar(1000),
         in message varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into logevent (Id,UserId,Action,Message, CreatedOn, CreatedById, 
           ModifiedOn, ModifiedById, IsActive )  values 
           (id,userId,action,message, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
     
          update logevent set  
						  UserId= userId,
                          Action= action,
                          Message=message,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where logevent.Id =id;
      end if;
      
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageNotificationLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageNotificationLog`(in id int,
        in phone varchar(45),
        in userId varchar(255),
        in sMS varchar(600),
        in dateTime datetime,
        isSent bit,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50))
BEGIN
if filter = 'Insert'
then
    
           insert into notification_log (Id,Phone,UserId,SMS,DateTime,IsSent, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,phone,userId,sMS,dateTime,isSent,  createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if filter ='Update'
 then
            update notification_log set 
                          phone=phone,
                          UserId=userId,
                          SMS=sMS,
                          DateTime=datetime,
                          IsSent=isSent,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where notification_log.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageNotificationTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageNotificationTemplate`(in id int,
        in keyCode varchar(100),
        in templateName varchar(200),
        in subject varchar(200),
        in body varchar(8000),
        in sMS varchar(160),
        in createdOn datetime,
         in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into notificationtemplate (Id,KeyCode,TemplateName, Subject,  Body, SMS
           ,CreatedOn,CreatedById, ModifiedOn, ModifiedById,  IsActive )  
           values 
           (id,keyCode,templateName, subject,  body, sMS,createdOn,createdById,
           modifiedOn, modifiedById, isActive);
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update notificationtemplate set 
                          KeyCode=keyCode,
                          TemplateName=templateName,
                          Subject=subject,
                          body=body,
                          SMS=sMS,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where notificationtemplate.Id =id;
   end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManagePermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePermissions`(in id int,
        in featureId int,
        in roleId VARCHAR(255),
        in userId VARCHAR(255),
        in permissionValue int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into permissions (Id,FeatureId,UserId,RoleId,PermissionValue, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,userId,roleId,permissionValue, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update permissions set 
                          FeatureId=featureId,
                          UserId=userId,
                          RoleId=roleId,
                         PermissionValue=permissionValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where permissions.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageQuotation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageQuotation`(in   id int ,			
	         in  applyDiscount int ,
			 in  title  varchar(100),
			 in  clientName varchar(100),
			 in  quoteValidity datetime,
			 in  discountType int,
			 in  discountMethod int,
			 in  discount int,
			 in  shipTo int,
			 in  deliveryDate datetime,
             in  deliveryMethod int,
             in statusRequired int,
             in description varchar(8000),
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into quotation   (Id, ApplyDiscount, Title, ClientName, QuoteValidity, DiscountType, DiscountMethod,Discount,
           ShipTo,DeliveryDate,DeliveryMethod,StatusRequired,Description,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, applyDiscount, title, clientName, quoteValidity, discountType,discountMethod,discount,
           shipTo,deliveryDate,deliveryMethod,statusRequired,description,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update quotation set 
						  ApplyDiscount =applyDiscount,
	                      Title = title,
						  ClientName =clientName,
						  QuoteValidity = quoteValidity,
						  DiscountType = discountType,
						  DiscountMethod = discountMethod,
						  Discount = discount,
						  ShipTo = shipTo,
						  DeliveryDate=deliveryDate,
                          DeliveryMethod=deliveryMethod,
                          StatusRequired=statusRequired,
                          DeliveryMethod=deliveryMethod,
                          Description=description,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where quotation.Id =id;
   end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageQuotationLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageQuotationLine`( in   id int ,			
	         in  quotationId int ,
			 in  name  varchar(100),
			 in  qTY int,
			 in  uOM int,
			 in  lineTotal int,
			 in  discountMethod int,
			 in  discountValue int,
			 in  totalDiscountPrice int,
			 in  shipmentCharges int,
             in  netTotal int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into quotation_line   (Id, QuotationId, Name, QTY, UOM, LineTotal, DiscountMethod,DiscountValue,
           TotalDiscountPrice,ShipmentCharges,NetTotal,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, quotationId, name, qTY, uOM, lineTotal,discountMethod,discountValue,
           totalDiscountPrice,shipmentCharges,netTotal,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update quotation_line set 
						  QuotationId =quotationId,
	                      Name = name,
						  QTY =qTY,
						  UOM = uOM,
						  LineTotal = lineTotal,
						  DiscountMethod = discountMethod,
						  DiscountValue = discountValue,
						  TotalDiscountPrice = totalDiscountPrice,
						  ShipmentCharges=shipmentCharges,
                          NetTotal=netTotal,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where quotation_line.Id =id;
   end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageRequestNote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageRequestNote`(	 in   id int ,			
	         in  TypeId int ,
			 in   CategoryId int,
			 in  StatusId int,
			 in  RequesterTypeId int,
			 in  Title varchar(100),
			 in  RequiredBefore datetime,
			 in  Reason varchar(100),
			 in description varchar(8000),
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into request_note   (Id, TypeId, CategoryId, StatusId, RequesterTypeId, Title,
           RequiredBefore,Reason, Description , CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, typeId, categoryId, statusId, requesterTypeId, title,
           requiredBefore,reason , description , createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update request_note set 
						  TypeId =typeId,
	                      CategoryId = categoryId,
						  StatusId =statusId,
						  RequesterTypeId = requesterTypeId,
						  Title = title,
						  RequiredBefore = requiredBefore,
						  Reason = reason,
						  Description = description,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where request_note.Id =id;
   end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageRequestNoteLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageRequestNoteLine`(	 in   id int ,			
	         in  requestNoteId int,
			 in   uOMId int,
			 in  itemName varchar(100),
			 in  requestedQty int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into request_note_line   (Id, RequestNoteId, UOMId, ItemName, RequestedQty, 
           CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, requestNoteId, uOMId, itemName, requestedQty,
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update request_note_line set 
						  RequestNoteId =requestNoteId,
	                      UOMId = uOMId,
						  ItemName =itemName,
						  RequestedQty = requestedQty,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where request_note_line.Id =id;
   end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageResource`(in id int,
        in featureId int,
        in controllerId int,
        in actionId int,
        in resourceValue varchar(50),
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
    
           insert into resource (Id,FeatureId,ControllerId,ActionId,ResourceValue, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,controllerId,actionId,resourceValue, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update resource set 
                          FeatureId=featureId,
                          ControllerId=controllerId,
                          ActionId=actionId,
                          ResourceValue=resourceValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where resource.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageResourcePermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageResourcePermissions`( in id int,
        in featureId int,
        in userId int,
        in roleId int,
        in resourceId int,
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
    
           insert into resourcepermission (Id,FeatureId,UserId,RoleId,ResourceId, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,userId,roleId,resourceId, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update resourcepermission set 
                          FeatureId=featureId,
                          UserId=userId,
                          RoleId=roleId,
                          ResourceId=resourceId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where resourcepermission.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageRole`(
        in id int,
        in name varchar(50),
        in responsibility varchar(5000),
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
    
           insert into role (Id,Name,Responsibility, CreatedOn, CreatedById, ModifiedOn,
           ModifiedById, IsActive )  values (id,name,responsibility, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update role set 
                          Name=name,
                          Responsibility=responsibility,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where role.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSaleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSaleOrder`( in   id int ,			
	         in  customerId  int ,
             in balance int,
             in total int,
             in discount int,
             in netPayable int,
			 in   statusId int,
			 in  clientSoNo int,
			 in  paymentTerm  varchar(100),
			 in  paymentMethod varchar(100),
			 in  reference int,
			 in description varchar(8000),
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into sale_order   (Id, CustomerId,Balance,Total,Discount,NetPayable, StatusId, ClientSoNo, PaymentTerm, PaymentMethod,
           Reference, Description , CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, customerId,balance,total,discount,netPayable, statusId, clientSoNo, paymentTerm, paymentMethod,
           reference , description , createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update sale_order set 
						  CustomerId =customerId,
                          Balance=balance,
                          Total=total,
                          Discount=discount,
	                      StatusId = statusId,
                          NetPayable=netPayable,
						  ClientSoNo =clientSoNo,
						  PaymentTerm = paymentTerm,
						  PaymentMethod = paymentMethod,
						  Reference = reference,
						  Description = description,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where sale_order.Id =id;
   end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageSaleOrderLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageSaleOrderLine`( in   id int ,			
	         in  saleOrderId int ,
			 in  itemName varchar(150),
             in itemCode int,
             in uOMId int,
			 in qTY int,
			 in price int,
			 in lineTotal int,
			 in  itemType varchar(100),
			 in  itemCategory int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50) )
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into sale_order_line   (Id, SaleOrderId, ItemName,ItemCode,UOMId,QTY,
           Price,lineTotal, ItemType, ItemCategory, 
           CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, saleOrderId, itemName,itemCode,uOMId,qTY,price,lineTotal, itemType, itemCategory, 
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update sale_order_line set 
						  SaleOrderId =saleOrderId,
	                      ItemName = itemName,
                          ItemCode=itemCode,
                          UOMId=uOMId,
                          QTY=qTY,
                          Price=price,
                          LineTotal=lineTotal,
						  ItemType =itemType,
						  ItemCategory = itemCategory,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where sale_order_line.Id =id;
   end if;

end ;;
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
update scheduledayevent set 
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
 where scheduledayevent.Id= id ;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageServices`(in id int,
        in name varchar(200),
        in content varchar(8000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in dBoperation varchar(50))
BEGIN
if dBoperation = 'Insert'
then
    
           insert into services (Id,Name,Content, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,content, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if dBoperation ='Update'
 then
            update services set 
                          Name=name,
                          Content=content,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive	
             where services.Id =id;
   end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageStudent`(in id int,
        in studentName varchar(100),
        in gender char,
		in cNIC varchar(15),
        in dOB datetime,
		in cellNo varchar(45),
        in email varchar(45),
        in whatsApp varchar(45),
        in guardianName varchar(45),
		in guardianCell varchar(45),
        in guardianRelation varchar(45),
        in guardianWhatsApp varchar(45) ,
        in guardianEmail varchar(45),
        in guardianOccupation varchar(45),
        in remarks varchar(500),
        in userName varchar(100),
        in password varchar(45),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then    
           insert into student (Id,StudentName,Gender,CNIC,DOB,CellNo,Email,WhatsApp,GuardianName,
           GuardianCell,GuardianRelation,GuardianWhatsApp,GuardianEmail,GuardianOccupation,Remarks,UserName,Password, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive )  
           values 
           (id,studentName,gender,cNIC,dOB,cellNo,email,whatsApp,guardianName,guardianCell,
           guardianRelation,guardianWhatsApp,guardianEmail,guardianOccupation,remarks,userName,password,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update student set 
                          StudentName=studentName,
                          Gender=gender,
                          CNIC=cNIC,
                          DOB=dOB,
                          CellNo=cellNo,
                          Email=email,
                          WhatsApp=whatsApp,
                          GuardianName=guardianName,
                          GuardianCell=guardianCell,
                          GuardianRelation=guardianRelation,
                          GuardianWhatsApp=guardianWhatsApp,
                          GuardianEmail=guardianEmail,
                          GuardianOccupation=guardianOccupation,
                          Remarks=remarks,
                          UserName=userName,
                          Password=password,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where student.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageStudentinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageStudentinfo`(
        in Id int,
        in userId varchar(200),
        in name varchar(45),
		in program varchar(45),
        in semester int,
		in cgpa int,
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
           insert into studentinfo (Id, UserId,Name,Program,Semester,Cgpa, CreatedOn, CreatedById, IsActive ) 
           values 
           (id, userId,name,program,semester,cgpa, createdOn, createdById, isActive );
 end if;   
 if DBoperation ='Update'
       then     
          update studentinfo set  
						  UserId=userId,
                          Name=name,
                          Program=program,
                          Semester=semester,
                          Cgpa=cgpa,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where Id=id;
      end if;
IF DBoperation = 'Delete'
       then
            delete from studentinfo
		             where Id=id;
        END if;
IF DBoperation = 'Activate'
        then
            update studentinfo set IsActive=1
			              where Id=id;
        END if;
IF DBoperation = 'DeActivate'
        then
            update studentinfo set IsActive=0
			              where Id=id;
        END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageStudentLecture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageStudentLecture`(in id int,
        in studentId int,
        in lectureId int,
        in assignedOn datetime,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into studentlecture (Id,StudentId,LectureId,AssignedOn, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,studentId,lectureId,assignedOn, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update studentlecture set 
                          StudentId=studentId,
                          LectureId=lectureId,
                          AssignedOn=assignedOn,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where studentlecture.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTask`(in id int,
        in userId varchar(40),
        in moduleId int,
        in statusId int,
        in priorityId int,
        in title varchar(300),
        in sP float,
        in description longtext,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50))
BEGIN
if filter = 'Insert'
then
    
           insert into task (Id,UserId,ModuleId,StatusId,PriorityId,Title,SP,Description, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,userId,moduleId,statusId,priorityId,title,sP,description, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if filter ='Update'
 then
            update task set 
                          UserId=userId,
                          ModuleId=moduleId,
                          StatusId=statusId,
                          PriorityId=priorityId,
                          Title=title,
                          Description=description,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive	,
                          SP=sp
             where task.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageTaskComment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTaskComment`(in id int,
        in taskId int,
        in userId varchar(40),
        in comment text,
        in time datetime,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50))
BEGIN
if filter = 'Insert'
then
    
           insert into taskcomment (Id,TaskId,UserId,Comment,Time, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,taskId,userId,comment,time,  createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if filter ='Update'
 then
            update taskcomment set 
                          TaskId=taskId,
                          UserId=userId,
                          Comment=comment,
                          Time=time,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where taskcomment.Id =id;
   end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `ManageUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageUserRole`(  in id int,
        in roleId int,
        in userId int,
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
    
           insert into userrole (Id,RoleId,UserId, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,roleId,userId, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update userrole set 
                          RoleId=roleId,
                          UserId=userId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where userrole.Id =id;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageUserTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageUserTask`(
		in id int,
        in userId varchar(225),
        in taskId int,
        in parent varchar(225),
         in date datetime,
        in claimId varchar(50),
        in sp float,
        in comments longtext,
        in reviewedby varchar(255),
        in reviewcomments varchar(255),
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
           insert into  usertask (Id,UserId,TaskId,Parent,Date,ClaimId,Sp, Comments,ReviewedBy,ReviewComments, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,userId,taskId,parent,date,claimId,sp,comments,reviewedby,reviewcomments, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   

 if DBoperation ='Update'
 then
            update  usertask set 
                         UserId = userId,
                          TaskId=taskId,
                          Parent=parent,
                          Date=date,
                          ClaimId=claimId,
                          Sp=sp,
                          Comments=comments,
                          ReviewedBy=reviewedby,
                          ReviewComments=reviewcomments,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where   usertask.Id =id;
   end if;
   IF DBoperation = 'Delete'
    then
            delete from usertask
			where
			 usertask.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update   usertask set IsActive=1
			where 
			 usertask.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update  usertask set IsActive=0
			where
			 usertask.Id=id; 
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
  In prm_EffectiveDate datetime ,
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

			insert into Schedule (Id, UserId, RoleId, EntityId,ScheduleTypeId ,WorkingTypeId ,WorkingHours,StartDate, EndDate, EffectiveDate, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_UserId, prm_RoleId,prm_EntityId, prm_ScheduleTypeId , prm_WorkingTypeId ,prm_WorkingHours ,prm_StartDate, prm_EndDate, prm_EffectiveDate,  prm_CreatedBy, prm_CreatedOn, prm_IsActive );

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
            EffectiveDate=prm_EffectiveDate,
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
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
  In prm_UserId   Varchar(40),
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
/*!50003 DROP PROCEDURE IF EXISTS `Manage_Tasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_Tasks`( In prm_Filter varchar (50),
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
/*!50003 DROP PROCEDURE IF EXISTS `Manage_UserTarget` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Manage_UserTarget`(
    IN prm_Filter VARCHAR(50),
    IN prm_Id INT,
    IN prm_UserId VARCHAR(255),
    IN prm_InTime VARCHAR(50),
    IN prm_OutTime VARCHAR(50),
    IN prm_TaskId INT,
    IN prm_Sps DOUBLE,
    IN prm_PercentageCompletion INT,
    IN prm_CreatedBy INT,
    IN prm_CreatedOn DATETIME(0),
    IN prm_ModifiedBy INT,
    IN prm_ModifiedOn DATETIME(0),
    IN prm_IsActive BIT(1)
)
BEGIN
    IF prm_Filter = 'Insert' THEN
        BEGIN
            INSERT INTO UserTargets (
                Id, UserId, InTime, OutTime, TaskId, Sps, PercentageCompletion,
                CreatedBy, CreatedOn, IsActive
            )
            VALUES (
                prm_Id, prm_UserId, prm_InTime, prm_OutTime, prm_TaskId, prm_Sps, prm_PercentageCompletion,
                prm_CreatedBy, prm_CreatedOn, prm_IsActive
            );
        END;
    ELSEIF prm_Filter = 'Update' THEN
        BEGIN
            UPDATE UserTargets
            SET
                UserId = prm_UserId,
                InTime = prm_InTime,
                OutTime = prm_OutTime,
                TaskId = prm_TaskId,
                Sps = prm_Sps,
                PercentageCompletion = prm_PercentageCompletion,
                ModifiedBy = prm_ModifiedBy,
                ModifiedOn = prm_ModifiedOn,
                IsActive = prm_IsActive
            WHERE Id = prm_Id;
        END;
    ELSEIF prm_Filter = 'Delete' THEN
        BEGIN
            DELETE FROM UserTargets
            WHERE Id = prm_Id;
        END;
    ELSEIF prm_Filter = 'Disable' THEN
        BEGIN
            UPDATE UserTargets
            SET
                IsActive = 0,
                ModifiedBy = prm_ModifiedBy,
                ModifiedOn = prm_ModifiedOn
            WHERE Id = prm_Id;
        END;
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchAction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAction`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			action  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchAttachments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAttachments`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			attachments  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCompany`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			company  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchController` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchController`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			controller  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCustomer`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_customers`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchEventsByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchEventsByUser`(in userId varchar(255) )
BEGIN
select * from vw_scheduledayevents  event where (CURDATE()
 BETWEEN `event`.`StartDate` AND IFNULL(`event`.`EndDate`, CURDATE()))
and Day=DayName(current_date()) and event.UserId=userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchExpense` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchExpense`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_expense  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchExpenseType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchExpenseType`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			expensetype  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchFeature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchFeature`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			feature  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchField`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_field  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchFieldPossibleValues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchFieldPossibleValues`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_fpvalue  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchInquiryFieldData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchInquiryFieldData`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_inquiryfielddata`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchInvoice`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * FROM  `vw_invoices`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchItem`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_items`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchLogEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchLogEvent`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_logevent  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchNotificationLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchNotificationLog`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			notification_log  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchNotificationTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchNotificationTemplate`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			notificationtemplate ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchPermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPermissions`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_permission`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchQuotation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchQuotation`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_quotations`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchRequestNote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchRequestNote`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * FROM  `vw_request_notes`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchResource`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			resource  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchResourcePermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchResourcePermissions`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_resourcepermission`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchRoles`(
in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			role  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchSaleOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSaleOrder`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_saleorders`  ';
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
  set @querystr ='select * FROM `lms`.`vw_Schedule`   ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchServices`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			services  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchStudentinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStudentinfo`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`lms`.`vw_studentinfo`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchStudentLecture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStudentLecture`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_studentlectures`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchTaskComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTaskComments`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_taskcomment ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchTasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTasks`(in whereClause varchar(5000))
BEGIN

     set @querystr ='SELECT * 
			FROM
			vw_tasks';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserRole`(
in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_userrole`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUsers`(
in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			user  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserTargets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserTargets`(in whereClause varchar(5000))
BEGIN
  set @querystr ='select * 
			FROM
			`lms`.`vw_UserTargets`  ';
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserTask`( in WhereClause varchar(5000))
BEGIN
 set @queryStr= "select * from `vw_usertask`";
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchViewSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchViewSchedule`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * FROM vw_ViewSchedule ';
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
-- Final view structure for view `vw_task`
--

/*!50001 DROP VIEW IF EXISTS `vw_task`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_task` AS select `tsk`.`Id` AS `Id`,`tsk`.`UserId` AS `UserId`,`aspnetusers`.`UserName` AS `User`,`tsk`.`PriorityId` AS `PriorityId`,`priority`.`Name` AS `Priority`,`tsk`.`StatusId` AS `StatusId`,`status`.`Name` AS `Status`,`tsk`.`ModuleId` AS `ModuleId`,`module`.`Name` AS `Module`,`tsk`.`Title` AS `Title`,`tsk`.`SP` AS `SP`,`tsk`.`Description` AS `Description`,`tsk`.`IsActive` AS `IsActive` from ((((`task` `tsk` left join `aspnetusers` on((`aspnetusers`.`Id` = `tsk`.`UserId`))) left join `enumline` `priority` on((`priority`.`Id` = `tsk`.`PriorityId`))) left join `enumline` `status` on((`status`.`Id` = `tsk`.`StatusId`))) left join `enumline` `module` on((`module`.`Id` = `tsk`.`ModuleId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usertask`
--

/*!50001 DROP VIEW IF EXISTS `vw_usertask`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usertask` AS select `usertask`.`Id` AS `Id`,`usertask`.`UserId` AS `UserId`,`aspnetusers`.`UserName` AS `User`,`usertask`.`TaskId` AS `TaskId`,`task`.`Title` AS `Title`,`usertask`.`Date` AS `Date`,`usertask`.`Parent` AS `Parent`,`usertask`.`ClaimId` AS `ClaimId`,`claim`.`Name` AS `Claim`,`usertask`.`Sp` AS `Sp`,`usertask`.`Comments` AS `Comments`,`usertask`.`ReviewedBy` AS `ReviewedBy`,`usertask`.`ReviewComments` AS `ReviewComments` from (((`usertask` left join `aspnetusers` on((`aspnetusers`.`Id` = `usertask`.`UserId`))) left join `enumline` `claim` on((`claim`.`Id` = `usertask`.`ClaimId`))) left join `task` on((`task`.`Id` = `usertask`.`TaskId`))) */;
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

-- Dump completed on 2023-11-07 15:44:46
