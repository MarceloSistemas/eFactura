using System;
using System.Collections.Generic;
using System.Text;
using ASF.Dal;

namespace eFactura.Core
{
    class Parametros
    {
        public static string GetParameter(string PARAMETRO_ID)
        {
            string result = string.Empty;
            using (ASF.Dal.DataAccess dal1 = new DataAccess())
            {
                return dal1.ExecuteScalar(System.Data.CommandType.StoredProcedure, "PARAMETRO_GET", new object[] { PARAMETRO_ID }).ToString();
            }
        }

        public int SetParameter(string PARAMETRO_ID, string valor)
        {
            try{
            using (ASF.Dal.DataAccess dal1 = new DataAccess())
            {
                return dal1.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "PARAMETRO_UPDT", new object[] { PARAMETRO_ID, valor });
                ;
            }
                }
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("Error en SetParameter: ", ex);
                Console.WriteLine("Error en SetParameter: " + ex.Message);
                Console.WriteLine("Lugar: " + ex.InnerException);
                return 0;
            }
        }

    }
}
