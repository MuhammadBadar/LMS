import { FormGroup, Validators } from "@angular/forms";
import { FormBuilder } from "@angular/forms";
import { Component, OnInit } from "@angular/core";
import { egretAnimations } from "app/shared/animations/egret-animations";

@Component({
  selector: "app-signup3",
  templateUrl: "./signup3.component.html",
  styleUrls: ["./signup3.component.scss"],
  animations: egretAnimations
})
export class Signup3Component implements OnInit {
  signupForm: FormGroup;
  constructor(private fb: FormBuilder) {}

  ngOnInit() {
    this.signupForm = this.fb.group({
      username: ["", Validators.required],
      email: ["", [Validators.required, Validators.email]],
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
