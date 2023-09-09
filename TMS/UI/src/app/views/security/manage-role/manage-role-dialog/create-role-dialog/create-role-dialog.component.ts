import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup, NgForm } from '@angular/forms';
import { CalendarEvent } from 'angular-calendar';
import { EgretCalendarEvent } from 'app/shared/models/event.model'; 
import { SecurityService } from 'app/views/security/security.service';
import { RoleVM } from 'app/views/security/models/role-vm';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-create-role-dialog',
  templateUrl: './create-role-dialog.component.html',
  styleUrls: ['./create-role-dialog.component.css']
})
export class CreateRoleDialogComponent implements OnInit {
  @ViewChild('roleForm', { static: true }) roleForm: NgForm;
  messagebox:boolean=false;
  message;
  Edit:boolean=false;
  Add:boolean=true;
  RoleId:string= null;
  event: CalendarEvent;
  dialogTitle: string;
  roles: RoleVM[];
  role:RoleVM;
  // eventForm=new FormGroup({
  //   responsibility:new FormControl(''),
  //   name:new FormControl('')
  // })
  action: string;
  constructor(
   
    public securityService: SecurityService,
    public dialogRef: MatDialogRef<CreateRoleDialogComponent>,
    private formBuilder: FormBuilder,
    private snack: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any,
  ) {
      this.dialogTitle = 'Add Role';
      this.event = new EgretCalendarEvent({
      });
   // this.eventForm = this.buildEventForm(this.event);
   this.securityService.selectedRole= new RoleVM;
  }

  ngOnInit() {
    this.RoleId = this.data.roleId;
  
    if (this.RoleId!= null){
      this.Edit=true;
      this.Add=false;
      this.GetRoleById(); 
    }
  }

  // buildEventForm(event: EgretCalendarEvent) {
  //   return new FormGroup({
  //     name: new FormControl(event.name),
  //     responsibility: new FormControl(event.responsibility),
  //     meta: this.formBuilder.group({
  //       responsibility: new FormControl(event.meta.responsibility)
  //     })
  //   });
  // }
  SaveRole(){
    debugger
    if (this.RoleId!= null){
      this.PutRole();
      }else{
   var my= this.securityService.SaveRole(this.securityService.selectedRole).subscribe((data:any) => {
    // console.warn(data)
     if(data.succeeded==true){
       this.messagebox=false;
       Swal.fire({
        icon:'success',
        position:  'center' ,
        title: this.securityService.selectedRole.name ,
        text:'Successfully added into Roles ',
        background: "#FFFFFF",
        confirmButtonColor: "#000000"
     
    
      })
     this.roleForm.reset();}
     else{
       this.messagebox=true;
       this.message=data.errors
       console.warn(data)
     }
   },
   (err: any) => {
    if(err.status==0){
     Swal.fire({
       icon: 'error',
       title: 'Oops...',
       text: 'Something went wrong!',
       footer: 'Please check your Internet Connection'
     })}
     else{
       Swal.fire({
         icon: 'error',
         title: 'Oops...',
         text: 'Something went wrong!',
       })} 

   });
 }
}
GetRoleById(){
  debugger
  this.securityService.selectedRole.id=this.RoleId
  this.securityService.SearchRole(this.securityService.selectedRole).subscribe((res: RoleVM) => {
    if(res)
    this.role = res;
    console.warn(res)
    console.warn(this.role)
     this.securityService.selectedRole=this.role
  });
 
}
PutRole(){
  
 
   this.securityService.UpdateRole(this.securityService.selectedRole).subscribe((data:any) => {
    // console.warn(data)
     if(data.succeeded==true){
       this.messagebox=false;
    // this.snack.open('Role Successfully Updated!', 'OK', { duration: 4000 })
    Swal.fire({
      icon:'success',
      position:  'center' ,
      text:'Role Successfully Updated',
      background: "#FFFFFF",
      confirmButtonColor: "#000000"
   
  
    })
     }
     else{
       this.messagebox=true;
       this.message=data.errors
   
     }
   },
   (err: any) => {
    if(err.status==0){
     Swal.fire({
       icon: 'error',
       title: 'Oops...',
       text: 'Something went wrong!',
       footer: 'Please check your Internet Connection'
     })}
     else{
       Swal.fire({
         icon: 'error',
         title: 'Oops...',
         text: 'Something went wrong!',
       })} 

   });
 
 }
}
