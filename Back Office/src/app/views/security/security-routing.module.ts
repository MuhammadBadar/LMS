import { CreateUserDialogComponent } from './manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';
import { AssignRoleToUserComponent } from './assign-role-to-user/assign-role-to-user.component';
import { ManageRoleComponent } from "./manage-role/manage-role.component";
import { ManageUserComponent } from "./manage-user/manage-user.component";
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { AuthorizationCheck } from './AuthorizationCheck';
import { LoginComponent } from './login/login.component';
import { ManageUseraccountComponent } from './manage-useraccount/manage-useraccount.component';
import { TokenCheck } from './TokenCheck';

const routes: Routes = [

  {
    path: '',
    data: {
      title: 'KeyAccounting'
    },
    children: [
      {
        path: '',
        pathMatch: 'full',
        redirectTo: 'sLogin'
      },
      {
        path: "sLogin",
        component: LoginComponent,
        canActivate: [TokenCheck],
        pathMatch: "full"
      },
      {
        path: "securityLogin",
        component: LoginComponent,

      },
      {
        path: "userRegistration",
        component: CreateUserDialogComponent,
        pathMatch: "full"
      },
      {
        path: "roles",
        component: ManageRoleComponent,
        pathMatch: "full",
        canActivate: [AuthorizationCheck]
      },
      {
        path: "users",
        component: ManageUserComponent,
        pathMatch: "full",
        canActivate: [AuthorizationCheck]
      },
      {
        path: "userAccount",
        component: ManageUseraccountComponent,
        pathMatch: "full",
        canActivate: [AuthorizationCheck]
      },
      {
        path: "userrole",
        component: AssignRoleToUserComponent,
        pathMatch: "full",
        canActivate: [AuthorizationCheck]
      },
    ]
  }




];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SecurityRoutingModule { }

