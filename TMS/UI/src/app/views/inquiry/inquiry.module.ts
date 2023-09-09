import { InquiryRoutingModule } from './Inquiry-Routing-Module';
import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { ManageInquiryComponent } from './manage-inquiry/manage-inquiry.component';
import { ManageFieldComponent } from './manage-field/manage-field.component';
import { FieldPossibleValuesDialogComponent } from './field-possible-values-dialog/field-possible-values-dialog.component';
import { LoginComponent } from './login/login.component';
import { HeaderComponent } from './header/header.component';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
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
import { ManageServiceComponent } from './manage-service/manage-service.component';
import { AuthorizationCheck } from './AuthorizationCheck';
import { UserLoginComponent } from './user-login/user-login.component';
import { TextBoxComponent } from './InputFields/text-box/text-box.component';
import { DateComponent } from './InputFields/date/date.component';
import { TextAreaComponent } from './InputFields/text-area/text-area.component';
import { ListComponent } from './InputFields/list/list.component';
import { RadioButtonComponent } from './InputFields/radio-button/radio-button.component';
import { DynamicFieldDirective } from './InputFields/DynamicFieldDirective';
import { DynamicFormComponent } from './InputFields/DynamicFormComponent';
import { InquiryListComponent } from './inquiry-list/inquiry-list.component';
import { CdkDetailRowDirective } from './cdk-detail-row.directive';
import { CdkTreeModule } from '@angular/cdk/tree';
import { MatTreeModule } from '@angular/material/tree';
import { MatSortModule } from '@angular/material/sort';
import { MatPaginatorModule } from '@angular/material/paginator';


@NgModule({
  declarations: [ManageInquiryComponent,ManageFieldComponent, CdkDetailRowDirective,
    FieldPossibleValuesDialogComponent, LoginComponent, HeaderComponent,
     ManageServiceComponent, UserLoginComponent, TextBoxComponent, DateComponent,
     DynamicFieldDirective,DynamicFormComponent,
      TextAreaComponent, ListComponent, RadioButtonComponent, InquiryListComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA,NO_ERRORS_SCHEMA],
  imports: [
    MatSortModule,
    MatPaginatorModule,
    CommonModule,
    MatTreeModule,
    InquiryRoutingModule,
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
    CdkTreeModule,
  ],
  providers:[
    DatePipe,
     AuthorizationCheck
     
  ]
})
export class InquiryModule { }
