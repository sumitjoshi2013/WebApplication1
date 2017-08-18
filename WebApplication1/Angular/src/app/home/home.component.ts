import { AuthService } from './../services/auth.service';
import { Component } from '@angular/core';
import { HeaderMenuComponent } from '../header/header.component';




@Component({
  selector: 'home',
  templateUrl: './home.component.html'
})
export class HomeComponent {

  constructor(private authService: AuthService) { }
}
