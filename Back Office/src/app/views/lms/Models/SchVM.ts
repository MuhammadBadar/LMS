export class SchVM {
  id!: number  
  userId?: string
  user?: string
  roleId: string
  role?: string
  effectivDate? :  Date  
  SchLine?: SchlineVM[] = new Array();
  scheduleTypeId: number = 0;
  scheduleType?: string
isActive: boolean
}
export class SchlineVM {
startTime?: string
endTime?: string
dayIds: number[]=[] 
dayId: number 
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

}