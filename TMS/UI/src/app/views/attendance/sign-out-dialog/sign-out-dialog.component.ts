import { SecurityService } from './../../security/security.service';
import { UserVM } from './../../security/models/user-vm';
import { MarkAttendanceVM } from './../models/MarkAttendanceVM';
import { LoginComponent } from './../../lms/login/login.component';
import { Router, RouterLink } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { AttendanceService } from '../attendance.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { date } from 'ngx-custom-validators/src/app/date/validator';
import { DatePipe } from '@angular/common';


@Component({
  selector: 'app-sign-out-dialog',
  templateUrl: './sign-out-dialog.component.html',
  styleUrls: ['./sign-out-dialog.component.css']
})
export class SignOutDialogComponent implements OnInit {

  UserName: string;
  Date = new Date();
  NowDtae: string;
  InTime;
  user: UserVM
  Mint: string = "mint"
  Hours: string = "Hour"
  days: string = " Day  'You Didn't leave post on the same Day'"
  data: MarkAttendanceVM[];
  filterData: MarkAttendanceVM[];
  Id = null;
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    public dialogRef: MatDialogRef<SignOutDialogComponent>,
    private attndSvc: AttendanceService,
    private secSrvc: SecurityService,
    private datePipe: DatePipe
  ) {
    this.attndSvc.selectedAttendance = new MarkAttendanceVM
    this.secSrvc.selectedUser = new UserVM
  }
  ngOnInit(): void {
    this.UserName = localStorage.getItem('AMSUserName')
  }
  SignOut() {
    localStorage.removeItem('AMStoken')
    localStorage.removeItem('AMSUserName')
    this.dialogRef.close();
    this.route.navigate(['/attendance/login']);
    this.SaveLogEvent();
  }
  Leave() {
    this.attndSvc.selectedAttendance.userName = this.UserName
    this.attndSvc.SearchAttendance(this.attndSvc.selectedAttendance).subscribe((res: MarkAttendanceVM[]) => {
      this.data = res;
      var search = this.data.find(e => e.outTime == null)
      if (search == null) {
        this.snack.open('You Did not Attend Post', 'OK', { duration: 4000 })
      } else {
        this.NowDtae = this.datePipe.transform(this.Date, 'yyyy-MM-dd');
        this.filterData = this.data.filter(e => this.datePipe.transform(e.inTime, 'yyyy-MM-dd') == this.NowDtae)
        if (this.filterData.length == 0) {
          this.data = this.data.filter(e => e.outTime == null)
        }
        else {
          this.data = this.filterData.filter(e => e.outTime == null)
        }
        this.attndSvc.selectedAttendance = this.data[0];
        this.WorkingTime();
        this.UpdateAttendance();
      }
    });
  }
  UpdateAttendance() {
    this.attndSvc.UpdateMarkAttendance(this.attndSvc.selectedAttendance).subscribe((data: any) => {
      this.snack.open('Leave Post Successfully', 'OK', { duration: 4000 })
      this.dialogRef.close();
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  WorkingTime() {
    let start = new Date().getTime();
    let end = new Date(this.data[0].inTime).getTime();
    let time = start - end;
    let days = Math.floor(time / 86400000)
    let hours = Math.floor((time % 86400000) / 3600000)
    let mint = Math.floor(((time % 86400000) % 3600000) / 60000)
    console.warn(days)
    console.warn(hours)
    console.warn(mint)
    if (hours == 0 && days == 0) {
      this.attndSvc.selectedAttendance.workingHours = mint.toString() + this.Mint
    }
    else if (days == 0) {
      this.attndSvc.selectedAttendance.workingHours = hours.toString() + this.Hours
    }
    else
      this.attndSvc.selectedAttendance.workingHours = days.toString() + this.days
  }
  SaveLogEvent() {
    this.secSrvc.selectedUser.userName = this.UserName
    this.secSrvc.SearchUserByName(this.secSrvc.selectedUser).subscribe((res: UserVM) => {
      this.user = res
      this.attndSvc.selectedLogEvent.action = "LogOut";
      this.attndSvc.selectedLogEvent.userId = this.user.id;
      this.attndSvc.selectedLogEvent.message = this.UserName + " successfully LogOut"
      this.attndSvc.SaveLogEvent(this.attndSvc.selectedLogEvent).subscribe((data: any) => {
      });
    });
  }
}
