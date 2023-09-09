import { FeatureVM } from './../../../models/feature-vm';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormControl, FormGroup, NgForm } from '@angular/forms';
import { CalendarEvent } from 'angular-calendar';
import { EgretCalendarEvent } from 'app/shared/models/event.model';
import { SecurityService } from 'app/views/security/security.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-create-feature-dialog',
  templateUrl: './create-feature-dialog.component.html',
  styleUrls: ['./create-feature-dialog.component.css']
})
export class CreateFeatureDialogComponent implements OnInit {
  @ViewChild('featureForm', { static: true }) featureForm: NgForm;
  Error:boolean=false;
  Edit:boolean=false;
  Add:boolean=true;
  FeatureId:number;
  event: CalendarEvent;
  dialogTitle: string;
  action: string;
  fetr:FeatureVM[];
  feature:FeatureVM;
  constructor(
    public dialogRef: MatDialogRef<CreateFeatureDialogComponent>,
    private formBuilder: FormBuilder,
    public securityService: SecurityService,
    private snack: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any,
  ) {
      this.dialogTitle = 'Add Feature';
      this.event = new EgretCalendarEvent({
      });
    //this.eventForm = this.buildEventForm(this.event);
    this.securityService.selectedFeature = new FeatureVM();
  }

  ngOnInit() {
    this.securityService.getFeatureList().subscribe((res: FeatureVM[]) => {
      this.fetr = res;
    });
    this.FeatureId = this.data.fetrId;
  console.warn(this.FeatureId)
    if (this.FeatureId>0){
      this.Edit=true;
      this.Add=false;
      this.GetFeatureById(); 
    }
  }
  SearchFeature(){
    this.Error=false
    if(this.Edit==false){
   
    var find=this.fetr.find(x=>x.name==this.securityService.selectedFeature.name)
    if(find!=null){
      this.Error=true
    }
    else if(find==null){
      this.Error=false
    }
  }
  }
  SaveFeature() {
    debugger
   
    const find = this.fetr.find(x => x.name == this.securityService.selectedFeature.name)
  
      if (this.FeatureId > 0) {
        this.PutFeature();
      } else {
        if (find == undefined) {
        //alert(this.securityService.selectedFeature.description)
        this.securityService.SaveFeature(this.securityService.selectedFeature).subscribe((data:any) => {
           console.warn(data)
           if(data==true){
             
            Swal.fire({
              icon:'success',
              position:  'center' ,
              title: this.securityService.selectedFeature.name ,
              text:'Successfully added into features',
              background: "#FFFFFF",
              confirmButtonColor: "#000000"        
            })
           this.featureForm.reset();}
           else{
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Something went wrong! ',
            })
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
  

  }

  GetFeatureById(){
    debugger
    this.securityService.selectedFeature.id=this.FeatureId
    this.securityService.GetFeatureById(this.FeatureId).subscribe((res: FeatureVM[]) => {
      this.fetr = res;
      console.warn( this.fetr)
       this.securityService.selectedFeature=this.fetr[0];
    });
   
  }
  PutFeature(){
    debugger
   
    //this.securityService.selectedFeature=this.fetr[0]
     this.securityService.UpdateFeature(this.securityService.selectedFeature).subscribe((data) => {
      Swal.fire({
        icon:'success',
        position:  'center' ,
        text:'Feature Successfully Updated',
        background: "#FFFFFF",
        confirmButtonColor: "#000000"     
    
      }) 
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


