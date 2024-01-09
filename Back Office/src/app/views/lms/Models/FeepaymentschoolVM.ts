export class FeeVM {
  id?: number;
  studentId?: number;
  student?: string;
  amount: number | null = null;
  netAmount: number | null = null;
  concession: number | null = null;
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
  feeAmount: number | null = null;
  concession: number | null = null;
  isActive?: boolean;
}