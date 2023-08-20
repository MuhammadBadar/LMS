
import { Component, Injector, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { TaskVM } from '../Models/TaskVM';


@Component({
    selector: 'app-manage-tasks',
    templateUrl: './manage-tasks.component.html',
    styleUrls: ['./manage-tasks.component.css']
  })
  export class ManageTasksComponent implements OnInit{
  displayedColumns: string[] = ['user','priority', 'status','module', 'taskTiltle','storyPoints','sps','date'];
  AddMode: boolean;
  selectedTask: TaskVM;
  dataSource:any
  teachers?:TaskVM[]
  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  task: TaskVM[];

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedTask = new TaskVM
    
    //private injector: Injector,
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    //this.selectedVocabulary = new VocabularyVM
  }


  ngOnInit(): void {    
    this.AddMode = true;    
    this.GetTask();    
    this.selectedTask = new TaskVM(); 
       }
  GetTask() {
    this.lmsSvc.GetTask().subscribe({
      next:(value: TaskVM[])=> {
        this.task = value
        this.dataSource = new MatTableDataSource(this.task)
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("Error Occurred",5000)
      },
    })
  }
    }