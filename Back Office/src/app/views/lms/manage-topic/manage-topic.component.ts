import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { TopicVM } from '../Models/TopicVM';
import { LMSService } from './../lms.service';
import { Component, Injector, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
import { CourseVM } from '../Models/CourseVM';
import { ManageCourseComponent } from '../manage-course/manage-course.component';

@Component({
  selector: 'app-manage-topic',
  templateUrl: './manage-topic.component.html',
  styleUrls: ['./manage-topic.component.css']
})
export class ManageTopicComponent implements OnInit {
  displayedColumns: string[] = ['topicTitle', 'course', 'description', 'isActive', 'actions'];
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: any
  selectedTopic: TopicVM
  courses?: CourseVM[]
  topics?: TopicVM[]
  dialogRef?: any
  
  dialogRefe: any;
  isDialog : boolean = false;
  dialogData: any;
  constructor(  private injector: Injector,
    private lmsSvc: LMSService,
    private dialog: MatDialog,
    private catSvc: CatalogService) {
    this.selectedTopic = new TopicVM;
  
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.GetTopic();
    this.GetCourses();
    if (this.dialogData ) {
      this.isDialog =this.dialogData.isDialogue;
      console.warn(this.dialogData.topicId)}
  }
  GetCourses() {
    this.lmsSvc.GetCourse().subscribe({
      next: (res: CourseVM[]) => {
        this.courses = res
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetTopic() {
    this.lmsSvc.GetTopic().subscribe({
      next: (value: TopicVM[]) => {
        this.topics = value
        this.dataSource = new MatTableDataSource(this.topics)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  SaveTopic() {
    this.lmsSvc.SaveTopic(this.selectedTopic).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  EditTopic(topic: TopicVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedTopic = topic
  }
  UpdateTopic() {
    this.lmsSvc.UpdateTopic(this.selectedTopic).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Refresh() {
    this.GetTopic();
    this.selectedTopic = new TopicVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteTopic(id: number) {
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
        this.lmsSvc.DeleteTopic(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Topic has been deleted.',
              'success'
            )
            this.Refresh();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }

  OpenCourseDialog() {
    this.dialogRef = this.dialog.open(ManageCourseComponent, {
      width: '1200px', height: '950px',
       disableClose: true, panelClass: 'calendar-form-dialog',
      data: { isDialogue: true, courseId: this.selectedTopic.courseId },
   
    })
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetCourses()
      }
      );
  }
}
