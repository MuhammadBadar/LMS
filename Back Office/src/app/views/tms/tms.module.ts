
import { CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA } from '@angular/core';
import {  DatePipe } from '@angular/common';
// import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card';
import { MatStepperModule } from '@angular/material/stepper';
import { MatIconModule } from '@angular/material/icon';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatTreeModule } from '@angular/material/tree';
import { MatTableModule } from '@angular/material/table';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatSortHeader, MatSortHeaderIntl, MatSortModule } from '@angular/material/sort';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatPaginatorModule } from '@angular/material/paginator';
import {
  AccordionModule,
  BadgeModule,
  BreadcrumbModule,
  ButtonModule,
  CardModule,
  CarouselModule,
  CollapseModule,
  DropdownModule,
  FormModule,
  GridModule,
  ListGroupModule,
  ModalModule,
  NavModule,
  PaginationModule,
  PlaceholderModule,
  PopoverModule,
  ProgressModule,
  SharedModule,
  SpinnerModule,
  TableModule,
  TabsModule,
  TooltipModule,
  UtilitiesModule,


} from '@coreui/angular';

import { IconModule } from '@coreui/icons-angular';
import { MatTooltip, MatTooltipModule } from '@angular/material/tooltip';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule } from '@angular/common/http';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDialogModule } from '@angular/material/dialog';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import {
  NgxMatDatetimePickerModule,
  NgxMatNativeDateModule
} from '@angular-material-components/datetime-picker';
import { MatMomentDateModule } from '@angular/material-moment-adapter';
import { NgxMatTimepickerModule } from 'ngx-mat-timepicker';

// import { MatDatepickerModule } from '@matheo/datepicker';
// import { MatNativeDateModule } from '@matheo/datepicker/core';
//import { TmsRoutingModule } from './tms-routing.module';
import { MatToolbarModule } from '@angular/material/toolbar';
// import { QuillModule } from 'ngx-quill';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TMSRoutingModule } from './tms-routing.module';
import { ManageTaskComponent } from './manage-task/manage-task.component';
import  { CreateNotificationTemplateComponent }  from './manage-notification-template/create-notification-template/create-notification-template.component';
import { ManageNotificationTemplateComponent } from './manage-notification-template/manage-notification-template.component';
 //import { AddCommentsComponent } from './tasks-list/Comments-List/add-comment/add-comment.component';
 import { CommentsListComponent } from './tasks-list/Comments-List/comments-list.component';
import { AddCommentComponent } from './tasks-list/Comments-List/add-comment/add-comment.component';
import { TasksListComponent } from './tasks-list/tasks-list/tasks-list.component';
import { SearchComponent } from './tasks-list/Comments-List/search/search.component';
import { CdkTableModule } from '@angular/cdk/table';
import { RouterModule } from '@angular/router';
import { from } from 'rxjs';
import {MatMenuModule} from '@angular/material/menu';
import { MatDividerModule } from '@angular/material/divider';
@NgModule({
  declarations: [
         ManageTaskComponent,
        TasksListComponent,
        CreateNotificationTemplateComponent,
        ManageNotificationTemplateComponent,
        // AddCommentComponent,
         CommentsListComponent,
        AddCommentComponent,
        SearchComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    //QuillModule.forRoot(),
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
    FlexLayoutModule,
    MatMenuModule,
    TMSRoutingModule,
    MatDividerModule,
    MatIconModule,
    CdkTableModule,
    MatTableModule,
    CommonModule,
    ReactiveFormsModule,
    FlexLayoutModule,
    FormsModule,
    //QuillModule,
    NgxMatDatetimePickerModule,
      MatDatepickerModule,
    NgxMatTimepickerModule,
     NgxMatNativeDateModule,
      FlexLayoutModule,
      FormsModule,
      MatDialogModule,
      MatDatepickerModule,
      MatNativeDateModule,
      MatMomentDateModule,
      MatTableModule,
      MatDialogModule,
      MatAutocompleteModule,
      MatFormFieldModule,
      MatSortModule,
      MatInputModule,
      MatButtonModule,
      MatInputModule,
      MatSnackBarModule,
      HttpClientModule,
      FlexLayoutModule,
      FormsModule,
      MatTooltipModule,
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
      MatTableModule,
      MatSortModule,
      MatPaginatorModule,
      ReactiveFormsModule,
      CommonModule,
      TMSRoutingModule,
      AccordionModule,
      BadgeModule,
      BreadcrumbModule,
      ButtonModule,
      CardModule,
      CollapseModule,
      GridModule,
      UtilitiesModule,
      SharedModule,
      ListGroupModule,
      IconModule,
      ListGroupModule,
      PlaceholderModule,
      ProgressModule,
      SpinnerModule,
      TabsModule,
      NavModule,
      TooltipModule,
      CarouselModule,
      FormModule,
      DropdownModule,
      PaginationModule,
      PopoverModule,
      ModalModule,
      TableModule,
      MatToolbarModule,
      MatProgressSpinnerModule
    
    
  ],
 providers: [DatePipe],
 schemas: [CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA]
})
export class TMSModule { }

