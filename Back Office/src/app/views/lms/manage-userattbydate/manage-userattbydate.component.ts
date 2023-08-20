// import { Component } from '@angular/core';

// @Component({
//   selector: 'app-manage-userattbydate',
//   templateUrl: './manage-userattbydate.component.html',
//   styleUrls: ['./manage-userattbydate.component.scss']
// })
// export class ManageUserattbydateComponent {
  import { UserattbydateVM } from './../Models/UserattbydateVM';
  import { Component, Injector, OnInit } from '@angular/core';
  
  import { MatTableDataSource } from '@angular/material/table';
  import { LMSService } from '../lms.service';
  import { CatalogService } from '../../catalog/catalog.service';
  import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
  
  
 
@Component({
  selector: 'app-manage-userattbydate',
  templateUrl: './manage-userattbydate.component.html',
  styleUrls: ['./manage-userattbydate.component.css']
})
export class ManageUserattbydateComponent implements OnInit{
    displayedColumns: string[] = ['user','date' ,'attendanceDetails', 'totalWorkedHours'];
    AddMode: boolean;
    selectedUserattbydate: UserattbydateVM;
    dataSource:any
    userattbydate?:UserattbydateVM[]
    dialogData: any;
    dialogRefe: MatDialogRef<any, any>;
    Userattbydate: UserattbydateVM[];
  
    constructor(
      private injector: Injector,
      private lmsSvc: LMSService,
      private catSvc: CatalogService,
      public dialog: MatDialog,) {
      this.selectedUserattbydate = new UserattbydateVM
      
      //private injector: Injector,
      this.dialogRefe = this.injector.get(MatDialogRef, null);
      this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
      //this.selectedVocabulary = new VocabularyVM
    }
  
  
    ngOnInit(): void {    
      this.AddMode = true;
      
      this.GetUserattbydate();    
      this.selectedUserattbydate = new UserattbydateVM(); 
         }
    GetUserattbydate() {
      this.lmsSvc.GetUserattbydate().subscribe({
        next:(value: UserattbydateVM[])=> {
          this.userattbydate = value
          this.dataSource = new MatTableDataSource(this.userattbydate)
        },error:(err)=> {
          this.catSvc.ErrorMsgBar("Error Occurred",5000)
        },
      })
    }
 }
