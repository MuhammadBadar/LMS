
import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { StudentsTypeVM } from '../../items/Models/StudentsTypeVM';
import { StudentVM } from '../Models/StudentVM';
import { CityVM } from '../Models/CityVM';

import {  OnInit } from '@angular/core';

// import { VocabularyVM } from '../Models/VocabularyVM';
import Swal from 'sweetalert2';
import { StudentsVM } from '../../items/Models/StudentsVM';
import { ManageCityComponent } from '../manage-city/manage-city.component';
// import { MatTableDataSource } from '@angular/material/table';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-manage-student',
  templateUrl: './manage-student.component.html',
  styleUrls: ['./manage-student.component.css']
})
export class ManageStudentComponent implements OnInit {

    displayedColumns: string[] = [`city`,`name`,`cellNo`,`email`,'isActive', 'actions'];
    AddMode: boolean = true
    EditMode: boolean = false
    dataSource: any
    typeKeyCode: string = "";
    settingName: string = "";
    Edit: boolean = false;
    selectedOption: string | undefined;
    DisabledType: boolean = false;
    type: StudentsTypeVM = new StudentsTypeVM;
    studentsType?: StudentsTypeVM[];
    selectedStudents = new StudentsVM();
    //vocabDataSource : any
    selectedStudent: StudentVM
    Add: boolean = true;
    Students: StudentsVM[] | any;
    dialogRefe: any
    dialogref: any
    
    @ViewChild('StudentForm', { static: true }) StudentForm!: NgForm;
    dialogData: any;
    value?: StudentsVM[];
    //selectedVocabulary: VocabularyVM
    students?: StudentVM[]=[]
    public dialogRef?: MatDialogRef<ManageCityComponent>;
    City: CityVM[] | undefined;
    proccessing: boolean | undefined;
    isDialog: boolean= false;
  messagebox: boolean;
  messages: any;
   
  
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
      this.GetCity();
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
   
    GetCity() {
      this.lmsSvc.GetCity().subscribe({
        next: (res: CityVM[]) => {
          this.City = res;
         // this.dataSource = new MatTableDataSource(this.City);
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
    
    CheckStudentValidation() {
      if (this.selectedStudent.cityId == 0 || this.selectedStudent.cityId == undefined) 
        this.StudentForm.form.controls['cityId'].setErrors({ 'incorrect': true });
       
    }
    
   
  SaveStudent() {
   
    
     
    const controls = this.StudentForm.controls;
    if (this.StudentForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
    } else {
      this.CheckStudentValidation();
      if(!this.StudentForm.invalid){
        this.lmsSvc.SaveStudent(this.selectedStudent).subscribe({
          next: (value: any) => {
           this.catSvc.ErrorMsgBar("Added Successfully", 8000)
            this.Refresh();
          }
      })
    }
      else {
      this.proccessing = true
      if (this.Edit) {
         this.UpdateStudent();
      } else {
        this.lmsSvc.GetStudent().subscribe((data: any) => {
               
   
          if (data.succeeded == true) {
                  this.messagebox = false;
                  Swal.fire({
                    icon: 'success',
                    position: 'center',
                    text: 'Added Successfully',
                    background: "#FFFFFF",
                    confirmButtonColor: "#000000"
                    
                  })
                  this.ngOnInit();
                  this.Refresh();
                }
                else {
                  this.messagebox = true;
                  this.messages = data.errors
                  console.warn(data)
                } 
                window.scrollTo(0, 0);
            this.proccessing = false;
              
          }, (err: any) => {
            console.warn(err);
            this.catSvc.ErrorMsgBar("Error Occurred !", 6000);
            this.proccessing = false;
          });
      }}
    }
  }

  
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
    
    OpenCityDialog() {
      this.dialogRef = this.dialog.open(ManageCityComponent, {
        width: '1200px', height: '950px',
        disableClose: true, panelClass: 'calendar-form-dialog',
        data: { isDialogue: true, cityId: this.selectedStudent.cityId },
     
      })
      this.dialogRef.afterClosed()
        .subscribe((res: any) => {
          this.GetCity()
        }
        );
  }

 
  }
  
