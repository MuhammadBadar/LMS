import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../../catalog/catalog.service';
import { ScheduleVM } from '../Models/ScheduleVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { UserVM } from '../../security/models/user-vm';
import { SecurityService } from '../../security/security.service';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { SettingsVM } from '../../items/Models/SettingsVM';
import { ManageUserComponent } from '../../security/manage-user/manage-user.component';
import { RoleVM } from '../../security/models/role-vm';
import { ManageRoleComponent } from '../../security/manage-role/manage-role.component';
import { Entities } from  '../models/Enums/Entities';
@Component({
  selector: 'app-manage-schedule',
  templateUrl: './manage-schedule.component.html',
  styleUrls: ['./manage-schedule.component.css']
})
export class ManageScheduleComponent {

  @ViewChild('scheduleFHForm', { static: true }) scheduleFHForm!: NgForm;
  displayedColumns: string[] = [`user`,`role`,`scheduleType`,`workingType`,`workingHours`,'isActive'];
  selectedScheduleFH: ScheduleVM;
  users: UserVM[] | undefined;
  dialogRef: any;
  ScheduleFH: ScheduleVM[] |  any;
  dataSource: any;
  proccessing: boolean | undefined;
  AddMode: boolean = true
  EditMode: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  dialogData: any;
  // entity: Entities[] | undefined;
  user: number;
  role: number;
  dialogRefe: any;
  
// Schedulefh: any;
//selectedFrequency: string = 'day'; // Set the default value to 'day' for the radio buttons

  Entities: SettingsVM[];
  ScheduleType: SettingsVM[];
  WorkingType: SettingsVM[];
  roles: RoleVM[];

  constructor(private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public securitySvc: SecurityService,
   ) {
    this.selectedScheduleFH = new ScheduleVM
    this.user= Entities.user;
    this.role=Entities.role;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.GetScheduleFH();
    this.GetUser();
    this.GetRole();
    this.Refresh();
       this.GetSettings(EnumTypeVM.Entities)
       this.GetSettings(EnumTypeVM.ScheduleType)
       this.GetSettings(EnumTypeVM.WorkingType)
       this.selectedScheduleFH.isActive = true;
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
        } else if (etype === EnumTypeVM.WorkingType) {
          this.WorkingType = res;
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
       //data: { isDialogue: true, userId: this.selectedScheduleFH.userId },
      // disableClose: false // Enable the close button for the dialog
     });
   
     this.dialogRef.afterClosed().subscribe((res: any) => {
      this.GetRole();
      // this.isDialogOpen = false;
     });
   }
  GetUser() {
    var user = new UserVM
    user.isActive = true;
    this.securitySvc.getUserList().subscribe({
      next: (res: UserVM[]) => {
        this.users = res;
        // console.warn(res)
        // this.dataSource = new MatTableDataSource(this.users);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  OpenUserDialog() {
   // this.isDialogOpen = true;
    this.dialogRef = this.dialog.open(ManageUserComponent, {
      width: '1200px',
      height: '950px',
      //data: { isDialogue: true, userId: this.selectedScheduleFH.userId },
     // disableClose: false // Enable the close button for the dialog
    });
  
    this.dialogRef.afterClosed().subscribe((res: any) => {
     this.GetUser();
     // this.isDialogOpen = false;
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
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  
  SaveScheduleFH()  {
    console.warn(this.selectedScheduleFH)
    this.proccessing = true
    if (!this.scheduleFHForm.invalid) {
      this.lmsSvc.SaveSchedule(this.selectedScheduleFH).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar("Successfully Added!", 5000)
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
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
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
