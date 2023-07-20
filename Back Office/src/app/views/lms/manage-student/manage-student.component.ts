import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { StudentVM } from '../Models/StudentVM';
import {  OnInit } from '@angular/core';

// import { VocabularyVM } from '../Models/VocabularyVM';
import Swal from 'sweetalert2';

import { MatTableDataSource } from '@angular/material/table';
import { ManageTopicComponent } from '../manage-topic/manage-topic.component';
import { TopicVM } from '../Models/TopicVM';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-student',
  templateUrl: './manage-student.component.html',
  styleUrls: ['./manage-student.component.scss']
})
export class ManageStudentComponent implements OnInit {

  displayedColumns: string[] = [`name`,`email`,'isActive', 'actions'];
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: any
  typeKeyCode: string = "";
  settingName: string = "";
  Edit: boolean = false;
  selectedOption: string | undefined;
  DisabledType: boolean = false;

  selectedStudents = new StudentVM();
  //vocabDataSource : any
  selectedStudent: StudentVM
  Add: boolean = true;
  Students: StudentVM[] | any;
  dialogRefe: any
  dialogref: any
  
  @ViewChild('StudentForm', { static: true }) StudentForm!: NgForm;
  dialogData: any;
  value?: StudentVM[];
  //selectedVocabulary: VocabularyVM
  students?: StudentVM[]=[]
  public Reftopic?: MatDialogRef<ManageTopicComponent>;
 
 
  topics: TopicVM[] | undefined;
  proccessing: boolean | undefined;
  isDialog: boolean= false;
 

  //vocab: VocabularyVM[]=[]
  constructor( private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedStudent = new StudentVM
    //this.selectedVocabulary = new VocabularyVM
    //private injector: Injector,
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedStudent = new StudentVM
   }
  ngOnInit(): void {
   this.GetTopic();
    
    this.GetStudent();
    if (this.dialogData ) {
      this.isDialog =this.dialogData.isDialogue;
      console.warn(this.dialogData.studentId)}
  
    this.selectedStudent.isActive = true;
    if (this.dialogData != null) {

      console.warn(this.dialogData.cityId)
      
        // if (this.dialogData.courseId != undefined) {
          this.selectedStudent.cityId = this.dialogData.cityId
           this.SearchbyCity(this.dialogData.cityId)
        // }
      }
  }
  SearchbyCity(id: number) {
    debugger
    var student = new StudentVM
    student.cityId = id
    this.lmsSvc.SearchStudent(student).subscribe({
     next: (value: StudentVM[]) => {
       this.Students = value
       this.dataSource = new MatTableDataSource(value)
       console.warn(this.selectedStudent.cityId)
     }, error: (err) => {
    
       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     },
   })
  }
  GetTopic() {
    this.lmsSvc.GetTopic().subscribe({
      next: (value: TopicVM[]) => {
        this.topics = value
       // this.dataSource = new MatTableDataSource(this.topics)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  // GetCity() {
  //   this.lmsSvc.GetCity().subscribe({
  //     next: (res: CityVM[]) => {
  //       this.City = res;
  //      // this.dataSource = new MatTableDataSource(this.City);
  //     }, error: (e) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //       console.warn(e);
  //     }
  //   })
  



  SaveStudent() {
    this.lmsSvc.GetStudent().subscribe({
      next: (res: StudentVM[]) => {
        var list = res
        if (this.Edit)
          list = list.filter(x => x != this.selectedStudent)
        var find = list.find(x => x.name == this.selectedStudent.name)
        if (find == undefined) {
  
          this.proccessing = true
          this.CheckStudentValidation();
          if (!this.StudentForm.invalid) {
            if (this.Edit)
              this.UpdateStudent
            else {
              this.lmsSvc.SaveStudent(this.selectedStudent).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
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
        } 
        else
          this.catSvc.ErrorMsgBar("Please Fill required name field! ", 5000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  //  this.lmsSvc.GetStudent().subscribe({
  //   next: (res: StudentVM[]) => {
  //     var list = res
  //     if (this.Edit)
  //       list = list.filter(x => x != this.selectedStudent)
  //     var find = list.find(x => x.name == this.selectedStudent.name)
  //   if (find == undefined) {
  //     if (this.selectedStudent.email == undefined || this.selectedStudent.email == null)
  //       this.catSvc.ErrorMsgBar("Please enter a name/email to continue", 5000)
    
  //   this.CheckStudentValidation();
  //   if(!this.StudentForm.invalid){
  //   this.lmsSvc.SaveStudent(this.selectedStudent).subscribe({
  //     next: (value) => {
  //       this.catSvc.SuccessMsgBar("Successfully Added", 5000)
  //       this.Refresh();
  //     }, error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //     },
  //   })
  // } else this.catSvc.ErrorMsgBar("Please fill all Required fields  ", 5000)
//}
    // }
    
//      })
// }
  EditStudent(student: StudentVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedStudent = student
  }
  UpdateStudent() {
    this.lmsSvc.UpdateStudent(this.selectedStudent).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Refresh() {
    this.GetStudent();
    this.selectedStudent = new StudentVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteStudent(id: number) {
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
        this.lmsSvc.DeleteStudent(id).subscribe({
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


  GetStudent() {
    var Student = new StudentVM
    Student.isActive= true;
    this.lmsSvc.GetStudent().subscribe({
      next: (value: StudentVM[]) => {
        this.students = value
        this.dataSource = new MatTableDataSource(this.students)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  
  // OpenCityDialog() {
  //   this.dialogRef = this.dialog.open(ManageCityComponent, {
  //     width: '1200px', height: '950px',
  //     disableClose: true, panelClass: 'calendar-form-dialog',
  //     data: { isDialogue: true, cityId: this.selectedStudent.cityId },
   
  //   })
  //   this.dialogRef.afterClosed()
  //     .subscribe((res: any) => {
  //       this.GetCity()
  //     }
  //     );

OpenTopicDialog() {
  this.Reftopic = this.dialog.open(ManageTopicComponent, {
    width: '1200px', height: '950px',
    disableClose: true, panelClass: 'calendar-form-dialog',
      data: { isDialogue: true, topicId: this.selectedStudent.topicId },
   
  })
  this.Reftopic.afterClosed()
    .subscribe((res: any) => {
      this.GetTopic()
    }
    );
}
CheckStudentValidation() {
  if (this.selectedStudent.topicId == 0 || this.selectedStudent.topicId == undefined)
    this.StudentForm.form.controls['topicId'].setErrors({ 'incorrect': true });
    if (this.selectedStudent.cityId == 0 || this.selectedStudent.cityId == undefined)
    this.StudentForm.form.controls['cityId'].setErrors({ 'incorrect': true });
}
}
