
import { RegisterDialogComponent } from './student-registration/register-dialog/register-dialog.component';
import { StudentLecturesComponent } from './student-lectures/student-lectures.component';
import { LoginComponent } from './login/login.component';
import { AssignLectureToStudentComponent } from "./assign-lecture-to-student/assign-lecture-to-student.component";
import { StudentRegistrationComponent } from "./student-registration/student-registration.component";
import { Routes, RouterModule } from "@angular/router";
import { LecturesComponent } from "./lectures/lectures.component";
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { AuthorizationCheck } from './AuthorizationCheck';
const routes: Routes = [
    {
      path: "assignlec",
      component: AssignLectureToStudentComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck]
    },
    {
      path: "login",
      component: LoginComponent,
      pathMatch: "full"
    }
    ,
    {
      path: "studentlec",
      component: StudentLecturesComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck]
    },
    {
        path: "lecture",
        component: LecturesComponent,
        pathMatch: "full",
        canActivate: [AuthorizationCheck]
      },
    {
      path: "stdregistration",
      component: StudentRegistrationComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck]
    },
    {
      path: "student",
      component: RegisterDialogComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck]
    }
    
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class LMSRoutingModule {}