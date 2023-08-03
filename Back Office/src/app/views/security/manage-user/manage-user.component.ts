import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { UserVM } from '../models/user-vm';
import { SecurityService } from '../security.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { CreateUserDialogComponent } from './manage-user-dialog/create-user-dialog/create-user-dialog.component';
import Swal from 'sweetalert2';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, NgForm } from '@angular/forms';
import { CatalogService } from '../../catalog/catalog.service';

@Component({
  selector: 'app-manage-user',
  templateUrl: './manage-user.component.html',
  styleUrls: ['./manage-user.component.css']
})
export class ManageUserComponent implements OnInit {
  dataSource: any;
  selectedUser: UserVM
  @ViewChild('userForm', { static: true }) userForm?: NgForm;
  // displayedColumns = ['firstName', 'userName', 'phoneNumber', 'email', 'fatherName', 'address', 'cnic', 'msCardNo', 'discountLimit',
  //   'action'];
  displayedColumns = ['userName', 'email', 'action'];
  // 'isAActive',
  users?: UserVM[];

  proccessing: boolean | undefined;
  getbyIduser?: UserVM;
  userName: string = '';
  AddMode: boolean = true
  EditMode: boolean = false
  Add: boolean = true;
  Edit: boolean = false;
  durationInSeconds = 3;
  hide = true;
  messagebox: boolean = false;
  dialogRef: any;
  messages: any;
  dialogData: any;
  dialogRefe: MatDialogRef<any, any> | null;
  constructor(
    private formBuilder: FormBuilder,
    public securitySvc: SecurityService,
    private snack: MatSnackBar,
    private route: ActivatedRoute,
    private injector: Injector,
    private catSvc: CatalogService,
    private routee: Router,
    public dialog: MatDialog) {
    this.selectedUser = new UserVM
   
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    // this.securitySvc.getUserList().subscribe((res: UserVM[]) => {
    //   this.users = res;
    //   console.warn(res)
    //   this.dataSource = new MatTableDataSource(this.users);
    // }
    // );
   this.GetUser();
  }
  GetUser() {
    var user = new UserVM
    user.isActive = true;
    this.securitySvc.getUserList().subscribe({
      next: (res: UserVM[]) => {
        this.users = res;
        console.warn(res)
        this.dataSource = new MatTableDataSource(this.users);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditUser(user: UserVM) {
    

      this.EditMode = true
      this.AddMode = false
      this.selectedUser = user
  }
  GetUserByName() {
    this.selectedUser.userName = this.userName
    this.securitySvc.SearchUserByName(this.selectedUser).subscribe({
      next: (res: UserVM) => {
        this.getbyIduser = res;
        this.selectedUser = this.getbyIduser
      }, error: (e) => {
        console.warn(e)
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }


  SaveUser() {
    const controls = this.userForm.controls;
    if (this.userForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
    } else {
      if (this.selectedUser.email == null && this.selectedUser.email == undefined) {
        this.catSvc.ErrorMsgBar("Please enter  an email", 8000)
      } else {
      this.proccessing = true
      if (this.Edit) {
         this.PutUser();
      } else {
        this.securitySvc.SaveUser(this.selectedUser).subscribe((data: any) => {
                if (data.succeeded == true) {
                  this.messagebox = false;
                  Swal.fire({
                    icon: 'success',
                    position: 'center',
                    text: 'Added Successfully',
                    background: "#FFFFFF",
                    confirmButtonColor: "#000000"
                    
                  })
                  this.ngOnInit();
                  this.Refresh();
                }
                else {
                  this.messagebox = true;
                  this.messages = data.errors
                  console.warn(data)
                } 
                window.scrollTo(0, 0);
            this.proccessing = false;
              
          }, (err: any) => {
            console.warn(err);
            this.catSvc.ErrorMsgBar("Error Occurred !", 6000);
            this.proccessing = false;
          });
      }}
    }
  }

  
  Refresh() {
    this.ngOnInit();
    this.selectedUser = new UserVM
    this.EditMode = false
    this.AddMode = true
  }
  PutUser() {
 
  this.securitySvc.UpdateUser(this.selectedUser).subscribe({
        next: (value: any) => {
      this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    },
  })
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
