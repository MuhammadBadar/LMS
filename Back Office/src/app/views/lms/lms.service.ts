import { TopicVM } from './Models/TopicVM';
import { CourseDetailVM } from './Models/CourseDetailVM';
import { ScheduleVM } from './Models/ScheduleVM';
import { CourseVM } from './Models/CourseVM';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
import { InquiryVM } from './Models/InquiryVM';
import { CityStudentVM } from './Models/CityStudentVM';
import { StudentVM } from './Models/StudentVM';
import { CityVM } from './Models/CityVM';
import { UserVM } from './Models/UserVM';
import { VocabularyVM } from './Models/VocabularyVM';

@Injectable({
  providedIn: 'root'
})
export class LMSService {
 

  constructor(private http: HttpClient) { }


  UpdateVocabulary(value: VocabularyVM) {
    return this.http.put(Globals.BASE_API_URL + 'Vocabulary', value);
  }
  // GetVocabularyById(id: number): Observable<VocabularyVM> {
  //   return this.http.get<VocabularyVM>(Globals.BASE_API_URL + 'Inquiry/' + id).pipe()
  // }
  SearchVocabulary(value: VocabularyVM): Observable<VocabularyVM[]> {
    return this.http.post<VocabularyVM[]>(Globals.BASE_API_URL + 'Vocabulary/Search', value).pipe();
  }
  GetVocabulary(): Observable<VocabularyVM[]> {
    return this.http.get<VocabularyVM[]>(Globals.BASE_API_URL + 'Vocabulary').pipe();
  }
  SaveVocabulary(value: VocabularyVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Vocabulary', value);
  }
  DeleteVocabulary(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Vocabulary/' + id);
  }





  UpdateInquiry(value: InquiryVM) {
    return this.http.put(Globals.BASE_API_URL + 'Inquiry', value);
  }
  GetInquiryById(id: number): Observable<InquiryVM> {
    return this.http.get<InquiryVM>(Globals.BASE_API_URL + 'Inquiry/' + id).pipe()
  }
  SearchInquiry(value: InquiryVM): Observable<InquiryVM[]> {
    return this.http.post<InquiryVM[]>(Globals.BASE_API_URL + 'Inquiry/Search', value).pipe();
  }
  GetInquiry(): Observable<InquiryVM[]> {
    return this.http.get<InquiryVM[]>(Globals.BASE_API_URL + 'Inquiry').pipe();
  }
  SaveInquiry(value: InquiryVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Inquiry', value);
  }
  DeleteInquiry(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Inquiry/' + id);
  }


