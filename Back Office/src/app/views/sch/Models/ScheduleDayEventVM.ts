export class ScheduleDayEventVM {
    id!: number    
    schId?: number;
    SchDayId: number
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
    minEndTime: string;
    // parentId: number | undefined
    // enumTypeId: number | undefined
    
 
  
}
