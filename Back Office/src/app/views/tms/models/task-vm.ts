export class TaskVM {
    directSupervisorEmail:string;
    directSupervisorId:string;
    directSupervisorName:string;
    directSupervisorPhoneNumber:string;
    userPhoneNumber:string;
    userMail:string;
    id: number;
    user:string;
    module:string;
    status:string;
    priority:string;
    priorityId:number= 1011001;
    title: string;
    sp: number;
    description: string;
    isActive: boolean = true;
    createdById: number =0
    createdOn: Date=new Date()
    modifiedById: number
    modifiedOn: Date=new Date()
    userId: string; 
    moduleId: number= 0
    statusId: number= 1010001
    freeSearch: string
    attachments?:AttachmentsVM[]= new Array()
    hasErrors: boolean
  
}
export class AttachmentsVM {
   // time:string;
    id: number;
    dBoperation:number;
    taskId:number;
    docPath: string;
    name:string;
    base64File:Text;
    size:string;
    isActive: boolean = true;
    createdById: number =0
    createdOn: Date=new Date()
    modifiedById: number
    modifiedOn: Date=new Date()
    // createdOn: Date=new Date()


}