  UpdateUser(value: UserVM) {
    return this.http.put(Globals.BASE_API_URL + 'User', value);
  }
  GetUserById(id: number): Observable<UserVM> {
    return this.http.get<UserVM>(Globals.BASE_API_URL + 'User/' + id).pipe()
  }
  SearchUser(value: UserVM): Observable<UserVM[]> {
    return this.http.post<UserVM[]>(Globals.BASE_API_URL + 'User/Search', value).pipe();
  }
  GetUser(): Observable<UserVM[]> {
    return this.http.get<UserVM[]>(Globals.BASE_API_URL + 'User').pipe();
  }
  SaveUser(value: UserVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'User', value);
  }
  DeleteUser(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'User/' + id);
  }


  UpdateCourseDetail(value: CourseDetailVM) {
    return this.http.put(Globals.BASE_API_URL + 'CourseDetail', value);
  }
  GetCourseDetailById(id: number): Observable<CourseDetailVM> {
    return this.http.get<CourseDetailVM>(Globals.BASE_API_URL + 'CourseDetail/' + id).pipe()
  }
  SearchCourseDetail(value: CourseDetailVM): Observable<CourseDetailVM[]> {
    return this.http.post<CourseDetailVM[]>(Globals.BASE_API_URL + 'CourseDetail/Search', value).pipe();
  }
  GetCourseDetail(): Observable<CourseDetailVM[]> {
    return this.http.get<CourseDetailVM[]>(Globals.BASE_API_URL + 'CourseDetail').pipe();
  }
  SaveCourseDetail(value: CourseDetailVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'CourseDetail', value);
  }
  DeleteCourseDetail(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'CourseDetail/' + id);
  }


  UpdateSchedule(value: ScheduleVM): Observable<ScheduleVM> {
    return this.http.put<ScheduleVM>(Globals.BASE_API_URL + 'Schedule', value);
  }
  GetScheduleById(id: number): Observable<ScheduleVM[]> {
    return this.http.get<ScheduleVM[]>(Globals.BASE_API_URL + 'Schedule/' + id).pipe()
  }
  SearchSchedule(value: ScheduleVM): Observable<ScheduleVM[]> {
    return this.http.post<ScheduleVM[]>(Globals.BASE_API_URL + 'Schedule/Search', value).pipe();
  }
  GetSchedule(): Observable<ScheduleVM[]> {
    return this.http.get<ScheduleVM[]>(Globals.BASE_API_URL + 'Schedule').pipe();
  }
  SaveSchedule(value: ScheduleVM): Observable<ScheduleVM> {
    return this.http.post<ScheduleVM>(Globals.BASE_API_URL + 'Schedule', value);
  }
  DeleteSchedule(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Schedule/' + id);
  }


  SaveCourse(value: CourseVM) {
    return this.http.post(Globals.BASE_API_URL + 'Course', value);
  }
  UpdateCourse(value: CourseVM) {
    return this.http.put(Globals.BASE_API_URL + 'Course', value);
  }
  DeleteCourse(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Course/' + id);
  }
  GetCourse(): Observable<CourseVM[]> {
    return this.http.get<CourseVM[]>(Globals.BASE_API_URL + 'Course').pipe();
  }
  SearchCourse(value: CourseVM): Observable<CourseVM[]> {
    return this.http.post<CourseVM[]>(Globals.BASE_API_URL + 'Course/Serach', value).pipe()
  }


  GetTopic(): Observable<TopicVM[]> {
    return this.http.get<TopicVM[]>(Globals.BASE_API_URL + 'Topic').pipe();
  }
  SaveTopic(value: TopicVM) {
    return this.http.post(Globals.BASE_API_URL + 'Topic', value)
  }
  UpdateTopic(value: TopicVM) {
    return this.http.put(Globals.BASE_API_URL + 'Topic', value)
  }
  DeleteTopic(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Topic/' + id)
  }
  SearchTopic(value: TopicVM): Observable<TopicVM[]> {
    return this.http.post<TopicVM[]>(Globals.BASE_API_URL + 'Topic', value).pipe();
  }




  GetCity(): Observable<CityVM[]> {
    return this.http.get<CityVM[]>(Globals.BASE_API_URL + 'City').pipe();
  }
  SaveCity(value: CityVM) {
    return this.http.post(Globals.BASE_API_URL + 'City', value)
  }
  UpdateCity(value: CityVM) {
    return this.http.put(Globals.BASE_API_URL + 'City', value)
  }
  DeleteCity(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'City/' + id)
  }
  SearchCity(value: CityVM): Observable<CityVM[]> {
    return this.http.post<CityVM[]>(Globals.BASE_API_URL + 'City/Search', value).pipe();
  }
  



  
  GetStudent(): Observable<StudentVM[]> {
    return this.http.get<StudentVM[]>(Globals.BASE_API_URL + 'Student').pipe();
  }
  SaveStudent(value: StudentVM) {
    return this.http.post(Globals.BASE_API_URL + 'Student', value)
  }
  UpdateStudent(value: StudentVM) {
    return this.http.put(Globals.BASE_API_URL + 'Student', value)
  }
  DeleteStudent(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Student/' + id)
  }
  SearchStudent(value: StudentVM): Observable<StudentVM[]> {
    return this.http.post<StudentVM[]>(Globals.BASE_API_URL + 'Student/Search', value).pipe();
  }

  GetCityStudent(): Observable<CityStudentVM[]> {
    return this.http.get<CityStudentVM[]>(Globals.BASE_API_URL + 'CityStudent').pipe();
  }
  SaveCityStudent(value: CityStudentVM) {
    return this.http.post(Globals.BASE_API_URL + 'CityStudent', value)
  }
  UpdateCityStudent(value: CityStudentVM) {
    return this.http.put(Globals.BASE_API_URL + 'CityStudent', value)
  }
  DeleteCityStudent(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'CityStudent/' + id)
  }
  SearchCityStudent(value: CityStudentVM): Observable<CityStudentVM[]> {
    return this.http.post<CityStudentVM[]>(Globals.BASE_API_URL + 'CityStudent/Search', value).pipe();
  }
}

