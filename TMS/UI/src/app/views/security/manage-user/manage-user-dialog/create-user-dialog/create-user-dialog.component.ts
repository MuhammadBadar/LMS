import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef, MatDialog } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup, NgForm } from '@angular/forms';
import { CalendarEvent } from 'angular-calendar';
import { EgretCalendarEvent } from 'app/shared/models/event.model';
import { HttpClient } from '@angular/common/http';
import { SecurityService } from 'app/views/security/security.service';
import { Router } from '@angular/router';
import { UserVM } from 'app/views/security/models/user-vm';
import { MatSnackBar } from '@angular/material/snack-bar';
//import { NgxSpinnerService } from 'ngx-spinner';
import { finalize } from 'rxjs/operators'
import Swal from 'sweetalert2';

@Component({
  selector: 'app-create-user-dialog',
  templateUrl: './create-user-dialog.component.html',
  styleUrls: ['./create-user-dialog.component.css']
})
export class CreateUserDialogComponent implements OnInit {
  @ViewChild('userForm', { static: true }) userForm: NgForm;
  messagebox:boolean=false;
  message;
  success: boolean;
  error: string;
  submitted: boolean = false;
  user:boolean=false;
  Edit:boolean=false;
  Add:boolean=true;
  UserName:string=null;
  durationInSeconds = 3;
  hide = true;
  url = "https://localhost:7100/api/Users";
  users: UserVM[];
  getbyIduser :UserVM
  event: CalendarEvent;
  dialogTitle: string;
  action: string;
  constructor(
     //private spinner: NgxSpinnerService,
   public dialogRef: MatDialogRef<CreateUserDialogComponent>,
  
   @Inject(MAT_DIALOG_DATA) public data: any,
    private formBuilder: FormBuilder,
    private httpClient: HttpClient,
    private snack: MatSnackBar,
    public securityService: SecurityService,
    private router: Router
  ) {
   
    this.dialogTitle = 'Add User';
    this.event = new EgretCalendarEvent({
    });

    this.securityService.selectedUser = new UserVM();
  }
 
  ngOnInit() {

    this.securityService.getUserList().subscribe((res: UserVM[]) => {
      this.users = res;   
 
      });
    this.UserName = this.data?.userName;
  
    if (this.UserName !=null){
      this.Edit=true;
      this.Add=false;
      this.GetUserById(); 
    }
  }
  // SearchUser(){
  //   this.securityService.selectedUser.passwordHash=undefined;
  //   this.securityService.selectedUser.isActive=undefined;
  //   this.securityService.SearchUser(this.securityService.selectedUser).subscribe((res: UserVM[]) => {
  //     this.SUser = res;
  //     if( this.SUser.length>0){
  //     this.user= true
  //     }else{   this.user= false}
  //   });
 
  // }
  SaveUser() {
    //this.spinner.show();
    debugger;
    console.warn(this.securityService.selectedUser)
    if(this.securityService.selectedUser.directSupervisorId==undefined){
    this.securityService.selectedUser.directSupervisorId=this.securityService.selectedUser.id}
    if (this.UserName!=null){
      this.PutUser();
      }else{

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
      this.userForm.reset();}
      else{
        this.messagebox=true;
        this.message=data.errors
        console.warn(data)
      }
    },
      (err: any) => {
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
  GetUserById(){
    debugger
    this.securityService.selectedUser.userName=this.UserName
    this.securityService.SearchUserByName(this.securityService.selectedUser).subscribe((res: UserVM) => {
      this.getbyIduser = res;
      console.warn(res)
      console.warn(this.getbyIduser)
       this.securityService.selectedUser=this.getbyIduser
    });
   
  }
  PutUser(){
    
    // this.securityService.selectedUser=this.users[0]
   
     this.securityService.UpdateUser(this.securityService.selectedUser).subscribe((data:any) => {
      // console.warn(data)
       if(data.succeeded==true){
         this.messagebox=false;
      // this.snack.open('User Successfully Updated!', 'OK', { duration: 4000 })
      Swal.fire({
        icon:'success',
        position:  'center' ,
        text:'User Successfully Updated',
        background: "#FFFFFF",
        confirmButtonColor: "#000000"
     
    
      })
    }
       else{
         this.messagebox=true;
         this.message=data.errors
         console.warn(data)
       }
     },
     (err: any) => {
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
