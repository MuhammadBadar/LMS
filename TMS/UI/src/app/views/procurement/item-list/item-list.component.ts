import { ItemVM } from './../models/ItemVM';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { ProcurementService } from './../procurement.service';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
@Component({
  selector: 'app-item-list',
  templateUrl: './item-list.component.html',
  styleUrls: ['./item-list.component.css']
})
export class ItemListComponent implements OnInit {
  item:ItemVM[]
  displayedColumns: string[] = ['code', 'name', 'uom', 'saleprice','Action'];
  dataSource ;
 
  constructor(
    private route:Router,
    public proSvc :ProcurementService,
  ) { 
    this.proSvc.selectedItem= new ItemVM
  }

  ngOnInit(): void {
    this.proSvc.getItemList().subscribe((res: ItemVM[]) => {
      this.item = res;
    this.dataSource= new MatTableDataSource (this.item);
    });
  }
  DeleteItem(id){
    debugger
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
        this.proSvc.DeleteItem(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Item has been deleted.',
            'success'
          )
          this.ngOnInit();
       })   
      }
    }) 
  }
  EditItem(Item:ItemVM){
      debugger
     this.route.navigate(['/procurement/mngItem'], { queryParams: { id: Item.id}
     });
  }
}
