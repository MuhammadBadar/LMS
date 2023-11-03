import { Component,Injector,OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { UserTaskVM } from '../Models/UserTaskVM';
import { TaskVM } from '../Models/TaskVM';
import { CatalogService } from '../../catalog/catalog.service';
import { LMSService } from '../lms.service';
import { MatTableDataSource } from '@angular/material/table';
import { SecurityService } from '../../security/security.service';
@Component({
  selector: 'app-manage-usertask',
  templateUrl: './manage-usertask.component.html',
  styleUrls: ['./manage_usertask.component.css']
})
export class ManageUsertaskComponent implements  OnInit {
  displayedColumns: string[] = ['Task Title', 'sP','Priority','Assign'];
 
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: MatTableDataSource<TaskVM>;

  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  userTasks: UserTaskVM[]=[];
  userTask: UserTaskVM;
  selectedusertask: UserTaskVM;
  task: TaskVM[];
  pat: TaskVM[]=[];
  IsChecked: boolean;


  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private secSvc: SecurityService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedusertask = new UserTaskVM;
    this.IsChecked = false;


 
}
ngOnInit(): void {    
  this.AddMode = true;
  debugger;
 // this.GetTask();
  const userId = '0a714c07-6881-4740-8bcb-5a6bfd833eda';
  this.GetTaskByUserId(userId);
  // this.Savetask();
  // this.Searchtask();    
     }
     GetTaskByUserId(userId: string) {
      debugger;
      this.lmsSvc.GetTaskByUserId(userId).subscribe({
        next: (value: TaskVM[]) => {
          debugger;
          this.pat = value;
          this.dataSource = new MatTableDataSource(this.pat);
        },
        error: (err) => {
          alert('Error to retrieve tasks');
          // Handle error as needed
        }
      });
    }

     GetTask() {
      debugger;
      this.lmsSvc.GetTask().subscribe({
        next: (value: TaskVM[]) => {
          debugger;
          this.pat = value
          this.dataSource = new MatTableDataSource(this.pat)
        }, error: (err) => {
          alert('Error to retrieve Patient');
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
  }
     Searchtask() {
      alert('id')
      var usr = new TaskVM();
      usr.user = this.selectedusertask.user;
      console.warn(usr);
      this.lmsSvc.SearchTask(usr).subscribe({
        next: (value: TaskVM[]) => {
          this.task= value
          this.dataSource = new MatTableDataSource(this.task)
       
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
       console.warn(err) ;
      },
      })
      
    }
    toggleRow(row, $event) {
      if ($event.checked) {
        this.userTask = new UserTaskVM();
        this.userTask.taskId = row.id;
        this.userTask.userId = this.lmsSvc.userId;
        this.userTask.date = new Date();
        this.userTask.sp = row.sp; // Assign the sp value from the row
        this.userTasks.push(this.userTask);
      } else {
        const index = this.userTasks.findIndex(task => task.taskId === row.id);
        if (index !== -1) {
          this.userTasks.splice(index, 1);
        }
      }
    }
    
  //   SaveAssignTask() {
  //     debugger;

  //     // Check if the selectedusertask has been assigned (isChecked is true)
  //     if (this.selectedusertask.isChecked==true) {
  //       this.lmsSvc.SaveUsertask(this.selectedusertask).subscribe({
  //         next: (value) => {
  //           this.catSvc.SuccessMsgBar('Successfully Added', 5000);
  //         },
  //         error: (err) => {
  //           console.error('Error saving user task:', err);
  //           this.catSvc.ErrorMsgBar('Error Occurred', 5000);
  //         }
  //       });
  //     } else {
  //       // Show an error message or handle the case where the user hasn't checked the checkbox.
  //       console.error('User task not assigned. Please check the checkbox.');
  //       // You can show an error message to the user here if needed.
  //     }
  //   }
  // }
  Savetask() {
    debugger;
    this.lmsSvc.SaveUsertasks(this.userTasks).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000)
        // this.Refresh();
      }, 
    })
  }
  Refresh() {
    // this.Savetask();
    this.userTask = new UserTaskVM
    this.EditMode = false
    this.AddMode = true
  }
}