
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from './../lms.service';
import { Component, OnInit } from '@angular/core';

import { VocabularyVM } from '../Models/VocabularyVM';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-manage-vocabulary',
  templateUrl: './manage-vocabulary.component.html',
  styleUrls: ['./manage-vocabulary.component.scss']
})
export class ManageVocabularyComponent implements OnInit {
 
  
 
   // displayedColumns: string[] = ['topicTitle', 'description','isActive', 'actions'];
    vocabColumns: string[] = ['word', 'meaning', 'reference', 'sentance', 'pronunciation', 'translation','isActive', 'actions'];
    AddMode: boolean = true
    EditMode: boolean = false
    Add: boolean = true;
    
   // dataSource: any
    vocabDataSource : any
   // selectedTopic: TopicVM
    selectedVocabulary: VocabularyVM
   // topics?: TopicVM[]
    vocab: VocabularyVM[]=[]
    constructor(
      private lmsSvc: LMSService,
      private catSvc: CatalogService) {
      this.selectedVocabulary = new VocabularyVM
    }
    ngOnInit(): void {
 
      this.GetVocabulary();
      
    this.selectedVocabulary.isActive = true;
    }
    
   
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
  SaveVocabulary() {
    this.lmsSvc.SaveVocabulary(this.selectedVocabulary).subscribe({
      next: (value) => {
        this.catSvc.SuccessMsgBar("Successfully Added", 5000)
        this.Refresh();
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
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
  
