import { FormBuilder, NgForm } from '@angular/forms';

import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from './../lms.service';
import { Component, OnInit, ViewChild } from '@angular/core';

import { PatientVM } from '../Models/PatientVM';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-manage-patient',
  templateUrl: './manage-patient.component.html',
  styleUrls: ['./manage-patient.component.css']
})
export class ManagePatientComponent implements OnInit {
 
//  PatientForm: FormGroup;
  //selectedPatient: any; // Replace with your actual class/interfac
  
 
   
    patColumns: string[] = ['patientName', 'dateOfBirth', 'gender', 'contactNo', 'houseNo', 'address', 'remarks','isActive', 'actions'];
   
    AddMode: boolean = true
    EditMode: boolean = false
    Add: boolean = true;
    Edit: boolean = false;
    proccessing: boolean = false;
   
    patDataSource : any
    hide = true;

    pat: PatientVM[]=[]
    selectedPatient: PatientVM
    @ViewChild('PatientForm', { static: true }) PatientForm: NgForm;
   
   
    constructor(
      private lmsSvc: LMSService,
      private catSvc: CatalogService,
      private fb: FormBuilder) {
      this.selectedPatient = new PatientVM
    }
    ngOnInit(): void {
 
      this.GetPatient();
      
    this.selectedPatient.isActive = true;
    }
        

    GetPatient() {
      this.lmsSvc.GetPatient().subscribe({
        next: (value: PatientVM[]) => {
          debugger;
          this.pat = value
          this.patDataSource = new MatTableDataSource(this.pat)
        }, error: (err) => {
          alert('Error to retrieve Patient');
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
  }
  SavePatient() {
  if (!this.selectedPatient.patientName || !this.selectedPatient.gender || !this.selectedPatient.contactNo) {
    this.catSvc.ErrorMsgBar("Please fill in all required fields.", 5000);
    return; // Exit the function if any required field is empty
  }

  this.lmsSvc.SavePatient(this.selectedPatient).subscribe({
    next: (value) => {
      this.catSvc.SuccessMsgBar("Successfully Added", 5000);
      this.Refresh();
    }, 
    error: (err) => {
      this.catSvc.ErrorMsgBar("Error Occurred", 5000);
    },
  });
}


  

  EditPatient(pat: PatientVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedPatient = pat
    this.selectedPatient.isActive = true;
  }
  
  

  UpdatePatient() {
    this.proccessing = true;

    if (this.PatientForm && !this.PatientForm.invalid && this.selectedPatient) {
      this.lmsSvc.UpdatePatient(this.selectedPatient).subscribe({
        next: (value) => {
          this.catSvc.SuccessMsgBar("Successfully Updated", 5000);
          this.Add = true;
          this.Edit = false;
          this.proccessing = false;
          this.ngOnInit();
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
    this.GetPatient();
    this.selectedPatient = new PatientVM
    this.selectedPatient.isActive = true;
    this.Add = true;
    this.Edit = false;
  }
  DeletePatient(id: number) {
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
  
