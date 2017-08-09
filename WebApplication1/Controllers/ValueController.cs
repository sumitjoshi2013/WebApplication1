using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApi.Jwt.Filters;

namespace WebApi.Jwt.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ValueController : ApiController
    {
       // [JwtAuthentication]
        public string Get()
        {
            return "value";
        }
    }
}
