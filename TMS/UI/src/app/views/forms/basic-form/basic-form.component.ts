import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { FormGroup,FormBuilder,FormsModule, FormControl, Validators } from '@angular/forms';
import { CustomValidators } from 'ngx-custom-validators';
import { ActivatedRoute, Router } from "@angular/router";
import{MatSelectModule} from '@angular/material/select';
import { Component, OnInit, ChangeDetectorRef, ChangeDetectionStrategy } from "@angular/core";

export interface Ageds {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-basic-form',
  templateUrl: './basic-form.component.html',
  styleUrls: ['./basic-form.component.css'],
  
   
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class BasicFormComponent implements OnInit {
  basicForm:FormGroup 
  FormsModule
  basicform:MatSelectModule
  constructor(private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    
    private cdr: ChangeDetectorRef) { }
onSubmit(){

}

  ngOnInit() {
    this.basicForm=new FormGroup({
   aged:new FormControl(),
   daysoverdue:new FormControl(),
   due:new FormControl(),
   paid:new FormControl(),
   duedate:new FormControl(),
   amount:new FormControl(),
   po:new FormControl(),
   name:new FormControl(),
   podate:new FormControl(),
   remaining:new FormControl(),
    })
  }
  Aged: Ageds[] = [
    {value: '0', viewValue: ' 1-30 '},
    {value: '1', viewValue: '31-60 '},
    {value: '2', viewValue: '61-90 '},
    {value: '3', viewValue: '>90'},
   
]}