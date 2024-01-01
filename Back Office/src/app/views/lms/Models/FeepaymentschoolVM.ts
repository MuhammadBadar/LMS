export class FeeVM {
    id?: number;
    studentId?: number;
    student?: string;    
    feetypeschoolId?: number;
    classId?: number;
    sectionId?: number;
    branch?: string;
    branchId?: number;
    class?: string;
    amount?: number;
    concession?: string;
    section?: string;
    feetype?: string;
    isActive?: boolean;
    feeLines: FeeLineVM[];
  }
  
  export class FeeLineVM {
    id?: number;
    feeId?: number;
    feetypeId?: number;
    feeAmount?: number;
    concession?: string;
    isActive?: boolean;
  }
  