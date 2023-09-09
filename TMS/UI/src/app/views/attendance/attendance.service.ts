import { LogEventVM } from './models/LogEventVM';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MarkAttendanceVM } from './models/MarkAttendanceVM';
@Injectable({
    providedIn: 'root'
  })
  export class AttendanceService{
      selectedAttendance:MarkAttendanceVM;
      selectedLogEvent:LogEventVM
    constructor(private http: HttpClient) {

    }
    UpdateMarkAttendance(attnd: MarkAttendanceVM) {
        return this.http.put('https://localhost:7100/api/Attendance', attnd);
    }
    DeleteMarkAttendance(id) {
        return this.http.delete('https://localhost:7100/api/Attendance/' + id);
    }
    SaveAttendance(attnd: MarkAttendanceVM) {
        return this.http.post('https://localhost:7100/api/Attendance', attnd);
    }
    SearchAttendance(search): Observable<MarkAttendanceVM[]> {
        return this.http.post<MarkAttendanceVM[]>('https://localhost:7100/api/Attendance/Search', search).pipe();
    }
    UpdateLogEvent(logs: LogEventVM) {
        return this.http.put('https://localhost:7100/api/LogEvent', logs);
    }
    DeleteLogEvent(id) {
        return this.http.delete('https://localhost:7100/api/LogEvent/' + id);
    }
    SaveLogEvent(logs: LogEventVM) {
        return this.http.post('https://localhost:7100/api/LogEvent', logs);
    }
    SearchLogEvent(search): Observable<LogEventVM[]> {
        return this.http.post<[LogEventVM]>('https://localhost:7100/api/LogEvent/Search', search).pipe();
    }
  }
