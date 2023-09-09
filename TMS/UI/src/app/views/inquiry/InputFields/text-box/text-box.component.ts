import { FieldVM } from './../../Models/models/fieldVm';
import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FieldConfig } from '../Models/FieldConfig';

@Component({
  selector: 'app-TextBox',
  template: `
    <div class="fieldContainer" style="min-width: 400px;">
        <mat-form-field class="demo-full-width" [formGroup]="group"  fxFlex="100%">
          <input
            matInput
            [formControlName]="field.title" [required]=field.isRequired
            [placeholder]="field.title"
           
          />

          <!-- <ng-container
            *ngFor="let validation of field.validations"
            ngProjectAs="mat-error"
          >
            <mat-error
              *ngIf="group.get(field.name).hasError(validation.name)"
              >{{ validation.message }}</mat-error
            >
          </ng-container> -->
        </mat-form-field>
    </div>
  `,
  styles: [],
})
export class TextBoxComponent implements OnInit {
  field: FieldVM;
  group: FormGroup;
  constructor() {}
  ngOnInit() {}
}
