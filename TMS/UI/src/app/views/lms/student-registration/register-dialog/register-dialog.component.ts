import { Component, OnInit } from '@angular/core';
import { LMSService } from '../../lms.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { StudentRegistrationVM } from '../../models/studentregistrationVM';
import { ActivatedRoute } from '@angular/router';
import { UserVM } from 'app/views/security/models/user-vm';
import { SecurityService } from 'app/views/security/security.service';
@Component({
  selector: 'app-register-dialog',
  templateUrl: './register-dialog.component.html',
  styleUrls: ['./register-dialog.component.css']
})
export class RegisterDialogComponent implements OnInit {
  messagebox: boolean = false;
  message;
  Add: boolean = true;
  Edit: boolean = false;
  stdId: number;
  durationInSeconds = 3;
  hide = true;
  regstd: StudentRegistrationVM[];
  dialogTitle: string;
  constructor(
    private route: ActivatedRoute,
    private snack: MatSnackBar,
    public securityService: SecurityService,
    public lmsService: LMSService,
  ) {
    this.securityService.selectedUser = new UserVM;
    this.lmsService.selectedRegisterStudent = new StudentRegistrationVM;
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.stdId = params.id;
    });
    if (this.stdId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetStudentById();
    }
  }
  PutStudent() {
    this.lmsService.selectedRegisterStudent = this.regstd[0]
    this.lmsService.UpdateStudent(this.lmsService.selectedRegisterStudent).subscribe((data) => {
      this.snack.open('Student Updated Successfully!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  GetStudentById() {
    this.lmsService.selectedRegisterStudent.id = this.stdId
    this.lmsService.SearchStudent(this.lmsService.selectedRegisterStudent).subscribe((res: StudentRegistrationVM[]) => {
      this.regstd = res;
      this.lmsService.selectedRegisterStudent = this.regstd[0]
    });
  }
  SaveStudentRegistration() {
    this.securityService.selectedUser.phoneNumber = this.lmsService.selectedRegisterStudent.cellNo;
    this.securityService.selectedUser.email = this.lmsService.selectedRegisterStudent.email;
    this.securityService.selectedUser.userName = this.lmsService.selectedRegisterStudent.userName;
    this.securityService.selectedUser.passwordHash = this.lmsService.selectedRegisterStudent.password
    this.securityService.SaveUser(this.securityService.selectedUser).subscribe((data: any) => {
      if (data.succeeded == true) {
        this.messagebox = false;
        if (this.stdId > 0) {
          this.PutStudent();
        } else {
          this.lmsService.SaveStudentRegistration(this.lmsService.selectedRegisterStudent).subscribe((data) => {
            this.snack.open('Student Registered SuccessFully!', 'OK', { duration: 4000 })
          },
            (err: any) => {
              alert('Error')

            });
        }
      }
      else {
        this.messagebox = true;
        this.message = data.errors
        console.warn(data)
      }
    },
      (err: any) => {
        this.snack.open('Error Occurred!', 'OK', { duration: 4000 })
      });
  }
}

