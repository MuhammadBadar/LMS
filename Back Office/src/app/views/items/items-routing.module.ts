
import { ManageSettingsTypeComponent } from './manage-settings-type/manage-settings-type.component';
import { ManageSettingsComponent } from './manage-settings/manage-settings.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Items'
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
        pathMatch: "full"
      },

      {
        path: "manageSettingType",
        component: ManageSettingsTypeComponent,
        pathMatch: "full"
      },
    ]
  },
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ItemsRoutingModule { }
