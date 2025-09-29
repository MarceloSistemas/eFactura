using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;

namespace eFactura.Core.Helpers
{
    class EmailHelper
    {
        public static void SendFailNotification(string sOperation, Exception exc)
        {
            SendMail("[FAIL] " + sOperation, LoggerHelper.GetExcepcionMessage(exc), "");
        }

        public static void SendMail(string sSubject, string sBody, string sNotificationRecipients)
        {
            try
            {
                sBody = sBody.Replace(Environment.NewLine, "<br/>");
                System.Net.Mail.MailMessage mailNotification = new System.Net.Mail.MailMessage();
                mailNotification.From = new System.Net.Mail.MailAddress(Parametros.GetParameter("MailSenderAddress"), Parametros.GetParameter("MailSenderDisplayName"));

                if (sNotificationRecipients.Contains(";"))
                {
                    string[] arrNotificationRecipients = sNotificationRecipients.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string sNotificationRecipient in arrNotificationRecipients)
                    {
                        if (sNotificationRecipient.Trim() != "")
                            mailNotification.Bcc.Add(sNotificationRecipient.Trim());
                    }
                }
                else
                {
                    mailNotification.To.Add(sNotificationRecipients);
                }

                mailNotification.Subject = sSubject;

                mailNotification.Body = sBody;
                mailNotification.IsBodyHtml = true;

                System.Net.Mail.SmtpClient MailClient =
                    new System.Net.Mail.SmtpClient(Parametros.GetParameter("MailServerName"));
                MailClient.UseDefaultCredentials = false;
                MailClient.Credentials = new System.Net.NetworkCredential(Parametros.GetParameter("MailSenderUser"), Parametros.GetParameter("MailSenderPassword"));

                MailClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                MailClient.Timeout = 300000;

                MailClient.Port = int.Parse(Parametros.GetParameter("MailServerPort"));
                MailClient.EnableSsl = (Parametros.GetParameter("MailServerSSL") == "1");

                MailClient.Send(mailNotification);

            }
            catch(Exception exc)
            {
                Helpers.LoggerHelper.LogException(exc);
            }
        }
    }
}
