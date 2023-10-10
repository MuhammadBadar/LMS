import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TasksListComponent } from './tasks-list/tasks-list/tasks-list.component';
import { ManageTaskComponent } from './manage-task/manage-task.component';
import { ManageNotificationTemplateComponent } from './manage-notification-template/manage-notification-template.component';
import { CreateNotificationTemplateComponent } from './manage-notification-template/create-notification-template/create-notification-template.component';
const routes: Routes = [
  // {
  //   path: "login",
  //   component: LoginComponent,
  //   pathMatch: "full",
  //  // data: { title: 'Manage Task', breadcrumb: 'Manage Task' },
  // },
  {
    path: "managetask",
    component: ManageTaskComponent,
    pathMatch: "full",
    },
    {
      path: "notificationtemplate",
      component: CreateNotificationTemplateComponent,
      pathMatch: "full",
      },
    {
      path: "managenotification",
      component: ManageNotificationTemplateComponent,
      pathMatch: "full",
      },
  // {
  //   path: "manageTemplate",
  //   component: ManageNotificationTemplateComponent,
  //   pathMatch: "full",
  
  // },
  // {
  //   path: "createTemplate",
  //   component: CreateNotificationTemplateComponent,
  //   pathMatch: "full",
  
  // },
  {
    path: "taskslist",
    component: TasksListComponent,
    pathMatch: "full",
   
  
  }
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TMSRoutingModule { }
