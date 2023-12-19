import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { BranchschoolVM } from '../Models/BranchschoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-branchschool',
  templateUrl: './manage-branchschool.component.html',
  styleUrls: ['./manage-branchschool.component.css']
})



export class ManageBranchschoolComponent implements OnInit{
displayedColumns: string[] = ['name','address','contactPerson','cellNo','isActive','actions']
proccessing: boolean = false;
Edit: boolean = false;
Add: boolean = true;DisabledType: boolean = false;
dataSource: any
selectedBranchschool= new BranchschoolVM
@ViewChild('branchschoolForm', { static: true }) branchschoolForm: NgForm;
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
    this.selectedBranchschool = new BranchschoolVM();
  }
  ngOnInit(): void {
    this.GetBranchschool()
    this.Add = true;
    this.selectedBranchschool.isActive = true;
    this.isDialog = this.dialogData.isDialog;

  }
  GetBranchschool() {
    this.lmsSvc.GetBranchschool().subscribe({
      next: (res: BranchschoolVM[]) => {
        this.dataSource = new MatTableDataSource(res);
      },
      error: (e) => {
        // Handle errors if needed
        console.warn(e);
      }
    });
  }

  DeleteBranchschool(id: number) {
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
        this.lmsSvc.DeleteBranchschool(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Branch has been deleted.',
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

 
  SaveBranchschool() {
    // You should implement validation and other necessary logic here
    if (this.selectedBranchschool.name && this.selectedBranchschool.address && this.selectedBranchschool.contactPerson && this.selectedBranchschool.cellNo) {
      this.proccessing = true; // Set a flag to indicate that a save operation is in progress
  
      if (this.Edit) {
        this.UpdateBranchschool();
      } else {
        this.lmsSvc.SaveBranchschool(this.selectedBranchschool).subscribe({
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
  EditBranchschool(branchschool: BranchschoolVM) {
    this.Edit = true
    this.Add = false
    this.selectedBranchschool = branchschool
    this.selectedBranchschool.isActive = true;
  }
  GetBranchschoolForEdit(id: number) {
    this.selectedBranchschool = new BranchschoolVM();
    this.selectedBranchschool.id = id;
    console.warn(this.selectedBranchschool);
  
    this.lmsSvc.SearchBranchschool(this.selectedBranchschool).subscribe({
      next: (res: BranchschoolVM[]) => {
        // Assuming you expect only one result for editing
        if (res.length > 0) {
          this.selectedBranchschool = res[0];
          this.Edit = true;
          this.Add = false;
        } else {
          // You can display an error message or take other actions
          console.log('Branch not found for editing.');
        }
      },
      error: (e) => {
        // Handle errors if needed
        console.warn(e);
      }
    });
  }
  UpdateBranchschool() {
    // You should implement validation and other necessary logic here
    if (this.selectedBranchschool.name && this.selectedBranchschool.address && this.selectedBranchschool.contactPerson && this.selectedBranchschool.cellNo) {
      this.proccessing = true; // Set a flag to indicate that an update operation is in progress
  
      this.lmsSvc.UpdateBranchschool(this.selectedBranchschool).subscribe({
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
    this.selectedBranchschool = new BranchschoolVM();
  }

  

}
