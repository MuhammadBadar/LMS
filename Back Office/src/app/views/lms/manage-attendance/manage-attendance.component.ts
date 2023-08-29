
import { Component, Injector, OnInit } from '@angular/core';
import { AttendanceVM } from '../Models/AttendanceVM';
import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { UserattbydateVM } from '../Models/UserattbydateVM';
@Component({
    selector: 'app-manage-attendance',
    templateUrl: './manage-attendance.component.html',
    styleUrls: ['./manage-attendance.component.css']
  })
  export class ManageAttendanceComponent implements OnInit{
  displayedColumns: string[] = ['user', 'inTime','outTime', 'workedHours','date'];
  // Attendance:AttendanceVM [] = [];
  AddMode: boolean = true
  proccessing: boolean = false;
  EditMode: boolean = false

  Add: boolean = true;
  Edit: boolean = false;

  dialogRef: any
  dialogref: any

  selectedAttendance: AttendanceVM;
  dataSource:any
  attendance?:AttendanceVM[]
  // userattbydate?:UserattbydateVM[]
  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  // attendance: AttendanceVM[];

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedAttendance = new AttendanceVM
    
    //private injector: Injector,
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    //this.selectedVocabulary = new VocabularyVM
  }


  ngOnInit(): void {    
    this.AddMode = true;
    
    this.GetAttendance();    
    this.selectedAttendance = new AttendanceVM(); 
       }
  GetAttendance() {
    this.lmsSvc.GetAttendance().subscribe({
      next:(value: AttendanceVM[])=> {
        this.attendance = value
        this.dataSource = new MatTableDataSource(this.attendance)
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("Error Occurred",5000)
      },
    })
  }

  Refresh() {
    this.GetAttendance();
    this.selectedAttendance = new AttendanceVM
    this.EditMode = false
    this.AddMode = true
    // this.selectedAttendance.isActive = true;
  }

  Search() {
    var usr = new AttendanceVM();
    usr.userId = this.selectedAttendance.userId;
    console.warn(usr);
    this.lmsSvc.SearchAttendance(usr).subscribe({
      next: (value: AttendanceVM[]) => {
        this.attendance= value
        this.dataSource = new MatTableDataSource(this.attendance)
     
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     console.warn(err) ;
    },
    })
    
  }


  OpenAttendanceDialog() {
    this.dialogRef = this.dialog.open(ManageAttendanceComponent, {
      width: '1200px', height: '950px',
      data:{isDialog : true}
     })
      this.dataSource = new MatTableDataSource(this.attendance)
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetAttendance()
      }
      );
  }



    }