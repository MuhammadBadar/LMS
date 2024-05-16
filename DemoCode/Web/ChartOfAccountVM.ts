import { BaseDomainVM } from "../../catalog/Models/BaseDomainVM"

export class ChartOfAccountVM extends BaseDomainVM {
    coaLevelId: number = 0
    parentCoaId: number = 0
    coaTypeId: number
    coaCode: string
    keyCode: string
    parentCoaCode: string;
    coaDesc: string
    coaType: string
    coaLevel: string
    parentCoaDesc: string
}