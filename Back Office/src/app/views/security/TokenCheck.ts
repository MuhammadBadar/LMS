// import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, ActivatedRoute } from '@angular/router';
import { CatalogService } from '../catalog/catalog.service';
import { Injectable } from '@angular/core';
@Injectable()
export class TokenCheck implements CanActivate {
    Info: any;
    constructor(private router: Router,
        
        private catSvc: CatalogService
    ) {

    }

    canActivate(): boolean {
        debugger;
        var token = localStorage.getItem('Token');
        if (token) {
            // this.catSvc.CheckandSet()
            this.router.navigate(['/catalog/manageSetting'], { queryParams: { data: "QamSoft Technologies" } });
            return true;
        }
        else {
            //alert("Please First Sign In to Get Access ")
            this.router.navigate(['/secLogin']);
            return true;
        }
    }
}