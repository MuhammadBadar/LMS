import { StudentRegistrationVM } from './../models/studentregistrationVM';
import { DataSource } from '@angular/cdk/table';
import { StudentLecturesComponent } from './../student-lectures/student-lectures.component';
import { Component, OnInit } from '@angular/core';
import { LMSService } from '../lms.service';
import { StudentLectureVM } from '../models/assignlectureVM';
import { MatTableDataSource } from '@angular/material/table';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AppConfirmService } from 'app/shared/services/app-confirm/app-confirm.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { SecurityService } from 'app/views/security/security.service';
import { UserVM } from 'app/views/security/models/user-vm';
import { LoginVM } from 'app/views/security/models/LoginVM';


@Injectable({
  providedIn: 'root'
})
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  dataSource;
  displayedColumns = ['student', 'title', 'lecture', 'description', 'assignedOn'];
  hide = true;
  stdlec: StudentLectureVM[];
  student: StudentRegistrationVM[];
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    private confirmService: AppConfirmService,
    public lmssvc: LMSService,
    public secSrvc: SecurityService,
  ) {
    this.lmssvc.selectedStudentLecture = new StudentLectureVM;
    this.lmssvc.selectedRegisterStudent = new StudentRegistrationVM;
    this.secSrvc.login = new LoginVM;
  }
  ngOnInit(): void {
  }
  Login() {
    this.secSrvc.login.password = this.lmssvc.selectedStudentLecture.password;
    this.secSrvc.login.userName = this.lmssvc.selectedStudentLecture.userName;
    this.secSrvc.Login(this.secSrvc.login).subscribe((data: any) => {
      if (data?.result?.succeeded == true) {
        Swal.fire({
          position: 'center',
          title: 'Wellcome ' + this.secSrvc.login.userName,
          background: "#FFFFFF",
          confirmButtonColor: "#000000"
        })
        localStorage.setItem("LMStoken", data.token)
        localStorage.setItem("LMSUserName", this.secSrvc.login.userName)
        this.route.navigate(['/lms/studentlec'], {
          queryParams: {
            password: this.secSrvc.login.password,
            userName: this.secSrvc.login.userName
          }
        });
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
}
