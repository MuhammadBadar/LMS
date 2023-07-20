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
-- Table structure for table `assigntask`
--

DROP TABLE IF EXISTS `assigntask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigntask` (
  `Id` int NOT NULL,
  `CourseId` int DEFAULT NULL,
  `TopicId` int DEFAULT NULL,
  `StudentId` int DEFAULT NULL,
  `LectureId` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigntask`
--

LOCK TABLES `assigntask` WRITE;
/*!40000 ALTER TABLE `assigntask` DISABLE KEYS */;
INSERT INTO `assigntask` VALUES (1,0,0,NULL,NULL,'2023-07-17 15:20:41','2023-07-17 15:20:41',0,0,_binary ''),(2,1,4,NULL,3,'2023-07-17 15:20:51','2023-07-17 15:20:51',0,0,_binary ''),(3,0,0,NULL,0,'2023-07-17 04:12:35','2023-07-17 04:12:35',0,0,_binary ''),(4,1,4,NULL,2,'2023-07-17 04:17:58','2023-07-17 04:17:58',0,0,_binary ''),(5,2,5,NULL,4,'2023-07-17 07:46:05','2023-07-17 07:46:05',0,0,_binary ''),(6,2,4,NULL,4,'2023-07-17 13:04:35','2023-07-17 13:04:35',0,0,_binary ''),(7,0,5,NULL,0,'2023-07-17 13:04:42','2023-07-17 13:04:42',0,0,_binary ''),(8,0,0,NULL,0,'2023-07-19 04:57:15','2023-07-19 04:57:15',0,0,_binary ''),(9,0,0,NULL,0,'2023-07-19 04:57:17','2023-07-19 04:57:17',0,0,_binary ''),(10,0,0,NULL,0,'2023-07-19 04:57:22','2023-07-19 04:57:22',0,0,_binary ''),(11,0,0,NULL,0,'2023-07-19 04:58:22','2023-07-19 04:58:22',0,0,_binary '');
/*!40000 ALTER TABLE `assigntask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `id` int NOT NULL,
  `TopicId` int DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `description` longtext,
  `URL` varchar(45) DEFAULT NULL,
  `CourseId` varchar(45) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (2,4,'hira','text','www.localhost.com','1','2023-07-17 14:52:48',0,'2023-07-17 14:52:48',0,_binary ''),(3,5,'heer','message','www.localhost','2','2023-07-17 14:54:23',0,'2023-07-17 14:54:23',0,_binary ''),(4,5,'heeer','text','www.localhost.com','2','2023-07-17 15:09:12',0,'2023-07-17 15:09:12',0,_binary '');
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_assigntask`
--

DROP TABLE IF EXISTS `vw_assigntask`;
/*!50001 DROP VIEW IF EXISTS `vw_assigntask`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_assigntask` AS SELECT 
 1 AS `Id`,
 1 AS `StudentId`,
 1 AS `Course`,
 1 AS `Topic`,
 1 AS `CourseId`,
 1 AS `TopicId`,
 1 AS `LectureId`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_lecture`
--

DROP TABLE IF EXISTS `vw_lecture`;
/*!50001 DROP VIEW IF EXISTS `vw_lecture`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_lecture` AS SELECT 
 1 AS `Id`,
 1 AS `TopicId`,
 1 AS `CourseId`,
 1 AS `URL`,
 1 AS `Title`,
 1 AS `Description`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`,
 1 AS `TopicTitle`,
 1 AS `Course`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_assigntask`
--

/*!50001 DROP VIEW IF EXISTS `vw_assigntask`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assigntask` AS select `assigntask`.`Id` AS `Id`,`assigntask`.`StudentId` AS `StudentId`,`course`.`Title` AS `Course`,`topic`.`TopicTitle` AS `Topic`,`assigntask`.`CourseId` AS `CourseId`,`assigntask`.`TopicId` AS `TopicId`,`assigntask`.`LectureId` AS `LectureId`,`assigntask`.`CreatedOn` AS `CreatedOn`,`assigntask`.`CreatedById` AS `CreatedById`,`assigntask`.`ModifiedOn` AS `ModifiedOn`,`assigntask`.`ModifiedById` AS `ModifiedById`,`assigntask`.`IsActive` AS `IsActive` from (((`assigntask` join `course` on((`course`.`Id` = `assigntask`.`CourseId`))) join `topic` on((`topic`.`Id` = `assigntask`.`TopicId`))) join `student` on((`student`.`Id` = `assigntask`.`StudentId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_lecture`
--

/*!50001 DROP VIEW IF EXISTS `vw_lecture`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_lecture` AS select `lecture`.`id` AS `Id`,`lecture`.`TopicId` AS `TopicId`,`lecture`.`CourseId` AS `CourseId`,`lecture`.`URL` AS `URL`,`lecture`.`Title` AS `Title`,`lecture`.`description` AS `Description`,`lecture`.`CreatedOn` AS `CreatedOn`,`lecture`.`CreatedById` AS `CreatedById`,`lecture`.`ModifiedOn` AS `ModifiedOn`,`lecture`.`ModifiedById` AS `ModifiedById`,`lecture`.`IsActive` AS `IsActive`,`topic`.`TopicTitle` AS `TopicTitle`,`course`.`Title` AS `Course` from ((`lecture` left join `topic` on((`topic`.`Id` = `lecture`.`TopicId`))) left join `course` on((`course`.`Id` = `lecture`.`CourseId`))) */;
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

-- Dump completed on 2023-07-20  0:44:07
