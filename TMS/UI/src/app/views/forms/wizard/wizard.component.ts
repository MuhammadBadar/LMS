import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormBuilder, FormArray } from '@angular/forms';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";
import{MatSelectModule} from '@angular/material/select';
import {  ChangeDetectorRef, ChangeDetectionStrategy } from "@angular/core";
import { Invoice } from 'app/shared/models/invoice.model';
import { CustomValidators } from 'ngx-custom-validators';

export interface Discount {
  value: string;
  viewValue: string;
}

export interface QuotationItem {
  shipmentCharges: number;
  discvalue: number;
  totaldiscvalue: number;
  disMethod: string;
  uom: any;
  iname: string;
  quantity: number;
  quotedPrice: number;
  id? ;
}
@Component({
  selector: 'app-wizard',
  templateUrl: './wizard.component.html',
  styleUrls: ['./wizard.component.css']
})

export class WizardComponent implements OnInit {
  basicForm:FormGroup 
  FormsModule
  basicform:MatSelectModule
 
  formData = {}
  console = console;
  quotationForm: FormGroup;
  checked = false;
  indeterminate = false;
  indeterminate1 = false;
  indeterminate2 = false;
  
  DiscountType: Discount[] = [
    {value: 'abc-type', viewValue: 'ABC Type'},
    {value: 'jff-type', viewValue: 'JFF Type'},
    {value: 'xyz-type', viewValue: 'XYZ Type'}
  ];
  shipTo =["ABC company","JHG Empires","CBH Company"]
  applyDiscount =["discount1","discount2","discount3"]
  status =["Open","Hold","Cancelled","Close"]
  uom =["Second","Kilometer"]
  delieveryMethod =["ABC ","JHG ","CBH "]
  labelPosition = 'after';
  disabled = false;

  
  
  emptyFormObject: QuotationItem = {
    iname: "",
    quantity: null,
    quotedPrice: null,
    uom: null,
    disMethod: "",
    discvalue: 0,
    totaldiscvalue: 0,
    shipmentCharges: 0
  };
  addNewItem(item: QuotationItem) {
    this.quotationArray.push(
      this.fb.group({
        iname: [item?item.iname:''],
        quotedPrice: [item?item.quotedPrice:''],
        quantity: [item?item.quantity:''],
        uom: [item?item.uom:''],
        disMethod:[item?item.disMethod:''],
        discvalue:[item?item.discvalue:''],
        totaldiscvalue:[item?item.totaldiscvalue:''],
        shipmentCharges:[item?item.shipmentCharges:'']

      })
    );
  }
  add( a: any,  b: any)
  {
  return parseInt(a)+parseInt(b);

  }
  deleteItem(i: number) {
    this.quotationArray.removeAt(i);
  }

  get quotationArray(): FormArray {
    return this.quotationForm.get("item") as FormArray;
  }

  constructor(private fb: FormBuilder) { }
  ngOnInit() {
    this.quotationForm = new FormGroup({
      qtitle: new FormControl(),
      cname:new FormControl(),
      status:new FormControl(),
      quoteValidity:new FormControl(),
      applyDiscount:new FormControl(),
      discountnumber:new FormControl(),
      discountType:new FormControl(),
      discountMethod:new FormControl(),
      shipTo:new FormControl(),
      deliveryDate:new FormControl(),
      delieveryMethod:new FormControl(),
      description:new FormControl(),
      item: this.fb.array([])
   });
   
  }
  
}