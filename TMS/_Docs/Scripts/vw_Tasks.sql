select `tsk`.`Id` AS `Id`,`tsk`.`UserId` AS `UserId`,`user`.`UserName` AS `User`,`user`.`Email` AS `UserMail`,`user`.`DirectSupervisorId` AS `DirectSupervisorId`,`user`.`PhoneNumber` AS `DirectSupervisorPhoneNumber`,`us`.`UserName` AS `DirectSupervisorName`,`us`.`Email` AS `DirectSupervisorEmail`,`us`.`PhoneNumber` AS `UserPhoneNumber`,`tsk`.`StatusId` AS `StatusId`,`env2`.`Value` AS `TaskStatus`,`tsk`.`PriorityId` AS `PriorityId`,`env1`.`Value` AS `TaskPriority`,`tsk`.`Title` AS `Title`,`tsk`.`SP` AS `SP`,`tsk`.`Description` AS `Description`,`tsk`.`IsActive` AS `IsActive` 
from ((((`task` `tsk` 
left join `enumvalue` `env2` on((`tsk`.`StatusId` = `env2`.`Id`))) 
left join `enumvalue` `env1` on((`tsk`.`PriorityId` = `env1`.`Id`))) 
left join `aspnetusers` `user` on((`tsk`.`UserId` = `user`.`Id`))) 
left join `aspnetusers` `us` on((`user`.`DirectSupervisorId` = `us`.`Id`)))
