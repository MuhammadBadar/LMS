import { Component, Injectable, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { LMSService } from '../lms.service';
import { LectureVM } from '../models/lectureVM';
import { AddLectureComponent } from './add-lecture/add-lecture.component';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';

@Component({
  selector: 'app-lectures',
  templateUrl: './lectures.component.html',
  styleUrls: ['./lectures.component.css'],
})
export class LecturesComponent implements OnInit {
  dataSource;
  displayedColumns = ['id', 'title', 'description', 'lectureURL', 'actions'];
  lecture: LectureVM[];
  durationInSeconds = 3;
  hide = true;
  dialogTitle: string;
  public dialogRef: MatDialogRef<AddLectureComponent>
  constructor(
    public dialog: MatDialog,
    public lmsService: LMSService,
  ) {
    dialog.afterAllClosed
      .subscribe(() => {
        this.ngOnInit()
      }
      );
    this.dialogTitle = 'Manage Lecture';
  }
  ngOnInit(): void {
    this.lmsService.getLectureList().subscribe((res: LectureVM[]) => {
      this.lecture = res;
      this.dataSource = new MatTableDataSource(this.lecture);
    });
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(AddLectureComponent, {
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
  DeleteLecture(id) {
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
        this.lmsService.DeleteLecture(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Lecture has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
  EditLecture(lec: LectureVM) {
    let dialogRef = this.dialog.open(AddLectureComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '550px'
      , data: { lecId: lec.id }
    });
  }
}
