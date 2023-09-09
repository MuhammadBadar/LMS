import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { FieldPossibleValuesDialogComponent } from '../field-possible-values-dialog/field-possible-values-dialog.component';
import { InquiryService } from '../Inquiry.Service';
import { EnumTypeVM } from '../Models/models/EnumTypeVM';
import { EnumValueVM } from '../Models/models/EnumValueVM';
import { FieldPossibleValuesVM } from '../Models/models/FieldPossibleValuesVM';
import { FieldVM } from '../Models/models/fieldVm';

@Component({
  selector: 'app-manage-field',
  templateUrl: './manage-field.component.html',
  styleUrls: ['./manage-field.component.css']
})
export class ManageFieldComponent implements OnInit {
  indeterminate = false;
  labelPosition = 'after';
  disabled = false;
  Edit: boolean = false;
  Type: EnumValueVM[];
  Add: boolean = true;
  field: FieldVM[];
  displayedColumns: string[] = ['Title', 'Type', 'actions'];
  dataSource;
  public dialogRef: MatDialogRef<FieldPossibleValuesDialogComponent>;
  constructor(
    public dialog: MatDialog,
    private snack: MatSnackBar,
    public inqSvc: InquiryService,
  ) {
    this.inqSvc.selectedField = new FieldVM
  }
  ngOnInit(): void {
    this.GetEnumValues(EnumTypeVM.TypeofField);
    this.GetField();
  }
  GetEnumValues(etype: EnumTypeVM) {
    this.inqSvc.GetEnumValues(etype).subscribe((res: EnumValueVM[]) => {
      console.warn(res);
      if (etype == EnumTypeVM.TypeofField)
        this.Type = res;
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  GetField() {
    this.inqSvc.getField().subscribe((res: FieldVM[]) => {
      this.field = res;
      this.dataSource = new MatTableDataSource(this.field);
    });
  }
  DeleteField(id) {
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
        this.inqSvc.DeleteField(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Field has been deleted.',
            'success'
          )
          this.GetField();
        })
      }
    })
  }
  GetFieldForEdit(id) {
    this.inqSvc.selectedField = new FieldVM;
    this.inqSvc.selectedField.id = id
    this.inqSvc.SearchField(this.inqSvc.selectedField).subscribe((res: FieldVM[]) => {
      this.field = res;
      this.inqSvc.selectedField = this.field[0]
      console.warn(this.inqSvc.selectedField)
      this.Edit = true;
      this.Add = false;
    })
  }
  SaveField() {
    console.warn(this.inqSvc.selectedField)
    this.inqSvc.SaveField(this.inqSvc.selectedField).subscribe((data) => {
      this.inqSvc.getField().subscribe((res: FieldVM[]) => {
        this.field = res;
        this.dataSource = new MatTableDataSource(this.field);
        this.inqSvc.selectedField = new FieldVM;
      });
      this.snack.open('Field  successfully Added!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  UpdateField() {
    this.inqSvc.UpdateField(this.inqSvc.selectedField).subscribe((res) => {
      this.snack.open('Successfully Updated!', 'OK', { duration: 4000 })
      this.Add = true;
      this.Edit = false;
      this.inqSvc.selectedField = new FieldVM;
      this.ngOnInit();
    })
  }
  Refresh() {
    this.inqSvc.selectedField = new FieldVM;
    this.Add = true;
    this.Edit = false;
  }
  FPValue(fpv: FieldPossibleValuesVM) {
    let dialogRef = this.dialog.open(FieldPossibleValuesDialogComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '550px', height: '250px'
      , data: { fpvId: fpv.id }
    });
  }
}

