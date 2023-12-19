import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { AssignClassVM } from '../Models/AssignClassVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { NgForm } from '@angular/forms';
import { ManageStudentschoolComponent } from '../manage-studentschool/manage-studentschool.component';
import { StudentschoolVM } from '../Models/StudentschoolVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../security/models/EnumTypeVM';
@Component({
  selector: 'app-manage-assign-class',
  templateUrl: './manage-assign-class.component.html',
  styleUrls: ['./manage-assign-class.component.css']
})
export class ManageAssignClassComponent implements OnInit{
  displayedColumns: string[] = ['student','branch','class','section','dateofassignment','effectivedate','isActive','actions']
  processing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
DisabledType: boolean = false;
  dataSource: any
  selectedAssignClass= new AssignClassVM
  @ViewChild('assignClassForm', { static: true }) assignClassForm: NgForm;
  dialogref: any
  dialogData: any;
  Class: SettingsVM[]=[];
  Branch: SettingsVM[]=[];
  Section: SettingsVM[]=[];

  studentschools?: StudentschoolVM[]
  assignClass?: AssignClassVM[]
    isDialog: boolean = false;
    isActive?: false
    hide = true;
    constructor(
      private injector: Injector,
      private lmsSvc: LMSService,
      private catSvc: CatalogService,
      private dialog: MatDialog) {
      this.dialogref = this.injector.get(MatDialogRef, null);
      this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
      this.selectedAssignClass = new AssignClassVM();
    
    }
    ngOnInit(): void {
      this.GetAssignClass()
      this.GetStudentschool();
      this.GetSettings(EnumTypeVM.Class)
      this.GetSettings(EnumTypeVM.Section)
      this.GetSettings(EnumTypeVM.Branch)
      this.Add = true;
      this.selectedAssignClass.isActive = true;
      this.isDialog = this.dialogData.isDialog; }
      GetAssignClass() {
        this.lmsSvc.GetAssignClass().subscribe({
          next: (res: AssignClassVM[]) => {
           
            this.dataSource = new MatTableDataSource(res);
          },
          error: (e) => {
            console.warn(e);
          }
        });
      }
    
    GetStudentschool() {
      var studentschool = new StudentschoolVM
      studentschool.isActive = true;
      this.selectedAssignClass.isActive = true;
      this.lmsSvc.SearchStudentschool(studentschool).subscribe({
        next: (res: StudentschoolVM[]) => {
          this.studentschools = res
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    }
    DeleteAssignClass(id: number) {
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
          this.lmsSvc.DeleteAssignClass(id).subscribe({
            next: (data) => {
              Swal.fire(
                'Deleted!',
                'Guardian has been deleted.',
                'success'
              );
              this.ngOnInit();
            },
            error: (e) => {
              console.warn(e);
            }
          });
        }
      });
    }
  
    SaveAssignClass() {
      if (  this.selectedAssignClass.dateofassignment &&  this.selectedAssignClass.effectivedate ) {
        this.processing = true; 
    
        if (this.Edit) {
          this.UpdateAssignClass();
        } else {
          this.lmsSvc.SaveAssignClass(this.selectedAssignClass).subscribe({
            next: (res) => {
              this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
              this.ngOnInit();
              this.Refresh(); 
              window.scrollTo(0, 0);
              this.processing = false; 
            },
            error: (e) => {
              console.warn(e);
              this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
              this.processing = false; 
            }
          });
        }
      } else {
        this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
      }
    }
    
    EditAssignClass(assignClass: AssignClassVM) {
      this.Edit = true
      this.Add = false
      this.selectedAssignClass = assignClass
      this.selectedAssignClass.isActive = true;
    }
    GetAssignClassForEdit(id: number) {
      this.selectedAssignClass = new AssignClassVM();
      this.selectedAssignClass.id = id;
      console.warn(this.selectedAssignClass);  
      this.lmsSvc.SearchAssignClass(this.selectedAssignClass).subscribe({
        next: (res: AssignClassVM[]) => {
          if (res.length > 0) {
            this.selectedAssignClass = res[0];
            this.Edit = true;
            this.Add = false;
          } else {
            console.log('Guardian not found for editing.');
          }
        },
        error: (e) => {
          console.warn(e);
        }
      });
    }

    UpdateAssignClass() {
      if (  this.selectedAssignClass.dateofassignment &&  this.selectedAssignClass.effectivedate ) {
        this.processing = true; 
        this.lmsSvc.UpdateAssignClass(this.selectedAssignClass).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Successfully Updated!", 5000);
            this.Add = true;
            this.Edit = false; 
            this.processing = false;
            this.ngOnInit();
          },
          error: (e) => {
            console.warn(e);
            this.catSvc.ErrorMsgBar("Error Occurred", 5000);
            this.processing = false; 
          }
        });
      } else {
        this.catSvc.ErrorMsgBar("Please fill in all required fields!", 5000);
      }
    }
    Refresh() {
      this.Add = true;
      this.Edit = false;
      this.GetAssignClass();
      this.GetStudentschool();
      this.GetSettings(EnumTypeVM.Class)
      this.GetSettings(EnumTypeVM.Section)
      this.GetSettings(EnumTypeVM.Branch)
      this.selectedAssignClass = new AssignClassVM();
    }
    Search(){ debugger;
      var  assignClass = new AssignClassVM();
      assignClass.studentschoolId = this.selectedAssignClass.studentschoolId;
      this.lmsSvc.SearchAssignClass(assignClass).subscribe({
       next: (value: AssignClassVM[]) => {
         this.assignClass = value
         this.dataSource = new MatTableDataSource(this.assignClass)
       }, error: (err) => {
         this.catSvc.ErrorMsgBar("Error Occurred", 5000)
       },
     })}
     OpenStudentschoolDialog() {
      this.dialogref = this.dialog.open(ManageStudentschoolComponent, {
        width: '1200px', height: '950px',
        data:{isDialog : true}
       })
        this.dataSource = new MatTableDataSource(this.studentschools)
      this.dialogref.afterClosed()
        .subscribe((res: any) => {
          this.GetStudentschool()
        }
        );
    }
    GetSettings(etype: EnumTypeVM) {
      var setting = new SettingsVM()
      setting.enumTypeId = etype
      setting.isActive = true
      this.catSvc.SearchSettings(setting).subscribe({
        next: (res: SettingsVM[]) => {
           if (etype === EnumTypeVM.Class) {
            this.Class = res;
            if(this.Class.length>0)
            this.selectedAssignClass.classId=this.Class[0].id;
          }
          if (etype === EnumTypeVM.Branch) {
            this.Branch = res;
            if(this.Branch.length>0)
            this.selectedAssignClass.branchId=this.Branch[0].id;
          }    
         else if (etype === EnumTypeVM.Section) {
            this.Section = res;
            if(this.Section.length>0)
            this.selectedAssignClass.sectionId=this.Section[0].id;
          }
        }, error: (e) => {
          alert("t");
          this.catSvc.ErrorMsgBar("Error Occurred", 4000)
          console.warn(e);
        }
      })
    }
  }
  