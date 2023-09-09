import { animate, state, style, transition, trigger } from '@angular/animations';
import { ChangeDetectorRef, Component, OnInit, QueryList, ViewChild, ViewChildren } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { InquiryService } from '../Inquiry.Service';
import { InquiryFieldDataVM } from '../Models/InquiryFieldDataVM';
import { FieldVM } from '../Models/models/fieldVm';
import { InquiryVM } from '../Models/models/inquiryVM';

@Component({
  selector: 'app-inquiry-list',
  templateUrl: './inquiry-list.component.html',
  styleUrls: ['./inquiry-list.component.css'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class InquiryListComponent implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
DataSource;
data=[];

  displayedColumns: string[] = ['name', 'cell', 'service','email','ifData', 'actions'];
  displayedColumn: string[]=['fieldname', 'fieldvalue']
fields:FieldVM[]
  inqry: InquiryVM[];
  constructor(
    private route: Router,
    private cd: ChangeDetectorRef,
    public inqSvc: InquiryService,
  ) { this.inqSvc.selectedInquiryFieldData= new InquiryFieldDataVM}

  ngOnInit(): void {
    this.GetInquiry();
    this.inqSvc.getField().subscribe((res: FieldVM[]) => {
      this.fields = res;})
  }
  GetInquiry() {
    this.inqSvc.getInquiry().subscribe((res: InquiryVM[]) => {
      this.inqry = res;
      this.DataSource = new MatTableDataSource(this.inqry );
    });
  }

  DeleteInquiry(id) {
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
        this.inqSvc.DeleteInquiry(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Inquiry has been deleted.',
            'success'
          )
          this.GetInquiry();
        })
      }
    })


  }
  EditInquiry(inq) {
    console.warn(inq)
    this.route.navigate(['/inquiry/manageinquiry'], {
      queryParams: {
        id: inq
      }
    });
  }
}


