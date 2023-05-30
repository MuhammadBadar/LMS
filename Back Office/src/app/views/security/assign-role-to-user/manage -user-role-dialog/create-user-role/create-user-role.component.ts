
import { RoleVM } from './../../../models/role-vm';
import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { UserRoleVM } from '../../../models/user-role-vm';
import { UserVM } from '../../../models/user-vm';
import { SecurityService } from '../../../security.service';
@Component({
  selector: 'app-create-user-role',
  templateUrl: './create-user-role.component.html',
  styleUrls: ['./create-user-role.component.css']
})
export class CreateUserRoleComponent implements OnInit {
  Role: string[] = [];
  Action: any;
  msg: boolean = false;
  dataSource: any;
  displayedColumns: any;
  del: boolean = false;
  Add: boolean = true;
  uRoleId?: string;
  urole?: UserRoleVM;
  user?: UserVM[];
  role?: RoleVM[];
  dialogTitle: string;
  action?: string;
  constructor(
    public securityService: SecurityService,
    public dialogRef: MatDialogRef<CreateUserRoleComponent>,
    private fb: FormBuilder,
    private snack: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any,
  ) {
    this.dialogTitle = 'Assign Roles to User';
    this.securityService.selectedUserRole = new UserRoleVM;
  }
  ngOnInit(): void {
    debugger
    this.securityService.getRolesList().subscribe((res: RoleVM[]) => {
      this.role = res;
    });
    this.securityService.getUserList().subscribe((res: UserVM[]) => {
      this.user = res;
    });
    if (this.data != null) {
      this.uRoleId = this.data.uRoleId;
      this.Action = this.data.action
      if (this.Action == "Delete") {
        this.securityService.selectedUserRole.userId = this.uRoleId
        this.Add = false;
        this.del = true;
        this.GetUserRoleById();
      }
    }
  }
  Search() {
    this.GetUserRoleById();
  }
  Delete(uRole: any) {
    debugger;
    this.Role.push(uRole)
    this.securityService.selectedUserRole.role = this.Role
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
        this.securityService.deleteuRole(this.securityService.selectedUserRole).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Role has been deleted.',
              'success'
            )
            this.GetUserRoleById();
          }, error: (e) => {
            this.snack.open('Error Occured!', 'OK', { duration: 4000 })
          }
        })
      }
    })
  }
  SaveUserRoles() {
    if (this.uRoleId != null) {
      this.PutAssignRole();
    } else {
      this.securityService.SaveUserRoles(this.securityService.selectedUserRole).subscribe({
        next: (data: any) => {
          this.securityService.selectedUserRole = new UserRoleVM
          this.snack.open('Assigned Role to User Successfully!', 'OK', { duration: 4000 })
        }, error: (err) => {
          if (err.status == 0) {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Something went wrong!',
              footer: 'Please check your Internet Connection'
            })
          }
          else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Something went wrong!',
            })
          }
        }
      })
    }
  }
  GetUserRoleById() {
    this.securityService.SearchUserRole(this.securityService.selectedUserRole.userId).subscribe({
      next: (res: UserRoleVM) => {
        this.urole = res;
        this.dataSource = this.urole.role
        if (this.Action == "Delete") {
          if (this.urole.role?.length != 0) {
            this.displayedColumns = ['role', 'action'];
          }
          else {
            this.msg = true
          }
        }
        this.securityService.selectedUserRole = this.urole
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  PutAssignRole() {
    this.securityService.UpdateUserRole(this.securityService.selectedUserRole).subscribe({
      next: (data: any) => {
        this.snack.open(' Successfully Updated!', 'OK', { duration: 4000 })
      }, error: (err) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
}
