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
    public class ShowInterestController : ApiController
    {
        // GET: api/ShowInterest
        public IEnumerable<GetShowInterestModel> Get(string userid)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetInterestShownProfiles(con, userid);
        }

        // GET: api/ShowInterest/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/ShowInterest
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/ShowInterest/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/ShowInterest/5
        public void Delete(int id)
        {
        }
    }
}
