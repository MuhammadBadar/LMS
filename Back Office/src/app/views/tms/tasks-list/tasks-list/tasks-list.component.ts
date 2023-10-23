import { Component } from '@angular/core';
import { OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { stringify } from 'querystring';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2'
import { Router } from '@angular/router';
import { SearchComponent } from '../Comments-List/search/search.component';
import { CommentsListComponent } from '../Comments-List/comments-list.component';
import { TaskVM } from '../../models/task-vm';
import { TMSService } from '../../tms.service';
@Component({
  selector: 'app-tasks-list',
  templateUrl: './tasks-list.component.html',
  styleUrls: ['./tasks-list.component.css']
})
export class TasksListComponent  implements OnInit {
  length: number;
  freeSearch: string;
  deleteItem: boolean = false;
  public items: any[];
  private dialogref: MatDialogRef<SearchComponent>;
  private dialogRef: MatDialogRef<CommentsListComponent>;
  tasks: TaskVM[];
  searchtask: TaskVM;
  dataSource;
  displayedColumns = ['id', 'title', 'user', 'priority', 'status', 'sp', 'description', 'actions'];
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    public taskSvc: TMSService,
    public dialog: MatDialog) {
    this.taskSvc.selectedTask = new TaskVM;
  }
  ngOnInit(): void {
    this.GetTask();
  }
  Search() {
    if (this.taskSvc.selectedTask.freeSearch.length < 1) {
      this.ngOnInit()
    }
    this.taskSvc.SearchTask(this.taskSvc.selectedTask).subscribe((res: TaskVM[]) => {
      this.tasks = res;
      this.dataSource = new MatTableDataSource(this.tasks);
      this.length = this.dataSource.filteredData.length;
    })
  }
  // updateFilter(event) {
  //   const val = event.target.value.toLowerCase();
  //   var columns = Object.keys(this.tasks[0]);
  //   // Removes last "$$index" from "column"
  //   columns.splice(columns.length - 1);

  //   // console.log(columns);
  //   if (!columns.length)
  //     return;
  //   const rows = this.tasks.filter(function (d) {
  //     for (let i = 0; i <= columns.length; i++) {
  //       let column = columns[i];
  //       // console.log(d[column]);
  //       if (d[column] && d[column].toString().toLowerCase().indexOf(val) > -1) {
  //         return true;
  //       }
  //     }
  //   });
  //   this.dataSource = new MatTableDataSource(rows);
  //   this.length = this.dataSource.filteredData.length;
  // }
  updateFilter(event) {
    const val = event.target.value.toLowerCase();
    var columns = Object.keys(this.tasks[0]);
    // Removes last "$$index" from "column"
    columns.splice(columns.length - 1);
  
    // console.log(columns);
    if (!columns.length)
      return;
    const rows = this.tasks.filter(function (d) {
      for (let i = 0; i <= columns.length; i++) {
        let column = columns[i];
        // console.log(d[column]);
        if (d[column] && d[column].toString().toLowerCase().indexOf(val) > -1) {
          return true;
        }
      }
      return false; // Add this line
    });
    this.dataSource = new MatTableDataSource(rows);
    this.length = this.dataSource.filteredData.length;
  }
  
  Event() {
    this.dialogref = this.dialog.open(SearchComponent, {
      width: '800px'
    });
    this.dialogref.afterClosed()
      .subscribe((res) => {
        if (res) {
          console.warn(res)
          this.searchtask = res.data;
          this.taskSvc.SearchTask(this.searchtask).subscribe((res: TaskVM[]) => {
            this.tasks = res;
            this.length = this.tasks.length;
            this.dataSource = this.tasks;
          })
        }
      });
  }
  public viewComments() {
    this.dialogRef = this.dialog.open(CommentsListComponent, {
      width: '800px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
  GetTask() {
    debugger;
    this.taskSvc.getTasksList().subscribe((res: TaskVM[]) => {
      this.tasks = res;
      this.dataSource = new MatTableDataSource(this.tasks);
      this.length = this.dataSource.filteredData.length;
    });
  }
  DeleteTask(id) {
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
        this.taskSvc.deleteTasks(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Task has been deleted.',
            'success'
          )
          this.GetTask();
        })
      }
    })
  }
  EditTask(task: TaskVM) {
    this.route.navigate(['/tms/managetask'], { queryParams: { id: task.id } });
  }

}
