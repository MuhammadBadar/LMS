INSERT INTO `attendance` (`Id`,`UserId`,`InTime`,`OutTime`,`WorkedHours`,`Date`)
VALUES ( 1 ,'44fb345f-be12-4d99-8a0d-f1c5063f4999','12:00','17:40',5,NOW());

INSERT INTO `Tasks` (
	 `Id`,`UserId`,`PriorityId`,`StatusId`,`ModuleId`,`TaskTitle`,`StoryPoints`,`SPs`,`Date`,`DayEndStatus`)
VALUES ( 1 ,'44fb345f-be12-4d99-8a0d-f1c5063f4999','1011001','1010001','1012002','this is testingg of taskssssss','Scripts to add Tasks',0.5,NOW(),5);


INSERT INTO `schedule` (
  `Id`,`UserId`,`EntityId`,`ScheduleTypeId`,`WorkingTypeId`,`WorkingHours`,`StartDate`,
  `EndDate`,`CreatedOn`,`ModifiedOn`,`IsActive`)
  VALUES (1,'44fb345f-be12-4d99-8a0d-f1c5063f4999',1005001,1006002,1007003,'8Hours',
  '2023-08-01 08:00:00','2023-08-05 17:00:00',NOW(),NOW(),1);

UPDATE `attendance`
SET `Date` = NOW()
WHERE `Id` = 18; 

DELETE FROM `attendance`
WHERE `Id` = 5;

SELECT * FROM lms.vw_userattbydate;
SELECT * FROM lms.vw_attendance;
SELECT * FROM lms.attendance;