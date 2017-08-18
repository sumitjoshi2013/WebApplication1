import { AuthService } from './../services/auth.service';
import { Component,ViewChild } from '@angular/core';
import { Router } from "@angular/router";

export interface FormModel {
  captcha?: string;
}


@Component({
  selector: 'login',
  templateUrl: './login.component.html',
   styles: [`
      .error { color: crimson; }
      .success { color: green; }
  ` ]
})
export class LoginComponent {
  invalidLogin: boolean; 
  @ViewChild('f') form: any;
public formModel: FormModel = {};

  constructor(
    private router: Router, 
    private authService: AuthService) { }

    signIn(credentials) {
    console.log(credentials["captcha"]);
  if (this.form.valid) {

    this.authService.login(credentials)
    
    .subscribe(result => { 
        if (result)
          this.router.navigate(['/multiauth']);
        else  
          this.invalidLogin = true; 
      });
     }
    }

  }

