//import { CustomerListComponent } from './../../customer-list/customer-list.component';
import { Component, OnInit,ViewChild,Inject } from '@angular/core';
import { EnumTypeVM } from '../../models/EnumTypeVM';
import { ProcurementService } from '../../procurement.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CustomerVM } from '../../models/CustomerVm';
import { EnumValueVM } from '../../models/EnumValueVM';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-edit-customer',
  templateUrl: './edit-customer.component.html',
  styleUrls: ['./edit-customer.component.css']
})
export class EditCustomerComponent implements OnInit {
public Id :number;
CustId:number;
  paymentTerm:EnumValueVM[];
customer:CustomerVM[];
getcustById:CustomerVM;
  constructor(
   @Inject(MAT_DIALOG_DATA) public data: any,
      public dialogRef:MatDialogRef<EditCustomerComponent>,
    //public custList:CustomerListComponent,
    public proSvc: ProcurementService,
    private snack: MatSnackBar
  ) {
    this.proSvc.selectedCustomer= new CustomerVM()
   }

  ngOnInit(): void {
    this.GetEnumValues(EnumTypeVM.PaymentTerm);
    // this.proSvc.GetCustomerById(1).subscribe((res: CustomerVM) => {
    //   this.getcustById = res;
    //   console.warn(this.getcustById);
    //    //this.proSvc.selectedCustomer= this.getcustById    });
       console.warn(this.proSvc.selectedCustomer);
       this.CustId = this.data.CustomerId;
    console.warn (this.CustId);
    this.proSvc.GetCustomerById(this.CustId).subscribe((res: CustomerVM) => {
      this.getcustById = res;
      console.warn(this.getcustById);

    });
  }
  GetEnumValues(etype: EnumTypeVM) {
    this.proSvc.GetEnumValues(etype).subscribe((res: EnumValueVM[]) => {
    if(etype==EnumTypeVM.PaymentTerm)
    this.paymentTerm=res;
    },
    (err: any) => {
      this.snack.open('Error Occured!', 'OK', { duration: 4000 })
    });
    }
    
 PutCustomer(){
 // console.warn(this.getcustById);
  //this.proSvc.selectedCustomer.id= 1;
  debugger
  console.warn(this.getcustById)
  if(this.proSvc.selectedCustomer.customerName== undefined || null)
  {this.proSvc.selectedCustomer.customerName=this.getcustById[0].customerName};
  if(this.proSvc.selectedCustomer.customerSince==null )
  this.proSvc.selectedCustomer.customerSince=this.getcustById[0].customerSince;
  if(this.proSvc.selectedCustomer.primaryCellNo==null || undefined)
  this.proSvc.selectedCustomer.primaryCellNo=this.getcustById[0].primaryCellNo;
  if(this.proSvc.selectedCustomer.primaryEmail==null || undefined)
  this.proSvc.selectedCustomer.primaryEmail=this.getcustById[0].primaryEmail;
  if(this.proSvc.selectedCustomer.secondaryCellNo==null || undefined)
  this.proSvc.selectedCustomer.secondaryCellNo=this.getcustById[0].secondaryCellNo;
  if(this.proSvc.selectedCustomer.secondaryEmail==null || undefined)
  this.proSvc.selectedCustomer.secondaryEmail=this.getcustById[0].secondaryEmail;
  if(this.proSvc.selectedCustomer.address==null || undefined)
  this.proSvc.selectedCustomer.address=this.getcustById[0].address;
  if(this.proSvc.selectedCustomer.paymentTermsId==null || undefined)
  this.proSvc.selectedCustomer.paymentTermsId=this.getcustById[0].paymentTermsId;
  if(this.proSvc.selectedCustomer.creditLimit==null || undefined)
  this.proSvc.selectedCustomer.creditLimit=this.getcustById[0].creditLimit;
  this.proSvc.selectedCustomer.id=this.getcustById[0].id
  console.warn(this.proSvc.selectedCustomer);
  this.proSvc.UpdateCustomer(this.proSvc.selectedCustomer).subscribe((data) => {
    this.snack.open('Customer Updated Successfully!', 'OK', { duration: 4000 })
  },
    (err: any) => {
      this.snack.open('Error Occured!', 'OK', { duration: 4000 })

    });

}
reload(){
window.location.reload();}
}

