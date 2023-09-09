import { UserVM } from 'app/views/security/models/user-vm';
import { RoleVM } from './../../../models/role-vm';
import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { CalendarEvent } from 'angular-calendar';
import { EgretCalendarEvent } from 'app/shared/models/event.model';
import { SecurityService } from 'app/views/security/security.service';
import { UserRoleVM } from 'app/views/security/models/user-role-vm';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-create-user-role',
  templateUrl: './create-user-role.component.html',
  styleUrls: ['./create-user-role.component.css']
})
export class CreateUserRoleComponent implements OnInit {
Role:string[]=[];
  Action;

  msg:boolean=false;
  dataSource;
  displayedColumns ;
  Edit:boolean=false;
  del:boolean=false;
  Add:boolean=true;
  uRoleId:string;
  urole:UserRoleVM;
  user:UserVM[];
  role:RoleVM[];
  event: CalendarEvent;
  dialogTitle: string;
  action: string;
  constructor(
    public securityService: SecurityService,
    public dialogRef: MatDialogRef<CreateUserRoleComponent>,
    private fb: FormBuilder,
    private snack: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any,  
  )
   {
      this.dialogTitle = 'Assign Roles to User';
      this.event = new EgretCalendarEvent({
      });
      this.securityService.selectedUserRole= new UserRoleVM;
  }

  ngOnInit(): void {
    debugger
    this.securityService.getRolesList().subscribe((res: RoleVM[]) => {
      this.role = res;   
 
      });
      this.securityService.getUserList().subscribe((res: UserVM[]) => {
        this.user = res;   
   
        }); 

        this.uRoleId = this.data.uRoleId;
        this.Action=this.data.action
        if(this.Action=="Delete"){
          this.securityService.selectedUserRole.userId=this.uRoleId
          this.Add=false;
          this.Edit=false;
          this.del=true;
          this.GetUserRoleById(); 

        }
    else if (this.Action=="Edit"){
      this.securityService.selectedUserRole.userId=this.uRoleId
      this.Edit=true;
      this.Add=false;
      this.del=false;
      this.GetUserRoleById(); 
    }
  }

 Search(){
   debugger
   
  this.GetUserRoleById();
  
 }
  Delete(uRole){
    debugger;
    this.Role.push(uRole)
     this.securityService.selectedUserRole.role=this.Role
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        this.securityService.deleteuRole( this.securityService.selectedUserRole).subscribe((data)=>{

          Swal.fire(
            'Deleted!',
            'Role has been deleted.',
            'success'
          )
          this.GetUserRoleById();
       })   
      }
    })
  
    
  
  }
 SaveUserRoles(){
   debugger
  //  console.warn(this.securityService.selectedUserRole.userId);
  //  console.warn(this.securityService.selectedUserRole);
  //  console.warn(this.securityService.selectedUserRole.roles);
  if (this.uRoleId!=null){
    this.PutAssignRole();
    }else{
   //alert(this.securityService.selectedUserRole.role)
  this.securityService.SaveUserRoles(this.securityService.selectedUserRole).subscribe((data) => {
    this.snack.open('Assigned Role to User Successfully!', 'OK', { duration: 4000 })
 },
 (err:any)  => {
 alert('Error')
    
 });
 }
}
GetUserRoleById(){
  debugger
  // this.securityService.selectedUserRole.userId=this.uRoleId
  this.securityService.SearchUserRole(this.securityService.selectedUserRole.userId).subscribe((res: UserRoleVM) => {
    this.urole = res;
    this.dataSource=this.urole.role
    if(this.Action=="Delete"){
      if(this.urole.role.length!=0){
        this.displayedColumns = [ 'role','action'];
       
      }
      else {
        this.msg=true
      } 
  }
 
   
     this.securityService.selectedUserRole=this.urole
  });
 
}
PutAssignRole(){
  
  //this.securityService.selectedFeature=this.fetr[0]
 
   this.securityService.UpdateUserRole(this.securityService.selectedUserRole).subscribe((data) => {
     this.snack.open(' Successfully Updated!', 'OK', { duration: 4000 })
     

   },
     (err: any) => {
       this.snack.open('Error Occured!', 'OK', { duration: 4000 })
 
     });

 }
}
