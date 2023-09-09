
import { DataSource } from '@angular/cdk/table';
import { NgForm } from '@angular/forms'
import { ItemVM } from './../models/ItemVM';
import { SaleOrderVM, saleOrderLines } from './../models/SaleOrderVM';
import { Component, OnInit, ViewChild, PipeTransform, ElementRef, Inject, Injector } from '@angular/core';
import { ProcurementService } from './../procurement.service';
import { EnumTypeVM } from '../models/EnumTypeVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import { EnumValueVM } from '../models/EnumValueVM';
import { CustomerVM } from '../models/CustomerVm';
import { MatTableDataSource } from '@angular/material/table';
import { FormArray, FormGroup, FormBuilder } from '@angular/forms';
import { MatTable } from '@angular/material/table';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { AppConfirmService } from 'app/shared/services/app-confirm/app-confirm.service';
import Swal from 'sweetalert2'
import { I } from '@angular/cdk/keycodes';
import { StateGroup } from 'assets/examples/material/option-group-autocomplete/option-group-autocomplete.component';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
const Itm_Info = [
  { "itemCode": 0, "itemName": "abc", "uom": "ltr", "qty": 0, "price": 0, "lineTotal": 0 },
]


// const Item_SCHEMA = {
//   "id": "number",
//   "itemName": "text",
//   "price": "number",
//   "itemCode": "number",
//   "lineTotal": "number",
//   "uom": "text",
//   "qty": "number",
//   "isEdit": "isEdit"
// }

@Component({
  selector: 'app-sale-order',
  templateUrl: './sale-order.component.html',
  styleUrls: ['./sale-order.component.css']
})
export class SaleOrderComponent implements OnInit {
  @ViewChild('itmform', { static: true }) itmform: NgForm;
  id:number;
  saleOrderId:number
  disabled = false;
  isEdit = false;
  isView = false;
  //itmdata = Itm_Info;
  data = Itm_Info;
  outputData;
  outputArray = [];
  filteredData;
  pDisable=false;
  //itmform:NgForm
  //itmSchema =Item_SCHEMA;
  //name:string;
  //show= true;
  //dataSource = INFO;
  //itemName:any;
  //dataSchema = USER_SCHEMA;
  line: saleOrderLines[]
  UOM: EnumValueVM[]
  customer: CustomerVM[]
  DBOperation:number=1;
  item: ItemVM[]
  items: ItemVM[]
  displayedColumn: string[];
  displayedColumns: string[] = ['Code', 'Name', 'UOM', 'QTY', 'Price', 'LineTotal', 'Action'];
  @ViewChild("code") itemCodeField: ElementRef;
  //@ViewChild(MatTable, { static: true }) table: MatTable<any>;
  saleOrderLines = new saleOrderLines();
  // Data: saleOrderLines[] = [
  //   {id:1, itemCode: 0, itemName: null, uom: null, qty: 0, price: 0, lineTotal: 100 ,uOMId:0},
  // ];
  //stateGroupOptions: Observable<StateGroup[]>;
  dataSource;
   dialogRef = null;
    sorder:SaleOrderVM;
  constructor(
    // @Inject(MAT_DIALOG_DATA) public sorder: SaleOrderVM, 
    private confirmService: AppConfirmService,
    public proSvc: ProcurementService,
    private snack: MatSnackBar,
    public dialog: MatDialog,private injector: Injector

  ) {
    this.dialogRef = this.injector.get(MatDialogRef, null);
    this.sorder = this.injector.get(MAT_DIALOG_DATA, null);
    this.proSvc.selectedSaleOrder = new SaleOrderVM
    this.proSvc.selectedCustomer = new CustomerVM
    this.proSvc.selectedItem = new ItemVM
    this.proSvc.line = new saleOrderLines
    //this.proSvc.soline.push(new saleOrderLines)
    //this.proSvc.selectedSaleOrder.saleOrderLines= new Array(this.proSvc.line)
  }

