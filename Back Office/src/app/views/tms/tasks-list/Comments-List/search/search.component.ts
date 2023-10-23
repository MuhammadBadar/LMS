import { Component, OnInit } from '@angular/core';
import { EnumValueVM } from '../../../models/EnumValueVM';
import { TaskVM } from '../../../models/task-vm';
import { UserVM } from 'src/app/views/security/models/user-vm';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { TMSService } from '../../../tms.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SecurityService } from 'src/app/views/security/security.service';
import { EnumType } from '../../../models/EnumType';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { CatalogService } from 'src/app/views/catalog/catalog.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {
  Priority:SettingsVM[];
  task: TaskVM;
  modules: SettingsVM[];
  User: UserVM[];
  Status: SettingsVM[];
  constructor(
    public dialogref:  MatDialogRef<SearchComponent>,
    public dialog: MatDialog, private catSVC: CatalogService,
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
    var Settings = new SettingsVM;
    Settings.enumTypeId = etype;
    this.catSVC.SearchSettings(Settings).subscribe((res: SettingsVM[]) => {
      // if (etype == EnumType.Status)
      //   this.Status = res;
    // this.taskSvc.getEnumValues(etype).subscribe((res: EnumValueVM[]) => {
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
