export class StudentVM {
    id!: number
    cityId: number= 0
    city?: string
    topicId: number= 0
    topic?: string
    name?: string
    email?: string
    isActive?: boolean
  parentId: number | undefined
  enumTypeId: number | undefined
}
