using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class MasterDataController : ApiController
    {
        // GET: api/MasterData
        [HttpGet, ActionName("AcceptMaster")]
        public IEnumerable<string> GetAcceptMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("CasteMaster")]
        public IEnumerable<string> GetCasteMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("DrinkMaster")]
        public IEnumerable<string> GetDrinkMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("GenderMaster")]
        public IEnumerable<string> GetGenderMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("JobMaster")]
        public IEnumerable<string> GetJobMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("LanguageMaster")]
        public IEnumerable<string> GetLanguageMaster()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet, ActionName("MaritialStatusMaster")]
        public IEnumerable<string> GetMaritialStatusMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("ProfileCreatedByMaster")]
        public IEnumerable<string> GetProfileCreatedByMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("RashiMaster")]
        public IEnumerable<string> GetRashiMaster()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet, ActionName("ReligionMaster")]
        public IEnumerable<string> GetReligionMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("SalaryMaster")]
        public IEnumerable<string> GetSalaryMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("SmokingMaster")]
        public IEnumerable<string> GetSmokingMaster()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet, ActionName("StateMaster")]
        public IEnumerable<string> GetStateMaster()
        {
            return new string[] { "value1", "value2" };
        }
        [HttpGet, ActionName("VegMaster")]
        public IEnumerable<string> GetVegMaster()
        {
            return new string[] { "value1", "value2" };
        }
       
      
    }
}
