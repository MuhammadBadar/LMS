import { Component, Injector, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { UserTaskVM } from '../Models/UserTaskVM';
import { TaskVM } from '../Models/TaskVM';
import { CatalogService } from '../../catalog/catalog.service';
import { LMSService } from '../lms.service';
import { MatTableDataSource } from '@angular/material/table';
import { SecurityService } from '../../security/security.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-manage-usertask',
  templateUrl: './manage-usertask.component.html',
  styleUrls: ['./manage_usertask.component.css']
})
export class ManageUsertaskComponent implements OnInit {
  displayedColumns: string[] = ['Task Title', 'sP', 'Priority', 'ClaimPercent', 'RemainingSPs', 'Assign'];

  AddMode: boolean = true;
  EditMode: boolean = false;
  dataSource: MatTableDataSource<TaskVM>;

  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  userTasks: UserTaskVM[] = [];
  selectedItems: UserTaskVM[] = [];
  userTask: UserTaskVM;
  selectedusertask: UserTaskVM;
  task: TaskVM[];
  pat: TaskVM[] = [];
  IsChecked: boolean;
  responseData: any;
  totalSP: number = 0;
  dueSps: number = 0;
  disableSubmitButton: boolean = true;

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private secSvc: SecurityService,
    private catSvc: CatalogService,
    private route: Router,
    public dialog: MatDialog,
  ) {
    this.selectedusertask = new UserTaskVM();
    this.IsChecked = false;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }

  ngOnInit(): void {
    // debugger;
    const userId = '2d3e9d56-ce3a-45a2-a782-0b2476d48f98';
    this.GetDueSps(userId);
    // Retrieve user tasks from local storage
    const storedUserTasks = localStorage.getItem('userTasks');

    // Check if user tasks are present in local storage
    if (storedUserTasks) {
      debugger;
        // Parse user tasks from JSON format
        this.userTasks = JSON.parse(storedUserTasks);

        // Iterate through dataSource.data to update ischecked property based on userTasks
        this.dataSource.data.forEach(task => {
            if (this.userTasks.some(selectedTask => selectedTask.taskId === task.id)) {
                task.ischecked = true;
                // Update totalSP based on checked tasks
                this.totalSP += task.sp;
            }
        });
    }

    // Set AddMode to true
    this.AddMode = true;

    // Check if dialogData and dialogData.data exist
    if (this.dialogData && this.dialogData.data) {
        // Assign dialogData.data to responseData
        this.responseData = this.dialogData.data;

        // Check if responseData has an 'id' property before setting it in local storage
        if (this.responseData && this.responseData.id) {
            // Set user ID in local storage
            localStorage.setItem('userId', this.responseData.id);
        } else {
            console.error('User ID is missing in responseData');
        }
    }

    // Retrieve user ID from local storage
    //const userId =  localStorage.getItem('userId');

    // Check if userId is not null before calling GetTaskByUserId
    if (this.lmsSvc.userId !== null) {
        // Load tasks based on user ID
        debugger;
        this.GetTaskByUserId(this.lmsSvc.userId);
    } else {
        console.error('User ID is null');
    }
}


toggleRow(row, $event) {
  if ($event.checked) {
    debugger;
    this.userTask = new UserTaskVM();
    this.userTask.taskId = row.id;
    this.userTask.userId = this.lmsSvc.userId;
    this.userTask.date = new Date();
    this.userTask.sp = parseFloat(row.remainingSPs.toFixed(2)); // Round off to 2 decimal places
    this.userTask.isChecked = true;
    this.userTasks.push(this.userTask);
    this.totalSP = parseFloat(this.userTasks.reduce((total, task) => total + task.sp, 0).toFixed(2)); // Round off the total
  } else {
    const index = this.userTasks.findIndex(task => task.taskId === row.id);
    if (index !== -1) {
      this.userTasks.splice(index, 1);
      this.totalSP = parseFloat(this.userTasks.reduce((total, task) => total + task.sp, 0).toFixed(2)); // Round off the total
    }
  }
  this.disableSubmitButton = this.totalSP < this.dueSps;
}


  GetTaskByUserId(userId: string) {
    debugger;
    this.lmsSvc.GetTaskByUserId(userId).subscribe({
      next: (value: TaskVM[]) => {
        this.pat = value;
        this.dataSource = new MatTableDataSource(this.pat);
      },
      error: (err) => {
        alert('Error to retrieve tasks');
      }
    });
  }

  GetDueSps(userId: string) {
    debugger;
    this.lmsSvc.GetDueSps(userId).subscribe({
      next: (value: any) => {
        this.dueSps =value;
        // this.pat = value;
        // this.dataSource = new MatTableDataSource(this.pat);
      },
      error: (err) => {
        alert('Error to retrieve tasks');
      }
    });
  }

  Savetask() {
    const selectedTaskIds = this.userTasks.map(task => task.taskId);
    debugger;
    this.lmsSvc.SaveUsertasks(this.userTasks).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar('Successfully Added', 5000);
        if (this.dialogRefe) {
          this.route.navigate(['/catalog/manageSetting']);
          localStorage.setItem('Token', this.responseData.token);
          this.dialogRefe.close();
        }
        this.dataSource.data.forEach(task => {
          if (selectedTaskIds.includes(task.id)) {
            task.ischecked = true;
          }
        });
        this.userTasks = [];
        this.totalSP = 0;
        this.disableSubmitButton = true;
      },
      error: (err) => {
        console.error('Error saving user tasks:', err);
        this.catSvc.ErrorMsgBar('Error Occurred', 5000);
      }
    });
  }
}
