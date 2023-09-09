
import { LoginVM } from './models/LoginVM';
import { EnumValueVM } from './models/EnumValueVM';
import { catchError, map } from 'rxjs/operators';
import { HttpClient, HttpEvent, HttpHandler, HttpHeaders, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { RoleVM } from './models/role-vm';
import { PermissionVM } from './models/permission-vm';
import { UserVM } from './models/user-vm';
import { FeatureVM } from './models/feature-vm';
import { EnumTypeVM } from './models/EnumTypeVM';
import { UserRoleVM } from './models/user-role-vm';
import { Observable } from 'rxjs';
import { mapTo } from 'rxjs/operators';
import { connectableObservableDescriptor } from 'rxjs/internal/observable/ConnectableObservable';
import { CanActivate, Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { $ } from 'protractor';

@Injectable({
  providedIn: 'root'
})
export class SecurityService {

  login:LoginVM;
  selectedUser: UserVM;
  selectedRole: RoleVM;
  selectedFeature: FeatureVM;
  selectedUserRole: UserRoleVM;
  selectedpermission: PermissionVM;
  constructor(private http: HttpClient
    ) { }
  

//   interceptor(
//     request: HttpRequest<unknown>,
//     next: HttpHandler
//     ): Observable<HttpEvent<unknown>>{
//      request=request.clone({
//      headers:request.headers.set('authorization',localStorage.getItem('token')),
// });
//return next.handle(request);
  //}
  SearchUserRole(id): Observable<UserRoleVM> {
    return this.http.get<UserRoleVM>('https://localhost:7100/api/UserRole/'+ id).pipe();
  }

  SaveUserRoles(URole) {
    return this.http.post('https://localhost:7100/api/UserRole', URole);
  }
  deleteuRole(info) {
    debugger
    return this.http.post('https://localhost:7100/api/UserRole/Delete', info);
  }
  DeleteUser(id) {
    return this.http.delete('https://localhost:7100/api/User?id=' + id);
  }
  Login(User:LoginVM) {
    return this.http.post('https://localhost:7100/api/Account', User).pipe();
  }
  GetEnumValues(type): Observable<EnumValueVM[]> {
    return this.http.get<EnumValueVM[]>('https://localhost:7100/api/EnumValues/'+type).pipe();
  }
  GetFeatureById(id):Observable<FeatureVM[]>  {    
    return this.http.get<FeatureVM[]>('https://localhost:7100/api/Feature/'+ id).pipe();    
  }
  SearchUser(search): Observable<UserVM> {
    return this.http.post<UserVM>('https://localhost:7100/api/User/id',search).pipe();
  }
  SearchUserByName(search): Observable<UserVM> {
    return this.http.post<UserVM>('https://localhost:7100/api/User/name',search).pipe();
  }
  SearchRole(search): Observable<RoleVM> {
    return this.http.post<RoleVM>('https://localhost:7100/api/Role/id', search).pipe();
  }
  
  SearchFeature(search): Observable<FeatureVM[]> {
    return this.http.post<FeatureVM[]>('https://localhost:7100/api/Feature/Search', search).pipe();
  }
  SearchPermission(search): Observable<PermissionVM[]> {
    return this.http.post<PermissionVM[]>('https://localhost:7100/api/Permissions/Search', search).pipe();
  }
  UpdateUser(values: UserVM) {
    return this.http.put('https://localhost:7100/api/User', values);
  }
  UpdateRole(values: RoleVM) {
    return this.http.put('https://localhost:7100/api/Role', values);
  }
  UpdateUserRole(values: UserRoleVM) {
    return this.http.put('https://localhost:7100/api/UserRole', values);
  }
  UpdateFeature(values: FeatureVM) {
    return this.http.put('https://localhost:7100/api/Feature', values);
  }
  UpdatePermission(values: PermissionVM) {
    return this.http.put('https://localhost:7100/api/Permissions', values);
  }
  getRolesList() {
    //return this.http.get('/api/invoices/');
    return this.http.get<RoleVM[]>('https://localhost:7100/api/Role').pipe();
  }
  getUserList(){
    
debugger
//    let userInfo=localStorage.getItem('token');
//     const headers=new HttpHeaders({
// 'Authorization':`Bearer ${userInfo }`
//     });
  //return this.http.get<UserVM[]>('https://localhost:7100/api/User',{headers:headers} ).pipe();
  return this.http.get<UserVM[]>('https://localhost:7100/api/User').pipe();
  }
  getPermissionList() {
    return this.http.get<PermissionVM[]>('https://localhost:7100/api/Permissions').pipe();
  }
  getFeatureList() {
    return this.http.get<FeatureVM[]>('https://localhost:7100/api/Feature').pipe();
  }
  getUserRoleList() {
    //return this.http.get('/api/invoices/');
    debugger;
    return this.http.get<UserRoleVM[]>('https://localhost:7100/api/UserRole').pipe();
  }
  SaveUser(User) {
    return this.http.post('https://localhost:7100/api/User', User);
  }
  debugger;

  SaveRole(Role) {
    return this.http.post('https://localhost:7100/api/Role', Role);
  }
  SaveFeature(feature) {
    return this.http.post('https://localhost:7100/api/Feature', feature);
  }
  SavePermissions(permission) {
    
    return this.http.post('https://localhost:7100/api/Permissions', permission);
  }
  getHttpOptions(){
    const httpOptions = {
      headers:new HttpHeaders({
        Authorization: 'Bearer ' + localStorage.getItem('token')     
    }),
    };
      return httpOptions;

    }
}

