import { ExpenseTypeVM } from './Models/ExpenseTypeVM';
import { ExpenseVM } from './Models/ExpenseVm';
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from 'rxjs-compat';
import { DatePipe } from '@angular/common';

@Injectable({
    providedIn: 'root'
  })
  export class ExpenseService {
    constructor(private http: HttpClient,
     
      ) {
    }
    selectedExpense:ExpenseVM;
    selectedExpenseType:ExpenseTypeVM
    GetExpenseById(id):Observable<ExpenseVM>  {    
        return this.http.get<ExpenseVM>('https://localhost:7100/api/Expense/'+ id).pipe();    
      }

      GetExpenseTypeById(id):Observable<ExpenseTypeVM>  {    
        return this.http.get<ExpenseTypeVM>('https://localhost:7100/api/ExpenseType/'+ id).pipe();    
      }
    
    getExpenseList() {
        return this.http.get<ExpenseVM[]>('https://localhost:7100/api/Expense/').pipe();
      }
      getExpenseTypeList() {
        return this.http.get<ExpenseTypeVM[]>('https://localhost:7100/api/ExpenseType/').pipe();
      }
      UpdateExpense(Expense: ExpenseVM) {
        console.warn(Expense)
        return this.http.put('https://localhost:7100/api/Expense', Expense);
      } 
      UpdateExpenseType(ExpenseType: ExpenseTypeVM) {
        return this.http.put('https://localhost:7100/api/ExpenseType', ExpenseType);
      }
      SearchExpense(Expense): Observable<ExpenseVM[]> {
        return this.http.post<ExpenseVM[]>('https://localhost:7100/api/Expense/Search', Expense).pipe();
      }
      SearchExpenseType(ExpenseType): Observable<ExpenseTypeVM[]> {
        return this.http.post<ExpenseTypeVM[]>('https://localhost:7100/api/ExpenseType/Search', ExpenseType).pipe();
      }
      SaveExpense(Expense): Observable<ExpenseVM> {
        console.warn(Expense)
        return this.http.post<ExpenseVM>('https://localhost:7100/api/Expense', Expense).pipe();
      }
      SaveExpenseType(ExpenseType): Observable<ExpenseTypeVM> {
        return this.http.post<ExpenseTypeVM>('https://localhost:7100/api/ExpenseType', ExpenseType).pipe();
      }
      DeleteExpense(id) {
        return this.http.delete('https://localhost:7100/api/Expense/' + id);
      }
      DeleteExpenseType(id) {
        return this.http.delete('https://localhost:7100/api/ExpenseType/' + id);
      }
  }