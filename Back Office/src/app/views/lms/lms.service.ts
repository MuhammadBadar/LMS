import { ClientVM } from './Models/ClientVM';

import { TopicVM } from './Models/TopicVM';
import { CourseDetailVM } from './Models/CourseDetailVM';

import { CourseVM } from './Models/CourseVM';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Globals } from 'src/app/globals';
import { InquiryVM } from './Models/InquiryVM';
import { UserVM } from './Models/UserVM';

import { UserreportVM } from './Models/UserreportVM';
import{LectureVM} from './Models/LectureVM';
import{AssignTaskVM}from './Models/AssignTaskVM';
import { StudentVM } from './Models/StudentVM';
import { CityVM } from './Models/CityVM';

import {UserattbydateVM} from './Models/UserattbydateVM';
import { TaskVM } from './Models/TaskVM';
import { UserTaskbydateVM } from './Models/UsertaskbydateVM';


import { CityStudentVM } from './Models/CityStudentVM';
import { VocabularyVM } from './Models/VocabularyVM';
import { PatientVM } from './Models/PatientVM';
import { UserTaskVM } from './Models/UserTaskVM';


@Injectable({
  providedIn: 'root'
})
export class LMSService {

  userId: string = '';

  selectedTask: UserTaskVM;

  constructor(private http: HttpClient) { }

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
    return this.http.post<TopicVM[]>(Globals.BASE_API_URL + 'Topic/Search', value).pipe();
  }
  
  GetLecture(): Observable<LectureVM[]> {
    return this.http.get<LectureVM[]>(Globals.BASE_API_URL + 'Lecture').pipe();
  }
  SaveLecture(value:LectureVM) {
    return this.http.post(Globals.BASE_API_URL + 'Lecture', value)
  }
  UpdateLecture(value: LectureVM) {
    return this.http.put(Globals.BASE_API_URL + 'Lecture', value)
  }
  DeleteLecture(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Lecture/' + id)
  }
  SearchLecture(value: LectureVM): Observable<LectureVM[]> {
    return this.http.post<LectureVM[]>(Globals.BASE_API_URL + 'Lecture/Search', value).pipe();
  }

  GetAssignTask(): Observable<AssignTaskVM[]> {
    return this.http.get<AssignTaskVM[]>(Globals.BASE_API_URL + 'AssignTask').pipe();
  }
  SaveAssignTask(value:AssignTaskVM) {
    return this.http.post(Globals.BASE_API_URL + 'AssignTask', value)
  }
  UpdateAssignTask(value: AssignTaskVM) {
    return this.http.put(Globals.BASE_API_URL + 'AssignTask', value)
  }
  DeleteAssignTask(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'AssignTask/' + id)
  }
  SearchAssignTask(value: AssignTaskVM): Observable<AssignTaskVM[]> {
    return this.http.post<AssignTaskVM[]>(Globals.BASE_API_URL + 'AssignTask/Search', value).pipe();
  }
  
  GetStudent(): Observable<StudentVM[]> {
    return this.http.get<StudentVM[]>(Globals.BASE_API_URL + 'Student').pipe();
  }
  SaveStudent(value:StudentVM) {
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


 


//Userattbydate lms services
GetUserattbydate(): Observable<UserattbydateVM[]>{
  return this.http.get<UserattbydateVM[]>(Globals.BASE_API_URL + 'Userattbydate').pipe();
}
GetUserattbydateById(id: number): Observable<UserattbydateVM[]> {
  return this.http.get<UserattbydateVM[]>(Globals.BASE_API_URL + 'Userattbydate/' + id).pipe()
}
SaveUserattbydate(value:UserattbydateVM){
  return this.http.post(Globals.BASE_API_URL + 'Userattbydate',value);
}
UpdateUserattbydate(value:UserattbydateVM){
  return this.http.post(Globals.BASE_API_URL + 'Userattbydate',value);
}
DeleteUserattbydate(id:number){
  return this.http.delete(Globals.BASE_API_URL + 'Userattbydate/' + id);
}
SearchUserattbydate(value:UserattbydateVM): Observable<UserattbydateVM[]>{
  return this.http.post<UserattbydateVM[]>(Globals.BASE_API_URL + 'Userattbydate',value).pipe();
}


//UserTaskbydateVM lms services
GetUserTaskbydate(): Observable<UserTaskbydateVM[]>{
  return this.http.get<UserTaskbydateVM[]>(Globals.BASE_API_URL + 'UserTaskbydate').pipe();
}
GetUserTaskbydateId(id: number): Observable<UserTaskbydateVM[]> {
  return this.http.get<UserTaskbydateVM[]>(Globals.BASE_API_URL + 'UserTaskbydate/' + id).pipe()
}
SaveUserTaskbydate(value:UserTaskbydateVM){
  return this.http.post(Globals.BASE_API_URL + 'UserTaskbydate',value);
}
UpdateUserTaskbydate(value:UserTaskbydateVM){
  return this.http.post(Globals.BASE_API_URL + 'UserTaskbydate',value);
}
DeleteUserTaskbydate(id:number){
  return this.http.delete(Globals.BASE_API_URL + 'UserTaskbydate/' + id);
}
SearchUserTaskbydate(value:UserTaskbydateVM): Observable<UserTaskbydateVM[]>{
  return this.http.post<UserTaskbydateVM[]>(Globals.BASE_API_URL + 'UserTaskbydate',value).pipe();
}

//UserTaskVM lms services
GetTaskByUserId(userId: string): Observable<TaskVM[]> {
  debugger;
  return this.http.get<TaskVM[]>(Globals.BASE_API_URL + 'Task/GetTasksByUserId/' + userId).pipe()
}
GetScheduleByUserIdForLogin(userId: string): Observable<TaskVM[]> {
  debugger;
  return this.http.get<TaskVM[]>(Globals.BASE_API_URL + 'Schedule/GetScheduleByUserIdForLogin?userId=' + userId).pipe()
}

GetTask(): Observable<TaskVM[]>{
  return this.http.get<TaskVM[]>(Globals.BASE_API_URL + 'Task').pipe();
}
GetTaskId(userId: string): Observable<TaskVM[]> {
  debugger;
  return this.http.get<TaskVM[]>(Globals.BASE_API_URL + 'Task/' + userId).pipe()
}
SaveTask(value:TaskVM){
  return this.http.post(Globals.BASE_API_URL + 'Task',value);
}
UpdateTask(value:TaskVM){
  return this.http.post(Globals.BASE_API_URL + 'Task',value);
}
DeleteTask(id:number){
  return this.http.delete(Globals.BASE_API_URL + 'Task/' + id);
}
SearchTask(value:TaskVM): Observable<TaskVM[]>{
  return this.http.post<TaskVM[]>(Globals.BASE_API_URL + 'Task',value).pipe();
}

//UserTaskVM lms services
GetUserreport(): Observable<UserreportVM[]>{
  return this.http.get<UserreportVM[]>(Globals.BASE_API_URL + 'Userreport').pipe();
}
GetUserreportId(id: number): Observable<UserreportVM[]> {
  return this.http.get<UserreportVM[]>(Globals.BASE_API_URL + 'Userreport/Search' + id).pipe()
}
SearchUserreport(value:UserreportVM): Observable<UserreportVM[]>{
  return this.http.post<UserreportVM[]>(Globals.BASE_API_URL + 'Userreport/Search' ,value).pipe();
}
//PatientVM lms services
GetPatient(): Observable<PatientVM[]>{
  return this.http.get<PatientVM[]>(Globals.BASE_API_URL + 'Patient').pipe();
}
GetPatientId(id: number): Observable<PatientVM[]> {
  return this.http.get<PatientVM[]>(Globals.BASE_API_URL + 'Patient/' + id).pipe()
}
SavePatient(value:PatientVM){
  return this.http.post(Globals.BASE_API_URL + 'Patient',value);
}
UpdatePatient(value:PatientVM){
  return this.http.put(Globals.BASE_API_URL + 'Patient',value);
}
DeletePatient(id:number){
  return this.http.delete(Globals.BASE_API_URL + 'Patient/' + id);
}
SearchPatient(value:PatientVM): Observable<PatientVM[]>{
  return this.http.post<PatientVM[]>(Globals.BASE_API_URL + 'Patient/Search' ,value).pipe();
}


//PatientVM lms services
GetClient(): Observable<ClientVM[]>{
  return this.http.get<ClientVM[]>(Globals.BASE_API_URL + 'Client').pipe();
}
GetClientId(id: number): Observable<ClientVM[]> {
  return this.http.get<ClientVM[]>(Globals.BASE_API_URL + 'Client/' + id).pipe()
}
SaveClient(value:ClientVM){
  return this.http.post(Globals.BASE_API_URL + 'Client',value);
}
UpdateClient(value:ClientVM){
  return this.http.put(Globals.BASE_API_URL + 'Client',value);
}
DeleteClient(id:number){
  return this.http.delete(Globals.BASE_API_URL + 'Client/' + id);
}
SearchClient(value:ClientVM): Observable<ClientVM[]>{
  return this.http.post<ClientVM[]>(Globals.BASE_API_URL + 'Client/Search' ,value).pipe();
}

// usertask lms service 
GetUsertask(): Observable<UserTaskVM[]> {
  return this.http.get<UserTaskVM[]>(Globals.BASE_API_URL + 'UserTask').pipe();
}
SaveUsertask(task: UserTaskVM) {
  return this.http.post(Globals.BASE_API_URL + 'UserTask', task)
}
SaveUsertasks(tasks: UserTaskVM[]) {
  debugger;
  return this.http.post<UserTaskVM[]>(Globals.BASE_API_URL + 'UserTask', tasks)
}
UpdateUsertask(value: UserTaskVM) {
  return this.http.put(Globals.BASE_API_URL + 'UserTask', value)
}
UpdateUsertasks(tasks: UserTaskVM[]) {
  return this.http.put<UserTaskVM[]>(Globals.BASE_API_URL + 'UserTask', tasks)
}
DeleteUsertask(id: number) {
  return this.http.delete(Globals.BASE_API_URL + 'UserTask/' + id)
}
SearchUsertask(value: UserTaskVM): Observable<UserTaskVM[]> {
  return this.http.post<UserTaskVM[]>(Globals.BASE_API_URL + 'UserTask/Search', value).pipe();
}

}
