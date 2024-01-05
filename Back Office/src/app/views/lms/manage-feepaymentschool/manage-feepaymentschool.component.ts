import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';
import { StudentschoolVM } from '../Models/StudentschoolVM';
import { ManageStudentschoolComponent } from '../manage-studentschool/manage-studentschool.component';
import { FeeLineVM, FeeVM } from '../Models/FeepaymentschoolVM';
import { AssignClassVM } from '../Models/AssignClassVM';
import { FeetypeschoolVM } from '../Models/FeetypeschoolVM';

@Component({
  selector: 'app-manage-feepaymentschool',
  templateUrl: './manage-feepaymentschool.component.html',
  styleUrls: ['./manage-feepaymentschool.component.css']
})
export class ManageFeepaymentschoolComponent implements OnInit {
  displayedColumns: string[] = ['amount','concession', 'isActive', 'actions'];
  processing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  DisabledType: boolean = false;
  dataSource: any;
  feetypes: string[];
  feepayment?: FeeVM[];
  studentschools?: StudentschoolVM[];
  titles: string[];
  feeTypeSchool: FeetypeschoolVM[]=[]
  feeLines: FeeLineVM[]=[ { feeAmount :0,   feetypeId: 5,concession:0,isActive:true },
    { feeAmount :0,   feetypeId: 6,concession:0,isActive:true }, { feeAmount :0,   feetypeId: 5,concession:0,isActive:true }];
  // feeLines: FeeLineVM[] = []

  selectedFee = new FeeVM();
  @ViewChild('feeForm', { static: true }) feeForm: NgForm;
  dialogref: any;
  dialogData: any;
  isDialog: boolean = false;
  isActive?: false;
  hide = true;

  assignClassVM: AssignClassVM;
  selectedFeeLine: FeeLineVM;

  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    private dialog: MatDialog
  ) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedFee = new FeeVM();
    this.selectedFeeLine = new FeeLineVM();
    this.selectedFeeLine = {
      feeAmount: 0,
      isActive: true
    };
  }

  ngOnInit(): void {
    this.GetFee();
    this.GetTitles();
    this.GetTitle();
    this.Add = true;
    this.GetStudentschool();

    this.selectedFee.isActive = true;
    this.isDialog = this.dialogData.isDialog;

    // define forloop and intialize array 
    //this.feeLines.push({ feeAmount :0,   feetypeId: 5,concession:"",isActive:true });

  }

  GetTitles() {
    // debugger;
    this.lmsSvc.GetFeetypeschoolTitles().subscribe({
      next: (res: string[]) => {
        this.titles = res;
      },
      error: (e) => {
        console.warn(e);
      }
    });
    // using forloop initialize array items
  }
  GetTitle() {
    debugger;
    this.lmsSvc.GetFeetypeschool().subscribe({
      next: (value: FeetypeschoolVM[]) => {
        debugger;
        this.feeTypeSchool = value
        this.dataSource = new MatTableDataSource(this.feeTypeSchool)
      }, error: (err) => {
        alert('Error to retrieve Titles');
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
}

  GetFee() {
    this.lmsSvc.GetFee().subscribe({
      next: (res: FeeVM[]) => {
        this.dataSource = new MatTableDataSource(res);
      },
      error: (e) => {
        console.warn(e);
      }
    });
  }

  SaveFee() {
    debugger;
    if (!this.selectedFee.amount || !this.selectedFee.concession) {
      this.catSvc.ErrorMsgBar("Please fill in all required fields.", 5000);
      return; // Exit the function if any required field is empty
    }
  
    this.selectedFee.feeLines = this.feeLines;
    this.lmsSvc.SaveFee(this.selectedFee).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000);
        this.ngOnInit();
        this.Refresh();
        window.scrollTo(0, 0);
      }, 
      error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      },
    });
  }
  

//   SaveFee() {
//     debugger;
//     if (  this.selectedFee) {
//       this.selectedFee.feeLines = this.feeLines;
//         this.processing = true; 
//         if (this.Edit) {
//             this.UpdateFee();
//         } else {
//             this.lmsSvc.SaveFee(this.selectedFee).subscribe({
//                 next: (res) => {
//                     this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
//                     this.ngOnInit();
//                     this.Refresh(); 
//                     window.scrollTo(0, 0);
//                     this.processing = false; 
//                 },
//                 error: (e) => {
//                     console.warn(e);
//                     this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
//                     this.processing = false; 
//                 }
//             });
//         }
//     } else {
//         this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
//     }
// }
  
  UpdateFee() {
    if (this.selectedFee.student) {
      this.processing = true;

      this.lmsSvc.UpdateFee(this.selectedFee).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar('Successfully Updated!', 5000);
          this.Add = true;
          this.Edit = false;
          this.processing = false;
          this.ngOnInit();
        },
        error: (e) => {
          console.warn(e);
          this.catSvc.ErrorMsgBar('Error Occurred', 5000);
          this.processing = false;
        }
      });
    } else {
      this.catSvc.ErrorMsgBar('Please fill in all required fields!', 5000);
    }
  }

  Refresh() {
    this.Add = true;
    this.Edit = false;
    this.selectedFee = new FeeVM();
  }


  EditFee(feepaymentschool: FeeVM) {
    this.Edit = true;
    this.Add = false;
    this.selectedFee = feepaymentschool;
    this.selectedFee.isActive = true;
  }
  DeleteFee(id: number) {
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
        this.lmsSvc.DeleteFee(id).subscribe({
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

  GetFeepaymentschoolForEdit(id: number) {
    this.selectedFee = new FeeVM();
    this.selectedFee.id = id;
    console.warn(this.selectedFee);
    this.lmsSvc.SearchFee(this.selectedFee).subscribe({
      next: (res: FeeVM[]) => {
        if (res.length > 0) {
          this.selectedFee = res[0];
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

  
  GetStudentschool() {
    var studentschool = new StudentschoolVM();
    studentschool.isActive = true;
    this.selectedFee.isActive = true;
    this.lmsSvc.SearchStudentschool(studentschool).subscribe({
      next: (res: StudentschoolVM[]) => {
        this.studentschools = res;
      },
      error: (err) => {
        this.catSvc.ErrorMsgBar('Error Occurred', 5000);
      }
    });
  }

  OpenStudentschoolDialog() {
    this.dialogref = this.dialog.open(ManageStudentschoolComponent, {
      width: '1200px',
      height: '950px',
      data: { isDialog: true }
    });
    this.dataSource = new MatTableDataSource(this.studentschools);
    this.dialogref.afterClosed().subscribe((res: any) => {
      this.GetStudentschool();
    });
  }

  // Search() {
  //   debugger;
  //   var feePayment = new FeeVM();
  //   feePayment.studentId = this.selectedFee.studentId;
  //   feePayment.feetypeschoolId = this.selectedFee.feetypeschoolId;
  //   this.lmsSvc.SearchFee(feePayment).subscribe({
  //     next: (value: FeeVM[]) => {
  //       this.feepayment = value;
  //       this.dataSource = new MatTableDataSource(this.feepayment);
  //     },
  //     error: (err) => {
  //       this.catSvc.ErrorMsgBar('Error Occurred', 5000);
  //     }
  //   });
  // }
}
