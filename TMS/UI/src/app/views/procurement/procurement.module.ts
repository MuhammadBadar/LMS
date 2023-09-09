import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ManageCustomerComponent } from './manage-customer/manage-customer.component';
import { ProcurementRoutingModule } from './procurement-routing.module';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { CustomerListComponent } from './customer-list/customer-list.component';
import { ManageItemComponent } from './manage-item/manage-item.component';
import { ItemListComponent } from './item-list/item-list.component';
import { SaleOrderComponent } from './sale-order/sale-order.component';
import { SaleInvoiceComponent } from './sale-invoice/sale-invoice.component';
import { SaleReportComponent } from './sale-report/sale-report.component';
import { InvoicesReportComponent } from './invoices-report/invoices-report.component';
import { CustomerLedgerComponent } from './customer-ledger/customer-ledger.component';
import { OrderListComponent } from './sale-order/order-list/order-list.component';
import { EditCustomerComponent } from './manage-customer/edit-customer/edit-customer.component';
import { MatTableModule } from '@angular/material/table';
import { MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { DateFilterComponent } from './sale-order/date-filter/date-filter.component';



@NgModule({
  declarations: [ManageCustomerComponent, CustomerListComponent, ManageItemComponent, ItemListComponent, SaleOrderComponent, SaleInvoiceComponent, SaleReportComponent, InvoicesReportComponent, CustomerLedgerComponent, OrderListComponent, EditCustomerComponent, DateFilterComponent],
  imports: [
    CommonModule,
 
    MatAutocompleteModule,
    ProcurementRoutingModule,
    SharedMaterialModule,
    ReactiveFormsModule,
    SharedComponentsModule,
    FlexLayoutModule,
    FormsModule,
    MatTableModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatInputModule
  ]
})
export class ProcurementModule { }
