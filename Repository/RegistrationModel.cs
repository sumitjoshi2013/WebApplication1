﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class dob
    {
        public date date { get; set; }

        public string jsdate { get; set; }
        public string formatted { get; set; }

        public string epoc { get; set; }

    }

    public class date
    {
        public int year { get; set; }
        public int month { get; set; }
        public int day { get; set; }

    }

    public class time
    {
        public int hh { get; set; }
        public int mim { get; set; }
        public int sec { get; set; }

    }

    public class RegistrationModel
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string landline { get; set; }
        public string phone { get; set; }
        public string gender { get; set; }
        public string maritalstatus { get; set; }
        public string gotra { get; set; }
        public dob dob { get; set; }
        public string birthplace { get; set; }
        public time time { get; set; }
        public string password { get; set; }
        public string confirmPassword { get; set; }
        public string height { get; set; }
        public string weight { get; set; }
        public string incomerange { get; set; }
        public string smokestatus { get; set; }
        public string dietstatus { get; set; }
        public string workstatus { get; set; }
        public string drinkstatus { get; set; }
        public string religion { get; set; }
        public string mothertounge { get; set; }
        public string rashi { get; set; }
        public string education { get; set; }
        public string profession { get; set; }
        public string address { get; set; }
        public string country { get; set; }
        public string city { get; set; }
        public string place { get; set; }
        public string zip { get; set; }
        public string about { get; set; }
        public string mySubCaste { get; set; }
        public string recaptcha { get; set; }

        public string JsonRawData { get; set; }

    }
}