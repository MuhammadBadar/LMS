import { ChangeDetectorRef, Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { NgForm, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { NotificationVM } from 'app/views/task/models/NotificationVM';
import { TaskService } from 'app/views/task/task.service';
import Swal from 'sweetalert2';
import { InquiryService } from '../Inquiry.Service';
import { InquiryVM } from '../Models/models/inquiryVM';
import { ServicesVM } from '../Models/models/ServicesVM';
import { FieldVM } from '../Models/models/fieldVm';
import { InquiryFieldDataVM } from '../Models/InquiryFieldDataVM';
import { DynamicFormComponent } from '../InputFields/DynamicFormComponent';
import { FieldConfig, IFormField } from '../InputFields/Models/FieldConfig';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-manage-inquiry',
  templateUrl: './manage-inquiry.component.html',
  styleUrls: ['./manage-inquiry.component.css']
})
export class ManageInquiryComponent implements OnInit {
  validForm:boolean=true;
  Id:number=0;
  regConfig: FieldConfig[] = []
  @ViewChild('userForm', { static: true }) userForm: NgForm;
  inqId: number;
  lstForm: IFormField[] = [];
  inquiryId: number;
  FieldData = [];
  Object={} ;
  InquiryFieldData: InquiryFieldDataVM[];
  field: FieldVM[];
  List=[];
  fields: FieldVM;
  inqry: InquiryVM[];
  InquiryById:InquiryVM
  Edit: boolean = false;
  Services: ServicesVM[]
  Add: boolean = true;
  @ViewChild(DynamicFormComponent) form: DynamicFormComponent;
  group: FormGroup;
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: FormBuilder,
    private cdRef: ChangeDetectorRef,
    private snack: MatSnackBar,
    public inqSvc: InquiryService,
    public taskService: TaskService
  ) {
    this.inqSvc.selectedInquiryFieldData = new InquiryFieldDataVM
    this.inqSvc.selectedInquiry = new InquiryVM
    this.taskService.selectedMail = new NotificationVM
  }
  ngOnInit(): void {
   
    this.inqSvc.getServices().subscribe((res: ServicesVM[]) => {
      this.Services = res;
    })
    this.route.queryParams.subscribe(params => {
      this.inqId = params.id;
    });
    if (this.inqId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetInquiryForEdit();
   
    }
    this.GetField();
   
  }
  GetField() {
    this.inqSvc.getField().subscribe((res: FieldVM[]) => {
      this.field = res;
      this.regConfig = this.field
      const formGroup = {};
      this.field.forEach(formControl => {
        formGroup[formControl.title] = new FormControl('');
      });
      this.group = new FormGroup(formGroup);
if(this.Edit==true){ 
  console.warn(this.List)
  for (let index = 0; index < this.List[0]?.ifData.length; index++) {
    var FieldName = this.List[0].ifData[index].fieldName;
    var FieldValue=this.inqry[0].ifData[index].fieldValue
    this.group.get(FieldName).setValue(FieldValue);
    this.group.controls[FieldName].setValue(FieldValue)
  } 

}
    });
   
  }
  GetInquiry() {
    this.inqSvc.getInquiry().subscribe((res: InquiryVM[]) => {
      this.inqry = res;
    });
  }
  GetInquiryForEdit() {
    this.inqSvc.selectedInquiry = new InquiryVM;
    this.inqSvc.selectedInquiry.id = this.inqId
    this.inqSvc.SearchInquiry(this.inqSvc.selectedInquiry).subscribe((res: InquiryVM[]) => {
      this.inqry = res;
      this.List=this.inqry;
      this.inqSvc.selectedInquiry = this.inqry[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  SaveInquiry() {

    if(!this.userForm.invalid){
  console.warn(this.group)
    Object.keys(this.group.controls).forEach(async (key: any) => {
      const obstractControl = this.group.get(key);
      if(obstractControl.status=="INVALID"){
        this.validForm=false
       }
        this.Id=this.Id+1
        const newRow = {
          "id":this.Id,   "inquiryId": this.inquiryId, "fieldValue": obstractControl.value, "fieldName": key,
          "isActive": true, "dBoperation": 1
        } 
        this.FieldData.push(newRow)
        this.inqSvc.selectedInquiry.ifData = this.FieldData
    })
    if(this.validForm==true){
    this.inqSvc.SaveInquiry(this.inqSvc.selectedInquiry).subscribe((res: InquiryVM) => {
      if (res !== null) {
        this.inqSvc.selectedInquiry = new InquiryVM
        this.inqSvc.selectedInquiry.id = res.id
        this.inqSvc.SearchInquiry(this.inqSvc.selectedInquiry).subscribe((res: InquiryVM[]) => {
          this.inqry = res;
          this.GetInquiry();

          var content = this.inqry[0].content.replace("#User", this.inqry[0].name)
          this.taskService.selectedMail.senderMail = 'bintameer212@gmail.com';
          this.taskService.selectedMail.receiverMail = this.inqry[0].email;
          this.taskService.selectedMail.mailBody = content
          this.taskService.selectedMail.mailSubject = this.inqry[0].serviceName

          this.taskService.SendMail(this.taskService.selectedMail).subscribe((data) => { })
          this.snack.open('Inquiry  successfully Added!', 'OK', { duration: 4000 })
          this.userForm.reset();
          this.group.reset();
          this.FieldData.length=0
          this.Id=0
        })
      }
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });}else{
        alert("Please fill required Fields");
        this.FieldData.length=0;
        this.inqSvc.selectedInquiry.ifData.length=0;
        this.validForm=true;
        this.Id=0
      }
    }
  else{
    alert("Please fill required Fields")
  }
  }

  SaveInquiryFieldData() {
    if(this.field){
    Object.keys(this.form.form.controls).forEach(async (key: any) => {
      const obstractControl = this.form.form.get(key);
      if (obstractControl.value !== null) {
        const newRow = {
          "inquiryId": this.inquiryId, "fieldValue": obstractControl.value, "fieldName": key,
          "isActive": true, "dBoperation": 1
        }
        this.FieldData.push(newRow)
        this.InquiryFieldData = this.FieldData
      }
    })}
    this.inqSvc.SaveInquiryFieldData(this.InquiryFieldData).subscribe((res: InquiryFieldDataVM[]) => {
    })

  }
  UpdateInquiry() {
console.warn(this.field)
    if(!this.userForm.invalid){

    Object.keys(this.group.controls).forEach(async (key: any) => {
      const obstractControl = this.group.get(key);
      console.warn(obstractControl.status)
      if(obstractControl.status=="INVALID"){
        this.validForm=false
       }
      this.Id=this.Id+1
      const newRow = {
        "id":this.Id,   "inquiryId": this.inquiryId, "fieldValue": obstractControl.value, "fieldName": key,
        "isActive": true, "dBoperation": 2
      } 
        this.FieldData.push(newRow)
        this.inqSvc.selectedInquiry.ifData = this.FieldData
    })
    if(this.validForm==true){
      this.inqSvc.UpdateInquiry(this.inqSvc.selectedInquiry).subscribe((res) => {
        this.snack.open('Successfully Updated!', 'OK', { duration: 4000 })
        this.FieldData.length=0
        this.inqSvc.selectedInquiry.ifData.length=0
        this.Id=0
      })
    }else{
        alert("Please fill required Fields");
        this.FieldData.length=0;
        this.inqSvc.selectedInquiry.ifData.length=0
        this.validForm=true;
        this.Id=0
      }
    }
  else{
    alert("Please fill required Fields")
  }
   
  }
  Refresh() {
    this.inqSvc.selectedInquiry = new InquiryVM;
    this.Add = true;
    this.Edit = false;
  }
  ngAfterViewChecked(): void {
    this.cdRef.detectChanges();
    this.cdRef.markForCheck();
  }
  Cancel(){
    this.router.navigate(['/inquiry/inquirylist'], {})
}
}

