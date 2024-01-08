export class FeeVM {
    id?: number;
    studentId?: number;
    student?: string;    
    amount?: number;
    netAmount?:number;
    concession?: number;
    isActive?: boolean;
    feeLines: FeeLineVM[];
    classId?: number;
    sectionId?: number;
    branch?: string;
    branchId?: number;
    class?: string;
    section?: string;   
    
  }
  
  export class FeeLineVM {
    id?: number;
    feeId?: number;
    feetypeId?: number;
    feeAmount?: number;
    concession?: number;
    isActive?: boolean;
  }
  