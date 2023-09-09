import { InquiryListComponent } from './inquiry-list/inquiry-list.component';
import { UserLoginComponent } from './user-login/user-login.component';
import { ManageServiceComponent } from './manage-service/manage-service.component';
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { LoginComponent } from "../login/login.component";
import { FieldPossibleValuesDialogComponent } from "./field-possible-values-dialog/field-possible-values-dialog.component";
import { ManageFieldComponent } from "./manage-field/manage-field.component";
import { ManageInquiryComponent } from "./manage-inquiry/manage-inquiry.component";
import { AuthorizationCheck } from './AuthorizationCheck';

const routes: Routes = [
    {
      path: "manageinquiry",
      component: ManageInquiryComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck],
    },
    {
      path: "inquirylist",
      component: InquiryListComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck],
    },
    {
      path: "login",
      component: LoginComponent,
      pathMatch: "full"
    }
    ,
    {
      path: "userlogin",
      component: UserLoginComponent,
      pathMatch: "full"
    }
    ,
    {
      path: "managefield",
      component: ManageFieldComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck],
    }
    ,
    {
      path: "fpvd",
      component: FieldPossibleValuesDialogComponent,
      pathMatch: "full",
     // canActivate: [AuthorizationCheck],
    },
    {
        path: "manageservice",
        component: ManageServiceComponent,
        pathMatch: "full",
       canActivate: [AuthorizationCheck],
      }
    

  ];
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class InquiryRoutingModule {}