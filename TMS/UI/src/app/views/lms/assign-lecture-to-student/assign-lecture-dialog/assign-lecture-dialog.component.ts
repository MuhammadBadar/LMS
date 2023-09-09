import { LMSService } from './../../lms.service';
import { Component, OnInit } from '@angular/core';
import { LectureVM } from '../../models/lectureVM';
import { StudentLectureVM } from '../../models/assignlectureVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { StudentRegistrationVM } from '../../models/studentregistrationVM';
@Component({
  selector: 'app-assign-lecture-dialog',
  templateUrl: './assign-lecture-dialog.component.html',
  styleUrls: ['./assign-lecture-dialog.component.css']
})
export class AssignLectureDialogComponent implements OnInit {
  durationInSeconds = 3;
  stdlec: StudentLectureVM[];
  lecture: LectureVM[];
  student: StudentRegistrationVM[];
  dialogTitle: string;
  constructor(
    private _snackBar: MatSnackBar,
    public lmsSvc: LMSService,
    public dialogRef: MatDialogRef<AssignLectureDialogComponent>,
  ) {
    this.dialogTitle = 'Student Lectures';
    this.lmsSvc.selectedStudentLecture = new StudentLectureVM;
  }

  openSnackBar() {
    this._snackBar.openFromComponent(SnackbarComponent, {
      duration: this.durationInSeconds * 1000,
    });
  }
  ngOnInit(): void {
    this.lmsSvc.getLectureList().subscribe((res: LectureVM[]) => {
      this.lecture = res;
    });
    this.lmsSvc.getRegisterStudentList().subscribe((res: StudentRegistrationVM[]) => {
      this.student = res;
    });
  }
  SaveStudentLecture() {
    this.lmsSvc.SaveStudentLecture(this.lmsSvc.selectedStudentLecture).subscribe((data) => {
      this.openSnackBar()
    },
      (err: any) => {
        alert('Error')
      });
  }
}
@Component({
  selector: 'snack-bar-component',
  template: '<span class="user" style="margin-left:40px"><strong> Assign Lecture to Student Successfully</strong></span>',
  styles: [
    `
    .user {
      color: White;
    }
  `,
  ],
})
export class SnackbarComponent { }
