import { EnumTypeVM } from './models/EnumTypeVM';
import { ItemVM } from './models/ItemVM';
import { CustomerVM } from './models/CustomerVm';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { EnumValueVM } from './models/EnumValueVM';
import { saleOrderLines, SaleOrderVM } from './models/SaleOrderVM';
@Injectable({
    providedIn: 'root'
  })
  export class ProcurementService{
Id:number;
line:saleOrderLines
selectedSaleOrder:SaleOrderVM
selectedCustomer:CustomerVM
selectedItem:ItemVM
constructor(private http: HttpClient) {

 }
 getCustomerList():Observable<CustomerVM[]>  {    
    return this.http.get<CustomerVM[]>('https://localhost:44329/api/Customer').pipe();    
  }
  GetCustomerById(id):Observable<CustomerVM>  {    
    return this.http.get<CustomerVM>('https://localhost:44329/api/Customer/'+ id).pipe();    
  }

  UpdateSaleOrder(so:SaleOrderVM){
    debugger
    return this.http.put('https://localhost:44329/api/SaleOrder',so);
  }
  DeleteCustomer(id)  {   
    return this.http.delete('https://localhost:44329/api/Customer/'+id);
  }
  DeleteItem(id)  {   
    return this.http.delete('https://localhost:44329/api/Item/'+id);
  }
  DeleteSaleOrder(id)  {   
    return this.http.delete('https://localhost:44329/api/SaleOrder/'+id);
  }
  GetSaleOrderList():Observable<SaleOrderVM[]>  {    
    return this.http.get<SaleOrderVM[]>('https://localhost:44329/api/SaleOrder').pipe();    
  }
  getItemList():Observable<ItemVM[]>  {    
    return this.http.get<ItemVM[]>('https://localhost:44329/api/Item').pipe();    
  }
  SearchItem(items):Observable<ItemVM[]>  {    
    return this.http.post<ItemVM[]>('https://localhost:44329/api/Item/Search',items).pipe();    
  }
  SaveCustomer(Cust:CustomerVM){
    return this.http.post('https://localhost:44329/api/Customer',Cust);
  }
  UpdateCustomer(Cust:CustomerVM){
    return this.http.put('https://localhost:44329/api/Customer',Cust);
  }
  UpdateItem(itm:ItemVM){
    return this.http.put('https://localhost:44329/api/Item',itm);
  }
  SaveItem(item:ItemVM){
    return this.http.post('https://localhost:44329/api/Item',item);
  }
  SaveSaleOrder(sale:SaleOrderVM){
    return this.http.post('https://localhost:44329/api/SaleOrder',sale);
  }
  GetEnumValues(type): Observable<EnumValueVM[]> {
    return this.http.get<EnumValueVM[]>('https://localhost:44329/api/EnumValues/'+type).pipe();
  }
  SearchItemByCode(code):Observable<ItemVM[]>  {    
    return this.http.get<ItemVM[]>('https://localhost:44329/api/Item/'+code).pipe();    
  }
  
  deleteSaleOrder(id) {
    return this.http.delete('https://localhost:44329/api/SaleOrder/'+id);
  }
  }