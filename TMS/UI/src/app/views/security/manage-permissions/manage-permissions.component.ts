import { Component, OnInit } from '@angular/core';
import { PermissionVM } from '../models/permission-vm';
import { SecurityService } from '../security.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { FormGroup, FormControl, Validators, FormBuilder, FormArray } from '@angular/forms';
import { CreatePermissionDialogComponent } from './manage-permission-dialog/create-permission-dialog/create-permission-dialog.component';


@Component({
  selector: 'app-manage-permissions',
  templateUrl: './manage-permissions.component.html',
  styleUrls: ['./manage-permissions.component.css']
})
export class ManagePermissionsComponent implements OnInit {
 // permissionForm: FormGroup;
  permissions: PermissionVM[];
  dataSource;
  displayedColumns = [ 'user', 'role','feature','permission','action'];
  private dialogRef: MatDialogRef<CreatePermissionDialogComponent>;

  // get permissionArray(): FormArray {
  //   return this.permissionForm.get("item") as FormArray;
  // }
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
    this.securitySvc.getPermissionList().subscribe((res: PermissionVM[]) => {
      this.permissions = res;    
      this.dataSource= new MatTableDataSource (this.permissions); 
      debugger;
      });
  
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreatePermissionDialogComponent, {
      panelClass: 'calendar-form-dialog',
      width: '750px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
 
EditPermission(perm){
  let dialogRef = this.dialog.open(CreatePermissionDialogComponent, {disableClose:true, panelClass: 'calendar-form-dialog',  width: '750px' 
  , data: { permId:perm.id  }
  
       
 });
}
}

