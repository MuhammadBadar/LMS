import { Component, OnInit } from '@angular/core';
import { EnumValueVM } from '../../../models/EnumValueVM';
import { TaskVM } from '../../../models/task-vm';
import { UserVM } from 'src/app/views/security/models/user-vm';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { TMSService } from '../../../tms.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SecurityService } from 'src/app/views/security/security.service';
import { EnumType } from '../../../models/EnumType';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss']
})
export class SearchComponent implements OnInit {
  Priority:EnumValueVM[];
  task: TaskVM;
  modules: EnumValueVM[];
  User: UserVM[];
  Status: EnumValueVM[];
  constructor(
    public dialogref:  MatDialogRef<SearchComponent>,
    public dialog: MatDialog,
    public taskSvc: TMSService,
    private snack: MatSnackBar,
    public secSrvc:SecurityService
  ) {
    this.task=new TaskVM;
    this.task.statusId=undefined;
   }

  ngOnInit(): void {
    this.secSrvc.getUserList().subscribe((res: UserVM[]) => {
      this.User = res;   
 
      });
   // this.GetEnumValues(EnumType.Module);
    this.GetEnumValues(EnumType.Priority);
    this.GetEnumValues(EnumType.Status);
  }
  GetEnumValues(etype: EnumType) {
    debugger;
    this.taskSvc.getEnumValues(etype).subscribe((res: EnumValueVM[]) => {
    if(etype==EnumType.Module)
    this.modules=res;
    else if(etype==EnumType.Status)
    this.Status=res;
    else if(etype==EnumType.Priority)
    this.Priority=res;
    },
    (err: any) => {
      alert('Error')

    });
    }
    SearchTask(){
     if(this.task.title==''){
      this.task.title= undefined
     }
     if (this.task.sp==null){
      this.task.sp= undefined
     }
     if (this.task.id==null){
      this.task.id= undefined
     }
     
     this.dialogref.close({data:this.task});
    }
}
