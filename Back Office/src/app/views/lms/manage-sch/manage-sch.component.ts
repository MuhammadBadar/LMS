import { Component, Injector, ViewChild } from '@angular/core';
import { SchVM, SchlineVM } from '../Models/SchVM';

import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { SecurityService } from '../../security/security.service';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { UserVM } from '../../security/models/user-vm';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { ScheduleTypes } from '../models/Enums/ScheduleTypes';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
import { NgForm } from '@angular/forms';
import { RoleVM } from '../../security/models/role-vm';
import { ManageRoleComponent } from '../../security/manage-role/manage-role.component';
import { ManageUserComponent } from '../manage-user/manage-user.component';

@Component({
  selector: 'app-manage-sch',
  templateUrl: './manage-sch.component.html',
  styleUrls: ['./manage-sch.component.css']
})
export class ManageSchComponent {

  selectedLines = {
    dayId: 0 // Initialize with a default value
  };

  // Define an array of days with id, name, and isSelected properties
  daysArray: any[] = [];
  
   // exportTime = { hour: 7, minute: 15, meriden: 'PM', format: 12 };
  
    displayedColumns: string[] = ['user','role', 'scheduleType','day', 'effectivedate','isActive'];
    Schline:SchlineVM[]= []
    AddMode: boolean = true
    proccessing: boolean = false;
    EditMode: boolean = false
    ScheduleId!: number
    Add: boolean = true;
    Edit: boolean = false;
    dialogRef: any
    dialogref: any
    dataSource:any
    schline?:SchVM[]
    ScheduleType: SettingsVM[];
    WeekDays: SettingsVM[];
    // userattbydate?:UserattbydateVM[]
    roles: RoleVM[];
    dialogData: any;
    dialogRefe: MatDialogRef<any, any>;
    User: any;
    FH: number;
    FWH: number;
    route: any;
    @ViewChild('SchlineForm', { static: true }) SchlineForm!: NgForm;
    lineAddMode: boolean = false
    lineEditMode: boolean = true
    getSchById!: SchVM[];
    selectedLine: SchlineVM
    selectedSch: SchVM;
    hide:any;
    selectedsline = new SchlineVM
    constructor(
      private injector: Injector,
      private lmsSvc: LMSService,
      private secSvc: SecurityService,
      private catSvc: CatalogService,
      public securitySvc: SecurityService,
      public dialog: MatDialog,)
       {
        this.selectedSch = new SchVM
        this.selectedLine = new SchlineVM()
      this.FH= ScheduleTypes.FH;
      this.FWH=ScheduleTypes.FWH;
      
      //private injector: Injector,
      this.dialogRefe = this.injector.get(MatDialogRef, null);
      this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
      //this.selectedVocabulary = new VocabularyVM
    }
  
  
    ngOnInit(): void {    
      this.AddMode = true;
      this.GetUser();
      this.GetSchline();    
      this.GetRole();
      
      this.selectedSch = new SchVM(); 
      // this.route.queryParams.subscribe(params => {
      //   this.SchId = params['id'];
      // });
  
       if (this.ScheduleId > 0) {
        this.Edit = true;
        this.Add = false;
        this.GetSchlineById();
      }
      else {
        this.Add = true;
        this.Edit = false;
        this.dataSource = new MatTableDataSource(this.Schline);
      }
      this.lineAddMode = false;
      this.lineEditMode = false;
      this.GetSettings(EnumTypeVM.WeekDays)
      this.GetSettings(EnumTypeVM.ScheduleType)
      // ... and so on for other settings
      
     
  } 
  GetSchlineById() {
    debugger
    this.lmsSvc.GetSchById(this.ScheduleId).subscribe({
      next: (res: SchVM[]) => {
        debugger
        this.getSchById = res;
        this.selectedSch= this.getSchById[0]
        this.Schline = []
        this.selectedSch.SchLine?.forEach(element => {
          this.Schline.push(element)
        });
        this.dataSource = new MatTableDataSource(this.Schline);
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
        if (etype === EnumTypeVM.ScheduleType) {
          this.ScheduleType = res;
        }else if (etype === EnumTypeVM.WeekDays) {
          this.WeekDays = res;
        }
      }, error: (e) => {
        alert("t");
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  
         GetUser() {
          var usr = new SchVM
          usr.isActive = true;
          // this.selectedAttendance.isActive = true;
          this.secSvc.getUserList().subscribe({
            next: (res: UserVM[]) => {
              this.User = res
            }, error: (err) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            },
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
    GetSchline() {
      this.lmsSvc.GetSch().subscribe({
        next:(value: SchVM[])=> {
          this.schline = value
          this.dataSource = new MatTableDataSource(this.schline)
        },error:(err)=> {
          this.catSvc.ErrorMsgBar("Error Occurred",5000)
        },
      })
    }
    GetRole() {
      var role = new RoleVM
      // role.isActive = true;
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
    
  
    DeleteSchline(id: number) {
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
          this.lmsSvc.DeleteSch(id).subscribe({
            next: (data) => {
              Swal.fire(
                'Deleted!',
                'Attendance has been deleted.',
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
    SaveSchline() {
    //   this.lmsSvc.SaveSch(this.selectedSch).subscribe({
    //     next: (value) => {
    //       this.catSvc.SuccessMsgBar("Successfully Added", 5000)
    //       this.Refresh();
    //     }, error: (err) => {
    //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    //     },
    //   })
    // }

    this.lmsSvc.SaveSch(this.selectedSch).subscribe({
      next: (res: SchVM) => {
        this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
        this.selectedSch = res
        this.Schline = []
        this.selectedSch.SchLine?.forEach(element => {
          this.Schline.push(element)
        });
        this.dataSource = new MatTableDataSource(this.Schline);
        console.warn(this.Schline)
       // this.RefreshDetail()
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.Schline = []
        this.proccessing = false
      }
    })
   }
    Refresh() {
      this.GetSchline();
      this.selectedSch = new SchVM
      this.EditMode = false
      this.AddMode = true
      // this.selectedAttendance.isActive = true;
    }
  
  
    // SearchbyUser(date : Date ){
    // debugger
    //   var usr = new SchlineVM
    //   usr.date = date;
    //   this.lmsSvc.SearchSchline(usr).subscribe({
    //    next: (value: SchlineVM[]) => {
    //      this.schline = value
    //      this.dataSource = new MatTableDataSource(value)
    //      console.warn(this.selectedSchline.date)
    //    }, error: (err) => {
      
    //      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    //    },
    //  })}
  
  
  
    // Search() {
    //   var usr = new SchVM();
    //   usr.userId = this.selectedSch.userId;
    //   console.warn(usr);
    //   this.lmsSvc.SearchSchline(usr).subscribe({
    //     next: (value: SchVM[]) => {
    //       this.schline= value
    //       this.dataSource = new MatTableDataSource(this.schline)
       
    //     }, error: (err) => {
    //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    //    console.warn(err) ;
    //   },
    //   })
      
    // }
  }