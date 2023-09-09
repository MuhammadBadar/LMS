import { Subscription } from 'rxjs';
import { FormGroup,FormControl, FormArray, FormBuilder ,Validators, RequiredValidator} from "@angular/forms";
import { ActivatedRoute, Router } from "@angular/router";
import { Component, OnInit, ChangeDetectorRef, ChangeDetectionStrategy } from "@angular/core";
import { InvoiceService } from "../invoice.service";
//import { Invoice, InvoiceItem ,myInvoiceItem,InvoiceItems,sInvoiceItem} from 'app/shared/models/invoice.model';
export interface Invoice {
  clientname?: string;
  clientpo?: string;
  percent?: string;
  value?: string;
  charges?: string;
  // name?:string,
  date?:string;
  id?: string;
  item?: InvoiceItem[];
  items?: InvoiceItems[];
  myitem?:myInvoiceItem[];
  sitem?:sInvoiceItem[];
}
export interface myInvoiceItem{
    SKU;
		Qty;
		Currency;
		UnitPrice;
		UOM;
    HeadGroup;
    HeadType;
    HeadCategory;
     HeadName;
     Name ;
     LineTotal
	
}
export interface sInvoiceItem{
  InvoiceStageId;
Name;
Qty;
UOM;
Currency;
UnitPrice;
LineTotal;
   
 }

export interface InvoiceItems {
   ItemName: string;
  InvoiceItemId: number;
  InvoiceStageId: number;
  ItemGroupId: number;
  ItemType: string;
  ItemCategory:string ;
  SKU: string;
  Qty: number;
  UOM: null;
  Currency: number;
  UnitPrice: number;
  LineTotal: null;
}

export interface InvoiceItem {
  ItemName: string;
  InvoiceItemId: number;
  InvoiceStageId: number;
  ItemGroupId: number;
  ItemType: string;
  ItemCategory:string ;
  SKU: string;
  Qty: number;
  UOM: null;
  Currency: number;
  UnitPrice: number;
  LineTotal: null;
  id? ;
		ItemTypeId;
		ItemCategoryId;
		InventoryItemId;
		itemSKU;
    HeadGroup;
    HeadType;
    HeadCategory;
     HeadName;
     
	
		
		
	
 

}

export interface SaleOrders {
  value: string;
  viewValue: string;
}
export interface Deliverables {
  value: string;
  viewValue: string;
}
export interface PaymentTerms {
  value: string;
  viewValue: string;
}
export interface PaymentMethods {
  value: string;
  viewValue: string;
}
export interface Statuses {
  value: string;
  viewValue: string;
}
export interface TaxMethods {
  value: string;
  viewValue: string;
}
@Component({
  selector: "app-invoice-details",
  templateUrl: "./invoice-details.component.html",
  styleUrls: ["./invoice-details.component.scss"],
  changeDetection: ChangeDetectionStrategy.OnPush,

})
export class InvoiceDetailsComponent implements OnInit {
  



  SaleOrder: SaleOrders[] = [
    {value: '0', viewValue: 'a'},
    {value: '1', viewValue: 'b'},  
  ];
  Reference =new FormControl();
  RefereneceList:string[]=['a','b','c','d'];

  Deliverable: Deliverables[] = [
    {value: 'internal-0', viewValue: 'Internal'},
    {value: 'external-1', viewValue: 'External'},
  ];
Task =new FormControl();
  TaskList:string[]=['a','b','c','d'];

  PaymentTerm: PaymentTerms[] = [
    {value: '0', viewValue: ' PIA - Payment in advance.'},
    {value: '1', viewValue: 'Net 7 - Payment seven days after invoice date.'},
    {value: '2', viewValue: 'Net 10 - Payment ten days after invoice date.'},
    {value: '3', viewValue: 'Net 30 - Payment 30 days after invoice date.'},
    {value: '4', viewValue: 'Net 60 - Payment 60 days after invoice date.'},
    {value: '5', viewValue: 'Net 90 - Payment 90 days after invoice date.'},
    {value: '6', viewValue: 'EOM - End of month.'},
    
  ];
  PaymentMethod: PaymentMethods[] = [
    
    {value: '0', viewValue: 'cash'},
    {value: '1', viewValue: 'Personal Cheque'},
    {value: '2', viewValue: 'Credit Card'},
  ];
  Status: Statuses[] = [
    {value: '0', viewValue: 'Open'},
    {value: '1', viewValue: 'Pending'},
    {value: '2', viewValue: 'Approved'},
    {value: '3', viewValue: 'Rejected'},
  ];
  TaxMethod: TaxMethods[] = [
    {value: '0', viewValue: 'Progressive'},
    {value: '1', viewValue: 'Flat'},
  ];

