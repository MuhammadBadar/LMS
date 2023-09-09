import { ExpenseService } from './../expense.service';
import { ExpenseTypeVM } from './../Models/ExpenseTypeVM';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
@Component({
  selector: 'app-expense-type-dialog',
  templateUrl: './expense-type-dialog.component.html',
  styleUrls: ['./expense-type-dialog.component.css']
})
export class ExpenseTypeDialogComponent implements OnInit {
  ExpenseType: ExpenseTypeVM
  ExpenseId: number;
  Edit: boolean = false;
  Add: boolean = true;
  constructor(
    public expSvc: ExpenseService,
    private snack: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<ExpenseTypeDialogComponent>,
  ) {
    this.expSvc.selectedExpenseType = new ExpenseTypeVM
  }
  ngOnInit(): void {
    console.warn(this.data)
    this.ExpenseId = this.data.Id;
    if (this.ExpenseId > 0) {
      this.GetById();
      this.Edit = true;
      this.Add = false;
    }
  }
  GetById() {
    this.expSvc.GetExpenseTypeById(this.ExpenseId).subscribe((res: ExpenseTypeVM) => {
      this.ExpenseType = res;
      this.expSvc.selectedExpenseType = this.ExpenseType[0]
    });
  }
  SaveExpenseType() {
    if (this.Edit == true) {
      this.UpdateExpenseType();
    } else {
      this.expSvc.SaveExpenseType(this.expSvc.selectedExpenseType).subscribe((data) => {
        this.snack.open('Expense Type Successfully Added!', 'OK', { duration: 4000 })
        this.expSvc.selectedExpenseType = new ExpenseTypeVM
      },
        (err: any) => {
          alert('Error')
        });
    }
  }
  UpdateExpenseType() {
    this.expSvc.UpdateExpenseType(this.expSvc.selectedExpenseType).subscribe((data) => {
      this.snack.open('Expense Type Updated Successfully!', 'OK', { duration: 4000 })
      this.Add = true;
      this.Edit = false;
      this.ngOnInit();
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
}
