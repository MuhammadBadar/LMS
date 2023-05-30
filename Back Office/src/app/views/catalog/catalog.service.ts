import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
import { SettingsTypeVM } from '../items/Models/SettingsTypeVM';
import { SettingsVM } from '../items/Models/SettingsVM';

@Injectable({
  providedIn: 'root'
})
export class CatalogService {

  constructor(
    private snack: MatSnackBar,
    private http: HttpClient
  ) { }
  SuccessfullyUpdateMsg() {
    this.SuccessMsgBar(" Successfully Updated!", 5000)
  }
  SuccessfullyAddMsg() {
    this.SuccessMsgBar(" Successfully Added!", 5000)
  }
  SuccessMsgBar(Message: string, Duration: number) {
    this.snack.open(Message, 'Ok', { duration: Duration, verticalPosition: 'bottom', panelClass: ['blue-snackbar'] });
  }
  ErrorMsgBar(Message: string, Duration: number) {
    this.snack.open(Message, 'Close', { duration: Duration, verticalPosition: 'bottom', panelClass: ['red-snackbar'] });
  }
  UpdateSettings(value: SettingsVM) {
    return this.http.put(Globals.BASE_API_URL + 'Settings', value);
  }
  GetSettingsById(id: number): Observable<SettingsVM> {
    return this.http.get<SettingsVM>(Globals.BASE_API_URL + 'Settings/' + id).pipe()
  }
  SearchSettings(value: SettingsVM): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/Search', value).pipe();
  }
  GetSettings(): Observable<SettingsVM[]> {
    return this.http.get<SettingsVM[]>(Globals.BASE_API_URL + 'Settings').pipe();
  }
  SaveSettings(value: SettingsVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Settings', value);
  }
  DeleteSettings(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Settings/' + id);
  }
  SearchStngByCode(Id: number, KeyCode: string): Observable<SettingsVM[]> {
    return this.http.get<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/' + Id + "/" + KeyCode).pipe();
  }


  UpdateSettingsType(value: SettingsTypeVM) {
    return this.http.put(Globals.BASE_API_URL + 'SettingsType', value);
  }
  GetSettingsTypeById(id: number): Observable<SettingsTypeVM> {
    return this.http.get<SettingsTypeVM>(Globals.BASE_API_URL + 'SettingsType/' + id).pipe()
  }
  SearchSettingsType(value: SettingsTypeVM): Observable<SettingsTypeVM[]> {
    return this.http.post<SettingsTypeVM[]>(Globals.BASE_API_URL + 'SettingsType/Search', value).pipe();
  }
  GetSettingsType(): Observable<SettingsTypeVM[]> {
    return this.http.get<SettingsTypeVM[]>(Globals.BASE_API_URL + 'SettingsType').pipe();
  }
  SaveSettingsType(value: SettingsTypeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'SettingsType', value);
  }
  DeleteSettingsType(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'SettingsType/' + id);
  }





}