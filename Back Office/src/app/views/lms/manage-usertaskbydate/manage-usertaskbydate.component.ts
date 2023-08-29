// import { Component } from '@angular/core';

// @Component({
//   selector: 'app-manage-usertaskbydate',
//   templateUrl: './manage-usertaskbydate.component.html',
//   styleUrls: ['./manage-usertaskbydate.component.css']
// })
// export class ManageUsertaskbydateComponent {

// }
import { Component, Injector, OnInit } from '@angular/core';

import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { UserTaskbydateVM } from '../Models/UsertaskbydateVM';


@Component({
    selector: 'app-manage-usertaskbydate',
    templateUrl: './manage-usertaskbydate.component.html',
    styleUrls: ['./manage-usertaskbydate.component.css']
  })
  export class ManageUsertaskbydateComponent implements OnInit{
  displayedColumns: string[] = ['userName','date', 'taskDetails','storyPoints', 'totalSp','dayEndStatus','taskScore','sPsGap'];
  AddMode: boolean;
  selectedUsertaskbydate: UserTaskbydateVM;
  dataSource:any
  userTaskbydate?:UserTaskbydateVM[]
  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  usertaskbydate: UserTaskbydateVM[];

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedUsertaskbydate = new UserTaskbydateVM
    
    //private injector: Injector,
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    //this.selectedVocabulary = new VocabularyVM
  }


  ngOnInit(): void {    
    this.AddMode = true;
    
    this.GetUsertaskbydate();    
    this.selectedUsertaskbydate = new UserTaskbydateVM(); 
       }
  GetUsertaskbydate() {
    this.lmsSvc.GetUserTaskbydate().subscribe({
      next:(value: UserTaskbydateVM[])=> {
        this.usertaskbydate = value
        this.dataSource = new MatTableDataSource(this.usertaskbydate)
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("Error Occurred",5000)
      },
    })
  }
    }
