import { UserVM } from 'app/views/security/models/user-vm';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CalendarEvent } from 'angular-calendar';
import { LMSService } from '../lms.service';
import { MatSort } from '@angular/material/sort';
import { StudentRegistrationVM } from '../models/studentregistrationVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './student-registration.component.html',
  styleUrls: ['./student-registration.component.css']
})
export class StudentRegistrationComponent implements OnInit {
  dataSource;
  displayedColumns = ['studentName', 'email', 'cnic', 'cellNo', 'whatsApp', 'guardianName', 'guardianRelation', 'guardianCell',
    'guardianWhatsApp', 'guardianEmail', 'userName', 'actions'];
  @ViewChild(MatSort) sort: MatSort;
  regstd: StudentRegistrationVM[];
  user: UserVM[];
  event: CalendarEvent;
  durationInSeconds = 3;
  hide = true;
  dialogTitle: string;
  constructor(
    private route: Router,
    public dialog: MatDialog,
    private lmsService: LMSService,
  ) {
    this.dialogTitle = 'Student Registration';
  }
  ngOnInit(): void {
    this.lmsService.getRegisterStudentList().subscribe((res: StudentRegistrationVM[]) => {
      this.regstd = res;
      this.dataSource = new MatTableDataSource(this.regstd);
    });
  }
  EditStudent(std) {
    this.route.navigate(['/lms/student'], {
      queryParams: {
        id: std.id
      }
    });
  }
  DeleteStudent(id) {
    debugger
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        this.lmsService.DeleteStudent(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Student has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
}
