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
  displayedColumns: string[] = ['userName','Task Title', 'sP','Priority','Assign'];
 
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource:any
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
  this.GetTask();
  // this.Savetask();
  // this.Searchtask();    
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
    toggleRow(row,$event){
      debugger;
      //alert(row);
      // //alert(this.IsChecked);
      // alert('TaskId: ' + row.id);
      // alert($event.checked);
      if($event.checked)
      {
        this.userTask = new UserTaskVM();
        this.userTask.taskId = row.id;
        this.userTask.userId= this.lmsSvc.userId; // "eab689a0-9053-4202-b1ed-8b3ee39b40a2";
       // this.userTask.userId = "1101"; // get Logged In User Id 

        
        this.userTasks.push(this.userTask);
debugger;
      }
      else
      {
        //channelArray.includes('three'))
        this.userTasks.forEach( (task) => {
          //if(task.id == row.id)
          //this.userTasks.pop(row)
             
      });
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

    
