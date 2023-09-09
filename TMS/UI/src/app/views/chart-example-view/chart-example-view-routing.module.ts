import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ChartExampleViewComponent } from './chart-example-view.component';
import { EgretExampleViewerTemplateComponent } from 'app/shared/components/example-viewer-template/example-viewer-template.component';
import { CHART_EXAMPLE_COMPONENT_MAP, CHART_EXAMPLE_COMPONENTS } from 'assets/examples/chart';

const routes: Routes = [
  {
    path: ":id",
    component: ChartExampleViewComponent,
    children: [
      {
        path: "",
        component: EgretExampleViewerTemplateComponent,
        data: {
          map: CHART_EXAMPLE_COMPONENT_MAP,
          components: CHART_EXAMPLE_COMPONENTS,
          path: "assets/examples/chart/"
        }
      }
    ],
    data: { title: "Chart", breadcrumb: "Chart" }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ChartExampleViewRoutingModule { }
