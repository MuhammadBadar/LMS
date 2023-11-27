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
  displayedColumns: string[] = ['Task Title', 'sP', 'Priority', 'Assign'];

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
    const storedUserTasks = localStorage.getItem('userTasks');
    if (storedUserTasks) {
      this.userTasks = JSON.parse(storedUserTasks);
      this.dataSource.data.forEach(task => {
        if (this.userTasks.some(selectedTask => selectedTask.taskId === task.id)) {
          task.ischecked = true;
          this.totalSP += task.sp;
        }
      });
    }
    this.AddMode = true;
    if (this.dialogData && this.dialogData.data) {
      this.responseData = this.dialogData.data;
      localStorage.setItem('userId', this.responseData.id);
    }
    const userId = localStorage.getItem('userId');
    this.GetTaskByUserId(userId);
  }

  toggleRow(row, $event) {
    if ($event.checked) {
      this.userTask = new UserTaskVM();
      this.userTask.taskId = row.id;
      this.userTask.userId = this.lmsSvc.userId;
      this.userTask.date = new Date();
      this.userTask.sp = row.sp;
      this.userTask.isChecked = true;
      this.userTasks.push(this.userTask);
      this.totalSP += row.sp;
    } else {
      const index = this.userTasks.findIndex(task => task.taskId === row.id);
      if (index !== -1) {
        this.userTasks.splice(index, 1);
        this.totalSP -= row.sp;
      }
    }
    this.disableSubmitButton = this.totalSP < 4;
  }

  GetTaskByUserId(userId: string) {
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
