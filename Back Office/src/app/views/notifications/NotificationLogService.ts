import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from 'rxjs';
import { NotificationLogVM } from "./NotificationLogVM";

@Injectable({
  providedIn: 'root'
})
export class NotificationLogService {
  constructor(private http: HttpClient) { }
  notification: NotificationLogVM

  getNextNotificationLog() {
    return this.http.get<NotificationLogVM[]>('https://localhost:6100/api/NotificationLog/').pipe();
  }
  updateNotificationLog(nLog: NotificationLogVM) {
    return this.http.put('https://localhost:7100/api/NotificationLog', nLog);
  }
  // https://localhost:6100/api/
 
  SearchNotificationLog(nLog): Observable<NotificationLogVM[]> {
    return this.http.post<NotificationLogVM[]>('https://localhost:6100/api/NotificationLog/Search', nLog).pipe();
  }
 
  SaveNotificationLog(nLog): Observable<NotificationLogVM> {
    return this.http.post<NotificationLogVM>('https://localhost:6100/api/NotificationLog', nLog).pipe();
  }
 
  deleteNotificationLog(id) {
    return this.http.delete('https://localhost:6100/api/NotificationLog/' + id);
  }
 
}
