import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { SchoolVM } from '../Models/SchoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-school',
  templateUrl: './manage-school.component.html',
  styleUrls: ['./manage-school.component.css']
})
export class ManageSchoolComponent implements OnInit{
displayedColumns: string[] = ['name','address','contactPerson','cellNo','isActive','actions']
proccessing: boolean = false;
Edit: boolean = false;
Add: boolean = true;DisabledType: boolean = false;
dataSource: any
selectedSchool= new SchoolVM
@ViewChild('schoolForm', { static: true }) schoolForm: NgForm;
dialogref: any
  dialogData: any;
  isDialog: boolean = false;
  isActive?: false
  hide = true;
  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    private dialog: MatDialog) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedSchool = new SchoolVM();
  }
  ngOnInit(): void {
    this.GetSchool()
    this.Add = true;
    this.selectedSchool.isActive = true;
    this.isDialog = this.dialogData.isDialog;

  }
  GetSchool() {
    this.lmsSvc.GetSchool().subscribe({
      next: (res: SchoolVM[]) => {
        this.dataSource = new MatTableDataSource(res);
      },
      error: (e) => {
        // Handle errors if needed
        console.warn(e);
      }
    });
  }

  // Method to delete a school
  DeleteSchool(id: number) {
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
        this.lmsSvc.DeleteSchool(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'School has been deleted.',
              'success'
            );
            this.ngOnInit();
          },
          error: (e) => {
            // Handle errors if needed
            console.warn(e);
          }
        });
      }
    });
  }

 
  SaveSchool() {
    // You should implement validation and other necessary logic here
    if (this.selectedSchool.name && this.selectedSchool.address && this.selectedSchool.contactPerson && this.selectedSchool.cellNo) {
      this.proccessing = true; // Set a flag to indicate that a save operation is in progress
  
      if (this.Edit) {
        // If in Edit mode, update the school
        this.UpdateSchool();
      } else {
        // If in Add mode, save a new school
        this.lmsSvc.SaveSchool(this.selectedSchool).subscribe({
          next: (res) => {
            // Handle a successful save operation
            this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
            this.ngOnInit(); // Refresh the table
            this.Refresh(); // Reset the form
            window.scrollTo(0, 0);
            this.proccessing = false; // Reset the processing flag
          },
          error: (e) => {
            // Handle errors if the save operation fails
            console.warn(e);
            this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
            this.proccessing = false; // Reset the processing flag
          }
        });
      }
    } else {
      // Handle validation errors or display an error message for missing fields
      this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
    }
  }
  EditSchool(school: SchoolVM) {
    this.Edit = true
    this.Add = false
    this.selectedSchool = school
    this.selectedSchool.isActive = true;
  }
  GetSchoolForEdit(id: number) {
    // Create a new instance of SchoolVM to clear any existing data
    this.selectedSchool = new SchoolVM();
    this.selectedSchool.id = id;
    console.warn(this.selectedSchool);
  
    // Fetch the school data for editing
    this.lmsSvc.SearchSchool(this.selectedSchool).subscribe({
      next: (res: SchoolVM[]) => {
        // Assuming you expect only one result for editing
        if (res.length > 0) {
          this.selectedSchool = res[0];
          this.Edit = true;
          this.Add = false;
        } else {
          // Handle the case where no school with the specified ID was found
          // You can display an error message or take other actions
          console.log('School not found for editing.');
        }
      },
      error: (e) => {
        // Handle errors if needed
        console.warn(e);
      }
    });
  }
  UpdateSchool() {
    // You should implement validation and other necessary logic here
    if (this.selectedSchool.name && this.selectedSchool.address && this.selectedSchool.contactPerson && this.selectedSchool.cellNo) {
      this.proccessing = true; // Set a flag to indicate that an update operation is in progress
  
      this.lmsSvc.UpdateSchool(this.selectedSchool).subscribe({
        next: (res) => {
          // Handle a successful update operation
          this.catSvc.SuccessMsgBar("Successfully Updated!", 5000);
          this.Add = true; // Set to Add mode
          this.Edit = false; // Disable Edit mode
          this.proccessing = false; // Reset the processing flag
          this.ngOnInit(); // Refresh the table
        },
        error: (e) => {
          // Handle errors if the update operation fails
          console.warn(e);
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
          this.proccessing = false; // Reset the processing flag
        }
      });
    } else {
      // Handle validation errors or display an error message for missing fields
      this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
    }
  }
  Refresh() {
    this.Add = true;
    this.Edit = false;
    this.selectedSchool = new SchoolVM();
  }

  

}
