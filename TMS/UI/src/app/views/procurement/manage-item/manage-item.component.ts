import { EnumType } from './../../task/models/EnumType';
import { EnumValueVM } from './../../task/models/EnumValueVM';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ItemVM } from '../models/ItemVM';
import { ProcurementService } from './../procurement.service';
import { EnumTypeVM } from '../models/EnumTypeVM';
import { ActivatedRoute, Router } from '@angular/router';


@Component({
  selector: 'app-manage-item',
  templateUrl: './manage-item.component.html',
  styleUrls: ['./manage-item.component.css']
})
export class ManageItemComponent implements OnInit {
getItemById:ItemVM[] 
Edit:boolean=false;
Add:boolean=true;
ItemId:number;
item:ItemVM[]
UOM:EnumValueVM[]

  constructor(
    private router:Router,
    private route:ActivatedRoute,
    public proSvc: ProcurementService,
    private snack: MatSnackBar
  ) {
    this.proSvc.selectedItem= new ItemVM
   }
  
  ngOnInit(): void {
    this.GetEnumValues(EnumTypeVM.UOM);
    this.route.queryParams.subscribe(params => {
      console.warn(this.getItemById)
      this.ItemId = params.id;
     });
     console.warn( this.ItemId )
     if (this.ItemId>0){
       this.Edit=true;
       this.Add=false;
       this.GetItemById(); 
     }
  }
  GetEnumValues(etype: EnumTypeVM) {
    this.proSvc.GetEnumValues(etype).subscribe((res: EnumValueVM[]) => {
      console.warn(res);
    if(etype==EnumTypeVM.UOM)
    this.UOM=res;
    },
    (err: any) => {
      this.snack.open('Error Occured!', 'OK', { duration: 4000 })

    });
    }
  SaveItem() {
    if (this.ItemId>0){
      this.PutItem();
      }else{
    this.proSvc.SaveItem(this.proSvc.selectedItem).subscribe((data) => {
      this.snack.open('Item Added!', 'OK', { duration: 4000 })  
  
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })

      });}
  }
  GetItemById(){
    debugger
     this.proSvc.selectedItem.id=this.ItemId
     this.proSvc.SearchItem( this.proSvc.selectedItem).subscribe((res: ItemVM[]) => {
      this.getItemById = res;
      console.warn( this.getItemById)
       this.proSvc.selectedItem=this.getItemById[0]
    });
  }
  PutItem(){
   
    this.proSvc.selectedItem=this.getItemById[0]
     this.proSvc.UpdateItem(this.proSvc.selectedItem).subscribe((data) => {
     // this.router.navigate(['/procurement/itemList']);
       this.snack.open('Item Updated Successfully!', 'OK', { duration: 4000 }) 
       

     },
       (err: any) => {
         this.snack.open('Error Occured!', 'OK', { duration: 4000 })
   
       });
   }
}
