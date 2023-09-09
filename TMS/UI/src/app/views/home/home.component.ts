import { Component, OnInit, OnDestroy, AfterViewInit } from '@angular/core';
import { Router } from '@angular/router'
import { AppLoaderService } from '../../shared/services/app-loader/app-loader.service';
// import PerfectScrollbar from 'perfect-scrollbar';
import { LayoutService } from 'app/shared/services/layout.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html'
})
export class HomeComponent implements OnInit, OnDestroy, AfterViewInit {
  public mainVersion;
  /****** Only for demo) **********/
  public versions: any[] = [
    {
      name: 'Dark sidebar',
      photo: 'assets/images/screenshots/black_sidebar.png',
      dest: 'dashboard/analytics',
      conf: `{
        "navigationPos": "side",
        "sidebarStyle": "full",
        "sidebarColor": "slate",
        "topbarColor": "white",
        "footerColor": "slate",
        "dir": "ltr",
        "useBreadcrumb": true,
        "topbarFixed": false,
        "breadcrumb": "simple",
        "matTheme": "egret-navy"
      }`
    }, {
      name: 'Light Sidebar',
      photo: 'assets/images/screenshots/white_sidebar.png',
      dest: 'dashboard/default',
      conf: `{
        "navigationPos": "side",
        "sidebarStyle": "full",
        "sidebarColor": "white",
        "topbarColor": "white",
        "footerColor":"slate",
        "dir": "ltr",
        "useBreadcrumb": true,
        "topbarFixed": false,
        "breadcrumb": "simple",
        "matTheme": "egret-blue"
      }`
    },
    {
      name: 'Dark Theme',
      photo: 'assets/images/screenshots/dark_theme.png',
      dest: 'dashboard/crypto',
      conf: `{
        "navigationPos": "side",
        "sidebarStyle": "compact",
        "sidebarColor": "slate",
        "topbarColor": "slate",
        "footerColor":"slate",
        "dir": "ltr",
        "useBreadcrumb": true,
        "topbarFixed": false,
        "breadcrumb": "simple",
        "matTheme": "egret-dark-purple"
      }`
    },
    // {
    //   name: 'RTL (Top Nav)',
    //   photo: 'assets/images/screenshots/top-simple-rtl.png',
    //   dest: 'profile/settings',
    //   conf: `{
    //     "navigationPos": "top",
    //     "sidebarStyle": "full",
    //     "dir": "rtl",
    //     "useBreadcrumb": true,
    //     "topbarFixed": false,
    //     "breadcrumb": "simple"
    //   }`
    // },
    // {
    //   name: 'Dark Purple',
    //   photo: 'assets/images/screenshots/dark-purple-title.png',
    //   dest: 'dashboard',
    //   conf: `{
    //     "navigationPos": "side",
    //     "sidebarStyle": "full",
    //     "dir": "ltr",
    //     "useBreadcrumb": true,
    //     "topbarFixed": true,
    //     "breadcrumb": "simple"
    //   }`,
    //   theme: `{
    //     "name": "egret-dark-purple"
    //   }`
    // },
    // {
    //   name: 'Dark Pink',
    //   photo: 'assets/images/screenshots/dark-pink-title.png',
    //   dest: 'dashboard',
    //   conf: `{
    //     "navigationPos": "side",
    //     "sidebarStyle": "full",
    //     "dir": "ltr",
    //     "useBreadcrumb": true,
    //     "topbarFixed": true,
    //     "breadcrumb": "simple"
    //   }`,
    //   theme: `{
    //     "name": "egret-dark-pink"
    //   }`
    // },
    // {
    //   name: 'Light Blue',
    //   photo: 'assets/images/screenshots/light-blue-title.png',
    //   dest: 'dashboard',
    //   conf: `{
    //     "navigationPos": "side",
    //     "sidebarStyle": "full",
    //     "dir": "ltr",
    //     "useBreadcrumb": true,
    //     "topbarFixed": true,
    //     "breadcrumb": "simple"
    //   }`,
    //   theme: `{
    //     "name": "egret-blue"
    //   }`
    // }
  ]

  // private homePS: PerfectScrollbar;
  constructor(
    private router: Router,
    private loader: AppLoaderService,
    public layout: LayoutService
  ) { }

  ngOnInit() {
    this.mainVersion = this.versions[0]
  }

  ngOnDestroy() {
    // if (this.homePS) this.homePS.destroy();
    this.loader.close();
  }
  ngAfterViewInit() {
    // setTimeout(() => {
    //   this.homePS = new PerfectScrollbar('.scrollable')
    // });
  }

  /****** Remove this (Only for demo) **********/
  goToDashboard(v) {
    let origin = window.location.origin;
    
    window.location.href = `${origin}/${v.dest}/?layout=${v.conf}`;
  }
  goToMainDash() {
    this.loader.open();
    this.router.navigateByUrl('/dashboard/analytics')
  }
}
