using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace eFactura.Core
{
    public class JSonHelper
    {

        // PK 17/07 Conversiones y Validaciones JSon

        public static string Convert(string sInputJson)
        {
            try
            {
                Object obj = JsonConvert.DeserializeObject<Object>(sInputJson);
                return JsonConvert.SerializeObject(obj, Formatting.Indented);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public static Boolean Validate(string sInputJson)
        {
            try
            {
                Object obj = JsonConvert.DeserializeObject<Object>(sInputJson);
                string sOutputJson = JsonConvert.SerializeObject(obj, Formatting.Indented);
                return true;
            }
            catch
            {
                return false;
            }

        }

    }
}
