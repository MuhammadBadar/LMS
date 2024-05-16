import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { ChartofAccountCodeComponent } from '../chartof-account-code/chartof-account-code.component';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
import { AccountService } from '../account.service';
import { ChartOfAccountVM } from '../Models/ChartOfAccountVM';
import { AppConstants } from 'src/app/app.constants';
import { MatPaginator } from '@angular/material/paginator';
import { tap } from 'rxjs';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-chart-of-account-list',
  templateUrl: './chart-of-account-list.component.html',
  styleUrls: ['./chart-of-account-list.component.css']
})
export class ChartOfAccountListComponent implements OnInit {
  @ViewChild('Form', { static: true }) filterForm!: NgForm;
  displayedColumns: string[] = ['keyCode', 'name', 'level', 'parent', 'isActive', 'actions'];
  dataSource: MatTableDataSource<ChartOfAccountVM>;
  isLoading: boolean = false
  dialogRef: any
  filterVal: ChartOfAccountVM = new ChartOfAccountVM();
  style = "background-image: linear-gradient(to bottom, rgb(2, 33, 58), rgb(7, 95, 122));color:white;font-weight:normal "
  tAccounts!: ChartOfAccountVM[]
  isReadOnly: boolean = false
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  coa: ChartOfAccountVM
  constructor(
    private cdref: ChangeDetectorRef,
    private route: Router,
    private accSvc: AccountService,
    public catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.filterVal = new ChartOfAccountVM()
    this.dataSource = new MatTableDataSource<ChartOfAccountVM>([]);
    this.coa = new ChartOfAccountVM
  }
  ngOnInit() {
    this.catSvc.totalRecords = AppConstants.DEFAULT_TOTAL_RECORD;
    this.catSvc.defaultPageSize = AppConstants.DEFAULT_PAGE_SIZE;
    this.catSvc.pageSizes = AppConstants.PAGE_SIZE_OPTIONS;
    this.isReadOnly = this.catSvc.getPermission(RouteIds.ChartOfAccount)
  }
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
    this.paginator.page
      .pipe(
        tap(() => this.SearchInChartOfAccount(this.coa))
      )
      .subscribe();
    this.SearchInChartOfAccount(this.coa);
    this.cdref.detectChanges();
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
    this.cdref.markForCheck();
  }
  GetAccounts() {
    var value = new ChartOfAccountVM
    this.accSvc.SearchChartOfAccount(value).subscribe({
      next: (res: ChartOfAccountVM[]) => {
        // this.Settings = res;
        this.tAccounts = res
        this.dataSource = new MatTableDataSource(res);
        this.catSvc.isLoading = false
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
        this.catSvc.isLoading = false
      }
    })
  }
  EditAccount(acc: ChartOfAccountVM) {
    this.catSvc.isLoading = true
    this.dialogRef = this.dialog.open(ChartofAccountCodeComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1000px', height: '450px'
      , data: { coaId: acc.id }
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        this.SearchInChartOfAccount(this.coa)
      });
  }
  OpenDialog() {
    debugger
    this.dialogRef = this.dialog.open(ChartofAccountCodeComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '1000px', height: '450px'
      , data: {}
    });
    this.dialogRef.afterClosed()
      .subscribe((res) => {
        this.SearchInChartOfAccount(this.coa)
      });
  }
  SearchInChartOfAccount(field) {
    var text;
    var account = this.filterVal
    this.SearchAccount(account)
  }
  ResetGrid() {
    this.filterForm.reset()
    this.SearchInChartOfAccount(this.coa)
  }
  SearchAccount(value: ChartOfAccountVM) {
    value.pageNo = this.paginator.pageIndex + 1;;
    value.pageSize = this.paginator.pageSize;
    this.catSvc.isLoading = true
    this.accSvc.SearchAccounts(value).subscribe({
      next: (res: ChartOfAccountVM[]) => {
        if (res && res.length > 0) {
          this.dataSource = new MatTableDataSource(res);
          this.catSvc.totalRecords = res[0].totalRecords
        }
        this.catSvc.isLoading = false
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
        this.catSvc.isLoading = false
      }
    })
  }
}
