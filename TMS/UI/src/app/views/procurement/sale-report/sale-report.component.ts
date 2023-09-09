import { Component, OnInit } from '@angular/core';
export interface PeriodicElement {

  date: string;
  customer: string;
  item: number;
  amount: number;
  
}
const ELEMENT_DATA: PeriodicElement[] = [
  {date: "12/3/2021", customer: 'Customer A', item: 7, amount: 1000 },
  {date: "10/1/2021", customer: 'Customer B', item: 8, amount: 700 },
  {date: "8/7/2021", customer: 'Customer C', item: 10, amount: 200 },
  {date: "7/9/2021", customer: 'Customer D', item: 3, amount: 8000 },
  {date: "12/2/2021", customer: 'Customer E', item: 4, amount: 7500 },
 
  
 
];
@Component({
  selector: 'app-sale-report',
  templateUrl: './sale-report.component.html',
  styleUrls: ['./sale-report.component.css']
})
export class SaleReportComponent implements OnInit {
  displayedColumn: string[] = ['date','customer', 'item','amount'];
  displayedColumns: string[] = ['date', 'customer', 'item','amount','Action'];
  
  dataSource = ELEMENT_DATA;
  constructor() { }

  ngOnInit(): void {
  }

}
