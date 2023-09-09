import { ExpenseTypeListComponent } from './expense-type-list/expense-type-list.component';
import { ExpenseListComponent } from './expense-list/expense-list.component';
import { ManageExpenseComponent } from './manage-expense/manage-expense.component';
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { ExpenseTypeDialogComponent } from "./expense-type-dialog/expense-type-dialog.component";
import { LoginComponent } from "./login/login.component";
import { AuthorizationCheck } from './AuthrizationCheck';
const routes: Routes = [
    {
      path: "manageexpense",
      component: ManageExpenseComponent,
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
      path: "expensetype",
      component: ExpenseTypeDialogComponent,
      pathMatch: "full"
    }
    ,
    {
      path: "expensetypelist",
      component: ExpenseTypeListComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck],
    }
    ,
    {
      path: "expenselist",
      component: ExpenseListComponent,
      pathMatch: "full",
      canActivate: [AuthorizationCheck],
    }

  ];
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class ExpenseRoutingModule {}