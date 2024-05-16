import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { CatalogService } from './../../catalog/catalog.service';
import { AfterViewInit, ChangeDetectorRef, Component, Injector, OnInit, ViewChild } from '@angular/core';
import { AppConstants } from 'src/app/app.constants';
import { NgForm } from '@angular/forms';
import { AccountLevels } from 'src/app/views/account/Models/Enums/AccountLevels'
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ChartOfAccountVM } from '../Models/ChartOfAccountVM';
import { AccountService } from '../account.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';

@Component({
  selector: 'app-chartof-account-code',
  templateUrl: './chartof-account-code.component.html',
  styleUrls: ['./chartof-account-code.component.css']
})
export class ChartofAccountCodeComponent implements OnInit {
  isParentRequired = false;
  maxLength: number = 2
  Edit: boolean = false;
  Add: boolean = true;
  isLoading: boolean = false;
  levels!: SettingsVM[]
  tAccounts!: ChartOfAccountVM[]
  selectedCoa = new ChartOfAccountVM();
  selectedParentCoa = new ChartOfAccountVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  @ViewChild('Form', { static: true }) filterForm!: NgForm;
  style = "background-image: linear-gradient(to bottom, rgb(2, 33, 58), rgb(7, 95, 122));color:white;font-weight:normal "
  dialogRef: any
  dialogData;
  constructor(
    public cdref: ChangeDetectorRef,
    public catSvc: CatalogService,
    private injector: Injector,
    private accSvc: AccountService
  ) {
    this.selectedCoa = new ChartOfAccountVM();
    this.dialogRef = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedParentCoa = new ChartOfAccountVM
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.catSvc.isLoading = false
    this.selectedCoa = new ChartOfAccountVM
    this.Getlevels()
    this.selectedCoa.isActive = true
    if (this.dialogData != null) {
      if (this.dialogData.coaId != undefined) {
        this.GetCoaForEdit(this.dialogData.coaId)
      }
    }
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
    this.cdref.markForCheck();
  }
  numberOnly(event: any): boolean {
    const charCode = (event.which) ? event.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false;
    }
    return true;
  }
  onselectParent(acc) {
    this.selectedParentCoa = acc
    this.cdref.detectChanges();
  }
  Getlevels() {
    var val = new SettingsVM
    val.enumTypeId = EnumTypeVM.AccountLevels
    val.isActive = true
    this.catSvc.SearchSettings(val).subscribe({
      next: (res: SettingsVM[]) => {
        this.levels = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occured!", 5000)
      }
    })
  }
  GetAccounts() {
    debugger
    var acc = new ChartOfAccountVM
    if (this.selectedCoa.coaLevelId > 0)
      acc.coaLevelId = this.getPreviousLevel(this.selectedCoa.coaLevelId)
    console.warn(acc)
    this.accSvc.SearchChartOfAccount(acc).subscribe({
      next: (res: ChartOfAccountVM[]) => {
        this.tAccounts = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occured!", 5000)
        console.warn(e);
      }
    })
  }
  getPreviousLevel(level: AccountLevels): any {
    if (level == AccountLevels.Level1)
      return 0;
    else if (level == AccountLevels.Level2)
      return AccountLevels.Level1
    else if (level == AccountLevels.Level3)
      return AccountLevels.Level2
    else if (level == AccountLevels.Level4)
      return AccountLevels.Level3
    else if (level == AccountLevels.Level5)
      return AccountLevels.Level4
  }
  SetMaxLengthOfCode() {
    if (this.selectedCoa.coaLevelId == AccountLevels.Level1)
      this.maxLength = 2
    else if (this.selectedCoa.coaLevelId == AccountLevels.Level2)
      this.maxLength = 2
    else if (this.selectedCoa.coaLevelId == AccountLevels.Level3)
      this.maxLength = 2
    else if (this.selectedCoa.coaLevelId == AccountLevels.Level4)
      this.maxLength = 3
    else if (this.selectedCoa.coaLevelId == AccountLevels.Level5)
      this.maxLength = 4
  }
  onSelectLevel(val: SettingsVM) {
    debugger
    this.SetMaxLengthOfCode();
    this.GetAccounts()
    this.selectedCoa.parentCoaCode = ''
    this.selectedCoa.keyCode = ''
  }
  GetKeyCode(inputString: string): string {
    const parts = inputString.split('-');
    return parts[parts.length - 1];
  }
  GetCoaForEdit(coaId) {
    this.catSvc.isLoading = true
    this.selectedCoa = new ChartOfAccountVM;
    this.selectedCoa.id = coaId
    this.accSvc.SearchChartOfAccount(this.selectedCoa).subscribe({
      next: (retVal: ChartOfAccountVM[]) => {
        debugger
        this.selectedCoa = retVal[0]
        this.Edit = true;
        this.Add = false;
        this.GetAccounts()
        this.selectedCoa.keyCode = this.GetKeyCode(this.selectedCoa.coaCode)
        this.SetMaxLengthOfCode()
        this.selectedParentCoa.coaCode = this.selectedCoa.parentCoaCode
        this.catSvc.isLoading = false
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
        this.catSvc.isLoading = false
      }
    })
  }
  Submit() {
    debugger
    this.CheckValidation();
    if (this.userForm.invalid) {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!");
      return;
    }
    let maxLength = 0;
    switch (this.selectedCoa.coaLevelId) {
      case AccountLevels.Level1:
      case AccountLevels.Level2:
      case AccountLevels.Level3:
        maxLength = 2;
        break;
      case AccountLevels.Level4:
        maxLength = 3;
        break;
      case AccountLevels.Level5:
        maxLength = 4;
        break;
      default:
        this.catSvc.ErrorMsgBar("Invalid account level");
        return;
    }
    if (this.selectedCoa.keyCode?.length === maxLength)
      this.SaveCoa();
    else
      this.catSvc.ErrorMsgBar(`The MaxLength of Coa Code should be ${maxLength}`, 7000);
  }

  CheckValidation() {
    if (this.selectedCoa.coaLevelId == 0 || this.selectedCoa.coaLevelId == undefined)
      this.userForm.controls['coaLevelId'].setErrors({ 'incorrect': true })
    if (this.selectedCoa.coaLevelId !== AccountLevels.Level1 && this.selectedCoa.coaLevelId
      != undefined && this.selectedCoa.coaLevelId != 0)
      if (this.selectedCoa.parentCoaCode == null || this.selectedCoa.parentCoaCode == '')
        this.userForm.controls['parentCoaCode'].setErrors({ 'incorrect': true })
  }
  SaveCoa() {
    debugger
    this.selectedCoa.coaCode = this.selectedCoa.parentCoaCode && this.selectedCoa.parentCoaCode != "0" ? (this.selectedCoa.parentCoaCode + "-" + this.selectedCoa.keyCode) : this.selectedCoa.keyCode
    if (this.Edit) {
      this.UpdateSettings()
    } else {
      this.catSvc.isLoading = true
      this.accSvc.SaveChartOfAccount(this.selectedCoa).subscribe({
        next: (result) => {
          debugger
          result.resultMessages.forEach(element => {
            if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
              this.catSvc.SuccessMsgBar(element.message)
              this.ngOnInit();
            }
            else
              this.catSvc.ErrorMsgBar(element.message)
            this.catSvc.isLoading = false
          });
        }, error: (e) => {
          this.catSvc.ErrorMsgBar()
          console.warn(e);
          this.catSvc.isLoading = false
        }
      })
    }
  }
  UpdateSettings() {
    debugger
    this.catSvc.isLoading = true
    this.accSvc.UpdateChartOfAccount(this.selectedCoa).subscribe({
      next: (result) => {
        debugger
        result.resultMessages.forEach(element => {
          if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
            this.catSvc.SuccessMsgBar(element.message)
            this.ngOnInit();
          }
          else
            this.catSvc.ErrorMsgBar(element.message)
          this.catSvc.isLoading = false
        });
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
        this.catSvc.isLoading = false
      }
    })
  }
  Refresh() {
    this.selectedCoa = new ChartOfAccountVM;
    this.Add = true;
    this.Edit = false;
    this.catSvc.isLoading = false
  }
}

