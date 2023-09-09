export class PermissionVM {
    id: number;
    feature:string;
    user:string;
    role:string;
    resource:string;
    isActive:boolean= true;
    userId: string;
    roleId:string;
    featureId: number;
    permissionValue:number;
    permission:string;
}