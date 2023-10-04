import { ManageUseraccountComponent } from './../security/manage-useraccount/manage-useraccount.component';
import { ManageCoursescheduleComponent } from './Schedule/manage-courseschedule/manage-courseschedule.component';
import { NO_ERRORS_SCHEMA, NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
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
  NgxMatNativeDateModule,
  NgxMatTimepickerModule
} from '@angular-material-components/datetime-picker';
import { MatMomentDateModule } from '@angular/material-moment-adapter';
import { NgxMaterialTimepickerModule } from 'ngx-material-timepicker';

// import { MatDatepickerModule } from '@matheo/datepicker';
// import { MatNativeDateModule } from '@matheo/datepicker/core';
import { LMSRoutingModule } from './lms-routing.module';
import { ManageUserComponent } from './manage-user/manage-user.component';

import { ManageCourseComponent } from './manage-course/manage-course.component';
import { ManageInquiryComponent } from './manage-inquiry/manage-inquiry.component';
import { ManageCourseDetailComponent } from './manage-course-detail/manage-course-detail.component';
import { ScheduleListComponent } from './Schedule/schedule-list/schedule-list.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { ManageTopicComponent } from './manage-topic/manage-topic.component';
import { ManageLectureComponent } from './manage-lecture/manage-lecture.component';
import { ManageVocabularyComponent } from './manage-vocabulary/manage-vocabulary.component';
import { ManageCityComponent } from './manage-city/manage-city.component';
import { ManageCityStudentComponent } from './manage-city-student/manage-city-student.component';
import { ManageStudentComponent } from './manage-student/manage-student.component';
import { ManageScheduleComponent } from './manage-schedule/manage-schedule.component';
import { ManageAssignTaskComponent } from './manage-assign-task/manage-assign-task.component';
import { ManageAttendanceComponent } from './manage-attendance/manage-attendance.component';
import { ManageUserattbydateComponent } from './manage-userattbydate/manage-userattbydate.component';
import { ManageTasksComponent } from './manage-tasks/manage-tasks.component';
import { ManageUsertaskbydateComponent } from './manage-usertaskbydate/manage-usertaskbydate.component';
import { ManageUserreportComponent } from './manage-userreport/manage-userreport.component';
import { ManagePatientComponent } from './manage-patient/manage-patient.component';
import { ManageSchComponent } from './manage-sch/manage-sch.component';
import { ManageScheduleListComponent } from './manage-schedule-list/manage-schedule-list.component';
import { ManageScheduleDayEventComponent } from './manage-schedule-day-event/manage-schedule-day-event.component';
// import { OwlDateTimeModule, OwlNativeDateTimeModule } from '@danielmoncada/angular-datetime-picker';


@NgModule({
  declarations: [
    ManageUserComponent,
    ManageCourseComponent,
    ManageCoursescheduleComponent,
    ManageInquiryComponent,
    ManageCourseDetailComponent,
    ScheduleListComponent,
    ManageTopicComponent,
    ManageAssignTaskComponent,
    ManageLectureComponent, 
    ManageVocabularyComponent,
    ManageCityComponent,
    ManageCityStudentComponent,
    ManageStudentComponent,
    ManageScheduleComponent,
    ManageAttendanceComponent,
    ManageUserattbydateComponent,
    ManageTasksComponent,
    ManageUsertaskbydateComponent,
    ManagePatientComponent,
    ManageUserreportComponent,
    ManageUseraccountComponent,
    ManageSchComponent,
    ManageScheduleListComponent,
    ManageScheduleDayEventComponent,
  ],
  imports: [
    NgxMatDatetimePickerModule,
    MatDatepickerModule,
    NgxMaterialTimepickerModule,
   // NgxMaterialTimepickerModule,
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
    NgxMatTimepickerModule,
    MatButtonModule,
    MatIconModule,
    MatStepperModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
    ReactiveFormsModule,
    CommonModule,
    LMSRoutingModule,

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
export class LMSModule { }
