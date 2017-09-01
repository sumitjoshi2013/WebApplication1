using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

/*
 * 
    Yahoo!	smtp.mail.yahoo.com	587	Yes
    GMail	smtp.gmail.com	587	Yes
    Hotmail	smtp.live.com	587	Yes
 * 
 */

namespace Repository
{
    public static class Utility
    {
        public static void MailSend(string emailTo, string subject, string body)
        {
            string smtpAddress = "smtp.mail.yahoo.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "email@yahoo.com";
            string password = "abcdefg";
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                // Can set to false, if you are sending pure text.

             //   mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
             //   mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }


        }
    }
}
