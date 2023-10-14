
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
import {AttendanceVM} from './Models/AttendanceVM';
@Injectable({
  providedIn: 'root'
})
export class ATTService {

  selectedScheduleId: number;
  selectedScheduleDayId: number;

  constructor(private http: HttpClient) { }

 
//Attendance lms services
GetAttendance(): Observable<AttendanceVM[]>{
  return this.http.get<AttendanceVM[]>(Globals.BASE_API_URL + 'Attendance').pipe();
}
GetAttendanceById(id: number): Observable<AttendanceVM[]> {
  return this.http.get<AttendanceVM[]>(Globals.BASE_API_URL + 'Attendance/' + id).pipe()
}
SaveAttendance(value:AttendanceVM){
  return this.http.post(Globals.BASE_API_URL + 'Attendance',value);
}
UpdateAttendance(value:AttendanceVM){
  return this.http.post(Globals.BASE_API_URL + 'Attendance',value);
}
DeleteAttendance(id:number){
  return this.http.delete(Globals.BASE_API_URL + 'Attendance/' + id);
}
SearchAttendance(value:AttendanceVM): Observable<AttendanceVM[]>{
  return this.http.post<AttendanceVM[]>(Globals.BASE_API_URL + 'Attendance/Search',value).pipe();
}


}
