
import { filter } from 'rxjs/operators';
import { FeatureVM } from './../../../models/feature-vm';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup, NgForm } from '@angular/forms';
import { CalendarEvent } from 'angular-calendar';
import { EgretCalendarEvent } from 'app/shared/models/event.model';
import { SecurityService } from 'app/views/security/security.service';
import { PermissionVM } from 'app/views/security/models/permission-vm';
import { RoleVM } from 'app/views/security/models/role-vm';
import { UserVM } from 'app/views/security/models/user-vm';
import { MatSnackBar } from '@angular/material/snack-bar';
import { EnumValueVM } from 'app/views/security/models/EnumValueVM';
import { EnumTypeVM } from 'app/views/security/models/EnumTypeVM';
import { MatRadioChange } from '@angular/material/radio';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-create-permission-dialog',
  templateUrl: './create-permission-dialog.component.html',
  styleUrls: ['./create-permission-dialog.component.css']
})
export class CreatePermissionDialogComponent implements OnInit {
  @ViewChild('perForm', { static: true }) perForm: NgForm;
  isLoading = false;
  array :[];
  Edit: boolean = false;
  Add: boolean = true;
  EditMsg: boolean = false;
  AddMsg: boolean = false;
  permId: number=null;
  user: UserVM[];
  role: RoleVM[];
  permns: PermissionVM[];
  permissions: EnumValueVM[];

  perms: PermissionVM[];
  feature: FeatureVM[];
  
  dialogTitle: string='Manage Permissions';
  action: string;
  dataSource;
  displayedColumns = ['feature', 'deny', 'readonly', 'fullaccess'];
  constructor(
    //public dialogRef: MatDialogRef<CreatePermissionDialogComponent>,
    public securityService: SecurityService,
    private formBuilder: FormBuilder,
    private snack: MatSnackBar,
   // @Inject(MAT_DIALOG_DATA) public data: any,
  ) {
   
   
    this.securityService.selectedpermission = new PermissionVM;
  }

