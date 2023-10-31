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
import { StudentVM } from '../Models/StudentVM';
import Swal from 'sweetalert2';
import { ManageStudentComponent} from '../manage-student/manage-student.component'



@Component({
  selector: 'app-manage-assign-task',
  templateUrl: './manage-assign-task.component.html',
  styleUrls: ['./manage-assign-task.component.css']
})
export class ManageAssignTaskComponent implements OnInit {
  displayedColumns: string[] = ['studentname','lectures','actions'];
  AddMode: boolean = true
  proccessing: boolean = false;
  EditMode: boolean = false
  dataSource: any
  selectedTask: AssignTaskVM
  assigntask?:AssignTaskVM[] | undefined;
  lecs?:LectureVM[]
  stds?:StudentVM[]
  dialogRef?: any;
  tasks?: AssignTaskVM[]
  dialogref: any
  dialogData: any;
  selectedLectures: { [studentId: number]: number[] } = {};
   isDialog: boolean = false;
  constructor(
    public accSvc: LMSService,
    private lmsSvc: LMSService, 
    private catSVC: CatalogService,
    private dialog: MatDialog){
     
    this.selectedTask = new AssignTaskVM
  }
  ngOnInit(): void {
     this.GetAssignTask();
     this.GetLecture();
     this.GetStudent();
    //  this.selectedTask.isActive = true;
    

      }
  EditAssignTask(tsk: AssignTaskVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedTask = tsk
  }
  // GetCourseForEdit(id: number) {
  //   this.selectedTask = new AssignTaskVM;
  //   this.selectedTask.id = id
  //   console.warn(this.selectedTask);
  //   this.accSvc.SearchCourse(this.selectedTask).subscribe({
  //     next: (res: AssignTaskVM[]) => {
  //       this.assigntask = res;
  //       this.selectedTask = this.assigntask[0]
  //       this.EditMode = true;
  //       this.AddMode = false;
  //     }, error: (e) => {
  //       this.catSVC.ErrorMsgBar("Error Occurred", 5000)
  //       console.warn(e);
  //     }
  //   })
  // }

  EditTopic(student: AssignTaskVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedTask = student
  }
  

  // GetTopic(){
  //   this.lmsSvc.GetTopic().subscribe({
  //     next: (res: TopicVM[]) => {
  //       this.topic = res 
  //     }, error: (err) = res
  //   })
  // }
  Search(){ 
    var  std = new AssignTaskVM;
    std.studentId = this.selectedTask.studentId;
    this.lmsSvc.SearchAssignTask(std).subscribe({
     next: (value: AssignTaskVM[]) => {
       this.tasks = value
       this.dataSource = new MatTableDataSource(this.tasks)
     }, error: (err) => {
       this.catSVC.ErrorMsgBar("Error Occurred", 5000)
     },
   })}


  GetLecture() {
  
    debugger;
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
  GetStudent() {
    var Student = new StudentVM
    Student.isActive= true;
    this.lmsSvc.SearchStudent(Student).subscribe({
      next: (value: StudentVM[]) => {
        this.stds = value
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  
  OpenstudentDialog() {
    this.dialogRef = this.dialog.open(ManageStudentComponent, {
      width: '1200px', height: '950px'
    })
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetStudent()
      }
      );
  }

  OpenLectureDialog() {
    this.dialogRef = this.dialog.open(ManageLectureComponent, {
      width: '1200px', height: '950px'
  
    })
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetLecture()
      }
      );
  }
//   Search(){
   
  
//  debugger
//     var lecture = new LectureVM
//     lecture.isActive = true;
//     this.lmsSvc.SearchLecture(lecture).subscribe({
//       next: (res: LectureVM[]) => {
//         this.lecs = res
//       }, error: (err) => {
//         this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//       },
//     })
//     var std = new StudentVM
//     std.isActive = true;
//     this.lmsSvc.SearchStudent(std).subscribe({
//       next: (res: StudentVM[]) => {
//         this.stds = res
//       }, error: (err) => {
//         this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//       },
//     })

    
//      var  lec = new AssignTaskVM();
//      this.lmsSvc.SearchAssignTask(lec).subscribe({
//       next: (value: AssignTaskVM[]) => {
//         this.tasks = value
//         this.dataSource = new MatTableDataSource(this.tasks)
//       }, error: (err) => {
//         this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//       },
//  })
 
//     }
//      UpdateAssignTask() {
//       this.lmsSvc.UpdateAssignTask(this.selectedTask).subscribe({
//         next: (value) => {
//           this.catSVC.SuccessMsgBar("Successfully Updated", 5000)
//           this.Refresh();
//         }, error: (err) => {
//           this.catSVC.ErrorMsgBar("Error Occurred", 5000)
//         },
//       })
//     }



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
  if (!this.selectedTask.studentId || !this.selectedTask.lectureId) {
    this.catSVC.ErrorMsgBar("Please fill all required fields.", 5000);
    return; // Exit the function if any required field is empty
  }
  this.lmsSvc.SaveAssignTask(this.selectedTask).subscribe({
    next: (value) => {
      this.catSVC.SuccessMsgBar("Successfully Added", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSVC.ErrorMsgBar("Error Occurred", 5000)
    }
  })
 }

//  SavePatient() {
//   if (!this.selectedPatient.patientName || !this.selectedPatient.gender || !this.selectedPatient.contactNo) {
//     this.catSvc.ErrorMsgBar("Please fill in all required fields.", 5000);
//     return; // Exit the function if any required field is empty
//   }

//   this.lmsSvc.SavePatient(this.selectedPatient).subscribe({
//     next: (value) => {
//       this.catSvc.SuccessMsgBar("Successfully Added", 5000);
//       this.Refresh();
//     }, 
//     error: (err) => {
//       this.catSvc.ErrorMsgBar("Error Occurred", 5000);
//     },
//   });
// }

 Refresh() {
  this.GetAssignTask();
  this.selectedTask = new AssignTaskVM
  this.AddMode = true
}
search(lecture : LectureVM){

}

ValidationAddOnCheckBox(){
Swal.fire({
  title: 'Are you sure,you want to continue?',
  // text: "You won't be able to revert this!",
  icon: 'warning',
   showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes!'
}).then((result) => {
  if (result.value) {
    this.lmsSvc.GetAssignTask().subscribe({
      next: (data) => {
        Swal.fire(
          'Assigned',
          'Task has been assigned.',
          'success'
        )}
      }
      )
    }}
    )
    // CheckAssigning(){

    // }
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
        this.lmsSvc.DeleteAssignTask(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Topic has been deleted.',
              'success'
            )
            this.Refresh();
          }, error: (e) => {
            this.catSVC.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
}