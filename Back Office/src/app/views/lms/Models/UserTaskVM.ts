export class UserTaskVM {
    id!: number
    userId?: string
    user?: string
    taskId :number = 0
    title?: string
    date? :  Date
    parent?: string
    claim?:string 
    comments?:string 
    reviewedBy?:string 
    reviewComments?:string 
    isActive?: boolean
	
}