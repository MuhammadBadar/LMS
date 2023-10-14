import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManageAttendanceComponent } from '../att/manage-attendance/manage-attendance.component';

const routes: Routes = [
  {
    path: "Attendance",
    component: ManageAttendanceComponent,
    pathMatch: "full"
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AttRoutingModule {
 
 }
