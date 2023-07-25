import { LMSService } from './../lms.service';
import { CourseVM } from './../Models/CourseVM';
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';


@Component({
  selector: 'app-manage-course',
  templateUrl: './manage-course.component.html',
  styleUrls: ['./manage-course.component.css']
})
export class ManageCourseComponent implements OnInit {
  isActive?:false
  imageName: any
  hide :  any;
  previewImage = false;
  currentLightBoxImage: any
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Course: CourseVM[] | undefined;
  selectedCourse: CourseVM;
  @ViewChild('CourseForm', { static: true }) CourseForm!: NgForm;
  displayedColumns: string[] = ['title', 'shortDes', 'logo', 'fee', 'isActive', 'actions'];
  dataSource: any;
  isDialog: boolean = false;
  dialogData: any;
  dialogref: any;
  constructor(
    private injector: Injector,
    public accSvc: LMSService,
    private catSvc: CatalogService,
    private dialog: MatDialog ,


  ) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    
    this.selectedCourse = new CourseVM();
  }



  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedCourse = new CourseVM
    
    // this.isDialog=true
    this.GetCourse()
    this.isDialog=true
    this.selectedCourse.isActive = true;

    if (this.dialogData ) {
      this.isDialog =this.dialogData.isDialog;
      console.warn(this.dialogData.courseId)}   
   
  
       
  
  }
  GetCourse() {
    this.accSvc.GetCourse().subscribe({
      next: (res: CourseVM[]) => {
        this.Course = res;
        this.dataSource = new MatTableDataSource(this.Course);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteCourse(id: number) {
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
        this.accSvc.DeleteCourse(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Course has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetCourseForEdit(id: number) {
    this.selectedCourse = new CourseVM;
    this.selectedCourse.id = id
    console.warn(this.selectedCourse);
    this.accSvc.SearchCourse(this.selectedCourse).subscribe({
      next: (res: CourseVM[]) => {
        this.Course = res;
        this.selectedCourse = this.Course[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveCourse() {
  
    // this.checkDropDownVailidation()
    const controls = this.CourseForm.controls;
    if (this.CourseForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
    } else {
      if (this.selectedCourse.logoBase64Path == null && this.selectedCourse.logoBase64Path == undefined) {
        this.catSvc.ErrorMsgBar("Please Browse an image to continue", 8000)
      } else {
      this.proccessing = true
      if (this.Edit) {
         this.UpdateCourse();
      } else {
        this.accSvc.SaveCourse(this.selectedCourse).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Successfully Added !", 6000)
            this.ngOnInit();
            this.Refresh();
            window.scrollTo(0, 0)
            this.proccessing = false
          }, error: (e) => {
            console.warn(e)
            this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
            this.proccessing = false
          }
        })
      }}
    }
  }
  UpdateCourse() {
    if (this.selectedCourse.logoBase64Path == null && this.selectedCourse.logoBase64Path == undefined) {
      this.catSvc.ErrorMsgBar("Please Browse an image to continue", 8000)
    } else {
      this.proccessing = true
      if (!this.CourseForm.invalid) {
        this.accSvc.UpdateCourse(this.selectedCourse).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
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
      else {
        this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
        this.proccessing = false
      }
    }
  }
  Refresh() {
    this.Add = true;
    this.Edit = false;
  }
  handleFileInput(e: any) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);

      reader.onload = (event: any) => {
        this.imageName = e.target.files[index].size.toString()
        this.selectedCourse.logoBase64Path = event.target.result
      };
    }
  }
  onPreviewImage(): void {
    this.previewImage = true
    this.currentLightBoxImage = this.selectedCourse.logoBase64Path
  }
  onClosePreview() {
    this.previewImage = false
  }
  validateNo(e : any): boolean {
    const charCode = e.which ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
    }
    return true
  }

}