  cost: number = 0;
  vat: number = 0;
  currency: string = '$';
  showEditOption: boolean = false;
  isLoading = false;
  invoiceForm: FormGroup;
  invoiceFormSub: Subscription;
  invocieId: number;
  invoice: Invoice = {
    myitem:[],
    item: [],
    items:[],
    sitem:[]
  };
  
  myemptyFormObject: myInvoiceItem = {
    
    SKU: "",
    Qty: null,
    UOM: null,
    Currency: null,
    UnitPrice: null,
    LineTotal: null,
		
    HeadGroup:null,
    HeadType:null,
    HeadCategory:null,
    HeadName:null,
    Name:null,
	
  };
  semptyFormObject: sInvoiceItem = {
    
InvoiceStageId: null,
Name: null,
Qty: null,
UOM: null,
Currency: null,
UnitPrice: null,
LineTotal: null,
	
  };
  femptyFormObject: InvoiceItems = {
    
    ItemName: null,
    InvoiceItemId: null,
    InvoiceStageId: null,
    ItemGroupId: null,
    ItemType: null,
    ItemCategory:null ,
    SKU: null,
    Qty: null,
    UOM: null,
    Currency: null,
    UnitPrice: null,
    LineTotal: null,
	
  };


  emptyFormObject: InvoiceItem = {
    InvoiceItemId: null,
    InvoiceStageId: null,
    ItemGroupId: null,
    ItemType: "",
    ItemCategory: null,
    ItemName: "",
    SKU: "",
    Qty: null,
    UOM: null,
    Currency: null,
    UnitPrice: null,
    LineTotal: null,
		ItemTypeId:null,
		ItemCategoryId:null,
		InventoryItemId:null,
		itemSKU:null,
    HeadGroup:null,
    HeadType:null,
    HeadCategory:null,
    HeadName:null,
   
	
  };
  

