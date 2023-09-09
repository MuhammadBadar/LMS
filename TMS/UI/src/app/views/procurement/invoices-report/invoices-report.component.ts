import { Component, OnInit } from '@angular/core';
export interface PeriodicElement {

  date: string;
  customer: string;
  comment: string;
  amount: number;
  
}
const ELEMENT_DATA: PeriodicElement[] = [
  {date: "12/3/2021", customer: 'Customer A', amount: 1000,comment:'Com...' },
  {date: "10/1/2021", customer: 'Customer B', amount: 700 ,comment:'Com...'},
  {date: "8/7/2021", customer: 'Customer C',  amount: 200 ,comment:'Com...'},
  {date: "7/9/2021", customer: 'Customer D',  amount: 8000 ,comment:'Com...'},
  {date: "12/2/2021", customer: 'Customer E', amount: 7500 ,comment:'Com...'},
 
  
 
];
@Component({
  selector: 'app-invoices-report',
  templateUrl: './invoices-report.component.html',
  styleUrls: ['./invoices-report.component.css']
})
export class InvoicesReportComponent implements OnInit {
  displayedColumn: string[] = ['date','customer', 'amount','comment'];
  displayedColumns: string[] = ['date', 'customer', 'amount','comment','Action'];
  
  dataSource = ELEMENT_DATA;
  constructor() { }

  ngOnInit(): void {
  }

}
