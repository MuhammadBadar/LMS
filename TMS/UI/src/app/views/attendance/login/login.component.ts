import { Component, Injectable, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { JwtHelperService } from '@auth0/angular-jwt';
import { CreateUserDialogComponent } from 'app/views/security/manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';
import { LoginVM } from 'app/views/security/models/LoginVM';
import { UserVM } from 'app/views/security/models/user-vm';
import { SecurityService } from 'app/views/security/security.service';
import { AttendanceService } from '../attendance.service';
import { MarkAttendanceDialogComponent } from '../mark-attendance-dialog/mark-attendance-dialog.component';
import { LogEventVM } from '../models/LogEventVM';
@Injectable({
  providedIn: 'root'
})
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user:UserVM
  private dialogRef: MatDialogRef<CreateUserDialogComponent>;
  info=new LoginVM;
  hide = true;
  helper= new JwtHelperService();
  constructor( 
    public dialog: MatDialog,
     private snack: MatSnackBar,
     public secSrvc:SecurityService,
     public attndSvc:AttendanceService) { 
      this.secSrvc.login= new LoginVM;
      this.attndSvc.selectedLogEvent= new LogEventVM
    }
    

  ngOnInit(): void {
  }


public addEvent() {
  this.dialogRef = this.dialog.open(CreateUserDialogComponent, {
    panelClass: 'calendar-form-dialog',
    width: '650px'
   // background-color: 'purple'
  });
  this.dialogRef.afterClosed()
    .subscribe((res) => {
      if (!res) {
        return;
      }
    });
}
MarkAttendance(){
  this.info.userName=this.secSrvc.login.userName
  this.info.password=this.secSrvc.login.password
  debugger
  let dialogRef = this.dialog.open(MarkAttendanceDialogComponent, {
    disableClose:true, panelClass: 'calendar-form-dialog', 
     width: '550px',  data:this.info 
    
});
dialogRef.afterClosed()
    .subscribe((res) => {
    
   });

}

}