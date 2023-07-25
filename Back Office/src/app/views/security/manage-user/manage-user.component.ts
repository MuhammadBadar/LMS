import { Component, OnInit } from '@angular/core';
import { UserVM } from '../models/user-vm';
import { SecurityService } from '../security.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { CreateUserDialogComponent } from './manage-user-dialog/create-user-dialog/create-user-dialog.component';
import Swal from 'sweetalert2';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

@Component({
  selector: 'app-manage-user',
  templateUrl: './manage-user.component.html',
  styleUrls: ['./manage-user.component.css']
})
export class ManageUserComponent implements OnInit {
  dataSource: any;
  // displayedColumns = ['firstName', 'userName', 'phoneNumber', 'email', 'fatherName', 'address', 'cnic', 'msCardNo', 'discountLimit',
  //   'action'];
  displayedColumns = [ 'userName', 'email', 'action'];
  users?: UserVM[];
  constructor(
    private securitySvc: SecurityService,
    private snack: MatSnackBar,
    private route: Router,
    public dialog: MatDialog) {
    this.securitySvc.selectedUser = new UserVM
  }
  ngOnInit(): void {
    this.securitySvc.getUserList().subscribe((res: UserVM[]) => {
      this.users = res;
      console.warn(res)
      this.dataSource = new MatTableDataSource(this.users);
    }
    );
  }
  EditUser(user: any) {
    this.route.navigate(['/security/userRegistration'], {
      queryParams: {
        name: user.userName
      }
    });
  }
  DeleteUser(id: any) {
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
        this.securitySvc.DeleteUser(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'User has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.snack.open('Error Occured!', 'OK', { duration: 4000 })
          }
        })
      }
    })
  }
}
