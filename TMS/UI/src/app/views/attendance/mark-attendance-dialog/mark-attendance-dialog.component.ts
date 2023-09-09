import { AttendanceService } from './../attendance.service';
import { Component, Injector, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { LoginVM } from 'app/views/security/models/LoginVM';
import { SecurityService } from 'app/views/security/security.service';
import Swal from 'sweetalert2';
import { MarkAttendanceVM } from '../models/MarkAttendanceVM';
import { UserVM } from 'app/views/security/models/user-vm';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-mark-attendance-dialog',
  templateUrl: './mark-attendance-dialog.component.html',
  styleUrls: ['./mark-attendance-dialog.component.css']
})
export class MarkAttendanceDialogComponent implements OnInit {
  Date = new Date();
  NowDtae: string;
  data: MarkAttendanceVM[];
  MAttendance;
  user: UserVM;
  constructor(
    private snack: MatSnackBar,
    private route: Router,
    public dialogRef: MatDialogRef<MarkAttendanceDialogComponent>,
    private injector: Injector,
    public secSrvc: SecurityService,
    public attndSvc: AttendanceService,
    private datePipe: DatePipe,
  ) {
    this.dialogRef = this.injector.get(MatDialogRef, null);
    this.MAttendance = this.injector.get(MAT_DIALOG_DATA, null);
    this.secSrvc.login = new LoginVM
    this.secSrvc.selectedUser = new UserVM
    this.attndSvc.selectedAttendance = new MarkAttendanceVM
  }
  ngOnInit(): void {
  }
  Login() {
    this.secSrvc.Login(this.MAttendance).subscribe((data: any) => {
      console.warn(data.succeeded)
      console.warn(data?.result?.succeeded)
      debugger
      if (data?.result?.succeeded == true) {
        Swal.fire({
          position: 'center',
          title: 'Wellcome ' + this.MAttendance.userName,
          background: "#FFFFFF",
          confirmButtonColor: "#000000"
        })
        //this.snack.open(' Successfully Login!', 'OK', { duration: 4000 })
        localStorage.setItem("AMStoken", data.token)
        this.route.navigate(['/attendance/daily']);
        localStorage.setItem("AMSUserName", this.MAttendance.userName)
        this.dialogRef.close();
        this.SaveLogEvent();
      }
      else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Please ReCheck  User Name Or Password ',
          confirmButtonColor: "#000000"
        })
      }
    },
      (err: any) => {
        if (err.status == 400) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Request! ',
            footer: 'Please ReCheck  User Name Or Password',
            confirmButtonColor: "#000000"
          })
        }
        else if (err.status == 0) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong! ',
            footer: 'Please Check your Internet Connection',
            confirmButtonColor: "#000000"
          })
        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please ReCheck  User Name Or Password ',
            confirmButtonColor: "#000000"
          })
        }
      });
    // localStorage.setItem("UserId",this.user.id)
  }
  MarkAttendance() {
    this.attndSvc.selectedAttendance.userName = this.MAttendance.userName
    this.attndSvc.SearchAttendance(this.attndSvc.selectedAttendance).subscribe((res: MarkAttendanceVM[]) => {
      this.data = res;
      this.NowDtae = this.datePipe.transform(this.Date, 'yyyy-MM-dd');
      const attnddata = this.data.filter(e => this.datePipe.transform(e.inTime, 'yyyy-MM-dd') == this.NowDtae)
      const attndData = this.data.filter(e => e.outTime == null)
      if (attndData.length == 0)
        this.SaveMarkAttendance();
      else {
        this.snack.open('You Already Attend Post', 'OK', { duration: 4000 })
      }
    });
  }
  SaveMarkAttendance() {
    this.secSrvc.selectedUser.userName = this.MAttendance.userName
    this.secSrvc.SearchUserByName(this.secSrvc.selectedUser).subscribe((res: UserVM) => {
      this.user = res
      if (this.user !== null) {
        this.attndSvc.selectedAttendance.userId = this.user.id
        this.attndSvc.SaveAttendance(this.attndSvc.selectedAttendance).subscribe((data: any) => {
          this.Login();
        });
      }
    });
  }
  lwmAttnd() {
    this.Login();
  }
  SaveLogEvent() {
    this.secSrvc.selectedUser.userName = this.MAttendance.userName
    this.secSrvc.SearchUserByName(this.secSrvc.selectedUser).subscribe((res: UserVM) => {
      this.user = res
      this.attndSvc.selectedLogEvent.action = "Login";
      this.attndSvc.selectedLogEvent.userId = this.user.id;
      this.attndSvc.selectedLogEvent.message = this.MAttendance.userName + " successfully Login"
      this.attndSvc.SaveLogEvent(this.attndSvc.selectedLogEvent).subscribe((data: any) => {
      });
    });
  }
}
