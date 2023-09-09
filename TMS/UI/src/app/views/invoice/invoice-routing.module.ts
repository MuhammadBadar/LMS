import { InvoiceListComponent } from "./invoice-list/invoice-list.component";
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { InvoiceDetailsComponent } from "./invoice-details/invoice-details.component";
import { ProjectComponent } from "./project/project.component";


const routes: Routes = [
  {
    path: "plist1",
    component: ProjectComponent,
    pathMatch: "full"
  },
  {
    path: "plist",
    component: ProjectComponent,
    pathMatch: "full"
  },
  {
    path: "list",
    component: InvoiceListComponent,
    pathMatch: "full"
  },
  {
    path: "add",
    component: InvoiceDetailsComponent,
    pathMatch: "full"
  },
  {
    path: ":id",
    component: InvoiceDetailsComponent,
    pathMatch: "full"
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InvoiceRoutingModule {}
