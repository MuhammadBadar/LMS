import { StudentRegistrationVM } from './../models/studentregistrationVM';
import { StudentLectureVM } from './../models/assignlectureVM';
import { LMSService } from './../lms.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { AssignLectureDialogComponent } from './assign-lecture-dialog/assign-lecture-dialog.component';
import { MatTableDataSource } from '@angular/material/table';
import { LectureVM } from '../models/lectureVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-assign-lecture-to-student',
  templateUrl: './assign-lecture-to-student.component.html',
  styleUrls: ['./assign-lecture-to-student.component.css']
})
export class AssignLectureToStudentComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  dataSource;
  displayedColumns = ['student', 'title', 'lecture', 'description', 'assignedOn', 'actions'];
  lecture: LectureVM[];
  student: StudentRegistrationVM[];
  private dialogRef: MatDialogRef<AssignLectureDialogComponent>;
  stdlec: StudentLectureVM[];
  getstdlecById: StudentLectureVM;
  constructor(
    public lmssvc: LMSService,
    public dialog: MatDialog,
    private snack: MatSnackBar
  ) { this.lmssvc.selectedStudentLecture = new StudentLectureVM; }
  ngOnInit(): void {
    this.lmssvc.getStudentLectureList().subscribe((res: StudentLectureVM[]) => {
      this.stdlec = res;
      this.dataSource = new MatTableDataSource(this.stdlec);
    });
    this.lmssvc.getLectureList().subscribe((res: LectureVM[]) => {
      this.lecture = res;
    });
    this.lmssvc.getRegisterStudentList().subscribe((res: StudentRegistrationVM[]) => {
      this.student = res;
    });
  }
  Students() {
    this.lmssvc.getStudentLectureList().subscribe((res: StudentLectureVM[]) => {
      this.stdlec = res;
      this.dataSource = new MatTableDataSource(this.stdlec);
    });
  }
  Search() {
    if (this.Add == true) {
      console.warn(this.lmssvc.selectedStudentLecture)
      this.lmssvc.SearchStudentLecture(this.lmssvc.selectedStudentLecture).subscribe((res: StudentLectureVM[]) => {
        this.stdlec = res;
        console.warn(this.stdlec)
        this.dataSource = new MatTableDataSource(this.stdlec);
      });
    }
  }
  SaveStudentLecture() {
    this.lmssvc.SaveStudentLecture(this.lmssvc.selectedStudentLecture).subscribe((data) => {
      this.lmssvc.getStudentLectureList().subscribe((res: StudentLectureVM[]) => {
        this.stdlec = res;
        this.dataSource = new MatTableDataSource(this.stdlec);
        this.lmssvc.selectedStudentLecture = new StudentLectureVM;
      });
      this.snack.open('Lecture Assigned!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(AssignLectureDialogComponent, {
      panelClass: 'calendar-form-dialog',
      width: '550px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
  DeleteAssignLec(id) {
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
        this.lmssvc.DeleteStudentLecture(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
  GetAssignLec(id) {
    this.lmssvc.selectedStudentLecture = new StudentLectureVM;
    this.lmssvc.selectedStudentLecture.id = id
    this.lmssvc.SearchStudentLecture(this.lmssvc.selectedStudentLecture).subscribe((res: StudentLectureVM[]) => {
      this.stdlec = res;
      this.lmssvc.selectedStudentLecture = this.stdlec[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  UpdateStudentLecture() {
    this.lmssvc.UpdateAssignLec(this.lmssvc.selectedStudentLecture).subscribe((res) => {
      this.snack.open('Successfully Updated!', 'OK', { duration: 4000 })
      this.Add = true;
      this.Edit = false;
      this.lmssvc.selectedStudentLecture = new StudentLectureVM;
      this.ngOnInit();
    })
  }
  Refresh() {
    this.lmssvc.selectedStudentLecture = new StudentLectureVM;
    this.Add = true;
    this.Edit = false;
  }
}
