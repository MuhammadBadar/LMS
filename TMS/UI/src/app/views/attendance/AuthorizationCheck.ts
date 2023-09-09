import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, ActivatedRoute } from '@angular/router';

@Injectable()
export class AuthorizationCheck implements CanActivate {
Info;
 constructor(private router: Router,
  ) {
      
    }

 canActivate(): boolean  
 {
   var token = localStorage.getItem('AMStoken');
   if(token){
      return true;
   }
   else
   {
       alert("Please First Sign In to Get Access ")
      this.router.navigate(['/attendance/login']);
      return true;
   }
}
}