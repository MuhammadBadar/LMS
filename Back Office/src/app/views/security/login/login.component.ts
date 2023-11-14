import { SecurityService } from './../security.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LoginVM } from '../models/LoginVM';
import { ManageUsertaskComponent } from '../../lms/manage-usertask/manage-usertask.component';
import { LMSService } from '../../lms/lms.service';
import { TaskVM } from '../../lms/Models/TaskVM';
import { MatTableDataSource } from '@angular/material/table';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  info = new LoginVM;
  hide = true;
  login: LoginVM = new LoginVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  dialogRef: any;
  
  pat: TaskVM[]=[];
  dataSource: any;
  constructor(

    public secSvc: SecurityService,
    private lmsSvc: LMSService,
    public dialog: MatDialog,
    private route: Router,
  ) {

  }
  ngOnInit(): void {
    const userId = '0a714c07-6881-4740-8bcb-5a6bfd833eda';
  this.GetTaskByUserId(userId);
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
  OpenUserDialog() {
    this.dialogRef = this.dialog.open(ManageUsertaskComponent, {
       width: '1200px',
       height: '400px',
      });
   
     this.dialogRef.afterClosed().subscribe((res: any) => {
      // this.GetTaskByUserId;
      });
   }
  Login() {
    // this.login.userName = this.login.password;
    this.secSvc.Login(this.login).subscribe({
      next: (data: any) => {
        console.warn(data.succeeded)
        console.warn(data?.result?.succeeded)
        debugger
        if (data?.result?.succeeded == true) {
          this.OpenUserDialog();
          // Swal.fire({
          //   position: 'center',
          //   title: 'Wellcome to QamSoft Technologies ',
          //   background: "#FFFFFF",
          //   confirmButtonColor: "#000000",
          //   width: 600
          // })
          localStorage.setItem("Token", data.token)
          // this.route.navigate(['/catalog/manageSetting']);
        }
        else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please ReCheck  User Name Or Password ',
            confirmButtonColor: "#000000"
          })
        }
      }, error: (err) => {
        if (err.status == 400) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Invalid Request! ',
            footer: 'Please ReCheck  User Name Or Password',
            confirmButtonColor: "#000000"
          })
        }
        else if (err.status == 0) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong! ',
            footer: 'Please Check your Internet Connection',
            confirmButtonColor: "#000000"
          })
        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please ReCheck  User Name Or Password ',
            confirmButtonColor: "#000000"
          })
        }
      }
    })
  }
}
