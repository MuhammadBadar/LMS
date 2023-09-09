export class TaskCommentVM {    
    taskId: number
    taskTitle: string
    user: string
    userId: string
    comment: string
    datetime: Date=new Date()
    time: Date=new Date()
    id: number
    isActive: boolean = true;
    createdById: number =0
    createdOn: Date=new Date()
    modifiedById: number
    modifiedOn: Date=new Date()
}