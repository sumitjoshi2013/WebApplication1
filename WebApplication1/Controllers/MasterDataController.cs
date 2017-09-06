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
        public IEnumerable<GetMasterData> GetAcceptMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetAcceptMaster");
        }
        [HttpGet, ActionName("CasteMaster")]
        public IEnumerable<GetMasterData> GetCasteMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetCasteMaster");
        }
        [HttpGet, ActionName("DrinkMaster")]
        public IEnumerable<GetMasterData> GetDrinkMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetDrinkMaster");
        }
        [HttpGet, ActionName("GenderMaster")]
        public IEnumerable<GetMasterData> GetGenderMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetGenderMaster");
        }
        [HttpGet, ActionName("JobMaster")]
        public IEnumerable<GetMasterData> GetJobMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetJobMaster");
        }
        [HttpGet, ActionName("LanguageMaster")]
        public IEnumerable<GetMasterData> GetLanguageMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetLanguageMaster");
        }

        [HttpGet, ActionName("MaritialStatusMaster")]
        public IEnumerable<GetMasterData> GetMaritialStatusMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetMaritialStatusMaster");
        }
        [HttpGet, ActionName("ProfileCreatedByMaster")]
        public IEnumerable<GetMasterData> GetProfileCreatedByMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetProfileCreatedByMaster");
        }
        [HttpGet, ActionName("RashiMaster")]
        public IEnumerable<GetMasterData> GetRashiMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetRashiMaster");
        }

        [HttpGet, ActionName("ReligionMaster")]
        public IEnumerable<GetMasterData> GetReligionMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetReligionMaster");
        }
        [HttpGet, ActionName("SalaryMaster")]
        public IEnumerable<GetMasterData> GetSalaryMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetSalaryMaster");
        }
        [HttpGet, ActionName("SmokingMaster")]
        public IEnumerable<GetMasterData> GetSmokingMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetSmokingMaster");
        }

        [HttpGet, ActionName("CityMaster")]
        public IEnumerable<GetMasterData> GetCityMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetStateMaster");
        }
        [HttpGet, ActionName("VegMaster")]
        public IEnumerable<GetMasterData> GetVegMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetVegMaster");
        }

        [HttpGet, ActionName("MotherToungeMaster")]
        public IEnumerable<GetMasterData> GetMotherToungeMaster(string userid)
        {

            string con = ConfigurationManager.ConnectionStrings["SqlServerConnString"].ConnectionString;
            Crud_UserProfile repository = new Crud_UserProfile();
            return repository.GetMasterData(con, userid, "GetMotherToungeMaster");
        }
    

    }
}
