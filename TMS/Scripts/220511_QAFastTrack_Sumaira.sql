-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: qafasttrack
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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20220304111006_Initials','6.0.2');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('1f7dcdd7-f3af-4685-bb9c-3860b5e4c305','Manager','MANAGER','bf5023a8-8724-4acb-acf9-b6ea02792aa2'),('2d75f82f-de81-487f-adf9-732a1a81826b','SE','SE','0f58f269-d49e-483e-a680-0330c824c206'),('a67febed-dc5d-4253-999e-f3db0f0687f2','Admin','ADMIN','dba878b4-dc0a-4e2a-a9c5-f9a9d21f36e4'),('b7a210ac-fcf6-438b-bb65-59a035ba84a6','JSE','JSE','89f6322c-29ef-44e3-9300-28c05157e645'),('eec2d7a0-1e7f-4932-8de6-d34080d038e5','PSE','PSE','84a174a2-363e-45c1-a026-ea7ff6c11a23');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FirstName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `DirectSupervisorId` varchar(255) DEFAULT NULL,
  `DirectSupervisorName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('0608d41e-d78f-43f0-b90d-f01f0be913a4',NULL,NULL,'Saira','SAIRA','abc@gmail.com','ABC@GMAIL.COM',0,'AQAAAAEAACcQAAAAEBGvj3sUeAj4WTzca96Tf9lqen4N4h4ro6Xn/jf5yyHSn6BoDhxx3rPe+Oe9HnWkkw==','NSTDT2Z4AAGYYYIMYZPXST5UIXSS3ENE','f4175d48-185d-4f8b-b5df-2020f2351d54','12345678987',0,0,NULL,1,0,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13',NULL),('2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13',NULL,NULL,'Areeba','AREEBA','sumairaameer212@gmail.com','SUMAIRAAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAEL4tPOtra4W9MrXwcYXXVGTBP89GRlvwGviTfyBiHZ2tnKlH6gPnYF99YhE1LAywfA==','5HZPQMNFVZNDAHGCY5QR7275MDCEMKKU','11da1ee2-1de9-468b-b100-9f54eb77ed48','1234567891',0,0,NULL,1,0,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13',NULL),('3b060983-3c96-49e0-a7ea-b63f236241d1',NULL,NULL,'Ifrah','IFRAH','abc@gmail.com','ABC@GMAIL.COM',0,'AQAAAAEAACcQAAAAEE0H9OobbCj6f9olqWDkKeor6v1wOH04UQ9vm3wBSeH8o7C0y82ZoGQTFtR/5y0mew==','DK27LWCZZRVBWGMBMKZWUIQETVYA2WWI','026d1d63-74a1-4f82-9362-dd55246f2d8c','12345678987',0,0,NULL,1,0,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13',NULL),('52434e58-713d-4cb7-a3d9-3b14f5f3fe32',NULL,NULL,'Humaira','HUMAIRA','bintameer212@gmail.com','BINTAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAEELFre4B1ZDY1hzWKTULaqcUz1+6MvBKUKSx6P3pyHxVvPMN/7wic9XtJRvZQSFAPg==','G2UING4DRKSAGRJJRFP3ICOJA5UFBTVG','c37940fd-4997-4055-88e8-f3dc0f23874e','03001234567',0,0,NULL,1,0,NULL,NULL),('82c43e6d-05d5-4423-a4cd-91b2df9f7f13',NULL,NULL,'warda','WARDA','abc@gmail.com','ABC@GMAIL.COM',0,'AQAAAAEAACcQAAAAEARW7OY+8rOPlnCTcV2swTrsr+Kx+KdxxL4k2+d8REM84yEenhDOfoN4HMNK6YyKUg==','WQOKUXVAOKUDTERDCWFEIOQU6XFXGASR','9a0161ae-fe4a-470b-8548-4844badb8b82','123456',0,0,NULL,1,0,NULL,NULL),('af7f5a56-46cb-4e76-87f3-202ce9032607',NULL,NULL,'Zunaira','ZUNAIRA','abc@gmail.com','ABC@GMAIL.COM',0,'AQAAAAEAACcQAAAAEIpibOD8qtoQOb5DfH5+cPJD/k6HhFEOVzAly0vW7q88WEBvny9r+9bZKPx3dSYzuQ==','2ONKDMZ3GGZ3XTH3JKMW25POZRVNQZYR','5eda2518-fbdb-4c33-a534-7d22b274896c','12345678987',0,0,NULL,1,0,NULL,NULL),('e9440eb2-51a2-4e95-ac65-5c939d25e0dc',NULL,NULL,'Sumaira','SUMAIRA','bintameer212@gmail.com','BINTAMEER212@GMAIL.COM',0,'AQAAAAEAACcQAAAAEFRXp4onVV1WXox2FcMrg6Y8qsS6B4bcuQk6UXB2+wVS521qyixu5lcD+6+UB9S1MA==','4EFYXI5UFICTLQW3WE5GRTV2TWVC6LKZ','58e31631-32d2-4be6-b142-60b1d4839520','1234567891',0,0,NULL,1,0,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13',NULL);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `Id` int NOT NULL,
  `TaskId` int NOT NULL,
  `Name` varchar(700) DEFAULT NULL,
  `DocPath` varchar(7000) DEFAULT NULL,
  `Base64File` longtext,
  `Size` varchar(900) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TaskId` (`TaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `Id` int NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `InTime` datetime DEFAULT NULL,
  `OutTime` datetime DEFAULT NULL,
  `WorkingHours` varchar(500) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','2022-10-25 21:17:43','2022-10-25 21:30:09','12mint','2022-10-25 21:17:43',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','2022-10-25 21:18:22','2022-10-25 21:19:13','0mint','2022-10-24 21:18:22',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','2022-10-25 21:20:49','2022-10-25 21:26:34','5mint','2022-10-25 21:20:49',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','2022-10-27 21:58:22','2022-10-27 22:53:04','54mint','2022-10-27 21:58:22',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Id` int NOT NULL,
  `CityId` int DEFAULT NULL,
  `ProvinceId` int DEFAULT NULL,
  `CountryId` int DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `ContactPerson` varchar(5000) NOT NULL,
  `Cell` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `WhatsApp` varchar(45) DEFAULT NULL,
  `AddressLine1` varchar(5000) DEFAULT NULL,
  `AddressLine2` varchar(5000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CityId` (`CityId`),
  KEY `ProvinceId` (`ProvinceId`),
  KEY `CountryId` (`CountryId`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`ProvinceId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_3` FOREIGN KEY (`CountryId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,1001004,1002002,1003001,'ABC','ABC','1234567764','1234567764','1234567764','ASDGFG','GHFJHGU','2022-03-22 22:10:52',0,'2022-03-22 22:10:52',0,_binary '');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumtype`
--

DROP TABLE IF EXISTS `enumtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumtype` (
  `Id` int NOT NULL,
  `Type` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumtype`
--

LOCK TABLES `enumtype` WRITE;
/*!40000 ALTER TABLE `enumtype` DISABLE KEYS */;
INSERT INTO `enumtype` VALUES (1000,' Permissions'),(1001,'CityId'),(1002,'ProvinceId'),(1003,'CountryId'),(1004,'Status'),(1005,'User'),(1006,'PriorityId'),(1007,'Type');
/*!40000 ALTER TABLE `enumtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumvalue`
--

DROP TABLE IF EXISTS `enumvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumvalue` (
  `Id` int NOT NULL,
  `EnumTypeId` int NOT NULL,
  `Value` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `enumvalue` (`EnumTypeId`),
  CONSTRAINT `enumvalue_ibfk_1` FOREIGN KEY (`EnumTypeId`) REFERENCES `enumtype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumvalue`
--

LOCK TABLES `enumvalue` WRITE;
/*!40000 ALTER TABLE `enumvalue` DISABLE KEYS */;
INSERT INTO `enumvalue` VALUES (1000001,1000,'Deny'),(1000002,1000,'ReadOnly'),(1000003,1000,'FullAccess'),(1001001,1001,'Lahore'),(1001002,1001,'Karachi'),(1001003,1001,'Queeta'),(1001004,1001,'Multan'),(1002001,1002,'Punjab'),(1002002,1002,'Sindh'),(1003001,1003,'Pakistan'),(1003002,1003,'India'),(1003003,1003,'China'),(1004001,1004,'Open'),(1004002,1004,'In Progress'),(1004003,1004,'In Testing'),(1004004,1004,'Closed'),(1004005,1004,'Reopened'),(1004006,1004,'Dependent'),(1004007,1004,'RnD'),(1005001,1005,'Usman'),(1005002,1005,'Badar'),(1005003,1005,'Sumaira'),(1005004,1005,'Arooj'),(1005005,1005,'Amaar'),(1006001,1006,'Lowest'),(1006002,1006,'Low'),(1006003,1006,'Medium'),(1006004,1006,'High'),(1006005,1006,'Highest'),(1007001,1007,'TextBox'),(1007002,1007,'RadioButton'),(1007003,1007,'CheckBox'),(1007004,1007,'DatePicker'),(1007005,1007,'TextArea'),(1007006,1007,'DropDownList');
/*!40000 ALTER TABLE `enumvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `Id` int NOT NULL,
  `ExpenseTypeId` int DEFAULT NULL,
  `ExpenseDate` datetime DEFAULT NULL,
  `ExpenseTitle` varchar(1000) DEFAULT NULL,
  `ExpenseDetail` varchar(5000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ExpenseTypeId` (`ExpenseTypeId`),
  CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`ExpenseTypeId`) REFERENCES `expensetype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,4,'2022-11-18 19:00:00','Car Hire','Ground Transport','2022-11-02 02:47:30',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,6,'2022-11-29 19:00:00','Car Hire','Ground Transport','2022-11-02 02:50:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,2,'2022-11-23 19:00:00','ABCd','fhgfgh','2022-11-02 03:00:33',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,3,'2022-11-17 19:00:00','ABCd','chgfjh','2022-11-02 03:00:58',0,'0001-01-01 00:00:00',0,_binary '\0'),(5,3,'2022-11-29 19:00:00','ABCdghjgjk','bvhgvjhbgkj','2022-11-02 19:10:23',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,2,'2022-11-17 19:00:00','ABCd','vbjcbakjsnk','2022-11-02 19:37:26',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,2,'2022-11-25 19:00:00','ABCdghjgjk','cvfbfgghf','2022-11-02 20:02:30',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,7,'2022-11-02 18:16:19','Car Hire','Ground Transport','2022-11-02 23:16:33',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensetype`
--

DROP TABLE IF EXISTS `expensetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensetype` (
  `Id` int NOT NULL,
  `Type` varchar(1000) DEFAULT NULL,
  `Comment` varchar(7000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensetype`
--

LOCK TABLES `expensetype` WRITE;
/*!40000 ALTER TABLE `expensetype` DISABLE KEYS */;
INSERT INTO `expensetype` VALUES (2,'Advertising','.....','2022-11-02 02:38:21',0,'0001-01-01 00:00:00',0,_binary ''),(3,'Meals','...','2022-11-02 02:39:07',0,'0001-01-01 00:00:00',0,_binary ''),(4,'Travel',',,,,','2022-11-02 02:47:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(5,'Travel','....','2022-11-02 02:49:03',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,'Travel','....','2022-11-02 02:49:36',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,'Travel','....','2022-11-02 23:10:37',0,'0001-01-01 00:00:00',0,_binary ''),(8,'Stationary','......','2022-11-02 23:11:45',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `expensetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(8000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'Invoice','Desc..','2022-03-09 00:00:00',1,'2022-03-09 00:00:00',1,_binary ''),(2,'Sale Order','Desc..','2022-03-09 00:00:00',1,'2022-03-09 00:00:00',1,_binary ''),(3,'Purchase Order','Des...','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(4,'QTN','Des...','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field` (
  `Id` int NOT NULL,
  `TypeId` int DEFAULT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `IsRequired` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
INSERT INTO `field` VALUES (1,1007001,'First Name',_binary '','2022-11-11 00:31:39',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,1007002,'Gender',_binary '\0','2022-11-11 00:31:56',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,1007001,'First Name',_binary '','2022-11-11 00:33:24',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,1007002,'Gender',_binary '','2022-11-11 00:33:40',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_possible_values`
--

DROP TABLE IF EXISTS `field_possible_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_possible_values` (
  `Id` int NOT NULL,
  `FieldId` int NOT NULL,
  `FieldValue` varchar(4000) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FieldId` (`FieldId`),
  CONSTRAINT `field_possible_values_ibfk_1` FOREIGN KEY (`FieldId`) REFERENCES `field` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_possible_values`
--

LOCK TABLES `field_possible_values` WRITE;
/*!40000 ALTER TABLE `field_possible_values` DISABLE KEYS */;
INSERT INTO `field_possible_values` VALUES (1,4,'Male','2022-11-11 00:33:59',0,'0001-01-01 00:00:00',0,_binary ''),(2,4,'Female','2022-11-11 00:34:04',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `field_possible_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `Id` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Cell` varchar(45) DEFAULT NULL,
  `ServicesId` int DEFAULT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `Comments` longtext,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (1,'Sumaira Ameer','1234567764',1,'binteameer212@gmail.com','.....','2022-11-11 00:29:57',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Sumaira Ameer','1234567764',1,'bintameer212@gmail.com','....','2022-11-11 00:34:32',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_field_data`
--

DROP TABLE IF EXISTS `inquiry_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_field_data` (
  `Id` int NOT NULL,
  `InquiryId` int NOT NULL,
  `FieldName` varchar(4000) DEFAULT NULL,
  `FieldValue` varchar(4000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  KEY `InquiryId` (`InquiryId`),
  CONSTRAINT `inquiry_field_data_ibfk_1` FOREIGN KEY (`InquiryId`) REFERENCES `inquiry` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_field_data`
--

LOCK TABLES `inquiry_field_data` WRITE;
/*!40000 ALTER TABLE `inquiry_field_data` DISABLE KEYS */;
INSERT INTO `inquiry_field_data` VALUES (1,2,'First Name','Sumaira','2022-11-11 09:36:28',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,2,'Gender','Female','2022-11-11 09:36:28',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `inquiry_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `Id` int NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` varchar(8000) DEFAULT NULL,
  `LectureURL` varchar(500) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'OOP(Lecture 1)','Des...','https://www.youtube.com/watch?v=19X-OW1ThPQ&feature=youtu.be','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(2,'OOP (Lecture 2)','Des...','https://www.youtube.com/watch?v=vnL3MNwK6E4','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(3,'OOP(Lecture 3)','Des...','https://www.youtube.com/watch?v=uyfp2hR6Bko','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(4,'asdf','ghk','fgh','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logevent`
--

DROP TABLE IF EXISTS `logevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logevent` (
  `Id` int NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `Action` varchar(1000) DEFAULT NULL,
  `Message` varchar(5000) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `logevent_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logevent`
--

LOCK TABLES `logevent` WRITE;
/*!40000 ALTER TABLE `logevent` DISABLE KEYS */;
INSERT INTO `logevent` VALUES (1,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-25 21:17:48',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','LogOut','Sumaira successfully LogOut','2022-10-25 21:18:07',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','Login','Areeba successfully Login','2022-10-24 21:18:22',0,'0001-01-01 00:00:00',0,_binary '\0'),(4,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','LogOut','Areeba successfully LogOut','2022-10-24 21:18:22',0,'0001-01-01 00:00:00',0,_binary '\0'),(5,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','Login','Areeba successfully Login','2022-10-25 21:21:09',0,'0001-01-01 00:00:00',0,_binary '\0'),(6,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-25 21:27:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(7,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-25 21:30:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(8,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','LogOut','Sumaira successfully LogOut','2022-10-25 21:30:53',0,'0001-01-01 00:00:00',0,_binary '\0'),(9,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-26 17:09:11',0,'0001-01-01 00:00:00',0,_binary '\0'),(10,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','Login','Areeba successfully Login','2022-10-26 18:32:35',0,'0001-01-01 00:00:00',0,_binary '\0'),(12,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-26 18:46:21',0,'0001-01-01 00:00:00',0,_binary '\0'),(13,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','Login','Areeba successfully Login','2022-10-26 18:49:40',0,'0001-01-01 00:00:00',0,_binary '\0'),(14,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-27 21:58:26',0,'0001-01-01 00:00:00',0,_binary '\0'),(15,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-30 19:41:01',0,'0001-01-01 00:00:00',0,_binary '\0'),(16,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-30 19:51:06',0,'0001-01-01 00:00:00',0,_binary '\0'),(17,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','LogOut','Sumaira successfully LogOut','2022-10-30 19:51:26',0,'0001-01-01 00:00:00',0,_binary '\0'),(18,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-10-30 19:51:43',0,'0001-01-01 00:00:00',0,_binary '\0'),(19,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc','Login','Sumaira successfully Login','2022-11-02 23:05:48',0,'0001-01-01 00:00:00',0,_binary '\0');
/*!40000 ALTER TABLE `logevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_log`
--

DROP TABLE IF EXISTS `notification_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_log` (
  `Id` int NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `SMS` varchar(6000) DEFAULT NULL,
  `IsSent` bit(1) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `notification_log_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_log`
--

LOCK TABLES `notification_log` WRITE;
/*!40000 ALTER TABLE `notification_log` DISABLE KEYS */;
INSERT INTO `notification_log` VALUES (1,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','2022-12-01 00:55:12','12345678987','Testing',_binary '\0','2022-12-01 00:55:12',0,'0001-01-01 00:00:00',0,_binary ''),(2,'3b060983-3c96-49e0-a7ea-b63f236241d1','2022-12-01 01:00:36','1234567891','Hi Areeba, A Task with Task Id: 1006 is changed from Status: Open to Status: Closed',_binary '','2022-12-01 01:00:36',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `notification_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationtemplate`
--

DROP TABLE IF EXISTS `notificationtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationtemplate` (
  `Id` int NOT NULL,
  `KeyCode` varchar(100) NOT NULL,
  `TemplateName` varchar(200) DEFAULT NULL,
  `Subject` varchar(200) NOT NULL,
  `Body` varchar(8000) NOT NULL,
  `SMS` varchar(160) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationtemplate`
--

LOCK TABLES `notificationtemplate` WRITE;
/*!40000 ALTER TABLE `notificationtemplate` DISABLE KEYS */;
INSERT INTO `notificationtemplate` VALUES (1,'abc','abc','abc','abc','abc','2022-10-26 00:14:52',0,'0001-01-01 00:00:00',0,_binary '\0'),(2,'hjfsdkbjhkj','fdsjbjjhkj','hdsjhbjhbjbk','sadsfbhjj','dsfbjhbhj','2022-10-26 00:30:04',0,'0001-01-01 00:00:00',0,_binary '\0'),(3,'NotificationToUser_OnTaskCreation','Task Creation Mail','Task Id: #TaskId','Hi #User, A Task with Task Id:#TaskId having priority:#TaskPriority is assigned to you.\nFor more information contact @ #ContactNumber',NULL,'2022-10-26 01:22:47',0,'0001-01-01 00:00:00',0,_binary ''),(4,'NotificationToSupervisor_OnTaskCreation','Task Creation Mail ','Task Id:#TaskId','Hi #DirectSupervisorName , A Task with Task Id:#TaskId is assigned to #User',NULL,'2022-10-26 01:40:45',0,'0001-01-01 00:00:00',0,_binary ''),(5,'NotificationToDirectSupervisor_OnStatusChange','Status Change Mail','Status of TaskId=#TaskId  Updated','Hi #Supervisor, A Task with Task Id: #TaskId is changed from Status: #OldStatus to Status: #NewStatus',NULL,'2022-10-26 11:51:55',0,'0001-01-01 00:00:00',0,_binary ''),(6,'NotificationToUser_OnStatusChange','Status Change Mail','Status of TaskId=#TaskId  Updated','Hi #User, A Task with Task Id: #TaskId is changed from Status: #OldStatus to Status: #NewStatus',NULL,'2022-10-26 18:15:40',0,'0001-01-01 00:00:00',0,_binary ''),(7,'NotificationToUser_OnTaskComments','Task Comment Mail','Comment  on Task Id: #TaskId','Hi #User,\n #SenderName  has commented this on your task:\n\"#Comment\"',NULL,'2022-11-06 19:16:35',0,'0001-01-01 00:00:00',0,_binary ''),(8,'NotificationToDirectSupervisor_OnTaskComments','Task Comment Mail','Comment  on Task Id: #TaskId','Hi #DirectSupervisor,\n #SenderName  has commented this on the task:\n\"#Comment\"',NULL,'2022-11-06 19:21:06',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `notificationtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `Id` int NOT NULL,
  `FeatureId` int DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `RoleId` varchar(255) DEFAULT NULL,
  `PermissionValue` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `permissions` (`FeatureId`),
  KEY `PermissionValue` (`PermissionValue`),
  KEY `UserId` (`UserId`),
  KEY `RoleId` (`RoleId`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`FeatureId`) REFERENCES `feature` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`PermissionValue`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permissions_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permissions_ibfk_4` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (5,1,NULL,'a67febed-dc5d-4253-999e-f3db0f0687f2',1000001,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(6,2,NULL,'a67febed-dc5d-4253-999e-f3db0f0687f2',1000002,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(7,3,NULL,'a67febed-dc5d-4253-999e-f3db0f0687f2',1000001,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(8,4,NULL,'a67febed-dc5d-4253-999e-f3db0f0687f2',1000003,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(9,1,NULL,'1f7dcdd7-f3af-4685-bb9c-3860b5e4c305',1000001,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(10,2,NULL,'1f7dcdd7-f3af-4685-bb9c-3860b5e4c305',1000002,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(11,3,NULL,'1f7dcdd7-f3af-4685-bb9c-3860b5e4c305',1000003,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(12,4,NULL,'1f7dcdd7-f3af-4685-bb9c-3860b5e4c305',1000002,'0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `Id` int NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Content` varchar(8000) NOT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedById` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Business Services','<p><span style=\"color: rgb(32, 33, 36);\">Hi #User, Thank you for your interest in our products and services. I have attached a description of all our products and services. In case of further inquiries, do not hesitate to let me know.</span></p>','2022-10-27 10:18:04',0,'0001-01-01 00:00:00',0,1),(2,'Computer Courses','<h3>Hi #User,</h3><h3><span class=\"ql-font-serif\" style=\"color: rgb(32, 33, 36);\">It is pleasure to respond to your inquiry about Computer Courses. Thank you for reaching out and expressing interest in our services.</span></h3><h3>We are providing computer courses in the following Languages:</h3><ul><li>C</li><li>Java&nbsp;</li><li>Python</li><li>C++</li><li>C#&nbsp;</li><li>Visual Basic&nbsp;</li><li>JavaScript</li><li>PHP</li><li>SQL</li><li>Assembly language</li><li>R</li><li>Groovy&nbsp;</li></ul>','2022-11-04 21:59:23',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Id` int NOT NULL,
  `StudentName` varchar(100) NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `CNIC` varchar(15) NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `CellNo` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `WhatsApp` varchar(45) NOT NULL,
  `GuardianName` varchar(45) NOT NULL,
  `GuardianCell` varchar(45) NOT NULL,
  `GuardianRelation` varchar(45) NOT NULL,
  `GuardianWhatsApp` varchar(45) NOT NULL,
  `GuardianEmail` varchar(45) NOT NULL,
  `GuardianOccupation` varchar(45) DEFAULT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'AreebaFatimah','f','3660366387328','0001-01-01 00:00:00','03001234567','arooj@gmail.com','03001234567','QRST','03001234567','Mother','01234567891','abc@gamil.com',NULL,'Remarks...','Areeba','S3ameer@','2022-10-31 21:08:17',0,'0001-01-01 00:00:00',0,_binary ''),(2,'Sumaira Ameer','f','3660366387328','0001-01-01 00:00:00','06876875453','sumaira@gmail.com','03007899978','XYZ','03001234567','Father','01786567891','xyz@gamil.com',NULL,'Remarks...','Sumaira','S3ameer@','2022-10-31 20:35:46',0,'0001-01-01 00:00:00',0,_binary ''),(3,'Ifrah Sulman','\0','3660366387328','0001-01-01 00:00:00','03001234567','Ifrah@gmail.com','03001234567','Sulman','03001234567','Father','01234567891','abc@gamil.com',NULL,NULL,'Ifrah','S3ameer@','2022-11-03 20:31:53',0,'0001-01-01 00:00:00',0,_binary ''),(4,'Humaira Hameed','\0','3660366387328','0001-01-01 00:00:00','03001234567','bintameer212@gmail.com','03001234567','Hameed','03001234567','Father','01234567891','abc@gamil.com',NULL,NULL,'Humaira','S3ameer@','2022-10-31 21:55:05',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlecture`
--

DROP TABLE IF EXISTS `studentlecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentlecture` (
  `Id` int NOT NULL,
  `StudentId` int NOT NULL,
  `LectureId` int NOT NULL,
  `AssignedOn` datetime NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`StudentId`,`LectureId`),
  KEY `LectureId` (`LectureId`),
  CONSTRAINT `studentlecture_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `studentlecture_ibfk_2` FOREIGN KEY (`LectureId`) REFERENCES `lecture` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlecture`
--

LOCK TABLES `studentlecture` WRITE;
/*!40000 ALTER TABLE `studentlecture` DISABLE KEYS */;
INSERT INTO `studentlecture` VALUES (1,1,2,'2022-01-12 07:36:45','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(4,1,3,'2022-11-04 20:51:10','2022-11-05 01:51:45',0,'0001-01-01 00:00:00',0,_binary ''),(3,2,1,'2022-01-14 09:56:51','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary ''),(2,2,3,'2022-01-12 07:37:24','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,_binary '');
/*!40000 ALTER TABLE `studentlecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `Id` int NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `ModuleId` int DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `PriorityId` int DEFAULT NULL,
  `Title` varchar(300) NOT NULL,
  `SP` int DEFAULT NULL,
  `Description` longtext,
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
INSERT INTO `task` VALUES (1001,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc',0,1004004,1006002,'NotificationToUser_OnstatusChange',2,'<p>An Email is sent to the User when DirectSupervisor changes the task status.</p>','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,1),(1002,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc',0,1004007,1006002,'WhatsApp Notification',1,'\n','2022-12-02 02:03:40',0,'0001-01-01 00:00:00',0,1),(1003,'e9440eb2-51a2-4e95-ac65-5c939d25e0dc',0,1004004,1006003,'Manage Services',4,'<ul><li>Define Service Table with fields (Id, Name, Content)</li><li>Define the Services of the \"Service Page\"</li><li>Add Services Field in Inquiry Page as a dropdown list.</li><li>Send Email notification to the User about the services when an inquiry is added.</li></ul>','0001-01-01 00:00:00',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskcomment`
--

DROP TABLE IF EXISTS `taskcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskcomment` (
  `Id` int NOT NULL,
  `TaskId` int NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `Comment` varchar(500) NOT NULL,
  `Time` datetime NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ModifiedById` int DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TaskId_idx` (`TaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskcomment`
--

LOCK TABLES `taskcomment` WRITE;
/*!40000 ALTER TABLE `taskcomment` DISABLE KEYS */;
INSERT INTO `taskcomment` VALUES (1,1003,'2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13','The action column of the Item List should have three actions (\'Delete\',\'View\', and \'Edit\')','2022-11-06 16:34:02','2022-11-06 16:34:02',0,'2022-11-06 16:34:02',0,1),(2,1003,'3b060983-3c96-49e0-a7ea-b63f236241d1','Hi its for just testing...','0001-01-01 00:00:00','2022-12-02 01:25:37',0,'0001-01-01 00:00:00',0,1),(3,1003,'3b060983-3c96-49e0-a7ea-b63f236241d1','hi','0001-01-01 00:00:00','2022-12-03 21:50:38',0,'0001-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `taskcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_attendance`
--

DROP TABLE IF EXISTS `vw_attendance`;
/*!50001 DROP VIEW IF EXISTS `vw_attendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_attendance` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `UserName`,
 1 AS `InTime`,
 1 AS `OutTime`,
 1 AS `WorkingHours`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_expense`
--

DROP TABLE IF EXISTS `vw_expense`;
/*!50001 DROP VIEW IF EXISTS `vw_expense`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_expense` AS SELECT 
 1 AS `Id`,
 1 AS `ExpenseDate`,
 1 AS `ExpenseTitle`,
 1 AS `ExpenseDetail`,
 1 AS `ExpenseTypeId`,
 1 AS `ExpenseType`,
 1 AS `ExpenseComment`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_field`
--

DROP TABLE IF EXISTS `vw_field`;
/*!50001 DROP VIEW IF EXISTS `vw_field`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_field` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `TypeId`,
 1 AS `Type`,
 1 AS `CreatedOn`,
 1 AS `IsRequired`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_fpvalue`
--

DROP TABLE IF EXISTS `vw_fpvalue`;
/*!50001 DROP VIEW IF EXISTS `vw_fpvalue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_fpvalue` AS SELECT 
 1 AS `Id`,
 1 AS `FieldValue`,
 1 AS `FieldId`,
 1 AS `FieldName`,
 1 AS `TypeId`,
 1 AS `Type`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_inquiry`
--

DROP TABLE IF EXISTS `vw_inquiry`;
/*!50001 DROP VIEW IF EXISTS `vw_inquiry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inquiry` AS SELECT 
 1 AS `Id`,
 1 AS `Name`,
 1 AS `Cell`,
 1 AS `Email`,
 1 AS `ServiceName`,
 1 AS `Content`,
 1 AS `ServicesId`,
 1 AS `Comments`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_inquiryfielddata`
--

DROP TABLE IF EXISTS `vw_inquiryfielddata`;
/*!50001 DROP VIEW IF EXISTS `vw_inquiryfielddata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inquiryfielddata` AS SELECT 
 1 AS `Id`,
 1 AS `FieldName`,
 1 AS `FieldValue`,
 1 AS `InquiryId`,
 1 AS `Name`,
 1 AS `Email`,
 1 AS `Cell`,
 1 AS `Comment`,
 1 AS `ServicesId`,
 1 AS `ServiceName`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_logevent`
--

DROP TABLE IF EXISTS `vw_logevent`;
/*!50001 DROP VIEW IF EXISTS `vw_logevent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_logevent` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `UserName`,
 1 AS `Action`,
 1 AS `Message`,
 1 AS `CreatedOn`,
 1 AS `CreatedById`,
 1 AS `ModifiedOn`,
 1 AS `ModifiedById`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_permission`
--

DROP TABLE IF EXISTS `vw_permission`;
/*!50001 DROP VIEW IF EXISTS `vw_permission`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_permission` AS SELECT 
 1 AS `Id`,
 1 AS `FeatureId`,
 1 AS `Feature`,
 1 AS `UserId`,
 1 AS `User`,
 1 AS `RoleId`,
 1 AS `Role`,
 1 AS `PermissionValue`,
 1 AS `Permission`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_studentlectures`
--

DROP TABLE IF EXISTS `vw_studentlectures`;
/*!50001 DROP VIEW IF EXISTS `vw_studentlectures`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_studentlectures` AS SELECT 
 1 AS `Id`,
 1 AS `StudentId`,
 1 AS `Student`,
 1 AS `UserName`,
 1 AS `Password`,
 1 AS `LectureId`,
 1 AS `Title`,
 1 AS `Lecture`,
 1 AS `Description`,
 1 AS `AssignedOn`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_students`
--

DROP TABLE IF EXISTS `vw_students`;
/*!50001 DROP VIEW IF EXISTS `vw_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_students` AS SELECT 
 1 AS `Id`,
 1 AS `StudentName`,
 1 AS `Gender`,
 1 AS `CNIC`,
 1 AS `Email`,
 1 AS `CellNo`,
 1 AS `WhatsApp`,
 1 AS `GuardianName`,
 1 AS `GuardianCell`,
 1 AS `GuardianRelation`,
 1 AS `GuardianWhatsApp`,
 1 AS `GuardianEmail`,
 1 AS `Remarks`,
 1 AS `UserName`,
 1 AS `Password`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

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
 1 AS `UserMail`,
 1 AS `DirectSupervisorId`,
 1 AS `DirectSupervisorPhoneNumber`,
 1 AS `DirectSupervisorName`,
 1 AS `DirectSupervisorEmail`,
 1 AS `UserPhoneNumber`,
 1 AS `StatusId`,
 1 AS `TaskStatus`,
 1 AS `PriorityId`,
 1 AS `TaskPriority`,
 1 AS `Title`,
 1 AS `SP`,
 1 AS `Description`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_taskcomment`
--

DROP TABLE IF EXISTS `vw_taskcomment`;
/*!50001 DROP VIEW IF EXISTS `vw_taskcomment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_taskcomment` AS SELECT 
 1 AS `Id`,
 1 AS `TaskId`,
 1 AS `TaskTitle`,
 1 AS `Comment`,
 1 AS `User`,
 1 AS `Datetime`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_user`
--

DROP TABLE IF EXISTS `vw_user`;
/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_user` AS SELECT 
 1 AS `Id`,
 1 AS `UserName`,
 1 AS `Email`,
 1 AS `PhoneNumber`,
 1 AS `DirectSupervisorId`,
 1 AS `DirectSupervisorName`,
 1 AS `DirectSupervisorEmail`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_userrole`
--

DROP TABLE IF EXISTS `vw_userrole`;
/*!50001 DROP VIEW IF EXISTS `vw_userrole`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_userrole` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `User`,
 1 AS `RoleId`,
 1 AS `Role`,
 1 AS `IsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'qafasttrack'
--
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEnumValues`(
        in enumTypeId int
        )
BEGIN
	select * from enumvalue where enumvalue.EnumTypeId=enumTypeId;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAttachments`(  
         in id int,
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageAttendance`(in id int,
        in userId VARCHAR(255),
        in inTime datetime,
         in outTime datetime,
        in workingHours varchar(500),
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
    
           insert into attendance (Id,UserId,InTime,OutTime,WorkingHours, CreatedOn, CreatedById, 
           ModifiedOn, ModifiedById, IsActive )  values 
           (id,userId,inTime,outTime,workingHours, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
     
          update attendance set  
						  UserId= userId,
                          InTime= inTime,
                          OutTime=outTime,
                          WorkingHours=workingHours,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where attendance.Id =id;
      end if;
      
  
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageCompany`(
        in id int,
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageEnumValue`(
in id int,
in enumTypeId int,
in value varchar(255)
)
BEGIN
insert into enumvalue (Id, EnumTypeId, Value) values(id, enumTypeId,value);
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
        in DBoperation varchar(50)
        )
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
        in DBoperation varchar(50)
        )
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
        in DBoperation varchar(50)
        )
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageFieldPossibleValues`( 
         in id int,
        in fieldId int,
        in fieldValue varchar(4000),
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
    
           insert into inquiry (Id,Name,Cell,ServicesId,Email,Comments, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,name,cell,servicesId,email,comments, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update inquiry set 
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
             where inquiry.Id =id;
   end if;
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageLecture`( in id int,
        in title varchar(100),
        in description varchar(8000),
        in lectureURL varchar(500),
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
    
           insert into lecture (Id,Title,Description,LectureURL, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,title,description,lectureURL, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update lecture set 
                          Title=title,
                          Description=description,
                          LectureURL=lectureURL,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where lecture.Id =id;
   end if;
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageNotificationLog`(   in id int,
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
        in filter varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageNotificationTemplate`(  
         in id int,
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagePermissions`( 
        in id int,
        in featureId int,
        in roleId VARCHAR(255),
        in userId VARCHAR(255),
        in permissionValue int,
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageServices`(
        in id int,
        in name varchar(200),
        in content varchar(8000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in dBoperation varchar(50)
        )
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
        in DBoperation varchar(50)
        )
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
        in DBoperation varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTask`(
        in id int,
        in userId varchar(255),
        in moduleId int,
        in statusId int,
        in priorityId int,
        in title varchar(300),
        in sP int,
        in description longtext,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50)
        )
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageTaskComment`(
        in id int,
        in taskId int,
        in userId varchar(255),
        in comment varchar(500),
        in time datetime,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50)
        )
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
     set @querystr ='SELECT * 
			FROM
			vw_attendance  ';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchFieldPossibleValues`(
in whereClause varchar(5000))
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
     set @querystr ='SELECT * 
			FROM
			vw_inquiry  ';
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
     set @querystr ='SELECT * 
			FROM
			lecture  ';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStudent`(in whereClause varchar(5000))
BEGIN
     set @querystr ='select * 
			FROM
			`vw_students`  ';
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTaskComments`(
in whereClause varchar(5000))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTasks`(
in whereClause varchar(5000))
BEGIN

     set @querystr ='SELECT * 
			FROM
			vw_task ';
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
-- Final view structure for view `vw_attendance`
--

/*!50001 DROP VIEW IF EXISTS `vw_attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_attendance` AS select `atnd`.`Id` AS `Id`,`atnd`.`UserId` AS `UserId`,`user`.`UserName` AS `UserName`,`atnd`.`InTime` AS `InTime`,`atnd`.`OutTime` AS `OutTime`,`atnd`.`WorkingHours` AS `WorkingHours`,`atnd`.`CreatedOn` AS `CreatedOn`,`atnd`.`CreatedById` AS `CreatedById`,`atnd`.`ModifiedOn` AS `ModifiedOn`,`atnd`.`ModifiedById` AS `ModifiedById`,`atnd`.`IsActive` AS `IsActive` from (`attendance` `atnd` join `aspnetusers` `user` on((`atnd`.`UserId` = `user`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_expense`
--

/*!50001 DROP VIEW IF EXISTS `vw_expense`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_expense` AS select `expense`.`Id` AS `Id`,`expense`.`ExpenseDate` AS `ExpenseDate`,`expense`.`ExpenseTitle` AS `ExpenseTitle`,`expense`.`ExpenseDetail` AS `ExpenseDetail`,`expense`.`ExpenseTypeId` AS `ExpenseTypeId`,`ext`.`Type` AS `ExpenseType`,`ext`.`Comment` AS `ExpenseComment`,`expense`.`CreatedOn` AS `CreatedOn`,`expense`.`CreatedById` AS `CreatedById`,`expense`.`ModifiedOn` AS `ModifiedOn`,`expense`.`ModifiedById` AS `ModifiedById`,`expense`.`IsActive` AS `IsActive` from (`expense` join `expensetype` `ext` on((`ext`.`Id` = `expense`.`ExpenseTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_field`
--

/*!50001 DROP VIEW IF EXISTS `vw_field`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_field` AS select `field`.`Id` AS `Id`,`field`.`Title` AS `Title`,`field`.`TypeId` AS `TypeId`,`ev`.`Value` AS `Type`,`field`.`CreatedOn` AS `CreatedOn`,`field`.`IsRequired` AS `IsRequired`,`field`.`CreatedById` AS `CreatedById`,`field`.`ModifiedOn` AS `ModifiedOn`,`field`.`ModifiedById` AS `ModifiedById`,`field`.`IsActive` AS `IsActive` from (`field` join `enumvalue` `ev` on((`ev`.`Id` = `field`.`TypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_fpvalue`
--

/*!50001 DROP VIEW IF EXISTS `vw_fpvalue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_fpvalue` AS select `field_possible_values`.`Id` AS `Id`,`field_possible_values`.`FieldValue` AS `FieldValue`,`field_possible_values`.`FieldId` AS `FieldId`,`fld`.`Title` AS `FieldName`,`fld`.`TypeId` AS `TypeId`,`ev`.`Value` AS `Type`,`field_possible_values`.`CreatedOn` AS `CreatedOn`,`field_possible_values`.`CreatedById` AS `CreatedById`,`field_possible_values`.`ModifiedOn` AS `ModifiedOn`,`field_possible_values`.`ModifiedById` AS `ModifiedById`,`field_possible_values`.`IsActive` AS `IsActive` from ((`field_possible_values` join `field` `fld` on((`fld`.`Id` = `field_possible_values`.`FieldId`))) join `enumvalue` `ev` on((`ev`.`Id` = `fld`.`TypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_inquiry`
--

/*!50001 DROP VIEW IF EXISTS `vw_inquiry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inquiry` AS select `inquiry`.`Id` AS `Id`,`inquiry`.`Name` AS `Name`,`inquiry`.`Cell` AS `Cell`,`inquiry`.`Email` AS `Email`,`srvc`.`Name` AS `ServiceName`,`srvc`.`Content` AS `Content`,`inquiry`.`ServicesId` AS `ServicesId`,`inquiry`.`Comments` AS `Comments`,`inquiry`.`CreatedOn` AS `CreatedOn`,`inquiry`.`CreatedById` AS `CreatedById`,`inquiry`.`ModifiedOn` AS `ModifiedOn`,`inquiry`.`ModifiedById` AS `ModifiedById`,`inquiry`.`IsActive` AS `IsActive` from (`inquiry` join `services` `srvc` on((`srvc`.`Id` = `inquiry`.`ServicesId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_inquiryfielddata`
--

/*!50001 DROP VIEW IF EXISTS `vw_inquiryfielddata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inquiryfielddata` AS select `inquiry_field_data`.`Id` AS `Id`,`inquiry_field_data`.`FieldName` AS `FieldName`,`inquiry_field_data`.`FieldValue` AS `FieldValue`,`inquiry_field_data`.`InquiryId` AS `InquiryId`,`inq`.`Name` AS `Name`,`inq`.`Email` AS `Email`,`inq`.`Cell` AS `Cell`,`inq`.`Comments` AS `Comment`,`inq`.`ServicesId` AS `ServicesId`,`svc`.`Name` AS `ServiceName`,`inquiry_field_data`.`CreatedOn` AS `CreatedOn`,`inquiry_field_data`.`CreatedById` AS `CreatedById`,`inquiry_field_data`.`ModifiedOn` AS `ModifiedOn`,`inquiry_field_data`.`ModifiedById` AS `ModifiedById`,`inquiry_field_data`.`IsActive` AS `IsActive` from ((`inquiry_field_data` join `inquiry` `inq` on((`inq`.`Id` = `inquiry_field_data`.`InquiryId`))) join `services` `svc` on((`inq`.`ServicesId` = `svc`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_logevent`
--

/*!50001 DROP VIEW IF EXISTS `vw_logevent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_logevent` AS select `levnt`.`Id` AS `Id`,`levnt`.`UserId` AS `UserId`,`user`.`UserName` AS `UserName`,`levnt`.`Action` AS `Action`,`levnt`.`Message` AS `Message`,`levnt`.`CreatedOn` AS `CreatedOn`,`levnt`.`CreatedById` AS `CreatedById`,`levnt`.`ModifiedOn` AS `ModifiedOn`,`levnt`.`ModifiedById` AS `ModifiedById`,`levnt`.`IsActive` AS `IsActive` from (`logevent` `levnt` join `aspnetusers` `user` on((`levnt`.`UserId` = `user`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_permission`
--

/*!50001 DROP VIEW IF EXISTS `vw_permission`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_permission` AS select `p`.`Id` AS `Id`,`p`.`FeatureId` AS `FeatureId`,`fea`.`Name` AS `Feature`,`p`.`UserId` AS `UserId`,`us`.`UserName` AS `User`,`p`.`RoleId` AS `RoleId`,`ro`.`Name` AS `Role`,`p`.`PermissionValue` AS `PermissionValue`,`ev`.`Value` AS `Permission`,`p`.`IsActive` AS `IsActive` from ((((`permissions` `p` join `enumvalue` `ev` on((`ev`.`Id` = `p`.`PermissionValue`))) join `feature` `fea` on((`fea`.`Id` = `p`.`FeatureId`))) left join `aspnetusers` `us` on((`p`.`UserId` = `us`.`Id`))) left join `aspnetroles` `ro` on((`p`.`RoleId` = `ro`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_studentlectures`
--

/*!50001 DROP VIEW IF EXISTS `vw_studentlectures`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_studentlectures` AS select `stl`.`Id` AS `Id`,`stl`.`StudentId` AS `StudentId`,`st`.`StudentName` AS `Student`,`st`.`UserName` AS `UserName`,`st`.`Password` AS `Password`,`stl`.`LectureId` AS `LectureId`,`le`.`Title` AS `Title`,`le`.`LectureURL` AS `Lecture`,`le`.`Description` AS `Description`,`stl`.`AssignedOn` AS `AssignedOn`,`stl`.`IsActive` AS `IsActive` from ((`studentlecture` `stl` join `student` `st` on((`stl`.`StudentId` = `st`.`Id`))) join `lecture` `le` on((`stl`.`LectureId` = `le`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_students`
--

/*!50001 DROP VIEW IF EXISTS `vw_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_students` AS select `st`.`Id` AS `Id`,`st`.`StudentName` AS `StudentName`,`st`.`Gender` AS `Gender`,`st`.`CNIC` AS `CNIC`,`st`.`Email` AS `Email`,`st`.`CellNo` AS `CellNo`,`st`.`WhatsApp` AS `WhatsApp`,`st`.`GuardianName` AS `GuardianName`,`st`.`GuardianCell` AS `GuardianCell`,`st`.`GuardianRelation` AS `GuardianRelation`,`st`.`GuardianWhatsApp` AS `GuardianWhatsApp`,`st`.`GuardianEmail` AS `GuardianEmail`,`st`.`Remarks` AS `Remarks`,`st`.`UserName` AS `UserName`,`st`.`Password` AS `Password`,`st`.`IsActive` AS `IsActive` from `student` `st` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `vw_task` AS select `tsk`.`Id` AS `Id`,`tsk`.`UserId` AS `UserId`,`user`.`UserName` AS `User`,`user`.`Email` AS `UserMail`,`user`.`DirectSupervisorId` AS `DirectSupervisorId`,`user`.`PhoneNumber` AS `DirectSupervisorPhoneNumber`,`us`.`UserName` AS `DirectSupervisorName`,`us`.`Email` AS `DirectSupervisorEmail`,`us`.`PhoneNumber` AS `UserPhoneNumber`,`tsk`.`StatusId` AS `StatusId`,`env2`.`Value` AS `TaskStatus`,`tsk`.`PriorityId` AS `PriorityId`,`env1`.`Value` AS `TaskPriority`,`tsk`.`Title` AS `Title`,`tsk`.`SP` AS `SP`,`tsk`.`Description` AS `Description`,`tsk`.`IsActive` AS `IsActive` from ((((`task` `tsk` join `enumvalue` `env2` on((`tsk`.`StatusId` = `env2`.`Id`))) join `enumvalue` `env1` on((`tsk`.`PriorityId` = `env1`.`Id`))) join `aspnetusers` `user` on((`tsk`.`UserId` = `user`.`Id`))) join `aspnetusers` `us` on((`user`.`DirectSupervisorId` = `us`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_taskcomment`
--

/*!50001 DROP VIEW IF EXISTS `vw_taskcomment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_taskcomment` AS select `tsk`.`Id` AS `Id`,`tsk`.`TaskId` AS `TaskId`,`tk`.`Title` AS `TaskTitle`,`tsk`.`Comment` AS `Comment`,`us`.`UserName` AS `User`,`tsk`.`Time` AS `Datetime`,`tsk`.`IsActive` AS `IsActive` from ((`taskcomment` `tsk` join `aspnetusers` `us` on((`tsk`.`UserId` = `us`.`Id`))) join `task` `tk` on((`tsk`.`TaskId` = `tk`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_user`
--

/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_user` AS select `user`.`Id` AS `Id`,`user`.`UserName` AS `UserName`,`user`.`Email` AS `Email`,`user`.`PhoneNumber` AS `PhoneNumber`,`user`.`DirectSupervisorId` AS `DirectSupervisorId`,`us`.`UserName` AS `DirectSupervisorName`,`us`.`Email` AS `DirectSupervisorEmail` from (`aspnetusers` `user` join `aspnetusers` `us` on((`user`.`DirectSupervisorId` = `us`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_userrole`
--

/*!50001 DROP VIEW IF EXISTS `vw_userrole`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_userrole` AS select 1 AS `Id`,1 AS `UserId`,1 AS `User`,1 AS `RoleId`,1 AS `Role`,1 AS `IsActive` */;
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

-- Dump completed on 2022-12-05 11:56:08
