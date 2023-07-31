import { LMSService } from './../lms.service';
import { InquiryVM } from './../Models/InquiryVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-inquiry',
  templateUrl: './manage-inquiry.component.html',
  styleUrls: ['./manage-inquiry.component.css']
})
export class ManageInquiryComponent implements OnInit {
  isActive?:false
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  AddMode: boolean = true
  EditMode: boolean = false
  validFields: boolean = false;
  public date = new Date();
  Inquiry: InquiryVM[] | undefined;
  selectedInquiry: InquiryVM;
  @ViewChild('InquiryForm', { static: true }) InquiryForm!: NgForm;
  displayedColumns: string[] = ['name', 'email', 'cell', 'comments', 'actions'];
  dataSource: any;
  constructor(
    public accSvc: LMSService,
    private catSvc: CatalogService,
  ) {
    this.selectedInquiry = new InquiryVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedInquiry = new InquiryVM
   
    this.GetInquiry()
    this.selectedInquiry.isActive = true;
  }
  GetInquiry() {
    this.accSvc.GetInquiry().subscribe({
      next: (res: InquiryVM[]) => {
        this.Inquiry = res;
        this.dataSource = new MatTableDataSource(this.Inquiry);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeleteInquiry(id: number) {
    debugger
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
        this.accSvc.DeleteInquiry(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Inquiry has been deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetInquiryForEdit(id: number) {
    this.selectedInquiry = new InquiryVM;
    this.selectedInquiry.id = id
    console.warn(this.selectedInquiry);
    this.accSvc.SearchInquiry(this.selectedInquiry).subscribe({
      next: (res: InquiryVM[]) => {
        this.Inquiry = res;
        console.warn(this.Inquiry);
        this.selectedInquiry = this.Inquiry[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveInquiry() {
    
    const controls = this.InquiryForm.controls;
    if (this.InquiryForm.invalid) {
      for (const name in controls) {
        if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(`  ${name} is Required`, 6000)
          break
        }
      }
    } else {
      if (this.selectedInquiry.email == null && this.selectedInquiry.email == undefined) {
        this.catSvc.ErrorMsgBar("Please enter  an email", 8000)
      } else {
      this.proccessing = true
      if (this.Edit) {
         this.UpdateInquiry();
      } else {
        this.accSvc.SaveInquiry(this.selectedInquiry).subscribe((data: any) => {
                if (data.succeeded == true) {
                  
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
  //   this.proccessing = true
  //   if (!this.InquiryForm.invalid) {
  //     this.accSvc.SaveInquiry(this.selectedInquiry).subscribe({
  //       next: (res) => {
  //         this.catSvc.SuccessMsgBar("Successfully Added!", 5000)
  //         this.Add = true;
  //         this.Edit = false;
  //         this.proccessing = false
  //         this.ngOnInit();
  //       }, error: (e) => {
  //         this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //         console.warn(e);
  //         this.proccessing = false
  //       }
  //     })
  //   } else {
  //     this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  //     this.proccessing = false
  //   }
  // }
  UpdateInquiry() {
    this.proccessing = true
    if (!this.InquiryForm.invalid) {
      this.accSvc.UpdateInquiry(this.selectedInquiry).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
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
    }
    else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  Refresh() {
    this.Add = true;
    this.Edit = false;
  }
}