import { Component, OnInit } from '@angular/core';
import { LMSService } from '../lms.service';
import { FeeVM } from '../Models/FeepaymentschoolVM';
import { MatTableDataSource } from '@angular/material/table';
import { ManageFeelinesPopupComponent } from '../manage-feelines-popup/manage-feelines-popup.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-manage-fee-details',
  templateUrl: './manage-fee-details.component.html',
  styleUrls: ['./manage-fee-details.component.css'],
})
export class ManageFeeDetailsComponent implements OnInit {
  displayedColumns: string[] = ['student', 'feeDate', 'amount', 'concession', 'netAmount', 'actions'];
  Edit: boolean = false;
  Add: boolean = true;
  feeDataSource: MatTableDataSource<FeeVM>;

  constructor(
    private lmsSvc: LMSService,
    private dialog: MatDialog
  ) { }
  ngOnInit(): void {
    this.GetFee();
  }
  GetFee() {
    this.lmsSvc.GetFee().subscribe({
      next: (res: FeeVM[]) => {
        console.log('Fee Data:', res);
        this.feeDataSource = new MatTableDataSource(res);
      },
      error: (e) => {
        console.warn(e);
      }
    });
  }
  showFeeLinesPopup(fee: FeeVM) {
    debugger;
    this.dialog.open(ManageFeelinesPopupComponent, {
      width: 'auto',
      height: 'auto',
      data: { feeLines: fee.feeLines, feeId: fee.id }, // Pass feeId
    });
  }

}
