using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace Repository
{
    public class Crud_UserProfile
    {
       
        public string InsertUserProfile(string conn, RegistrationModel registrationModel)
        {
            string msg = string.Empty;
            SqlHelper sqlHelper = new SqlHelper(conn);

            var para = new DynamicParameters();
            var outPut = new DynamicParameters();

            try
            {
                string dt = registrationModel.dob.formatted;
                para.Add("@F_NAME", registrationModel.firstName);
                para.Add("@L_NAME", registrationModel.lastName);
                para.Add("@COUNTRY_ID", registrationModel.country);
                para.Add("@CITY_ID", registrationModel.city);
                para.Add("@ADDRESS", registrationModel.address);
                para.Add("@E_MAIL", registrationModel.email);
                para.Add("@PASSWORD", registrationModel.password);
                para.Add("@DOB", dt);// registrationModel.dob.date );
                para.Add("@TIME", registrationModel.time.hh + ":" + registrationModel.time.min + ":" + registrationModel.time.sec);
                para.Add("@MY_RELIGION", registrationModel.religion);
                para.Add("@MY_MOTHER_TOUNG", registrationModel.mothertounge);
                para.Add("@MY_SUB_CASTE", registrationModel.mySubCaste);
                para.Add("@MY_RASHI", registrationModel.rashi);
                para.Add("@MY_GOTHRA", registrationModel.gotra);
                para.Add("@MY_NATIVE_PLACE", registrationModel.nativeplace);
                para.Add("@PHONE_NO1", registrationModel.landline);
                para.Add("@PHONE_NO2", registrationModel.landline);
                para.Add("@MOBILE_NO1", registrationModel.mobile);
                para.Add("@MARITIAL_STATUS", registrationModel.maritalstatus);
                para.Add("@ABOUT_ME", registrationModel.about);
                para.Add("@ABOUT_MY_EDUCATION", registrationModel.education);
                para.Add("@ABOUT_MY_PROFESSION", registrationModel.profession);
                para.Add("@MY_HIGHEST_DEGREE", registrationModel.education);
                para.Add("@MY_MIN_INCOME", registrationModel.incomerange);
                para.Add("@MY_MAX_INCOME", registrationModel.incomerange);
                para.Add("@MY_WORK_STATUS", registrationModel.workstatus);
                para.Add("@DIET_STATUS", registrationModel.dietstatus);
                para.Add("@SMOKE_STATUS", registrationModel.smokestatus);
                para.Add("@DRINK_STATUS", registrationModel.drinkstatus);
                para.Add("@HEIGHT", registrationModel.height);
                para.Add("@WEIGHT", registrationModel.weight);
                para.Add("@UPDATE_PROFILE_ID", "");
                para.Add("@CREATED_BY", "");
                para.Add("@MODIFIED_BY", "");
                para.Add("@STATUS", 1);
                para.Add("@GENDER", registrationModel.gender);
                
                var json = new JavaScriptSerializer().Serialize(registrationModel);
                para.Add("@JSONObject", json);
            }
            catch (Exception exp)
            {
                msg = "Error :" + exp.Message;
            }
            try
            {
                sqlHelper.ExecuteSp("InsertProfile", para, null, true, null);
                msg = "Successfully Inserted Data.";
            }
            catch (Exception exp)
            {
                msg = "Error :" + exp.Message;
            }
            //int valueout = para.Get<int>("@outresult");
            return msg;
        }
    
        public List<UserProfile> GetProfiles(string conn, string emailid)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetProfiles";
                var para = new DynamicParameters();
                para.Add("@emailid", emailid);
                var data = db.Query<UserProfile>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }

        public List<GetShowInterestModel> GetInterestShownProfiles(string conn, string emailId)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetInterestedProfilesByEmailId";
                var para = new DynamicParameters();
                para.Add("@E_MAIL", emailId);
                var data = db.Query<GetShowInterestModel>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }
        public List<GetShowInterestModel> GetCountOfPendingResponseByEmailId(string conn, string emailId)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetCountOfPendingResponseByEmailId";
                var para = new DynamicParameters();
                para.Add("@E_MAIL", emailId);
                var data = db.Query<GetShowInterestModel>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }

        
        public GetUserRequestsModel GetUserRequestsCounts(string conn, string emailId)
        {
            GetUserRequestsModel getUserRequestsModel = new GetUserRequestsModel();
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetUserRequestsCounts";
                var para = new DynamicParameters();
                para.Add("@E_MAIL", emailId);
                using (var multi = db.QueryMultiple(readSp, para, commandType: CommandType.StoredProcedure))
                {
                    getUserRequestsModel.TotalRequestSendCount = multi.Read<int>().Single();
                    getUserRequestsModel.TotalPendingResponseCount = multi.Read<int>().Single();
                    getUserRequestsModel.TotalRequestReceivedCount= multi.Read<int>().Single();
                    getUserRequestsModel.TotalRequestRejectCount = multi.Read<int>().Single();
                }

               // var data = db.Query<GetUserRequestsModel>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return getUserRequestsModel;
            }
        }
        
        public List<GetMasterData> GetMasterData(string conn, string userid, string readSp)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                var data = db.Query<GetMasterData>(readSp, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }

        public List<UserProfile> GetShowUserProfiles(string conn, string userid)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetProfileDetails";
                var para = new DynamicParameters();
                para.Add("@USER_ID", userid);
                var data = db.Query<UserProfile>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }


        public UserProfile GetShowUserProfileByUniqueId(string conn, string userid)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetProfileDetailByUniqueId";
                var para = new DynamicParameters();
                para.Add("@User_Id", userid);
                var data = db.Query<UserProfile>(readSp, para, commandType: CommandType.StoredProcedure).SingleOrDefault();
                return data;
            }
        }

        public List<GetUserMessages> ShowInterest(string conn, string ResponderEmailId)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetShowInterest";
                var para = new DynamicParameters();
                para.Add("@ResponderEmailId", ResponderEmailId);
               // para.Add("@MessageStatusId", MessageStatusId.ToString());
                var data = db.Query<GetUserMessages>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }


        public List<GetUserMessages> GetUserMessages(string conn, string ResponderEmailId)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetUserMessage";
                var para = new DynamicParameters();
                para.Add("@ResponderEmailId", ResponderEmailId);
                // para.Add("@MessageStatusId", MessageStatusId.ToString());
                var data = db.Query<GetUserMessages>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }

        public List<GetUserMessages> GetUserLogReqSendMessages(string conn, string ResponderEmailId)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetUserLogReqSendMessages";
                var para = new DynamicParameters();
                para.Add("@ResponderEmailId", ResponderEmailId);
                // para.Add("@MessageStatusId", MessageStatusId.ToString());
                var data = db.Query<GetUserMessages>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }


        public List<GetUserMessages> GetUserLogReqReceivedMessages(string conn, string ResponderEmailId)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetUserLogReqReceivedMessages";
                var para = new DynamicParameters();
                para.Add("@ResponderEmailId", ResponderEmailId);
                // para.Add("@MessageStatusId", MessageStatusId.ToString());
                var data = db.Query<GetUserMessages>(readSp, para, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }

        public List<GetMasterData> GetMasterData(string conn)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetMasterData";
                var data = db.Query<GetMasterData>(readSp, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }

        public GetRegistrationModel GetProfileById(string conn, string Id)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetProfileById";
                var para = new DynamicParameters();
                para.Add("@USER_PEROFILE_ID", Id);
                var data = db.Query<GetRegistrationModel>(readSp, para, commandType: CommandType.StoredProcedure).SingleOrDefault();
                return data;
            }
        }

        public GetLoginInfo GetUserLoginInfo(string conn, string uid, string pwd)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetLogin";
                var para = new DynamicParameters();
                para.Add("@UK_useremailid", uid);
                para.Add("@UK_PASSWORD", pwd);
                var data = db.Query<GetLoginInfo>(readSp, para, commandType: CommandType.StoredProcedure).SingleOrDefault();
                return data;
            }
        }


        public string InsertUserProfilePics(string conn, UserPics userPics)
        {
            string msg = string.Empty;
            SqlHelper sqlHelper = new SqlHelper(conn);
            var para = new DynamicParameters();
            var outPut = new DynamicParameters();
            try
            {
                para.Add("@USER_ID", userPics.USER_ID);
                para.Add("@PicName", userPics.PicName);
                para.Add("@PicFolderPath", userPics.PicFolderPath);
                para.Add("@PicFilePath", userPics.PicFilePath);
                para.Add("@CREATED_BY", userPics.CreatedBy);
                var json = new JavaScriptSerializer().Serialize(userPics);
                para.Add("@JsonRawData", json);
            }
            catch (Exception exp)
            {
                msg = "Error :" + exp.Message;
            }
            try
            {
                sqlHelper.ExecuteSp("InsertUserPics", para, null, true, null);
                msg = "Successfully Inserted Pics.";
            }
            catch (Exception exp)
            {
                msg = "Error :" + exp.Message;
            }
            //int valueout = para.Get<int>("@outresult");
            return msg;
        }
    }
}

//Test Json
/*

    {
"firstName": "sumit",
"lastName": "joshi",
"landline": "01127850127",
"gender": "Married",
"maritalstatus": "D",
"gotra": "Kaushik",
"dob": {
"date": {
             "year" : "2017",
             "month"  : "12", 
             "day" : "24"
         },
"jsdate": "",
"formatted": "",
"epoc" :""
},
"time": {
"hh": "12",
"min": "1",
"sec": "49"
},
"birthplace": "Delhi",
"email": "a113812@a.com",
"password": "12234",
"confirmPassword": "",
"height": "5.7",
"weight": "84",
"incomerange": "10000-20000",
"smokestatus": "Yes",
"dietstatus": "Veg",
"workstatus": "job",
"drinkstatus": "No",
"religion": "Hindu",
"mothertounge": "Hindi",
"rashi": "5",
"education": "MBA",
"profession": "Job",
"address": "Roihini",
"country": "india",
"city": "delhi",
"place": "delhi",
"zip": "110089",
"about": "about me",
"mySubCaste": "joshi",
"recaptcha": "",
"mobile":"9650899699"
}
*/
