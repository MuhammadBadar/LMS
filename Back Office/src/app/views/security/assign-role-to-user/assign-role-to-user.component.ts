import { Component, OnInit } from '@angular/core';
import { UserRoleVM } from '../models/user-role-vm';
import { SecurityService } from '../security.service';
import { MatTableDataSource } from '@angular/material/table';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CreateUserRoleComponent } from './manage -user-role-dialog/create-user-role/create-user-role.component';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-assign-role-to-user',
  templateUrl: './assign-role-to-user.component.html',
  styleUrls: ['./assign-role-to-user.component.css']
})
export class AssignRoleToUserComponent implements OnInit {
  dataSource: any;
  displayedColumns = ['user', 'role', 'action'];
  private dialogRef?: MatDialogRef<CreateUserRoleComponent>;

  userrole?: UserRoleVM[];
  constructor(
    private snack: MatSnackBar,
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
    this.securitySvc.getUserRoleList().subscribe({
      next: (res: UserRoleVM[]) => {
        this.userrole = res;
        this.dataSource = new MatTableDataSource(this.userrole);
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreateUserRoleComponent, {
      panelClass: 'calendar-form-dialog',
      width: '600px', height: '300px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
  Delete(uRole: any) {
    debugger
    let dialogRef = this.dialog.open(CreateUserRoleComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog',
      width: '650px', height: '330px'
      , data: { uRoleId: uRole.userId, action: "Delete" }
    });
  }
  EditUserRole(uRole: any) {
    debugger
    let dialogRef = this.dialog.open(CreateUserRoleComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '450px'
      , data: { uRoleId: uRole.userId, action: "Edit" }
    });
  }
}

