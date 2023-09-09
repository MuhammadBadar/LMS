import { ItemVM } from "./ItemVM";

export class saleOrderLines{
    id: number
    itemName:string
    itemCode:number;
    qty:number;
    price:number;
    lineTotal:number;
     uom:string;
     uomId:number;
    isActive:boolean=true;
    dBoperation:number;
    saleOrderId:number;
}
export class SaleOrderVM{
    
    clientSoNo: number;
    reference: number;
    paymentTerm: string;
    paymentMethod: string;
    statusId: number;
    description: string;
    date
    id:number;
    customerId?:number;
    customerName? :string;
    balance?:number;
    total?:number;
    discount?:number;
    netPayable?:number;
    isActive:boolean=true;
    price:number;
    lineTotal:number;
    uom:string;
    uomId:number;
    createdById: number =0
    createdOn: Date=new Date()
    modifiedById: number
    modifiedOn: Date=new Date()
    saleOrderLines?:saleOrderLines[]= new Array();
    itemList?:ItemVM[]= new Array();
    isEdit=false;
    isView=false;
   constructor(){
      // this.saleOrderLines=new [saleOrderLines]
   }
}
  