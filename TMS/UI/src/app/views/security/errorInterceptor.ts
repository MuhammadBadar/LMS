import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor } from '@angular/common/http';
import { Observable } from 'rxjs/Rx';
import { catchError } from 'rxjs/operators';
import { SecurityService } from './security.service';
import { Router } from '@angular/router';
import { LoginComponent } from './login/login.component';

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {
 constructor(private LoginComponent: LoginComponent, private router: Router) { }

 intercept(request: HttpRequest<any>, newRequest: HttpHandler): Observable<HttpEvent<any>> {

 return newRequest.handle(request).pipe(catchError(err =>{
 if (err.status === 401) {
 //if 401 response returned from api, logout from application & redirect to login page.
 this.LoginComponent.Logout();
 }

 const error = err.error.message || err.statusText;
 return Observable.throw(error);
 }));
 }
}