import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-gallery',
  templateUrl: './app-gallery.component.html',
  styleUrls: ['./app-gallery.component.css']
})
export class AppGalleryComponent implements OnInit {
  QCSForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit() {
    this.QCSForm = new FormGroup({
     
   });

  }
  
  submit() {
  }

  
}
