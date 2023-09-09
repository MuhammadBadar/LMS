import { MatMenuModule } from '@angular/material/menu';
import { NgModule } from '@angular/core';
//import { AngularEditorModule } from '@kolkov/angular-editor';
//import { AngularEditorConfig } from '@kolkov/angular-editor';

import { CommonModule, DatePipe } from '@angular/common';
import { TasksListComponent } from './tasks-list/tasks-list.component';
import {TaskRoutes, TaskRoutingModule} from './task-routing.module';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatNativeDateModule } from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatRadioModule } from '@angular/material/radio';
import { MatStepperModule } from '@angular/material/stepper';
import { FlexLayoutModule } from '@angular/flex-layout';
import { QuillModule } from 'ngx-quill';
import { NgxDatatableModule } from '@swimlane/ngx-datatable';
import { FileUploadModule } from 'ng2-file-upload';
import{MatSelectModule} from '@angular/material/select';
import { CommentsListComponent } from './tasks-list/comments-list/comments-list.component';
import { AddCommentComponent } from './tasks-list/comments-list/add-comment/add-comment.component';
import { CdkTableModule} from '@angular/cdk/table';
import {DataSource} from '@angular/cdk/table';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { MatTableModule } from '@angular/material/table';
import { SearchComponent } from './tasks-list/search/search.component';
import { ManageTasksComponent } from './manage-tasks/manage-tasks.component';
import { ManageNotificationTemplateComponent } from './manage-notification-template/manage-notification-template.component';
import { CreateNotificationTemplateComponent } from './manage-notification-template/create-notification-template/create-notification-template.component';
import { LoginComponent } from './login/login.component';

import { HeaderComponent } from './header/header.component';
import { AuthorizationCheck } from './AuthorizationCheck';
@NgModule({
  
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  imports: [
    CommonModule,
   // AngularEditorModule,
    FormsModule,
    MatMenuModule,
    ReactiveFormsModule,
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
    FlexLayoutModule,
    QuillModule,
    NgxDatatableModule,
    FileUploadModule,
    TaskRoutingModule,
    CdkTableModule,
    MatTableModule,
    CommonModule,
    SharedMaterialModule,
    ReactiveFormsModule,
    SharedComponentsModule,
    FlexLayoutModule,
    FormsModule,
    RouterModule.forChild(TaskRoutes)
    
  ],
  declarations: [ TasksListComponent, CommentsListComponent, AddCommentComponent, SearchComponent, ManageTasksComponent, ManageNotificationTemplateComponent, CreateNotificationTemplateComponent, LoginComponent, HeaderComponent],
  providers:[
    DatePipe,
     AuthorizationCheck,
     
  ]
})
export class TaskModule {}
