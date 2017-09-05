using Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class ShowProfileController : ApiController
    {
        // GET: api/ShowProfile
        public IEnumerable<UserProfile> Get(string userid)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetShowUserProfiles(con, userid);
        }

        // GET: api/ShowProfile/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/ShowProfile
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/ShowProfile/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/ShowProfile/5
        public void Delete(int id)
        {
        }
    }
}
