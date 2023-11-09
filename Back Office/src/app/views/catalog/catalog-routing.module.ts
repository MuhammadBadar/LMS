import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SettingsVM } from './Models/SettingsVM';
import { SettingsTypeVM } from './Models/SettingsTypeVM';
import{ManageSettingsComponent}from './manage-settings/manage-settings.component';
import{ManageSettingsTypeComponent}from './manage-settings-type/manage-settings-type.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
const routes: Routes = [
  {
    path: '',
    data: {
      title: 'catalog'
    },
    children: [
      {
        path: '',
        pathMatch: 'full',
        redirectTo: 'manageSettingType'
      },

{
         path: "manageSetting",
         component: ManageSettingsComponent,
        pathMatch: "full",
        canActivate: [AuthorizationCheck]
       },

       {
         path: "manageSettingType",
         component: ManageSettingsTypeComponent,
        pathMatch: "full",
        
       },
]
}]; 
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CatalogRoutingModule { }
