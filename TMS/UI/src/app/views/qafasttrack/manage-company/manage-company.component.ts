
import { QAFastTrackService } from './../qafasttrack.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { EnumValueVM } from '../models/EnumValueVM';
import { EnumTypeVM } from '../models/EnumTypeVM';
import { ManageCompanyVM } from '../models/ManageCompanyVM';
import Swal from 'sweetalert2';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';


@Component({
  selector: 'app-manage-company',
  templateUrl: './manage-company.component.html',
  styleUrls: ['./manage-company.component.css']
})
export class ManageCompanyComponent implements OnInit {
  @ViewChild('userForm', { static: true }) userForm: NgForm;
city;
province;
country;
  cities: EnumValueVM[];
  provinces: EnumValueVM[];
  countries: EnumValueVM[];
  constructor( 
    private snack: MatSnackBar,
    public qafastSvc:QAFastTrackService) { 
    this.qafastSvc.selectedCom= new ManageCompanyVM
    this.qafastSvc.selectedEnumValue= new EnumValueVM
  }

  ngOnInit(): void {
    this.qafastSvc.selectedCom.countryId=1
    this.qafastSvc.selectedCom.cityId=1
    this.qafastSvc.selectedCom.provinceId=1
    this.GetEnumValues(EnumTypeVM.City);
    this.GetEnumValues(EnumTypeVM.Province);
    this.GetEnumValues(EnumTypeVM.Country);
  }
  GetEnumValues(etype: EnumTypeVM) {
    this.qafastSvc.GetEnumValues(etype).subscribe((res: EnumValueVM[]) => {
      if (etype == EnumTypeVM.City)
        this.cities = res;
      else if (etype == EnumTypeVM.Province)
        this.provinces = res;
      else if (etype == EnumTypeVM.Country)
        this.countries = res;
    },
      (err: any) => {
        alert('Connection Error')

      });
  }
  Reset(){
    this.userForm.reset();
    this.ngOnInit();
  }
  SaveManageCompany(){
    this.qafastSvc.SaveManageConpany(this.qafastSvc.selectedCom).subscribe((data:any) => {
       console.warn(data)
       if(data==true){
         Swal.fire({
           icon:'success',
           position:  'center' ,
           text:'Data Successfully Added',
           background: "#FFFFFF",
           confirmButtonColor: "#000000"
        
       
         })
     //  this.snack.open('User Added!', 'OK', { duration: 4000 })
       this.Reset();
      }
       else{
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Something went wrong!',

        })
       }
     },
       (err: any) => {
        if(err.status==0){
         Swal.fire({
           icon: 'error',
           title: 'Oops...',
           text: 'Something went wrong!',
           footer: 'Please check your Internet Connection'
         })}
         else{
           Swal.fire({
             icon: 'error',
             title: 'Oops...',
             text: 'Something went wrong!',
           })} 
   
       });
  }
  InsertNewCity(){
    var find =this.cities.find(x=>x.value==this.city)
    if(find==null){
    this.qafastSvc.selectedEnumValue.enumTypeId=1001
    this.GetEnumValues(EnumTypeVM.City);
    this.qafastSvc.selectedEnumValue.id=1001000+ this.cities.length+1
    this.qafastSvc.selectedEnumValue.value= this.city
    this.AddEnumValue();
    this.city=null
    }
    else{
      this.snack.open( "This City is already added ",'Ok', { duration: 5000 })
    }
  }
  InsertNewCountry(){
    var find =this.countries.find(x=>x.value==this.country)
    if(find==null){
    this.qafastSvc.selectedEnumValue.enumTypeId=1003
    this.GetEnumValues(EnumTypeVM.Country);
    this.qafastSvc.selectedEnumValue.id=1003000+this.countries.length+1
    this.qafastSvc.selectedEnumValue.value= this.country
    this.AddEnumValue();
    this.country=null
  }
  else{
    this.snack.open( "This Country is already added ", 'Ok',{ duration: 5000 })
  }
  }
  InsertNewProvince(){
    var find =this.provinces.find(x=>x.value==this.province)
    if(find==null){
    this.qafastSvc.selectedEnumValue.enumTypeId=1002
    this.GetEnumValues(EnumTypeVM.Province);
    this.qafastSvc.selectedEnumValue.id=1002000+this.provinces.length+1
    this.qafastSvc.selectedEnumValue.value=this.province
    this.AddEnumValue();
    this.province= null}
    else{
      this.snack.open( " This Province is already added ",'Ok', { duration: 5000 })
    }
    
  }
  AddEnumValue(){
    this.qafastSvc.SaveEnumValue(this.qafastSvc.selectedEnumValue).subscribe((data:any) => {
    this.ngOnInit();
  },
    (err: any) => {
      alert('Connection Error')

    });
  }
}
