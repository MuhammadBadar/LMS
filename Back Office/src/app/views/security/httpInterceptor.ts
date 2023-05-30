import { SecurityService } from './security.service';
import { AuthorizationCheck } from './AuthorizationCheck';
import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Router } from '@angular/router';

@Injectable()
export class httpInterceptor implements HttpInterceptor {
    constructor(private router:Router, 
     private scrtySvc:SecurityService ) { }
    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> 
    {
        debugger
        var token= localStorage.getItem('token')
    //var token = this.jwtAuth.token || this.jwtAuth.getJwtToken();

    var changedReq;

    if (token) {

      changedReq = req.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`
        },
      });

    }else {

      changedReq = req;
      
    }
       
        return next.handle(changedReq).pipe(
          catchError((error: HttpErrorResponse)=>{
            let errorMsg = '';
            let data = {};
            if(error.error instanceof ErrorEvent)
            {
              console.log("This is client side error");
              errorMsg = `Error: ${error.error.message}`;
            }
            else
            {       
              switch(error.status)
              {
                case 401:
                  alert(error.status);
                  debugger
                  data = 
                  {
                    status:error.status
                  }
                  this.router.navigate(['/security/userlogin']);
                  break;
                case 403:
                    alert(error.status);
                  this.router.navigate(['/security/userlogin']);
                  break;
                case 404:
                  
                  alert(error.status);
                  this.router.navigate(['/security/userlogin']); 
                  break; 
              }
              console.log('this is server side error');
              errorMsg = `Error Code: ${error.status},  Message: ${error.message}`;
            }
            console.log(errorMsg);
            return throwError(errorMsg);
          })
        )
    }
  }