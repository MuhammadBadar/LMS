import { Component, Injector, ViewChild } from '@angular/core';
import { SCHService } from '../sch.serivce';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../../catalog/catalog.service';
import { ScheduleDayVM, ScheduleVM } from '../Models/ScheduleVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';

import { Location } from '@angular/common';
import { NgForm } from '@angular/forms';
import { UserVM } from '../../security/models/user-vm';
import { SecurityService } from '../../security/security.service';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { ManageUserComponent } from '../../security/manage-user/manage-user.component';
import { RoleVM } from '../../security/models/role-vm';
import { ManageRoleComponent } from '../../security/manage-role/manage-role.component';
import { Entities } from  '../models/Enums/Entities';
import { ScheduleTypes } from  '../models/Enums/ScheduleTypes';
import { ActivatedRoute } from '@angular/router';
import * as moment from 'moment';
import { ManageScheduleListComponent } from '../manage-schedule-list/manage-schedule-list.component';
import { ManageScheduleDayEventComponent } from '../manage-schedule-day-event/manage-schedule-day-event.component';
@Component({
  selector: 'app-manage-schedule',
  templateUrl: './manage-schedule.component.html',
  styleUrls: ['./manage-schedule.component.css']
})
export class ManageScheduleComponent {


  @ViewChild('scheduleForm', { static: true }) scheduleForm!: NgForm;
  displayedColumns: string[] = [`user`,`role`,`scheduleType`,`workingType`,`workingHours`,`day`,'isActive'];
   displayedRoles: string[] = [`role`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
   displayedUsers: string[] = [`user`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
   ScheduleDayEvent: ScheduleDayVM[] = []
   selectedDayEvent = new ScheduleDayVM
  @ViewChild('ScheduleDayEventsForm', { static: true }) ScheduleDayEventsForm!: NgForm;
  selectedSchedule: ScheduleVM;
  selectedDayevent: ScheduleDayVM;
  users: UserVM[] | undefined;
  ScheduleDay: ScheduleDayVM[] = []
  dialogRef: any;
  DayEvent: ScheduleDayVM[] |  any;
  Schedule: ScheduleVM[] |  any;
  dataSource: any;
  DayEventSource: any;
  proccessing: boolean | undefined;
  AddMode: boolean = true
  EditMode: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  dialogData: any;
  user: number;
  role: number;
  FH: number;
  FWH: number;
  ScheduleId!: number
  getSchById!: ScheduleVM[];
  //selectedSchedule!: ScheduleVM;
  
  dialogRefe: any;
  Entities: SettingsVM[];
  ScheduleType: SettingsVM[];
  WorkingType: SettingsVM[];
  EventType: SettingsVM[];
  Location: SettingsVM[];
  WeekDays: SettingsVM[];
  roles: RoleVM[];
  currentLightBoxImage: any
  displayeScheduleColumns: string[] = ['day','location','startTime', 'endTime', 'eventType','isActive','actions'];
  addButton = true
  lineAddMode: boolean = false
  lineEditMode: boolean = true
  UserId!: string
  
  
  

  constructor(private injector: Injector,
    private schSvc: SCHService,
    private _location: Location,
    private route: ActivatedRoute,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public securitySvc: SecurityService,
   ) {
    this.selectedSchedule = new ScheduleVM
    this.selectedDayEvent = new ScheduleDayVM()
    this.user= Entities.user;
    this.role=Entities.role;
    this.FH= ScheduleTypes.FH;
    this.FWH=ScheduleTypes.FWH;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }





  
  ngOnInit(): void {
    this.GetSchedule();
    // this.GetScheduleDayEvents();
    this.GetUser();
    this.GetRole();
      //  this.GetSettings(EnumTypeVM.Entities)
      //  this.GetSettings(EnumTypeVM.WeekDays)
      //  this.GetSettings(EnumTypeVM.ScheduleType)
      //  this.GetSettings(EnumTypeVM.WorkingType)
      //  this.GetSettings(EnumTypeVM.EventType)
      //  this.GetSettings(EnumTypeVM.Location)
       this.selectedSchedule.isActive = true;
       this.route.queryParams.subscribe(params => {
        this.ScheduleId = params['id'];
      });
  
       if (this.ScheduleId > 0) {
        this.Edit = true;
        this.Add = false;
        this.GetScheduleById();
        
      }
      else {
        this.Add = true;
        this.Edit = false;
        this.dataSource = new MatTableDataSource(this.ScheduleDay);
      }
      this.lineAddMode = false;
      this.lineEditMode = false;
      this.GetSettings(EnumTypeVM.Entities)
      this.GetSettings(EnumTypeVM.WeekDays)
      this.GetSettings(EnumTypeVM.ScheduleType)
      this.GetSettings(EnumTypeVM.WorkingType)
      this.GetSettings(EnumTypeVM.EventType)
      this.GetSettings(EnumTypeVM.Location)
      // ... and so on for other settings
      
     
  } 
  
   GetScheduleById() {
    debugger
    this.schSvc.GetScheduleById(this.ScheduleId).subscribe({
      next: (res: ScheduleVM[]) => {
        debugger
        this.getSchById = res;
        this.selectedSchedule = this.getSchById[0]
        this.ScheduleDayEvent = []
        this.selectedSchedule.scheduleDays?.forEach(element => {
          this.ScheduleDay.push(element)
        });
        this.dataSource = new MatTableDataSource(this.ScheduleDay);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  RefreshDetail() {
    this.lineAddMode = false;
    this.addButton = true
    this.lineEditMode = false;
    this.selectedDayEvent = new ScheduleDayVM
    if (this.ScheduleId > 0)
      this.GetScheduleById()
  }
  GetSettings(etype: EnumTypeVM) {
    var setting = new SettingsVM()
    setting.enumTypeId = etype
    setting.isActive = true
    this.catSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype === EnumTypeVM.Entities) {
          this.Entities = res;
        } else if (etype === EnumTypeVM.ScheduleType) {
          this.ScheduleType = res;
        }else if (etype === EnumTypeVM.WeekDays) {
          this.WeekDays = res;
        }else if (etype === EnumTypeVM.WorkingType) {
          this.WorkingType = res;
        }else if (etype === EnumTypeVM.EventType) {
          this.EventType = res;
        }else if (etype === EnumTypeVM.Location) {
          this.Location = res;
        }
      }, error: (e) => {
        alert("t");
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetRole() {
    var role = new RoleVM
    role.isActive = true;
    this.securitySvc.getRolesList().subscribe({
      next: (res: RoleVM[]) => {
        this.roles = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  OpenRoleDialog() {
    // this.isDialogOpen = true;
     this.dialogRef = this.dialog.open(ManageRoleComponent, {
       width: '1200px',
       height: '950px',
       });
   
     this.dialogRef.afterClosed().subscribe((res: any) => {
      this.GetRole();
        });
   }
  GetUser() {
    var user = new UserVM
    user.isActive = true;
    this.securitySvc.getUserList().subscribe({
      next: (res: UserVM[]) => {
        this.users = res;
        }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  OpenUserDialog() {
   this.dialogRef = this.dialog.open(ManageUserComponent, {
      width: '1200px',
      height: '950px',
     });
  
    this.dialogRef.afterClosed().subscribe((res: any) => {
     this.GetUser();
     });
  }
  OpenScheduleDialog() {
    this.dialogRef = this.dialog.open(ManageScheduleListComponent, {
       width: '1200px',
       height: '950px',
      });
   
     this.dialogRef.afterClosed().subscribe((res: any) => {
      this.GetSchedule();
      });
   }
   OpenDayEventDialog(row : ScheduleDayVM) {
    // debugger;
    this.schSvc.selectedScheduleDayId = row.id;
    this.dialogRef = this.dialog.open(ManageScheduleDayEventComponent, {
       width: '1200px',
       height: '550px',
       data: { isDialog: true, scheduleLine: row }
      });
      console.warn(this.selectedSchedule.dayIds)   
      this.dialogRef.afterClosed().subscribe((res: any) => {
      //this.GetScheduleFH();
      });
   }
  
  GetSchedule() {
    debugger;
    var Sch = new ScheduleVM
    Sch.isActive= true;
    this.schSvc.GetSchedule().subscribe({
      next: (value: ScheduleVM[]) => {
        this.Schedule = value
        console.warn(this.Schedule)
        this.dataSource = new MatTableDataSource(this.Schedule)
       
      }, error: (err) => {
        alert("i");
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  CheckSchedulesValidation() {
    if (this.selectedSchedule.workingTypeId === 0 || this.selectedSchedule.workingTypeId === undefined) {
      this.scheduleForm.form.controls['workingTypeId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  CheckScheduleTypeValidation() {
    if (this.selectedSchedule.scheduleTypeId === 0 || this.selectedSchedule.scheduleTypeId === undefined) {
      this.scheduleForm.form.controls['scheduleTypeId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  CheckScheduleValidation() {
    if (this.selectedSchedule.entityId === 0 || this.selectedSchedule.entityId === undefined) {
      this.scheduleForm.form.controls['entityId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  // validateScheduleEvent() {
   
  //   if (this.selectedDayEvent.eventTypeId === 0 || this.selectedDayEvent.eventTypeId === undefined) {
  //     this.ScheduleDayEventsForm.form.controls['eventTypeId'].setErrors({ 'incorrect': true });
  //     return false;
  //   }
  //   return true;
  // }
  validateScheduleDay() {
      if (this.selectedDayEvent.dayId === 0 || this.selectedDayEvent.dayId === undefined) {
        this.ScheduleDayEventsForm.form.controls['dayId'].setErrors({ 'incorrect': true });
        return false;
      }
      return true;
      }
  // validateScheduleLocation() {
  //     if (this.selectedDayEvent.locationId === 0 || this.selectedDayEvent.locationId === undefined) {
  //       this.ScheduleDayEventsForm.form.controls['locationId'].setErrors({ 'incorrect': true });
  //       return false;
  //     }
  //     return true;   
  //   }
    
  // SaveScheduleDayEvents() {
  //     debugger;
  //     const controls = this.ScheduleDayEventsForm.controls;
  //     if (this.ScheduleDayEventsForm.invalid) {
  //       for (const name in controls) {
  //         if (controls[name].invalid) {
  //           this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
  //           break
  //         }
  //       }
  //   }
  //   else { 
  //     const ScheduleEventTypeValid = this.validateScheduleEvent();
  //     const DaytypeValid = this.validateScheduleDay();
  //     const LocationTypeIsValid = this.validateScheduleLocation();

  //   if (!DaytypeValid && !LocationTypeIsValid && !ScheduleEventTypeValid) 
  //   {
  //     this.catSvc.ErrorMsgBar("Please fill all required fields", 5000);
  //   } 
  //   else if (!ScheduleEventTypeValid) {
  //     this.catSvc.ErrorMsgBar("EventType is a required field", 5000);
  //   } else if (!DaytypeValid) {
  //     this.catSvc.ErrorMsgBar("Daytype is a required field", 5000);
  //   } else if (!LocationTypeIsValid) {
  //     this.catSvc.ErrorMsgBar("Location is a required field", 5000);
  //   }

  //   if (DaytypeValid && DaytypeValid && !this.ScheduleDayEventsForm.invalid) {
  //     this.lmsSvc.SaveSchedule(this.DayEvent).subscribe({
  //       next: (value) => { 
  //         this.catSvc.SuccessMsgBar("Successfully Added", 5000);
  //         this.Refresh();
  //       },
  //       error: (err) => {
  //         this.catSvc.ErrorMsgBar("Error Occurred", 5000);
  //       },
  //     });
  //   }else {
  //     this.proccessing = true
  //     if (this.Edit) {
  //       this.UpdateScheduleFH();
  //     } else {
  //       this.lmsSvc.GetSchedule().subscribe((data: any) => {
              
  
  //         if (data.succeeded == true) {
  //                 Swal.fire({
  //                   icon: 'success',
  //                   position: 'center',
  //                   text: 'Added Successfully',
  //                   background: "#FFFFFF",
  //                   confirmButtonColor: "#000000"
                    
  //                 })
  //                 this.ngOnInit();
  //                 this.Refresh();
  //               }
  //               else {
  //                 console.warn(data)
  //               } 
  //               window.scrollTo(0, 0);
  //           this.proccessing = false;
              
  //         }, (err: any) => {
  //           console.warn(err);
  //           this.catSvc.ErrorMsgBar("Error Occurred !", 6000);
  //           this.proccessing = false;
  //         });
  //     }}
    
  //   }
  // }
  
  SaveScheduleDay() {
    // Check if both user and schedule type are selected
    if(this.selectedSchedule.userId == null || this.selectedSchedule.userId == undefined)
    {
      
      // selectedScheduleFH.userId
      this.catSvc.ErrorMsgBar("Please select User.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
    debugger;
    if(this.selectedSchedule.scheduleTypeId <= 0)
    {
      this.catSvc.ErrorMsgBar("Please select Schedule Type.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
    if(this.selectedSchedule.dayIds <= [] )
    {
      this.catSvc.ErrorMsgBar("Please select Day.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }

    // if (!this.selectedScheduleFH.user && !this.selectedScheduleFH.scheduleType) {
    //   // Display an error message if either user or schedule type is missing
    //   this.catSvc.ErrorMsgBar("Please select both User and Schedule Type.", 5000);
    //   return; // Exit the function if either user or schedule type is empty
    // }
  
    // Proceed with saving
    this.schSvc.SaveSchedule(this.selectedSchedule).subscribe({
      next: (res: ScheduleVM) => {
        console.warn(res);
        debugger;
        this.catSvc.SuccessMsgBar("Successfully Added!", 5000);
        this.selectedSchedule = res;
        this.ScheduleDay = [];
        this.selectedSchedule.scheduleDays?.forEach((element) => {
          this.ScheduleDay.push(element);
        });
        debugger;
        this.DayEventSource = new MatTableDataSource(this.ScheduleDay);
        console.warn(this.ScheduleDay);
        // this.Refresh()
      },
      error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
        console.warn(e);
        this.ScheduleDay = [];
        this.proccessing = false;
      },
    });
  }
  
  
  
  //  Refresh() {
  //    this.GetSchline();
  //    this.selectedSch = new SchVM
  //    this.EditMode = false
  //    this.AddMode = true
  //    // this.selectedAttendance.isActive = true;
  //  }
  
  EditScheduleFH(schedule: ScheduleVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedSchedule = schedule
  }
  UpdateSchedule() {
   this.schSvc.SaveSchedule(this.selectedSchedule).subscribe({
      next: (res: ScheduleVM) => {
     
     
        this.proccessing = false
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.ScheduleDay = []
        this.proccessing = false
      }
    })
  }
  Refresh() {
    this.GetSchedule();
    this.selectedSchedule = new ScheduleVM
    this.EditMode = false
    this.AddMode = true
    this.selectedSchedule.isActive = true;
  }
  DeleteSchedule(id: number) {
  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!'
  }).then((result) => {
    if (result.value) {
      this.schSvc.DeleteSchedule(id).subscribe({
        next: (data) => {
          Swal.fire(
            'Deleted!',
            'Topic has been deleted.',
            'success'
          )
          this.Refresh();
        }, error: (e) => {
          alert("e");
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  })
} 
// Search(){
//   debugger
//      var sch = new ScheduleVM
//      sch.isActive = true;
//      sch.topicId = this.selectedTask.topicId;
//      this.lmsSvc.SearchLecture(lecture).subscribe({
//        next: (res: LectureVM[]) => {
//          this.lecs = res
//        }, error: (err) => {
//          this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//        },
//      })
//      var  topic = new TopicVM();
//      topic.courseId = this.selectedTask.courseId;
//       topic.isActive = true;
//      this.lmsSvc.SearchTopic(topic).subscribe({
//       next: (value: TopicVM[]) => {
//         this.topics = value
//       }, error: (err) => {
//         this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//       },
//     })
     
//       var  lec = new AssignTaskVM();
//       lec.courseId = this.selectedTask.courseId;
//       this.lmsSvc.SearchAssignTask(lec).subscribe({
//        next: (value: AssignTaskVM[]) => {
//          this.tasks = value
//          this.dataSource = new MatTableDataSource(this.tasks)
//        }, error: (err) => {
//          this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//        },
//       })
//      }
async AddDayEventtoList() {
  debugger;
  var list = this.ScheduleDay

      this.validateScheduleDay()
      if (!this.ScheduleDayEventsForm.invalid) {
          if (!this.ScheduleDayEventsForm.invalid) {
          this.selectedDayEvent.dBoperation = 1
         this.ScheduleDay.push(this.selectedDayEvent)
           this.selectedSchedule.scheduleDays?.push(this.selectedDayEvent)
          this.DayEventSource= new MatTableDataSource(this.ScheduleDay)
         }

        else {
          this.catSvc.ErrorMsgBar("Please fill all required fields of Schedule DayEvent ", 5000)
        }
      } else {
        this.catSvc.ErrorMsgBar("Please fill all required fields of Schedule", 5000)
       }
 
}

     
//      async onBlur() {
//   console.warn(this.selectedScheduleFH.id)
//   if (this.selectedScheduleFH.id > 0) {
//     if (!this.scheduleFHForm.invalid) {
//       this.SetDates()
//       this.lmsSvc.UpdateSchedule(this.selectedScheduleFH).subscribe({
//         next: (res: ScheduleVM) => {
//           this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
//         }, error: (e: any) => {
//           this.catSvc.ErrorMsgBar("Error Occurred", 5000)
//           console.warn(e);
//           this.proccessing = false
//         }
//       })
//     } else {
//       this.catSvc.ErrorMsgBar("Please fill all required fields", 5000)
//     }
//   }
// }
SetDates() {
  this.selectedSchedule.startDate = moment(this.selectedSchedule.startDate).toDate()
  this.selectedSchedule.startDate = new Date(Date.UTC(this.selectedSchedule.startDate.getFullYear(), this.selectedSchedule.startDate.getMonth(), this.selectedSchedule.startDate.getDate()))

}
// Back() {
//   this._location.back();
// }
//  Submit() {
//   debugger;
//     this.selectedScheduleFH.ScheduleDaysEvents = this.ScheduleDay
//   this.proccessing = true
//     debugger
//     if (this.selectedScheduleFH.ScheduleDaysEvents.length == 0)
//       this.catSvc.ErrorMsgBar("Please Add some Schedule Detail!", 5000)
//     else
//     this.lmsSvc.SaveSchedule(this.selectedScheduleFH).subscribe({
//       next: (res: ScheduleVM) => {
     
     
//         this.proccessing = false
//       }, error: (e: any) => {
//         this.catSvc.ErrorMsgBar("Error Occurred", 5000)
//         console.warn(e);
//         this.ScheduleDay = []
//         this.proccessing = false
//       }
//     })
 
//   this.proccessing = false
// }
Submit() {
  if (!this.selectedSchedule.scheduleTypeId) {
    this.catSvc.ErrorMsgBar("Please fill in all required fields.", 5000);
    return; // Exit the function if any required field is empty
  }

  this.schSvc.SaveSchedule(this.selectedSchedule).subscribe({
    next: (value) => {
      this.catSvc.SuccessMsgBar("Successfully Added", 5000);
      // this.Refresh();
    }, 
    error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000);
    },
  });
}
// handleFileInput(e: any) {
//   debugger
//   for (let index = 0; index < e.target.files.length; index++) {
//     var reader = new FileReader();
//     reader.readAsDataURL(e.target.files[index]);

//     reader.onload = (event: any) => {
//       this.selectedScheduleFH.scheduleType = event.target.result
//     };
//   }
//   this.onBlur()
// }
Search(){ debugger;
  var  usr = new ScheduleVM();
  usr.userId = this.selectedSchedule.userId;
  this.schSvc.SearchSchedule(usr).subscribe({
   next: (value: ScheduleVM[]) => {
     this.Schedule = value
     this.dataSource = new MatTableDataSource(this.Schedule)
   }, error: (err) => {
     this.catSvc.ErrorMsgBar("Error Occurred", 5000)
   },
 })}

 getScheduleByUserId(val: any){
  debugger
  //alert(val);
  this.UserId=val;
  
  this.schSvc.GetScheduleByUserId(this.UserId).subscribe({
    next: (val: ScheduleVM) => {
      debugger
      this.selectedSchedule = val;
      //alert('sch Id: ' + this.selectedScheduleFH.id);
      // alert('scheduleDay Id: ' + this.selectedScheduleFH.dayIds);
      this.schSvc.selectedScheduleId = this.selectedSchedule.id;
      //this.lmsSvc.selectedScheduleDayId = this.selectedScheduleFH.dayIds;
      this.ScheduleDayEvent = []
      this.selectedSchedule.scheduleDays?.forEach(element => {
        this.ScheduleDay.push(element)
      });

      debugger;
      this.ScheduleDay = this.selectedSchedule.scheduleDays;
      debugger;
      this.dataSource = new MatTableDataSource(this.ScheduleDay);
    }, error: (e) => {
      this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
      console.warn(e);
    }
  })
 }

// getScheduleByUserId(val: any){
//   debugger;
//   this.lmsSvc.GetScheduleByUserId(this.UserId).subscribe({
//     next: (val: ScheduleVM) => {
//       console.log('Subscription next', val); // Add this line for debugging
//       this.selectedScheduleFH = val;
//       this.ScheduleDayEvent = []
//       this.selectedScheduleFH.scheduleDays?.forEach(element => {
//         this.ScheduleDay.push(element)
//       });
//       this.dataSource = new MatTableDataSource(this.ScheduleDay);
//     },
//     error: (e) => {
//       console.error('Subscription error', e); // Add this line for debugging
//       this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
//       console.warn(e);
//     }
//   })
  
// }
 
// Search() {
//   debugger;
//   var usr = new ScheduleVM();
//   usr.userId = this.selectedScheduleFH.userId;
//   console.warn(usr);
//   this.lmsSvc.SearchSchedule(usr).subscribe({
//     next: (value: ScheduleVM[]) => {
//       this.ScheduleFH= value
//       this.dataSource = new MatTableDataSource(this.ScheduleFH)
   
//     }, error: (err) => {
//       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
//    console.warn(err) ;
//   },
//   })
  
// }

}