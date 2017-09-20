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

        // POST: api/ShowInterest
        public string Post(InterestShown value)
        {
            var data = value;
            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.InsertUserInterestShown(con, data);
        }
       
    }
}
