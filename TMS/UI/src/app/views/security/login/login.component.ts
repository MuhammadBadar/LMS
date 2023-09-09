import { UserVM } from 'app/views/security/models/user-vm';
import { AttendanceService } from './../../attendance/attendance.service';
import { MarkAttendanceDialogComponent } from './../../attendance/mark-attendance-dialog/mark-attendance-dialog.component';

import { SecurityService } from 'app/views/security/security.service';
import { Component, OnInit, Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { LoginVM } from '../models/LoginVM';
import { JwtHelperService } from '@auth0/angular-jwt';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CreateUserDialogComponent } from '../manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';
import Swal from 'sweetalert2';
import { LogEventVM } from 'app/views/attendance/models/LogEventVM';
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
Login(){
  this.secSrvc.Login(this.secSrvc.login).subscribe((data:any) => {

     if(data.result.succeeded==true){
      Swal.fire({
        position:  'center' ,
        title: 'Wellcome ' + data.userName,
        background: "#FFFFFF",
        confirmButtonColor: "#000000"   
      })
     //this.snack.open(' Successfully Login!', 'OK', { duration: 4000 })
     localStorage.setItem("token",data.token)
     }
     else{
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Something went wrong! ',
        confirmButtonColor: "#000000"
      })
     }
   },
     (err: any) => {
     if(err.status==400){
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Invalid Request! ',
        footer: 'Please ReCheck  User Name Or Password',
        confirmButtonColor: "#000000"
      })
    }
    else if(err.status==0){
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Something went wrong! ',
        footer: 'Please Check your Internet Connection',
        confirmButtonColor: "#000000"
      })
    } else{
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Something went wrong! ',
        confirmButtonColor: "#000000"
      })
    }
     });
     console.warn(localStorage)

}
Logout(){
  localStorage.removeItem('token')
}
LoggedIn():boolean{
const token= localStorage.getItem('token');
return !this.helper.isTokenExpired(token);
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
