import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ExpenseTypeVM } from './../Models/ExpenseTypeVM';
import { ExpenseService } from './../expense.service';
import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { ExpenseTypeDialogComponent } from '../expense-type-dialog/expense-type-dialog.component';
@Component({
  selector: 'app-expense-type-list',
  templateUrl: './expense-type-list.component.html',
  styleUrls: ['./expense-type-list.component.css']
})
export class ExpenseTypeListComponent implements OnInit {
  public dialogRef: MatDialogRef<ExpenseTypeDialogComponent>;
  expType: ExpenseTypeVM[];
  dataSource;
  displayedColumns = ['type', 'comment', 'actions'];
  constructor(
    private route: Router,
    public expSvc: ExpenseService,
    public dialog: MatDialog
  ) {
    this.expSvc.selectedExpenseType = new ExpenseTypeVM
  }
  ngOnInit(): void {
    this.expSvc.SearchExpenseType(this.expSvc.selectedExpenseType).subscribe((res: ExpenseTypeVM[]) => {
      this.expType = res;
      this.dataSource = this.expType
    });
  }
  DeleteExpenseType(id) {
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
        this.expSvc.DeleteExpenseType(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'ExpenseType has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
  EditExpenseType(exp: ExpenseTypeVM) {
    this.dialogRef = this.dialog.open(ExpenseTypeDialogComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '550px', height: '250px'
      , data: { Id: exp.id }
    })
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          this.expSvc.selectedExpenseType = new ExpenseTypeVM
          this.ngOnInit();
        }
      })
  }
}
