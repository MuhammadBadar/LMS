import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FieldVM } from '../../Models/models/fieldVm';

@Component({
  selector: 'app-text-area',
  template: `
  <div class="fieldContainer" style="min-width: 500px;">
      <mat-form-field class="demo-full-width" [formGroup]="group"  fxFlex="100%">
        <textarea
          matInput
          [formControlName]="field.title" [required]=field.isRequired
          [placeholder]="field.title"
         
        ></textarea>

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
export class TextAreaComponent implements OnInit {
  field: FieldVM;
  group: FormGroup;
  constructor() { }

  ngOnInit(): void {
  }

}
