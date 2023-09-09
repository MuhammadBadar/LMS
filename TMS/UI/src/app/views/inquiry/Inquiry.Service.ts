import { InquiryFieldDataVM } from './Models/InquiryFieldDataVM';

import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { EnumValueVM } from './Models/models/EnumValueVM';
import { FieldPossibleValuesVM } from './Models/models/FieldPossibleValuesVM';
import { FieldVM } from './Models/models/fieldVm';
import { InquiryVM } from './Models/models/inquiryVM';
import { ServicesVM } from './Models/models/ServicesVM';

@Injectable({
  providedIn: 'root'
})
export class InquiryService {
  selectedInquiryFieldData:InquiryFieldDataVM
  selectedServices:ServicesVM
  selectedFPValues:FieldPossibleValuesVM
  selectedField:FieldVM;
  selectedInquiry:InquiryVM;

  constructor(private http: HttpClient) { }
  GetEnumValues(type): Observable<EnumValueVM[]> {
    return this.http.get<EnumValueVM[]>('https://localhost:7100/api/EnumValues/'+type).pipe();
  }
  UpdateService(svc: ServicesVM) {
    
    return this.http.put('https://localhost:7100/api/Services', svc);
  }
  UpdateInquiryFieldData(inqfd: InquiryFieldDataVM) {
    
    return this.http.put('https://localhost:7100/api/InquiryFieldData', inqfd);
  }
  UpdateFPValues(fld: FieldPossibleValuesVM) {
    
    return this.http.put('https://localhost:7100/api/FieldPossibleValues', fld);
  }
  UpdateField(fld: FieldVM) {
    
    return this.http.put('https://localhost:7100/api/Field', fld);
  }
  UpdateInquiry(inqry: InquiryVM) {
    
    return this.http.put('https://localhost:7100/api/Inquiry', inqry);
  }

  DeleteService(id) {
    return this.http.delete('https://localhost:7100/api/Services/' + id);
  }
  DeleteInquiryFieldData(id) {
    return this.http.delete('https://localhost:7100/api/InquiryFieldData/' + id);
  }
  DeleteFPValues(id) {
    return this.http.delete('https://localhost:7100/api/FieldPossibleValues/' + id);
  }
  DeleteField(id) {
    return this.http.delete('https://localhost:7100/api/Field/' + id);
  }
  DeleteInquiry(id) {
    return this.http.delete('https://localhost:7100/api/Inquiry/' + id);
  }
  getField(): Observable<FieldVM[]> {

    return this.http.get<FieldVM[]>('https://localhost:7100/api/Field').pipe();
  }
  getInquiryFieldData(): Observable<InquiryFieldDataVM[]> {

    return this.http.get<InquiryFieldDataVM[]>('https://localhost:7100/api/InquiryFieldData').pipe();
  }
  getFPValues(): Observable<FieldPossibleValuesVM[]> {

    return this.http.get<FieldPossibleValuesVM[]>('https://localhost:7100/api/FieldPossibleValues').pipe();
  }
  getInquiry(): Observable<InquiryVM[]> {

    return this.http.get<InquiryVM[]>('https://localhost:7100/api/Inquiry').pipe();
  }
  getServices(): Observable<ServicesVM[]> {

    return this.http.get<ServicesVM[]>('https://localhost:7100/api/Services').pipe();
  }
  SaveService(svc: ServicesVM) {
    return this.http.post('https://localhost:7100/api/Services', svc);
  }
  SaveInquiryFieldData(inqfd: InquiryFieldDataVM[]) {
    return this.http.post('https://localhost:7100/api/InquiryFieldData', inqfd);
  }
  SaveField(fld: FieldVM) {
    console.warn(fld)
    return this.http.post('https://localhost:7100/api/Field', fld);
  }
  SaveFPValues(fld: FieldPossibleValuesVM) {
    console.warn(fld)
    return this.http.post('https://localhost:7100/api/FieldPossibleValues', fld);
  }
  SaveInquiry(inqry): Observable<InquiryVM> {
    return this.http.post<InquiryVM>('https://localhost:7100/api/Inquiry', inqry).pipe();
  }
  SearchField(search): Observable<FieldVM[]> {
    return this.http.post<FieldVM[]>('https://localhost:7100/api/Field/Search', search).pipe();
  }
  SearchService(search): Observable<ServicesVM[]> {
    return this.http.post<ServicesVM[]>('https://localhost:7100/api/Services/Search', search).pipe();
  }
  SearchFPValues(search): Observable<FieldPossibleValuesVM[]> {
    return this.http.post<FieldPossibleValuesVM[]>('https://localhost:7100/api/FieldPossibleValues/Search', search).pipe();
  }
  SearchInquiry(search): Observable<InquiryVM[]> {
    return this.http.post<InquiryVM[]>('https://localhost:7100/api/Inquiry/Search', search).pipe();
  }
  SearchInquiryFieldData(search): Observable<InquiryFieldDataVM[]> {
    return this.http.post<InquiryFieldDataVM[]>('https://localhost:7100/api/InquiryFieldData/Search', search).pipe();
  }

}