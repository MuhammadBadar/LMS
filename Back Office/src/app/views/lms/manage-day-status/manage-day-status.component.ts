import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { UserTaskVM } from '../Models/UserTaskVM';
import { LMSService } from '../lms.service';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { EnumType } from '../../tms/models/EnumType';
import { TaskVM } from '../Models/TaskVM';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';

@Component({
  selector: 'app-manage-day-status',
  templateUrl: './manage-day-status.component.html',
  styleUrls: ['./manage-day-status.component.css'],
})
export class ManageDayStatusComponent implements OnInit {
  displayedColumns: string[] = [
    'taskTitle',
    'sP',
    'claim',
    'comments',
    'actions',
  ];

  AddMode: boolean = true;
  EditMode: boolean = false;
  selectedTask: UserTaskVM;
  hide = true;
  dataSource: any;
  pat: TaskVM[];
  clien: UserTaskVM[];
  Claim: SettingsVM[] = [];
  proccessing: boolean;
  Add: boolean;
  Edit: boolean;
  @ViewChild('UserTaskForm', { static: true }) UserTaskForm: NgForm;

  // dialogRefe: MatDialogRef<any, any>;
  dialogrefe: any;

  constructor(
    private injector: Injector,    
    public lmsSvc: LMSService,
    // private secSvc: SecurityService,
    private catSvc: CatalogService,
    private route: Router
  ) // public dialog: MatDialog,
  {
    this.selectedTask = new UserTaskVM();
    this.selectedTask.claimId = 0;
    // this.IsChecked = false;
    this.dialogrefe = this.injector.get(MatDialogRef, null);
  }

  ngOnInit(): void {
    const userId = '0a714c07-6881-4740-8bcb-5a6bfd833eda';
    this.GetUserTask();
    // this.GetUserTask();
    this.GetEnumValues(EnumType.Claim);
  }

  GetEnumValues(etype: EnumType) {
    var Settings = new SettingsVM();
    Settings.enumTypeId = etype;
    this.catSvc.SearchSettings(Settings).subscribe(
      (res: SettingsVM[]) => {
        this.Claim = res;

        //if (etype == EnumType.Claim)
        //this.Claim = res;

        // console.warn(this.Priority);
        // else if (etype == EnumType.Priority)
        // this.Priority = res;
        // console.warn(this.Priority);
      },
      (err: any) => {
        alert('Error');
      }
    );
  }

  EditUserTask(pat: UserTaskVM) {
    this.selectedTask.selectedTask = false;
    this.EditMode = true;
    this.AddMode = false;
    pat.selectedTask = true;
    this.selectedTask = pat;
    this.selectedTask.isActive = true;
  }
  UpdateUserTask() {
    debugger;
    // You should implement validation and other necessary logic here
    // if (this.selectedTask.title && this.selectedTask.sp && this.selectedTask.claimId && this.selectedTask.comments)
    if (this.selectedTask.claimId && this.selectedTask.comments) {
      this.proccessing = true; // Set a flag to indicate that an update operation is in progress
      console.warn(this.selectedTask);
      this.lmsSvc.UpdateUsertask(this.selectedTask).subscribe({
        next: (res) => {
          // Handle a successful update operation
          debugger;
          this.catSvc.SuccessMsgBar('Successfully Updated!', 5000);
          this.Add = true; // Set to Add mode
          this.Edit = false; // Disable Edit mode
          this.proccessing = false; // Reset the processing flag
          this.ngOnInit(); // Refresh the table
          this.Refresh();
        },
        error: (e) => {
          // Handle errors if the update operation fails
          console.warn(e);
          this.catSvc.ErrorMsgBar('Error Occurred', 5000);
          this.proccessing = false; // Reset the processing flag
        },
      });
    } else {
      // Handle validation errors or display an error message for missing fields
      this.catSvc.ErrorMsgBar('Please fill in all required fields!', 5000);
    }
  }

  GetUserTask() {
    this.lmsSvc.GetUsertask().subscribe({
      next: (value: UserTaskVM[]) => {
        // debugger;
        this.clien = value;
        this.dataSource = new MatTableDataSource(this.clien);
      },
      error: (err) => {
        alert('Error to retrieve Patient');
        this.catSvc.ErrorMsgBar('Error Occurred', 5000);
      },
    });
  }

  Refresh() {
    this.GetUserTask();
    this.selectedTask = new UserTaskVM();
    this.selectedTask.isActive = true;
    this.Add = true;
    this.Edit = false;
  }
  DeleteUserTask(id: number) {
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!',
    }).then((result) => {
      if (result.value) {
        this.lmsSvc.DeleteUsertask(id).subscribe({
          next: (data) => {
            Swal.fire('Deleted!', 'User Task has been deleted.', 'success');
            this.Refresh();
          },
          error: (e) => {
            this.catSvc.ErrorMsgBar('Error Occurred', 5000);
            console.warn(e);
          },
        });
      }
    });
  }
}
