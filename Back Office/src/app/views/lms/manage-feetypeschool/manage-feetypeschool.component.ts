import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { FeetypeschoolVM } from '../Models/FeetypeschoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-feetypeschool',
  templateUrl: './manage-feetypeschool.component.html',
  styleUrls: ['./manage-feetypeschool.component.css']
})
export class ManageFeetypeschoolComponent implements OnInit{
  displayedColumns: string[] = ['title','type','isRefundable','isActive','actions']
  processing: boolean = false;
  Edit: boolean = false;
  feetypes: string[]; // Add this line

  Add: boolean = true;
DisabledType: boolean = false;
  dataSource: any
  selectedFeetypeschool= new FeetypeschoolVM
  @ViewChild('feetypeschoolForm', { static: true }) feetypeschoolForm: NgForm;
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
      this.selectedFeetypeschool = new FeetypeschoolVM();
    }
    ngOnInit(): void {
      this.GetFeetypeschool()
      this.Add = true;
      this.selectedFeetypeschool.isActive = true;
      this.isDialog = this.dialogData.isDialog;
     ; }
      GetFeetypeschool() {
        this.lmsSvc.GetFeetypeschool().subscribe({
          next: (res: FeetypeschoolVM[]) => {
            this.dataSource = new MatTableDataSource(res);
           
          },
          error: (e) => {
            console.warn(e);
          }
        });
      }
    DeleteFeetypeschool(id: number) {
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
          this.lmsSvc.DeleteFeetypeschool(id).subscribe({
            next: (data) => {
              Swal.fire(
                'Deleted!',
                'FeeType has been deleted.',
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
  
    SaveFeetypeschool() {
      if (this.Add) {
        this.lmsSvc.SaveFeetypeschool(this.selectedFeetypeschool).subscribe({
          next: (res: any) => {
            this.GetFeetypeschool();
            this.selectedFeetypeschool = new FeetypeschoolVM();
            this.selectedFeetypeschool.isActive = true;
          },
          error: (e) => {
            console.warn(e);
          }
        });
      } else {
        this.lmsSvc.UpdateFeetypeschool(this.selectedFeetypeschool).subscribe({
          next: (res: any) => {
            this.GetFeetypeschool();
            this.selectedFeetypeschool = new FeetypeschoolVM();
            this.selectedFeetypeschool.isActive = true;
            this.Add = true;

          },
          error: (e) => {
            console.warn(e);
          }
        });
      }
    }
    EditFeetypeschool(feetypeschool: FeetypeschoolVM) {
      this.Edit = true
      this.Add = false
      this.selectedFeetypeschool = feetypeschool
      this.selectedFeetypeschool.isActive = true;
    }
    GetFeetypeschoolForEdit(id: number) {
      this.selectedFeetypeschool = new FeetypeschoolVM();
      this.selectedFeetypeschool.id = id;
      console.warn(this.selectedFeetypeschool);  
      this.lmsSvc.SearchFeetypeschool(this.selectedFeetypeschool).subscribe({
        next: (res: FeetypeschoolVM[]) => {
          if (res.length > 0) {
            this.selectedFeetypeschool = res[0];
            this.Edit = true;
            this.Add = false;
          } else {
            console.log('FeeType not found for editing.');
          }
        },
        error: (e) => {
          console.warn(e);
        }
      });
    }

    UpdateFeetypeschool() {
      if (this.selectedFeetypeschool.title &&  this.selectedFeetypeschool.type  ) {
        this.processing = true; 
        this.lmsSvc.UpdateFeetypeschool(this.selectedFeetypeschool).subscribe({
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
      this.selectedFeetypeschool = new FeetypeschoolVM();
    }
  }
  