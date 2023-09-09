import { TextAreaComponent } from './text-area/text-area.component';
import { RadioButtonComponent } from './radio-button/radio-button.component';
import { FieldVM } from './../Models/models/fieldVm';
import { ListComponent } from './list/list.component';
import { TextBoxComponent } from './text-box/text-box.component';
import {
    ComponentFactoryResolver,
    ComponentRef,
    Directive,
    Input,
    OnInit,
    ViewContainerRef,
  } from '@angular/core';
  import { FormGroup } from '@angular/forms';

import { DateComponent } from './date/date.component';
import { FieldConfig } from './Models/FieldConfig';
  
  const componentMapper = {
    TextBox: TextBoxComponent,
    DropDownList: ListComponent,
    DatePicker: DateComponent,
    RadioButton:RadioButtonComponent,
    TextArea:TextAreaComponent

  };
  @Directive({
    selector: '[dynamicField]',
  })
  export class DynamicFieldDirective implements OnInit {
    @Input() field: FieldVM;
    @Input() group: FormGroup;
    componentRef: any;
    constructor(
      private resolver: ComponentFactoryResolver,
      private container: ViewContainerRef
    ) {}
    ngOnInit() {
     // if (factoryClass != undefined) this.viewContainerRef.createComponent(factoryClass);
      const factory = this.resolver.resolveComponentFactory(
        componentMapper[this.field.type]
      );
      if (factory !== undefined) this.componentRef = this.container.createComponent(factory);
      
      this.componentRef.instance.field = this.field;
      console.warn( this.componentRef.instance.field)
      this.componentRef.instance.group = this.group;
    }
  }
  