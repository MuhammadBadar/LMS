import { SettingsVM } from '../Models/SettingsVM';
import { ManageSettingsTypeComponent } from './../manage-settings-type/manage-settings-type.component';
import { SettingsTypeVM } from '../Models/SettingsTypeVM';
import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ItemsService } from '../../items/items.service';
import { ActivatedRoute } from '@angular/router';
import { CatalogService } from '../catalog.service';

@Component({
  selector: 'app-manage-settings',
  templateUrl: './manage-settings.component.html',
  styleUrls: ['./manage-settings.component.css']
})
export class ManageSettingsComponent implements OnInit {
  isActive?:false
  Edit: boolean = false;
  DisabledType: boolean = false;
  parentId?: number = 0
  typeId: number = 0
  typeKeyCode: string = "";
  settingName: string = "";
  Add: boolean = true;
 
  IsUnique: boolean = true;
  enumTypeId?: number;
  validFields: boolean = false;
  public date = new Date();
  selected = 200;
  values?: SettingsVM[];
  list?: SettingsVM[];
  searchedStng?: SettingsVM[];
  type: SettingsTypeVM = new SettingsTypeVM;
  getSetttingsBiId?: SettingsVM[];
  settingsType?: SettingsTypeVM[];
  Settings: SettingsVM[] | undefined;
  selectedSettings = new SettingsVM();
  private dialogRef?: MatDialogRef<ManageSettingsTypeComponent>;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name','keyCode', 'parent', 'description','isActive', 'actions'];
  dataSource: any;
  constructor(
    private route: ActivatedRoute,
    public catSvc: CatalogService,
    private snack: MatSnackBar,
    public dialog: MatDialog,) {
    this.selectedSettings = new SettingsVM();
  }
  ngOnInit(): void {
    debugger
   
    this.GetSettingsType()
   
    this.Add = true;
    this.Edit = false;
    this.typeKeyCode = ""
    this.settingName = ""
    this.selectedSettings = new SettingsVM;
   
    this.route.queryParams.subscribe(params => {
      this.typeId = + params['type']
    
      if (!Number.isNaN(this.typeId)) {
        var type = new SettingsTypeVM()
        type.id = params['type'];
        this.catSvc.SearchSettingsType(type).subscribe({
          next: (res: SettingsTypeVM[]) => {
            this.OnTypeChange(res[0])
            this.type.parentId = res[0].parentId;
            this.selectedSettings.enumTypeId = + params['type'];
            this.Search()
            this.DisabledType = true
            
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
          }
        })

      }
      else {
        this.selectedSettings = new SettingsVM;
        this.GetSettings();
        this.GetSettingsType();
        this.Add = true;
        this.Edit = false;
        this.typeKeyCode = ""
        this.settingName = ""
        this.DisabledType = false
        this.selectedSettings.isActive = true;
      }
    });
  }
  Check() {
    this.validFields = true;
  }
  GetValues() {
    this.catSvc.GetSettings().subscribe({
      next: (res: SettingsVM[]) => {
        this.values = res;
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
      }
    })
  }
  GetSettings() {
    this.catSvc.GetSettings().subscribe((res: SettingsVM[]) => {
      this.Settings = res;
      this.values = res;
      console.warn(this.Settings)
      this.dataSource = new MatTableDataSource(res);
    });
  }
  GetSettingsType() {
    var settingtype = new SettingsTypeVM
    settingtype.isActive = true;
    this.catSvc.GetSettingsType().subscribe((res: SettingsTypeVM[]) => {
      this.settingsType = res;
    });
  }
  DeleteSettings(id: number) {

    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        this.catSvc.DeleteSettings(id).subscribe({
          next: () => {
            Swal.fire(
              'Deleted!',
              'success'
            )
            if (this.DisabledType == true)
              this.ngOnInit();
            else {
              this.Search();
              this.GetValues();
            }
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
          }
        })
      }
    })

  }
  GetSettingsForEdit(id: number) {
    var type = new SettingsTypeVM();
    var setting = new SettingsVM()
    setting.id = id
    this.catSvc.SearchSettings(setting).subscribe((res: SettingsVM[]) => {
      this.getSetttingsBiId = res;
      this.selectedSettings = this.getSetttingsBiId[0]
      this.Edit = true;
      this.Add = false;
      type.id = this.getSetttingsBiId[0]?.enumTypeId
      this.catSvc.SearchSettingsType(type).subscribe((res: SettingsTypeVM[]) => {
        this.type = res[0];
        this.typeKeyCode = res[0].keyCode
        this.settingName = '_' + this.selectedSettings.name
        this.Search()
      })
    })
  }
  SaveSettings() {
    debugger
    var stng = new SettingsVM();
    stng.enumTypeId = this.selectedSettings.enumTypeId;
    this.catSvc.SearchSettings(stng).subscribe((res: SettingsVM[]) => {
      debugger
      if (res.length != 0) {
        this.searchedStng = res
        var value = this.searchedStng[this.searchedStng.length - 1]
        this.selectedSettings.id = value.id + 1
      }
      else {
        var id = this.selectedSettings.enumTypeId.toString() + "001"
        this.selectedSettings.id = +id
      }
      this.validFields = true;
      if (!this.userForm.invalid && this.selectedSettings.enumTypeId != 0) {
        // if (this.IsUnique == true) {
        this.catSvc.SaveSettings(this.selectedSettings).subscribe({
          next: () => {
            if (this.DisabledType == true)
              this.ngOnInit();
            else {
              this.GetValues();
              this.Search();
              this.typeKeyCode = ""
              this.settingName = ""
              this.selectedSettings = new SettingsVM
            }
            this.catSvc.SuccessMsgBar("Settings  successfully Added!", 5000)
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
          }
        })
        // }
        //else
        // this.snack.open('This Key Code is Already in Use!', 'OK', { duration: 4000 })
      }
      else
        this.catSvc.ErrorMsgBar("Please fill all required fields!", 5000)
    });
  }
  UpdateSettings() {
    this.validFields = true;
    if (!this.userForm.invalid && this.selectedSettings.enumTypeId != 0) {
      // if (this.IsUnique == true) {
      this.catSvc.UpdateSettings(this.selectedSettings).subscribe({
        next: () => {
          this.catSvc.SuccessMsgBar("Settings Successfully Updated!", 5000)
          if (this.DisabledType == true)
            this.ngOnInit();
          else {
            this.Add = true;
            this.Edit = false;
            this.Search();
            this.GetValues();
            this.typeKeyCode = ""
            this.settingName = ""
            this.selectedSettings = new SettingsVM
          }
        }, error: (e: any) => {
          this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
          console.warn(e);
        }
      })
      // }
      // else
      //   this.snack.open('This Key Code is Already in Use!', 'OK', { duration: 4000 })
    }
    else
      this.catSvc.ErrorMsgBar("Please fill all required fields!", 5000)
  }
  Refresh() {
    // this.ngOnInit();
    // // this.selectedSettings = new SettingsVM;
    // // this.Add = true;
    // // this.Edit = false;
    debugger
    this.GetSettings();
    this.GetSettingsType();
  }
  Search() {
    debugger
    // if(this.Edit==false)
    // this.settingName=""
    var setting = new SettingsVM();
    if (!this.Edit)
      this.selectedSettings.parentId = 0;
    // setting.enumTypeId = this.selectedSettings.enumTypeId;
    if (this.type.parentId != 0 && this.type.parentId != undefined) {
      setting.enumTypeId = this.type.parentId
      console.warn(setting)
      this.catSvc.SearchSettings(setting).subscribe({
        next: (res: SettingsVM[]) => {
          this.Settings = res;
          console.warn(this.Settings)
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
        }
      })
    }
    else {
      this.Settings = []
    }
    var stng = new SettingsVM();
    stng.enumTypeId = this.selectedSettings.enumTypeId
    this.catSvc.SearchSettings(stng).subscribe((res: SettingsVM[]) => {
      // this.Settings = res;
      this.dataSource = new MatTableDataSource(res);
      if (this.DisabledType == true)
        this.values = res;
    });
  }
  OnTypeChange(value: SettingsTypeVM) {
    if (this.selectedSettings.isSystemDefined && this.Edit) {
    } else {
      this.type = value;
      this.typeKeyCode = value.keyCode
      this.selectedSettings.keyCode = this.typeKeyCode + this.settingName
    }
  }
  TextChangeEvent(event: any) {
    debugger
    if (this.selectedSettings.isSystemDefined && this.Edit) {

    } else {
      this.settingName = '' + event.target.value.replaceAll(' ', '')
      this.selectedSettings.keyCode = this.typeKeyCode + this.settingName
    }
  }
  onSearchChange() {
    debugger
    this.IsUnique = true;
    if (this.Edit == true)
      this.values = this.values?.filter(x => x.id != this.selectedSettings.id)
    var value = this.values?.find(x => x.keyCode == this.selectedSettings.keyCode)
    if (value == undefined)
      this.IsUnique = true;
    else
      this.IsUnique = false;
  }
  SearchType() {
    debugger
    this.list = this.values?.filter(x => x.enumTypeId == this.selectedSettings.enumTypeId)
    this.dataSource = new MatTableDataSource(this.list);
  }
  SearchParent() {
    debugger
    var list = this.values?.filter(x => x.parentId == this.selectedSettings.parentId)
    this.dataSource = new MatTableDataSource(list);
  }
  SettingsTypeDialog() {
    this.dialogRef = this.dialog.open(ManageSettingsTypeComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1200px', height: '590px'
      , data: {}
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (this.DisabledType == true)
          this.ngOnInit();
        else {
          this.GetSettings()
          this.GetSettingsType()
          this.selectedSettings.keyCode = this.typeKeyCode

        }
      });
  }
}