import { ScheduleDayEventVM } from './../Models/ScheduleDayEventVM';
import { Component, Injector, ViewChild } from '@angular/core';
import { ScheduleDayVM, ScheduleVM } from '../Models/ScheduleVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { CatalogService } from '../../catalog/catalog.service';
import { ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2';
import { MatTableDataSource } from '@angular/material/table';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';
import { SCHService } from '../sch.serivce';
import { error } from 'console';

@Component({
  selector: 'app-manage-schedule-day-event',
  templateUrl: './manage-schedule-day-event.component.html',
  styleUrls: ['./manage-schedule-day-event.component.css']
})
export class ManageScheduleDayEventComponent {
  displayeScheduleColumns: string[] = ['location','startTime', 'endTime', 'eventType', 'sp','actions'];
  DayEventSource: any;
  proccessing: boolean | undefined;
  AddMode: boolean = true
  EditMode: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  dataSource: any;
  ScheduleDayEvents: ScheduleDayEventVM[] |  any;
  DayEvent: ScheduleDayVM[] |  any;
  ScheduleDay: ScheduleDayVM[] = []

  selectedDayEvent = new ScheduleDayEventVM
  selectedSchedule: ScheduleDayEventVM;

  WeekDays: SettingsVM[];
  Location: SettingsVM[]=[];
  EventType: SettingsVM[]=[];
  Entities: SettingsVM[];
  ScheduleType: SettingsVM[];
  WorkingType: SettingsVM[];
  
  @ViewChild('dayeventForm', { static: true }) dayeventForm!: NgForm;
  dialogRefe: any;
  dialogData: any;
  isDialog : boolean = false;


  lineAddMode: boolean = false
  lineEditMode: boolean = true
schDay:ScheduleDayVM
 day:string 

  timepicker:any; 
  startTime: null;
  endTime: null;  
  timeRangeInvalid: boolean = false;
  previousEndTime: string;
  // Assuming ScheduleDayEventVM has endTime property
  minEndTime: string;
minStartTime: string;
  


  constructor(private injector: Injector,
    private schSvc: SCHService,
    // private _location: Location,
    private route: ActivatedRoute,
    private catSvc: CatalogService,
    // public dialog: MatDialog,
    // public securitySvc: SecurityService,
   ) {
    this.selectedSchedule = new ScheduleDayEventVM
    this.selectedDayEvent = new ScheduleDayEventVM()
    // this.user= Entities.user;
    // this.role=Entities.role;
    // this.FH= ScheduleTypes.FH;
    // this.FWH=ScheduleTypes.FWH;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  
  ngOnInit(): void {
    
    debugger;
    // this.GetScheduleFH();
     if (this.dialogData  != null) {
      this.isDialog = this.dialogData.isDialog;
      this.isDialog = true;
    console.warn(this.dialogData.scheduleLine)
      if (this.dialogData.scheduleLine != undefined) {
        debugger;
        this.schDay = this.dialogData.scheduleLine
        this.day= this.schDay.day
         this.SearchbyScheduleDayEvent()
       }
    }
    // this.GetScheduleDayEvents();
    // this.GetUser();
    // this.GetRole();
       this.GetSettings(EnumTypeVM.Entities)
       this.GetSettings(EnumTypeVM.WeekDays)
       this.GetSettings(EnumTypeVM.ScheduleType)
       this.GetSettings(EnumTypeVM.WorkingType)
       this.GetSettings(EnumTypeVM.EventType)
       this.GetSettings(EnumTypeVM.Location)
       this.selectedSchedule.isActive = true;
      //  this.route.queryParams.subscribe(params => {
      //   this.ScheduleId = params['id'];
      // });
  
      //  if (this.ScheduleId > 0) {
      //   this.Edit = true;
      //   this.Add = false;
      //   this.GetScheduleById();
      // }
      // else {
      //   this.Add = true;
      //   this.Edit = false;
      //   this.dataSource = new MatTableDataSource(this.ScheduleDay);
      // }
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

  

  openTimepicker() {
    this.timepicker.open();
  }
  // validateTimeRange() {
  //   if (this.selectedDayEvent.startTime > this.selectedDayEvent.endTime) {
  //     this.timeRangeInvalid = true;
  //   } else {
  //     this.timeRangeInvalid = false;
  //   }
  // }

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
          if(this.EventType.length>0)
          this.selectedDayEvent.eventTypeId=this.EventType[0].id;
        }else if (etype === EnumTypeVM.Location) {
          this.Location = res;
          if(this.Location.length>0)
          this.selectedDayEvent.locationId=this.Location[0].id;
        }
      }, error: (e) => {
        alert("t");
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  
  
  // Submit() {
  //   // Submission logic here

  //   // Check if both user and schedule type are selected
  //   if (this.selectedDayEvent.locationId == 0) {
  //     this.catSvc.ErrorMsgBar("Please select Location.", 5000);
  //     return;
  //   }

  //   if (this.selectedDayEvent.startTime == null || this.selectedDayEvent.startTime == undefined) {
  //     this.catSvc.ErrorMsgBar("Please select Start Time.", 5000);
  //     return;
  //   }

  //   if (this.selectedDayEvent.endTime == null || this.selectedDayEvent.endTime == undefined) {
  //     this.catSvc.ErrorMsgBar("Please select End Time.", 5000);
  //     return; // Exit the function if either user or schedule type is empty
  //   }

  //   this.selectedDayEvent.schId = this.schSvc.selectedScheduleId;
  //   this.selectedDayEvent.SchDayId = this.schSvc.selectedScheduleDayId;
  //   this.selectedDayEvent.isActive = true;

  //   // Save the event and update the previous end time
  //   this.schSvc.SaveScheduleDayEvent(this.selectedDayEvent).subscribe({
  //     next: (value) => {
  //       this.catSvc.SuccessMsgBar("Successfully Added", 5000);
  //       this.minEndTime = this.ScheduleDayEvents.map(event => event.endTime);
  //       this.Refresh();
  //       this.ngOnInit();
  //     },
  //     error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000);
  //     },
  //   });
  // }

  Submit() {
    debugger;
    // Check if both user and schedule type are selected
    if (this.selectedDayEvent.locationId == 0) {
      this.catSvc.ErrorMsgBar("Please select Location.", 5000);
      return;
    }
  
    if (this.selectedDayEvent.startTime == null || this.selectedDayEvent.startTime == undefined) {
      this.catSvc.ErrorMsgBar("Please select Start Time.", 5000);
      return;
    }
  
    if (this.selectedDayEvent.endTime == null || this.selectedDayEvent.endTime == undefined) {
      this.catSvc.ErrorMsgBar("Please select End Time.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
  
    // Additional validation: Check if start time is greater than previous day event's end time
    if (this.ScheduleDayEvents && this.ScheduleDayEvents.length > 0) {
      const previousDayEvent = this.ScheduleDayEvents[this.ScheduleDayEvents.length - 1];
  
      if (previousDayEvent.endTime && this.selectedDayEvent.startTime <= previousDayEvent.endTime) {
        this.catSvc.ErrorMsgBar("Start Time should be greater than the previous day event's End Time.", 5000);
        return;
      }
    }
  
    this.selectedDayEvent.schId = this.schSvc.selectedScheduleId;
    this.selectedDayEvent.SchDayId = this.schSvc.selectedScheduleDayId;
    this.selectedDayEvent.isActive = true;
  
    // Save the event and update the previous end time
    this.schSvc.SaveScheduleDayEvent(this.selectedDayEvent).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000);
        this.Refresh();
        this.ngOnInit();
      },
      error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      },
    });
  }
  

  GetScheduleDayEvents() {
    // debugger;
    var Sch = new ScheduleDayEventVM
    Sch.isActive= true;
    debugger;
    this.schSvc.GetScheduleDayEvents(this.schSvc.selectedScheduleDayId).subscribe({
    
      next: (value: ScheduleDayEventVM[]) => {
        // debugger;
        this.ScheduleDayEvents = value
        
        console.warn(this.ScheduleDayEvents)
        this.dataSource = new MatTableDataSource(this.ScheduleDayEvents)
        // this.Refresh();
       
      }, error: (err) => {
        alert("i");
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  validateTimeRange() {
    if (this.selectedDayEvent.startTime < this.selectedDayEvent.endTime) {
      this.timeRangeInvalid = true;
    } 
    else {
      this.timeRangeInvalid = false;
    }
    if (this.selectedDayEvent.endTime) {
      this.minStartTime = this.selectedDayEvent.endTime;
    }
  }
  

  EditScheduleDayEvents(schedule: ScheduleDayEventVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedDayEvent = schedule
    // this.ngOnInit();
  }
  UpdateScheduleDayEvent() {
    debugger;
   this.schSvc.UpdateScheduleDayEvent(this.selectedDayEvent).subscribe({
      next: (res: ScheduleDayEventVM) => {   
        this.catSvc.SuccessMsgBar("Successfully Updated", 5000);
        this.proccessing = false
        this.Refresh();
        this.ngOnInit();
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.ScheduleDay = []
        this.proccessing = false
        this.Refresh();
        
        
      }
    })
  }
  Refresh() {
    this.GetScheduleDayEvents();
    this.selectedDayEvent = new ScheduleDayEventVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteScheduleDayEvents(id: number) {
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
      this.schSvc.DeleteScheduleDayEvent(id).subscribe({
        next: (data) => {
          Swal.fire(
            'Deleted!',
            'Schedule Day Event has been deleted.',
            'success'
          )
          this.Refresh();
          this.ngOnInit();
        }, error: (e) => {
          alert("e");
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  })
} 
SearchbyScheduleDayEvent( ){
  debugger
    var evt = new ScheduleDayEventVM
   //evt.schId=this.schDay.scheduleId;
   evt.schId=this.schDay.schId;

   //evt.scheduleDayId= this.schDay.dayId
   evt.SchDayId = this.schSvc.selectedScheduleDayId;
    this.schSvc.SearchScheduleDayEvent(evt).subscribe({
     next: (value: ScheduleDayEventVM[]) => {
      console.warn(value)
       this.dataSource = new MatTableDataSource(value)
     }, error: (err) => {
    console.warn(err)
       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     },
   })}

}
