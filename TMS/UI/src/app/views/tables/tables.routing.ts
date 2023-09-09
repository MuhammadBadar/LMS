import { Routes } from '@angular/router';

import { FullscreenTableComponent } from './fullscreen-table/fullscreen-table.component';
import { PagingTableComponent } from './paging-table/paging-table.component';
import { FilterTableComponent } from './filter-table/filter-table.component';
import { MaterialTableComponent } from './material-table/material-table.component';

export const TablesRoutes: Routes = [
  {
    path: '',
    children: [{
      path: 'fullscreen',
      component: FullscreenTableComponent,
      data: { title: 'Fullscreen', breadcrumb: 'FULLSCREEN' }
    }, {
      path: 'paging',
      component: PagingTableComponent,
      data: { title: 'Paging', breadcrumb: 'PAGING' }
    }, {
      path: 'filter',
      component: FilterTableComponent,
      data: { title: 'Filter', breadcrumb: 'FILTER' }
    }, {
      path: 'mat-table',
      component: MaterialTableComponent,
      data: { title: 'Material TAble', breadcrumb: 'Material Table' }
    }]
  }
];
