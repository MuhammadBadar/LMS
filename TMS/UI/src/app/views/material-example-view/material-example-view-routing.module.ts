import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { MaterialExampleViewComponent } from "./material-example-view.component";
import { EgretExampleViewerTemplateComponent } from "app/shared/components/example-viewer-template/example-viewer-template.component";
import {
  MATERIAL_EXAMPLE_COMPONENT_MAP,
  MATERIAL_EXAMPLE_COMPONENTS
} from "assets/examples/material";

const routes: Routes = [
  {
    path: ":id",
    component: MaterialExampleViewComponent,
    children: [
      {
        path: "",
        component: EgretExampleViewerTemplateComponent,
        data: {
          map: MATERIAL_EXAMPLE_COMPONENT_MAP,
          components: MATERIAL_EXAMPLE_COMPONENTS,
          path: "assets/examples/material/"
        }
      }
    ],
    data: { title: "Material", breadcrumb: "UI Kits" }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MaterialExampleViewRoutingModule {}
