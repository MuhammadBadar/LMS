import { Component, OnInit } from '@angular/core';
import { UserVM } from '../models/user-vm';
import { SecurityService } from '../security.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { CreateUserDialogComponent } from './manage-user-dialog/create-user-dialog/create-user-dialog.component';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-manage-user',
  templateUrl: './manage-user.component.html',
  styleUrls: ['./manage-user.component.css']
})
export class ManageUserComponent implements OnInit {
  dataSource;
  displayedColumns = [ 'userName','phoneNumber', 'email','action'];
  private dialogRef: MatDialogRef<CreateUserDialogComponent>;
  
  users: UserVM[];
  constructor(
    private securitySvc: SecurityService,
    public dialog: MatDialog) {
      dialog.afterAllClosed
      .subscribe(() => {
        this.ngOnInit()
      }
    );
    this.securitySvc.selectedUser= new UserVM
     }


  ngOnInit(): void {
    this.securitySvc.getUserList().subscribe((res: UserVM[]) => {
      this.users = res;
      console.warn(res)
      this.dataSource= new MatTableDataSource (this.users);     
    }
    );

  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreateUserDialogComponent, {
      panelClass: 'calendar-form-dialog',
      width: '650px'
     // background-color: 'purple'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
 
  EditUser(user){
    debugger
    console.warn(user)
    debugger
    let dialogRef = this.dialog.open(CreateUserDialogComponent, {disableClose:true, panelClass: 'calendar-form-dialog',  width: '650px' 
    , data: { userName:user.userName  }
    
         
   });
  }
  DeleteUser(id){
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
      this.securitySvc.DeleteUser(id).subscribe((data) => {
        Swal.fire(
          'Deleted!',
          'User has been deleted.',
          'success'
        )
        this.ngOnInit();
     })   
    }
  })  
}
}
