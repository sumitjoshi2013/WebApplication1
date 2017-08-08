using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using Microsoft.IdentityModel.Tokens;
using System.Web.Http.Cors;

namespace WebApi.Jwt.Controllers
{
   // [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*", exposedHeaders: "X-Custom-Header", SupportsCredentials = true)]

    [AllowAnonymous]
    public class TokenController : ApiController
    {
        // THis is naive endpoint for demo, it should use Basic authentication to provdie token or POST request
        //MSSQLSERVER
        public HttpResponseMessage Get(string username, string password)
        {
            if (CheckUser(username, password))
            {
                var t = JwtManager.GenerateToken(username);
                var response = Request.CreateResponse(HttpStatusCode.OK, t);
                return response;
            }

            throw new HttpResponseException(HttpStatusCode.Unauthorized);
        }
        [HttpPost]
        public HttpResponseMessage Login(loginobject credentials)
        {
            string s = "a";
            if (CheckUser(credentials.email, credentials.password))
            {
                var t = JwtManager.GenerateToken(credentials.email);
                var response = Request.CreateResponse(HttpStatusCode.OK, t);
                return response;
            }

            throw new HttpResponseException(HttpStatusCode.Accepted);
        }

        public bool CheckUser(string username, string password)
        {
            // should check in the database
            return true;
        }
    }
    public class loginobject
    {
        public string  email { get; set; }

        public string password { get; set; }
    }

}
