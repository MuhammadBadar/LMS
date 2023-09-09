import { Component, OnInit } from '@angular/core';
import { RoleVM } from '../models/role-vm';
import { SecurityService } from '../security.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CreateRoleDialogComponent } from './manage-role-dialog/create-role-dialog/create-role-dialog.component';

import { MatTableDataSource } from '@angular/material/table';
@Component({
  selector: 'app-manage-role',
  templateUrl: './manage-role.component.html',
  styleUrls: ['./manage-role.component.css']
})
export class ManageRoleComponent implements OnInit {
  dataSource;
  displayedColumns = ['id', 'role','action'];
  private dialogRef: MatDialogRef<CreateRoleDialogComponent>;
  
  roles: RoleVM[];
    
  constructor(
    private securitySvc: SecurityService,
    public dialog: MatDialog,) { 
      dialog.afterAllClosed
      .subscribe(() => {
        this.ngOnInit()
      }
    );
    }

  ngOnInit(): void {
    //alert('inside ngOnInit');
    debugger;
    this.securitySvc.getRolesList().subscribe((res: RoleVM[]) => {
    this.roles = res;   
    this.dataSource= new MatTableDataSource (this.roles);   
  
    debugger;
    });

  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreateRoleDialogComponent, {
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
 
  EditRole(role){
    let dialogRef = this.dialog.open(CreateRoleDialogComponent, {disableClose:true, panelClass: 'calendar-form-dialog',  width: '450px' 
    , data: { roleId:role.id  }
    
         
   });
  }

}
