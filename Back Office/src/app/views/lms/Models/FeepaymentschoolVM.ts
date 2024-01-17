export class FeeVM {
  id?: number;
  studentId?: number;
  student?: string;
  feeDate?: Date;
  branch?: string;
  branchId?: number;
  class?: string;
  classId?: number;
  section?: string;
  sectionId?: number;
  feeLines: FeeLineVM[];
  amount: number | null = null;
  netAmount: number | null = null;
  concession: number | null = null;
  isActive?: boolean;
}

export class FeeLineVM {
  id?: number;
  feeId?: number;
  feetypeId?: number;
  feeAmount: number | null = null;
  concession: number | null = null;
  isActive?: boolean;
}