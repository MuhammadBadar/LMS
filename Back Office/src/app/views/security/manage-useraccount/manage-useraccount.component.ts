import { Component, ViewChild } from '@angular/core';
import { UserAccountVM } from '../../lms/Models/UserAccountVM';
import { CatalogService } from '../../catalog/catalog.service';
import { LMSService } from '../../lms/lms.service';
import { NgForm } from '@angular/forms';
import { SecurityService } from '../security.service';
import Swal from 'sweetalert2';
import { MatSnackBar } from '@angular/material/snack-bar';




@Component({
  selector: 'app-manage-useraccount',
  templateUrl: './manage-useraccount.component.html',
  styleUrls: ['./manage-useraccount.component.css']
})
export class ManageUseraccountComponent {

  formData: any = {};

  Add: boolean = true;
  Edit: boolean = false;
  AddMode: boolean = true
  EditMode: boolean = false

  messagebox: boolean = false;
  messages: any;
  hide = true;
  proccessing: boolean | undefined;

  hidePassword: boolean = true;

  selectedUserAccount: UserAccountVM



  
  // userName: string = '';  
  durationInSeconds = 3;  
  dialogRef: any;
  



  @ViewChild('useraccountForm', { static: true }) useraccountForm?: NgForm;
  constructor(
    private lmsSvc: LMSService,
    public securitySvc: SecurityService,
    private snack: MatSnackBar,
    private catSvc: CatalogService)
  {}
    
  ngOnInit(): void {
    // this.securitySvc.getUserList().subscribe((res: UserVM[]) => {
    //   this.users = res;
    //   console.warn(res)
    //   this.dataSource = new MatTableDataSource(this.users);
    // }
    // );
  //  this.GetUser();
  
  this.selectedUserAccount = {
    userName: '', // Initialize other properties as needed
    email: '',
    // ...
  };
  this.selectedUserAccount.isActive = true;
  }
  
  // SaveUserAccount() {
  //   if (!this.selectedUserAccount.userName || !this.selectedUserAccount.email || !this.selectedUserAccount.password || !this.selectedUserAccount.password) {
  //     this.catSvc.ErrorMsgBar("Please fill in all required fields.", 5000);
  //     return; // Exit the function if any required field is empty
  //   }
  
  //   this.lmsSvc.SaveUserAccount(this.selectedUserAccount).subscribe({
  //     next: (value) => {
  //       this.catSvc.SuccessMsgBar("Successfully Added", 5000);
  //       this.Refresh();
  //       this.selectedUserAccount.isActive = true;
  //     }, 
  //     error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000);
  //     },
  //   });
  // }
  SaveUserAccount() {
    const controls = this.useraccountForm.controls;
    if (this.useraccountForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
    } else {
      if (this.selectedUserAccount.email == null && this.selectedUserAccount.email == undefined) {
        this.catSvc.ErrorMsgBar("Please enter  an email", 8000)
      } else {
      this.proccessing = true
      if (this.Edit) {
         this.PutUser();
      } else {
        this.securitySvc.SaveUserAccount(this.selectedUserAccount).subscribe((data: any) => {
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
    this.selectedUserAccount = new UserAccountVM
    this.EditMode = false
    this.AddMode = true
  }

  EditUser(user: UserAccountVM) {
    

    this.EditMode = true
    this.AddMode = false
    this.selectedUserAccount = user
    this.selectedUserAccount.isActive = true;
}

  PutUser() {
 
    this.securitySvc.UpdateUserAccount(this.selectedUserAccount).subscribe({
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




