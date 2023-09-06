import { Component,Injector,OnInit } from '@angular/core';
import { UserreportVM } from '../Models/UserreportVM';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../../catalog/catalog.service';
import { LMSService } from '../lms.service';
import { MatTableDataSource } from '@angular/material/table';
import { UserVM } from '../../security/models/user-vm';
import { SecurityService } from '../../security/security.service';

@Component({
  selector: 'app-manage-userreport',
  templateUrl: './manage-userreport.component.html',
  styleUrls: ['./manage-userreport.component.css']
})
export class ManageUserreportComponent implements  OnInit{
  displayedColumns: string[] = ['userName','date', 'day','workTime','inTimeOutTime' ,'todaysTargets', 'scoreSPs','dueTime','overTime' ,'missingTime', 'scheduleTime','storyPoints','dayEndStatus' ,'dueSps', 'sPsGap'];
 
  AddMode: boolean = true
  EditMode: boolean = false
  selectedUserreport: UserreportVM;
  dataSource:any
  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  Userreport: UserreportVM[];
  User:UserVM[]

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private secSvc: SecurityService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedUserreport = new UserreportVM
    
    //private injector: Injector,
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    //this.selectedVocabulary = new VocabularyVM
  }


  ngOnInit(): void {    
    this.AddMode = true;
    
    this.GetUser();
    this.GetUserreport();    
    this.selectedUserreport = new UserreportVM(); 
       }

       GetUser() {
        var usr = new UserVM
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
      
  GetUserreport() {
    this.lmsSvc.GetUserreport().subscribe({
      next:(value: UserreportVM[])=> {
        this.Userreport = value
        this.dataSource = new MatTableDataSource(this.Userreport)
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("Error Occurred",5000)
      },
    })
  }


  Refresh() {
    this.GetUserreport();
    this.selectedUserreport = new UserreportVM
    this.EditMode = false
    this.AddMode = true
    // this.selectedAttendance.isActive = true;
  }
  
  
  // SearchbyUser(id : string ){
  // debugger
  //   var usr = new UserreportVM
  //   usr.userId = id;
  //   this.lmsSvc.SearchUserreport(usr).subscribe({
  //    next: (value: UserreportVM[]) => {
  //      this.Userreport = value
  //      this.dataSource = new MatTableDataSource(value)
  //      console.warn(this.selectedUserreport.userId)
  //    }, error: (err) => {
    
  //      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //    },
  //  })}
  
  
  
  Search() {
    var usr = new UserreportVM();
    usr.userId = this.selectedUserreport.userId;
    console.warn(usr);
    this.lmsSvc.SearchUserreport(usr).subscribe({
      next: (value: UserreportVM[]) => {
        this.Userreport= value
        this.dataSource = new MatTableDataSource(this.Userreport)
     
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     console.warn(err) ;
    },
    })
    
  }
  
}