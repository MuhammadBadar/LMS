import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { egretAnimations } from 'app/shared/animations/egret-animations';

@Component({
  selector: 'app-signin3',
  templateUrl: './signin3.component.html',
  styleUrls: ['./signin3.component.scss'],
  animations: egretAnimations
})
export class Signin3Component implements OnInit {

  public signupForm: FormGroup;
  constructor(private fb: FormBuilder) {}

  ngOnInit() {
    this.signupForm = this.fb.group({
      username: ["", Validators.required],
      password: ["", Validators.required]
    });
  }

  onSubmit() {
    if (this.signupForm.valid) {
      // do what you want to do with your data
      console.log(this.signupForm.value);
    }
  }

}
