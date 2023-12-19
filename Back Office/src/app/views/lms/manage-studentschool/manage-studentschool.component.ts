import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { StudentschoolVM } from '../Models/StudentschoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-manage-studentschool',
  templateUrl: './manage-studentschool.component.html',
  styleUrls: ['./manage-studentschool.component.css']
})
export class ManageStudentschoolComponent implements OnInit {
  displayedColumns: string[] = ['name', 'gender', 'dateofbirth', 'admissionDate', 'isActive', 'actions'];
  processing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  DisabledType: boolean = false;
  dataSource: any;
  selectedStudentschool = new StudentschoolVM();
  @ViewChild('studentschoolForm', { static: true }) studentschoolForm: NgForm;
  dialogRef: any;
  dialogData: any;
  isDialog: boolean = false;
  isActive?: false
  hide = true;
  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    private dialog: MatDialog) {
    this.dialogRef = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedStudentschool = new StudentschoolVM();
  }
  ngOnInit(): void {
    this.GetStudentschool();
    this.Add = true;
    this.selectedStudentschool.isActive = true;
    this.isDialog = this.dialogData.isDialog; }
  GetStudentschool() {
    this.lmsSvc.GetStudentschool().subscribe({
      next: (res: StudentschoolVM[]) => {
        this.dataSource = new MatTableDataSource(res);},
      error: (e) => {
        console.warn(e);
      }
    });
  }

  DeleteStudentschool(id: number) {
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
        this.lmsSvc.DeleteStudentschool(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Student has been deleted.',
              'success'
            );
            this.ngOnInit();
          },
          error: (e) => {
            console.warn(e);
          }
        });
      }
    });
  }

  SaveStudentschool() {
    if (this.selectedStudentschool.name && this.selectedStudentschool.gender && this.selectedStudentschool.dateofbirth ) {
      this.processing = true;

      if (this.Edit) {
        this.UpdateStudentschool();
      } else {
        this.lmsSvc.SaveStudentschool(this.selectedStudentschool).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
            this.ngOnInit(); 
            this.Refresh();
            window.scrollTo(0, 0);
            this.processing = false;
          },
          error: (e) => {
            console.warn(e);
            this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
            this.processing = false;
          }
        });
      }
    } else {
      this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
    }
  }

  EditStudentschool(studentschool: StudentschoolVM) {
    this.Edit = true;
    this.Add = false;
    this.selectedStudentschool = studentschool;
    this.selectedStudentschool.isActive = true;
  }
  GetStudentschoolForEdit(id: number) {
    this.selectedStudentschool = new StudentschoolVM();
    this.selectedStudentschool.id = id
    console.warn(this.selectedStudentschool);  
    this.lmsSvc.SearchStudentschool(this.selectedStudentschool).subscribe({
      next: (res: StudentschoolVM[]) => {
        if (res.length > 0) {
          this.selectedStudentschool = res[0];
          this.Edit = true;
          this.Add = false;
        } else {
          console.log('Student not found for editing.');
        }
      },
      error: (e) => {
        console.warn(e);
      }
    });
  }

  UpdateStudentschool() {
    if (this.selectedStudentschool.name && this.selectedStudentschool.gender && this.selectedStudentschool.dateofbirth ) {
      this.processing = true;
      this.lmsSvc.UpdateStudentschool(this.selectedStudentschool).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar("Successfully Updated!", 5000);
          this.Add = true;
          this.Edit = false;
          this.processing = false;
          this.ngOnInit();
        },
        error: (e) => {
          console.warn(e);
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
          this.processing = false;
        }
      });
    } else {
      this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
    }
  }
  Refresh() {
    this.Add = true;
    this.Edit = false;
    this.GetStudentschool();
    this.selectedStudentschool = new StudentschoolVM();
  }
}
