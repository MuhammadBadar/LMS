import { Component, OnInit } from '@angular/core';

import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatSelectModule } from '@angular/material/select';
@Component({
  selector: 'app-add-comment',
  templateUrl: './add-comment.component.html',
  styleUrls: ['./add-comment.component.scss']
})
export class AddCommentComponent implements OnInit {

  basicForm1:FormGroup; 
  FormsModule
  basicform:MatSelectModule
  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.basicForm1=new FormGroup({
   comment:new FormControl(),
   taskId:new FormControl(),
    })
  }
  
onSubmit()
{

}
}
