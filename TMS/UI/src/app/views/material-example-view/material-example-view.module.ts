import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MaterialExampleViewRoutingModule } from './material-example-view-routing.module';
import { MaterialExampleViewComponent } from './material-example-view.component';
import { MaterialExamplesModule } from 'assets/examples/material/material-examples.module';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';

@NgModule({
  declarations: [MaterialExampleViewComponent],
  imports: [
    CommonModule,
    SharedComponentsModule,
    MaterialExamplesModule,
    MaterialExampleViewRoutingModule
  ]
})
export class MaterialExampleViewModule { }
