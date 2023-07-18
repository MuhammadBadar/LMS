import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { LMSService } from './../lms.service';
import { AssignTaskVM } from '../Models/AssignTaskVM';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CourseVM } from '../Models/CourseVM';
import { TopicVM } from '../Models/TopicVM';
import { ManageTopicComponent } from '../manage-topic/manage-topic.component';
import { LectureVM } from '../Models/LectureVM';
import { ManageLectureComponent } from '../manage-lecture/manage-lecture.component';
import { ManageCourseComponent } from '../manage-course/manage-course.component';



@Component({
  selector: 'app-manage-assign-task',
  templateUrl: './manage-assign-task.component.html',
  styleUrls: ['./manage-assign-task.component.css']
})
export class ManageAssignTaskComponent implements OnInit {
  displayedColumns: string[] = ['course','topic','lecture','actions'];
  AddMode: boolean = true
  proccessing: boolean = false;
  EditMode: boolean = false
  dataSource: any
  selectedTask: AssignTaskVM
  assigntask?:AssignTaskVM[]
  courses?: CourseVM[]
  topics?: TopicVM[]
  lecs?:LectureVM[]
  dialogRef?: any;
  tasks?: AssignTaskVM[]
  dialogref: any
  dialogData: any;
  isDialog: boolean = false;
  constructor(
    
    private lmsSvc: LMSService, private catSVC: CatalogService, private dialog: MatDialog){
     
    this.selectedTask = new AssignTaskVM
  }
  ngOnInit(): void {
     this.GetAssignTask();
     this.GetCourses();
     this.GetTopic();
     this.GetLecture();
     this.selectedTask.isActive = true;
    

      }
  EditAssignTask(tsk: AssignTaskVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedTask = tsk
  }

  GetCourses() {

    var course = new CourseVM
    course.isActive = true;

    this.lmsSvc.SearchCourse(course).subscribe({
      next: (res: CourseVM[]) => {
        this.courses = res
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  // GetTopic(){
  //   this.lmsSvc.GetTopic().subscribe({
  //     next: (res: TopicVM[]) => {
  //       this.topic = res 
  //     }, error: (err) = res
  //   })
  // }

  GetTopic() 
  {
    var topic = new TopicVM
    topic.isActive = true;

    this.lmsSvc.SearchTopic(topic).subscribe({
      next: (value: TopicVM[]) => {
        this.topics = value
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  GetLecture() {
  

    var lec = new LectureVM
    lec.isActive = true;

    this.lmsSvc.SearchLecture(lec).subscribe({
      next: (res: LectureVM[]) => {
        this.lecs = res
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  OpenCourseDialog() {
    this.dialogRef = this.dialog.open(ManageCourseComponent, {
      width: '1200px', height: '950px'
    })
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetCourses()
      }
      );
  }
  OpenTopicDialog() {
    this.dialogRef = this.dialog.open(ManageTopicComponent, {
      width: '1200px', height: '950px'
      ,  data:{courseId: this.selectedTask.courseId}
  
    })
    console.warn(this.selectedTask.courseId)
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetTopic()
      }
      );
  }
  OpenLectureDialog() {
    this.dialogRef = this.dialog.open(ManageLectureComponent, {
      width: '1200px', height: '950px'
      ,  data:{topicId: this.selectedTask.topicId}
  
    })
    console.warn(this.selectedTask.topicId)
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetLecture()
      }
      );
  }
  Search(){
   
  
 debugger
    var lecture = new LectureVM
    lecture.isActive = true;
    lecture.topicId = this.selectedTask.topicId;
    this.lmsSvc.SearchLecture(lecture).subscribe({
      next: (res: LectureVM[]) => {
        this.lecs = res
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },
    })



    var  topic = new TopicVM();
    topic.courseId = this.selectedTask.courseId;
     topic.isActive = true;
    this.lmsSvc.SearchTopic(topic).subscribe({
     next: (value: TopicVM[]) => {
       this.topics = value
     }, error: (err) => {
       this.catSVC.ErrorMsgBar("Error Occurred", 5000)
     },
   })
    
     var  lec = new AssignTaskVM();
     lec.courseId = this.selectedTask.courseId;
     this.lmsSvc.SearchAssignTask(lec).subscribe({
      next: (value: AssignTaskVM[]) => {
        this.tasks = value
        this.dataSource = new MatTableDataSource(this.tasks)
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },

      
      

     })
    }
     UpdateAssignTask() {
      this.lmsSvc.UpdateAssignTask(this.selectedTask).subscribe({
        next: (value) => {
          this.catSVC.SuccessMsgBar("Successfully Updated", 5000)
          this.Refresh();
        }, error: (err) => {
          this.catSVC.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    }
GetAssignTask(){
  this.lmsSvc.GetAssignTask().subscribe({

  
    next:(value:AssignTaskVM[])=> {
      this.assigntask = value
      this.dataSource = new MatTableDataSource(this.assigntask)
    },error:(err)=> {
       this.catSVC.ErrorMsgBar("Error Occurred", 5000)
    },
  })
 }

SaveAssignTask(){
  this.lmsSvc.SaveAssignTask(this.selectedTask).subscribe({
    next: (value) => {
      this.catSVC.SuccessMsgBar("Successfully Added", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSVC.ErrorMsgBar("Error Occurred", 5000)
    }
  })
 }

 Refresh() {
  this.GetAssignTask();
  this.selectedTask = new AssignTaskVM
  this.AddMode = true
}
search(lecture : LectureVM){
  this.selectedTask.courseId = lecture.courseId
  this.selectedTask.topicId = lecture.topicId
}
}

 
          // this.selectedTask.topicId = this.selectedLecture.topicId;
          // this.selectedTask.courseId = selectedLecture.courseId;
  


