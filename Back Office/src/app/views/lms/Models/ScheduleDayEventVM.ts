export class ScheduleDayEventVM {
    id!: number    
    schId?: number;
    schDayId: number
    day?: string
    scheduleTypeId: number = 0;
    scheduleType?: string        
    startTime?: Date
    endTime?: Date
    locationId: number = 0
    location?: string
    eventTypeId: number = 0
    eventType?: string
    isActive?: boolean
    // parentId: number | undefined
    // enumTypeId: number | undefined
    
 
  
}
