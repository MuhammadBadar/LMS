import { NotificationTemplateVM } from './models/NotificationTemplateVM';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TaskVM, AttachmentsVM } from './models/task-vm';
import { EnumValueVM } from './models/EnumValueVM';
import { EnumType } from './models/EnumType';
import { Observable } from 'rxjs';
import { TaskCommentVM } from './models/taskcomment-vm';
import { NotificationVM } from './models/NotificationVM';

@Injectable({
  providedIn: 'root'
})
export class TaskService {
  constructor(private http: HttpClient) { }
  selectedTemplateData: NotificationTemplateVM
  selectedMail: NotificationVM
  selectedTask: TaskVM;
  file: AttachmentsVM
  selectedTaskComment: TaskCommentVM;
  getTasksList() {
    return this.http.get<TaskVM[]>('https://localhost:7100/api/Task/').pipe();
  }
  UpdateTask(task: TaskVM) {
    return this.http.put('https://localhost:7100/api/Task', task);
  }
  UpdateTemplate(tem: NotificationTemplateVM) {
    return this.http.put('https://localhost:7100/api/NotificationTemplate', tem);
  }
  getTaskbyId(id): Observable<TaskVM> {
    return this.http.get<TaskVM>('https://localhost:7100/api/Task/' + id).pipe();
  }
  GetTaskById(id): Observable<TaskVM> {
    return this.http.get<TaskVM>('https://localhost:7100/api/Task/' + id).pipe();
  }
  SearchTask(Task): Observable<TaskVM[]> {
    return this.http.post<TaskVM[]>('https://localhost:7100/api/Task/Search', Task).pipe();
  }
  SearchTemplate(tem): Observable<NotificationTemplateVM[]> {
    return this.http.post<NotificationTemplateVM[]>('https://localhost:7100/api/NotificationTemplate/Search', tem).pipe();
  }
  getEnumValues(type): Observable<EnumValueVM[]> {
    return this.http.get<EnumValueVM[]>('https://localhost:7100/api/EnumValues/' + type).pipe();
  }
  getTaskComments(id): Observable<TaskCommentVM[]> {
    return this.http.get<TaskCommentVM[]>('https://localhost:7100/api/TaskComment/' + id).pipe();
  }
  SaveTask(Task): Observable<TaskVM> {
    debugger;
    return this.http.post<TaskVM>('https://localhost:7100/api/Task', Task).pipe();
  }
  SaveTemplate(tem): Observable<NotificationTemplateVM> {
    return this.http.post<NotificationTemplateVM>('https://localhost:7100/api/NotificationTemplate', tem).pipe();
  }
  SendMail(Mail: NotificationVM) {
    return this.http.post('https://localhost:7100/api/Notification', Mail);
  }
  SaveTaskComment(Task: TaskCommentVM) {
    debugger
    return this.http.post('https://localhost:7100/api/TaskComment', Task);
  }
  deleteTasks(id) {
    return this.http.delete('https://localhost:7100/api/Task/' + id);
  }
  DeleteTemplate(id) {
    return this.http.delete('https://localhost:7100/api/NotificationTemplate/' + id);
  }
}
