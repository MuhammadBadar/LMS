import { CreateUserDialogComponent } from './manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';
import { CreatePermissionDialogComponent } from './manage-permissions/manage-permission-dialog/create-permission-dialog/create-permission-dialog.component';
import { AssignRoleToUserComponent } from './assign-role-to-user/assign-role-to-user.component';
import { ManageFeatureComponent } from './manage-feature/manage-feature.component';
import { LoginComponent } from './login/login.component';
// import { NgModule } from '@angular/core';
// import { CommonModule } from '@angular/common';



// @NgModule({
//   declarations: [],
//   imports: [
//     CommonModule
//   ]
// })
// export class SecurityRoutingModule { }

import { ManageRoleComponent } from "./manage-role/manage-role.component";
import { ManageUserComponent } from "./manage-user/manage-user.component";
import { Component } from "@angular/core";
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ManagePermissionsComponent } from "./manage-permissions/manage-permissions.component";
import { AuthorizationCheck } from './AuthorizationCheck';

const routes: Routes = [
  {
    path: "userRegistration",
    component: CreateUserDialogComponent,
    pathMatch: "full"
  },
  {
    path: "roles",
    component: ManageRoleComponent,
    pathMatch: "full",
   // canActivate: [AuthorizationCheck]
  },
  {
    path: "users",
    component: ManageUserComponent,
    pathMatch: "full",
   // canActivate: [AuthorizationCheck]
  },
  {
    path: "userrole",
    component: AssignRoleToUserComponent,
    pathMatch: "full",
   // canActivate: [AuthorizationCheck]
  },
  {
    path: "managePermissions",
    component: CreatePermissionDialogComponent,
    pathMatch: "full",
   // canActivate: [AuthorizationCheck]
  },
  {
    path: "feature",
    component: ManageFeatureComponent,
    pathMatch: "full",
   // canActivate: [AuthorizationCheck]
  },
  {
    path: "userlogin",
    component: LoginComponent,
    pathMatch: "full",
  
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SecurityRoutingModule {}

