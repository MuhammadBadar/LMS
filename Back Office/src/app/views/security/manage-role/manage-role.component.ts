import { Component, OnInit, ViewChild } from '@angular/core';
import { RoleVM } from '../models/role-vm';
import { SecurityService } from '../security.service';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CatalogService } from '../../catalog/catalog.service';
@Component({
  selector: 'app-manage-role',
  templateUrl: './manage-role.component.html',
  styleUrls: ['./manage-role.component.css']
})
export class ManageRoleComponent implements OnInit {
  messagebox: boolean = false;
  message: any;
  Edit: boolean = false;
  Add: boolean = true;
  roles: RoleVM[] = [];
  role: RoleVM = new RoleVM;
  RoleId?: string;
  dataSource: any;
  displayedColumns = ['role', 'action'];
  @ViewChild('roleForm', { static: true }) roleForm?: NgForm;

  constructor(
    public securitySvc: SecurityService,
    private snack: MatSnackBar,
    private catSvc: CatalogService,
  ) {
    this.securitySvc.selectedRole = new RoleVM;
  }
  ngOnInit(): void {
    // this.securitySvc.selectedRole = new RoleVM;
    // this.securitySvc.getRolesList().subscribe((res: RoleVM[]) => {
    //   this.roles = res;
    //   this.dataSource = new MatTableDataSource(this.roles);
    // });
    this.GetRole();
  }
  GetRole() {
    var role = new RoleVM
    role.isActive = true;
    this.securitySvc.getRolesList().subscribe({
      next: (res: RoleVM[]) => {
        this.roles = res;
        console.warn(res)
        this.dataSource = new MatTableDataSource(this.roles);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  SaveRole() {
    debugger
    if (this.RoleId != null) {
      this.PutRole();
    } else {
      this.securitySvc.SaveRole(this.securitySvc.selectedRole).subscribe({
        next: (data: any) => {
          if (data.succeeded == true) {
            Swal.fire({
              icon: 'success',
              position: 'center',
              title: this.securitySvc.selectedRole?.name,
              text: 'Successfully added into the Roles ',
              background: "#FFFFFF",
              confirmButtonColor: "#000000"
            })
            this.ngOnInit();
            this.roleForm?.reset();
          }
          else {
            const list = document.createElement('ui');
            const listItems = document.createElement('li');
            data.errors.forEach((element: any) => {

              list.innerHTML = element.description;
              list.appendChild(listItems);
            });
            Swal.fire({
              icon: 'info',
              position: 'center',
              title: list,
              background: "#FFFFFF",
              confirmButtonColor: "#000000"
            })
          }
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
  GetRoleById() {
    debugger
    this.securitySvc.selectedRole.id = this.RoleId
    this.securitySvc.SearchRole(this.securitySvc.selectedRole).subscribe({
      next: (res: RoleVM) => {
        if (res)
          this.role = res;
        this.securitySvc.selectedRole = this.role
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  PutRole() {
    this.securitySvc.UpdateRole(this.securitySvc.selectedRole).subscribe({
      next: (data: any) => {
        if (data.succeeded == true) {
          Swal.fire({
            icon: 'success',
            position: 'center',
            text: 'Role Successfully Updated',
            background: "#FFFFFF",
            confirmButtonColor: "#000000"
          })
          this.Edit = false;
          this.Add = true;
          this.ngOnInit();
        }
        else {
          const list = document.createElement('ui');
          const listItems = document.createElement('li');
          data.errors.forEach((element: any) => {
            list.innerHTML = element.description;
            list.appendChild(listItems);
          });
          Swal.fire({
            icon: 'info',
            position: 'center',
            title: list,
            background: "#FFFFFF",
            confirmButtonColor: "#000000"
          })
        }
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
  EditRole(role: RoleVM) {
    this.Add = false;
    this.Edit = true;
    this.RoleId = role.id;
    this.GetRoleById();
  }
  Refresh() {
    this.securitySvc.selectedRole = new RoleVM;
    this.Add = true;
    this.Edit = false;
  }
  DeleteRole(id: String) {
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
        this.securitySvc.DeleteRole(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Role has been deleted.',
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
