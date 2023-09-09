/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : microerp

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 09/09/2023 15:12:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20220304111006_Initials', '6.0.2');

-- ----------------------------
-- Table structure for aspnetroleclaims
-- ----------------------------
DROP TABLE IF EXISTS `aspnetroleclaims`;
CREATE TABLE `aspnetroleclaims`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AspNetRoleClaims_RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetroleclaims
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetroles
-- ----------------------------
DROP TABLE IF EXISTS `aspnetroles`;
CREATE TABLE `aspnetroles`  (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `RoleNameIndex`(`NormalizedName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetroles
-- ----------------------------
INSERT INTO `aspnetroles` VALUES ('1f7dcdd7-f3af-4685-bb9c-3860b5e4c305', 'Manager', 'MANAGER', 'bf5023a8-8724-4acb-acf9-b6ea02792aa2');
INSERT INTO `aspnetroles` VALUES ('2d75f82f-de81-487f-adf9-732a1a81826b', 'SE', 'SE', '0f58f269-d49e-483e-a680-0330c824c206');
INSERT INTO `aspnetroles` VALUES ('a67febed-dc5d-4253-999e-f3db0f0687f2', 'Admin', 'ADMIN', 'dba878b4-dc0a-4e2a-a9c5-f9a9d21f36e4');
INSERT INTO `aspnetroles` VALUES ('b7a210ac-fcf6-438b-bb65-59a035ba84a6', 'JSE', 'JSE', '89f6322c-29ef-44e3-9300-28c05157e645');
INSERT INTO `aspnetroles` VALUES ('eec2d7a0-1e7f-4932-8de6-d34080d038e5', 'PSE', 'PSE', '84a174a2-363e-45c1-a026-ea7ff6c11a23');

-- ----------------------------
-- Table structure for aspnetuserclaims
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserclaims`;
CREATE TABLE `aspnetuserclaims`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AspNetUserClaims_UserId`(`UserId`) USING BTREE,
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetuserclaims
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserlogins
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserlogins`;
CREATE TABLE `aspnetuserlogins`  (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`, `ProviderKey`) USING BTREE,
  INDEX `IX_AspNetUserLogins_UserId`(`UserId`) USING BTREE,
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetuserlogins
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserroles
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserroles`;
CREATE TABLE `aspnetuserroles`  (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`, `RoleId`) USING BTREE,
  INDEX `IX_AspNetUserRoles_RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetuserroles
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetusers
-- ----------------------------
DROP TABLE IF EXISTS `aspnetusers`;
CREATE TABLE `aspnetusers`  (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FirstName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) NULL DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `DirectSupervisorId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DirectSupervisorName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `UserNameIndex`(`NormalizedUserName`) USING BTREE,
  INDEX `EmailIndex`(`NormalizedEmail`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetusers
-- ----------------------------
INSERT INTO `aspnetusers` VALUES ('0608d41e-d78f-43f0-b90d-f01f0be913a4', NULL, NULL, 'Saira', 'SAIRA', 'abc@gmail.com', 'ABC@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEBGvj3sUeAj4WTzca96Tf9lqen4N4h4ro6Xn/jf5yyHSn6BoDhxx3rPe+Oe9HnWkkw==', 'NSTDT2Z4AAGYYYIMYZPXST5UIXSS3ENE', 'f4175d48-185d-4f8b-b5df-2020f2351d54', '12345678987', 0, 0, NULL, 1, 0, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', NULL);
INSERT INTO `aspnetusers` VALUES ('1508c87f-0d26-4ce6-95ce-b78a2903bd15', NULL, NULL, 'Kashaf', 'KASHAF', 'kashafsarwar23@gmail.com', 'KASHAFSARWAR23@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEFlv8ksEGVv747BfNGVKkDitwI0COt8tcElnSV4BILmpZiz78E6hHm5MBAxjmBU3ug==', '2RJI3UZRQIR5P4XUHYP6VZIMAKU7NLV5', 'd5fe8d7e-0411-4b84-bdfa-3a002348faf9', '0309149130', 0, 0, NULL, 1, 0, '9edacd18-a5a6-4e62-86ed-18b7114f5454', NULL);
INSERT INTO `aspnetusers` VALUES ('2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', NULL, NULL, 'Areeba', 'AREEBA', 'sumairaameer212@gmail.com', 'SUMAIRAAMEER212@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEL4tPOtra4W9MrXwcYXXVGTBP89GRlvwGviTfyBiHZ2tnKlH6gPnYF99YhE1LAywfA==', '5HZPQMNFVZNDAHGCY5QR7275MDCEMKKU', '11da1ee2-1de9-468b-b100-9f54eb77ed48', '1234567891', 0, 0, NULL, 1, 0, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', NULL);
INSERT INTO `aspnetusers` VALUES ('3b060983-3c96-49e0-a7ea-b63f236241d1', NULL, NULL, 'Ifrah', 'IFRAH', 'abc@gmail.com', 'ABC@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEE0H9OobbCj6f9olqWDkKeor6v1wOH04UQ9vm3wBSeH8o7C0y82ZoGQTFtR/5y0mew==', 'DK27LWCZZRVBWGMBMKZWUIQETVYA2WWI', '026d1d63-74a1-4f82-9362-dd55246f2d8c', '12345678987', 0, 0, NULL, 1, 0, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', NULL);
INSERT INTO `aspnetusers` VALUES ('52434e58-713d-4cb7-a3d9-3b14f5f3fe32', NULL, NULL, 'Humaira', 'HUMAIRA', 'bintameer212@gmail.com', 'BINTAMEER212@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEELFre4B1ZDY1hzWKTULaqcUz1+6MvBKUKSx6P3pyHxVvPMN/7wic9XtJRvZQSFAPg==', 'G2UING4DRKSAGRJJRFP3ICOJA5UFBTVG', 'c37940fd-4997-4055-88e8-f3dc0f23874e', '03001234567', 0, 0, NULL, 1, 0, NULL, NULL);
INSERT INTO `aspnetusers` VALUES ('5298705a-24e7-417f-a671-dfcc033b636a', NULL, NULL, 'Annie', 'ANNIE', 'qurratulainzaheer03@gmail.com', 'QURRATULAINZAHEER03@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAECtKTprnZfO3c4cLMtiAQ9yqKJ3q4rmm+gztOq+hYFO7Mw9EZHjYzCClodbQNEmKsw==', 'UELO4XMB5I6ZOQHHAITU3LNZFBPKP6NB', '059b9eb9-7682-47b1-95af-6a2dc1e5af08', '03415423695', 0, 0, NULL, 1, 0, '9edacd18-a5a6-4e62-86ed-18b7114f5454', NULL);
INSERT INTO `aspnetusers` VALUES ('82c43e6d-05d5-4423-a4cd-91b2df9f7f13', NULL, NULL, 'warda', 'WARDA', 'abc@gmail.com', 'ABC@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEARW7OY+8rOPlnCTcV2swTrsr+Kx+KdxxL4k2+d8REM84yEenhDOfoN4HMNK6YyKUg==', 'WQOKUXVAOKUDTERDCWFEIOQU6XFXGASR', '9a0161ae-fe4a-470b-8548-4844badb8b82', '123456', 0, 0, NULL, 1, 0, NULL, NULL);
INSERT INTO `aspnetusers` VALUES ('9edacd18-a5a6-4e62-86ed-18b7114f5454', NULL, NULL, 'Badar', 'BADAR', 'zaman.badar@gmail.com', 'ZAMAN.BADAR@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEMKzcLonBRGlVD7uo7fUv/cjmySbdSdoc0nXiaYnHauNjBpevNdXBypTRMNaUUtxrg==', 'QK5DXL7OSFCSRMB536QONNESAG2SRRPJ', '0e841a57-b2d5-4c39-8fb7-2b94d9c8292d', '0323402720', 0, 0, NULL, 1, 0, NULL, NULL);
INSERT INTO `aspnetusers` VALUES ('af7f5a56-46cb-4e76-87f3-202ce9032607', NULL, NULL, 'Zunaira', 'ZUNAIRA', 'abc@gmail.com', 'ABC@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEIpibOD8qtoQOb5DfH5+cPJD/k6HhFEOVzAly0vW7q88WEBvny9r+9bZKPx3dSYzuQ==', '2ONKDMZ3GGZ3XTH3JKMW25POZRVNQZYR', '5eda2518-fbdb-4c33-a534-7d22b274896c', '12345678987', 0, 0, NULL, 1, 0, NULL, NULL);
INSERT INTO `aspnetusers` VALUES ('dcf26a59-e1c7-42d8-95a3-b51a10ae03cb', NULL, NULL, 'Sania', 'SANIA', 'saniasaaeed@gmail.com', 'SANIASAAEED@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEL173o0ND/LgOqMT4BTEVESHeR2fzyoF9ZbZtJNDbk0Qz464eaXHYP4406zIVuF9jg==', 'LXBN4UBLQORHVVWSUPGG5I3UIQWCXKCP', '1b283250-4660-47dd-9ac3-1fd2faf306dd', '03147083354', 0, 0, NULL, 1, 0, '9edacd18-a5a6-4e62-86ed-18b7114f5454', NULL);
INSERT INTO `aspnetusers` VALUES ('e9440eb2-51a2-4e95-ac65-5c939d25e0dc', NULL, NULL, 'Sumaira', 'SUMAIRA', 'bintameer212@gmail.com', 'BINTAMEER212@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEFRXp4onVV1WXox2FcMrg6Y8qsS6B4bcuQk6UXB2+wVS521qyixu5lcD+6+UB9S1MA==', '4EFYXI5UFICTLQW3WE5GRTV2TWVC6LKZ', '58e31631-32d2-4be6-b142-60b1d4839520', '1234567891', 0, 0, NULL, 1, 0, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', NULL);

-- ----------------------------
-- Table structure for aspnetusertokens
-- ----------------------------
DROP TABLE IF EXISTS `aspnetusertokens`;
CREATE TABLE `aspnetusertokens`  (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`UserId`, `LoginProvider`, `Name`) USING BTREE,
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aspnetusertokens
-- ----------------------------

-- ----------------------------
-- Table structure for attachments
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments`  (
  `Id` int NOT NULL,
  `TaskId` int NOT NULL,
  `Name` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DocPath` varchar(7000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Base64File` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Size` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `TaskId`(`TaskId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attachments
-- ----------------------------

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `Id` int NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `InTime` datetime NULL DEFAULT NULL,
  `OutTime` datetime NULL DEFAULT NULL,
  `WorkingHours` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', '2022-10-25 21:17:43', '2022-10-25 21:30:09', '12mint', '2022-10-25 21:17:43', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `attendance` VALUES (2, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', '2022-10-25 21:18:22', '2022-10-25 21:19:13', '0mint', '2022-10-24 21:18:22', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `attendance` VALUES (3, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', '2022-10-25 21:20:49', '2022-10-25 21:26:34', '5mint', '2022-10-25 21:20:49', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `attendance` VALUES (4, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', '2022-10-27 21:58:22', '2022-10-27 22:53:04', '54mint', '2022-10-27 21:58:22', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `attendance` VALUES (5, '0608d41e-d78f-43f0-b90d-f01f0be913a4', '2023-01-31 22:01:22', NULL, NULL, '2023-01-31 22:01:22', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `attendance` VALUES (6, '0608d41e-d78f-43f0-b90d-f01f0be913a4', '2023-01-31 22:02:19', NULL, NULL, '2023-01-31 22:02:19', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `attendance` VALUES (7, '0608d41e-d78f-43f0-b90d-f01f0be913a4', '2023-08-31 18:05:42', NULL, NULL, '2023-08-31 18:05:42', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `Id` int NOT NULL,
  `CityId` int NULL DEFAULT NULL,
  `ProvinceId` int NULL DEFAULT NULL,
  `CountryId` int NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ContactPerson` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cell` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Telephone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `WhatsApp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `AddressLine1` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `AddressLine2` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CityId`(`CityId`) USING BTREE,
  INDEX `ProvinceId`(`ProvinceId`) USING BTREE,
  INDEX `CountryId`(`CountryId`) USING BTREE,
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`ProvinceId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_3` FOREIGN KEY (`CountryId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, 1001004, 1002002, 1003001, 'ABC', 'ABC', '1234567764', '1234567764', '1234567764', 'ASDGFG', 'GHFJHGU', '2022-03-22 22:10:52', 0, '2022-03-22 22:10:52', 0, b'1');

-- ----------------------------
-- Table structure for enumtype
-- ----------------------------
DROP TABLE IF EXISTS `enumtype`;
CREATE TABLE `enumtype`  (
  `Id` int NOT NULL,
  `Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enumtype
-- ----------------------------
INSERT INTO `enumtype` VALUES (1000, ' Permissions');
INSERT INTO `enumtype` VALUES (1001, 'Cities');
INSERT INTO `enumtype` VALUES (1002, 'Provinces');
INSERT INTO `enumtype` VALUES (1003, 'Countries');
INSERT INTO `enumtype` VALUES (1004, 'Task Statuses');
INSERT INTO `enumtype` VALUES (1005, 'User');
INSERT INTO `enumtype` VALUES (1006, 'Task Priorities');
INSERT INTO `enumtype` VALUES (1007, 'Control Types');

-- ----------------------------
-- Table structure for enumvalue
-- ----------------------------
DROP TABLE IF EXISTS `enumvalue`;
CREATE TABLE `enumvalue`  (
  `Id` int NOT NULL,
  `EnumTypeId` int NOT NULL,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `enumvalue`(`EnumTypeId`) USING BTREE,
  CONSTRAINT `enumvalue_ibfk_1` FOREIGN KEY (`EnumTypeId`) REFERENCES `enumtype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enumvalue
-- ----------------------------
INSERT INTO `enumvalue` VALUES (1000001, 1000, 'Deny');
INSERT INTO `enumvalue` VALUES (1000002, 1000, 'ReadOnly');
INSERT INTO `enumvalue` VALUES (1000003, 1000, 'FullAccess');
INSERT INTO `enumvalue` VALUES (1001001, 1001, 'Lahore');
INSERT INTO `enumvalue` VALUES (1001002, 1001, 'Karachi');
INSERT INTO `enumvalue` VALUES (1001003, 1001, 'Queeta');
INSERT INTO `enumvalue` VALUES (1001004, 1001, 'Multan');
INSERT INTO `enumvalue` VALUES (1002001, 1002, 'Punjab');
INSERT INTO `enumvalue` VALUES (1002002, 1002, 'Sindh');
INSERT INTO `enumvalue` VALUES (1003001, 1003, 'Pakistan');
INSERT INTO `enumvalue` VALUES (1003002, 1003, 'India');
INSERT INTO `enumvalue` VALUES (1003003, 1003, 'China');
INSERT INTO `enumvalue` VALUES (1004001, 1004, 'Open');
INSERT INTO `enumvalue` VALUES (1004002, 1004, 'In Progress');
INSERT INTO `enumvalue` VALUES (1004003, 1004, 'In Testing');
INSERT INTO `enumvalue` VALUES (1004004, 1004, 'Closed');
INSERT INTO `enumvalue` VALUES (1004005, 1004, 'Reopened');
INSERT INTO `enumvalue` VALUES (1004006, 1004, 'Dependent');
INSERT INTO `enumvalue` VALUES (1004007, 1004, 'RnD');
INSERT INTO `enumvalue` VALUES (1005001, 1005, 'Usman');
INSERT INTO `enumvalue` VALUES (1005002, 1005, 'Badar');
INSERT INTO `enumvalue` VALUES (1005003, 1005, 'Sumaira');
INSERT INTO `enumvalue` VALUES (1005004, 1005, 'Arooj');
INSERT INTO `enumvalue` VALUES (1005005, 1005, 'Amaar');
INSERT INTO `enumvalue` VALUES (1006001, 1006, 'Lowest');
INSERT INTO `enumvalue` VALUES (1006002, 1006, 'Low');
INSERT INTO `enumvalue` VALUES (1006003, 1006, 'Medium');
INSERT INTO `enumvalue` VALUES (1006004, 1006, 'High');
INSERT INTO `enumvalue` VALUES (1006005, 1006, 'Highest');
INSERT INTO `enumvalue` VALUES (1006006, 1006, 'Deferred');
INSERT INTO `enumvalue` VALUES (1007001, 1007, 'TextBox');
INSERT INTO `enumvalue` VALUES (1007002, 1007, 'RadioButton');
INSERT INTO `enumvalue` VALUES (1007003, 1007, 'CheckBox');
INSERT INTO `enumvalue` VALUES (1007004, 1007, 'DatePicker');
INSERT INTO `enumvalue` VALUES (1007005, 1007, 'TextArea');
INSERT INTO `enumvalue` VALUES (1007006, 1007, 'DropDownList');

-- ----------------------------
-- Table structure for expense
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense`  (
  `Id` int NOT NULL,
  `ExpenseTypeId` int NULL DEFAULT NULL,
  `ExpenseDate` datetime NULL DEFAULT NULL,
  `ExpenseTitle` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ExpenseDetail` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ExpenseTypeId`(`ExpenseTypeId`) USING BTREE,
  CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`ExpenseTypeId`) REFERENCES `expensetype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expense
-- ----------------------------
INSERT INTO `expense` VALUES (1, 4, '2022-11-18 19:00:00', 'Car Hire', 'Ground Transport', '2022-11-02 02:47:30', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (2, 6, '2022-11-29 19:00:00', 'Car Hire', 'Ground Transport', '2022-11-02 02:50:01', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (3, 2, '2022-11-23 19:00:00', 'ABCd', 'fhgfgh', '2022-11-02 03:00:33', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (4, 3, '2022-11-17 19:00:00', 'ABCd', 'chgfjh', '2022-11-02 03:00:58', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (5, 3, '2022-11-29 19:00:00', 'ABCdghjgjk', 'bvhgvjhbgkj', '2022-11-02 19:10:23', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (6, 2, '2022-11-17 19:00:00', 'ABCd', 'vbjcbakjsnk', '2022-11-02 19:37:26', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (7, 2, '2022-11-25 19:00:00', 'ABCdghjgjk', 'cvfbfgghf', '2022-11-02 20:02:30', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expense` VALUES (8, 7, '2022-11-02 18:16:19', 'Car Hire', 'Ground Transport', '2022-11-02 23:16:33', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `expense` VALUES (9, 3, '2022-12-07 15:43:17', 'Title of Expense', 'This is detail of expense', '2022-12-07 20:43:40', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for expensetype
-- ----------------------------
DROP TABLE IF EXISTS `expensetype`;
CREATE TABLE `expensetype`  (
  `Id` int NOT NULL,
  `Type` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Comment` varchar(7000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expensetype
-- ----------------------------
INSERT INTO `expensetype` VALUES (2, 'Advertising', '.....', '2022-11-02 02:38:21', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `expensetype` VALUES (3, 'Meals', '...', '2022-11-02 02:39:07', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `expensetype` VALUES (4, 'Travel', ',,,,', '2022-11-02 02:47:03', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expensetype` VALUES (5, 'Travel', '....', '2022-11-02 02:49:03', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expensetype` VALUES (6, 'Travel', '....', '2022-11-02 02:49:36', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `expensetype` VALUES (7, 'Travel', '....', '2022-11-02 23:10:37', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `expensetype` VALUES (8, 'Stationary', '......', '2022-11-02 23:11:45', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `expensetype` VALUES (9, 'Fixed Expenses', 'Testing', '2023-08-31 18:04:12', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature`  (
  `Id` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO `feature` VALUES (1, 'Invoice', 'Desc..', '2022-03-09 00:00:00', 1, '2022-03-09 00:00:00', 1, b'1');
INSERT INTO `feature` VALUES (2, 'Sale Order', 'Desc..', '2022-03-09 00:00:00', 1, '2022-03-09 00:00:00', 1, b'1');
INSERT INTO `feature` VALUES (3, 'Purchase Order', 'Des...', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `feature` VALUES (4, 'QTN', 'Des...', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field`  (
  `Id` int NOT NULL,
  `TypeId` int NULL DEFAULT NULL,
  `Title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsRequired` bit(1) NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of field
-- ----------------------------
INSERT INTO `field` VALUES (1, 1007001, 'First Name', b'1', '2022-11-11 00:31:39', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `field` VALUES (2, 1007002, 'Gender', b'0', '2022-11-11 00:31:56', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `field` VALUES (3, 1007001, 'First Name', b'1', '2022-11-11 00:33:24', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `field` VALUES (4, 1007002, 'Gender', b'1', '2022-11-11 00:33:40', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `field` VALUES (5, 1007005, 'CNIC', b'1', '2023-08-31 18:01:08', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `field` VALUES (6, 1007004, 'DOB', b'1', '2023-08-31 18:01:55', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for field_possible_values
-- ----------------------------
DROP TABLE IF EXISTS `field_possible_values`;
CREATE TABLE `field_possible_values`  (
  `Id` int NOT NULL,
  `FieldId` int NOT NULL,
  `FieldValue` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FieldId`(`FieldId`) USING BTREE,
  CONSTRAINT `field_possible_values_ibfk_1` FOREIGN KEY (`FieldId`) REFERENCES `field` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of field_possible_values
-- ----------------------------
INSERT INTO `field_possible_values` VALUES (1, 4, 'Male', '2022-11-11 00:33:59', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `field_possible_values` VALUES (2, 4, 'Female', '2022-11-11 00:34:04', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for inquiry
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry`  (
  `Id` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Cell` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ServicesId` int NULL DEFAULT NULL,
  `Email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inquiry
-- ----------------------------
INSERT INTO `inquiry` VALUES (1, 'Sumaira Ameer', '1234567764', 1, 'binteameer212@gmail.com', '.....', '2022-11-11 00:29:57', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `inquiry` VALUES (2, 'Sumaira Ameer', '1234567764', 1, 'bintameer212@gmail.com', '....', '2022-11-11 00:34:32', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for inquiry_field_data
-- ----------------------------
DROP TABLE IF EXISTS `inquiry_field_data`;
CREATE TABLE `inquiry_field_data`  (
  `Id` int NOT NULL,
  `InquiryId` int NOT NULL,
  `FieldName` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FieldValue` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  INDEX `InquiryId`(`InquiryId`) USING BTREE,
  CONSTRAINT `inquiry_field_data_ibfk_1` FOREIGN KEY (`InquiryId`) REFERENCES `inquiry` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inquiry_field_data
-- ----------------------------
INSERT INTO `inquiry_field_data` VALUES (1, 2, 'First Name', 'Sumaira', '2022-11-11 09:36:28', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `inquiry_field_data` VALUES (2, 2, 'Gender', 'Female', '2022-11-11 09:36:28', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for lecture
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture`  (
  `Id` int NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LectureURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lecture
-- ----------------------------
INSERT INTO `lecture` VALUES (1, 'OOP(Lecture 1)', 'Des...', 'https://www.youtube.com/watch?v=19X-OW1ThPQ&feature=youtu.be', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `lecture` VALUES (2, 'OOP (Lecture 2)', 'Des...', 'https://www.youtube.com/watch?v=vnL3MNwK6E4', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `lecture` VALUES (3, 'OOP(Lecture 3)', 'Des...', 'https://www.youtube.com/watch?v=uyfp2hR6Bko', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `lecture` VALUES (4, 'asdf', 'ghk', 'fgh', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for logevent
-- ----------------------------
DROP TABLE IF EXISTS `logevent`;
CREATE TABLE `logevent`  (
  `Id` int NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Action` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Message` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  CONSTRAINT `logevent_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logevent
-- ----------------------------
INSERT INTO `logevent` VALUES (1, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-25 21:17:48', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (2, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'LogOut', 'Sumaira successfully LogOut', '2022-10-25 21:18:07', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (3, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 'Login', 'Areeba successfully Login', '2022-10-24 21:18:22', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (4, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 'LogOut', 'Areeba successfully LogOut', '2022-10-24 21:18:22', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (5, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 'Login', 'Areeba successfully Login', '2022-10-25 21:21:09', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (6, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-25 21:27:01', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (7, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-25 21:30:01', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (8, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'LogOut', 'Sumaira successfully LogOut', '2022-10-25 21:30:53', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (9, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-26 17:09:11', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (10, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 'Login', 'Areeba successfully Login', '2022-10-26 18:32:35', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (12, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-26 18:46:21', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (13, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 'Login', 'Areeba successfully Login', '2022-10-26 18:49:40', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (14, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-27 21:58:26', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (15, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-30 19:41:01', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (16, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-30 19:51:06', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (17, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'LogOut', 'Sumaira successfully LogOut', '2022-10-30 19:51:26', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (18, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-10-30 19:51:43', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (19, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 'Login', 'Sumaira successfully Login', '2022-11-02 23:05:48', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `logevent` VALUES (20, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 'Login', 'Badar successfully Login', '2022-12-09 20:25:10', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `logevent` VALUES (21, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 'Login', 'Saira successfully Login', '2023-01-31 22:01:23', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `logevent` VALUES (22, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 'Login', 'Saira successfully Login', '2023-01-31 22:02:19', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `logevent` VALUES (23, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 'Login', 'Saira successfully Login', '2023-08-31 18:05:44', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for notification_log
-- ----------------------------
DROP TABLE IF EXISTS `notification_log`;
CREATE TABLE `notification_log`  (
  `Id` int NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DateTime` datetime NULL DEFAULT NULL,
  `Phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SMS` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsSent` bit(1) NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  CONSTRAINT `notification_log_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notification_log
-- ----------------------------
INSERT INTO `notification_log` VALUES (1, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', '2022-12-01 00:55:12', '12345678987', 'Testing', b'0', '2022-12-01 00:55:12', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `notification_log` VALUES (2, '3b060983-3c96-49e0-a7ea-b63f236241d1', '2022-12-01 01:00:36', '1234567891', 'Hi Areeba, A Task with Task Id: 1006 is changed from Status: Open to Status: Closed', b'1', '2022-12-01 01:00:36', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for notificationtemplate
-- ----------------------------
DROP TABLE IF EXISTS `notificationtemplate`;
CREATE TABLE `notificationtemplate`  (
  `Id` int NOT NULL,
  `KeyCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TemplateName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Subject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Body` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SMS` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notificationtemplate
-- ----------------------------
INSERT INTO `notificationtemplate` VALUES (1, 'abc', 'abc', 'abc', 'abc', 'abc', '2022-10-26 00:14:52', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `notificationtemplate` VALUES (2, 'hjfsdkbjhkj', 'fdsjbjjhkj', 'hdsjhbjhbjbk', 'sadsfbhjj', 'dsfbjhbhj', '2022-10-26 00:30:04', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `notificationtemplate` VALUES (3, 'NotificationToUser_OnTaskCreation', 'Task Creation Mail', 'Task Id: #TaskId', 'Hi #User, A Task with Task Id:#TaskId having priority:#TaskPriority is assigned to you.\nFor more information contact @ #ContactNumber', NULL, '2022-10-26 01:22:47', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `notificationtemplate` VALUES (4, 'NotificationToSupervisor_OnTaskCreation', 'Task Creation Mail ', 'Task Id:#TaskId', 'Hi #DirectSupervisorName , A Task with Task Id:#TaskId is assigned to #User', NULL, '2022-10-26 01:40:45', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `notificationtemplate` VALUES (5, 'NotificationToDirectSupervisor_OnStatusChange', 'Status Change Mail', 'Status of TaskId=#TaskId  Updated', 'Hi #Supervisor, A Task with Task Id: #TaskId is changed from Status: #OldStatus to Status: #NewStatus', NULL, '2022-10-26 11:51:55', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `notificationtemplate` VALUES (6, 'NotificationToUser_OnStatusChange', 'Status Change Mail', 'Status of TaskId=#TaskId  Updated', 'Hi #User, A Task with Task Id: #TaskId is changed from Status: #OldStatus to Status: #NewStatus', NULL, '2022-10-26 18:15:40', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `notificationtemplate` VALUES (7, 'NotificationToUser_OnTaskComments', 'Task Comment Mail', 'Comment  on Task Id: #TaskId', 'Hi #User,\n #SenderName  has commented this on your task:\n\"#Comment\"', NULL, '2022-11-06 19:16:35', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `notificationtemplate` VALUES (8, 'NotificationToDirectSupervisor_OnTaskComments', 'Task Comment Mail', 'Comment  on Task Id: #TaskId', 'Hi #DirectSupervisor,\n #SenderName  has commented this on the task:\n\"#Comment\"', NULL, '2022-11-06 19:21:06', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `Id` int NOT NULL,
  `FeatureId` int NULL DEFAULT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PermissionValue` int NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `permissions`(`FeatureId`) USING BTREE,
  INDEX `PermissionValue`(`PermissionValue`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  INDEX `RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`FeatureId`) REFERENCES `feature` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`PermissionValue`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permissions_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permissions_ibfk_4` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (5, 1, NULL, 'a67febed-dc5d-4253-999e-f3db0f0687f2', 1000001, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (6, 2, NULL, 'a67febed-dc5d-4253-999e-f3db0f0687f2', 1000002, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (7, 3, NULL, 'a67febed-dc5d-4253-999e-f3db0f0687f2', 1000001, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (8, 4, NULL, 'a67febed-dc5d-4253-999e-f3db0f0687f2', 1000003, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (9, 1, NULL, '1f7dcdd7-f3af-4685-bb9c-3860b5e4c305', 1000001, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (10, 2, NULL, '1f7dcdd7-f3af-4685-bb9c-3860b5e4c305', 1000002, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (11, 3, NULL, '1f7dcdd7-f3af-4685-bb9c-3860b5e4c305', 1000003, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `permissions` VALUES (12, 4, NULL, '1f7dcdd7-f3af-4685-bb9c-3860b5e4c305', 1000002, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `Id` int NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Content` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `CreatedById` int NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 'Business Services', '<p><span style=\"color: rgb(32, 33, 36);\">Hi #User, Thank you for your interest in our products and services. I have attached a description of all our products and services. In case of further inquiries, do not hesitate to let me know.</span></p>', '2022-10-27 10:18:04', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `services` VALUES (2, 'Computer Courses', '<h3>Hi #User,</h3><h3><span class=\"ql-font-serif\" style=\"color: rgb(32, 33, 36);\">It is pleasure to respond to your inquiry about Computer Courses. Thank you for reaching out and expressing interest in our services.</span></h3><h3>We are providing computer courses in the following Languages:</h3><ul><li>C</li><li>Java&nbsp;</li><li>Python</li><li>C++</li><li>C#&nbsp;</li><li>Visual Basic&nbsp;</li><li>JavaScript</li><li>PHP</li><li>SQL</li><li>Assembly language</li><li>R</li><li>Groovy&nbsp;</li></ul>', '2022-11-04 21:59:23', 0, '0001-01-01 00:00:00', 0, 1);

-- ----------------------------
-- Table structure for story
-- ----------------------------
DROP TABLE IF EXISTS `story`;
CREATE TABLE `story`  (
  `Id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `URL` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES (1, 'Christmas Carol', 'https://drive.google.com/file/d/1wGX4xddvM6eqAraWXALy0-GRWDnA1bUn/view?usp=share_link');
INSERT INTO `story` VALUES (2, 'Pride & Prejudice', 'https://drive.google.com/file/d/1c9iGGgLEEhbxnJGL1fDpybVS1ghfrKab/view?usp=share_link');
INSERT INTO `story` VALUES (3, 'A Tale of Two Cities', 'https://drive.google.com/file/d/1G_GlysLwPa66qmVyQpZhGV-beOEbBs5M/view?usp=share_link');
INSERT INTO `story` VALUES (4, 'Gullivers Travels', 'https://drive.google.com/file/d/1iRPfYy38Hi7N17OqNo2thqlelTzt3zrq/view?usp=share_link');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Id` int NOT NULL,
  `StudentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CNIC` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DOB` datetime NULL DEFAULT NULL,
  `CellNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `WhatsApp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianCell` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianRelation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianWhatsApp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianEmail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianOccupation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'AreebaFatimah', 'f', '3660366387328', '0001-01-01 00:00:00', '03001234567', 'arooj@gmail.com', '03001234567', 'QRST', '03001234567', 'Mother', '01234567891', 'abc@gamil.com', NULL, 'Remarks...', 'Areeba', 'S3ameer@', '2022-10-31 21:08:17', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `student` VALUES (2, 'Sumaira Ameer', 'f', '3660366387328', '0001-01-01 00:00:00', '06876875453', 'sumaira@gmail.com', '03007899978', 'XYZ', '03001234567', 'Father', '01786567891', 'xyz@gamil.com', NULL, 'Remarks...', 'Sumaira', 'S3ameer@', '2022-10-31 20:35:46', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `student` VALUES (3, 'Ifrah Sulman', '\0', '3660366387328', '0001-01-01 00:00:00', '03001234567', 'Ifrah@gmail.com', '03001234567', 'Sulman', '03001234567', 'Father', '01234567891', 'abc@gamil.com', NULL, NULL, 'Ifrah', 'S3ameer@', '2022-11-03 20:31:53', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `student` VALUES (4, 'Humaira Hameed', '\0', '3660366387328', '0001-01-01 00:00:00', '03001234567', 'bintameer212@gmail.com', '03001234567', 'Hameed', '03001234567', 'Father', '01234567891', 'abc@gamil.com', NULL, NULL, 'Humaira', 'S3ameer@', '2022-10-31 21:55:05', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for studentlecture
-- ----------------------------
DROP TABLE IF EXISTS `studentlecture`;
CREATE TABLE `studentlecture`  (
  `Id` int NOT NULL,
  `StudentId` int NOT NULL,
  `LectureId` int NOT NULL,
  `AssignedOn` datetime NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`StudentId`, `LectureId`) USING BTREE,
  INDEX `LectureId`(`LectureId`) USING BTREE,
  CONSTRAINT `studentlecture_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `studentlecture_ibfk_2` FOREIGN KEY (`LectureId`) REFERENCES `lecture` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studentlecture
-- ----------------------------
INSERT INTO `studentlecture` VALUES (1, 1, 2, '2022-01-12 07:36:45', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `studentlecture` VALUES (4, 1, 3, '2022-11-04 20:51:10', '2022-11-05 01:51:45', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `studentlecture` VALUES (3, 2, 1, '2022-01-14 09:56:51', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `studentlecture` VALUES (2, 2, 3, '2022-01-12 07:37:24', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `Id` int NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ModuleId` int NULL DEFAULT NULL,
  `StatusId` int NULL DEFAULT NULL,
  `PriorityId` int NULL DEFAULT NULL,
  `Title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SP` float NULL DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `CreatedById` int NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1001, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 0, 1004004, 1006002, 'NotificationToUser_OnstatusChange', 2, '<p>An Email is sent to the User when DirectSupervisor changes the task status.</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1002, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 0, 1004007, 1006002, 'WhatsApp Notification', 1, '\n', '2022-12-02 02:03:40', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1003, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 0, 1004004, 1006003, 'Manage Services', 4, '<ul><li>Define Service Table with fields (Id, Name, Content)</li><li>Define the Services of the \"Service Page\"</li><li>Add Services Field in Inquiry Page as a dropdown list.</li><li>Send Email notification to the User about the services when an inquiry is added.</li></ul>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1004, '1508c87f-0d26-4ce6-95ce-b78a2903bd15', 0, 1004004, 1006002, 'KeyCode column is not Required in Template List screen', 1, '<p>Module: Task Management System</p><p>Page: Template List</p><p>KeyCode column shouldn\'t be visible </p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1005, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006002, 'TMS - Move TMS to new Theme (Material Pro)', 2, '<p>Currently adopted theme is paid one ... so we need to move to a Free version theme asap.</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1006, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006005, 'TMS- When Task is saved, no message is prompted to user', 1, '<p>Neither message is prompted ... nor the page is refreshed (to a new State) in case of Success. </p><p>In case of failure, page shouldn\'t be refreshed </p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1007, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006004, 'TMS - When Task is saved, it is not shown in the Tasks List', 1, '<p>Tasks List is currently showing a few tasks only (the old ones only). Newly added tasks are not being displayed in the Tasks List</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1008, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006005, 'TMS - A task with Point value for SP is not savable', 1, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1009, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006005, 'TMS - Task Comments are not being saved', 0.45, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1010, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Test', 1, '<p>Testing ...</p>', '2023-01-20 16:01:26', 0, '2023-01-20 16:01:26', 0, 0);
INSERT INTO `task` VALUES (1011, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing agian ', 1, '<p>This is testing again ...</p>', '2023-01-20 16:03:40', 0, '2023-01-20 16:03:40', 0, 0);
INSERT INTO `task` VALUES (1012, '1508c87f-0d26-4ce6-95ce-b78a2903bd15', 0, 1004001, 0, 'Testing 3', -1, '<p>This is testing 3</p>', '2023-01-20 16:06:04', 0, '2023-01-20 16:06:04', 0, 0);
INSERT INTO `task` VALUES (1013, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing 4', 1, '<p>Testing 4 agian ...</p>', '2023-01-20 16:17:23', 0, '2023-01-20 16:17:23', 0, 0);
INSERT INTO `task` VALUES (1014, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing 5', 1, '<p>Testing 5...</p>', '2023-01-20 16:27:28', 0, '2023-01-20 16:27:28', 0, 0);
INSERT INTO `task` VALUES (1015, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing 6', 1, '<p>Testing 6</p>', '2023-01-20 16:28:35', 0, '2023-01-20 16:28:35', 0, 0);
INSERT INTO `task` VALUES (1016, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing 7', 1, '<p>Testing 7</p>', '2023-01-20 16:29:43', 0, '2023-01-20 16:29:43', 0, 0);
INSERT INTO `task` VALUES (1017, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing 8', 1, '<p>Testing 8</p>', '2023-01-20 16:33:00', 0, '2023-01-20 16:33:00', 0, 0);
INSERT INTO `task` VALUES (1018, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing 10', 10, '<p>Testing 10</p>', '2023-01-20 16:34:23', 0, '2023-01-20 16:34:23', 0, 0);
INSERT INTO `task` VALUES (1019, '1508c87f-0d26-4ce6-95ce-b78a2903bd15', 0, 1004001, 0, 'Tesing 11', 11, '<p>Testing 11</p>', '2023-01-20 16:37:41', 0, '2023-01-20 16:37:41', 0, 0);
INSERT INTO `task` VALUES (1020, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006002, 'Testing 12', 12, '<p>This is testing 12</p>', '2023-01-20 16:38:19', 0, '2023-01-20 16:38:19', 0, 0);
INSERT INTO `task` VALUES (1021, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 0, 1004001, 1006001, 'Testing 13', 13, '<p>This is testing ...</p>', '2023-01-20 16:40:15', 0, '2023-01-20 16:40:15', 0, 0);
INSERT INTO `task` VALUES (1022, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006005, 'TMS - Add a new Priority named \"Deferred\"', 1, '<p>Sometimes we need to defer some task, so we need a new Priority named \"Deferred\"</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1023, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006002, 'TMS - Rename DB to \"MicroERP\" and use this DB with the application', 1, '<p>Currently the DB name is QAFastTrack. It should be renamed to \"MicroERP\"</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1024, '1508c87f-0d26-4ce6-95ce-b78a2903bd15', 0, 1004004, 1006005, 'TMS - Newly added Task should be present in the TOP most location in Tasks List', 1, '<p>Currently the newly added task is placed at the end of the Tasks list. It should be placed at the top</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1025, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 0, 1004001, 1006001, 'Testing ...', 0.25, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 0);
INSERT INTO `task` VALUES (1026, '1508c87f-0d26-4ce6-95ce-b78a2903bd15', 0, 1004001, 1006002, 'Testing ... ', 0.75, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 0);
INSERT INTO `task` VALUES (1027, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006005, 'Fix Node Modules Installation Issue on Kashaf\'s Machine', 1, NULL, '2023-01-26 16:55:54', 0, '2023-01-26 16:55:54', 0, 1);
INSERT INTO `task` VALUES (1028, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 1006004, 'Rename QAFastTrack projects to MicroERP ', 0.5, '<p>Rename projects plus other constructs e.g. Namespaces</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1029, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 0, 'Make Priority as required field', 0.25, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1030, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004004, 0, 'Priority DropDown is not having some data', 0.25, '<p>Same is the case for the Status as well</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1031, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006003, 'TMS - Implement Paging in the Tasks List', 2, '<p>Need to implement Server Side Paging</p>', '2023-01-31 16:39:18', 0, '2023-01-31 16:39:18', 0, 1);
INSERT INTO `task` VALUES (1032, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006004, 'Remove unnecessary links from the Side Menu', 0.5, '<p>There is need to comment the code just ... no need to delete anything</p>', '2023-01-31 16:45:44', 0, '2023-01-31 16:45:44', 0, 1);
INSERT INTO `task` VALUES (1033, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006005, 'ATT- Define a Page where attendance can be marked for students in one go', 3, '<p>Example</p><p><br></p><p>Date: __31/01/23_________</p><p>Reg#	Name Cell Present</p><p>1001	Kashaf 4399394439 Present/Absent (Slide Toggle from Angular Material)</p><p>1002	Aeini 39999394439 P/A (Slide Toggle from Angular Material)</p><p><br></p><p>Mark Attendance (Button)</p><p><br></p><p>NOTE: Use Slide Toggle control to mark Attendance in the form of On/Off button. For more information go to the following URL</p><p>https://material.angular.io/components/slide-toggle/examples</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1034, 'e9440eb2-51a2-4e95-ac65-5c939d25e0dc', 0, 1004001, 1006003, 'REST - Table names shouldn\'t contain the letter underscore (i.e. _)', 1.5, '<p>Rename the following tables</p><p>- dine_in to dinein</p><p>- discount_key to discountkey</p><p>- sale_order to saleorder</p><p>- sale_order_lint to saleorderline</p><p>- sub_category to subcategory&nbsp;</p><p>- take_away to takeaway</p><p>- theme_data to themedata</p><p><br></p><p>Also perform the necessary changes in the Backend Project</p><p><br></p>', '2023-02-02 07:56:31', 0, '2023-02-02 07:56:31', 0, 1);
INSERT INTO `task` VALUES (1035, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006005, 'TMS - Tasks should be logged project/module-wise', 1.5, '<p>Define a DropDownList named projects/Modules to contain the projects/modules logged in the DB and selecting anyone while saving/editing a task.</p><p><br></p><p>Make this field required</p><p><br></p><p>Also Tasks should be filtered project/Module wise as well.</p>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1036, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006005, 'TMS - Tasks should be downloaded as PDF', 5, '<p>Define a button inside the \"Tasks List\" named \"Download as PDF\" and when user clicks this button, filtered tasks should be downloaded as PDF</p><p><br></p><p>Technical Specification:</p><ul><li>Use some Reporting Tool (Open Source and Free) to define reports on the server side </li></ul>', '2023-02-02 08:07:47', 0, '2023-02-02 08:07:47', 0, 1);
INSERT INTO `task` VALUES (1037, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006005, 'TMS - Email should be sent to user when Task is created by Supervisor', 2, '<p>There is need to define a configuration setting for SMTP credentials (define a separate task for this) and email should be sent using the selected configuration</p>', '2023-02-02 08:11:49', 0, '2023-02-02 08:11:49', 0, 1);
INSERT INTO `task` VALUES (1038, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006004, 'TMS - Comments are not saved but the message is Saved Successfully', 0.5, NULL, '2023-02-03 17:03:55', 0, '2023-02-03 17:03:55', 0, 1);
INSERT INTO `task` VALUES (1039, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006005, 'TMS - Comments are saved but not loading in the Task', 0.5, NULL, '2023-02-03 17:04:50', 0, '2023-02-03 17:04:50', 0, 1);
INSERT INTO `task` VALUES (1040, 'dcf26a59-e1c7-42d8-95a3-b51a10ae03cb', 0, 1004001, 1006005, 'TMS - Define API for \"Mark Attendance\" Page by implementing the Backend Steps', 1, '<p><br></p><p>Part-1: Back-End Steps:-</p><p><br></p><p>1. Create Table (named Attendance)</p><p>2. Define the corresponding Domain/Business Entity (Class which is dedicated for the underlying table)</p><p>3. Define Manage &amp; Search Methods inside DAL layer (Data Access Layer)</p><p>4. Define Manage &amp; Search methods inside the Service Layer</p><p>5. Define CRUD method inside the Testing Layer (to verify CRUD operations)</p><p>6. Define API Methods (HTTP verbs i.e. GET, PUT, DELETE, POST) inside the Controller Class</p><p><br></p><p>Technical Specification:</p><ul><li>Table Schema</li><li class=\"ql-indent-1\">Table Name: Attendance</li><li class=\"ql-indent-1\">Id : PK (int)</li><li class=\"ql-indent-1\">UId: FK (int) - i.e. User Id</li><li class=\"ql-indent-1\">Date: DateTime</li><li class=\"ql-indent-1\">StatusId: int ( Present, Absent)</li><li class=\"ql-indent-1\">+ Five Common Field</li></ul>', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `task` VALUES (1041, 'dcf26a59-e1c7-42d8-95a3-b51a10ae03cb', 0, 1004001, 1006003, 'TMS - Define a Button \"Create Task\" in the Tasks List above the Search Tasks Text Box', 0.25, NULL, '2023-04-04 18:02:04', 0, '2023-04-04 18:02:04', 0, 1);
INSERT INTO `task` VALUES (1042, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 0, 1004001, 1006004, 'TMS - Inside Search Tasks popup, Task Status field should be a CheckBox List (Currently DropDown)', 1.5, NULL, '2023-04-04 18:03:18', 0, '2023-04-04 18:03:18', 0, 1);

-- ----------------------------
-- Table structure for taskcomment
-- ----------------------------
DROP TABLE IF EXISTS `taskcomment`;
CREATE TABLE `taskcomment`  (
  `Id` int NOT NULL,
  `TaskId` int NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Time` datetime NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `TaskId_idx`(`TaskId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of taskcomment
-- ----------------------------
INSERT INTO `taskcomment` VALUES (1, 1003, '2d745a47-7eb8-4d9b-9c1a-7a4dbef25c13', 'The action column of the Item List should have three actions (\'Delete\',\'View\', and \'Edit\')', '2022-11-06 16:34:02', '2022-11-06 16:34:02', 0, '2022-11-06 16:34:02', 0, 1);
INSERT INTO `taskcomment` VALUES (2, 1003, '3b060983-3c96-49e0-a7ea-b63f236241d1', 'Hi its for just testing...', '0001-01-01 00:00:00', '2022-12-02 01:25:37', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `taskcomment` VALUES (3, 1003, '3b060983-3c96-49e0-a7ea-b63f236241d1', 'hi', '0001-01-01 00:00:00', '2022-12-03 21:50:38', 0, '0001-01-01 00:00:00', 0, 1);
INSERT INTO `taskcomment` VALUES (4, 1009, '9edacd18-a5a6-4e62-86ed-18b7114f5454', 'Testing', '2023-01-26 16:14:31', '2023-01-26 16:14:31', 0, '2023-01-26 16:14:31', 0, 1);
INSERT INTO `taskcomment` VALUES (5, 1009, '0608d41e-d78f-43f0-b90d-f01f0be913a4', 'Hi ... This is again testing ', '2023-01-26 16:19:01', '2023-01-26 16:19:01', 0, '2023-01-26 16:19:01', 0, 1);
INSERT INTO `taskcomment` VALUES (6, 1009, '', 'Welcome back', '2023-01-26 16:26:27', '2023-01-26 16:26:27', 0, '2023-01-26 16:26:27', 0, 1);
INSERT INTO `taskcomment` VALUES (7, 1009, '', 'Welcome back', '2023-01-26 16:26:27', '2023-01-26 16:26:27', 0, '2023-01-26 16:26:27', 0, 1);
INSERT INTO `taskcomment` VALUES (8, 1009, '', 'Hi ...', '2023-01-26 16:29:53', '2023-01-26 16:29:53', 0, '2023-01-26 16:29:53', 0, 1);
INSERT INTO `taskcomment` VALUES (9, 1009, '', 'Fixed the issue ', '2023-01-26 16:38:33', '2023-01-26 16:38:33', 0, '2023-01-26 16:38:33', 0, 1);
INSERT INTO `taskcomment` VALUES (10, 1009, '', 'When Comment is saved, then comment field should be emptied (Fixed)', '2023-01-26 16:42:15', '2023-01-26 16:42:15', 0, '2023-01-26 16:42:15', 0, 1);
INSERT INTO `taskcomment` VALUES (11, 1009, '', 'Removed Required field validator on the Comment field', '2023-01-26 16:43:56', '2023-01-26 16:43:56', 0, '2023-01-26 16:43:56', 0, 1);
INSERT INTO `taskcomment` VALUES (12, 1009, '', 'When comments are saved, there should be a message \"Comments Saved Successfully\" (Fixed)', '2023-01-26 16:45:52', '2023-01-26 16:45:52', 0, '2023-01-26 16:45:52', 0, 1);
INSERT INTO `taskcomment` VALUES (13, 1033, '', 'Steps: (Bottom to Top) \n\nPart-1: Back-End Steps:-\n\n1. Create Table (named Attendance)\n2. Define the corresponding Domain/Business Entity (Class which is dedicated for the underlying table)\n3. Define Manage & Search Methods inside DAL layer (Data Access Layer)\n4. Define Manage & Search methods inside the Service Layer\n5. Define CRUD method inside the Testing Layer (to verify CRUD operations)\n6. Define API Methods (HTTP verbs i.e. GET, PUT, DELETE, POST) inside the Controller Class\n\nPart-2: Front End Steps\n\n1. Define the Component according to User Interface\n2. Define the HTML according to the User Interface inside the component\n3. Perform the coding inside the TypeScript file of Component\n4. Change the design (if required) inside the CSS class of component\n5. Define Router & Link so that Component could be invoked\n6. Define a Service Class & Methods to take data from Component and Pass it to the underlying API method\n7. Perform necessary validation (inside HTML/Typescript file of component)', '2023-02-03 16:57:46', '2023-02-03 16:57:46', 0, '2023-02-03 16:57:46', 0, 1);
INSERT INTO `taskcomment` VALUES (14, 1039, '', 'These are test comments ...', '2023-04-04 17:59:41', '2023-04-04 17:59:41', 0, '2023-04-04 17:59:41', 0, 1);

-- ----------------------------
-- Table structure for vocabulary
-- ----------------------------
DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE `vocabulary`  (
  `Word` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Pronunciation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UrduMeaning` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `EnglishMeaning` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vocabulary
-- ----------------------------
INSERT INTO `vocabulary` VALUES ('Endeavoured', '/ɪnˈdɛvə,ɛnˈdɛvə/\r\n', 'کوشش کی\r\n', '');
INSERT INTO `vocabulary` VALUES ('Haunt', '/hɔːnt/', 'پریشان, روح / بھوت جو ظاہر ہو', '');
INSERT INTO `vocabulary` VALUES ('Burial', '/ˈbɛrɪəl/\r\n', 'پریشان, روح / بھوت جو ظاہر ہو', '');
INSERT INTO `vocabulary` VALUES ('Clergyman', '/ˈkləːdʒɪmən/', 'پادری', '');
INSERT INTO `vocabulary` VALUES ('Clergyman', '/kləːdʒɪmən/', 'پادری', '');
INSERT INTO `vocabulary` VALUES ('Clergyman', '/kləːdʒɪmən/', 'پادری', '');

-- ----------------------------
-- Table structure for vocabularystory
-- ----------------------------
DROP TABLE IF EXISTS `vocabularystory`;
CREATE TABLE `vocabularystory`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VocabularyWord` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `StoryId` int NULL DEFAULT NULL,
  `PageNo` int NULL DEFAULT NULL,
  `Sentence` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vocabularystory
-- ----------------------------
INSERT INTO `vocabularystory` VALUES (30, 'Endeavoured', 1, 2, 'I have endeavoured in this Ghostly little book, to raise the\r\nGhost of an Idea, which shall not put my readers out of\r\nhumour with themselves, with each other, with the season, or\r\nwith me');
INSERT INTO `vocabularystory` VALUES (31, 'Haunt', 1, 2, 'May it haunt their houses pleasantly, and no one\r\nwish to lay it');
INSERT INTO `vocabularystory` VALUES (32, 'Burial', 1, 3, 'May it haunt their houses pleasantly, and no one\r\nwish to lay it');
INSERT INTO `vocabularystory` VALUES (33, 'Clergyman', 1, 3, 'The register of his burial was signed\r\nby the clergyman, the clerk, the undertaker, and the chief\r\nmourner.');
INSERT INTO `vocabularystory` VALUES (34, 'Clergyman', 1, 3, 'The register of his burial was signed\r\nby the clergyman, the clerk, the undertaker, and the chief\r\nmourner.');

-- ----------------------------
-- View structure for vw_attendance
-- ----------------------------
DROP VIEW IF EXISTS `vw_attendance`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_attendance` AS select `atnd`.`Id` AS `Id`,`atnd`.`UserId` AS `UserId`,`user`.`UserName` AS `UserName`,`atnd`.`InTime` AS `InTime`,`atnd`.`OutTime` AS `OutTime`,`atnd`.`WorkingHours` AS `WorkingHours`,`atnd`.`CreatedOn` AS `CreatedOn`,`atnd`.`CreatedById` AS `CreatedById`,`atnd`.`ModifiedOn` AS `ModifiedOn`,`atnd`.`ModifiedById` AS `ModifiedById`,`atnd`.`IsActive` AS `IsActive` from (`attendance` `atnd` join `aspnetusers` `user` on((`atnd`.`UserId` = `user`.`Id`)));

-- ----------------------------
-- View structure for vw_expense
-- ----------------------------
DROP VIEW IF EXISTS `vw_expense`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_expense` AS select `expense`.`Id` AS `Id`,`expense`.`ExpenseDate` AS `ExpenseDate`,`expense`.`ExpenseTitle` AS `ExpenseTitle`,`expense`.`ExpenseDetail` AS `ExpenseDetail`,`expense`.`ExpenseTypeId` AS `ExpenseTypeId`,`ext`.`Type` AS `ExpenseType`,`ext`.`Comment` AS `ExpenseComment`,`expense`.`CreatedOn` AS `CreatedOn`,`expense`.`CreatedById` AS `CreatedById`,`expense`.`ModifiedOn` AS `ModifiedOn`,`expense`.`ModifiedById` AS `ModifiedById`,`expense`.`IsActive` AS `IsActive` from (`expense` join `expensetype` `ext` on((`ext`.`Id` = `expense`.`ExpenseTypeId`)));

-- ----------------------------
-- View structure for vw_field
-- ----------------------------
DROP VIEW IF EXISTS `vw_field`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_field` AS select `field`.`Id` AS `Id`,`field`.`Title` AS `Title`,`field`.`TypeId` AS `TypeId`,`ev`.`Value` AS `Type`,`field`.`CreatedOn` AS `CreatedOn`,`field`.`IsRequired` AS `IsRequired`,`field`.`CreatedById` AS `CreatedById`,`field`.`ModifiedOn` AS `ModifiedOn`,`field`.`ModifiedById` AS `ModifiedById`,`field`.`IsActive` AS `IsActive` from (`field` join `enumvalue` `ev` on((`ev`.`Id` = `field`.`TypeId`)));

-- ----------------------------
-- View structure for vw_fpvalue
-- ----------------------------
DROP VIEW IF EXISTS `vw_fpvalue`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_fpvalue` AS select `field_possible_values`.`Id` AS `Id`,`field_possible_values`.`FieldValue` AS `FieldValue`,`field_possible_values`.`FieldId` AS `FieldId`,`fld`.`Title` AS `FieldName`,`fld`.`TypeId` AS `TypeId`,`ev`.`Value` AS `Type`,`field_possible_values`.`CreatedOn` AS `CreatedOn`,`field_possible_values`.`CreatedById` AS `CreatedById`,`field_possible_values`.`ModifiedOn` AS `ModifiedOn`,`field_possible_values`.`ModifiedById` AS `ModifiedById`,`field_possible_values`.`IsActive` AS `IsActive` from ((`field_possible_values` join `field` `fld` on((`fld`.`Id` = `field_possible_values`.`FieldId`))) join `enumvalue` `ev` on((`ev`.`Id` = `fld`.`TypeId`)));

-- ----------------------------
-- View structure for vw_inquiry
-- ----------------------------
DROP VIEW IF EXISTS `vw_inquiry`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_inquiry` AS select `inquiry`.`Id` AS `Id`,`inquiry`.`Name` AS `Name`,`inquiry`.`Cell` AS `Cell`,`inquiry`.`Email` AS `Email`,`srvc`.`Name` AS `ServiceName`,`srvc`.`Content` AS `Content`,`inquiry`.`ServicesId` AS `ServicesId`,`inquiry`.`Comments` AS `Comments`,`inquiry`.`CreatedOn` AS `CreatedOn`,`inquiry`.`CreatedById` AS `CreatedById`,`inquiry`.`ModifiedOn` AS `ModifiedOn`,`inquiry`.`ModifiedById` AS `ModifiedById`,`inquiry`.`IsActive` AS `IsActive` from (`inquiry` join `services` `srvc` on((`srvc`.`Id` = `inquiry`.`ServicesId`)));

-- ----------------------------
-- View structure for vw_inquiryfielddata
-- ----------------------------
DROP VIEW IF EXISTS `vw_inquiryfielddata`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_inquiryfielddata` AS select `inquiry_field_data`.`Id` AS `Id`,`inquiry_field_data`.`FieldName` AS `FieldName`,`inquiry_field_data`.`FieldValue` AS `FieldValue`,`inquiry_field_data`.`InquiryId` AS `InquiryId`,`inq`.`Name` AS `Name`,`inq`.`Email` AS `Email`,`inq`.`Cell` AS `Cell`,`inq`.`Comments` AS `Comment`,`inq`.`ServicesId` AS `ServicesId`,`svc`.`Name` AS `ServiceName`,`inquiry_field_data`.`CreatedOn` AS `CreatedOn`,`inquiry_field_data`.`CreatedById` AS `CreatedById`,`inquiry_field_data`.`ModifiedOn` AS `ModifiedOn`,`inquiry_field_data`.`ModifiedById` AS `ModifiedById`,`inquiry_field_data`.`IsActive` AS `IsActive` from ((`inquiry_field_data` join `inquiry` `inq` on((`inq`.`Id` = `inquiry_field_data`.`InquiryId`))) join `services` `svc` on((`inq`.`ServicesId` = `svc`.`Id`)));

-- ----------------------------
-- View structure for vw_logevent
-- ----------------------------
DROP VIEW IF EXISTS `vw_logevent`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_logevent` AS select `levnt`.`Id` AS `Id`,`levnt`.`UserId` AS `UserId`,`user`.`UserName` AS `UserName`,`levnt`.`Action` AS `Action`,`levnt`.`Message` AS `Message`,`levnt`.`CreatedOn` AS `CreatedOn`,`levnt`.`CreatedById` AS `CreatedById`,`levnt`.`ModifiedOn` AS `ModifiedOn`,`levnt`.`ModifiedById` AS `ModifiedById`,`levnt`.`IsActive` AS `IsActive` from (`logevent` `levnt` join `aspnetusers` `user` on((`levnt`.`UserId` = `user`.`Id`)));

-- ----------------------------
-- View structure for vw_permission
-- ----------------------------
DROP VIEW IF EXISTS `vw_permission`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_permission` AS select `p`.`Id` AS `Id`,`p`.`FeatureId` AS `FeatureId`,`fea`.`Name` AS `Feature`,`p`.`UserId` AS `UserId`,`us`.`UserName` AS `User`,`p`.`RoleId` AS `RoleId`,`ro`.`Name` AS `Role`,`p`.`PermissionValue` AS `PermissionValue`,`ev`.`Value` AS `Permission`,`p`.`IsActive` AS `IsActive` from ((((`permissions` `p` join `enumvalue` `ev` on((`ev`.`Id` = `p`.`PermissionValue`))) join `feature` `fea` on((`fea`.`Id` = `p`.`FeatureId`))) left join `aspnetusers` `us` on((`p`.`UserId` = `us`.`Id`))) left join `aspnetroles` `ro` on((`p`.`RoleId` = `ro`.`Id`)));

-- ----------------------------
-- View structure for vw_studentlectures
-- ----------------------------
DROP VIEW IF EXISTS `vw_studentlectures`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_studentlectures` AS select `stl`.`Id` AS `Id`,`stl`.`StudentId` AS `StudentId`,`st`.`StudentName` AS `Student`,`st`.`UserName` AS `UserName`,`st`.`Password` AS `Password`,`stl`.`LectureId` AS `LectureId`,`le`.`Title` AS `Title`,`le`.`LectureURL` AS `Lecture`,`le`.`Description` AS `Description`,`stl`.`AssignedOn` AS `AssignedOn`,`stl`.`IsActive` AS `IsActive` from ((`studentlecture` `stl` join `student` `st` on((`stl`.`StudentId` = `st`.`Id`))) join `lecture` `le` on((`stl`.`LectureId` = `le`.`Id`)));

-- ----------------------------
-- View structure for vw_students
-- ----------------------------
DROP VIEW IF EXISTS `vw_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_students` AS select `st`.`Id` AS `Id`,`st`.`StudentName` AS `StudentName`,`st`.`Gender` AS `Gender`,`st`.`CNIC` AS `CNIC`,`st`.`Email` AS `Email`,`st`.`CellNo` AS `CellNo`,`st`.`WhatsApp` AS `WhatsApp`,`st`.`GuardianName` AS `GuardianName`,`st`.`GuardianCell` AS `GuardianCell`,`st`.`GuardianRelation` AS `GuardianRelation`,`st`.`GuardianWhatsApp` AS `GuardianWhatsApp`,`st`.`GuardianEmail` AS `GuardianEmail`,`st`.`Remarks` AS `Remarks`,`st`.`UserName` AS `UserName`,`st`.`Password` AS `Password`,`st`.`IsActive` AS `IsActive` from `student` `st`;

-- ----------------------------
-- View structure for vw_task
-- ----------------------------
DROP VIEW IF EXISTS `vw_task`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_task` AS select `tsk`.`Id` AS `Id`,`tsk`.`UserId` AS `UserId`,`user`.`UserName` AS `User`,`user`.`Email` AS `UserMail`,`user`.`DirectSupervisorId` AS `DirectSupervisorId`,`user`.`PhoneNumber` AS `DirectSupervisorPhoneNumber`,`us`.`UserName` AS `DirectSupervisorName`,`us`.`Email` AS `DirectSupervisorEmail`,`us`.`PhoneNumber` AS `UserPhoneNumber`,`tsk`.`StatusId` AS `StatusId`,`env2`.`Value` AS `TaskStatus`,`tsk`.`PriorityId` AS `PriorityId`,`env1`.`Value` AS `TaskPriority`,`tsk`.`Title` AS `Title`,`tsk`.`SP` AS `SP`,`tsk`.`Description` AS `Description`,`tsk`.`IsActive` AS `IsActive` from ((((`task` `tsk` left join `enumvalue` `env2` on((`tsk`.`StatusId` = `env2`.`Id`))) left join `enumvalue` `env1` on((`tsk`.`PriorityId` = `env1`.`Id`))) left join `aspnetusers` `user` on((`tsk`.`UserId` = `user`.`Id`))) left join `aspnetusers` `us` on((`user`.`DirectSupervisorId` = `us`.`Id`)));

-- ----------------------------
-- View structure for vw_taskcomment
-- ----------------------------
DROP VIEW IF EXISTS `vw_taskcomment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_taskcomment` AS select `tsk`.`Id` AS `Id`,`tsk`.`TaskId` AS `TaskId`,`tk`.`Title` AS `TaskTitle`,`tsk`.`Comment` AS `Comment`,`us`.`UserName` AS `User`,`tsk`.`Time` AS `Datetime`,`tsk`.`IsActive` AS `IsActive` from ((`taskcomment` `tsk` left join `aspnetusers` `us` on((`tsk`.`UserId` = `us`.`Id`))) join `task` `tk` on((`tsk`.`TaskId` = `tk`.`Id`)));

-- ----------------------------
-- View structure for vw_user
-- ----------------------------
DROP VIEW IF EXISTS `vw_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_user` AS select `user`.`Id` AS `Id`,`user`.`UserName` AS `UserName`,`user`.`Email` AS `Email`,`user`.`PhoneNumber` AS `PhoneNumber`,`user`.`DirectSupervisorId` AS `DirectSupervisorId`,`us`.`UserName` AS `DirectSupervisorName`,`us`.`Email` AS `DirectSupervisorEmail` from (`aspnetusers` `user` join `aspnetusers` `us` on((`user`.`DirectSupervisorId` = `us`.`Id`)));

-- ----------------------------
-- View structure for vw_userrole
-- ----------------------------
DROP VIEW IF EXISTS `vw_userrole`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_userrole` AS select 1 AS `Id`,1 AS `UserId`,1 AS `User`,1 AS `RoleId`,1 AS `Role`,1 AS `IsActive`;

-- ----------------------------
-- View structure for vw_vocabulary
-- ----------------------------
DROP VIEW IF EXISTS `vw_vocabulary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_vocabulary` AS select `s`.`Name` AS `Story`,`vs`.`PageNo` AS `PageNo`,`v`.`Word` AS `Word`,`v`.`Pronunciation` AS `Pronunciation`,`v`.`UrduMeaning` AS `UrduMeaning`,`v`.`EnglishMeaning` AS `EnglishMeaning`,`vs`.`Sentence` AS `Sentence` from ((`story` `s` join `vocabularystory` `vs` on((`vs`.`StoryId` = `s`.`Id`))) join `vocabulary` `v` on((`v`.`Word` = `vs`.`VocabularyWord`)));

-- ----------------------------
-- Procedure structure for AlterAttachments
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterAttachments`;
delimiter ;;
CREATE PROCEDURE `AlterAttachments`(in id int, in filter varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterAttendance
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterAttendance`;
delimiter ;;
CREATE PROCEDURE `AlterAttendance`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterCompany
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterCompany`;
delimiter ;;
CREATE PROCEDURE `AlterCompany`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterExpense
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterExpense`;
delimiter ;;
CREATE PROCEDURE `AlterExpense`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterExpenseType
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterExpenseType`;
delimiter ;;
CREATE PROCEDURE `AlterExpenseType`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterFeature
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterFeature`;
delimiter ;;
CREATE PROCEDURE `AlterFeature`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterField
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterField`;
delimiter ;;
CREATE PROCEDURE `AlterField`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterFieldPossibleValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterFieldPossibleValues`;
delimiter ;;
CREATE PROCEDURE `AlterFieldPossibleValues`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterInquiry
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterInquiry`;
delimiter ;;
CREATE PROCEDURE `AlterInquiry`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterInquiryFieldData
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterInquiryFieldData`;
delimiter ;;
CREATE PROCEDURE `AlterInquiryFieldData`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterLecture`;
delimiter ;;
CREATE PROCEDURE `AlterLecture`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterLogEvent
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterLogEvent`;
delimiter ;;
CREATE PROCEDURE `AlterLogEvent`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterNotificationLog
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterNotificationLog`;
delimiter ;;
CREATE PROCEDURE `AlterNotificationLog`(in id int, in filter varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterNotificationTemplate
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterNotificationTemplate`;
delimiter ;;
CREATE PROCEDURE `AlterNotificationTemplate`(in id int, in filter varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterPermission
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterPermission`;
delimiter ;;
CREATE PROCEDURE `AlterPermission`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterServices
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterServices`;
delimiter ;;
CREATE PROCEDURE `AlterServices`(in id int, in filter varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterStudent
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterStudent`;
delimiter ;;
CREATE PROCEDURE `AlterStudent`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterStudentLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterStudentLecture`;
delimiter ;;
CREATE PROCEDURE `AlterStudentLecture`(in id int, in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterTaskComments
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterTaskComments`;
delimiter ;;
CREATE PROCEDURE `AlterTaskComments`(in id int, in filter varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterTasks
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterTasks`;
delimiter ;;
CREATE PROCEDURE `AlterTasks`(in id int, in filter varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetEnumValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetEnumValues`;
delimiter ;;
CREATE PROCEDURE `GetEnumValues`(in enumTypeId int)
BEGIN
	select * from enumvalue where enumvalue.EnumTypeId=enumTypeId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetMaxId
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetMaxId`;
delimiter ;;
CREATE PROCEDURE `GetMaxId`(IN `prm_TableName` VARCHAR ( 200 ))
BEGIN
	
	SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` );
	PREPARE stmt1 
	FROM
		@QueryStr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageAttachments
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageAttachments`;
delimiter ;;
CREATE PROCEDURE `ManageAttachments`(in id int,
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
   END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageAttendance
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageAttendance`;
delimiter ;;
CREATE PROCEDURE `ManageAttendance`(in id int,
        in userId VARCHAR(255),
        in inTime datetime,
         in outTime datetime,
        in workingHours varchar(500),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
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
      
  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageCompany
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageCompany`;
delimiter ;;
CREATE PROCEDURE `ManageCompany`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageEnumValue
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageEnumValue`;
delimiter ;;
CREATE PROCEDURE `ManageEnumValue`(in id int,
in enumTypeId int,
in value varchar(255))
BEGIN
insert into enumvalue (Id, EnumTypeId, Value) values(id, enumTypeId,value);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageExpense
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageExpense`;
delimiter ;;
CREATE PROCEDURE `ManageExpense`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageExpenseType
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageExpenseType`;
delimiter ;;
CREATE PROCEDURE `ManageExpenseType`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageFeature
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageFeature`;
delimiter ;;
CREATE PROCEDURE `ManageFeature`(in id int,
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
      
  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageField
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageField`;
delimiter ;;
CREATE PROCEDURE `ManageField`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageFieldPossibleValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageFieldPossibleValues`;
delimiter ;;
CREATE PROCEDURE `ManageFieldPossibleValues`(in id int,
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
   END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageInquiry
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageInquiry`;
delimiter ;;
CREATE PROCEDURE `ManageInquiry`(in id int,
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
        in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageInquiryFieldData
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageInquiryFieldData`;
delimiter ;;
CREATE PROCEDURE `ManageInquiryFieldData`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageLecture`;
delimiter ;;
CREATE PROCEDURE `ManageLecture`(in id int,
        in title varchar(100),
        in description varchar(8000),
        in lectureURL varchar(500),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageLogEvent
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageLogEvent`;
delimiter ;;
CREATE PROCEDURE `ManageLogEvent`(in id int,
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
      
  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageNotificationLog
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageNotificationLog`;
delimiter ;;
CREATE PROCEDURE `ManageNotificationLog`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageNotificationTemplate
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageNotificationTemplate`;
delimiter ;;
CREATE PROCEDURE `ManageNotificationTemplate`(in id int,
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
   END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManagePermissions
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManagePermissions`;
delimiter ;;
CREATE PROCEDURE `ManagePermissions`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageServices
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageServices`;
delimiter ;;
CREATE PROCEDURE `ManageServices`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageStudent
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageStudent`;
delimiter ;;
CREATE PROCEDURE `ManageStudent`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageStudentLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageStudentLecture`;
delimiter ;;
CREATE PROCEDURE `ManageStudentLecture`(in id int,
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageTask
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageTask`;
delimiter ;;
CREATE PROCEDURE `ManageTask`(in id int,
        in userId varchar(255),
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageTaskComment
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageTaskComment`;
delimiter ;;
CREATE PROCEDURE `ManageTaskComment`(in id int,
        in taskId int,
        in userId varchar(255),
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchAttachments
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchAttachments`;
delimiter ;;
CREATE PROCEDURE `SearchAttachments`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchAttendance
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchAttendance`;
delimiter ;;
CREATE PROCEDURE `SearchAttendance`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchCompany
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchCompany`;
delimiter ;;
CREATE PROCEDURE `SearchCompany`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchExpense
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchExpense`;
delimiter ;;
CREATE PROCEDURE `SearchExpense`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchExpenseType
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchExpenseType`;
delimiter ;;
CREATE PROCEDURE `SearchExpenseType`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchFeature
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchFeature`;
delimiter ;;
CREATE PROCEDURE `SearchFeature`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchField
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchField`;
delimiter ;;
CREATE PROCEDURE `SearchField`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchFieldPossibleValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchFieldPossibleValues`;
delimiter ;;
CREATE PROCEDURE `SearchFieldPossibleValues`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchInquiry
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchInquiry`;
delimiter ;;
CREATE PROCEDURE `SearchInquiry`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchInquiryFieldData
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchInquiryFieldData`;
delimiter ;;
CREATE PROCEDURE `SearchInquiryFieldData`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchLecture`;
delimiter ;;
CREATE PROCEDURE `SearchLecture`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchLogEvent
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchLogEvent`;
delimiter ;;
CREATE PROCEDURE `SearchLogEvent`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchNotificationLog
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchNotificationLog`;
delimiter ;;
CREATE PROCEDURE `SearchNotificationLog`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchNotificationTemplate
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchNotificationTemplate`;
delimiter ;;
CREATE PROCEDURE `SearchNotificationTemplate`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchPermissions
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchPermissions`;
delimiter ;;
CREATE PROCEDURE `SearchPermissions`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchServices
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchServices`;
delimiter ;;
CREATE PROCEDURE `SearchServices`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchStudent
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchStudent`;
delimiter ;;
CREATE PROCEDURE `SearchStudent`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchStudentLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchStudentLecture`;
delimiter ;;
CREATE PROCEDURE `SearchStudentLecture`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchTaskComments
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchTaskComments`;
delimiter ;;
CREATE PROCEDURE `SearchTaskComments`(in whereClause varchar(5000))
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchTasks
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchTasks`;
delimiter ;;
CREATE PROCEDURE `SearchTasks`(in whereClause varchar(5000))
BEGIN

     set @querystr ='SELECT * 
			FROM
			vw_task';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
