
import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { AttendanceVM } from '../Models/AttendanceVM';
import { MatTableDataSource } from '@angular/material/table';
import { ATTService } from '../att.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { UserattbydateVM } from '../Models/UserattbydateVM';
import { UserVM } from '../../security/models/user-vm';
import { SecurityService } from '../../security/security.service';
import { DateAdapter } from '@angular/material/core';
import * as moment from 'moment';
import { NgForm } from '@angular/forms';
import { NgxMaterialTimepickerModule } from 'ngx-material-timepicker';
import Swal from 'sweetalert2';
@Component({
    selector: 'app-manage-attendance',
    templateUrl: './manage-attendance.component.html',
    styleUrls: ['./manage-attendance.component.css']
  })
  export class ManageAttendanceComponent implements OnInit{
  displayedColumns: string[] = ['user', 'inTime','outTime', 'workedHours','date'];
  // Attendance:AttendanceVM [] = [];
  AddMode: boolean = true
  proccessing: boolean = false;
  EditMode: boolean = false
  
  users?: UserVM[]
  Add: boolean = true;
  Edit: boolean = false;
  dialogRef: any
  dialogref: any
  maxDate: Date;
  selectedAttendance: AttendanceVM;
  dataSource:any
  attendance?:AttendanceVM[]
  @ViewChild('attendanceForm', { static: true }) attendanceForm!: NgForm;

  // userattbydate?:UserattbydateVM[]
  dialogData: any;
  dialogRefe: MatDialogRef<any, any>;
  messagebox: boolean;
  messages: any;
  timepicker: any;
  // attendance: AttendanceVM[];

  constructor(
    private injector: Injector,
    private attSvc: ATTService,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    private secSvs: SecurityService,
    private dateAdapter: DateAdapter<Date>) {
    this.selectedAttendance = new AttendanceVM
    this.maxDate = new Date();
    // this.maxDate.setDate(this.maxDate.getDate() + 1);
    // this.maxDate.setMilliseconds(this.maxDate.getMilliseconds() - 1);
    this.dateAdapter.setLocale('en'); // Set your desired locale
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
   }

   selectedAtt = {
    date: new Date(),
    from: new Date(), 
    to: new Date() // Set initial value to current date
  };
  ngOnInit(): void { 
    this.SearchbyDate() ;  
    this.Search() ;  
    this.AddMode = true;
  this.GetUser();
   this.GetAttendance();    
    this.selectedAttendance = new AttendanceVM(); 
       }
       
  GetAttendance() {
    this.attSvc.GetAttendance().subscribe({
      next:(value: AttendanceVM[])=> {
        this.attendance = value
        this.dataSource = new MatTableDataSource(this.attendance)
      },error:(err)=> {
        this.catSvc.ErrorMsgBar("Error Occurred",5000)
      },
    })
  }
//   SaveAttendance() {
//     const controls = this.attendanceForm.controls;
//     if (this.attendanceForm.invalid) {
//       for (const name in controls) {
//         if (controls[name].invalid) {
//           this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
//           break
//         }
//       }
//     } else {
//       this.CheckAttendanceValidation();
//       if(!this.attendanceForm.invalid){
//         this.lmsSvc.SaveAttendance(this.selectedAttendance).subscribe({
//           next: (value: any) => {
//            this.catSvc.ErrorMsgBar("Added Successfully", 8000)
//             this.Refresh();
//           }
//       })
//     }
//     else
//     {
//     this.lmsSvc.SaveAttendance(this.selectedAttendance).subscribe({
//       next: (value) => {
//         this.catSvc.SuccessMsgBar("Successfully Added", 5000)
//         this.Refresh();
//       }
//     })
//   }
// }}
openTimepicker() {
  this.timepicker.open();
}
// SaveAttendance() {
//   const controls = this.attendanceForm.controls;
//   if (this.attendanceForm.invalid) {
//     for (const name in controls) {
//       if (controls[name].invalid) {
//         this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
//         break
//       }
//     }
//   } else {
//     this.CheckAttendanceValidation();
//     if(!this.attendanceForm.invalid){
//       this.lmsSvc.SaveAttendance(this.selectedAttendance).subscribe({
//         next: (value: any) => {
//          this.catSvc.ErrorMsgBar("Added Successfully", 8000)
//           this.Refresh();
//         }
//     })
//   }
//     else {
//     this.proccessing = true
//     if (this.Edit) {
//        this.UpdateAttendance();
//     } else {
//       this.lmsSvc.GetAttendance().subscribe((data: any) => {
             
 
//         if (data.succeeded == true) {
//                 this.messagebox = false;
//                 Swal.fire({
//                   icon: 'success',
//                   position: 'center',
//                   text: 'Added Successfully',
//                   background: "#FFFFFF",
//                   confirmButtonColor: "#000000"
                  
//                 })
//                 this.ngOnInit();
//                 this.Refresh();
//               }
//               else {
//                 this.messagebox = true;
//                 this.messages = data.errors
//                 console.warn(data)
//               } 
//               window.scrollTo(0, 0);
//           this.proccessing = false;
            
//         }, (err: any) => {
//           console.warn(err);
//           this.catSvc.ErrorMsgBar("Error Occurred !", 6000);
//           this.proccessing = false;
//         });
//     }}
//   }
// }
SaveAttendance() {
  this.attSvc.SaveAttendance(this.selectedAttendance).subscribe({
    next: (value) => {
      this.catSvc.SuccessMsgBar("Successfully Added", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    },
  })
}

UpdateAttendance() {
  this.attSvc.UpdateAttendance(this.selectedAttendance).subscribe({
    next: (value) => {
      this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
      this.Refresh();
    }, error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
    },
  })
}
CheckAttendanceValidation() {
if (this.selectedAttendance.userId == undefined || this.selectedAttendance.userId == undefined) 
   this.attendanceForm.form.controls['userId'].setErrors({ 'incorrect': true });
}

  GetUser() {
    var usrz = new UserVM
    usrz.isActive = true;
   // this.selectedAttendance.isActive = true;
    this.secSvs.getUserList().subscribe({
      next: (res: UserVM[]) => {
        this.users = res
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Refresh() {
    this.GetAttendance();
    this.selectedAttendance = new AttendanceVM
    this.EditMode = false
    this.AddMode = true
    // this.selectedAttendance.isActive = true;
  }
 

  Search() {
    var usr = new AttendanceVM();
    usr.userId = this.selectedAttendance.userId;
    console.warn(usr);
    this.attSvc.SearchAttendance(usr).subscribe({
      next: (value: AttendanceVM[]) => {
        this.attendance= value
        this.dataSource = new MatTableDataSource(this.attendance)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     console.warn(err) ;
    },
    }) }
    SearchbyDate( ){
      debugger
     
      var usr = new AttendanceVM();
      usr.from = this.selectedAtt.from;
      usr.to = this.selectedAtt.to;
      usr.from = moment(usr.from).toDate()
        usr.from = new Date(Date.UTC(usr.from.getFullYear(), 
        usr.from.getMonth(), usr.from.getDate()))
  
        usr.to = moment(usr.to).toDate()
        usr.to = new Date(Date.UTC(usr.to.getFullYear(), 
        usr.to.getMonth(), usr.to.getDate()))
      console.warn(usr);
      this.attSvc.SearchAttendance(usr).subscribe({
        next: (value: AttendanceVM[]) => {
          this.attendance= value
          this.dataSource = new MatTableDataSource(value)
               console.warn(this.selectedAtt.from)
               console.warn(this.selectedAtt.to)
             }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
       console.warn(err) ;
      },
      })}
  SearchbyDatee( ){
    debugger
   
    var usr = new AttendanceVM();
     usr.date = this.selectedAtt.date;
    // usr.to = this.selectedAtt.to;
    usr.date = moment(usr.date).toDate()
      usr.from = new Date(Date.UTC(usr.date.getFullYear(), 
      usr.from.getMonth(), usr.date.getDate()))

    //   usr.to = moment(usr.to).toDate()
    //   usr.to = new Date(Date.UTC(usr.to.getFullYear(), 
    //   usr.to.getMonth(), usr.to.getDate()))
    // console.warn(usr);
    this.attSvc.SearchAttendance(usr).subscribe({
      next: (value: AttendanceVM[]) => {
        this.attendance= value
        this.dataSource = new MatTableDataSource(value)
              console.warn(this.selectedAtt.date)
            //  console.warn(this.selectedAtt.to)
           }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
     console.warn(err) ;
    },
    })}

  // Search(){
  //   var  att = new AttendanceVM();
  //   att.date = this.selectedAttendance.date;
  //   this.lmsSvc.SearchAttendance(att).subscribe({
  //    next: (value: AttendanceVM[]) => {
  //      this.attendance = value
  //      this.dataSource = new MatTableDataSource(this.attendance)
  //    }, error: (err) => {
  //      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //    },
  //  })}


  // OpenAttendanceDialog() {
  //   this.dialogRef = this.dialog.open(ManageAttendanceComponent, {
  //     width: '1200px', height: '950px',
  //     data:{isDialog : true}
  //    })
  //     this.dataSource = new MatTableDataSource(this.attendance)
  //   this.dialogRef.afterClosed()
  //     .subscribe((res: any) => {
  //       this.GetAttendance()
  //     }
  //     );
  // }



    }