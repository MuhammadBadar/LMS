import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, ActivatedRoute } from '@angular/router';

@Injectable()
export class AuthorizationCheck implements CanActivate {
   Info: any;
   constructor(private router: Router,
   ) {

   }

   canActivate(): boolean {
      debugger;
      console.log("Ahmad jilani");
      var token = localStorage.getItem('Token');
      if (token) {
         return true;
      }
      else {
         localStorage.clear();
         // alert("Please First Sign In to Get Access ")
         this.router.navigate(['/']);
         return true;
      }
   }
}