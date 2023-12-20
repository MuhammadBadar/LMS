import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { FeepaymentschoolVM } from '../Models/FeepaymentschoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';
import { StudentschoolVM } from '../Models/StudentschoolVM';
import { ManageStudentschoolComponent } from '../manage-studentschool/manage-studentschool.component';

import { ManageFeetypeschoolComponent } from '../manage-feetypeschool/manage-feetypeschool.component';
import { AssignClassVM } from '../Models/AssignClassVM';
@Component({
  selector: 'app-manage-feepaymentschool',
  templateUrl: './manage-feepaymentschool.component.html',
  styleUrls: ['./manage-feepaymentschool.component.css']
})
export class ManageFeepaymentschoolComponent implements OnInit{
  displayedColumns: string[] = ['student','contactNo','amount','isActive','actions']
  processing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
DisabledType: boolean = false;
  dataSource: any
  feetypes: string[];
  feepayment?: FeepaymentschoolVM[]
  studentschools?: StudentschoolVM[]
  titles: string[];
  
  selectedFeepaymentschool= new FeepaymentschoolVM
  @ViewChild('feepaymentschoolForm', { static: true }) feepaymentschoolForm: NgForm;
  dialogref: any
  dialogData: any;
    isDialog: boolean = false;
    isActive?: false
    hide = true;
    
  assignClassVM: AssignClassVM;
    constructor(
      private injector: Injector,
      private lmsSvc: LMSService,
      private catSvc: CatalogService,
      private dialog: MatDialog) {
      this.dialogref = this.injector.get(MatDialogRef, null);
      this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
      this.selectedFeepaymentschool = new FeepaymentschoolVM();
      this.selectedFeepaymentschool = {
        branch: '',
        class: '',
        section: '',
        contactNo: '',
        amount: 0,
        isActive: false
      };
    }
    ngOnInit(): void {
      this.GetFeepaymentschool()
      this.GetTitles(); 
      this.Add = true;
      this.GetStudentschool();
      
      this.selectedFeepaymentschool.isActive = true;
      this.isDialog = this.dialogData.isDialog; 

    }
    
    GetTitles() {
      this.lmsSvc.GetFeetypeschoolTitles().subscribe({
        next: (res: string[]) => {
          this.titles = res;
        },
        error: (e) => {
          console.warn(e);
        }
      });
    }

    GetFeepaymentschool() {
      this.lmsSvc.GetFeepaymentschool().subscribe({
        next: (res: FeepaymentschoolVM[]) => {
          this.dataSource = new MatTableDataSource(res);},
        error: (e) => {
          console.warn(e);
        }
      });
    }
    

    DeleteFeepaymentschool(id: number) {
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
          this.lmsSvc.DeleteFeepaymentschool(id).subscribe({
            next: (data) => {
              Swal.fire(
                'Deleted!',
                'Feepayment has been deleted.',
                'success'
              );
              this.ngOnInit();
            },
            error: (e) => {
              console.warn(e);
            }
          });
        }
      });
    }
  
    SaveFeepaymentschool() {
      if (  this.selectedFeepaymentschool.contactNo) {
          this.processing = true; 
          if (this.Edit) {
              this.UpdateFeepaymentschool();
          } else {
              this.lmsSvc.SaveFeepaymentschool(this.selectedFeepaymentschool).subscribe({
                  next: (res) => {
                      this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
                      this.ngOnInit();
                      this.Refresh(); 
                      window.scrollTo(0, 0);
                      this.processing = false; 
                  },
                  error: (e) => {
                      console.warn(e);
                      this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
                      this.processing = false; 
                  }
              });
          }
      } else {
          this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
      }
  }
    
    EditFeepaymentschool(feepaymentschool: FeepaymentschoolVM) {
      this.Edit = true
      this.Add = false
      this.selectedFeepaymentschool = feepaymentschool
      this.selectedFeepaymentschool.isActive = true;

    }
    GetFeepaymentschoolForEdit(id: number) {
      this.selectedFeepaymentschool = new FeepaymentschoolVM();
      this.selectedFeepaymentschool.id = id;
      console.warn(this.selectedFeepaymentschool);  
      this.lmsSvc.SearchFeepaymentschool(this.selectedFeepaymentschool).subscribe({
        next: (res: FeepaymentschoolVM[]) => {
          if (res.length > 0) {
            this.selectedFeepaymentschool = res[0];
            this.Edit = true;
            this.Add = false;
          } else {
            console.log('Payment not found for editing.');
          }
        },
        error: (e) => {
          console.warn(e);
        }
      });
    }

    UpdateFeepaymentschool() {
      if (  this.selectedFeepaymentschool.contactNo  ) {
        this.processing = true; 

        this.lmsSvc.UpdateFeepaymentschool(this.selectedFeepaymentschool).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Successfully Updated!", 5000);
            this.Add = true;
            this.Edit = false; 
            this.processing = false;
            this.ngOnInit();
          },
          error: (e) => {
            console.warn(e);
            this.catSvc.ErrorMsgBar("Error Occurred", 5000);
            this.processing = false; 
          }
        });
      } else {
        this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
      }
    }
    Refresh() {
      this.Add = true;
      this.Edit = false;
      this.selectedFeepaymentschool = new FeepaymentschoolVM();
    }
    GetStudentschool() {
      var studentschool = new StudentschoolVM
      studentschool.isActive = true;
      this.selectedFeepaymentschool.isActive = true;
      this.lmsSvc.SearchStudentschool(studentschool).subscribe({
        next: (res: StudentschoolVM[]) => {
          this.studentschools = res
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    }
    OpenStudentschoolDialog() {
      this.dialogref = this.dialog.open(ManageStudentschoolComponent, {
        width: '1200px', height: '950px',
        data:{isDialog : true}
       })
        this.dataSource = new MatTableDataSource(this.studentschools)
      this.dialogref.afterClosed()
        .subscribe((res: any) => {
          this.GetStudentschool()
        }
        );
    }
    
    Search(){ debugger;
      var  feePayment = new FeepaymentschoolVM();
      feePayment.studentschoolId = this.selectedFeepaymentschool.studentschoolId;
      feePayment.feetypeschoolId = this.selectedFeepaymentschool.feetypeschoolId;
      this.lmsSvc.SearchFeepaymentschool(feePayment).subscribe({
       next: (value: FeepaymentschoolVM[]) => {
         this.feepayment = value
         this.dataSource = new MatTableDataSource(this.feepayment)
       }, error: (err) => {
         this.catSvc.ErrorMsgBar("Error Occurred", 5000)
       },
     }
     )}
   
  }
  