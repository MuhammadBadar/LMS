import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, ActivatedRoute } from '@angular/router';

@Injectable()
export class AuthorizationCheck implements CanActivate {
Info:any;
 constructor(private router: Router,
  ) {
      
    }

 canActivate(): boolean  
 {
   var token = localStorage.getItem('token');
   if(token){
      return true;
   }
   else
   {
       alert("Please First Sign In to Get Access ")
      this.router.navigate(['/security/userlogin']);
      return true;
   }
}
}