import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { ProcurementService } from '../../procurement.service';
import { SaleOrderVM } from '../../models/SaleOrderVM';
import Swal from 'sweetalert2'
import { SaleOrderComponent } from '../sale-order.component';
import { Router, Routes } from '@angular/router';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ScrollStrategy } from '@angular/cdk/overlay/scroll';
import { AutofillMonitor } from '@angular/cdk/text-field';
import { DatePipe } from '@angular/common';


@Component({
  selector: 'app-order-list',
  templateUrl: './order-list.component.html',
  styleUrls: ['./order-list.component.css']
})
export class OrderListComponent implements OnInit {
  fromDate;
  toDate;
  isView:false;
  pipe: DatePipe;
  private dialogref:  MatDialogRef<SaleOrderComponent>;
  order:SaleOrderVM[];
  displayedColumns: string[] = ['customerName', 'createdOn', 'balance','netPayable','Action'];
  extra;
 // dataSource;
  dataSource = new MatTableDataSource<SaleOrderVM>();
  saleid:number[];
  length: any;
  constructor(
    public dialog: MatDialog,
    public proSvc :ProcurementService,
    private route:Router
    
  ) { 
   
    this.proSvc.selectedSaleOrder= new SaleOrderVM;
  }

  ngOnInit(): void {
    this.GetSaleOrders();
   
  }
   
Refresh(){
  this.ngOnInit();
  this.fromDate=undefined;
  this.toDate=undefined
}
  GetSaleOrders()
  {
    this.proSvc.GetSaleOrderList().subscribe((res: SaleOrderVM[]) => {
      this.order = res;
      this.dataSource.data= this.order 
     // this.dataSource= new MatTableDataSource (this.order);
    this.length=this.dataSource.filteredData.length;
    debugger
    });
  }
  applyDateFilter() {
debugger
console.warn(this.order)
    this.dataSource.data = this.order 
    this.dataSource.data= this.dataSource.data.filter(e=> new Date(e.createdOn) >= new Date(this.fromDate) && new Date(e.createdOn) <= new Date(this.toDate) );
    console.warn(this.dataSource.data)
    this.length=this.dataSource.filteredData.length;
  }
  
  EditSaleOrder(so:SaleOrderVM){
    so.isEdit=true;
    so.isView=false;
    this.dialogref = this.dialog.open(SaleOrderComponent, {
      width: '1500px',
      height: '900px',
      data:so
    });
    this.dialogref.afterClosed()
      .subscribe((res) => {
          this.GetSaleOrders();
      });
   }
   ViewSaleOrder(so:SaleOrderVM){
    so.isView=true;
    so.isEdit=false;
    this.dialogref = this.dialog.open(SaleOrderComponent, {
      width: '1000px',
      height: '700px',
      data: so
    });
    this.dialogref.afterClosed()
      .subscribe((res) => {
          this.GetSaleOrders();
      });
   }
  DeleteSaleOrder(id){
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
        this.proSvc.deleteSaleOrder(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Customer has been deleted.',
            'success'
          )
          this.GetSaleOrders();
       })
     
       
      }
    })
  }
  
}