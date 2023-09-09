
import {
    Component,
    EventEmitter,
    Input,
    OnChanges,
    OnInit,
    Output,
  } from '@angular/core';
  import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { FieldVM } from '../Models/models/fieldVm';
import { FieldConfig } from './Models/FieldConfig';
 
  
  @Component({
    exportAs: 'dynamicForm',
    selector: 'dynamic-form',
    template: `
      <form class="dynamic-form" [formGroup]="form"    >
<div >
        <ng-container    style=" display: grid"
          *ngFor="let field of fields"
          dynamicField
          [field]="field"
          [group]="form"
        >
        </ng-container>
        </div>
      </form>
    `,
    styles: [],
  })
  export class DynamicFormComponent implements OnInit {
    @Input() fields: FieldVM[] = [];
  
    @Output() submit: EventEmitter<any> = new EventEmitter<any>();
  
    form: FormGroup;
  
    get value() {
      return this.form.value;
    }
    constructor(private fb: FormBuilder) {}
  
    ngOnInit() {
      this.form = this.createControl();
    }
    createControl() {
      const group = this.fb.group({});
      this.fields.forEach((field) => {
       // if (field.type === 'button') return;
        const control = this.fb.control(
          field.value
         // this.bindValidations(field.validations || [])
        );
        group.addControl(field.title, control);
      });
      return group;
    }
  }
  