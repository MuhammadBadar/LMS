

import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef, MatDialog } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup, NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
//import { NgxSpinnerService } from 'ngx-spinner';
import { finalize } from 'rxjs/operators'
import Swal from 'sweetalert2';
import { SecurityService } from '../../../security.service';
import { UserVM } from '../../../models/user-vm';

@Component({
  selector: 'app-create-user-dialog',
  templateUrl: './create-user-dialog.component.html',
  styleUrls: ['./create-user-dialog.component.css']
})
export class CreateUserDialogComponent implements OnInit {
  
  @ViewChild('userForm', { static: true }) userForm?: NgForm;
  messagebox: boolean = false;
  messages: any;
  success?: boolean;
  error: string = '';
  submitted: boolean = false;
  user: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  userName: string = '';
  durationInSeconds = 3;
  hide = true;
  url = "https://localhost:7100/api/Users";
  users?: UserVM[];
  getbyIduser?: UserVM;
  dialogTitle: string;
  action?: string;
  dialogRef: any;
  constructor(
    private formBuilder: FormBuilder,
    private httpClient: HttpClient,
    private snack: MatSnackBar,
    public securityService: SecurityService,
    private route: ActivatedRoute,
  ) {
    this.dialogTitle = 'Add User';
    this.securityService.selectedUser = new UserVM();
  }
  ngOnInit() {

    this.route.queryParams.subscribe(params => {
      this.userName = params['name'];
    });
    if (this.userName != null) {
      this.Edit = true;
      this.Add = false;
      this.GetUserByName();
    }
  }
  // SaveUser() {
  //   this.securityService.selectedUser.userName = this.securityService.selectedUser.userPassword
  //   this.securityService.selectedUser.passwordHash = this.securityService.selectedUser.userPassword
  //   console.warn(this.securityService.selectedUser)
  //   if (this.userName != null) {
  //     this.PutUser();
  //   } else {
  //     this.securityService.SaveUser(this.securityService.selectedUser).subscribe({
  //       next: (data: any) => {
  //         if (data.succeeded == true) {
  //           this.messagebox = false;
  //           Swal.fire({
  //             icon: 'success',
  //             position: 'center',
  //             text: 'User Registered Successfully',
  //             background: "#FFFFFF",
  //             confirmButtonColor: "#000000"
  //           })
  //           this.userForm?.reset();
  //         }
  //         else {
  //           this.messagebox = true;
  //           this.message = data.errors
  //           console.warn(data)
  //         }
  //       }, error: (err) => {
  //         if (err.status == 0) {
  //           Swal.fire({
  //             icon: 'error',
  //             title: 'Oops...',
  //             text: 'Something went wrong!',
  //             footer: 'Please check your Internet Connection'
  //           })
  //         }
  //         else {
  //           Swal.fire({
  //             icon: 'error',
  //             title: 'Oops...',
  //             text: 'Something went wrong!',
  //           })
  //         }
  //       }
  //     })
  //   }
  // }
  SaveUser() {
    //this.spinner.show();
    debugger;
    console.warn(this.securityService.selectedUser)
   // if(this.securityService.selectedUser.directSupervisorId==undefined){
    //this.securityService.selectedUser.directSupervisorId=this.securityService.selectedUser.id}
    if (this.userName != null) {
          this.PutUser();
        } else {
    this.securityService.SaveUser(this.securityService.selectedUser).subscribe((data:any) => {
     // console.warn(data)
      if(data.succeeded==true){
        this.messagebox=false;
        Swal.fire({
          icon:'success',
          position:  'center' ,
         text:'User Registered Successfully',
          background: "#FFFFFF",
          confirmButtonColor: "#000000"          
        })
        this.dialogRef.close();
      this.userForm?.reset();}
      else{
        this.messagebox=true;
        this.messages=data.errors
        console.warn(data)
      }
    },
      (err: any) => {
        console.warn(err)
       if(err.status==0){
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Something went wrong!',
          footer: 'Please check your Internet Connection'
        })}
        else{
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
          })} 
  
      });
     }
  }
  GetUserByName() {
    this.securityService.selectedUser.userName = this.userName
    this.securityService.SearchUserByName(this.securityService.selectedUser).subscribe({
      next: (res: UserVM) => {
        this.getbyIduser = res;
        this.securityService.selectedUser = this.getbyIduser
      }, error: (e) => {
      console.warn(e)
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  PutUser() {
    this.securityService.UpdateUser(this.securityService.selectedUser).subscribe({
      next: (data: any) => {
        if (data.succeeded == true) {
          this.messagebox = false;
          Swal.fire({
            icon: 'success',
            position: 'center',
            text: 'User Successfully Updated',
            background: "#FFFFFF",
            confirmButtonColor: "#000000"
          })
        }
        else {
          this.messagebox = true;
          this.messages = data.errors
          console.warn(data)
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
