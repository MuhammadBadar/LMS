
import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FieldVM } from '../../Models/models/fieldVm';
import { FieldConfig } from '../Models/FieldConfig';
@Component({
  selector: 'app-DropDownList',
  template: `
  <div  style="min-width: 500px;">
    <mat-form-field class="demo-full-width margin-top" [formGroup]="group"  fxFlex="100%">
      <mat-select [placeholder]="field.title" [formControlName]="field.title" [required]=field.isRequired>
        <mat-option *ngFor="let item of field.fpv" [value]="item.fieldValue">{{
          item.fieldValue
        }}</mat-option>
      </mat-select>
    </mat-form-field>
    </div>
  `,
  styles: [],
})
export class ListComponent implements OnInit {
  field: FieldVM;
  group: FormGroup;
  constructor() {}
  ngOnInit() {}
}

