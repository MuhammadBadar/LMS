export class FieldVM{
    id:number;
    type:string;
    typeId:number;
    title:string;
    isActive=true;
    isRequired:boolean;
    value?:any
    fpv?:FieldPossibleValuesVM[]= new Array();
}
export class FieldPossibleValuesVM{
    fieldId:number;
    fieldValue:string;
    id:number;
    isActive= true;
    type:string;
    typeId:number;
    fieldName:string;}