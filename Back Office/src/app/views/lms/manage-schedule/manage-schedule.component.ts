import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../../catalog/catalog.service';
import { ScheduleDayEventsVM, ScheduleVM } from '../Models/ScheduleVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
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
@Component({
  selector: 'app-manage-schedule',
  templateUrl: './manage-schedule.component.html',
  styleUrls: ['./manage-schedule.component.css']
})
export class ManageScheduleComponent {

  @ViewChild('scheduleFHForm', { static: true }) scheduleFHForm!: NgForm;
  displayedColumns: string[] = [`user`,`role`,`scheduleType`,`workingType`,`workingHours`,`day`,'isActive'];
   displayedRoles: string[] = [`role`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
   displayedUsers: string[] = [`user`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
   ScheduleDayEvent: ScheduleDayEventsVM[] = []
   selectedDayEvent = new ScheduleDayEventsVM
  @ViewChild('ScheduleDayEventsForm', { static: true }) ScheduleDayEventsForm!: NgForm;
  selectedScheduleFH: ScheduleVM;
  selectedDayevent: ScheduleDayEventsVM;
  users: UserVM[] | undefined;
  
  ScheduleDay: ScheduleDayEventsVM[] = []
  dialogRef: any;
  DayEvent: ScheduleDayEventsVM[] |  any;
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
  displayeScheduleColumns: string[] = ['day', 'startTime', 'endTime', 'location', 'eventType','isActive', 'actions'];
  

  constructor(private injector: Injector,
    private lmsSvc: LMSService,
      private route: ActivatedRoute,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public securitySvc: SecurityService,
   ) {
    this.selectedScheduleFH = new ScheduleVM
    this.selectedDayEvent = new ScheduleDayEventsVM()
    this.user= Entities.user;
    this.role=Entities.role;
    this.FH= ScheduleTypes.FH;
    this.FWH=ScheduleTypes.FWH;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.GetScheduleFH();
    this.GetScheduleDayEvents();
    this.GetUser();
    this.GetRole();
       this.GetSettings(EnumTypeVM.Entities)
       this.GetSettings(EnumTypeVM.WeekDays)
       this.GetSettings(EnumTypeVM.ScheduleType)
       this.GetSettings(EnumTypeVM.WorkingType)
       this.GetSettings(EnumTypeVM.EventType)
       this.GetSettings(EnumTypeVM.Location)
       this.selectedScheduleFH.isActive = true;
  } 
   GetScheduleById() {
    debugger
    this.lmsSvc.GetScheduleById(this.ScheduleId).subscribe({
      next: (res: ScheduleVM[]) => {
        debugger
        this.getSchById = res;
        this.selectedScheduleFH = this.getSchById[0]
        this.ScheduleDayEvent = []
        this.selectedScheduleFH.scheduleDayEvent?.forEach(element => {
          this.ScheduleDay.push(element)
        });
        this.dataSource = new MatTableDataSource(this.ScheduleDay);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
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
  GetScheduleDayEvents() {
    var Schfh = new ScheduleDayEventsVM
    Schfh.isActive= true;
    this.lmsSvc.GetScheduleDayEvents().subscribe({
      next: (value: ScheduleDayEventsVM[]) => {
        this.DayEvent = value
        console.warn(this.DayEvent)
        this.DayEventSource = new MatTableDataSource(this.DayEvent)
       
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  UpdateScheduleDayEvent() {
    this.proccessing = true
    if (!this.ScheduleDayEventsForm.invalid) {
      this.lmsSvc.UpdateScheduleDayEvents(this.selectedDayevent).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
          this.Add = true;
          this.Edit = false;
          this.proccessing = false
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
          this.proccessing = false
        }
      })
    }
    else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  DeleteScheduleDayEvents(id: number) {
    debugger
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
        this.lmsSvc.DeleteScheduleDayEvents(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Inquiry has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }

  EditScheduleDayEvents(scheduleday: ScheduleDayEventsVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedDayevent = scheduleday
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
  
  SaveScheduleDayEvents() {
    debugger;
    const controls = this.ScheduleDayEventsForm.controls;
    if (this.ScheduleDayEventsForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
   }
   else { 
    const ScheduleEventTypeValid = this.validateScheduleEvent();
    const DaytypeValid = this.validateScheduleDay();
    const LocationTypeIsValid = this.validateScheduleLocation();

  if (!DaytypeValid && !LocationTypeIsValid && !ScheduleEventTypeValid) 
  {
    this.catSvc.ErrorMsgBar("Please fill all required fields", 5000);
  } 
  else if (!ScheduleEventTypeValid) {
    this.catSvc.ErrorMsgBar("EventType is a required field", 5000);
  } else if (!DaytypeValid) {
    this.catSvc.ErrorMsgBar("Daytype is a required field", 5000);
  } else if (!LocationTypeIsValid) {
    this.catSvc.ErrorMsgBar("Location is a required field", 5000);
  }

  if (DaytypeValid && DaytypeValid && !this.ScheduleDayEventsForm.invalid) {
    this.lmsSvc.SaveScheduleDayEvents(this.selectedDayEvent).subscribe({
      next: (value) => { 
        this.catSvc.SuccessMsgBar("Successfully Added", 5000);
        this.Refresh();
      },
      error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      },
    });
  }
  
  }
}

  //   this.lmsSvc.SaveScheduleDayEvents(this.selectedDayEvent).subscribe({
  //     next: (value) => {
  //       this.catSvc.SuccessMsgBar("Successfully Added", 5000)
  //       this.Refresh();
  //     }, error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //     },
  //   })
  // }
 
  SaveScheduleFH() {
   
    const controls = this.scheduleFHForm.controls;
    if (this.scheduleFHForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
    } else { 
      const ScheduleTypeValid = this.CheckScheduleTypeValidation();
      const workingtypeIsValid = this.CheckSchedulesValidation();
      const entityIsValid = this.CheckScheduleValidation();
  
    if (!workingtypeIsValid && !entityIsValid && !ScheduleTypeValid) 
    {
      this.catSvc.ErrorMsgBar("Please fill all required fields", 5000);
    } 
    else if (!ScheduleTypeValid) {
      this.catSvc.ErrorMsgBar("ScheduleType is a required field", 5000);
    } else if (!workingtypeIsValid) {
      this.catSvc.ErrorMsgBar("Workingtype is a required field", 5000);
    } else if (!entityIsValid) {
      this.catSvc.ErrorMsgBar("Entity is a required field", 5000);
    }
  
    if (workingtypeIsValid && workingtypeIsValid && !this.scheduleFHForm.invalid) {
      this.lmsSvc.SaveSchedule(this.selectedScheduleFH).subscribe({
        next: (value) => {  alert("BB");
          this.catSvc.SuccessMsgBar("Successfully Added", 5000);
          this.Refresh();
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
        },
      });
    }
    
    }
  }
  

EditScheduleFH(scheduleFH: ScheduleVM) {
  this.EditMode = true
  this.AddMode = false
  this.selectedScheduleFH = scheduleFH
}
UpdateScheduleFH() {
  this.lmsSvc.UpdateSchedule(this.selectedScheduleFH).subscribe({
    next: (value) => {
      this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    },
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
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  })
}
}
