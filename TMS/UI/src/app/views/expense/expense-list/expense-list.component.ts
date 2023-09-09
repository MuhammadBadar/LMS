import { ExpenseVM } from './../Models/ExpenseVm';
import { ExpenseService } from './../expense.service';
import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
@Component({
  selector: 'app-expense-list',
  templateUrl: './expense-list.component.html',
  styleUrls: ['./expense-list.component.css']
})
export class ExpenseListComponent implements OnInit {
  exp: ExpenseVM[];
  dataSource;
  displayedColumns = ['expensetype', 'expensedate', 'expensetitle', 'expensedetail', 'actions'];
  constructor(
    private route: Router,
    public expSvc: ExpenseService
  ) {
    this.expSvc.selectedExpense = new ExpenseVM
  }
  ngOnInit(): void {
    this.expSvc.SearchExpense(this.expSvc.selectedExpense).subscribe((res: ExpenseVM[]) => {
      this.exp = res;
      this.dataSource = this.exp
    });
  }
  DeleteExpense(id) {
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
        this.expSvc.DeleteExpense(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Expense has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
  EditExpense(exp: ExpenseVM) {
    this.route.navigate(['/expense/manageexpense'], {
      queryParams: {
        id: exp.id
      }
    });
  }
}
