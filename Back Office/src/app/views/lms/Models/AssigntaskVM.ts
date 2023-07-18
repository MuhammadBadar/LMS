export class AssignTaskVM{
    id!:number
    lectureId: number = 0
    studentId!: number
    topicId: number = 0
    courseId: number = 0
    Course?:string
    Topic?: string
    Lecture?:string
    Student?:string
    isActive: boolean = true;
}