import { AuthService } from './../services/auth.service';
import { Component } from '@angular/core';

@Component({
  selector: 'menubar',
  templateUrl: 'header.component.html'
})
export class HeaderMenuComponent {

  constructor(private authService: AuthService) { 
//let a = authService.currentUser.name;
//let b = authService.isLoggedIn();

  }
}
