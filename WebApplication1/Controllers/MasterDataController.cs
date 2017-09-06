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
    public class MasterDataController : ApiController
    {
        // GET: api/MasterData
        [HttpGet, ActionName("AcceptMaster")]
        public IEnumerable<GetMasterData> GetAcceptMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetAcceptMaster");
        }
        [HttpGet, ActionName("CasteMaster")]
        public IEnumerable<GetMasterData> GetCasteMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetCasteMaster");
        }
        [HttpGet, ActionName("DrinkMaster")]
        public IEnumerable<GetMasterData> GetDrinkMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetDrinkMaster");
        }
        [HttpGet, ActionName("GenderMaster")]
        public IEnumerable<GetMasterData> GetGenderMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetGenderMaster");
        }
        [HttpGet, ActionName("JobMaster")]
        public IEnumerable<GetMasterData> GetJobMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetJobMaster");
        }
        [HttpGet, ActionName("LanguageMaster")]
        public IEnumerable<GetMasterData> GetLanguageMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetLanguageMaster");
        }

        [HttpGet, ActionName("MaritialStatusMaster")]
        public IEnumerable<GetMasterData> GetMaritialStatusMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetMaritialStatusMaster");
        }
        [HttpGet, ActionName("ProfileCreatedByMaster")]
        public IEnumerable<GetMasterData> GetProfileCreatedByMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetProfileCreatedByMaster");
        }
        [HttpGet, ActionName("RashiMaster")]
        public IEnumerable<GetMasterData> GetRashiMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetRashiMaster");
        }

        [HttpGet, ActionName("ReligionMaster")]
        public IEnumerable<GetMasterData> GetReligionMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetReligionMaster");
        }
        [HttpGet, ActionName("SalaryMaster")]
        public IEnumerable<GetMasterData> GetSalaryMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetSalaryMaster");
        }
        [HttpGet, ActionName("SmokingMaster")]
        public IEnumerable<GetMasterData> GetSmokingMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetSmokingMaster");
        }

        [HttpGet, ActionName("StateMaster")]
        public IEnumerable<GetMasterData> GetStateMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetStateMaster");
        }
        [HttpGet, ActionName("VegMaster")]
        public IEnumerable<GetMasterData> GetVegMaster(string userd)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userd, "GetVegMaster");
        }


    }
}
