import { ExpenseTypeVM } from './../Models/ExpenseTypeVM';
import { ExpenseTypeDialogComponent } from './../expense-type-dialog/expense-type-dialog.component';
import { ExpenseService } from './../expense.service';
import { Component, OnInit } from '@angular/core';
import { ExpenseVM } from '../Models/ExpenseVm';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-manage-expense',
  templateUrl: './manage-expense.component.html',
  styleUrls: ['./manage-expense.component.css']
})
export class ManageExpenseComponent implements OnInit {

  public dialogRef: MatDialogRef<ExpenseTypeDialogComponent>;
  exp: ExpenseVM;
  ExpenseType: ExpenseTypeVM[]
  ExpenseId: number;
  Edit: boolean = false;
  Add: boolean = true;
  constructor(
    public dialog: MatDialog,
    public expSVc: ExpenseService,
    private route: ActivatedRoute,
    private snack: MatSnackBar,
  ) {
    this.expSVc.selectedExpense = new ExpenseVM
    this.expSVc.selectedExpenseType = new ExpenseTypeVM
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.ExpenseId = params?.id;
    });
    if (this.ExpenseId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetExpenseById();
    }
    this.expSVc.SearchExpenseType(this.expSVc.selectedExpenseType).subscribe((res: ExpenseTypeVM[]) => {
      this.ExpenseType = res;
    })
  }
  SaveExpense() {
    if (this.ExpenseId > 0) {
      this.PutExpense();
    } else {
      this.expSVc.SaveExpense(this.expSVc.selectedExpense).subscribe((data) => {
        this.snack.open('Expense Successfully Added!', 'OK', { duration: 4000 })
        this.expSVc.selectedExpense = new ExpenseVM
      },
        (err: any) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        });
    }
  }
  GetExpenseById() {
    this.expSVc.GetExpenseById(this.ExpenseId).subscribe((res: ExpenseVM) => {
      this.exp = res;
      this.expSVc.selectedExpense = this.exp[0]
    });
  }
  PutExpense() {
    this.expSVc.UpdateExpense(this.expSVc.selectedExpense).subscribe((data) => {
      this.snack.open('Expense Updated Successfully!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  Event() {
    this.dialogRef = this.dialog.open(ExpenseTypeDialogComponent, {
      panelClass: 'calendar-form-dialog', width: '550px', height: '250px'
      , data: {}
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          this.expSVc.selectedExpenseType = new ExpenseTypeVM
          this.ngOnInit();
        }
      })
  }
}
