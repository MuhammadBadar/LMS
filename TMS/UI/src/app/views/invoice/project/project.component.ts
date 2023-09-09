

import { FormControl, FormGroup ,FormArray, FormBuilder} from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { Component, OnInit, ChangeDetectorRef, ChangeDetectionStrategy } from "@angular/core";
import { Invoice, InvoiceItem ,InvoiceItems} from 'app/shared/models/invoice.model';
import { InvoiceService } from "../invoice.service";
import { X } from '@angular/cdk/keycodes';

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
  selector: 'app-project',
  templateUrl: './project.component.html',
  styleUrls: ['./project.component.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  
  
})


export class ProjectComponent implements OnInit {
 
  invocieId: number;
  invoice: Invoice = {
    items: []
  };

  constructor( 
    private fb: FormBuilder,
    private cdr: ChangeDetectorRef,
    private invoiceService: InvoiceService) { }

  ngOnInit(): void {
    
  }
  saveInvoice(){

  }
  getInvoice() {
    this.invoiceService.getInvoiceById(this.invocieId).subscribe((invoice: Invoice) => {
      this.invoice = invoice;
      this.buildInvoiceForm(this.invoice);
      //this.calculateCost(this.invoice);
      this.cdr.markForCheck();
    });
  }
  buildInvoiceForm(invoice?: Invoice){
    this.invoiceForm = this.fb.group({
      items: this.fb.array([])
    });
    this.invoice.items.forEach(x => {
      this.addNewItem(x);
    });
  }
  emptyFormObjects: InvoiceItems = {
    
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
  };
  invoiceForm: FormGroup;
 
  Deliverable: Deliverables[] = [
    {value: 'internal-0', viewValue: 'Internal'},
    {value: 'external-1', viewValue: 'External'},
    
    
  ];
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

  Reference =new FormControl();
  RefereneceList:string[]=['a','b','c','d'];


  Task =new FormControl();
  TaskList:string[]=['a','b','c','d'];

  get projectItemFormArray(): FormArray {
    return this.invoiceForm.get("items") as FormArray;
  }
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

  addNewItem(items: InvoiceItems) {
    this.projectItemFormArray.push(
      this.fb.group({
       
        InvoiceItemId: [items?items.InvoiceItemId:''],
        InvoiceStageId: [items?items.InvoiceStageId:''],
        ItemGroupId: [items?items.ItemGroupId:''],
        ItemType: [items?items.ItemType:''],
        ItemCategory: [items?items.ItemCategory:''],
        ItemName: [items?items.ItemName:''],
        SKU: [items?items.SKU:''],
        Qty: [items?items.Qty:''],
        UOM: [items?items.UOM:''],
        Currency: [items?items.Currency:''],
        UnitPrice: [items?items.UnitPrice:''],
        LineTotal: [items?items.LineTotal:''],
      })
    );
  }
  deleteItemFromInvoice(x: number) {
    this.projectItemFormArray.removeAt(x);
  }
  
}
