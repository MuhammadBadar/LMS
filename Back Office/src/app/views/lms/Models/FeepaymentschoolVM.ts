export class FeeVM {
    id?: number;
    studentId?: number;
    student?: string;    
    amount?: number;
    concession?: number;
    isActive?: boolean;
    feeLines: FeeLineVM[];
    // feetypeschoolId?: number;
    // classId?: number;
    // sectionId?: number;
    // branch?: string;
    // branchId?: number;
    // class?: string;
    // section?: string;
    // feetype?: string;
  }
  
  export class FeeLineVM {
    id?: number;
    feeId?: number;
    feetypeId?: number;
    feeAmount?: number;
    concession?: number;
    isActive?: boolean;
  }
  