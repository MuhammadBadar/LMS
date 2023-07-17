import {  MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { TopicVM } from '../Models/TopicVM';
import { LMSService } from './../lms.service';
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import Swal from 'sweetalert2';
import { CourseVM } from '../Models/CourseVM';
import { ManageCourseComponent } from '../manage-course/manage-course.component';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { NgForm } from '@angular/forms';
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
  Courses?: CourseVM[]
  topics?: TopicVM[]
  dialogRef: any
  dialogref: any
  disableClose:any
  dialogData: any
  isDialog : boolean = false;
  Edit: any;
  proccessing: boolean = false;
  Add: boolean = true;
  hide = true;
  @ViewChild('topicForm', { static: true }) topicForm!: NgForm;

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private dialog: MatDialog,
    private catSvc: CatalogService) {
      this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
   

    this.selectedTopic = new TopicVM
    }
  ngOnInit(): void {
    this.Add = true;
    
    this.GetTopic();
    this.GetCourses();
    this.selectedTopic.isActive = true;
    // this.isDialog = this.dialogData.isDialog;
    if (this.dialogData  != null) {
      this.isDialog = true;
    console.warn(this.dialogData.courseId)
      if (this.dialogData.courseId != undefined) {
        this.selectedTopic.courseId = this.dialogData.courseId
         this.SearchbyCourse(this.dialogData.courseId)
       }
    }
  }
  
  GetCourses() {
    var course = new CourseVM
    course.isActive = true;
    this.lmsSvc.SearchCourse(course).subscribe({
      next: (res: CourseVM[]) => {
        this.Courses = res
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
    this.lmsSvc.GetTopic().subscribe({
      
      next: (res: TopicVM[]) => {
        var list = res
        if (this.Edit)
          res = res.filter(x => x != this.selectedTopic)
        var find = res.find(x => x.topicTitle == this.selectedTopic.topicTitle)
        if (find == undefined) {
          
    if (this.selectedTopic.courseId == 0 || this.selectedTopic.courseId == undefined)
    this.topicForm.form.controls['courseId'].setErrors({ 'incorrect': true });
    console.warn(this.topicForm)

          this.proccessing = true
          if (!this.topicForm.invalid) {
            if (this.Edit)
              this.UpdateTopic()
            else {
              this.lmsSvc.SaveTopic(this.selectedTopic).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar("Successfully Added!", 5000)
                  this.Add = true;
                  this.Edit = false;
                  this.proccessing = false
                  this.ngOnInit();
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                  console.warn(e);
                  this.proccessing = false
                }
              })
            }
          } else {
            this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
            this.proccessing = false
          }
        } else
          this.catSvc.ErrorMsgBar("This Title Already Taken ", 5000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
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
      width: '1200px', height: '950px'
     
     })
      this.dataSource = new MatTableDataSource(this.topics)
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetCourses()
      }
      );
  }
  SearchbyCourse(id : number ){
  debugger
    var topic = new TopicVM
    topic.courseId = id;
    this.lmsSvc.SearchTopic(topic).subscribe({
     next: (value: TopicVM[]) => {
       this.topics = value
       this.dataSource = new MatTableDataSource(value)
       console.warn(this.selectedTopic.courseId)
     }, error: (err) => {
    
       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     },
   })
  //  CheckCoursevalidation() {
  //   if (this.selectedTopic.courseId == 0 || this.selectedTopic.courseId == undefined)
  //     this.topicForm.form.controls['courseId'].setErrors({ 'incorrect': true });
  // }
}}