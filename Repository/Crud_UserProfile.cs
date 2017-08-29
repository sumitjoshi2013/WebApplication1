using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class Crud_UserProfile
    {
        public List<RegistrationModel> ReadAll(string conn)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                return db.Query<RegistrationModel>("Select * From Author").ToList();
            }
        }

        public int Insert(string conn, RegistrationModel registrationModel)
        {
            DateTime dt = DateTime.ParseExact(registrationModel.dob.date.day+"/"+ registrationModel.dob.date.month+"/"+ registrationModel.dob.date.year, "dd/MM/yyyy", CultureInfo.InvariantCulture);


            SqlHelper sqlHelper = new SqlHelper(conn);
            var para = new DynamicParameters();
            var outPut = new DynamicParameters();
           // para.Add("@Id", registrationModel. );
            para.Add("@F_NAME", registrationModel.firstName );
            para.Add("@L_NAME", registrationModel.lastName );
            para.Add("@M_NAME", "");
            para.Add("@COUNTRY_ID", registrationModel.country );
            para.Add("@CITY_ID", registrationModel.city );
            para.Add("@ADDRESS", registrationModel.address );
            para.Add("@E_MAIL", registrationModel.email );
            para.Add("@PASSWORD", registrationModel.password );
            para.Add("@DOB", dt);// registrationModel.dob.date );
            para.Add("@TIME", registrationModel.time.hh + ":" + registrationModel.time.min + ":" + registrationModel.time.sec );
            para.Add("@MY_RELIGION", registrationModel.religion );
            para.Add("@MY_MOTHER_TOUNG", registrationModel.mothertounge);
            para.Add("@MY_SUB_CASTE", registrationModel.mySubCaste );
            para.Add("@MY_RASHI", registrationModel.rashi );
            para.Add("@MY_GOTHRA", registrationModel.gotra );
            para.Add("@MY_NATIVE_PLACE", registrationModel.nativeplace );
            para.Add("@MY_HORO_MATCH", "" );
            para.Add("@MY_MANGLIK_STATUS", "" );
            para.Add("@PHONE_NO1", registrationModel.landline );
            para.Add("@PHONE_NO1_IDENTITY", "");
            para.Add("@SHOW_PHONE_NO1", "" );
            para.Add("@PHONE_NO2", registrationModel.landline );
            para.Add("@PHONE_NO2_IDENTITY", "" );
            para.Add("@SHOW_PHONE_NO2", "" );
            para.Add("@MOBILE_NO1", registrationModel.mobile );
            para.Add("@MOBILE_NO1_IDENTITY", "" );
            para.Add("@SHOW_MOBILE_NO1", "" );
            para.Add("@MARITIAL_STATUS", registrationModel.maritalstatus );
            para.Add("@ABOUT_ME", registrationModel.about );

            para.Add("@ABOUT_MY_FAMILY", "");
            para.Add("@ABOUT_MY_EDUCATION", registrationModel.education );
            para.Add("@ABOUT_MY_PROFESSION", registrationModel.profession );
            para.Add("@MY_FAMILY_VALUES", "" );
            para.Add("@MY_FAMILY_TYPE", "");
            para.Add("@MY_FAMILY_STATUS", "");
            para.Add("@MY_FATHER_STATUS", "");
            para.Add("@MY_MOTHER_STATUS", "");
            para.Add("@NO_OF_BROTHERS", "");
            para.Add("@MARRIED_BROTHERS", "");
            para.Add("@NO_OF_SISTERS", "");


            para.Add("@MARRIED_SISTERS", "" );
            para.Add("@MY_HIGHEST_DEGREE", registrationModel.education );
            para.Add("@MY_OCCUPTION", registrationModel.profession );
            para.Add("@CURRENCY_ID", "" );
            para.Add("@MY_MIN_INCOME", registrationModel.incomerange );
            para.Add("@MY_MAX_INCOME", registrationModel.incomerange );
            para.Add("@MY_WORK_STATUS", registrationModel.profession);
            para.Add("@DIET_STATUS", registrationModel.dietstatus );
            para.Add("@SMOKE_STATUS", registrationModel.smokestatus );
            para.Add("@DRINK_STATUS", registrationModel.drinkstatus );
            para.Add("@COMPLEXION_STATUS", "" );
            para.Add("@BODY_TYPE", "" );
            para.Add("@BLOOD_GROUP", "");
            para.Add("@HEIGHT", registrationModel.height );
            para.Add("@WEIGHT", registrationModel.weight);
            para.Add("@MY_PREFERED_DRESS", "");
            para.Add("@PHYSICAL_CHALLANGED_STATUS", "" );
            para.Add("@HIV_STATUS", "" );
            para.Add("@UPDATE_PROFILE_ID", "");
            para.Add("@CREATED_BY", "");
            para.Add("@MODIFIED_BY", "" );
            para.Add("@STATUS", 1);

           // para.Add("@Result", dbType: DbType.Int32, direction: ParameterDirection.Output, size: 3registrationModel. );

            sqlHelper.ExecuteSp("NewInsertCommand", para, null, true, null);
            //int valueout = para.Get<int>("@outresult");
            return 1;

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
        /*
        public RegistrationModel Find(int id, string conn)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
               // return db.Query<RegistrationModel>("Select * From Author " + WHERE Id = @Id", new { id }).SingleOrDefault();
            }

        }
        */

        public int Update(RegistrationModel registrationModel, string conn)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string sqlQuery = "UPDATE Author SET FirstName = @FirstName, " + " LastName = @LastName " + "WHERE Id = @Id";
                int rowsAffected = db.Execute(sqlQuery, registrationModel);
                return rowsAffected;
            }
        }

        public List<RegistrationModel> Read(string conn)
        {
            using (IDbConnection db = new SqlConnection(conn))
            {
                string readSp = "GetAllAuthors";
                return db.Query<RegistrationModel>(readSp, commandType: CommandType.StoredProcedure).ToList();
            }
        }
    }
}
