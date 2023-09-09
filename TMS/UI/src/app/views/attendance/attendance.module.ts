import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { DailyReportComponent } from './daily-report/daily-report.component';
import { AttendanceRoutingModule } from './attendace-routing.module';
import { SecurityRoutingModule } from '../security/security-routing.module';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MarkAttendanceDialogComponent } from './mark-attendance-dialog/mark-attendance-dialog.component';
import { SignOutDialogComponent } from './sign-out-dialog/sign-out-dialog.component';
import { LogEventComponent } from './log-event/log-event.component';
import { LoginComponent } from './login/login.component';
import { HeaderComponent } from './header/header.component';
import { AuthorizationCheck } from './AuthorizationCheck';


@NgModule({
  declarations: [ DailyReportComponent, MarkAttendanceDialogComponent, SignOutDialogComponent, LogEventComponent, LoginComponent, HeaderComponent],
  imports: [
    CommonModule,
    AttendanceRoutingModule,
    SharedMaterialModule,
    ReactiveFormsModule,
    SharedComponentsModule,
    FlexLayoutModule,
    FormsModule
    
  ],
  providers: [
    DatePipe,
    AuthorizationCheck,
  ]
})
export class AttendanceModule { }
