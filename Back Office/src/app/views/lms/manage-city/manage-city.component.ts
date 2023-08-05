import { Component, Injector, ViewChild } from '@angular/core';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CitiesTypeVM } from '../../items/Models/CitiesTypeVM';
import { CitiesVM } from '../../items/Models/CitiesVM';
import { MatTableDataSource } from '@angular/material/table';
import { NgForm } from '@angular/forms';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
@Component({
  selector: 'app-manage-city',
  templateUrl: './manage-city.component.html',
  styleUrls: ['./manage-city.component.css']
})
export class ManageCityComponent {
 displayedColumns: string[] = [`name`,'isActive', 'actions'];  
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: any
  Edit: boolean = false;
  type: CitiesTypeVM = new CitiesTypeVM;
  CitiesType?: CitiesTypeVM[];
  isActive: boolean = true;
  @ViewChild('CityForm', { static: true }) CityForm!: NgForm;
  selectedCities = new CitiesVM();
  selectedCity: SettingsVM
  Add: boolean = true;
  Cities: CitiesVM[] | undefined; 
  cities: SettingsVM[]
  dialogRefe: any;
  dialogData: any;
  isDialogOpen = false;
  isDialog : boolean = false;
  proccessing: boolean | undefined;
  constructor(
    private injector: Injector,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedCity = new SettingsVM
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
  }
  ngOnInit(): void {
    this.GetCity();
    this.selectedCity.isActive = true;
   if (this.dialogData ) {
    this.isDialog =this.dialogData.isDialogue;
    console.warn(this.dialogData.cityId)}
   }
    SaveCity() {
      var citi = new SettingsVM
      citi.isActive = true;
      citi.enumTypeId = EnumTypeVM.cities;
    this.catSvc.SearchSettings(citi).subscribe({
    next: (res: SettingsVM[]) => {
         var list = res
          list = list.filter(x => x != this.selectedCity)
        var find = list.find(x => x.name == this.selectedCity.name)
        if (find == undefined) {
          this.proccessing = true
          if (!this.CityForm.invalid) {
            this.selectedCity.enumTypeId = EnumTypeVM.cities
            if (this.Edit)
              this.UpdateCity
            else {
              this.catSvc.SaveSettings(this.selectedCity).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar("City Successfully Added!", 5000)
                  this.Add = true;
                  this.Edit = false;
                  this.proccessing = false
                  this.ngOnInit();
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                  console.warn(e);
                  this.proccessing = false
                }
              })
            }
          } else {
            this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
            this.proccessing = false
          }
        } 
        else
          this.catSvc.ErrorMsgBar("This CityName  Already Taken ", 5000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  EditCity(city: SettingsVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedCity = city
  }
  UpdateCity() {
    this.catSvc.UpdateSettings(this.selectedCity).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Refresh() {
    this.GetCity();
    this.selectedCity = new SettingsVM
    this.EditMode = false
    this.AddMode = true
  }
  GetCity() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.cities
     stng.isActive=true;
    this.catSvc.SearchSettings(stng).subscribe({   
      next: (value: SettingsVM[]) => {
        this.cities = value
        this.dataSource = new MatTableDataSource(this.cities)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
 }
}


