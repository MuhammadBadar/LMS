
import { CourseScheduleVM } from './Models/CourseScheduleVM';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
import {  ScheduleDayVM, ScheduleVM } from './Models/ScheduleVM';
import { ScheduleDayEventVM } from './Models/ScheduleDayEventVM';
@Injectable({
  providedIn: 'root'
})
export class SCHService {

  selectedScheduleId: number;
  selectedScheduleDayId: number;

  constructor(private http: HttpClient) { }

  UpdateCourseSchedule(value: CourseScheduleVM): Observable<CourseScheduleVM> {
    return this.http.put<CourseScheduleVM>(Globals.BASE_API_URL + 'CourseSchedule', value);
  }
  GetCourseScheduleById(id: number): Observable<CourseScheduleVM[]> {
    return this.http.get<CourseScheduleVM[]>(Globals.BASE_API_URL + 'CourseSchedule/' + id).pipe()
  }
  SearchCourseSchedule(value: CourseScheduleVM): Observable<CourseScheduleVM[]> {
    return this.http.post<CourseScheduleVM[]>(Globals.BASE_API_URL + 'CourseSchedule/Search', value).pipe();
  }
  GetCourseSchedule(): Observable<CourseScheduleVM[]> {
    return this.http.get<CourseScheduleVM[]>(Globals.BASE_API_URL + 'CourseSchedule').pipe();
  }
  SaveCourseSchedule(value: CourseScheduleVM): Observable<CourseScheduleVM> {
    return this.http.post<CourseScheduleVM>(Globals.BASE_API_URL + 'CourseSchedule', value);
  }
  DeleteCourseSchedule(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'CourseSchedule/' + id);
  }



  GetSchedule(): Observable<ScheduleVM[]> {
    return this.http.get<ScheduleVM[]>(Globals.BASE_API_URL + 'Schedule').pipe();
  }
   GetScheduleById(id: number): Observable<ScheduleVM[]> {
    return this.http.get<ScheduleVM[]>(Globals.BASE_API_URL + 'Schedule/' + id).pipe()
  }
  GetScheduleByUserId(userId: string): Observable<ScheduleVM> {
    return this.http.get<ScheduleVM>(Globals.BASE_API_URL + 'Schedule/GetScheduleByUserId?userId=' + userId).pipe()
  }  
  
  SaveSchedule(value: ScheduleVM) {
    return this.http.post(Globals.BASE_API_URL + 'Schedule', value)
  }
  UpdateSchedule(value: ScheduleVM) {
    return this.http.put(Globals.BASE_API_URL + 'Schedule', value)
  }
  DeleteSchedule(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Schedule/' + id)
  }
  SearchSchedule(value: ScheduleVM): Observable<ScheduleVM[]> {
    return this.http.post<ScheduleVM[]>(Globals.BASE_API_URL + 'Schedule/Search', value).pipe();
  }

  GetScheduleDayEvents(scheduleDayId:number): Observable<ScheduleDayEventVM[]> {
    return this.http.get<ScheduleDayEventVM[]>(Globals.BASE_API_URL + 'ScheduleDayEvent/GetScheduleDayEvents?scheduleDayId=' + scheduleDayId).pipe();
  }
   GetScheduleDayEventById(id: number): Observable<ScheduleDayEventVM[]> {
    return this.http.get<ScheduleDayEventVM[]>(Globals.BASE_API_URL + 'ScheduleDayEvent/' + id).pipe()
  }
  SaveScheduleDayEvent(value: ScheduleDayEventVM) {
    return this.http.post(Globals.BASE_API_URL + 'ScheduleDayEvent', value)
  }
  UpdateScheduleDayEvent(value: ScheduleDayEventVM) {
    return this.http.put(Globals.BASE_API_URL + 'ScheduleDayEvent', value)
  }
  DeleteScheduleDayEvent(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'ScheduleDayEvent/' + id)
  }
  SearchScheduleDayEvent(value: ScheduleDayEventVM): Observable<ScheduleDayEventVM[]> {
    return this.http.post<ScheduleDayEventVM[]>(Globals.BASE_API_URL + 'ScheduleDayEvent/Search', value).pipe();
  }


}
