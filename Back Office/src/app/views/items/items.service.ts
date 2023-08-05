import { StoreVM } from './Models/StoreVM';
import { UOMConversionVM } from './Models/UOMConversionVM';
import { Injectable } from '@angular/core';
import { SettingsTypeVM } from '../catalog/Models/SettingsTypeVM';
import { SettingsVM } from '../catalog/Models/SettingsVM';
import { HttpClient, HttpEvent, HttpHandler, HttpHeaders, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
@Injectable({
    providedIn: 'root'
})
export class ItemsService {
    selectedSettings: SettingsVM = new SettingsVM;
    selectedStore: StoreVM = new StoreVM;
    selectedUOMConversion: UOMConversionVM = new UOMConversionVM;
    selectedSettingsType: SettingsTypeVM = new SettingsTypeVM;
    constructor(private http: HttpClient) { }


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