  itemTableColumn: string[] = [
    "Number",
    "InvoiceItemId",
    "InvoiceStageId",
    "ItemGroupId",
    "Item Type",
    "Item Category",
    "Item Name",
    "SKU",
    "Qty",
    "UOM",
    "Currency",
    "UnitPrice",
    "LineTotal"
  ];
  
  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private invoiceService: InvoiceService,
    private cdr: ChangeDetectorRef
  ) {
  
  }

  ngOnInit() {
    this.invocieId = this.route.snapshot.params["id"];
    if (this.invocieId) {
      this.getInvoice();
      this.showEditOption = false;
    } else {
      this.buildInvoiceForm();
      this.showEditOption = true;
    }
  }

  getInvoice() {
    this.invoiceService.getInvoiceById(this.invocieId).subscribe((invoice: Invoice) => {
      this.invoice = invoice;
      this.buildInvoiceForm(this.invoice);
     // this.calculateCost(this.invoice);
      this.cdr.markForCheck();
    });
  }

  buildInvoiceForm(invoice?: Invoice) {
    this.invoiceForm = this.fb.group({
      id: [invoice?invoice.id:''],
      clientname: [invoice?invoice.clientname:''],
      clientpo: [invoice?invoice.clientpo:''],
      percent: [invoice?invoice.percent:''],
      value: [invoice?invoice.value:''],
      charges: [invoice?invoice.charges:''],
      date: invoice?new Date(invoice.date):'',
      // name: [invoice?invoice.name:''],
      
      item: this.fb.array([]),
      myitem: this.fb.array([]),
      items:this.fb.array([]),
      sitem:this.fb.array([])


    });

     this.invoice.item.forEach(i => {
      this.addNewItem(i);
    });
    this.invoice.sitem.forEach(i => {
      this.saddNewItem(i);
    });
    this.invoice.items.forEach(i => {
      this.faddNewItem(i);
    });
    this.invoice.myitem.forEach(i => {
      this.myaddNewItem(i);
    });

    if(this.invoiceFormSub){
      this.invoiceFormSub.unsubscribe();
    }

    // this.invoiceFormSub = this.invoiceForm.valueChanges.subscribe(res => {
    //   this.calculateCost(res);
    // });

  }

  // calculateCost(invoice: Invoice) {
  //   this.cost = 0;
  //   invoice.item.forEach(element => {
  //     this.cost += element.unit * element.price;
  //   });
  //   this.vat = (invoice.vat * this.cost)/100;
  //   this.currency = invoice.currency;
  // }
  myaddNewItem(myitem: myInvoiceItem) {
    this.myItemFormArray.push(
      this.fb.group({
       
        SKU: [myitem?myitem.SKU:''],
        Qty: [myitem?myitem.Qty:''],
        UOM: [myitem?myitem.UOM:''],
        Currency: [myitem?myitem.Currency:''],
        UnitPrice: [myitem?myitem.UnitPrice:''],
        LineTotal: [myitem?myitem.LineTotal:''],
        
        HeadGroup: [myitem?myitem.HeadGroup:''],
        HeadType: [myitem?myitem.HeadType:''],
        HeadCategory: [myitem?myitem.HeadCategory:''],
        HeadName: [myitem?myitem.HeadName:''],
        Name: [myitem?myitem.Name:''],
      })
    );
  }
  faddNewItem(items: InvoiceItems) {
    this.fItemFormArray.push(
      this.fb.group({
       
        SKU: [items?items.SKU:''],
        Qty: [items?items.Qty:''],
        UOM: [items?items.UOM:''],
        Currency: [items?items.Currency:''],
        UnitPrice: [items?items.UnitPrice:''],
        LineTotal: [items?items.LineTotal:''],
        
        ItemName: [items?items.ItemName:''],
        ItemCategory: [items?items.ItemCategory:''],
        InvoiceItemId: [items?items.InvoiceItemId:''],
        InvoiceStageId: [items?items.InvoiceStageId:''],
        ItemGroupId: [items?items.ItemGroupId:''],
        ItemType: [items?items.ItemType:''],
      })
    );
  }
  saddNewItem(sitem: sInvoiceItem) {
    this.sItemFormArray.push(
      this.fb.group({
        
        InvoiceStageId: [sitem?sitem.InvoiceStageId:''],
        Qty: [sitem?sitem.Qty:''],
        UOM: [sitem?sitem.UOM:''],
        Currency: [sitem?sitem.Currency:''],
        UnitPrice: [sitem?sitem.UnitPrice:''],
        LineTotal: [sitem?sitem.LineTotal:''],
        Name: [sitem?sitem.Name:''],
      })
    );
  }
  addNewItem(item: InvoiceItem) {
    this.invoiceItemFormArray.push(
      this.fb.group({
        position: 1, InvoiceItemId: [item?item.InvoiceItemId:''],
        InvoiceStageId: [item?item.InvoiceStageId:''],
        ItemGroupId: [item?item.ItemGroupId:''],
        ItemType: [item?item.ItemType:''],
        ItemCategory: [item?item.ItemCategory:''],
        ItemName: [item?item.ItemName:''],
        SKU: [item?item.SKU:''],
        Qty: [item?item.Qty:''],
        UOM: [item?item.UOM:''],
        Currency: [item?item.Currency:''],
        UnitPrice: [item?item.UnitPrice:''],
        LineTotal: [item?item.LineTotal:''],
        ItemTypeId: [item?item.ItemTypeId:''],
        ItemCategoryId: [item?item.ItemCategoryId:''],
        InventoryItemId: [item?item.InventoryItemId:''],
        itemSKU: [item?item.itemSKU:''],
        HeadGroup: [item?item.HeadGroup:''],
        HeadType: [item?item.HeadType:''],
        HeadCategory: [item?item.HeadCategory:''],
        HeadName: [item?item.HeadName:''],
       
      })
    );
  }
 

  deleteItemFromInvoice(i: number) {
    this.invoiceItemFormArray.removeAt(i);
  }
  ldeleteItemFromInvoice(i: number) {
    this.myItemFormArray.removeAt(i);
  }
  fdeleteItemFromInvoice(i: number) {
    this.fItemFormArray.removeAt(i);
  }
  sdeleteItemFromInvoice(i: number) {
    this.sItemFormArray.removeAt(i);
  }
  // deleteItemFromBOM(i: number) {
  //   this.BOMitemFormArray.removeAt(i);
  // }
  saveInvoice() {
    if (this.invoiceForm.invalid) {
      return;
    }
    this.isLoading = true;
    this.invoiceService.saveInvoice(this.invoiceForm.value)
    .subscribe( (res: Invoice) => {
      this.invoice = this.invoiceForm.value;
      this.isLoading = false;
      this.showEditOption = false;

      this.cdr.markForCheck();

      if(res) {
        this.router.navigateByUrl('/invoice/'+ res.id);
      }
    });
  }

  print() {
    window.print();
  }

  get invoiceItemFormArray(): FormArray {
    return this.invoiceForm.get("item") as FormArray;
  }
  get myItemFormArray(): FormArray {
    return this.invoiceForm.get("myitem") as FormArray;
  }
  get fItemFormArray(): FormArray {
    return this.invoiceForm.get("items") as FormArray;
  }
  get sItemFormArray(): FormArray {
    return this.invoiceForm.get("sitem") as FormArray;
  }
  // get BOMitemFormArray():FormArray{
  //   return this.invoiceForm.get("bomitem") as FormArray;
  // }
}