  ngOnInit(): void {
    debugger
    
    this.securityService.selectedpermission.userId="select";
    this.securityService.selectedpermission.roleId="select";
    this.GetEnumValues(EnumTypeVM.Permissions);

    // this.securityService.getPermissionList().subscribe((res: PermissionVM[]) => {
    //   this.permns = res; 
    // });
    this.securityService.getRolesList().subscribe((res: RoleVM[]) => {
      this.role = res;
 
    });
    this.securityService.getUserList().subscribe((res: UserVM[]) => {
      this.user = res;
 
    });
    this.securityService.getFeatureList().subscribe((res: FeatureVM[]) => {
      this.feature = res;
      this.dataSource = res;
     
    });
    //console.warn(this.data)
    // this.permId = this.data.permId;
    // if (this.permId > 0) {
    //   this.Edit = true;
    //   this.Add = false;
    //   this.GetPermissionById();

    // }
    debugger

  }
  SearchPermsByRole(){
    this.securityService.selectedpermission.userId="select"
    this.Permissions();
  }
  SearchPermsByUser(){
    this.securityService.selectedpermission.roleId="select"
    this.Permissions();
  }
  Reset(){
    this.Add=true;
    this.Edit=false;
    this.ngOnInit();
    // this.securityService.selectedpermission.userId="select";
    // this.securityService.selectedpermission.roleId="select"; 
    // this.dataSource=this.feature;
   
  }
  Permissions(){
    debugger
if(this.securityService.selectedpermission.roleId=="select"){
this.securityService.selectedpermission.roleId=undefined}
this.securityService.selectedpermission.featureId=undefined
this.securityService.selectedpermission.id=undefined
this.securityService.selectedpermission.permissionValue=undefined
if(this.securityService.selectedpermission.userId=="select"){
  this.securityService.selectedpermission.userId=undefined}
  this.securityService.selectedpermission.role="Admin"
    this.securityService.SearchPermission(this.securityService.selectedpermission).subscribe((res: PermissionVM[]) => {
      this.permns = res;
      if(this.permns.length!=0)
      {
     
        //this.securityService.selectedpermission=this.perms[0]
        this.Edit=true
        this.Add=false;
        
        this.dataSource=this.permns;
       
      }
      else if(this.permns.length==0)
      {

        this.dataSource= this.feature ;
        this.Add=true
        this.Edit=false
 
      };
      if(this.securityService.selectedpermission.userId!=undefined)
      this.securityService.selectedpermission.roleId="select";
      else
      this.securityService.selectedpermission.userId="select";
      console.warn(this.feature )
      console.warn(this.dataSource)
      console.warn(this.permns)
    });
  }
  GetEnumValues(etype: EnumTypeVM) {
    this.securityService.GetEnumValues(etype).subscribe((res: EnumValueVM[]) => {
      if (etype == EnumTypeVM.Permissions)
        this.permissions = res;
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  radioChange(event: MatRadioChange, data) {
    debugger

    
   
      var obj = this.dataSource.filter(x => x.id == data)[0]
    
    obj.permissionValue = event.value;
    this.dataSource.some(x => x.id == data)
    if (!this.dataSource.some(x => x.id == data)) 
    {
      this.dataSource.push(obj);
    }
  }
  SavePermissions(i): Promise<void> {
    return new Promise((resolve) => {
      setTimeout(async () => {
    
          if(this.securityService.selectedpermission.roleId=="select")this.securityService.selectedpermission.roleId=null
          if(this.securityService.selectedpermission.userId=="select")this.securityService.selectedpermission.userId=null
         
             if (this.Edit==true) {
               this.PutPermission(i);
             } else {
                  
            
               this.securityService.SavePermissions(this.securityService.selectedpermission).subscribe((data: any) => {
                   if (data == true ) {
                    this.isLoading = true;
                   // this.AddMsg=true;
                    debugger
                      if(i==this.feature.length-1){
                        Swal.fire({
                          icon:'success',
                          position:  'center' ,
                          text:'Permissions Successfully Added',
                          confirmButtonColor: "#000000"
                        })
                    // this.snack.open('Permission Successfully  Added!', 'OK', { duration: 7000 })
                    this.Reset()
                    this.isLoading = false;
                   // this.AddMsg=false;
                  
                    console.warn(this.securityService.selectedpermission)
                      }
                   }
                   else {
                    if(i==this.permns.length-1){
                    Swal.fire({
                      icon: 'error',
                      title: 'Oops...',
                      text: 'Something went wrong!',
                    })
                   }}
                 },
                 (err: any) => {
                  if(i==this.permns.length-1){
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
                    }
                 });
                  
                 
               };          
        // }
       
        resolve();
      }, 2000);
    });
  }
 
  async  fun(): Promise<void> {
   
    for (let i = 0; i < this.dataSource.length; i++) {
      const element = this.dataSource[i];
      if(this.Edit==true){
        this.securityService.selectedpermission.id =  element.id    
      this.securityService.selectedpermission.featureId = element.featureId
      }
      else{
         
      this.securityService.selectedpermission.featureId = element.id}
      if(element.permissionValue==undefined)
      {this.securityService.selectedpermission.permissionValue=1000001}
      else{
      this.securityService.selectedpermission.permissionValue = element.permissionValue}
      await this.SavePermissions(i) 
    }
  }
  GetPermissionById() {
    debugger
    console.warn(this.dataSource)
    this.securityService.selectedpermission.id = this.permId
    this.securityService.SearchPermission(this.securityService.selectedpermission).subscribe((res: PermissionVM[]) => {
      this.perms = res;
      this.securityService.selectedpermission = this.perms[0]

     var itm = this.feature.filter(i => i.id == this.securityService.selectedpermission.featureId);
     console.warn(itm);
     console.warn(this.perms[0].permissionValue)
      // console.warn(output)
      // // this.output[0]
        this.dataSource = itm
      //  console.warn(this.dataSource)
      // this.dataSource=this.perms
    });

  }
  PutPermission(i) {
  
    this.securityService.selectedpermission.feature=null;

    this.securityService.UpdatePermission(this.securityService.selectedpermission).subscribe((data: any) => {
      if (data == true) {
        this.isLoading = true;
       // this.EditMsg=true;
        if(i==this.permns.length-1){
          Swal.fire({
            icon:'success',
            position:  'center' ,
            text:'Permissions Successfully Updated',
            confirmButtonColor: "#000000"       
          })
          this.isLoading = false;
        //this.EditMsg=false;
      //  this.Reset()
    console.warn(this.permns)
    console.warn(this.securityService.selectedpermission)
      }
      }
      else {
        if(i==this.permns.length-1){
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Something went wrong!',
        })
       }}
     },
     (err: any) => {
      if(i==this.permns.length-1){
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
        }
     });

  }
 
}

