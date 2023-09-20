import { ScheduleDayEventVM } from './../Models/ScheduleDayEventVM';
import { Component, Injector } from '@angular/core';
import { ScheduleDayVM, ScheduleVM } from '../Models/ScheduleVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { CatalogService } from '../../catalog/catalog.service';
import { ActivatedRoute } from '@angular/router';
import { LMSService } from '../lms.service';

@Component({
  selector: 'app-manage-schedule-day-event',
  templateUrl: './manage-schedule-day-event.component.html',
  styleUrls: ['./manage-schedule-day-event.component.css']
})
export class ManageScheduleDayEventComponent {
  AddMode: boolean = true
  EditMode: boolean = false
  Edit: boolean = false;
  Add: boolean = true;

  selectedDayEvent = new ScheduleDayEventVM
  selectedScheduleFH: ScheduleDayEventVM;

  WeekDays: SettingsVM[];
  Location: SettingsVM[];
  EventType: SettingsVM[];
  Entities: SettingsVM[];
  ScheduleType: SettingsVM[];
  WorkingType: SettingsVM[];
  

  lineAddMode: boolean = false
  lineEditMode: boolean = true

  


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
    // this.dialogRefe = this.injector.get(MatDialogRef, null);
    // this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  
  ngOnInit(): void {
    // this.GetScheduleFH();
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
      }, 
      error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      },
    });
  }



}
