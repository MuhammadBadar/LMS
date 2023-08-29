
import { FormBuilder, FormGroup, Validators, AbstractControl, ValidationErrors, ValidatorFn, NgForm } from '@angular/forms';


import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from './../lms.service';
import { Component, OnInit, ViewChild } from '@angular/core';

import { VocabularyVM } from '../Models/VocabularyVM';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-manage-vocabulary',
  templateUrl: './manage-vocabulary.component.html',
  styleUrls: ['./manage-vocabulary.component.css']
})
export class ManageVocabularyComponent implements OnInit {
 
  vocabularyForm: FormGroup;
  //selectedVocabulary: any; // Replace with your actual class/interfac
  
 
   
    vocabColumns: string[] = ['word', 'pronunciation', 'englishMeaning', 'reference', 'sentance', 'comment', 'urduMeaning','isActive', 'actions'];
   
    AddMode: boolean = true
    EditMode: boolean = false
    Add: boolean = true;
    Edit: boolean = false;
    proccessing: boolean = false;
   
    vocabDataSource : any
    hide = true;

    vocab: VocabularyVM[]=[]
    selectedVocabulary: VocabularyVM
    @ViewChild('VocabularyForm', { static: true }) VocabularyForm: NgForm;
   
   
    constructor(
      private lmsSvc: LMSService,
      private catSvc: CatalogService,
      private fb: FormBuilder) {
      this.selectedVocabulary = new VocabularyVM
    }
    ngOnInit(): void {
 
      this.GetVocabulary();
      
    this.selectedVocabulary.isActive = true;
    }
    
    //use in html input feild
    //(focusout)="verifyWord()"

    // Alert popup function
    // verifyWord(): void {
    //   alert('i m out now');
    // }


    GetVocabulary() {
      this.lmsSvc.GetVocabulary().subscribe({
        next: (value: VocabularyVM[]) => {
          debugger;
          this.vocab = value
          this.vocabDataSource = new MatTableDataSource(this.vocab)
        }, error: (err) => {
          alert('Error to retrieve Vocabulary');
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
  }
  // SaveVocabulary() {
  //   this.lmsSvc.SaveVocabulary(this.selectedVocabulary).subscribe({
  //     next: (value) => {
  //       this.catSvc.SuccessMsgBar("Successfully Added", 5000)
  //       this.Refresh();
  //     }, error: (err) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //     },
  //   })
  // }

  SaveVocabulary() {
    if (this.selectedVocabulary.word == undefined) {
      this.VocabularyForm.controls['Word'].setErrors({ 'incorrect': true });
      console.warn(this.VocabularyForm);
    }
    if (this.selectedVocabulary.englishMeaning == undefined) {
      this.VocabularyForm.controls['englishMeaning'].setErrors({ 'incorrect': true });
      console.warn(this.VocabularyForm);
    }
    this.lmsSvc.GetLecture().subscribe({
      next: (res: VocabularyVM[]) => {
        var list = res;
        if (this.Edit) {
          res = res.filter(x => x !== this.selectedVocabulary);
        }
        var find = res.find(x => x.urduMeaning === this.selectedVocabulary.urduMeaning);
        if (find == undefined) {
          const controls = this.VocabularyForm.controls;
          if (this.VocabularyForm.invalid) {
            for (const name in controls) {

               if (controls[name].hasError('required')) {
                this.catSvc.ErrorMsgBar(` ${name} is required field`, 6000)
                 break
               }else if(controls[name].hasError('minlength')){
        
                 this.catSvc.ErrorMsgBar(` ${name} must be atleast ${controls[name].errors['minlength'].requiredLength } characters long.`, 6000)
                 break
            }}
          } else {
            this.proccessing = true;
            if (this.EditMode) {
              this.UpdateVocabulary();
            } else {
              this.lmsSvc.SaveVocabulary(this.selectedVocabulary).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
                  this.ngOnInit();
                  this.Refresh();
                  window.scrollTo(0, 0);
                  this.proccessing = false;
                },
                error: (e) => {
                  console.warn(e);
                  this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
                  this.proccessing = false;
                }
              });
            }
          }
        } else {
          this.catSvc.ErrorMsgBar("Pleaze fill all reqired cells ", 5000);
        }
      },
      error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
        console.warn(e);
      }
    });


  }
  EditVocabulary(vocab: VocabularyVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedVocabulary = vocab
  }
  UpdateVocabulary() {
    this.lmsSvc.UpdateVocabulary(this.selectedVocabulary).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Updated", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  Refresh() {
    this.GetVocabulary();
    this.selectedVocabulary = new VocabularyVM
    this.EditMode = false
    this.AddMode = true
  }
  DeleteVocabulary(id: number) {
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
        this.lmsSvc.DeleteVocabulary(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Topic has been deleted.',
              'success'
            )
            this.Refresh();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  
  }
  
