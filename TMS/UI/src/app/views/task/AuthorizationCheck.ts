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
   var token = localStorage.getItem('TMStoken');
   if(token){
      return true;
   }
   else
   {
       alert("Please First Sign In ")
      this.router.navigate(['/task/login']);
      return true;
   }
}
}