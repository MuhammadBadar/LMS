export class UserVM {
    id?: string;
    userName?: string;
    name?: string;
    isActive: boolean = true;
    passwordHash?: string;
    userPassword?: string;
    firstName?: string;
    lastName?: string;
    email?: string;
    employeeId?: number = 0;
    phoneNumber?: string;
    userPhone?: string;
    directSupervisorId?: string;
    role?: string;

    fatherName?: string;
    cnic?: string
    designation?: string
    msCardNo?: string;
    address?: string;
    discountLimit?: number
    branchId?: number = 0
    branch?: string
}

