using System;
using System.Collections.Generic;
using System.Text;

namespace eFactura.Core
{
    class PuntoDeVenta
    {
        internal static bool IsExpectedDocumentToSend(int EMPRESA_ID, int ptoVta, int cbteTipo, int cbteNro)
        {
            ASF.Dal.DataAccess dal = new ASF.Dal.DataAccess();
            try
            {
                ASF.Dal.QueryParametersCollection parameters = new ASF.Dal.QueryParametersCollection();
                parameters.Add("@EMPRESA_ID", EMPRESA_ID);
                parameters.Add("@PtoVta", ptoVta);
                parameters.Add("@CbteTipo", cbteTipo);
                parameters.Add("@CbteNro", cbteNro);
                bool result = (bool)dal.ExecuteScalar(System.Data.CommandType.StoredProcedure, "PUNTO_VENTA_CONTROL_GET", parameters);

                return result;
            }
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("Error en IsExpectedDocumentToSend", ex);
                throw ex;
            }
            finally
            {
                dal.Dispose();
                dal = null;
            }
        }

        internal static void SetDocumentedSent(int EMPRESA_ID, int ptoVta, int cbteTipo, int cbteNro)
        {
            ASF.Dal.DataAccess dal = new ASF.Dal.DataAccess();
            try
            {
                //ASF.Dal.QueryParametersCollection parameters = new ASF.Dal.QueryParametersCollection();
                //parameters.Add("@EMPRESA_ID", EMPRESA_ID);
                //parameters.Add("@PtoVta", ptoVta);
                //parameters.Add("@CbteTipo", cbteTipo);
                //parameters.Add("@CbteNro", cbteNro);


                dal.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "PUNTO_VENTA_CONTROL_SET",new Object[]{EMPRESA_ID,ptoVta,cbteTipo,cbteNro});
            }
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("Error en SetDocumentedSent", ex);
                throw ex;
            }
            finally
            {
                dal.Dispose();
                dal = null;
            }
        }
    }
}
