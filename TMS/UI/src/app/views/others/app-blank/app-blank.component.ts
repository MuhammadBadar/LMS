import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { FileUploader } from 'ng2-file-upload';
import{MatSelectModule} from '@angular/material/select';
import { ActivatedRoute, Router } from "@angular/router";
import {  ChangeDetectorRef, ChangeDetectionStrategy } from "@angular/core";



export interface POItem {
  isSelected: string;
  LineTotal: number;
  PurchasePrice: number;
  currency: string;
  SKU: number;
  InventoryItemId: number;
  ItemCategary: string;
  ItemType: string;
  ItemGroup: string;
  QuantityLimit: number;
  POItemId: number;
  uom: string;
  quantity: number;
  id? ;
}
@Component({
  selector: 'app-blank',
  templateUrl: './app-blank.component.html',
  styleUrls: ['./app-blank.component.css']
})
export class AppBlankComponent implements 
  OnInit {
  basicForm:FormGroup 
  FormsModule
  basicform:MatSelectModule
  public uploader: FileUploader = new FileUploader({ url: 'https://evening-anchorage-315.herokuapp.com/api/' });
  public hasBaseDropZoneOver: boolean = false;
  console = console;
  constructor(private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    
    private cdr: ChangeDetectorRef)  { }
  purchaseOrderForm: FormGroup
 
  
  shipTo =["ABC company","JHG Empires","CBH Company"]
  billTo =["ABC company","JHG Empires","CBH Company"]
  ItemGroup =["ABC ","JHG ","CBH "]
  ItemCategary =["ABC ","JHG ","CBH "]
  ItemType=["ABC ","JHG ","CBH "]
  Currency=["$ ","# "]
  isSelected=["Yes ","No "]
  status =["Open","Hold","Cancelled","Close"]
  uom =["Second","Kilometer"]
  

  ngOnInit() {

    this.purchaseOrderForm = new FormGroup({
      isAgainstRFQ: new FormControl(),
      venderName:new FormControl(),
      isReference:new FormControl(),
      RFQ:new FormControl(),
      shipTo:new FormControl(),
      billTo:new FormControl(),
      status:new FormControl(),
      deliveryDate:new FormControl(),
      paymentTerms:new FormControl(),
      description:new FormControl(),
      item: this.fb.array([])
   });
  }

  public fileOverBase(e: any): void {
    this.hasBaseDropZoneOver = e;
  }
  
  addNewItem(item: POItem) {
    this.POArray.push(
      this.fb.group({
        POItemId: [item?item.POItemId:''],
        QuantityLimit: [item?item.QuantityLimit:''],
        ItemGroup: [item?item.ItemGroup:''],
        ItemType: [item?item.ItemType:''],
        ItemCategary:[item?item.ItemCategary:''],
        InventoryItemId:[item?item.InventoryItemId:''],
        SKU:[item?item.SKU:''],
        quantity:[item?item.quantity:''],
        uom: [item ? item.uom : ''],
        
        currency:[item?item.currency:''],
        PurchasePrice:[item?item.PurchasePrice:''],
        LineTotal:[item?item.LineTotal:''],
        isSelected:[item?item.isSelected:'']

      })
    );
  }
  
  deleteItem(i: number) {
    this.POArray.removeAt(i);
  }

  get POArray(): FormArray {
    return this.purchaseOrderForm.get("item") as FormArray;
  }
  
  emptyFormObject: POItem = {
    isSelected: "",
  LineTotal: null,
  PurchasePrice: null,
  currency: "",
  SKU: null,
  InventoryItemId: null,
  ItemCategary: "",
  ItemType: "",
  ItemGroup: "",
  QuantityLimit: null,
  POItemId: null,
  uom: "",
  quantity: null,
  id :null
  }
}
