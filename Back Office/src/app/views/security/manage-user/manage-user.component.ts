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

    // this.route.queryParams.subscribe(params => {
    //   this.userName = params['name'];
    // });
    // if (this.userName != null) {
    //   this.Edit = true;
    //   this.Add = false;
    //   this.GetUserByName();
    // }

    this.securitySvc.getUserList().subscribe((res: UserVM[]) => {
      this.users = res;
      console.warn(res)
      this.dataSource = new MatTableDataSource(this.users);
    }
    );
  }
  EditUser(user: UserVM) {
    // this.routee.navigate(['/security/userRegistration'], {
    //   queryParams: {
    //     name: user.userName
    //   }
    // });

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
  //   this.securitySvc.SaveUser(this.selectedUser).subscribe({
  //     next: (res: any) => {
  //       var list = res
  //       if (this.Edit)
  //         list = list.filter((x: UserVM) => x != this.selectedUser)
  //       var find = list.find((x: UserVM) => x.email == this.selectedUser.email)
  //       if (find == undefined) {
  
  //         this.proccessing = true
  //         if (!this.userForm.invalid) {
  //           if (this.Edit)
  //             this.securitySvc.UpdateUser
  //           else {
  //             this.securitySvc.SaveUser(this.selectedUser).subscribe({
  //               next: (res) => {
  //                 this.catSvc.SuccessMsgBar("User Successfully Added!", 5000)
  //                 this.Add = true;
  //                 this.Edit = false;
  //                 this.proccessing = false
  //                 this.ngOnInit();
  //               }, error: (e) => {
  //                 this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //                 console.warn(e);
  //                 this.proccessing = false
  //               }
  //             })
  //           }
  //         } else {
  //           this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  //           this.proccessing = false
  //         }
  //       } 
  //       else
  //         this.catSvc.ErrorMsgBar("This Name Address Already Taken ", 5000)
  //     }, error: (e) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //       console.warn(e);
  //     }
  //   })
  // }
    debugger;
    console.warn(this.selectedUser)
    if (this.Edit)
      this.PutUser();

    else {
      this.securitySvc.SaveUser(this.selectedUser).subscribe((data: any) => {
        if (data.succeeded == true) {
          this.messagebox = false;
          Swal.fire({
            icon: 'success',
            position: 'center',
            text: 'User Registered Successfully',
            background: "#FFFFFF",
            confirmButtonColor: "#000000"
            
          })
          this.Refresh();
          this.dialogRef.close();
          this.userForm?.reset();
        }
        else {
          this.messagebox = true;
          this.messages = data.errors
          console.warn(data)
        }
      },
        (err: any) => {
          console.warn(err)
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
              text: 'Please fill all required fields!',
            })
          }

        });
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
  
    // this.securitySvc.UpdateUser(this.selectedUser).subscribe({
    //   next: (value: any) => {
    //     if (value.succeeded == true) { // Use 'value' instead of 'data'
    //       this.messagebox = false;
    //       Swal.fire({
    //         icon: 'success',
    //         position: 'center',
    //         text: 'User Successfully Updated',
    //         background: "#FFFFFF",
    //         confirmButtonColor: "#000000"
    //       });
    //     }
    //   },
    //   error: (err) => { // Handle error separately
    //     this.messagebox = true;
    //     this.messages = err.errors;
    //     console.warn(err);
    //   }
    // });
  // }
  // this.securitySvc.UpdateUser(this.securitySvc.selectedUser).subscribe({
  //   next: (data: any) => {
  //     if (data.succeeded == true) {
  //       this.messagebox = false;
  //       Swal.fire({
  //         icon: 'success',
  //         position: 'center',
  //         text: 'User Successfully Updated',
  //         background: "#FFFFFF",
  //         confirmButtonColor: "#000000"
  //       })
  //     }
  //     else {
  //       this.messagebox = true;
  //       this.messages = data.errors
  //       console.warn(data)
  //     }
  //   }, error: (err) => {
  //     if (err.status == 0) {
  //       Swal.fire({
  //         icon: 'error',
  //         title: 'Oops...',
  //         text: 'Something went wrong!',
  //         footer: 'Please check your Internet Connection'
  //       })
  //     }
  //     else {
  //       Swal.fire({
  //         icon: 'error',
  //         title: 'Oops...',
  //         text: 'Something went wrong!',
  //       })
  //     }
  //   }
  // })

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
