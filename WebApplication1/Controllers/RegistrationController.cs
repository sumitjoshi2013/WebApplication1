using Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WebApplication1.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RegistrationController : ApiController
    {
        // GET: api/Registration/GetAllProfiles
        [HttpGet, ActionName("GetAllProfiles")]
        public IEnumerable<UserProfile> ShowAllProfiles(string emailid)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetProfiles(con, emailid);
        }
        //GET: api/Registration/GetProfilesByEmailId
        [HttpGet, ActionName("GetProfilesByEmailId")]
        public UserProfile GetProfilesByEmailId(string emailid)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetProfilesByEmailId(con, emailid);
        }

        [HttpGet, ActionName("GetForgetUser")]
        public string ForgetUserIdToEmail(string emailid)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetForgetUserIdToEmail(con, emailid);
        }


        /*
        // GET: api/Registration/5
        public GetRegistrationModel Get(string id)
        {
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetProfileById(con, id);
        }
        */
        // POST: api/Registration
        public string Post(RegistrationModel value)
        {
            var data = value;
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.InsertUserProfile(con, data);
        }

        // PUT: api/Registration/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Registration/5
        public void Delete(int id)
        {
        }
    }
}
