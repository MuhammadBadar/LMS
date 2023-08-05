import { Globals } from './../../globals';
import { SecurityService } from './../../views/security/security.service';
import { ItemsService } from './../../views/items/items.service';
import { Component, OnInit, ChangeDetectorRef, IterableDiffers } from '@angular/core';
import { INavData } from '@coreui/angular';

import { navItems } from './_nav';
import { SettingsTypeVM } from 'src/app/views/catalog/Models/SettingsTypeVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { BehaviorSubject } from 'rxjs';
import { EnumTypeVM } from 'src/app/views/security/models/EnumTypeVM';
import { CatalogService } from 'src/app/views/catalog/catalog.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',

})
export class DefaultLayoutComponent implements OnInit {
  navItems: INavData[] = [];
  url!: string
  items: INavData[] = [];
  values: INavData[] = [];
  subValues: INavData[] = [];
  subVals: INavData[] = [];
  subVal: INavData[] = [];
  //public navItems = navItems;
  SettingsType?: SettingsTypeVM[] = undefined;
  Type?: SettingsTypeVM = undefined;
  refresh = new BehaviorSubject<boolean>(true);
  Settings: SettingsVM[] = [];
  settings: SettingsVM[] = [];
  subSettings: SettingsVM[] = [];
  public perfectScrollbarConfig = {
    suppressScrollX: true,
  };

  constructor(
    public differ: IterableDiffers,
    public itemSvc: ItemsService,
    public secSvc: SecurityService,
    private snack: MatSnackBar,
    public catSvc: CatalogService,
  ) {
  }
  ngOnInit(): void {
    this.GetSettings();
  }
  GetSettingsType() {
    var type = new SettingsTypeVM();
    this.itemSvc.SearchSettingsType(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.SettingsType = res;
        this.Type = this.SettingsType.find(x => x.id == EnumTypeVM.BackOffice);

        if (this.Type != undefined)
          this.settings = this.settings?.filter(x => x.enumTypeId == this.Type?.id);

        //  if (this.settings.length != 0) {
        this.settings.forEach(element => {
          var SubSettings = this.subSettings?.filter(x => x.parentId == element.id)
          this.subValues = []

          // if (SubSettings.length != 0) {
          SubSettings.forEach(abb => {
            var subSubSetting = this.Settings?.filter(x => x.parentId == abb.id)
            this.subVals = []

            // if (subSubSetting.length != 0) {
            subSubSetting.forEach(ab => {
              var ad = { name: ab.name, url: Globals.webUrl + ab.keyCode }
              this.subVals.push(ad)
            })
            //  }

            var ac = { name: abb.name, children: this.subVals, url: Globals.webUrl + abb.keyCode }
            this.subValues.push(ac)
          })
          //  }
          if (element.keyCode != null) {
            this.url = element.keyCode
          }
          else
            this.url = '/backOffice'

          var a = { name: element.name, children: this.subValues, url: Globals.webUrl + this.url }
          navItems.push(a);
          this.navItems = navItems;
        });
        // }
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Failed to load Side Menu", 8000)
      }
    })
  }
  GetSettings() {
    var type = new SettingsVM();
    this.itemSvc.SearchSettings(type).subscribe({
      next: (res: SettingsVM[]) => {
        this.Settings = res
        this.subSettings = res
        this.settings = res
        this.GetSettingsType()
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Failed to load Side Menu", 8000)
      }
    })
  }
}
