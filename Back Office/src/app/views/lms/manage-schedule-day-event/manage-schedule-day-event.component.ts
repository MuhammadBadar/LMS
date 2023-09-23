import { ScheduleDayEventVM } from './../Models/ScheduleDayEventVM';
import { Component, Injector } from '@angular/core';
import { ScheduleDayVM, ScheduleVM } from '../Models/ScheduleVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { CatalogService } from '../../catalog/catalog.service';
import { ActivatedRoute } from '@angular/router';
import { LMSService } from '../lms.service';
import Swal from 'sweetalert2';
import { MatTableDataSource } from '@angular/material/table';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-manage-schedule-day-event',
  templateUrl: './manage-schedule-day-event.component.html',
  styleUrls: ['./manage-schedule-day-event.component.css']
})
export class ManageScheduleDayEventComponent {
  displayeScheduleColumns: string[] = ['day','location','startTime', 'endTime', 'eventType','isActive','actions'];
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
  selectedScheduleFH: ScheduleDayEventVM;

  WeekDays: SettingsVM[];
  Location: SettingsVM[];
  EventType: SettingsVM[];
  Entities: SettingsVM[];
  ScheduleType: SettingsVM[];
  WorkingType: SettingsVM[];
  
  dialogRefe: any;
  dialogData: any;
  isDialog : boolean = false;


  lineAddMode: boolean = false
  lineEditMode: boolean = true
schDay:ScheduleDayVM
 day:string 


  constructor(private injector: Injector,
    private lmsSvc: LMSService,
    // private _location: Location,
    private route: ActivatedRoute,
    private catSvc: CatalogService,
    // public dialog: MatDialog,
    // public securitySvc: SecurityService,
   ) {
    this.selectedScheduleFH = new ScheduleDayEventVM
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
        this.schDay = this.dialogData.scheduleLine
        this.day= this.schDay.day
         this.SearchbyCourse()
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
       this.selectedScheduleFH.isActive = true;
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

  Submit() {
    debugger;
    if (!this.selectedDayEvent.locationId) {
      this.catSvc.ErrorMsgBar("Please fill in all required fields.", 5000);
      return; // Exit the function if any required field is empty
    }
  
    this.lmsSvc.SaveScheduleDayEvent(this.selectedDayEvent).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000);
        // this.Refresh();
        this.SearchbyCourse()
      }, 
      error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      },
    });
  }

  GetScheduleFH() {
    debugger;
    var Schfh = new ScheduleDayEventVM
    Schfh.isActive= true;
    debugger;
    this.lmsSvc.GetScheduleDayEvent().subscribe({
    
      next: (value: ScheduleDayEventVM[]) => {
        debugger;
        this.ScheduleDayEvents = value
        console.warn(this.ScheduleDayEvents)
        this.dataSource = new MatTableDataSource(this.ScheduleDayEvents)
       
      }, error: (err) => {
        alert("i");
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  EditScheduleDayEvents(scheduleFH: ScheduleDayEventVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedDayEvent = scheduleFH
  }
  UpdateScheduleFH() {
   this.lmsSvc.SaveScheduleDayEvent(this.selectedDayEvent).subscribe({
      next: (res: ScheduleDayEventVM) => {   
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
      this.lmsSvc.DeleteScheduleDayEvent(id).subscribe({
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
SearchbyCourse( ){
  debugger
    var evt = new ScheduleDayEventVM
   evt.schId=this.schDay.scheduleId
   evt.schDayId= this.schDay.dayId
    this.lmsSvc.SearchScheduleDayEvent(evt).subscribe({
     next: (value: ScheduleDayEventVM[]) => {
      console.warn(value)
       this.dataSource = new MatTableDataSource(value)
     }, error: (err) => {
    
       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     },
   })}

}