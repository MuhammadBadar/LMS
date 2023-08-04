export class CourseScheduleVM {
    id!: number
    courseId: number = 0
    description?: string
    logoBase64Path?: string
    orientationClass?: Date
    startDate?: Date
    classTimings?: ClassTimingVM[] = new Array();
    course?: string
    isActive?:boolean
}
export class ClassTimingVM {
    id!: number
    weekDayId: number = 0
    timeFrom?: string
    timeTo?: string
    isActive: boolean = true;
    dBoperation?: number;
    schId?: number;
    editMode: boolean = false
    weekDay?: string
}