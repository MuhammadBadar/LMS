export class ScheduleVM {
    id!: number
    userId: string
    user?: string
    roleId: string
    role?: string
    entityId: number = 0;
    entity?: string
    scheduleDays?: ScheduleDayVM[] = new Array();
    scheduleTypeId: number = 0;
    scheduleType?: string
    workingTypeId?: number = 0;
    workingType?: string
    workingHours?: string
    startDate?: Date
    endDate?: Date
    effectiveDate?:Date
    isActive?: boolean
  parentId: number | undefined
  enumTypeId: number | undefined
  dayIds: number[]=[] 
 
  
}
export class ScheduleDayVM {
  id!: number
  dayId: number = 0
  day?: string
   scheduleTypeId: number = 0;
  scheduleType?: string
  eventTypeId: number = 0
  eventType?: string
  locationId: number = 0
  location?: string
  isActive: boolean = true;
  dBoperation?: number;
  scheduleId?: number;
  editMode: boolean = false
  userId: string
  schDayEvents: string

}
