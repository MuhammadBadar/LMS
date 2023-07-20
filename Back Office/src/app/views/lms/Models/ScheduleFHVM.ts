export class ScheduleFHVM {
    id!: number
    userId: number= 0
    user?: string
    roleId: number= 0
    //topic?: string
    scheduleType?: string
    workingFor?: string
    workingHours?: string
    isActive?: boolean
  parentId: number | undefined
  enumTypeId: number | undefined
}
