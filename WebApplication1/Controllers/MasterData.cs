﻿using Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApi.Jwt.Filters;
using WebApplication1.Utility;

namespace WebApi.Jwt.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
   // [CacheFilter(TimeDuration =200)]
    public class MasterDataController : ApiController
    {
        IEnumerable<GetMasterData> getData;

        public HttpResponseMessage Get(int lookUpId)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            getData = repository.GetMasterData(con).Where(m => m.LOOKUP_ID == lookUpId).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK, getData);
            //return getData.AsEnumerable();
            return response;
        }

    }
}
