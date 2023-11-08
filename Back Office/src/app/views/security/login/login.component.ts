import { SecurityService } from './../security.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LoginVM } from '../models/LoginVM';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class  LoginComponent implements OnInit {

  info = new LoginVM;
  hide = true;
  login: LoginVM = new LoginVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  constructor(

    public secSvc: SecurityService,
    private route: Router,
  ) {

  }
  ngOnInit(): void {
  }
  Login() {
    // this.login.userName = this.login.password;
    this.secSvc.Login(this.login).subscribe({
      next: (data: any) => {
        console.warn(data.succeeded)
        console.warn(data?.result?.succeeded)
        debugger
        if (data?.result?.succeeded == true) {
          Swal.fire({
            position: 'center',
            title: 'Wellcome to QamSoft Technologies ',
            background: "#FFFFFF",
            confirmButtonColor: "#000000",
            width: 600
          })
          localStorage.setItem("QamSoft Technologies_Token", data.token)
          this.route.navigate(['/items/manageSetting'], { queryParams: { data: "QamSoft Technologies" } });
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
