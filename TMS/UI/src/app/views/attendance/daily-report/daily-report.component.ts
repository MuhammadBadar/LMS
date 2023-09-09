import { filter } from 'rxjs/operators';
//import { MatSort } from '@angular/material/sort';
import { MarkAttendanceVM } from './../models/MarkAttendanceVM';
import { AttendanceService } from './../attendance.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { SignOutDialogComponent } from '../sign-out-dialog/sign-out-dialog.component';
import { MatDialog } from '@angular/material/dialog';
import { UserVM } from 'app/views/security/models/user-vm';
import { SecurityService } from 'app/views/security/security.service';
import { MatSort, Sort, SortDirection } from '@angular/material/sort';
import { DatePipe } from '@angular/common';
import { LiveAnnouncer } from '@angular/cdk/a11y';

@Component({
  selector: 'app-daily-report',
  templateUrl: './daily-report.component.html',
  styleUrls: ['./daily-report.component.css']
})
export class DailyReportComponent implements OnInit {
  // @ViewChild(MatSort) sort: MatSort;
  sort: Sort
  lastdate: string;
  firstdate: string;
  fromDate = new Date();
  toDate = new Date();
  Users: UserVM[];
  data: MarkAttendanceVM[];
  Id;
  dataSource;
  displayedColumns = ['userName', 'createdOn', 'inTime', 'outTime', 'workingHours'];
  constructor(
    private datePipe: DatePipe,
    public dialog: MatDialog,
    public attndSvc: AttendanceService,
    public secSrvc: SecurityService,
  ) {
    this.attndSvc.selectedAttendance = new MarkAttendanceVM
    this.secSrvc.selectedUser = new UserVM
  }
  ngOnInit(): void {
    this.fromDate = new Date();
    this.toDate = new Date();
    this.attndSvc.selectedAttendance = new MarkAttendanceVM
    this.attndSvc.SearchAttendance(this.attndSvc.selectedAttendance).subscribe((res: MarkAttendanceVM[]) => {
      this.data = res;
      this.dataSource = this.data.slice();
      this.sortData();
    });
    this.secSrvc.getUserList().subscribe((res: UserVM[]) => {
      this.Users = res;
    });
    this.attndSvc.selectedAttendance.userName = "select";
  }
  Search() {
    this.fromDate = new Date();
    this.toDate = new Date();
    this.dataSource = this.data
    this.dataSource = this.dataSource.filter(e => e.userName == this.attndSvc.selectedAttendance.userName)
  }
  transform() {
    this.dataSource = this.data
    this.firstdate = this.datePipe.transform(this.fromDate, 'yyyy-MM-dd');
    this.lastdate = this.datePipe.transform(this.toDate, 'yyyy-MM-dd');
    this.dataSource = this.dataSource.filter(e =>
      ((this.datePipe.transform(e.createdOn, 'yyyy-MM-dd') == this.firstdate) ||
        (this.datePipe.transform(e.createdOn, 'yyyy-MM-dd') >= this.firstdate)) &&
      ((this.datePipe.transform(e.createdOn, 'yyyy-MM-dd') <= this.lastdate) ||
        (this.datePipe.transform(e.createdOn, 'yyyy-MM-dd') == this.lastdate)))
  }
  sortData() {
    this.sort = { active: 'userName', direction: 'asc' }
    const data = this.dataSource.slice();
    if (!this.sort.active || this.sort.direction === '') {
      this.dataSource = data;
      return;
    }
    this.dataSource = data.sort((a, b) => {
      const isAsc = this.sort.direction === 'asc';
      switch (this.sort.active) {
        case 'userName': return compare(a.userName, b.userName, isAsc);
        case 'createdOn': return compare(a.createdOn, b.createdOn, isAsc);
        case 'inTime': return compare(a.inTime, b.inTime, isAsc);
        case 'outTime': return compare(a.outTime, b.outTime, isAsc);
        case 'workingHours': return compare(a.workingHours, b.workingHours, isAsc);
        default: return 0;
      }
    });
  }
}
function compare(a: number | string, b: number | string, isAsc: boolean) {
  return (a < b ? -1 : 1) * (isAsc ? 1 : -1);
}
