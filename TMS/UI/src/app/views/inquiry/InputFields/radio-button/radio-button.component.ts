import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FieldVM } from '../../Models/models/fieldVm';
import { FieldConfig } from '../Models/FieldConfig';
@Component({
  selector: 'app-RadioButton',
  template: `
    <div class="fieldContainer"  style="min-width: 500px;">
        <div class="demo-full-width margin-top" [formGroup]="group">
          <label class="radio-label-padding">{{ field.title }}:</label>
          <mat-radio-group [formControlName]="field.title" [required]=field.isRequired>
            <mat-radio-button style="margin-left:30px"
              *ngFor="let item of field.fpv"
              [value]="item.fieldValue"
              >{{ item.fieldValue }}</mat-radio-button
            >
          </mat-radio-group>
        </div>
    </div>
  `,
  styles: [],
})
export class RadioButtonComponent implements OnInit {
  field: FieldVM;
  group: FormGroup;
  constructor() {}
  ngOnInit() {
    console.warn('i am from radio component')
  }
}
