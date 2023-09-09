import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { LectureVM } from '../../models/lectureVM';
import { LMSService } from '../../lms.service';
@Component({
  selector: 'app-add-lecture',
  templateUrl: './add-lecture.component.html',
  styleUrls: ['./add-lecture.component.css']
})
export class AddLectureComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  LecId: number;
  durationInSeconds = 3;
  hide = true;
  lecture: LectureVM[];
  dialogTitle: string;
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<AddLectureComponent>,
    private snack: MatSnackBar,
    public lmsSvc: LMSService,
  ) {
    this.dialogTitle = 'Manage Lecture';
    this.lmsSvc.selectedLecture = new LectureVM();
  }
  ngOnInit(): void {
    this.LecId = this.data.lecId;
    console.warn(this.data.lecId)
    if (this.LecId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetLecById();
    }
  }
  SaveLecture() {
    if (this.LecId > 0) {
      this.PutLecture();
    } else {
      this.lmsSvc.SaveLecture(this.lmsSvc.selectedLecture).subscribe((data) => {
        this.snack.open('Lecture Added!', 'OK', { duration: 4000 })
      },
        (err: any) => {
          alert('Error')
        });
    }
  }
  GetLecById() {
    this.lmsSvc.selectedLecture.id = this.LecId
    this.lmsSvc.SearchLecture(this.lmsSvc.selectedLecture).subscribe((res: LectureVM[]) => {
      this.lecture = res;
      console.warn(this.lecture);
      this.lmsSvc.selectedLecture = this.lecture[0]
    });
  }
  reload() {
    window.location.reload();
  }
  PutLecture() {
    this.lmsSvc.selectedLecture = this.lecture[0]
    this.lmsSvc.UpdateLecture(this.lmsSvc.selectedLecture).subscribe((data) => {
      this.snack.open('Lecture Updated Successfully!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })

      });
  }
}

