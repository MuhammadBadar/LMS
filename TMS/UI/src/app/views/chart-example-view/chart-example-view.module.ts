import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ChartExampleViewRoutingModule } from './chart-example-view-routing.module';
import { ChartExampleViewComponent } from './chart-example-view.component';
import { ChartExamplesModule } from 'assets/examples/chart/chart-examples.module';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';

@NgModule({
  declarations: [ChartExampleViewComponent],
  imports: [
    CommonModule,
    ChartExamplesModule,
    SharedComponentsModule,
    ChartExampleViewRoutingModule
  ]
})
export class ChartExampleViewModule { }
