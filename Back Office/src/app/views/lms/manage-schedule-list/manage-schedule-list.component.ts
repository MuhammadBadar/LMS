import { Component, Injector, ViewChild } from '@angular/core';
import { ScheduleDayVM, ScheduleVM } from '../Models/ScheduleVM';
import Swal from 'sweetalert2';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { SecurityService } from '../../security/security.service';
import { LMSService } from '../lms.service';
import { MatTableDataSource } from '@angular/material/table';
import { NgForm } from '@angular/forms';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { RoleVM } from '../../security/models/role-vm';
import { ActivatedRoute } from '@angular/router';
import { Entities } from '../models/Enums/Entities';
import { ScheduleTypes } from '../models/Enums/ScheduleTypes';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { ManageRoleComponent } from '../../security/manage-role/manage-role.component';
import { ManageUserComponent } from '../../security/manage-user/manage-user.component';
import * as moment from 'moment';
import { UserVM } from '../../security/models/user-vm';

@Component({
  selector: 'app-manage-schedule-list',
  templateUrl: './manage-schedule-list.component.html',
  styleUrls: ['./manage-schedule-list.component.css']
})
export class ManageScheduleListComponent {
  @ViewChild('scheduleFHForm', { static: true }) scheduleFHForm!: NgForm;
  displayedColumns: string[] = [`user`,`role`,`scheduleType`,`workingType`,`workingHours`,`startDate`,`endDate`,`day`,'isActive'];
   displayedRoles: string[] = [`role`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
   displayedUsers: string[] = [`user`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
   ScheduleDayEvent: ScheduleDayVM[] = []
   selectedDayEvent = new ScheduleDayVM
  @ViewChild('ScheduleDayEventsForm', { static: true }) ScheduleDayEventsForm!: NgForm;
  selectedScheduleFH: ScheduleVM;
  selectedDayevent: ScheduleDayVM;
  users: UserVM[] | undefined;
  ScheduleDay: ScheduleDayVM[] = []
  dialogRef: any;
  DayEvent: ScheduleDayVM[] |  any;
  ScheduleFH: ScheduleVM[] |  any;
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
  dialogRefe: any;
  Entities: SettingsVM[];
  ScheduleType: SettingsVM[];
  WorkingType: SettingsVM[];
  EventType: SettingsVM[];
  Location: SettingsVM[];
  WeekDays: SettingsVM[];
  roles: RoleVM[];
  currentLightBoxImage: any
  displayeScheduleColumns: string[] = ['startTime', 'endTime', 'location', 'eventType','isActive'];
  addButton = true
  lineAddMode: boolean = false
  lineEditMode: boolean = true
  isDialog: boolean = false;
  dialogref: any;
  
  

  constructor(private injector: Injector,
    private lmsSvc: LMSService,
    
    private route: ActivatedRoute,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public securitySvc: SecurityService,
   ) {
    this.selectedScheduleFH = new ScheduleVM
    this.selectedDayEvent = new ScheduleDayVM()
    this.user= Entities.user;
    this.role=Entities.role;
    this.FH= ScheduleTypes.FH;
    this.FWH=ScheduleTypes.FWH;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }





  
  ngOnInit(): void {
    this.GetScheduleFH();
    // this.GetScheduleById();
    // this.GetScheduleDayEvents();
    this.GetUser();
    this.GetRole();
      //  this.GetSettings(EnumTypeVM.Entities)
      //  this.GetSettings(EnumTypeVM.WeekDays)
      //  this.GetSettings(EnumTypeVM.ScheduleType)
      //  this.GetSettings(EnumTypeVM.WorkingType)
      //  this.GetSettings(EnumTypeVM.EventType)
      //  this.GetSettings(EnumTypeVM.Location)
       this.selectedScheduleFH.isActive = true;
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
    this.lmsSvc.GetScheduleById(this.ScheduleId).subscribe({
      next: (res: ScheduleVM[]) => {
        debugger
        this.getSchById = res;
        this.selectedScheduleFH = this.getSchById[0]
        this.ScheduleDayEvent = []
        this.selectedScheduleFH.scheduleDays?.forEach(element => {
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
  
  GetScheduleFH() {
    var Schfh = new ScheduleVM
    Schfh.isActive= true;
    this.lmsSvc.GetSchedule().subscribe({
      next: (value: ScheduleVM[]) => {
        this.ScheduleFH = value
        console.warn(this.ScheduleFH)
        this.dataSource = new MatTableDataSource(this.ScheduleFH)
       
      }, error: (err) => {
        alert("i");
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  CheckSchedulesValidation() {
    if (this.selectedScheduleFH.workingTypeId === 0 || this.selectedScheduleFH.workingTypeId === undefined) {
      this.scheduleFHForm.form.controls['workingTypeId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  CheckScheduleTypeValidation() {
    if (this.selectedScheduleFH.scheduleTypeId === 0 || this.selectedScheduleFH.scheduleTypeId === undefined) {
      this.scheduleFHForm.form.controls['scheduleTypeId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  CheckScheduleValidation() {
    if (this.selectedScheduleFH.entityId === 0 || this.selectedScheduleFH.entityId === undefined) {
      this.scheduleFHForm.form.controls['entityId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  validateScheduleEvent() {
   
    if (this.selectedDayEvent.eventTypeId === 0 || this.selectedDayEvent.eventTypeId === undefined) {
      this.ScheduleDayEventsForm.form.controls['eventTypeId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  validateScheduleDay() {
      if (this.selectedDayEvent.dayId === 0 || this.selectedDayEvent.dayId === undefined) {
        this.ScheduleDayEventsForm.form.controls['dayId'].setErrors({ 'incorrect': true });
        return false;
      }
      return true;
      }
  validateScheduleLocation() {
      if (this.selectedDayEvent.locationId === 0 || this.selectedDayEvent.locationId === undefined) {
        this.ScheduleDayEventsForm.form.controls['locationId'].setErrors({ 'incorrect': true });
        return false;
      }
      return true;
    
      
    }
    
  SaveScheduleFH() {
    this.lmsSvc.SaveSchedule(this.selectedScheduleFH).subscribe({
      next: (res: ScheduleVM) => {
        this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
        this.selectedScheduleFH = res
        this.DayEvent = []
        this.selectedScheduleFH.scheduleDays?.forEach(element => {
          this.DayEvent.push(element)
        });
        this.dataSource = new MatTableDataSource(this.DayEvent);
        console.warn(this.DayEvent) 
        this.RefreshDetail()
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.DayEvent = []
        this.proccessing = false
      }
    })
   }
  EditScheduleFH(scheduleFH: ScheduleVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedScheduleFH = scheduleFH
  }
  UpdateScheduleFH() {
  //   this.lmsSvc.UpdateSchedule(this.selectedScheduleFH).subscribe({
  //     next: (value) => {
  //       this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
  //       this.Refresh();
  //     }, error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //     },
  //   })
  // }
   this.lmsSvc.SaveSchedule(this.selectedScheduleFH).subscribe({
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
    this.GetScheduleFH();
    this.selectedScheduleFH = new ScheduleVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteScheduleFH(id: number) {
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
      this.lmsSvc.DeleteSchedule(id).subscribe({
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
           this.selectedScheduleFH.scheduleDays?.push(this.selectedDayEvent)
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
  this.selectedScheduleFH.startDate = moment(this.selectedScheduleFH.startDate).toDate()
  this.selectedScheduleFH.startDate = new Date(Date.UTC(this.selectedScheduleFH.startDate.getFullYear(), this.selectedScheduleFH.startDate.getMonth(), this.selectedScheduleFH.startDate.getDate()))

}
// Back() {
//   this._location.back();
// }
 Submit() {
  debugger;
    this.selectedScheduleFH.scheduleDays = this.ScheduleDay
  this.proccessing = true
    debugger
    if (this.selectedScheduleFH.scheduleDays.length == 0)
      this.catSvc.ErrorMsgBar("Please Add some Schedule Detail!", 5000)
    else
    this.lmsSvc.SaveSchedule(this.selectedScheduleFH).subscribe({
      next: (res: ScheduleVM) => {
     
     
        this.proccessing = false
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.ScheduleDay = []
        this.proccessing = false
      }
    })
 
  this.proccessing = false
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

}
