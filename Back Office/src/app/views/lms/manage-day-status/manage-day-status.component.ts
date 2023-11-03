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

@Component({
  selector: 'app-manage-day-status',
  templateUrl: './manage-day-status.component.html',
  styleUrls: ['./manage-day-status.component.css']
})
export class ManageDayStatusComponent implements  OnInit{
  displayedColumns: string[] = ['taskTitle', 'sP','claim','comments','actions'];

  AddMode: boolean = true
  EditMode: boolean = false
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
  



  constructor(
    private injector: Injector,
    public lmsSvc: LMSService,
    // private secSvc: SecurityService,
    private catSvc: CatalogService,
    // public dialog: MatDialog,
    )
     {
    this.selectedTask = new UserTaskVM();
    this.selectedTask.claimId = 0;
    // this.IsChecked = false; 
}

ngOnInit(): void {    
  const userId = '0a714c07-6881-4740-8bcb-5a6bfd833eda';
  this.GetUserTask();
  // this.GetUserTask();
  this.GetEnumValues(EnumType.Claim);
     }


    //  GetTaskByUserId(userId: string) {
    //   debugger;
    //   this.lmsSvc.GetTaskByUserId(userId).subscribe({
    //     next: (value: TaskVM[]) => {
    //       debugger;
    //       this.pat = value;
    //       this.dataSource = new MatTableDataSource(this.pat);
    //     },
    //     error: (err) => {
    //       alert('Error to retrieve tasks');
    //       // Handle error as needed
    //     }
    //   });
    // }

     GetEnumValues(etype: EnumType) {
      var Settings = new SettingsVM;
      Settings.enumTypeId = etype;
      this.catSvc.SearchSettings(Settings).subscribe((res: SettingsVM[]) => {
        this.Claim = res;
        
        //if (etype == EnumType.Claim)
          //this.Claim = res;

           // console.warn(this.Priority);
        // else if (etype == EnumType.Priority)
          // this.Priority = res;
          // console.warn(this.Priority);
      },
        (err: any) => {
          alert('Error')
        });
    }


     SaveDayEnd() {
      if (this.selectedTask.title == null) {
        this.catSvc.ErrorMsgBar("Please Enter Title.", 5000);
        return;
      }
      
      if (this.selectedTask.sp == null || this.selectedTask.sp == undefined) {
        this.catSvc.ErrorMsgBar("Please Enter SP's.", 5000);
        return;
      }
      
      if(this.selectedTask.claimId == null || this.selectedTask.claimId == undefined)
      {  
        this.catSvc.ErrorMsgBar("Please select Percentage Completion.", 5000);
        return; // Exit the function if either user or schedule type is empty
      }
      if (this.selectedTask.comments == null) {
        this.catSvc.ErrorMsgBar("Please Enter Comments.", 5000);
        return;
      }
    
      this.lmsSvc.SaveUsertask(this.selectedTask).subscribe({
        next: (value) => {
          this.catSvc.SuccessMsgBar("Successfully Added", 5000);
          // this.Refresh();
        }, 
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
        },
      });
    }

    EditUserTask(pat: UserTaskVM) {
      this.EditMode = true
      this.AddMode = false
      this.selectedTask = pat
      this.selectedTask.isActive = true;
    }
    
    
  
    UpdateUserTask() {
      debugger;
      this.proccessing = true;
  
      if (this.UserTaskForm)
       {
        this.lmsSvc.UpdateUsertask(this.selectedTask).subscribe({
          next: (value) => {
            this.catSvc.SuccessMsgBar("Successfully Updated", 5000);
            this.Add = true;
            this.Edit = false;
            this.proccessing = false;
            this.ngOnInit();
          },
          error: (err) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000);
            console.warn(err);
            this.proccessing = false;
          }
        });
      } else {
        this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000);
        this.proccessing = false;
      }
    }

    GetUserTask() {
      this.lmsSvc.GetUsertask().subscribe({
        next: (value: UserTaskVM[]) => {
          // debugger;
          this.clien = value
          this.dataSource = new MatTableDataSource(this.clien)
        }, error: (err) => {
          alert('Error to retrieve Patient');
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
  }
    
    Refresh() {
      this.GetUserTask();
      this.selectedTask = new UserTaskVM
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
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.value) {
          this.lmsSvc.DeleteUsertask(id).subscribe({
            next: (data) => {
              Swal.fire(
                'Deleted!',
                'User Task has been deleted.',
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


     

}
