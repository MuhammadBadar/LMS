import { AssignAccountVM } from './Models/AssignAccountVM';
import { FiscalYearVm } from './Models/FiscalYearVM';
import { ChartOfAccountVM } from './Models/ChartOfAccountVM';
import { VoucherTypeVM } from './Models/VoucherTypeVM';
import { VoucherDetailsVM, VoucherVM } from './Models/VoucherVM';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  constructor(private http: HttpClient,) { }
  UpdateChartOfAccount(ChartOfAccount: ChartOfAccountVM): Observable<ChartOfAccountVM> {
    return this.http.put<ChartOfAccountVM>(Globals.BASE_API_URL + 'ChartOfAccount', ChartOfAccount);
  }
  GetChartOfAccountById(id: number): Observable<ChartOfAccountVM> {

    return this.http.get<ChartOfAccountVM>(Globals.BASE_API_URL + 'ChartOfAccount/' + id).pipe()
  }
  SearchChartOfAccount(ChartOfAccount: ChartOfAccountVM): Observable<ChartOfAccountVM[]> {
    return this.http.post<ChartOfAccountVM[]>(Globals.BASE_API_URL + 'ChartOfAccount/Search', ChartOfAccount).pipe();
  }
  SearchAccounts(ChartOfAccount: ChartOfAccountVM): Observable<ChartOfAccountVM[]> {
    return this.http.post<ChartOfAccountVM[]>(Globals.BASE_API_URL + 'ChartOfAccount/Accounts', ChartOfAccount).pipe();
  }
  GetChartOfAccount(): Observable<ChartOfAccountVM[]> {
    return this.http.get<ChartOfAccountVM[]>(Globals.BASE_API_URL + 'ChartOfAccount').pipe();
  }
  SaveChartOfAccount(ChartOfAccount: ChartOfAccountVM): Observable<ChartOfAccountVM> {
    return this.http.post<ChartOfAccountVM>(Globals.BASE_API_URL + 'ChartOfAccount', ChartOfAccount);
  }
  DeleteChartOfAccount(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'ChartOfAccount/' + id);
  }



  UpdateAssignAccount(AssignAccount: AssignAccountVM) {
    return this.http.put(Globals.BASE_API_URL + 'AssignAccount', AssignAccount);
  }
  GetAssignAccountById(id: number): Observable<AssignAccountVM> {

    return this.http.get<AssignAccountVM>(Globals.BASE_API_URL + 'AssignAccount/' + id).pipe()
  }
  SearchAssignAccount(AssignAccount: AssignAccountVM): Observable<AssignAccountVM[]> {
    return this.http.post<AssignAccountVM[]>(Globals.BASE_API_URL + 'AssignAccount/Search', AssignAccount).pipe();
  }
  GetAssignAccount(): Observable<AssignAccountVM[]> {
    return this.http.get<AssignAccountVM[]>(Globals.BASE_API_URL + 'AssignAccount').pipe();
  }
  SaveAssignAccount(AssignAccount: AssignAccountVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'AssignAccount', AssignAccount);
  }
  DeleteAssignAccount(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'AssignAccount/' + id);
  }

  UpdateVoucherType(VoucherType: VoucherTypeVM): Observable<VoucherTypeVM> {
    return this.http.put<VoucherTypeVM>(Globals.BASE_API_URL + 'VoucherType', VoucherType);
  }
  GetVoucherTypeById(id: number): Observable<VoucherTypeVM> {
    return this.http.get<VoucherTypeVM>(Globals.BASE_API_URL + 'VoucherType/' + id).pipe()
  }
  SearchVoucherType(VoucherType: VoucherTypeVM): Observable<VoucherTypeVM[]> {
    return this.http.post<VoucherTypeVM[]>(Globals.BASE_API_URL + 'VoucherType/Search', VoucherType).pipe();
  }
  GetVoucherType(): Observable<VoucherTypeVM[]> {
    return this.http.get<VoucherTypeVM[]>(Globals.BASE_API_URL + 'VoucherType').pipe();
  }
  SaveVoucherType(VoucherType: VoucherTypeVM): Observable<VoucherTypeVM> {
    return this.http.post<VoucherTypeVM>(Globals.BASE_API_URL + 'VoucherType', VoucherType);
  }
  DeleteVoucherType(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'VoucherType/' + id);
  }


  UpdateVoucher(data: VoucherVM): Observable<VoucherVM> {
    return this.http.put<VoucherVM>(Globals.BASE_API_URL + 'Voucher', data).pipe();
  }
  GetVoucherById(id: number): Observable<VoucherVM[]> {

    return this.http.get<VoucherVM[]>(Globals.BASE_API_URL + 'Voucher/' + id).pipe()
  }
  SearchVoucher(data: VoucherVM): Observable<VoucherVM[]> {
    return this.http.post<VoucherVM[]>(Globals.BASE_API_URL + 'Voucher/Search', data).pipe();
  }
  GetVoucher(): Observable<VoucherVM[]> {
    return this.http.get<VoucherVM[]>(Globals.BASE_API_URL + 'Voucher').pipe();
  }
  SaveVoucher(data: VoucherVM): Observable<VoucherVM> {
    return this.http.post<VoucherVM>(Globals.BASE_API_URL + 'Voucher', data).pipe();
  }
  SearchVchDetail(data: VoucherDetailsVM): Observable<VoucherDetailsVM[]> {
    return this.http.post<VoucherDetailsVM[]>(Globals.BASE_API_URL + 'Voucher/SearchVchDetail', data).pipe();
  }
  DeleteVoucher(id: number) {
    var vch = new VoucherVM
    vch.id = id
    vch.clientId = +localStorage.getItem("RMSClientId")
    return this.http.post(Globals.BASE_API_URL + 'Voucher/Delete', vch);
  }
  ActivateVoucher(mod: VoucherVM) {
    return this.http.put(Globals.BASE_API_URL + 'Voucher/Update/Activate', mod);
  }
  DeActivateVoucher(mod: VoucherVM) {
    return this.http.put(Globals.BASE_API_URL + 'Voucher/DeActivate', mod);
  }
  GetNextVchNo(vch: VoucherVM): Observable<any> {
    return this.http.post<any>(Globals.BASE_API_URL + 'Voucher/VchNo?keyCode=', vch).pipe()
  }


  UpdateFiscalYear(FiscalYear: FiscalYearVm) {
    return this.http.put(Globals.BASE_API_URL + 'FiscalYear', FiscalYear);
  }
  GetFiscalYearById(id: number): Observable<FiscalYearVm> {

    return this.http.get<FiscalYearVm>(Globals.BASE_API_URL + 'FiscalYear/' + id).pipe()
  }
  SearchFiscalYear(FiscalYear: FiscalYearVm): Observable<FiscalYearVm[]> {
    return this.http.post<FiscalYearVm[]>(Globals.BASE_API_URL + 'FiscalYear/Search', FiscalYear).pipe();
  }
  GetFiscalYear(): Observable<FiscalYearVm[]> {
    return this.http.get<FiscalYearVm[]>(Globals.BASE_API_URL + 'FiscalYear').pipe();
  }
  SaveFiscalYear(FiscalYear: FiscalYearVm): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'FiscalYear', FiscalYear);
  }
  DeleteFiscalYear(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'FiscalYear/' + id);
  }
  GetFiscalYearId(FiscalYear: FiscalYearVm): Observable<string> {
    return this.http.post<string>(Globals.BASE_API_URL + 'FiscalYear/FiscalYearId', FiscalYear).pipe();
  }
  SearchYear(FiscalYear: FiscalYearVm): Observable<string> {
    return this.http.post<string>(Globals.BASE_API_URL + 'FiscalYear/SearchYear', FiscalYear).pipe();
  }


  GetPdf(vch: VoucherVM): Observable<any> {
    return this.http.post<any>(Globals.SpPRING_BOOT_API_URL + "Voucher/Report", vch, {
      responseType: 'blob' as 'json',
      observe: 'response'
    });
  }
}
