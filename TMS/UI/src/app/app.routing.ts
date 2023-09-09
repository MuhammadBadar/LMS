import { QafasttrackModule } from './views/qafasttrack/qafasttrack.module';
import { ProcurementModule } from './views/procurement/procurement.module';
import { Routes } from '@angular/router';
import { AdminLayoutComponent } from './shared/components/layouts/admin-layout/admin-layout.component';
import { AuthLayoutComponent } from './shared/components/layouts/auth-layout/auth-layout.component';
import { AuthGuard } from './shared/guards/auth.guard';
import { MyprojectModule } from './views/myproject/myproject.module';
import { RinvoiceComponent } from './views/myproject/rinvoice/rinvoice.component';


export const rootRouterConfig: Routes = [
 
  { 
    path: '', 
    redirectTo: 'home', 
    pathMatch: 'full' 
  },
  {
    path: 'home',
    loadChildren: () => import('./views/home/home.module').then(m => m.HomeModule),
    data: { title: 'Choose A Demo' }
  },
  {
    path: '', 
    component: AuthLayoutComponent,
    children: [
      { 
        path: 'sessions', 
        loadChildren: () => import('./views/sessions/sessions.module').then(m => m.SessionsModule),
        data: { title: 'Session'} 
      }
    ]
  },
  {
    path: '', 
    component: AdminLayoutComponent,
    canActivate: [AuthGuard],
    children: [
      { 
        path: 'dashboard', 
        loadChildren: () => import('./views/dashboard/dashboard.module').then(m => m.DashboardModule), 
        data: { title: 'Dashboard', breadcrumb: 'DASHBOARD'}
      },
      {
        path: 'material', 
        loadChildren: () => import('./views/material-example-view/material-example-view.module').then(m => m.MaterialExampleViewModule), 
        data: { title: 'Material', breadcrumb: 'MATERIAL'}
      },
      {
        path: 'task', 
        loadChildren: () => import('./views/task/task.module').then(m => m.TaskModule), 
       // data: { title: 'Task', breadcrumb: 'Task'}
      }
      ,
      {
        path: 'inquiry', 
        loadChildren: () => import('./views/inquiry/inquiry.module').then(m => m.InquiryModule), 
       // data: { title: 'Task', breadcrumb: 'Task'}
      },
      {
        path: 'qafasttrack', 
        loadChildren: () => import('./views/qafasttrack/qafasttrack.module').then(m => m.QafasttrackModule), 
      //  data: { title: 'QAFastTrack', breadcrumb: 'QAFastTrack'}
      },
      {
        path: 'expense', 
        loadChildren: () => import('./views/expense/expense.module').then(m => m.ExpenseModule), 
      },
      {
        path: 'dialogs', 
        loadChildren: () => import('./views/app-dialogs/app-dialogs.module').then(m => m.AppDialogsModule), 
        data: { title: 'Dialogs', breadcrumb: 'DIALOGS'}
      },
      {
        path: 'profile', 
        loadChildren: () => import('./views/profile/profile.module').then(m => m.ProfileModule), 
        data: { title: 'Profile', breadcrumb: 'PROFILE'}
      },
      {
        path: 'others', 
        loadChildren: () => import('./views/others/others.module').then(m => m.OthersModule), 
        data: { title: 'Others', breadcrumb: 'OTHERS'}
      },
      {
        path: 'myproject', 
        loadChildren: () => import('./views/myproject/myproject.module').then(m => m.MyprojectModule), 
        data: { title: 'Myproject', breadcrumb: 'MYPROJECT'}
      },
      
      {
        path: 'tables', 
        loadChildren: () => import('./views/tables/tables.module').then(m => m.TablesModule), 
        data: { title: 'Tables', breadcrumb: 'TABLES'}
      },
      {
        path: 'tour', 
        loadChildren: () => import('./views/app-tour/app-tour.module').then(m => m.AppTourModule), 
        data: { title: 'Tour', breadcrumb: 'TOUR'}
      },
      {
        path: 'forms', 
        loadChildren: () => import('./views/forms/forms.module').then(m => m.AppFormsModule), 
        data: { title: 'Forms', breadcrumb: 'FORMS'}
      },
      {
        path: 'chart',
        loadChildren: () => import('./views/chart-example-view/chart-example-view.module').then(m => m.ChartExampleViewModule), 
        data: { title: 'Charts', breadcrumb: 'CHARTS'}
      },
      {
        path: 'charts', 
        loadChildren: () => import('./views/charts/charts.module').then(m => m.AppChartsModule), 
        data: { title: 'Charts', breadcrumb: 'CHARTS'}
      },
      {
        path: 'map', 
        loadChildren: () => import('./views/map/map.module').then(m => m.AppMapModule), 
        data: { title: 'Map', breadcrumb: 'MAP'}
      },
      {
        path: 'dragndrop', 
        loadChildren: () => import('./views/dragndrop/dragndrop.module').then(m => m.DragndropModule), 
        data: { title: 'Drag and Drop', breadcrumb: 'DND'}
      },
      {
        path: 'inbox', 
        loadChildren: () => import('./views/app-inbox/app-inbox.module').then(m => m.AppInboxModule), 
        data: { title: 'Inbox', breadcrumb: 'INBOX'}
      },
      {
        path: 'calendar', 
        loadChildren: () => import('./views/app-calendar/app-calendar.module').then(m => m.AppCalendarModule), 
        data: { title: 'Calendar', breadcrumb: 'CALENDAR'}
      },
      {
        path: 'chat', 
        loadChildren: () => import('./views/app-chats/app-chats.module').then(m => m.AppChatsModule), 
        data: { title: 'Chat', breadcrumb: 'CHAT'}
      },
      {
        path: 'cruds', 
        loadChildren: () => import('./views/cruds/cruds.module').then(m => m.CrudsModule), 
        data: { title: 'CRUDs', breadcrumb: 'CRUDs'}
      },
      {
        path: 'shop', 
        loadChildren: () => import('./views/shop/shop.module').then(m => m.ShopModule), 
        data: { title: 'Shop', breadcrumb: 'SHOP'}
      },
      {
        path: 'search', 
        loadChildren: () => import('./views/search-view/search-view.module').then(m => m.SearchViewModule)
      },
      {
        path: 'invoice',
        loadChildren: () => import('./views/invoice/invoice.module').then(m => m.InvoiceModule)
      },
      {
        path: 'lms',
        loadChildren: () => import('./views/lms/lms.module').then(m => m.LmsModule),
        
      },
      {
        path: 'procurement',
        loadChildren: () => import('./views/procurement/procurement.module').then(m => m.ProcurementModule),
        
      },
      {
        path: 'security',
        loadChildren: () => import('./views/security/security.module').then(m => m.SecurityModule)
      },
      {
        path: 'attendance',
        loadChildren: () => import('./views/attendance/attendance.module').then(m => m.AttendanceModule)
      },
      {
        path: 'todo',
        loadChildren: () => import('./views/todo/todo.module').then(m => m.TodoModule)
      },
      
      {
        path: 'orders',
        loadChildren: () => import('./views/order/order.module').then(m => m.OrderModule),
        data: { title: 'Orders', breadcrumb: 'Orders'}
      },
      {
        path: 'page-layouts',
        loadChildren: () => import('./views/page-layouts/page-layouts.module').then(m => m.PageLayoutsModule)
      },
      {
        path: 'utilities',
        loadChildren: () => import('./views/utilities/utilities.module').then(m => m.UtilitiesModule)
      },
      {
        path: 'icons', 
        loadChildren: () => import('./views/mat-icons/mat-icons.module').then(m => m.MatIconsModule), 
        data: { title: 'Icons', breadcrumb: 'MATICONS'}
      }
    ]
  },
  { 
    path: '**', 
    redirectTo: 'sessions/404'
  }
];

