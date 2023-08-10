import { SettingsTypeVM } from './../Models/SettingsTypeVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ItemsService } from '../../items/items.service';
import { SettingsVM } from '../Models/SettingsVM';
import { CatalogService } from '../../catalog/catalog.service';

@Component({
  selector: 'app-manage-settings-type',
  templateUrl: './manage-settings-type.component.html',
  styleUrls: ['./manage-settings-type.component.css']
})
export class ManageSettingsTypeComponent implements OnInit {
  isActive?:false
  Edit: boolean = false;
  IsUnique: boolean = true;
  Add: boolean = true;
  parentId?: number;
  validFields: boolean = false;
  public date = new Date();
  types?: SettingsTypeVM[];
  settingsType?: SettingsTypeVM[];
  searchedType?: SettingsTypeVM[];
  settingsTypeById?: SettingsTypeVM[];
  selectedSettingsType = new SettingsTypeVM()
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'keyCode', 'parent', 'description','isActive', 'actions'];
  dataSource: any;
  constructor(
    public dialogRef: MatDialogRef<ManageSettingsTypeComponent>,
    public catSvc: CatalogService,
    private snack: MatSnackBar,
    public dialog: MatDialog,) {
    this.selectedSettingsType = new SettingsTypeVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.selectedSettingsType = new SettingsTypeVM();
    this.GetSettingsType();
    this.selectedSettingsType.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetSettingsType() {
    this.catSvc.GetSettingsType().subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.settingsType = res;
        this.searchedType = this.settingsType;
        this.types = this.settingsType;
        this.dataSource = new MatTableDataSource(this.settingsType);
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
      }
    })
  }
  GetType() {
    this.catSvc.GetSettingsType().subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.types = res;
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
      }
    })
  }
  Search() {
    var type = new SettingsTypeVM();
    type.parentId = this.selectedSettingsType.parentId;
    this.catSvc.SearchSettingsType(type).subscribe((res: SettingsTypeVM[]) => {
      this.searchedType = res;
      this.dataSource = new MatTableDataSource(this.searchedType);
    });
  }
  DeleteSettingsType(id: number) {
    var setting = new SettingsVM()
    setting.enumTypeId = id;
    this.catSvc.SearchSettings(setting).subscribe((res: SettingsVM[]) => {
      console.warn(res)
      if (res.length == 0) {
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
            this.catSvc.DeleteSettingsType(id).subscribe({
              next: (res: any) => {
                Swal.fire(
                  'Deleted!',
                  'success'
                )
                this.Search();
                this.GetType();
              }, error: (e) => {
                this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
                console.warn(e);
              }
            })
          }
        })
      }
      else if (res.length == 1)
        this.catSvc.ErrorMsgBar("Unable to delete because it contains a child!", 5000)
      else
        this.catSvc.ErrorMsgBar("Unable to delete because it contains Children!", 5000)
    });
  }
  GetSettingsTypeForEdit(id: number) {
    this.selectedSettingsType = new SettingsTypeVM;
    this.selectedSettingsType.id = id
    this.catSvc.SearchSettingsType(this.selectedSettingsType).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.settingsTypeById = res;
        this.selectedSettingsType = this.settingsTypeById[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
        console.warn(e);
      }
    })
  }
  SaveSettingsType() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      if (this.IsUnique == true) {
        this.catSvc.SaveSettingsType(this.selectedSettingsType).subscribe({
          next: (res: any) => {
            this.catSvc.SuccessMsgBar("SettingsType  successfully Added!", 5000)
            this.Search();
            this.GetType();
            this.selectedSettingsType = new SettingsTypeVM
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
            console.warn(e);
          }
        })
      } else
        this.catSvc.ErrorMsgBar("This Key Code is Already in Use!", 5000)
    }
  }
  UpdateSettingsType() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      if (this.IsUnique == true) {
        this.catSvc.UpdateSettingsType(this.selectedSettingsType).subscribe({
          next: (res: any) => {
            this.catSvc.SuccessMsgBar("SettingsType Successfully Updated!", 5000)
            this.Add = true;
            this.Edit = false;
            this.Search();
            this.GetType();
            this.selectedSettingsType = new SettingsTypeVM
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
            console.warn(e);
          }
        })
      }
      else
        this.catSvc.ErrorMsgBar("This Key Code is Already in Use!", 5000)
    }
  }
  Refresh() {
    // this.selectedSettingsType = new SettingsTypeVM;
    // this.Add = true;
    // this.Edit = false;
     this.GetSettingsType();
  }
  onSearchChange() {
    debugger
    this.IsUnique = true;
    if (this.Edit == true)
      this.types = this.types?.filter(x => x.id != this.selectedSettingsType.id)
    var value = this.types?.find(x => x.keyCode == this.selectedSettingsType.keyCode)
    if (value == undefined)
      this.IsUnique = true;
    else
      this.IsUnique = false;
  }
  TextChangeEvent(event: any) {
    if (this.selectedSettingsType.isSystemDefined && this.Edit) {
    } else {
      this.selectedSettingsType.keyCode = event.target.value
      this.selectedSettingsType.keyCode = this.selectedSettingsType.keyCode?.replaceAll(' ', '_')
    }
  }
}