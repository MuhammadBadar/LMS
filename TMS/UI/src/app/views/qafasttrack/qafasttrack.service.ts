import { ManageCompanyVM } from './models/ManageCompanyVM';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { EnumValueVM } from './models/EnumValueVM';

@Injectable({
    providedIn: 'root'
  })
  export class QAFastTrackService{
    selectedCom:ManageCompanyVM
    selectedEnumValue:EnumValueVM
    constructor(private http: HttpClient) {

    }
    GetEnumValues(type): Observable<EnumValueVM[]> {
      return this.http.get<EnumValueVM[]>('https://localhost:7100/api/EnumValues/'+type).pipe();
    }
    SaveManageConpany(value) {
      return this.http.post('https://localhost:7100/api/ManageConpany', value);
    }
    SaveEnumValue(value) {
      return this.http.post('https://localhost:7100/api/EnumValues', value);
    }
  }