  GetEnumValues(etype: EnumTypeVM) {
    this.proSvc.GetEnumValues(etype).subscribe((res: EnumValueVM[]) => {
      if (etype == EnumTypeVM.UOM)
        this.UOM = res;
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })

      });
  }
  ngOnInit(): void {
  
    if(this.sorder!=null)
    {
      this.isEdit=this.sorder.isEdit;
      this.isView=this.sorder.isView;
      this.proSvc.selectedSaleOrder=this.sorder;
      for(var i in this.sorder.saleOrderLines )
      { 
        
      debugger;
      const itm = this.outputArray.find(x => x.itemCode == this.sorder.saleOrderLines[i].itemCode)
      // console.warn("itm:" ,itm.qty )
       if (itm == undefined) {
         this.outputArray.push(this.sorder.saleOrderLines[i])    
       }
      }
      this.displayedColumn = ['itemCode', 'itemName', 'uom', 'qty', 'salePrice', 'lineTotal', 'Actions'];
      debugger;
       this.outputData = new MatTableDataSource(this.outputArray)
      debugger
    }

     this.proSvc.getCustomerList().subscribe((res: CustomerVM[]) => {
      this.customer = res;
      this.GetEnumValues(EnumTypeVM.UOM);
      this.proSvc.getItemList().subscribe((res: ItemVM[]) => {
        this.items = res;
        this.filteredData = this.items;
      })

    });
    
  }
 
  getSum() {

    let totalCost = 0;
    this.outputArray.forEach(element => {
      totalCost += element.lineTotal
    });
    return totalCost;

  }
  //  addnewRow(){
  //    debugger
  //    if(this.proSvc.selectedSaleOrder.qty!==undefined){
  //     const newRow =  {"id":Math.floor(Math.random() * 1000), "itemCode": 0, "itemName": "", "uom": "", "qty": 0, "price": 0, "lineTotal": 0 }
  //     this.itmdata = [...this.itmdata,newRow];
  //     console.warn(this.proSvc.selectedSaleOrder.qty)

  //     this.displayedColumn = ['itemCode', 'itemName', 'uom', 'qty', 'salePrice', 'lineTotal', 'Actions'];
  //     this.table.renderRows();
  //    }
  //  }
  addRows() {
    debugger
    if (this.proSvc.line.qty >= 1) {
      if (this.proSvc.line.qty !== null) {
        if (this.proSvc.line.qty !== undefined) {
          if (this.proSvc.line.price !== undefined) {
            // console.warn(this.item[0])
            const newRow = { "id":this.id,"saleOrderId":this.saleOrderId,"itemCode": this.proSvc.line.itemCode, "itemName":this.proSvc.line.itemName, "uom": this.proSvc.line.uom, 
            "uomId":this.proSvc.line.uomId, "qty": this.proSvc.line.qty, "price": this.proSvc.line.price, 
            "lineTotal": this.proSvc.line.qty * this.proSvc.line.price,"dBoperation":this.DBOperation ,
          "isActive":true}
            //console.warn(newRow.itemCode)
           
            const itm = this.outputArray.find(x => x.itemCode == newRow.itemCode)
           // console.warn("itm:" ,itm.qty )
            if (itm == undefined) {
              // Itm_Info.push(newRow)
              //  this.table.renderRows();
              debugger
              this.outputArray.push(newRow);
              this.outputData = new MatTableDataSource(this.outputArray)
              this.displayedColumn = ['itemCode', 'itemName', 'uom', 'qty', 'salePrice', 'lineTotal', 'Actions'];
              this.proSvc.line.itemCode = undefined;
              this.proSvc.line.itemName = undefined;
              this.proSvc.line.price = undefined;
              this.proSvc.line.uom = undefined;
             // this.DBOperation=0
               // this.ngOnInit();
              this.proSvc.line.qty = undefined;
              this.disabled = false;
              this.getSum();
               this.NetPayAble();
              //document.getElementById("name").focus();
              this.itemCodeField.nativeElement.focus();
            } else {
              debugger
             // this.snack.open("You have already ordered this item ", 'OK', { duration: 5000 })  
              itm.qty= itm.qty + this.proSvc.line.qty
              itm.price=this.proSvc.line.price
              itm.lineTotal=itm.qty *  this.proSvc.line.price
              if(this.isEdit==true){
                //itm.dBoperation=2  
                this.edit(itm.itemCode)  
                this.addRows();             
              }
              this.proSvc.line.itemCode = undefined;
              this.proSvc.line.itemName = undefined;
              this.proSvc.line.price = undefined;
              this.proSvc.line.uom = undefined;
              this.proSvc.line.qty = undefined;
              this.DBOperation=1
               // this.ngOnInit();
              this.disabled = false;
              this.pDisable=false;
              this.getSum();
               this.NetPayAble();
              this.itemCodeField.nativeElement.focus();
             // this.outputData = new MatTableDataSource(this.outputArray)         
               }

          }
        }
      }
    }
    if(this.proSvc.line.qty < 1){
      if(this.item[0].salePrice !== 0){
        this.snack.open(" Quantity can't be 'null' or a 'negative' number  ", 'OK', { duration: 5000 })
      }
    }
   

  }
  EmptyCodeFeild() {
    this.proSvc.line.itemCode = undefined;
  }
  EmptyNameFeild() {
    debugger
    if(this.isEdit==false){
      this.ngOnInit();
    }
    this.proSvc.line.itemName = undefined;
  }
  delete(itemCode) {
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
        debugger
        if(this.isEdit==true){
          var item = this.outputArray.find(x => x.itemCode == itemCode);
          item.dBoperation=5;
          this.id= item.id;
         // const newRow={"id":item.id,"dBoperation":5}
          //this.outputArray = this.outputArray.filter(i => i.itemCode!== itemCode);
          this.addRows();
        //  this.outputArray.length=0
        //   this.outputArray.push(newRow);
           this.SaveSaleOrder();
         // this.outputData = new MatTableDataSource(this.outputArray)
        }
        this.outputArray = this.outputArray.filter(i => i.itemCode!== itemCode);
        this.outputData = new MatTableDataSource(this.outputArray)
        debugger
       
        Swal.fire(
          'Deleted!',
          'Order has been deleted.',
          'success'
        )
        this.NetPayAble();
      }
      
    })
 // this.table.renderRows();
  }
  Reset() {
    debugger
    if(this.isView==false)
   { this.outputArray.length = 0;
    this.outputData = new MatTableDataSource(this.outputArray)
   }
   else
   {
     this.dialogRef.close();
   }
  }
  SaveSaleOrder() {
    // this.proSvc.selectedSaleOrder.saleOrderLines= new Array(this.proSvc.line)    
    debugger
    if(this.isView==false)
   { 
     if (this.outputArray.length !== 0) {
      if(this.proSvc.selectedSaleOrder.discount>=0 ||this.proSvc.selectedSaleOrder.discount == undefined){
      this.proSvc.selectedSaleOrder.total = this.getSum();
      this.proSvc.selectedSaleOrder.saleOrderLines = this.outputArray
     if(this.isEdit==false)
     { 
      this.NetPayAble();
       this.proSvc.SaveSaleOrder(this.proSvc.selectedSaleOrder).subscribe((data) => {
        this.snack.open('Data  successfully added!', 'OK', { duration: 4000 })
        this.itmform.resetForm();
      },
        (err: any) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        });
        this.outputArray.length = 0;
        debugger;
        this.outputData = new MatTableDataSource(this.outputArray) 
      }
      else if(this.isEdit==true)
      {
        debugger;
       
        this.proSvc.UpdateSaleOrder(this.proSvc.selectedSaleOrder).subscribe((data) => {
          this.snack.open('Data  successfully updated!', 'OK', { duration: 4000 })
        },
          (err: any) => {
            this.snack.open('Error Occured!', 'OK', { duration: 4000 })
          });      
      }
      
    }
    else{  this.snack.open("Invalid discount value", 'OK', { duration: 6000 })}
   }else if (this.outputArray.length == 0) {
      this.snack.open("Please Choose at least one item to submit an Order", 'OK', { duration: 6000 })
    }
   }
  }
  SearchItemByCode() {
   
    debugger
    if (this.proSvc.line.itemCode >= 1001) {
      this.proSvc.SearchItemByCode(this.proSvc.line.itemCode).subscribe((res: ItemVM[]) => {
        this.item = res
        const itm = this.outputArray.find(x => x.itemCode == this.item[0].itemCode)
        if(itm!==undefined){
        this.pDisable=true;
        }
        this.proSvc.line.price = this.item[0].salePrice;
        this.proSvc.line.uom = this.item[0].uom;
        this.proSvc.line.itemName = this.item[0].itemName
        this.proSvc.line.uomId=this.item[0].uoMId
        if (res.length !== 0) {
          this.proSvc.line.qty=1;
          // this.dataSource= new MatTableDataSource(this.item)
          // this.snack.open("Find Item ", 'OK', { duration: 5000 })
          document.getElementById("qty").focus();
        }

        else if (res.length == 0) {
          // this.snack.open("Can't Find Item ", 'OK', { duration: 5000 })
          this.proSvc.line.qty = undefined;
          // this.item[0].salePrice = undefined;
          // this.item[0].uom = undefined;
        }
      });
    } else {
      this.proSvc.line.qty = undefined;
      // this.item[0].salePrice=undefined;
      // this.item[0].uom=undefined;

    }
  }
  SearchItemByName() {
    debugger

    console.warn(this.proSvc.selectedItem);
    this.proSvc.line.itemCode = undefined;
    this.proSvc.selectedItem.salePrice = undefined;
    this.proSvc.selectedItem.itemName =this.proSvc.line.itemName 
    this.proSvc.SearchItem(this.proSvc.selectedItem).subscribe((res: ItemVM[]) => {
      this.item = res;
      const itm = this.outputArray.find(x => x.itemCode == this.item[0].itemCode)
      if(itm!==undefined){
      this.pDisable=true;
      }
      this.proSvc.line.qty=1;
      this.proSvc.line.price = this.item[0].salePrice;
      this.proSvc.line.uom = this.item[0].uom;
      this.proSvc.line.itemCode = this.item[0].itemCode
      this.proSvc.line.uomId=this.item[0].uoMId
      console.warn(this.item)
      // this.dataSource= new MatTableDataSource(this.item)
    })
    document.getElementById("qty").focus();

  }
  edit(itemCode) {
debugger

    if (this.disabled == false) {
      console.warn(this.outputArray)
      var item = this.outputArray.find(x => x.itemCode == itemCode);
      console.warn(item);
      if(this.isEdit==true){
        
        var itm =this.sorder.saleOrderLines.find(x => x.itemCode == itemCode);
         if (itm== undefined) {
        this.DBOperation=1 
        }else{
          this.DBOperation=2
        }
        this.id= item.id;
        this.saleOrderId=item.saleOrderId;       
       
      }
      this.proSvc.line.uomId=item.uomId
      this.disabled = true;
      this.proSvc.line.itemCode = item.itemCode;
      this.proSvc.line.itemName = item.itemName;
      this.proSvc.line.uom = item.uom;
      this.proSvc.line.price = item.price;
      this.proSvc.line.qty = item.qty;
      this.outputArray = this.outputArray.filter(i => i.itemCode !== itemCode);
      this.outputData = new MatTableDataSource(this.outputArray);
      document.getElementById("qty").focus();
      this.NetPayAble();
    }
    else {
      Swal.fire(
        'Error!',
        'You have already selected an order for Updation, You can Edit only one order at a time',

      )
    }
  }
  NetPayAble(){

    if(this.proSvc.selectedSaleOrder.discount >=0 ){
     
      this.proSvc.selectedSaleOrder.netPayable = this.getSum()-this.proSvc.selectedSaleOrder.discount
    }
    else if(this.proSvc.selectedSaleOrder.discount== undefined ){
     
      this.proSvc.selectedSaleOrder.netPayable = this.getSum()
    }
    else if(this.proSvc.selectedSaleOrder.discount <0){
      this.snack.open("Invalid discount vlaue", 'OK', { duration: 6000 })
      this.proSvc.selectedSaleOrder.netPayable = this.getSum()
      //this.proSvc.selectedSaleOrder.discount =0
    }
    if(this.getSum()<=this.proSvc.selectedSaleOrder.discount){
      this.proSvc.selectedSaleOrder.discount=0;
    }
    
  }
  AutoCompleteSearch(evt: string) {
    evt = evt + "";
    if (!evt) this.filteredData = this.items;
    else {
      /** uses both id and text fields for extensive filtering (case insensitive) . can be tailored for custom needs */
      this.filteredData = this.items.filter(item => (item.id + "") === evt || item.itemName.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
  
}
