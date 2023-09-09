import { Component, OnInit } from '@angular/core';
import { UserRoleVM } from '../models/user-role-vm';
import { SecurityService } from '../security.service';
import { MatTableDataSource } from '@angular/material/table';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CreateUserRoleComponent } from './manage -user-role-dialog/create-user-role/create-user-role.component';

@Component({
  selector: 'app-assign-role-to-user',
  templateUrl: './assign-role-to-user.component.html',
  styleUrls: ['./assign-role-to-user.component.css']
})
export class AssignRoleToUserComponent implements OnInit {
  dataSource;
  displayedColumns = ['id', 'user', 'role','action'];
  private dialogRef: MatDialogRef<CreateUserRoleComponent>;
  
  userrole: UserRoleVM[];
  constructor(
    private securitySvc: SecurityService,
    public dialog: MatDialog,
  ) {
    dialog.afterAllClosed
    .subscribe(() => {
      this.ngOnInit()
    }
  );
   }

  ngOnInit(): void {
    this.securitySvc.getUserRoleList().subscribe((res: UserRoleVM[]) => {
      this.userrole = res;    
      this.dataSource= new MatTableDataSource (this.userrole);   
      debugger;
      });
  
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreateUserRoleComponent, {
      panelClass: 'calendar-form-dialog',
      width: '450px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
 Delete(uRole){
  debugger
  let dialogRef = this.dialog.open(CreateUserRoleComponent, {disableClose:true, panelClass: 'calendar-form-dialog',  width: '450px' 
  , data: { uRoleId:uRole.userId , action:"Delete" }
  
       
 });
 }
  EditUserRole(uRole){
    debugger
    let dialogRef = this.dialog.open(CreateUserRoleComponent, {disableClose:true, panelClass: 'calendar-form-dialog',  width: '450px' 
    , data: { uRoleId:uRole.userId  ,action:"Edit"}
    
         
   });
  }
}

