import { ManageItemComponent } from './manage-item/manage-item.component';
import { ItemListComponent } from './item-list/item-list.component';
import { ManageCustomerComponent } from "./manage-customer/manage-customer.component";
import { CustomerListComponent } from "./customer-list/customer-list.component";
import { SaleInvoiceComponent } from './sale-invoice/sale-invoice.component';
import { SaleOrderComponent } from './sale-order/sale-order.component';
import { InvoicesReportComponent } from './invoices-report/invoices-report.component';
import { SaleReportComponent } from './sale-report/sale-report.component';
import { Routes, RouterModule } from "@angular/router";
import { NgModule } from "@angular/core";
import { CustomerLedgerComponent } from './customer-ledger/customer-ledger.component';
import { OrderListComponent } from './sale-order/order-list/order-list.component';
import { EditCustomerComponent } from './manage-customer/edit-customer/edit-customer.component';
const routes: Routes = [
    {
        path: "mngCust",
        component: ManageCustomerComponent,
        pathMatch: "full"
      },
      {
        path: "editCust",
        component: EditCustomerComponent,
        pathMatch: "full"
      },
      {
        path: "custList",
        component: CustomerListComponent,
        pathMatch: "full"
      },
      {
        path: "orderList",
        component: OrderListComponent,
        pathMatch: "full"
      },
      {
        path: "itemList",
        component: ItemListComponent,
        pathMatch: "full"
      },
      {
        path: "mngItem",
        component: ManageItemComponent,
        pathMatch: "full"
      },
      {
        path: "sOrder",
        component: SaleOrderComponent,
        pathMatch: "full"
      },
      {
        path: "sInvoice",
        component: SaleInvoiceComponent,
        pathMatch: "full"
      },
      {
        path: "sReport",
        component: SaleReportComponent,
        pathMatch: "full"
      },
      {
        path: "invReport",
        component: InvoicesReportComponent,
        pathMatch: "full"
      },
      {
        path: "custLedger",
        component: CustomerLedgerComponent,
        pathMatch: "full"
      },
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class ProcurementRoutingModule {}