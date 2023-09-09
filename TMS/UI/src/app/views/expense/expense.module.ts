import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { ExpenseTypeDialogComponent } from './expense-type-dialog/expense-type-dialog.component';
import { ManageExpenseComponent } from './manage-expense/manage-expense.component';
import { LoginComponent } from './login/login.component';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { ExpenseRoutingModule } from './expense-routing-module';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { QuillModule } from 'ngx-quill';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { NgxDatatableModule } from '@swimlane/ngx-datatable';
import { MatCardModule } from '@angular/material/card';
import { MatStepperModule } from '@angular/material/stepper';
import { MatIconModule } from '@angular/material/icon';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { CdkTableModule } from '@angular/cdk/table';
import { FileUploadModule } from 'ng2-file-upload';
import { MatTableModule } from '@angular/material/table';
import { ExpenseListComponent } from './expense-list/expense-list.component';
import { ExpenseTypeListComponent } from './expense-type-list/expense-type-list.component';
import { HeaderComponent } from './header/header.component';
import { AuthorizationCheck } from './AuthrizationCheck';


@NgModule({
  declarations: [ExpenseTypeDialogComponent, ManageExpenseComponent, LoginComponent, ExpenseListComponent, ExpenseTypeListComponent, HeaderComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  imports: [
    CommonModule,
    ExpenseRoutingModule,
    SharedMaterialModule,
    ReactiveFormsModule,
    SharedComponentsModule,
    FlexLayoutModule,
    FormsModule,
    QuillModule,
    NgxDatatableModule,
    MatInputModule,
    MatListModule,
    MatCardModule,
    MatDatepickerModule, 
    MatNativeDateModule,
    MatProgressBarModule,
    MatRadioModule,
    MatSelectModule,
    MatCheckboxModule,
    MatButtonModule,
    MatIconModule,
    MatStepperModule,
    FileUploadModule,
    CdkTableModule,
    MatTableModule,
  ],
  providers:[
    DatePipe,
     AuthorizationCheck,
     
  ]
})
export class ExpenseModule { }
