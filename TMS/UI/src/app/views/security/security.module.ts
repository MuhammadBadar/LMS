import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { SecurityRoutingModule } from './security-routing.module';
import { ReactiveFormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { FormsModule } from '@angular/forms';
import { SecurityService } from './security.service';
import { ManageRoleComponent } from './manage-role/manage-role.component';
import { ManageUserComponent } from './manage-user/manage-user.component';
import { ManagePermissionsComponent } from './manage-permissions/manage-permissions.component';
import { CreateRoleDialogComponent } from './manage-role/manage-role-dialog/create-role-dialog/create-role-dialog.component';

import { CreateUserDialogComponent } from './manage-user/manage-user-dialog/create-user-dialog/create-user-dialog.component';

import { ManageFeatureComponent } from './manage-feature/manage-feature.component';
import { CreateFeatureDialogComponent } from './manage-feature/manage-feature-dialog/create-feature-dialog/create-feature-dialog.component';

import { AssignRoleToUserComponent } from './assign-role-to-user/assign-role-to-user.component';
import { CreateUserRoleComponent } from './assign-role-to-user/manage -user-role-dialog/create-user-role/create-user-role.component';

import { CreatePermissionDialogComponent } from './manage-permissions/manage-permission-dialog/create-permission-dialog/create-permission-dialog.component';
import { LoginComponent } from './login/login.component';
import { AuthorizationCheck } from './AuthorizationCheck';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { httpInterceptor } from './httpInterceptor';
import { ErrorInterceptor } from './errorInterceptor';
import { JwtHelperService, JWT_OPTIONS } from '@auth0/angular-jwt';




@NgModule({
  imports: [
    CommonModule,
    SecurityRoutingModule,
    SharedMaterialModule,
    ReactiveFormsModule,
    SharedComponentsModule,
    FlexLayoutModule,
    FormsModule,
   
   
  ],
  declarations: [ManageRoleComponent, ManageUserComponent, ManagePermissionsComponent, CreateRoleDialogComponent, CreateUserDialogComponent, ManageFeatureComponent, CreateFeatureDialogComponent, AssignRoleToUserComponent, CreateUserRoleComponent, CreatePermissionDialogComponent, LoginComponent],
  providers: [
    DatePipe,
   // { provide: HTTP_INTERCEPTORS, useClass: httpInterceptor, multi: true },
    //{ provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
    AuthorizationCheck, SecurityService]
})

export class SecurityModule { }
