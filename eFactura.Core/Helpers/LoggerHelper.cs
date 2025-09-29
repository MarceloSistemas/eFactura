using System;
using System.Collections.Generic;
using System.Text;
using ASF.Dal;
using System.Data.SqlClient;
using System.IO;

namespace eFactura.Core.Helpers
{
    public class LoggerHelper
    {
        static public void LogException(Exception exc)
        {
            LogException(string.Empty, exc);
        }

        static public void LogException(string texto, Exception exc)
        {
            Log("Exception", ((texto == null || texto.Trim().Length == 0)?string.Empty:texto + Environment.NewLine) + GetExcepcionMessage(exc));
        }

        static public void Log(string tipo, string texto)
        {
            try
            {

                DataAccess objDataAccess = new DataAccess();

                try
                {

                    SqlParameter[] aryQueryParameters = new SqlParameter[2];

                    aryQueryParameters[0] = new SqlParameter("@TYPE_CD", tipo);

                    aryQueryParameters[1] = new SqlParameter("@ELEMENT_TEXT", texto);

                    objDataAccess.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "secLOG_INS", aryQueryParameters);
                }
                catch (Exception ex1)
                {
                    throw new Exception(texto);
                }
                finally
                {
                    if (objDataAccess != null)
                    {
                        objDataAccess.Dispose();
                        objDataAccess = null;
                    }
                }
            }
            catch (Exception ex2)
            {
                try
                {
                    string filename = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, @"logs\" + System.DateTime.Now.ToString("yyyyMMddHHmmssffff") + ".txt");
                    FileStream fs = File.Open(filename, FileMode.Create, FileAccess.ReadWrite);
                    StreamWriter writer = new StreamWriter(fs);
                    writer.Write("DB unavailable, logging to file. Error: " + GetExcepcionMessage(ex2));
                    writer.Close();
                    fs.Close();
                }
                catch
                {
                }
            }
        }

        public static string GetExcepcionMessage(Exception exc)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(exc.Message);
            if (exc.Source != null)
            {
                sb.AppendLine("Source: " + exc.Source);
            }
            if (exc.StackTrace != null)
            {
                sb.AppendLine("StackTrace: " + exc.StackTrace); 
            }

            if (exc.InnerException != null)
            {
                sb.AppendLine(GetExcepcionMessage(exc.InnerException));
            }
            return sb.ToString();
        }
    }
}
