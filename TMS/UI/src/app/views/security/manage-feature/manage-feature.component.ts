import { Component, OnInit } from '@angular/core';
import { FeatureVM } from '../models/feature-vm';
import { SecurityService } from '../security.service';
import { MatTableDataSource } from '@angular/material/table';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { CreateFeatureDialogComponent } from './manage-feature-dialog/create-feature-dialog/create-feature-dialog.component';

@Component({
  selector: 'app-manage-feature',
  templateUrl: './manage-feature.component.html',
  styleUrls: ['./manage-feature.component.css']
})
export class ManageFeatureComponent implements OnInit {
  dataSource;
  displayedColumns = ['id', 'feature', 'description', 'isActive','action'];
  private dialogRef: MatDialogRef<CreateFeatureDialogComponent>;
  
  feature: FeatureVM[];
  constructor(
    private securitySvc: SecurityService,
    public dialog: MatDialog,
  ) {dialog.afterAllClosed
    .subscribe(() => {
      this.ngOnInit()
    }
  ); }

  ngOnInit(): void {
    this.securitySvc.getFeatureList().subscribe((res: FeatureVM[]) => {
      this.feature = res;    
      this.dataSource= new MatTableDataSource (this.feature);   
      debugger;
      });
  
  }
  public addEvent() {
    this.dialogRef = this.dialog.open(CreateFeatureDialogComponent, {
      panelClass: 'calendar-form-dialog',
      width: '450px'
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }
  
  EditFeature(feature){
    debugger
    let dialogRef = this.dialog.open(CreateFeatureDialogComponent, {disableClose:true, panelClass: 'calendar-form-dialog',  width: '450px' 
    , data: { fetrId:feature.id  }
    
         
   });
  }

}
