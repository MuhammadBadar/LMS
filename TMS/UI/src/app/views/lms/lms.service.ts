
import { LectureVM } from './models/lectureVM';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { LoginVM } from './models/loginVM';
import { StudentRegistrationVM } from './models/studentregistrationVM';
import { Observable, throwError } from 'rxjs';
import { UserVM } from './models/userVM';
import { StudentLectureVM } from './models/assignlectureVM';
import { catchError } from 'rxjs/operators';
import { EnumValueVM } from './models/EnumValueVM';


@Injectable({
  providedIn: 'root'
})
export class LMSService {

  selectedStudent: LoginVM;
  selectedUser: UserVM;
  selectedLecture: LectureVM;
  selectedStudentLecture: StudentLectureVM;
  selectedRegisterStudent: StudentRegistrationVM
  constructor(private http: HttpClient) { }
  // private handleError(error: HttpErrorResponse) {
  //   if (error.status === 0) {
  //     // A client-side or network error occurred. Handle it accordingly.
  //     console.error('An error occurred:', error.error);
  //   } else {
  //     // The backend returned an unsuccessful response code.
  //     // The response body may contain clues as to what went wrong.
  //     console.error(
  //       `Backend returned code ${error.status}, body was: `, error.error);
  //   }
  //   // Return an observable with a user-facing error message.
  //   return throwError(
  //     'Something bad happened; please try again later.');
  // }
  GetEnumValues(type): Observable<EnumValueVM[]> {
    return this.http.get<EnumValueVM[]>('https://localhost:7100/api/EnumValues/'+type).pipe();
  }
  UpdateStudent(std: StudentRegistrationVM) {
    
    return this.http.put('https://localhost:7100/api/Student', std);
  }

  UpdateLecture(lec: LectureVM) {
    return this.http.put('https://localhost:7100/api/Lecture', lec);
  }
  UpdateAssignLec(sLec: StudentLectureVM) {
    return this.http.put('https://localhost:7100/api/StudentLecture', sLec);
  }
  DeleteLecture(id) {
    return this.http.delete('https://localhost:7100/api/Lecture/' + id);
  }
  DeleteService(id) {
    return this.http.delete('https://localhost:7100/api/Services/' + id);
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
  DeleteStudent(id) {
    return this.http.delete('https://localhost:7100/api/Student/' + id);
  }
  DeleteStudentLecture(id) {
    return this.http.delete('https://localhost:7100/api/StudentLecture/' + id);
  }
  getRegisterStudentList(): Observable<StudentRegistrationVM[]> {

    return this.http.get<StudentRegistrationVM[]>('https://localhost:7100/api/Student').pipe();
  }
  getStudentLectureList(): Observable<StudentLectureVM[]> {

    return this.http.get<StudentLectureVM[]>('https://localhost:7100/api/StudentLecture').pipe();
  }
  getUserList(): Observable<UserVM[]> {

    return this.http.get<UserVM[]>('https://localhost:7100/api/Users').pipe();
  }
  getLectureList(): Observable<LectureVM[]> {

    return this.http.get<LectureVM[]>('https://localhost:7100/api/Lecture').pipe(
    );
  }
  SaveStudentRegistration(student: StudentRegistrationVM) {
    return this.http.post('https://localhost:7100/api/Student', student);
  }
  SaveUser(user: UserVM) {
    return this.http.post('https://localhost:7100/api/User', user);
  }
  SaveLecture(lecture: LectureVM) {
    return this.http.post('https://localhost:7100/api/Lecture', lecture);
  }
  SaveStudentLecture(lecture: StudentLectureVM) {
    return this.http.post('https://localhost:7100/api/StudentLecture', lecture)
  }
  SearchStudentLecture(search): Observable<StudentLectureVM[]> {
    return this.http.post<StudentLectureVM[]>('https://localhost:7100/api/StudentLecture/Search', search).pipe();
  }
  SearchLecture(search): Observable<LectureVM[]> {
    return this.http.post<LectureVM[]>('https://localhost:7100/api/Lecture/Search', search).pipe();
  }
  SearchStudent(search): Observable<StudentRegistrationVM[]> {
    return this.http.post<StudentRegistrationVM[]>('https://localhost:7100/api/Student/Search', search).pipe();
  }
}