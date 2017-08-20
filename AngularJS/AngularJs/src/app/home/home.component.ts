import { AuthService } from './../services/auth.service';
import { Component } from '@angular/core';
import { HeaderMenuComponent } from '../header/header.component';
//import './home.js';



@Component({
  selector: 'home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  constructor(private authService: AuthService) 
  {

    let cuser = authService.currentUser;
    console.log(cuser);
   }

 
  
}
