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
    public class ContactUsController : ApiController
    {
      
        public string Get(string EmailId)
        {
           return  "";
        }

        // POST: api/ContactUs
        public string Post(ContactUs value)
        {
            
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.InsertContactUs(con, value);
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
