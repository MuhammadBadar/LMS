import { Params } from '@angular/router';

import { EnumTypeVM } from './../models/EnumTypeVM';
import { ProcurementService } from './../procurement.service';
import { CustomerVM } from './../models/CustomerVm';
import { Component, Inject, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MAT_DIALOG_DATA,MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSort } from '@angular/material/sort';
import { MatSnackBar } from '@angular/material/snack-bar';
import { EnumValueVM } from '../models/EnumValueVM';
import {ActivatedRoute} from '@angular/router';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-manage-customer',
  templateUrl: './manage-customer.component.html',
  styleUrls: ['./manage-customer.component.css']
})
export class ManageCustomerComponent implements OnInit {
  ViewId:number;
  CustId:number;
  Edit:boolean=false;
  Add:boolean=true;
  View:boolean=false;
paymentTerm:EnumValueVM[];
customer:CustomerVM[];
getcustById:CustomerVM;
dialogTitle: string;
  constructor(
    private route:ActivatedRoute,
  // public dialogRef:MatDialogRef<ManageCustomerComponent>,
    public proSvc: ProcurementService,
    private snack: MatSnackBar,
    //@Inject(MAT_DIALOG_DATA) public data: any
  ) {
    this.proSvc.selectedCustomer= new CustomerVM
   }

  ngOnInit(): void {
    debugger
    this.GetEnumValues(EnumTypeVM.PaymentTerm);
    // this.CustId = this.data.CustomerId;
    // console.warn (this.CustId);
    // this.proSvc.GetCustomerById(this.CustId).subscribe((res: CustomerVM) => {
    //   this.getcustById = res;
    // });
    debugger
     this.route.queryParams.subscribe(params => {
       console.warn(this.getcustById)
       this.ViewId = params.data;
       console.warn(params.data)
       this.CustId = params.id;
      });
      console.warn( this.CustId )
      if (this.CustId>0){
        this.Edit=true;
        this.Add=false;
        this.GetCustById(); 
      }
      if (this.ViewId>0){
        this.Edit=false;
        this.Add=false;
        this.View=true;
        this.GetCustById(); 
      }
  
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
    
  SaveCustomer() {
    if (this.CustId>0){
    this.PutCustomer();
    }else{
    this.proSvc.SaveCustomer(this.proSvc.selectedCustomer).subscribe((data) => {
      this.snack.open('Customer Added!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })

      });}
  }
  PutCustomer(){
    
    this.proSvc.selectedCustomer=this.getcustById[0]
     console.warn(this.proSvc.selectedCustomer);
     this.proSvc.UpdateCustomer(this.proSvc.selectedCustomer).subscribe((data) => {
       this.snack.open('Customer Updated Successfully!', 'OK', { duration: 4000 })
  
     },
       (err: any) => {
         this.snack.open('Error Occured!', 'OK', { duration: 4000 })
   
       });
  
   }
  GetCustById(){
    debugger
    if(this.View==true)this.CustId=this.ViewId
    else{this.CustId=this.CustId}
    this.proSvc.GetCustomerById(this.CustId).subscribe((res: CustomerVM) => {
      this.getcustById = res;
      console.warn(res);
      console.warn( this.getcustById);
      
       this.proSvc.selectedCustomer=this.getcustById[0]
       console.warn( this.proSvc.selectedCustomer);
    });
   
  }
  
}
