import { Component,Injector,OnInit } from '@angular/core';
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
export class ManageUsertaskComponent implements  OnInit {
  displayedColumns: string[] = ['Task Title', 'sP','Priority','Assign'];
 
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: MatTableDataSource<TaskVM>;

  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  userTasks: UserTaskVM[]=[];
  selectedItems: UserTaskVM[] = [];
  userTask: UserTaskVM;
  selectedusertask: UserTaskVM;
  task: TaskVM[];
  pat: TaskVM[]=[];
  IsChecked: boolean;
  responseData:any;


  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private secSvc: SecurityService,
    private catSvc: CatalogService,
    private route: Router,
    public dialog: MatDialog,) {
    this.selectedusertask = new UserTaskVM;
    this.IsChecked = false;
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);


 
}
ngOnInit(): void {    
  const storedUserTasks = localStorage.getItem('userTasks');
  if (storedUserTasks) {
    this.userTasks = JSON.parse(storedUserTasks);

    // Set isChecked property in the dataSource based on stored state
    this.dataSource.data.forEach(task => {
      if (this.userTasks.some(selectedTask => selectedTask.taskId === task.id)) {
        task.ischecked = true;
      }
    });
  }
  this.AddMode = true;
  // this.dialogData.data;
  console.warn(this.dialogData);
  if(this.dialogData){
  if(this.dialogData.data){
    this.responseData=this.dialogData.data;
    localStorage.setItem('userId',this.responseData.id)
  }
}
  debugger;
 // this.GetTask();

  const userId = localStorage.getItem('userId');
  this.GetTaskByUserId(userId);

  // const storedUserTasks = localStorage.getItem('userTasks');
  // if (storedUserTasks) {
  //   this.userTasks = JSON.parse(storedUserTasks);
  // }
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
        // If checked, create a new instance of UserTaskVM
        this.userTask = new UserTaskVM();
    
        // Set properties of the userTask object based on the row and other values
        this.userTask.taskId = row.id;
        this.userTask.userId = this.lmsSvc.userId;
        this.userTask.date = new Date();
        this.userTask.sp = row.sp; // Assign the sp value from the row
        this.userTask.isChecked = true; // Set isChecked to true
    
        // Add the userTask object to the userTasks array
        this.userTasks.push(this.userTask);
      } else {
        // If the event is not checked (false), find the index of the task with the specified taskId in userTasks array
        const index = this.userTasks.findIndex(task => task.taskId === row.id);
    
        // If the task is found (index is not -1), remove it from the userTasks array
        if (index !== -1) {
          this.userTasks.splice(index, 1);
        }
      }
    }
    
      
    Savetask() {
      const selectedTaskIds = this.userTasks.map(task => task.taskId);
      this.lmsSvc.SaveUsertasks(this.userTasks).subscribe({
        next: (value) => {
          this.catSvc.SuccessMsgBar("Successfully Added", 5000);
          if (this.dialogRefe) {
            this.route.navigate(['/catalog/manageSetting']);
            localStorage.setItem("Token", this.responseData.token);
            this.dialogRefe.close();
          }
    
          // Update the isChecked property in the dataSource
          this.dataSource.data.forEach(task => {
            if (selectedTaskIds.includes(task.id)) {
              task.ischecked = true;
            }
          });
    
          // Remove selected rows from the dataSource
          this.userTasks = []; // Clear the selected tasks array
        },
        error: (err) => {
          console.error('Error saving user tasks:', err);
          this.catSvc.ErrorMsgBar('Error Occurred', 5000);
        }
      });
    }
    

    
    
  
}