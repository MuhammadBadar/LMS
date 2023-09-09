import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { InquiryService } from '../Inquiry.Service';
import { ServicesVM } from '../Models/models/ServicesVM';

@Component({
  selector: 'app-manage-service',
  templateUrl: './manage-service.component.html',
  styleUrls: ['./manage-service.component.css']
})
export class ManageServiceComponent implements OnInit {
  Add: boolean = true;
  Edit: boolean = false;
  dataSource;
  GetSrvcById: ServicesVM[]
  displayedColumns = ['name', 'content', 'actions'];
  services: ServicesVM[]
  constructor(
    public inqSvc: InquiryService,
    private snack: MatSnackBar
  ) { this.inqSvc.selectedServices = new ServicesVM }

  ngOnInit(): void {
    this.inqSvc.getServices().subscribe((res: ServicesVM[]) => {
      this.services = res;
      this.dataSource = new MatTableDataSource(this.services);
    });
  }
  SaveService() {
    this.inqSvc.SaveService(this.inqSvc.selectedServices).subscribe((data) => {
      this.snack.open('Service Successfully Saved!', 'OK', { duration: 4000 })
      this.ngOnInit();
      this.inqSvc.selectedServices = new ServicesVM
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      })
  }
  UpdateService() {
    this.inqSvc.UpdateService(this.inqSvc.selectedServices).subscribe((res) => {
      this.snack.open('Successfully Updated!', 'OK', { duration: 4000 })
      this.Add = true;
      this.Edit = false;
      //this.inqSvc.selectedServices= new ServicesVM;
      this.ngOnInit();
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      })
  }
  DeleteService(id) {
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
        this.inqSvc.DeleteService(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Service has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
  EditService(id) {
    this.inqSvc.selectedServices = new ServicesVM;
    this.inqSvc.selectedServices.id = id
    this.inqSvc.SearchService(this.inqSvc.selectedServices).subscribe((res: ServicesVM[]) => {
      this.GetSrvcById = res;
      this.inqSvc.selectedServices = this.GetSrvcById[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  Refresh() {
    this.inqSvc.selectedServices = new ServicesVM;
    this.Add = true;
    this.Edit = false;
  }
}
