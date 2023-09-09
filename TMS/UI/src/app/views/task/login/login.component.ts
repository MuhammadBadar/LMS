import { Component, Injectable, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { CreateUserDialogComponent } from 'app/views/security/manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';
import { LoginVM } from 'app/views/security/models/LoginVM';
import { UserVM } from 'app/views/security/models/user-vm';
import { SecurityService } from 'app/views/security/security.service';
import Swal from 'sweetalert2';
@Injectable({
  providedIn: 'root'
})
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  user: UserVM
  info = new LoginVM;
  hide = true;
  helper = new JwtHelperService();
  private dialogRef: MatDialogRef<CreateUserDialogComponent>;
  constructor(
    public dialog: MatDialog,
    public secSrvc: SecurityService,
    private route: Router,
  ) {
    this.secSrvc.login = new LoginVM;
  }
  ngOnInit(): void {
  }
  Login() {
    this.secSrvc.Login(this.secSrvc.login).subscribe((data: any) => {
      console.warn(data.succeeded)
      console.warn(data?.result?.succeeded)
      debugger
      if (data?.result?.succeeded == true) {
        Swal.fire({
          position: 'center',
          title: 'Wellcome ' + this.secSrvc.login.userName,
          background: "#FFFFFF",
          confirmButtonColor: "#000000"
        })
        localStorage.setItem("TMStoken", data.token)
        this.route.navigate(['/task/taskslist'], { queryParams: { data: "TMS" } });
        localStorage.setItem("TMSUserName", this.secSrvc.login.userName)
      }
      else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Please ReCheck  User Name Or Password ',
          confirmButtonColor: "#000000"
        })
      }
    },
      (err: any) => {
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
      });
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreateUserDialogComponent, {
      panelClass: 'calendar-form-dialog',
      width: '650px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }

}
