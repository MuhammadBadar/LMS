
import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { QuillModule } from 'ngx-quill';
//import { LoginComponent } from './login/login.component';
import { AssignLectureToStudentComponent } from './assign-lecture-to-student/assign-lecture-to-student.component';
import { LecturesComponent } from './lectures/lectures.component';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { LMSRoutingModule } from './lms-routing.module';
import { RegisterDialogComponent } from './student-registration/register-dialog/register-dialog.component';
import { StudentRegistrationComponent } from './student-registration/student-registration.component';
import { AddLectureComponent } from './lectures/add-lecture/add-lecture.component';
import { AssignLectureDialogComponent } from './assign-lecture-to-student/assign-lecture-dialog/assign-lecture-dialog.component';
import { LoginComponent } from './login/login.component';
import { StudentLecturesComponent } from './student-lectures/student-lectures.component';
import { NgxDatatableModule } from '@swimlane/ngx-datatable';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatCardModule } from '@angular/material/card';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatRadioModule } from '@angular/material/radio';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatStepperModule } from '@angular/material/stepper';
import { FileUploadModule } from 'ng2-file-upload';
import { CdkTableModule } from '@angular/cdk/table';
import { MatTableModule } from '@angular/material/table';
//import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { HeaderComponent } from './header/header.component';
import { AuthorizationCheck } from './AuthorizationCheck';


@NgModule({
  declarations: [ StudentRegistrationComponent,AssignLectureToStudentComponent,
     LecturesComponent, RegisterDialogComponent, AddLectureComponent,
       AssignLectureDialogComponent, LoginComponent,
       StudentLecturesComponent, 
        HeaderComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  imports: [
    CommonModule,
   // BrowserAnimationsModule,
    LMSRoutingModule,
    SharedMaterialModule,
    ReactiveFormsModule,
    SharedComponentsModule,
    FlexLayoutModule,
    FormsModule,
    QuillModule,
    NgxDatatableModule,
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
    CdkTableModule,
    MatTableModule,
   
  ],
  providers: [
    DatePipe,
    AuthorizationCheck]
})
export class LmsModule { }
