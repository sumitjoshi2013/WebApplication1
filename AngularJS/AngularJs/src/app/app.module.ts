import { AuthHttp, AUTH_PROVIDERS, provideAuth, AuthConfig } from 'angular2-jwt/angular2-jwt';
import { OrderService } from './services/order.service';
import { AdminAuthGuard } from './admin-auth-guard.service';
import { AuthGuard } from './auth-guard.service';
import { MockBackend } from '@angular/http/testing';
import { fakeBackendProvider } from './helpers/fake-backend';
import { AuthService } from './services/auth.service';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http, BaseRequestOptions, JsonpModule } from '@angular/http';
import { RouterModule } from '@angular/router'; 

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { AdminComponent } from './admin/admin.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { NoAccessComponent } from './no-access/no-access.component';
import { RegisterprofileComponent } from './registerprofile/registerprofile.component';
import { SearchprofileComponent } from './searchprofile/searchprofile.component';
import { HeaderMenuComponent } from './header/header.component';
import { MultiauthenticationComponent } from './multiauthentication/multiauthentication.component';
import { ForgetprofileComponent } from './forgetprofile/forgetprofile.component';
import { BasicinformationComponent } from './basicinformation/basicinformation.component';
import { OtherinformationsComponent } from './otherinformations/otherinformations.component';
import { ResidentialinformationComponent } from './residentialinformation/residentialinformation.component';
import { AccountinformationComponent } from './accountinformation/accountinformation.component';
import { RegistrationThanksComponent } from './registration-thanks/registration-thanks.component';
import { ImagegalleryComponent } from './imagegallery/imagegallery.component';
import { BrowserAnimationsModule } from  '@angular/platform-browser/animations';
import { GalleryModule, GalleryService} from 'ng-gallery';
import { FileuploadComponent } from './fileupload/fileupload.component'
import { FileSelectDirective, FileDropDirective } from 'ng2-file-upload';
//import {UPLOAD_DIRECTIVES} from 'ng2-file-uploader/ng2-file-uploader';
import { GooglerecaptchaComponent } from './googlerecaptcha/googlerecaptcha.component';
import { RecaptchaModule } from 'ng-recaptcha';
import { RecaptchaFormsModule } from 'ng-recaptcha/forms';
import {DpDatePickerModule} from 'ng2-date-picker';
import {MyDatePickerModule } from 'mydatepicker/src/my-date-picker';
import { EqualValidator } from './registerprofile//password.match.directive';
import { DropdownRequired } from './common/dropdown.required.directive';
import { ProfilelistComponent } from './profilelist/profilelist.component';
import {MdGridListModule} from '@angular/material';
import { MaterialModule } from '@angular/material';
import { ProfiledetailComponent } from './profiledetail/profiledetail.component';


export function getAuthHttp(http) {
  return new AuthHttp(new AuthConfig({
    tokenName: 'token'
  }), http);
}

 export const galleryConfig  = {
     "style": {
    "background": "#121519",
    "width": "900px",
    "height": "600px"
  },
  "animation": "fade",
  "loader": {
    "width": "50px",
    "height": "50px",
    "position": "center",
    "icon": "oval"
  },
  "description": {
    "position": "bottom",
    "overlay": false,
    "text": true,
    "counter": true
  },
  "bullets": false,
  "player": {
    "autoplay": false,
    "speed": 3000
  },
  "thumbnails": {
    "width": 120,
    "height": 90,
    "position": "top",
    "space": 20
  },
  "navigation": true
  }
  




  @NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    SignupComponent,
    AdminComponent,
    HomeComponent,
    NotFoundComponent,
    NoAccessComponent,
    RegisterprofileComponent,
    SearchprofileComponent,
    HeaderMenuComponent,
    MultiauthenticationComponent,
    ForgetprofileComponent,
    BasicinformationComponent,
    OtherinformationsComponent,
    ResidentialinformationComponent,
    AccountinformationComponent,
    RegistrationThanksComponent,
    ImagegalleryComponent,
    FileuploadComponent,
    FileSelectDirective,
    GooglerecaptchaComponent,
    EqualValidator,
    DropdownRequired,
    ProfilelistComponent,
    ProfiledetailComponent
  ],
  imports: [
    MaterialModule,
    MdGridListModule,
    MyDatePickerModule ,
  //AlertModule.forRoot(),
    BrowserModule,
    JsonpModule,
    DpDatePickerModule,
    RecaptchaModule.forRoot(),
    RecaptchaFormsModule,
    FormsModule,ReactiveFormsModule,
    HttpModule, BrowserAnimationsModule,
     GalleryModule.forRoot(galleryConfig),
    RouterModule.forRoot([
      { path: '', component: HomeComponent },
      { path: 'admin', component: AdminComponent, canActivate: [AdminAuthGuard] },
      { path: 'login', component: LoginComponent },
      { path: 'no-access', component: NoAccessComponent },
      { path: 'registerprofile', component: RegisterprofileComponent },
      { path: 'searchprofile', component: SearchprofileComponent, canActivate: [AdminAuthGuard] },
      { path: 'multiauth', component: MultiauthenticationComponent, canActivate: [AdminAuthGuard] },
      { path: 'forgetpassword', component: ForgetprofileComponent },
      { path: 'RegistrationOTP', component: RegistrationThanksComponent },
      { path: 'Imagegallery', component: ImagegalleryComponent },
      { path: 'Fileupload', component: FileuploadComponent },
      { path: 'profilelist', component: ProfilelistComponent },
      { path: 'profiledetail', component: ProfiledetailComponent },

    ],{ useHash: true })
  ],
  providers: [
    OrderService,

    AuthService,
    AuthGuard,
    AdminAuthGuard,
    AuthHttp,
    {
      provide: AuthHttp,
      useFactory: getAuthHttp,
      deps: [Http]
    },

    // For creating a mock back-end. You don't need these in a real app. 
    //fakeBackendProvider,
   // MockBackend,
    BaseRequestOptions
  ],
  
  bootstrap: [AppComponent]
  
})
export class AppModule { }
