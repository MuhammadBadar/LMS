import { Component, OnInit } from '@angular/core';
export interface PeriodicElement {

  date: string;
  comment: string;
  sale: string;
  receipt: string;
  balance:number
  
}
const ELEMENT_DATA: PeriodicElement[] = [
  {date: "12/3/2021", comment: 'com...', sale: '-', receipt: '1000',balance:1000 },
  {date: "10/1/2021", comment: 'com...', sale: '500', receipt:'-' ,balance:6000},
  {date: "8/7/2021", comment: 'com...', sale: '1000', receipt: '200',balance:500 },
  {date: "7/9/2021", comment: 'com...', sale: '-', receipt: '8000' ,balance:1200},
  {date: "12/2/2021", comment: 'com...', sale: '4000', receipt: '-' ,balance:900},
 
  
 
];
@Component({
  selector: 'app-customer-ledger',
  templateUrl: './customer-ledger.component.html',
  styleUrls: ['./customer-ledger.component.css']
})
export class CustomerLedgerComponent implements OnInit {
  displayedColumns: string[] = ['date', 'comment', 'sale','receipt','balance','Action']; 
  dataSource = ELEMENT_DATA;
  constructor() { }

  ngOnInit(): void {
  }

}
