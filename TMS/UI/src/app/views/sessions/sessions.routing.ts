import { Signup4Component } from './signup4/signup4.component';
import { Signup3Component } from './signup3/signup3.component';
import { Signup2Component } from './signup2/signup2.component';
import { Routes } from "@angular/router";

import { ForgotPasswordComponent } from "./forgot-password/forgot-password.component";
import { LockscreenComponent } from "./lockscreen/lockscreen.component";
import { SigninComponent } from "./signin/signin.component";
import { SignupComponent } from "./signup/signup.component";
import { NotFoundComponent } from "./not-found/not-found.component";
import { ErrorComponent } from "./error/error.component";
import { Signin3Component } from './signin3/signin3.component';
import { Signin4Component } from './signin4/signin4.component';
import { Signin2Component } from './signin2/signin2.component';

export const SessionsRoutes: Routes = [
  {
    path: "",
    children: [
      {
        path: "signup",
        component: SignupComponent,
        data: { title: "Signup" }
      },
      {
        path: "signup2",
        component: Signup2Component,
        data: { title: "Signup2" }
      },
      {
        path: "signin2",
        component: Signin2Component,
        data: { title: "Signin2" }
      },
      {
        path: "signup3",
        component: Signup3Component,
        data: { title: "Signup3" }
      },
      {
        path: "signin3",
        component: Signin3Component,
        data: { title: "sign-in-3" }
      },
      {
        path: "signup4",
        component: Signup4Component,
        data: { title: "Signup4" }
      },
      {
        path: "signin4",
        component: Signin4Component,
        data: { title: "Signin4" }
      },
      {
        path: "signin",
        component: SigninComponent,
        data: { title: "Signin" }
      },
      {
        path: "forgot-password",
        component: ForgotPasswordComponent,
        data: { title: "Forgot password" }
      },
      {
        path: "lockscreen",
        component: LockscreenComponent,
        data: { title: "Lockscreen" }
      },
      {
        path: "404",
        component: NotFoundComponent,
        data: { title: "Not Found" }
      },
      {
        path: "error",
        component: ErrorComponent,
        data: { title: "Error" }
      }
    ]
  }
];
