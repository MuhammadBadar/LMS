import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { GuardianschoolVM } from '../Models/GuardianschoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-manage-guardianschool',
  templateUrl: './manage-guardianschool.component.html',
  styleUrls: ['./manage-guardianschool.component.css']
})
export class ManageGuardianschoolComponent implements OnInit{
  displayedColumns: string[] = ['name','cnic','address','cell1','cell2','cell3','email','whatsapp','isActive','actions']
  processing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
DisabledType: boolean = false;
  dataSource: any
  selectedGuardianschool= new GuardianschoolVM
  @ViewChild('guardianschoolForm', { static: true }) guardianschoolForm: NgForm;
  dialogref: any
  dialogData: any;
    isDialog: boolean = false;
    isActive?: false
    hide = true;
    constructor(
      private injector: Injector,
      private lmsSvc: LMSService,
      private catSvc: CatalogService,
      private dialog: MatDialog) {
      this.dialogref = this.injector.get(MatDialogRef, null);
      this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
      this.selectedGuardianschool = new GuardianschoolVM();
    }
    ngOnInit(): void {
      this.GetGuardianschool()
      this.Add = true;
      this.selectedGuardianschool.isActive = true;
      this.isDialog = this.dialogData.isDialog; }
    GetGuardianschool() {
      this.lmsSvc.GetGuardianschool().subscribe({
        next: (res: GuardianschoolVM[]) => {
          this.dataSource = new MatTableDataSource(res);},
        error: (e) => {
          console.warn(e);
        }
      });
    }

    DeleteGuardianschool(id: number) {
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
          this.lmsSvc.DeleteGuardianschool(id).subscribe({
            next: (data) => {
              Swal.fire(
                'Deleted!',
                'Guardian has been deleted.',
                'success'
              );
              this.ngOnInit();
            },
            error: (e) => {
              console.warn(e);
            }
          });
        }
      });
    }
  
    SaveGuardianschool() {
      if (this.selectedGuardianschool.name &&  this.selectedGuardianschool.cnic &&  this.selectedGuardianschool.address && this.selectedGuardianschool.cell1  &&  this.selectedGuardianschool.whatsapp) {
        this.processing = true; 
    
        if (this.Edit) {
          this.UpdateGuardianschool();
        } else {
          this.lmsSvc.SaveGuardianschool(this.selectedGuardianschool).subscribe({
            next: (res) => {
              this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
              this.ngOnInit();
              this.Refresh(); 
              window.scrollTo(0, 0);
              this.processing = false; 
            },
            error: (e) => {
              console.warn(e);
              this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
              this.processing = false; 
            }
          });
        }
      } else {
        this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
      }
    }
    
    EditGuardianschool(guardianschool: GuardianschoolVM) {
      this.Edit = true
      this.Add = false
      this.selectedGuardianschool = guardianschool
      this.selectedGuardianschool.isActive = true;
    }
    GetGuardianschoolForEdit(id: number) {
      this.selectedGuardianschool = new GuardianschoolVM();
      this.selectedGuardianschool.id = id;
      console.warn(this.selectedGuardianschool);  
      this.lmsSvc.SearchGuardianschool(this.selectedGuardianschool).subscribe({
        next: (res: GuardianschoolVM[]) => {
          if (res.length > 0) {
            this.selectedGuardianschool = res[0];
            this.Edit = true;
            this.Add = false;
          } else {
            console.log('Guardian not found for editing.');
          }
        },
        error: (e) => {
          console.warn(e);
        }
      });
    }

    UpdateGuardianschool() {
      if (this.selectedGuardianschool.name &&  this.selectedGuardianschool.cnic &&  this.selectedGuardianschool.address && this.selectedGuardianschool.cell1 &&  this.selectedGuardianschool.whatsapp) {
        this.processing = true; 
        this.lmsSvc.UpdateGuardianschool(this.selectedGuardianschool).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Successfully Updated!", 5000);
            this.Add = true;
            this.Edit = false; 
            this.processing = false;
            this.ngOnInit();
          },
          error: (e) => {
            console.warn(e);
            this.catSvc.ErrorMsgBar("Error Occurred", 5000);
            this.processing = false; 
          }
        });
      } else {
        this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
      }
    }
    Refresh() {
      this.Add = true;
      this.Edit = false;
      this.selectedGuardianschool = new GuardianschoolVM();
    }
  }
  