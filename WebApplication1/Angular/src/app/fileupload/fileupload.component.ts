//http://valor-software.com/ng2-file-upload/
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { FileSelectDirective, FileDropDirective } from 'ng2-file-upload';
import { FileUploader } from 'ng2-file-upload';
import { JsonpModule, Jsonp, Response, Http,Headers, RequestOptions, RequestMethod } from '@angular/http';
//const URL = 'https://evening-anchorage-3159.herokuapp.com/api/';
@Component({
  selector: 'app-fileupload',
  templateUrl: './fileupload.component.html'
})
export class FileuploadComponent implements OnInit {
  // public uploader: FileUploader;

  public headers = new Headers({'Content-Type':'multipart/form-data'});
  public options = new RequestOptions({ headers: this.headers, method: "post"});




  uploader: FileUploader = new FileUploader({
     url: "http://localhost/apicall/api/Fileupload/",
         isHTML5: true//,
   //headers: [{ name: 'foofoo', value: 'passengerslivesmatter' }]
    //console.log("hello");
  });
  

//public uploader:FileUploader = new FileUploader({url:'http://localhost:32123/api/Fileupload/', allowedFileType: ["pdf"]});

//  public uploader1:FileUploader = new FileUploader({url:'http://localhost:32123/api/Fileupload/', allowedFileType: ["pdf"] });

  //public ploader1:FileUploader = new FileUploader({url:'http://localhost:32123/api/Fileupload/', allowedFileType: ["pdf"], headers: <Headers[]>[  //{ name: 'Content-Type', value: 'application/json' }           { name: 'Content-Type', value: 'multipart/form-data' }        ]    });



    uploadAll()
    {
    //  this.uploader.setOptions(this.options);
        console.log("test: " + FileUploader.name);

    }
  constructor(private http: Http) { }

  ngOnInit() {
  }

  
}
