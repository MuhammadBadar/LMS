import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
import { SettingsTypeVM } from './Models/SettingsTypeVM';
import { SettingsVM } from '../catalog/Models/SettingsVM';
import { CityStudentsTypeVM } from '../items/Models/CityStudentsTypeVM';
import { StudentsTypeVM } from '../items/Models/StudentsTypeVM';
import { CitiesTypeVM } from '../items/Models/CitiesTypeVM';
import { SettingsvVM } from '../items/Models/SettingsvVM';
import { StudentVM } from '../lms/Models/StudentVM';
import { CitiesVM } from '../items/Models/CitiesVM';
import { CityStudentVM } from '../lms/Models/CityStudentVM';
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


  UpdateSettingsv(value: SettingsvVM) {
    return this.http.put(Globals.BASE_API_URL + 'Settings', value);
  }
  GetSettingsvById(id: number): Observable<SettingsvVM> {
    return this.http.get<SettingsvVM>(Globals.BASE_API_URL + 'Settings/' + id).pipe()
  }
  SearchSettingsv(value: SettingsVM): Observable<SettingsvVM[]> {
    return this.http.post<SettingsvVM[]>(Globals.BASE_API_URL + 'Settings/Search', value).pipe();
  }
  GetSettingsv(): Observable<SettingsvVM[]> {
    return this.http.get<SettingsvVM[]>(Globals.BASE_API_URL + 'Settings').pipe();
  }
  SaveSettingsv(value: SettingsvVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Settings', value);
  }
  DeleteSettingsv(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Settings/' + id);
  }
  SearchStngByCodev(Id: number, KeyCode: string): Observable<SettingsvVM[]> {
    return this.http.get<SettingsvVM[]>(Globals.BASE_API_URL + 'Settings/' + Id + "/" + KeyCode).pipe();
  }


  UpdateSettingsvType(value: SettingsvVM) {
    return this.http.put(Globals.BASE_API_URL + 'SettingsType', value);
  }
  GetSettingsvTypeById(id: number): Observable<SettingsvVM> {
    return this.http.get<SettingsvVM>(Globals.BASE_API_URL + 'SettingsType/' + id).pipe()
  }
  SearchSettingsvType(value: SettingsTypeVM): Observable<SettingsvVM[]> {
    return this.http.post<SettingsvVM[]>(Globals.BASE_API_URL + 'SettingsType/Search', value).pipe();
  }
  GetSettingsvtpe(): Observable<SettingsvVM[]> {
    return this.http.get<SettingsvVM[]>(Globals.BASE_API_URL + 'SettingsType').pipe();
  }
  SaveSettingsvType(value: SettingsvVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'SettingsType', value);
  }
  DeleteSettingsvType(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'SettingsType/' + id);
  }







  // UpdateCities(value: CitiesVM) {
  //   return this.http.put(Globals.BASE_API_URL + 'City', value);
  // }
  // GetCitiesById(id: number): Observable<CitiesVM> {
  //   return this.http.get<CitiesVM>(Globals.BASE_API_URL + 'City/' + id).pipe()
  // }
  // SearchCities(value: CitiesVM): Observable<CitiesVM[]> {
  //   return this.http.post<CitiesVM[]>(Globals.BASE_API_URL + 'City/Search', value).pipe();
  // }
  // GetCities(): Observable<CitiesVM[]> {
  //   return this.http.get<CitiesVM[]>(Globals.BASE_API_URL + 'City').pipe();
  // }
  // SaveCities(value: CitiesVM): Observable<any> {
  //   return this.http.post(Globals.BASE_API_URL + 'City', value);
  // }
  // DeleteCities(id: number) {
  //   return this.http.delete(Globals.BASE_API_URL + 'City/' + id);
  // }
  // SearchCitiesByCode(Id: number, KeyCode: string): Observable<CitiesVM[]> {
  //   return this.http.get<CitiesVM[]>(Globals.BASE_API_URL + 'City/' + Id + "/" + KeyCode).pipe();
  // }


  // UpdateCitiesType(value: CitiesTypeVM) {
  //   return this.http.put(Globals.BASE_API_URL + 'CitiesType', value);
  // }
  // GetCitiesTypeById(id: number): Observable<CitiesTypeVM> {
  //   return this.http.get<CitiesTypeVM>(Globals.BASE_API_URL + 'CitiesType/' + id).pipe()
  // }
  // SearchCitiesType(value: CitiesTypeVM): Observable<CitiesTypeVM[]> {
  //   return this.http.post<CitiesTypeVM[]>(Globals.BASE_API_URL + 'CitiesType/Search', value).pipe();
  // }
  // GetCitiesType(): Observable<CitiesTypeVM[]> {
  //   return this.http.get<CitiesTypeVM[]>(Globals.BASE_API_URL + 'CitiesType').pipe();
  // }
  // SaveCitiesType(value: CitiesTypeVM): Observable<any> {
  //   return this.http.post(Globals.BASE_API_URL + 'CitiesType', value);
  // }
  // DeleteCitiesType(id: number) {
  //   return this.http.delete(Globals.BASE_API_URL + 'CitiesType/' + id);
  // }







  
  // UpdateStudents(value: StudentVM) {
  //   return this.http.put(Globals.BASE_API_URL + 'Student', value);
  // }
  // GetStudentsById(id: number): Observable<StudentVM> {
  //   return this.http.get<StudentVM>(Globals.BASE_API_URL + 'Student/' + id).pipe()
  // }
  // SearchStudents(value: StudentVM): Observable<StudentVM[]> {
  //   return this.http.post<StudentVM[]>(Globals.BASE_API_URL + 'Student/Search', value).pipe();
  // }
  // GetStudents(): Observable<StudentVM[]> {
  //   return this.http.get<StudentVM[]>(Globals.BASE_API_URL + 'Student').pipe();
  // }
  // SaveStudents(value: StudentVM): Observable<any> {
  //   return this.http.post(Globals.BASE_API_URL + 'Student', value);
  // }
  // DeleteStudents(id: number) {
  //   return this.http.delete(Globals.BASE_API_URL + 'Student/' + id);
  // }
  // SearchStudentsByCode(Id: number, KeyCode: string): Observable<StudentVM[]> {
  //   return this.http.get<StudentVM[]>(Globals.BASE_API_URL + 'Student/' + Id + "/" + KeyCode).pipe();
  // }


  // UpdateStudentsType(value: StudentsTypeVM) {
  //   return this.http.put(Globals.BASE_API_URL + 'StudentsType', value);
  // }
  // GetStudentsTypeById(id: number): Observable<StudentsTypeVM> {
  //   return this.http.get<StudentsTypeVM>(Globals.BASE_API_URL + 'StudentsType/' + id).pipe()
  // }
  // SearchStudentsType(value: StudentsTypeVM): Observable<StudentsTypeVM[]> {
  //   return this.http.post<StudentsTypeVM[]>(Globals.BASE_API_URL + 'StudentsType/Search', value).pipe();
  // }
  // GetStudentsType(): Observable<StudentsTypeVM[]> {
  //   return this.http.get<StudentsTypeVM[]>(Globals.BASE_API_URL + 'StudentsType').pipe();
  // }
  // SaveStudentsType(value: StudentsTypeVM): Observable<any> {
  //   return this.http.post(Globals.BASE_API_URL + 'StudentsType', value);
  // }
  // DeleteStudentsType(id: number) {
  //   return this.http.delete(Globals.BASE_API_URL + 'StudentsType/' + id);
  // }






  // UpdateCityStudents(value: CityStudentVM) {
  //   return this.http.put(Globals.BASE_API_URL + 'Student', value);
  // }
  // GetCityStudentsById(id: number): Observable<CityStudentVM> {
  //   return this.http.get<CityStudentVM>(Globals.BASE_API_URL + 'CityStudent/' + id).pipe()
  // }
  // SearchCityStudents(value: CityStudentVM): Observable<CityStudentVM[]> {
  //   return this.http.post<CityStudentVM[]>(Globals.BASE_API_URL + 'CityStudent/Search', value).pipe();
  // }
  // GetCityStudents(): Observable<CityStudentVM[]> {
  //   return this.http.get<CityStudentVM[]>(Globals.BASE_API_URL + 'CityStudent').pipe();
  // }
  // SaveCityStudents(value: CityStudentVM): Observable<any> {
  //   return this.http.post(Globals.BASE_API_URL + 'CityStudent', value);
  // }
  // DeleteCityStudents(id: number) {
  //   return this.http.delete(Globals.BASE_API_URL + 'CityStudent/' + id);
  // }
  // SearchCityStudentsByCode(Id: number, KeyCode: string): Observable<CityStudentVM[]> {
  //   return this.http.get<CityStudentVM[]>(Globals.BASE_API_URL + 'CityStudent/' + Id + "/" + KeyCode).pipe();
  // }


  // UpdateCityStudentsType(value: CityStudentsTypeVM) {
  //   return this.http.put(Globals.BASE_API_URL + 'CityStudentsType', value);
  // }
  // GetCityStudentsTypeById(id: number): Observable<CityStudentsTypeVM> {
  //   return this.http.get<CityStudentsTypeVM>(Globals.BASE_API_URL + 'CityStudentsType/' + id).pipe()
  // }
  // SearchCityStudentsType(value: CityStudentsTypeVM): Observable<CityStudentsTypeVM[]> {
  //   return this.http.post<CityStudentsTypeVM[]>(Globals.BASE_API_URL + 'CityStudentsType/Search', value).pipe();
  // }
  // GetCityStudentsType(): Observable<CityStudentsTypeVM[]> {
  //   return this.http.get<CityStudentsTypeVM[]>(Globals.BASE_API_URL + 'CityStudentsType').pipe();
  // }
  // SaveCityStudentsType(value: CityStudentsTypeVM): Observable<any> {
  //   return this.http.post(Globals.BASE_API_URL + 'CityStudentsType', value);
  // }
  // DeleteCityStudentsType(id: number) {
  //   return this.http.delete(Globals.BASE_API_URL + 'CityStudentsType/' + id);
  // }




}