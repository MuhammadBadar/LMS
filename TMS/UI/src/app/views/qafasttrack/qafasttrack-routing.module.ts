
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { ManageCompanyComponent } from "./manage-company/manage-company.component";

const routes: Routes = [
    {
        path: "mngCom",
        component: ManageCompanyComponent,
        pathMatch: "full"
      },
    ]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class QAFastTrackRoutingModule {}