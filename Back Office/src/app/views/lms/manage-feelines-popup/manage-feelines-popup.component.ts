import { Component, Inject, Input, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FeeLineVM } from '../Models/FeepaymentschoolVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-manage-feelines-popup',
  templateUrl: './manage-feelines-popup.component.html',
  styleUrls: ['./manage-feelines-popup.component.css']
})

export class ManageFeelinesPopupComponent implements OnInit {
  displayedColumns: string[] = ['feeTitle', 'feeAmount'];
  feeLines: any; // Adjust the type based on your feeLines structure
 
  
  Edit: boolean = false;
  Add: boolean = true;

  dialogref: any;
  isDialog: boolean = false;
  pat: FeeLineVM[] = [];
  
  // Remove @Input() feeId: number;

  constructor(
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {
    this.GetFeeLinesById(data.feeId); // Call GetFeeLinesById with the feeId from data
  }

  ngOnInit(): void {
    // Initialization logic if needed
  }

  GetFeeLinesById(feeId: number) {
    debugger;
    this.lmsSvc.GetFeeLinesByFeeId(feeId).subscribe({
      next: (value: FeeLineVM[]) => {
        debugger;
        this.pat = value; // Directly assign the array
        this.feeLines = new MatTableDataSource(this.pat);
      },
      error: (err) => {
        alert('Error retrieving fee lines');
        this.catSvc.ErrorMsgBar('Error Occurred', 5000);
      },
    });
  }
}



