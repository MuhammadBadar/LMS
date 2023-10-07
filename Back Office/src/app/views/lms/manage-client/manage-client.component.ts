import { Component, ViewChild } from '@angular/core';
import { ClientVM } from '../Models/ClientVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { NgForm } from '@angular/forms';
import Swal from 'sweetalert2';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-manage-client',
  templateUrl: './manage-client.component.html',
  styleUrls: ['./manage-client.component.css']
})
export class ManageClientComponent {
  Columns: string[] = ['clientName', 'cnic', 'cell', 'address', 'email', 'joiningDate','isActive', 'actions'];
  AddMode: boolean = true
  EditMode: boolean = false
  Add: boolean = true;
    Edit: boolean = false;
  hide = true;
  proccessing: boolean = false;

  selectedClient: ClientVM
  clt: ClientVM[]=[]
  clien: ClientVM[] | undefined;
    
  @ViewChild('ClientForm', { static: true }) ClientForm: NgForm;
  
  dataSource: any;

  constructor(
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    ) {
    this.selectedClient = new ClientVM
  }
  ngOnInit(): void {

    this.GetClient();
    
  this.selectedClient.isActive = true;
  }


  SaveClient() {
    // Check if both user and schedule type are selected
    if(this.selectedClient.clientName == null || this.selectedClient.clientName == undefined)
    {
      
      // selectedClient.userId
      this.catSvc.ErrorMsgBar("Please enter Client.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
    debugger;
    if(this.selectedClient.cnic == null || this.selectedClient.cnic == undefined)
    {
      this.catSvc.ErrorMsgBar("Please enter CNIC.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
    if(this.selectedClient.cell == null || this.selectedClient.cell == undefined)
    {
      this.catSvc.ErrorMsgBar("Please enter Cell Number.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
    if(this.selectedClient.address == null || this.selectedClient.address == undefined)
    {
      this.catSvc.ErrorMsgBar("Please enter Address.", 5000);
      return; // Exit the function if either user or schedule type is empty
    }
    
    this.lmsSvc.SaveClient(this.selectedClient).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000);
        this.Refresh();
      }, 
      error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      },
    });
  }

  GetClient() {
    var client = new ClientVM
    client.isActive= true;
    this.lmsSvc.SearchClient(client).subscribe({
      next: (res: ClientVM[]) => {
        this.clien = res;
       this.dataSource = new MatTableDataSource(this.clien);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }


EditClient(pat: ClientVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedClient = pat
    this.selectedClient.isActive = true;
  }
  
  

  UpdateClient() {
    this.proccessing = true;

    if (this.ClientForm && !this.ClientForm.invalid && this.selectedClient) {
      this.lmsSvc.UpdateClient(this.selectedClient).subscribe({
        next: (value) => {
          this.catSvc.SuccessMsgBar("Successfully Updated", 5000);
          this.Add = true;
          this.Edit = false;
          this.proccessing = false;
          this.ngOnInit();
          this.Refresh();
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
          console.warn(err);
          this.proccessing = false;
        }
      });
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000);
      this.proccessing = false;
    }
  }
  
  Refresh() {
    this.GetClient();
    this.selectedClient = new ClientVM
    this.selectedClient.isActive = true;
    this.Add = true;
    this.Edit = false;
  }
  DeleteClient(id: number) {
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
        this.lmsSvc.DeletePatient(id).subscribe({
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


}
