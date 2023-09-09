import { EditCustomerComponent } from './../manage-customer/edit-customer/edit-customer.component';
import { ProcurementService } from './../procurement.service';
import { CustomerVM } from './../models/CustomerVm';
import { Component, Injectable, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ManageCustomerComponent } from '../manage-customer/manage-customer.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2'
import {Router} from '@angular/router'; 
// @Injectable({
//   providedIn: 'root'
// })


@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css']
})

export class CustomerListComponent implements OnInit {
  getcustById:CustomerVM;
  customer:CustomerVM[];
  Edit:boolean= true;
  displayedColumns: string[] = ['Name', 'Cells', 'Emails','Address' ,'PaymentTerm', 'Creditl','Action'];
  dataSource;
  constructor(
    private route:Router,
    private snack: MatSnackBar,
    public dialog: MatDialog,
    public proSvc :ProcurementService,
   
  ) { 
    this.proSvc.selectedCustomer= new CustomerVM;
  }

  ngOnInit(): void {
    debugger
    this.GetCustomer();
  }
  GetCustomer(){
    this.proSvc.getCustomerList().subscribe((res: CustomerVM[]) => {
      this.customer = res;
    this.dataSource= new MatTableDataSource (this.customer);
    });
  }
 AddNewCust(){
  let dialogRef = this.dialog.open(ManageCustomerComponent, {disableClose:true, width: '900px', height: '500px' 
        
       });
  
 }
  EditCustomer(cust:CustomerVM){
    debugger
    console.warn(cust)

   this.route.navigate(['/procurement/mngCust'], { queryParams: { id: cust.id

} });

  //   let dialogRef = this.dialog.open(EditCustomerComponent, {disableClose:true, panelClass: 'calendar-form-dialog', width: '900px', height: '550px' 
  //   , data: { CustomerId:cust.id      
  //      }
         
  //  });
  

  }
  ViewCustomer(cust:CustomerVM){
    debugger
    console.warn(cust)
    this.route.navigate(['/procurement/mngCust'], { queryParams: { data: cust.id} });
  }

DeleteCust(id){
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
      this.proSvc.DeleteCustomer(id).subscribe((data) => {
        Swal.fire(
          'Deleted!',
          'Customer has been deleted.',
          'success'
        )
        this.GetCustomer();
     })   
    }
  })
 
  
}
}
