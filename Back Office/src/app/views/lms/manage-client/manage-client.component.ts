import { Component } from '@angular/core';
import { ClientVM } from '../Models/ClientVM';

@Component({
  selector: 'app-manage-client',
  templateUrl: './manage-client.component.html',
  styleUrls: ['./manage-client.component.css']
})
export class ManageClientComponent {
  AddMode: boolean = true
  EditMode: boolean = false
  hide = true;

  selectedClient: ClientVM

  constructor(
    // private lmsSvc: LMSService,
    // private catSvc: CatalogService,
    ) {
    this.selectedClient = new ClientVM
  }
  ngOnInit(): void {

    // this.GetPatient();
    
  this.selectedClient.isActive = true;
  }
}
