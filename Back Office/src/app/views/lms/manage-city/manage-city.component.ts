import { Component, Injector, ViewChild } from '@angular/core';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CityVM } from '../Models/CityVM';
import { CitiesTypeVM } from '../../items/Models/CitiesTypeVM';
import { CitiesVM } from '../../items/Models/CitiesVM';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { error } from 'console';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';


@Component({
  selector: 'app-manage-city',
  templateUrl: './manage-city.component.html',
  styleUrls: ['./manage-city.component.scss']
})
export class ManageCityComponent {
 displayedColumns: string[] = [`name`,'isActive', 'actions'];
  //vocabColumns: string[] = ['word', 'meaning','isActive', 'actions'];
  
  AddMode: boolean = true
  EditMode: boolean = false
  dataSource: any
  typeKeyCode: string = "";
  settingName: string = "";
  Edit: boolean = false;
  selectedOption: string | undefined;
  DisabledType: boolean = false;
  type: CitiesTypeVM = new CitiesTypeVM;
  CitiesType?: CitiesTypeVM[];
  
  @ViewChild('CityForm', { static: true }) CityForm!: NgForm;
  selectedCities = new CitiesVM();
  //vocabDataSource : any
  selectedCity: CityVM 
  Add: boolean = true;
  Cities: CitiesVM[] | undefined;
  
  values?: CitiesVM[];
  //selectedVocabulary: VocabularyVM
  cities?: CityVM[]
  
  dialogRefe: any;
  dialogData: any;
  // isDialog: any;
  isDialogOpen = false;
  isDialog : boolean = false;
  proccessing: boolean | undefined;
  // public dialogRef?: MatDialogRef<ManageCourseComponent>;
  //Course: CourseVM[] | undefined;
  //vocab: VocabularyVM[]=[]
  constructor(private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedCity = new CityVM
    
    //private injector: Injector,
    this.dialogRefe = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    //this.selectedVocabulary = new VocabularyVM
  }
  ngOnInit(): void {
    this.GetCity();
    this.selectedCity.isActive = true;
   // this.isDialog = this.dialogData.isDialog;
   if (this.dialogData ) {
    this.isDialog =this.dialogData.isDialogue;
    console.warn(this.dialogData.cityId)}
   }
 
  // Search() {
  //   debugger
  //   if(this.Edit==false)
  //   this.settingName=""
  //   var setting = new CitiesVM();
  //   if (!this.Edit)
  //     this.selectedCities.parentId = 0;
  //   setting.enumTypeId = this.selectedCities.enumTypeId;
  //   if (this.type.parentId != 0 && this.type.parentId != undefined) {
  //     setting.enumTypeId = this.type.parentId
  //     console.warn(setting)
  //     this.catSvc.SearchCities(setting).subscribe({
  //       next: (res: CitiesVM[]) => {
  //         this.Cities = res;
  //         console.warn(this.Cities)
  //       }, error: (e) => {
  //         this.catSvc.ErrorMsgBar("Error OccurRed!", 5000)
  //       }
  //     })
  //   }
  //   else {
  //     this.Cities = []
  //   }
  //   var stng = new CitiesVM();
  //   stng.enumTypeId = this.selectedCities.enumTypeId
  //   this.catSvc.SearchCities(stng).subscribe((res: CitiesVM[]) => {
  //     this.Cities = res;
  //     this.dataSource = new MatTableDataSource(res);
  //     if (this.DisabledType == true)
  //       this.values = res;
  //   });
  // }
  

  SaveCity() {
  //   this.lmsSvc.SaveCity(this.selectedCity).subscribe({
  //     next: (value) => {
  //       debugger;
  //       this.catSvc.SuccessMsgBar("Successfully Added", 5000)
        
  //       this.Refresh();
  //     }, error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //     },
  //   })
  // } 
  this.lmsSvc.GetCity().subscribe({
    next: (res: CityVM[]) => {
      var list = res
      if (this.Edit)
        list = list.filter(x => x != this.selectedCity)
      var find = list.find(x => x.name == this.selectedCity.name)
      if (find == undefined) {

        this.proccessing = true
        if (!this.CityForm.invalid) {
          if (this.Edit)
            this.UpdateCity
          else {
            this.lmsSvc.SaveCity(this.selectedCity).subscribe({
              next: (res) => {
                this.catSvc.SuccessMsgBar("User Successfully Added!", 5000)
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
          this.catSvc.ErrorMsgBar("City required fields!", 5000)
          
          this.proccessing = false
        }
      } 
      else
        this.catSvc.ErrorMsgBar("This Name Address Already Taken ", 5000)
    }, error: (e) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      console.warn(e);
    }
  })
}

  EditCity(city: CityVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedCity = city
  }
  UpdateCity() {
    this.lmsSvc.UpdateCity(this.selectedCity).subscribe({
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
    this.selectedCity = new CityVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteCity(id: number) {
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
        this.lmsSvc.DeleteCity(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Topic has been deleted.',
              'success'
            )
            this.Refresh();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }


  GetCity() {
    // var city = new CityVM
    // city.isActive= true;
    this.lmsSvc.GetCity().subscribe({
      
      next: (value: CityVM[]) => {
        debugger;
        this.cities = value
        this.dataSource = new MatTableDataSource(this.cities)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })


 }
//  GetCityForEdit(id: number) {
//   this.selectedCity = new CityVM;
//   this.selectedCity.id = id
//   console.warn(this.selectedCity);
//   this.lmsSvc.SearchCity(this.selectedCity).subscribe({
//     next: (res: CityVM[]) => {
//       this.Cities = res;
//       console.warn(this.Cities);
//       this.selectedCity = this.Cities[0]
//       this.Edit = true;
//       this.Add = false;
//     }, error: (e) => {
//       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
//       console.warn(e);
//     }
//   })
// }

}
