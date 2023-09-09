import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { InquiryService } from '../Inquiry.Service';
import { FieldPossibleValuesVM } from '../Models/models/FieldPossibleValuesVM';
import { FieldVM } from '../Models/models/fieldVm';

@Component({
  selector: 'app-field-possible-values-dialog',
  templateUrl: './field-possible-values-dialog.component.html',
  styleUrls: ['./field-possible-values-dialog.component.css']
})
export class FieldPossibleValuesDialogComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  field: FieldVM[];
  fieldId: number;
  FPVId: number;
  durationInSeconds = 3;
  displayedColumns: string[];
  dataSource;
  fpValues: FieldPossibleValuesVM[]
  hide = true;
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<FieldPossibleValuesDialogComponent>,
    private snack: MatSnackBar,
    public inqSvc: InquiryService,
  ) {
    this.inqSvc.selectedFPValues = new FieldPossibleValuesVM();
  }
  ngOnInit(): void {
    this.fieldId = this.data.fpvId;
    this.GetById();
    this.GetFPValues();
    this.Edit = false;
    this.Add = true;
  }
  GetById() {
    this.inqSvc.selectedField = new FieldVM;
    this.inqSvc.selectedField.id = this.fieldId
    this.inqSvc.SearchField(this.inqSvc.selectedField).subscribe((res: FieldVM[]) => {
      this.field = res;
      this.inqSvc.selectedFPValues.fieldName = this.field[0].title
      this.inqSvc.selectedFPValues.type = this.field[0].type
    })
  }
  GetFPValues() {
    debugger
    this.inqSvc.selectedFPValues = new FieldPossibleValuesVM
    this.inqSvc.selectedFPValues.fieldId = this.fieldId
    this.inqSvc.SearchFPValues(this.inqSvc.selectedFPValues).subscribe((res: FieldPossibleValuesVM[]) => {
      this.fpValues = res;
      if (res.length !== 0)
        this.displayedColumns = ['Value', 'actions'];
      this.dataSource = new MatTableDataSource(this.fpValues);
    });
  }
  SaveFPValues() {
    debugger;
    if (this.Edit == true) {
      this.PutFPValues();
    } else {
      this.inqSvc.selectedFPValues.fieldId = this.fieldId
      this.inqSvc.SaveFPValues(this.inqSvc.selectedFPValues).subscribe((data) => {
        this.ngOnInit();
        this.snack.open('Value Added!', 'OK', { duration: 4000 })
        // window.location.reload();  
      },
        (err: any) => {
          alert('Error')

        });
    }
  }
  PutFPValues() {
    this.inqSvc.UpdateFPValues(this.inqSvc.selectedFPValues).subscribe((data) => {
      this.snack.open('value Updated Successfully!', 'OK', { duration: 4000 })
      this.Add = true;
      this.Edit = false;
      this.inqSvc.selectedFPValues.fieldValue = null;
      this.ngOnInit();
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  GetFieldForEdit(id) {
    this.inqSvc.selectedFPValues = new FieldPossibleValuesVM;
    this.inqSvc.selectedFPValues.id = id
    this.inqSvc.SearchFPValues(this.inqSvc.selectedFPValues).subscribe((res: FieldPossibleValuesVM[]) => {
      this.fpValues = res;
      this.inqSvc.selectedFPValues = this.fpValues[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  DeleteFPValues(id) {
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
        this.inqSvc.DeleteFPValues(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Value has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })

  }

}
