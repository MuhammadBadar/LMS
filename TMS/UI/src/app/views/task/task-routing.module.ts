
import { LoginComponent } from './../task/login/login.component';
import { CreateNotificationTemplateComponent } from './manage-notification-template/create-notification-template/create-notification-template.component';
import { ManageNotificationTemplateComponent } from './manage-notification-template/manage-notification-template.component';
import { TasksListComponent } from './tasks-list/tasks-list.component';
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ManageTasksComponent } from './manage-tasks/manage-tasks.component';
import { AuthorizationCheck } from './AuthorizationCheck';


export const TaskRoutes: Routes = [
  {
    path: "login",
    component: LoginComponent,
    pathMatch: "full",
   // data: { title: 'Manage Task', breadcrumb: 'Manage Task' },
  },
  {
    path: "managetasks",
    component: ManageTasksComponent,
    pathMatch: "full",
    canActivate: [AuthorizationCheck],
    
    // data: { title: 'Manage Task', breadcrumb: 'Manage Task' },
  },
  {
    path: "manageTemplate",
    component: ManageNotificationTemplateComponent,
    pathMatch: "full",
    canActivate: [AuthorizationCheck],
  
  },
  {
    path: "createTemplate",
    component: CreateNotificationTemplateComponent,
    pathMatch: "full",
    canActivate: [AuthorizationCheck],
  
  },
  {
    path: "taskslist",
    component: TasksListComponent,
    pathMatch: "full",
    canActivate: [AuthorizationCheck],
   
  
  }
];

@NgModule({
  imports: 
  [
    
    RouterModule.forChild(TaskRoutes)],
  exports: [RouterModule]
})
export class TaskRoutingModule {}