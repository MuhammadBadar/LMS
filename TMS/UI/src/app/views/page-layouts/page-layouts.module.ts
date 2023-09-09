import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PageLayoutsRoutingModule } from './page-layouts-routing.module';
import { LeftSidebarCardComponent } from './left-sidebar-card/left-sidebar-card.component';
import { SharedDirectivesModule } from 'app/shared/directives/shared-directives.module';
import { SharedMaterialModule } from 'app/shared/shared-material.module';
import { SharedComponentsModule } from 'app/shared/components/shared-components.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FullWidthCardComponent } from './full-width-card/full-width-card.component';
import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { RightSidebarCardComponent } from './right-sidebar-card/right-sidebar-card.component';
import { FullWidthPlainComponent } from './full-width-plain/full-width-plain.component';
import { LeftSidebarPlainComponent } from './left-sidebar-plain/left-sidebar-plain.component';
import { FullWidthCardTabComponent } from './full-width-card-tab/full-width-card-tab.component';

@NgModule({
  declarations: [LeftSidebarCardComponent, FullWidthCardComponent, RightSidebarCardComponent, FullWidthPlainComponent, LeftSidebarPlainComponent, FullWidthCardTabComponent],
  imports: [
    SharedMaterialModule,
    SharedDirectivesModule,
    SharedComponentsModule,
    FlexLayoutModule,
    CommonModule,
    PerfectScrollbarModule,
    PageLayoutsRoutingModule
  ]
})
export class PageLayoutsModule { }
