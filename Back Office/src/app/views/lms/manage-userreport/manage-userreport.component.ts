import { Component,Injector,OnInit } from '@angular/core';
import { UserreportVM } from '../Models/UserreportVM';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../../catalog/catalog.service';
import { LMSService } from '../lms.service';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-manage-userreport',
  templateUrl: './manage-userreport.component.html',
  styleUrls: ['./manage-userreport.component.css']
})
export class ManageUserreportComponent implements  OnInit{
  displayedColumns: string[] = ['userName','userId' ,'date', 'day','workTime','inTimeOutTime' ,'todaysTargets', 'scoreSPs','dueTime','overTime' ,'missingTime', 'scheduleTime','storyPoints','dayEndStatus' ,'dueSps', 'sPsGap'];
 
  AddMode: boolean;
  selectedUserreport: UserreportVM;
  dataSource:any
  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  Userreport: UserreportVM[];

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
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
    
    this.GetUserreport();    
    this.selectedUserreport = new UserreportVM(); 
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
}
