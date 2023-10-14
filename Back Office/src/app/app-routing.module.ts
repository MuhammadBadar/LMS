import { CatalogModule } from './views/catalog/catalog.module';

import { ItemsModule } from './views/items/items.module';

import { SecurityModule } from './views/security/security.module';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountModule } from './views/account/account.module';
import { DefaultLayoutComponent } from './containers';
import { Page404Component } from './views/pages/page404/page404.component';
import { Page500Component } from './views/pages/page500/page500.component';
import { LoginComponent } from './views/pages/login/login.component';
import { RegisterComponent } from './views/pages/register/register.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'security',
    pathMatch: 'full'
  },
  {
    path: '',
    component: DefaultLayoutComponent,
    data: {
      title: 'Home'
    },
    children: [
      {
        path: 'securityLogin',
        loadChildren: () =>
          import('./views/security/security.module').then((m) => m.SecurityModule)
      },
      {
        path: 'catalog',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'lms',
        loadChildren: () =>
          import('./views/lms/lms.module').then((m) => m.LMSModule)
      },
      {
        path: 'att',
        loadChildren: () =>
          import('./views/att/att.module').then((m) => m.AttModule)
      },
      {
        path: 'sch',
        loadChildren: () =>
          import('./views/sch/sch.module').then((m) => m.SCHModule)
      },
      {
        path: 'tms',
        loadChildren: () =>
          import('./views/tms/tms.module').then((m) => m.TMSModule)
      },
      {
        path: 'account',
        loadChildren: () =>
          import('./views/account/account.module').then((m) => m.AccountModule)
      },
      {
        path: 'items',
        loadChildren: () =>
          import('./views/items/items.module').then((m) => m.ItemsModule)
      },

      {
        path: 'security',
        loadChildren: () =>
          import('./views/security/security.module').then((m) => m.SecurityModule)
      },

      {
        path: 'dashboard',
        loadChildren: () =>
          import('./views/dashboard/dashboard.module').then((m) => m.DashboardModule)
      },
      {
        path: 'theme',
        loadChildren: () =>
          import('./views/theme/theme.module').then((m) => m.ThemeModule)
      },
      {
        path: 'base',
        loadChildren: () =>
          import('./views/base/base.module').then((m) => m.BaseModule)
      },
      {
        path: 'buttons',
        loadChildren: () =>
          import('./views/buttons/buttons.module').then((m) => m.ButtonsModule)
      }
      ,
      {
        path: 'my',
        loadChildren: () =>
          import('./views/buttons/buttons.module').then((m) => m.ButtonsModule)
      },
      {
        path: 'forms',
        loadChildren: () =>
          import('./views/forms/forms.module').then((m) => m.CoreUIFormsModule)
      },
      {
        path: 'charts',
        loadChildren: () =>
          import('./views/charts/charts.module').then((m) => m.ChartsModule)
      },
      {
        path: 'icons',
        loadChildren: () =>
          import('./views/icons/icons.module').then((m) => m.IconsModule)
      },
      {
        path: 'notifications',
        loadChildren: () =>
          import('./views/notifications/notifications.module').then((m) => m.NotificationsModule)
      },
      {
        path: 'widgets',
        loadChildren: () =>
          import('./views/widgets/widgets.module').then((m) => m.WidgetsModule)
      },
      {
        path: 'pages',
        loadChildren: () =>
          import('./views/pages/pages.module').then((m) => m.PagesModule)
      },
    ]
  },
  {
    path: '404',
    component: Page404Component,
    data: {
      title: 'Page 404'
    }
  },
  {
    path: '500',
    component: Page500Component,
    data: {
      title: 'Page 500'
    }
  },
  {
    path: 'securityLogin',
    component: SecurityModule,

  },
  {
    path: 'login',
    component: LoginComponent,
    data: {
      title: 'Login Page'
    }
  },

  {
    path: 'register',
    component: RegisterComponent,
    data: {
      title: 'Register Page'
    }
  },
  { path: '**', redirectTo: ' ' }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      scrollPositionRestoration: 'top',
      anchorScrolling: 'enabled',
      initialNavigation: 'enabledBlocking'
      // relativeLinkResolution: 'legacy'
    })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
