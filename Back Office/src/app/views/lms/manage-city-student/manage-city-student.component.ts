import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ManageCityComponent } from '../manage-city/manage-city.component';
import { StudentVM } from '../Models/StudentVM';
import { CityVM } from '../Models/CityVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { CityStudentsTypeVM } from '../../items/Models/CityStudentsTypeVM';
import { CityStudentsVM } from '../../items/Models/CityStudentsVM';
import { CityStudentVM } from '../Models/CityStudentVM';
import { NgForm } from '@angular/forms';

import { Observable } from 'rxjs';
import { ManageStudentComponent } from '../manage-student/manage-student.component';
@Component({
  selector: 'app-manage-city-student',
  templateUrl: './manage-city-student.component.html',
  styleUrls: ['./manage-city-student.component.css']
})
export class ManageCityStudentComponent {
 
  displayedColumns: string[] = [`city`,`student`,'isActive', 'actions'];
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: any
  typeKeyCode: string = "";
  settingName: string = "";
  Edit: boolean = false;
  selectedOption: string | undefined;
  DisabledType: boolean = false;
  type: CityStudentsTypeVM = new CityStudentsTypeVM;
  studentsType?: CityStudentsTypeVM[];
  selectedCityStudents = new CityStudentsVM();
  ctystdDataSource : any
   selectedcityStudent: CityStudentVM | undefined
  Add: boolean = true;
  CityStudents: CityStudentsVM[] | any;
  citystudent?: CityStudentVM[]
  value?: CityStudentsVM[];
  dialogRefe: any
  dialogref: any
  isDialog : boolean = false;
  dialogData: any;
  lineAddMode: boolean = false
  lineEditMode: boolean = true
  selectedCityStudent: CityStudentVM 
  citystudents?: CityStudentVM[]=[]
  public Refstudent?: MatDialogRef<ManageStudentComponent>;
  public dialogRef?: MatDialogRef<ManageCityComponent>;
  City: CityVM[] | undefined;
  students: StudentVM[] | undefined;
  isDialogOpen = false;
  @ViewChild('CityStudentForm', { static: true }) CityStudentForm!: NgForm;
  proccessing: any;
  selectedClassTiming: any;
  ClassTimings: any;
  selectedSchedule: any;
  //vocab: VocabularyVM[]=[]
  constructor(
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,
   ) {
    this.selectedCityStudent = new CityStudentVM
    //this.selectedVocabulary = new VocabularyVM
  }
  ngOnInit(): void {
    this.GetCityStudent();
    this.GetCity();
    this.GetStudent();
       this.selectedCityStudent.isActive = true;
  }
  GetCity() {
    var city = new CityVM
    city.isActive= true;
    this.lmsSvc.SearchCity(city).subscribe({
      next: (res: CityVM[]) => {
        this.City = res;
      //  this.dataSource = new MatTableDataSource(this.City);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  OpenCityDialog() {
   // this.isDialogOpen = true;
    this.dialogRef = this.dialog.open(ManageCityComponent, {
      width: '1200px',
      height: '950px',
      data: { isDialogue: true, cityId: this.selectedCityStudent.cityId },
      disableClose: false // Enable the close button for the dialog
    });
  
    this.dialogRef.afterClosed().subscribe((res: any) => {
      this.GetCity();
     // this.isDialogOpen = false;
    });
  }
  

  GetCityStudent() {
    var ctyStudent = new CityStudentVM
    ctyStudent.isActive= true;
    this.lmsSvc.GetCityStudent().subscribe({
      next: (value: CityStudentVM[]) => {
        this.CityStudents = value
        console.warn(this.CityStudents)
        this.dataSource = new MatTableDataSource(this.CityStudents)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  CheckCityStudentValidation() {
    if (this.selectedCityStudent.cityId === 0 || this.selectedCityStudent.cityId === undefined) {
      this.CityStudentForm.form.controls['cityId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  
  CheckCityStudentsValidation() {
    if (this.selectedCityStudent.studentId === 0 || this.selectedCityStudent.studentId === undefined) {
      this.CityStudentForm.form.controls['studentId'].setErrors({ 'incorrect': true });
      return false;
    }
    return true;
  }
  
  SaveCityStudent() {
    const cityIsValid = this.CheckCityStudentValidation();
    const studentIsValid = this.CheckCityStudentsValidation();
  
    if (!cityIsValid && !studentIsValid) {
      this.catSvc.ErrorMsgBar("Please fill all required fields", 5000);
    } else if (!cityIsValid) {
      this.catSvc.ErrorMsgBar("City is a required field", 5000);
    } else if (!studentIsValid) {
      this.catSvc.ErrorMsgBar("Student is a required field", 5000);
    }
  
    if (cityIsValid && studentIsValid && !this.CityStudentForm.invalid) {
      this.lmsSvc.SaveCityStudent(this.selectedCityStudent).subscribe({
        next: (value) => {
          this.catSvc.SuccessMsgBar("Successfully Added", 5000);
          this.Refresh();
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
        },
      });
    }
  }
  
  
  EditCityStudent(student: CityStudentVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedCityStudent = student
  }
  UpdateCityStudent() {
    this.lmsSvc.UpdateCityStudent(this.selectedCityStudent).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Refresh() {
    this.GetCityStudent();
    this.selectedCityStudent = new CityStudentVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteCityStudent(id: number) {
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
        this.lmsSvc.DeleteCityStudent(id).subscribe({
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
    
    var student = new StudentVM
    student.isActive= true;
    this.lmsSvc.SearchStudent(student).subscribe({
      next: (value: StudentVM[]) => {
        this.students = value
       // this.dataSource = new MatTableDataSource(this.students)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
 
OpenStudentDialog() {
  this.Refstudent = this.dialog.open(ManageStudentComponent, {
    width: '1200px', height: '950px',
    data: {
      cityId: this.selectedCityStudent.cityId,
      isDialogue: true,
      studentId: this.selectedCityStudent.studentId
    }
  })
  
  this.Refstudent.afterClosed()
    .subscribe((res: any) => {
      this.GetStudent()
    }
    );
}
  
  Search(){
    var  student = new StudentVM();
    student.cityId = this.selectedCityStudent.cityId;
    this.lmsSvc.SearchStudent(student).subscribe({
     next: (value: StudentVM[]) => {
       this.students = value
     }, error: (err) => {
       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     },
   })
     var  ctystd = new CityStudentVM();
     ctystd.cityId = this.selectedCityStudent.cityId;
     this.lmsSvc.SearchCityStudent(ctystd).subscribe({
      next: (value: CityStudentVM[]) => {
        this.citystudent = value
        this.dataSource = new MatTableDataSource(this.citystudent)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
         }
  
 
   }
// function AddClassTimingtoList() {
//   throw new Error('Function not implemented.');
// }

