import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CatalogService } from '../../catalog/catalog.service';
import { ScheduleFHVM } from '../Models/ScheduleFHVM';
import { UserVM } from '../Models/UserVM';
import { ManageUserComponent } from '../manage-user/manage-user.component';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-schedule-fh',
  templateUrl: './manage-schedule-fh.component.html',
  styleUrls: ['./manage-schedule-fh.component.scss']
})
export class ManageScheduleFHComponent {

  @ViewChild('scheduleFHForm', { static: true }) scheduleFHForm!: NgForm;
  displayedColumns: string[] = [`user`,`scheduleType`,`workingFor`,`workingHours`,'isActive', 'actions'];
  selectedScheduleFH: ScheduleFHVM;
  User: UserVM[] | undefined;
  dialogRef: any;
  ScheduleFH: ScheduleFHVM[] |  any;
  dataSource: any;
  proccessing: boolean | undefined;
  AddMode: boolean = true
  EditMode: boolean = false
  Edit: boolean = false;
  Add: boolean = true;
  dialogData: any;
  dialogRefe: any;
Schedulefh: any;

  constructor(private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,
   ) {
    this.selectedScheduleFH = new ScheduleFHVM
    
    
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.GetScheduleFH();
    this.GetUser();
       this.selectedScheduleFH.isActive = true;
  }
  GetUser() {
    var user = new UserVM
    user.isActive= true;
    this.lmsSvc.SearchUser(user).subscribe({
      next: (res: UserVM[]) => {
        this.User = res;
      //  this.dataSource = new MatTableDataSource(this.City);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  OpenUserDialog() {
   // this.isDialogOpen = true;
    this.dialogRef = this.dialog.open(ManageUserComponent, {
      width: '1200px',
      height: '950px',
      //data: { isDialogue: true, userId: this.selectedScheduleFH.userId },
     // disableClose: false // Enable the close button for the dialog
    });
  
    this.dialogRef.afterClosed().subscribe((res: any) => {
      this.GetUser();
     // this.isDialogOpen = false;
    });
  }
  
  GetScheduleFH() {
    var Schfh = new ScheduleFHVM
    Schfh.isActive= true;
    this.lmsSvc.GetScheduleFH().subscribe({
      next: (value: ScheduleFHVM[]) => {
        this.ScheduleFH = value
        console.warn(this.ScheduleFH)
        this.dataSource = new MatTableDataSource(this.ScheduleFH)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }

  
  SaveScheduleFH()  {
    console.warn(this.selectedScheduleFH)
    this.proccessing = true
    if (!this.scheduleFHForm.invalid) {
      this.lmsSvc.SaveScheduleFH(this.selectedScheduleFH).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar("Successfully Added!", 5000)
          this.Add = true;
          this.Edit = false;
          this.proccessing = false
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
          this.proccessing = false
        }
      })
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
//   SaveScheduleFH() {
//     this.lmsSvc.GetScheduleFH().subscribe({
//     next: (res: ScheduleFHVM[]) => {
//       var list = res
//       if (this.Edit)
//         list = list.filter(x => x != this.selectedScheduleFH)
//       var find = list.find(x => x.workingFor == this.selectedScheduleFH.workingFor)
//       if (find == undefined) {

//         this.proccessing = true
//         if (!this.scheduleFHForm.invalid) {
//           if (this.Edit)
//             this.UpdateScheduleFH
//           else {
//             this.lmsSvc.SaveScheduleFH(this.selectedScheduleFH).subscribe({
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
EditScheduleFH(scheduleFH: ScheduleFHVM) {
  this.EditMode = true
  this.AddMode = false
  this.selectedScheduleFH = scheduleFH
}
UpdateScheduleFH() {
  this.lmsSvc.UpdateScheduleFH(this.selectedScheduleFH).subscribe({
    next: (value) => {
      this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    },
  })
}

Refresh() {
  this.GetScheduleFH();
  this.selectedScheduleFH = new ScheduleFHVM
  this.EditMode = false
  this.AddMode = true
}
DeleteScheduleFH(id: number) {
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
      this.lmsSvc.DeleteScheduleFH(id).subscribe({
        next: (data) => {
          Swal.fire(
            'Deleted!',
            'Topic has been deleted.',
            'success'
          )
          this.Refresh();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  })
}
}
