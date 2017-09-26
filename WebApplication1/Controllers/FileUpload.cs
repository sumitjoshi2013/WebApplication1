﻿using Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WebApplication1.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class FileuploadController : ApiController
    {
        // GET api/values
        [HttpPost,ActionName("File")]
        
        public HttpResponseMessage UploadJsonFile(UserPics userPics)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];
                    var filePath = HttpContext.Current.Server.MapPath("~/UploadFile/" + postedFile.FileName);
                    postedFile.SaveAs(filePath);
                }
            }
            return response;
        }

        [HttpPost, ActionName("Data")]
        public string FileUploadData(UserPics userPics)
        {
            var data = userPics;
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.InsertUserProfilePics(con, data);
            //InsertUserProfilePics
        }
    }
}