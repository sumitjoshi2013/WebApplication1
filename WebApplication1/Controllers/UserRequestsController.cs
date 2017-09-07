﻿using Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class UserRequestsController : ApiController
    {
        // GET: api/UserRequests
        public IEnumerable<GetUserRequestsModel> GetAcceptMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetUserRequests(con, userid);
        }
        // GET: api/UserRequests/5
      
    }
}
