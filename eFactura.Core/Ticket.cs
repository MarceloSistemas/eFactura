using System;
using System.Collections.Generic;
using System.Text;
using ASF.Dal;
using System.Data;

namespace eFactura.Core
{
    class Ticket
    {
        public string Token {get; private set;}
        public string Sign { get; private set; }
        public DateTime Expired { get; private set; }

        private Ticket() : this(DateTime.MinValue, string.Empty, string.Empty)
        {
        }

        private Ticket(DateTime Expired, string Token, string Sign)
        {
            this.Token = Token;
            this.Sign = Sign;
            this.Expired = Expired;
        }

        public static Ticket Get(int EMPRESA_ID)
        {
            using (ASF.Dal.DataAccess dal = new DataAccess())
            {
                DataSet ds = dal.ExecuteDataSet(System.Data.CommandType.StoredProcedure, "TICKET_GET", new object[] { EMPRESA_ID });
                if (ds.Tables[0].Rows.Count == 0 || ds.Tables[0].Rows[0][0] is DBNull)
                    return new Ticket();
                return new Ticket((DateTime)ds.Tables[0].Rows[0][0], ds.Tables[0].Rows[0][1].ToString(), ds.Tables[0].Rows[0][2].ToString());
            }
        }

        public static Ticket Set(int EMPRESA_ID, DateTime TTL, string Token, string Sign)
        {
            using (ASF.Dal.DataAccess dal = new DataAccess())
            {
                dal.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "TICKET_SET", new object[] { EMPRESA_ID, TTL, Token, Sign });
            }
            return new Ticket(TTL, Token, Sign);
        }
    }
}
