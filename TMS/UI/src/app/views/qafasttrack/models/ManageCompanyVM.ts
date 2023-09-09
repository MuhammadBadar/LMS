export class ManageCompanyVM{
id:number;
cityId:number;
countryId:number;
provinceId:number;
name:string;
contactPerson:string;
addressLine1:string;
addressLine2:string;
cell:string;
whatsApp:string;
telePhone:string;
isActive:boolean=true;
createdById: number ;
createdOn: Date=new Date()
modifiedById: number
modifiedOn: Date=new Date()
}