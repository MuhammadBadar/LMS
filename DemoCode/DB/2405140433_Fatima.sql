
-- ----------------------------
-- Table structure for acc_chartofaccount
-- ----------------------------
DROP TABLE IF EXISTS `acc_chartofaccount`;
CREATE TABLE `acc_chartofaccount`  (
  `Id` int NOT NULL,
  `ParentCoaId` int NULL DEFAULT NULL,
  `CoaCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CoaDesc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CoaLevelId` int NOT NULL,
  `CoaTypeId` int UNSIGNED NOT NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `CreatedById` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsActive` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY ( `Id`) USING BTREE,
  UNIQUE INDEX `CoaCode`(`CoaCode` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;


-- ----------------------------
-- Procedure structure for ACC_Manage_ChartOfAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `ACC_Manage_ChartOfAccount`;
delimiter ;;
CREATE PROCEDURE `ACC_Manage_ChartOfAccount`(in prm_id int
			  ,in prm_coaCode  varchar(50) 
	    	,in prm_coaLevelId int 
		    ,in prm_parentCoaId varchar(50) 
		    ,in prm_CoaTypeId int 
        ,in prm_CoaDesc  varchar(500) 
		    ,in prm_createdOn datetime
        ,in prm_createdById int
        ,in prm_modifiedOn datetime
        ,in prm_modifiedById int
        ,in prm_isActive bit
        ,in prm_dBoperation varchar(50))
BEGIN
if prm_dBoperation = 'Insert'
then
           insert into  Acc_ChartOfAccount (
					  Id 
           ,CoaCode
           ,CoaLevelId
           ,ParentCoaId
           ,CoaTypeId
           ,CoaDesc
           ,CreatedOn
           ,CreatedById
           ,ModifiedOn
           ,ModifiedById
           ,IsActive ) 
           values (prm_id
           ,prm_coaCode
           ,prm_coaLevelId
           ,prm_parentCoaId
           ,prm_coaTypeId
           ,prm_coaDesc
           ,prm_createdOn
           ,prm_createdById
           ,prm_modifiedOn
           ,prm_modifiedById
           ,prm_isActive );
 end if;   
/*update*/
 if prm_dBoperation ='Update'
 then
            update  Acc_ChartOfAccount set 
						   CoaCode=prm_coaCode
						  ,CoaLevelId=prm_coalevelId
						  ,ParentCoaId=prm_parentCoaId
						  ,CoaTypeId=prm_coaTypeId 
						  ,CoaDesc=prm_CoaDesc
						  ,CreatedOn=prm_createdOn
						  ,CreatedById=prm_createdById
						  ,ModifiedOn=prm_modifiedOn
						  ,ModifiedById=prm_modifiedById
						  ,IsActive=prm_isActive						 
    where  Acc_ChartOfAccount.Id =prm_Id ;
end if;
IF prm_dBoperation = 'Delete'
    then
            delete from Acc_ChartOfAccount
		where
			  Acc_ChartOfAccount.Id =prm_Id;
END if;
IF prm_dBoperation = 'Activate'
    then
            update   Acc_ChartOfAccount set IsActive=1
		where 
			  Acc_ChartOfAccount.Id =prm_Id;
END if;
IF prm_dBoperation = 'DeActivate'
    then
            update  Acc_ChartOfAccount set IsActive=0
		where
			   Acc_ChartOfAccount.Id =prm_Id; 
END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ACC_Search_ChartOfAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `ACC_Search_ChartOfAccount`;
delimiter ;;
CREATE PROCEDURE `ACC_Search_ChartOfAccount`(prm_WhereClause VARCHAR ( 2000 ), prm_Start INT, prm_Limit INT)
BEGIN
			DECLARE
				offsetVal INT DEFAULT 0;
			IF
				prm_Start < 1 THEN
					
			SET prm_Start = 1;
				
			END IF;
			SET prm_Start = prm_Start - 1;
			SET offsetVal = prm_Start * prm_Limit;
				
			SET @QueryStr = "SELECT			
			Count(acc.Id) INTO @TotalRecords			
			FROM			
			acc_chartofaccount as acc 
			left join enumline as type on (type.Id= acc.CoaTypeId )
			 
			 left join enumline as level on (level.Id= acc.CoaLevelId )
			 
			 left join ACC_ChartOfAccount parentAcc on 
			 (parentAcc.Id=acc.ParentCoaId )
			";
			
			SET @QueryStr = CONCAT( @QueryStr, prm_WhereClause );
			PREPARE stmt1 
			FROM
				@QueryStr;
			EXECUTE stmt1;
			DEALLOCATE PREPARE stmt1;
				
			
     set @querystr ='select 
		  acc.Id ,
		  acc.CoaCode ,
			acc.CoaDesc,
			acc.CoaLevelId,
			level.Name as CoaLevel,
			acc.ParentCoaId ,
	    parentAcc.CoaCode as ParentCoaCode,
			parentAcc.CoaDesc as ParentCoaDesc,
			acc.CoaTypeId ,
			type.Name as CoaType,
			@TotalRecords As TotalRecords,
			acc.IsActive 
			
			FROM
			`restaurant`.`ACC_ChartOfAccount` as acc 
			
			 left join enumline as type on (type.Id= acc.CoaTypeId )
			 
			 left join enumline as level on (level.Id= acc.CoaLevelId )
			 
			 left join ACC_ChartOfAccount parentAcc on 
			 (parentAcc.Id=acc.ParentCoaId )
			 ';
    set @querystr= concat(@querystr,prm_WhereClause, ' LIMIT ', offsetVal, ',', prm_Limit );
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END

