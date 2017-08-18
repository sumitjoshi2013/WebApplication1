//https://github.com/MurhafSousli/ng-gallery

import { Component, OnInit } from '@angular/core';
import { BrowserAnimationsModule, NoopAnimationsModule } from  '@angular/platform-browser/animations';
import {BrowserModule} from '@angular/platform-browser'
import {GalleryModule, GalleryService} from 'ng-gallery'


@Component({
  selector: 'app-imagegallery',
  templateUrl: './imagegallery.component.html'
})
export class ImagegalleryComponent implements OnInit {

// make a get call for image path
  images = [
    {
      src: 'http://localhost/images/IMG_20170602_133107.jpg',
      text: 'City Sunset View'
    },
    {
      src: 'http://localhost/images/IMG_20170626_080941.jpg',
      text: 'Mountain'
    },
    {
      src: 'http://localhost/images/IMG_20170626_080945.jpg',
      text: 'Peacock'
    },
    {
      src: 'http://localhost/images/IMG_20170626_081205.jpg',
      text: 'Fire'
    },
    {
      src: 'http://localhost/images/IMG_20170602_133107.jpg',
      text: 'Nature'
    }
  ];
 constructor(private gallery: GalleryService) {
  }

  ngOnInit() {
     this.gallery.load(this.images);
  }

}
