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
    public class UserMessagesController : ApiController
    {
        // GET: api/UserMessages
        public IEnumerable<GetUserMessages> Get(string InterestId)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetUserMessages(con, InterestId);
        }

        // GET: api/UserMessages/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/UserMessages
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/UserMessages/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/UserMessages/5
        public void Delete(int id)
        {
        }
    }
}
