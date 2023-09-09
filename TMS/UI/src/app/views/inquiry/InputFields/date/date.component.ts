
import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FieldVM } from '../../Models/models/fieldVm';
import { FieldConfig } from '../Models/FieldConfig';
@Component({
  selector: 'app-DatePicker',
  template: `
  <div  style="min-width: 400px;">
    <mat-form-field class="demo-full-width margin-top" [formGroup]="group"  fxFlex="100%" >
      <input
        matInput
        [matDatepicker]="picker"
        [formControlName]="field.title"
        [placeholder]="field.title"
        [required]=field.isRequired
      />
      <mat-datepicker-toggle matSuffix [for]="picker"></mat-datepicker-toggle>
      <mat-datepicker #picker></mat-datepicker>
      <mat-hint></mat-hint>
      <!-- <ng-container
        *ngFor="let validation of field.validations"
        ngProjectAs="mat-error"
      >
        <mat-error *ngIf="group.get(field.name).hasError(validation.name)">{{
          validation.message
        }}</mat-error>
      </ng-container> -->
    </mat-form-field>
    </div>
  `,
  styles: [],
})
export class DateComponent implements OnInit {
  field: FieldVM;
  group: FormGroup;
  constructor() {}
  ngOnInit() {}
}

