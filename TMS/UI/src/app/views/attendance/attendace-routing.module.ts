
import { LogEventComponent } from './log-event/log-event.component';
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { DailyReportComponent } from "./daily-report/daily-report.component";
import { LoginComponent } from './login/login.component';
import { AuthorizationCheck } from './AuthorizationCheck';

const routes: Routes = [
  {
    path: "daily",
    component: DailyReportComponent,
    pathMatch: "full",
    canActivate: [AuthorizationCheck]
  },
  {
    path: "login",
    component: LoginComponent,
    pathMatch: "full"
  },
  {
    path: "logevent",
    component: LogEventComponent,
    pathMatch: "full",
    canActivate: [AuthorizationCheck]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AttendanceRoutingModule {}

