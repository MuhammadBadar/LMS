export class InquiryVM{
    id:number
    name:string;
    cell:string;
    comments:string;
    isActive=true;
    servicesId: number;
    serviceName:string;
    email;
    content:string;
    ifData?:InquiryFieldDataVM[]= new Array();
}
export class InquiryFieldDataVM{
    id:number;
    inquiryId: number;
    fieldName:string;
    fieldValue?:string;
    isActive:boolean= true
    dBoperation;
  }