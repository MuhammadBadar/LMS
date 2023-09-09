import { LogEventVM } from './../models/LogEventVM';
import { AttendanceService } from './../attendance.service';
import { Component, OnInit } from '@angular/core';
import { UserVM } from 'app/views/security/models/user-vm';
import { Router } from '@angular/router';
import { SecurityService } from 'app/views/security/security.service';
import { SignOutDialogComponent } from '../sign-out-dialog/sign-out-dialog.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-log-event',
  templateUrl: './log-event.component.html',
  styleUrls: ['./log-event.component.css']
})
export class LogEventComponent implements OnInit {
  logs: LogEventVM[];
  dataSource;
  user: UserVM
  displayedColumns = ['userName', 'createdOn', 'time', 'action', 'message'];
  constructor(
    public attndSvc: AttendanceService,
    public dialog: MatDialog,
  ) {
    this.attndSvc.selectedLogEvent = new LogEventVM;
  }
  ngOnInit(): void {
    this.attndSvc.SearchLogEvent(this.attndSvc.selectedLogEvent).subscribe((res: LogEventVM[]) => {
      this.logs = res;
      this.dataSource = this.logs
    });
  }
}
