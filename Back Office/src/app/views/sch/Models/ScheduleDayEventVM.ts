export class ScheduleDayEventVM {
    id!: number    
    schId?: number;
    scheduleDayId: number
    day?: string
    scheduleTypeId: number = 0;
    scheduleType?: string        
    startTime?: string
    endTime?: string
    locationId: number = 0
    location?: string
    eventTypeId: number = 0
    eventType?: string
    isActive?: boolean
    // parentId: number | undefined
    // enumTypeId: number | undefined
    
 
  
}
