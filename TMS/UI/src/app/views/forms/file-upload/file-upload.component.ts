
import { FileUploader } from 'ng2-file-upload';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { FormGroup,FormBuilder,FormsModule, FormControl, Validators } from '@angular/forms';
import { CustomValidators } from 'ngx-custom-validators';
import { ActivatedRoute, Router } from "@angular/router";
import{MatSelectModule} from '@angular/material/select';
import { Component, OnInit, ChangeDetectorRef, ChangeDetectionStrategy } from "@angular/core";
import {MomentDateAdapter, MAT_MOMENT_DATE_ADAPTER_OPTIONS} from '@angular/material-moment-adapter';
import {DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE} from '@angular/material/core';
import * as moment from 'moment';

export const MY_FORMATS = {
  parse: {
    dateInput: 'LL', 
  },
  display: {
    dateInput: 'MMMM YYYY', // this is the format showing on the input element
    monthYearLabel: 'MMMM YYYY', // this is showing on the calendar 
  },
};

@Component({
  selector: 'app-file-upload',
  templateUrl: './file-upload.component.html',
  styleUrls: ['./file-upload.component.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  providers: [
    {
      provide: DateAdapter,
      useClass: MomentDateAdapter,
      deps: [MAT_DATE_LOCALE, MAT_MOMENT_DATE_ADAPTER_OPTIONS]
    },

    {provide: MAT_DATE_FORMATS, useValue: MY_FORMATS},
  ],
})
export class FileUploadComponent implements OnInit {
 fileupload:FormGroup 
 FormsModule
 MatSelectModule
  
  
    constructor(private fb: FormBuilder,
      private route: ActivatedRoute,
      private router: Router,
      private cdr: ChangeDetectorRef

  ) { }

  ngOnInit() {
    this.fileupload= new  FormGroup({
      productionYear:new FormControl(),
      date:new FormControl(),
      CalMonth: new FormControl(moment()),
    })
  }
  openDatePicker(){

  }
  closeDatePicker(){

  }

 
}
