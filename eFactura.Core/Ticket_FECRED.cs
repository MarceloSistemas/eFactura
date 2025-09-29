using System;
using System.Collections.Generic;
using System.Text;
using ASF.Dal;
using System.Data;

namespace eFactura.Core
{
    class Ticket_FECRED
    {
        public string Token {get; private set;}
        public string Sign { get; private set; }
        public DateTime Expired { get; private set; }

        private Ticket_FECRED() : this(DateTime.MinValue, string.Empty, string.Empty)
        {
        }

        private Ticket_FECRED(DateTime Expired, string Token, string Sign)
        {
            this.Token = Token;
            this.Sign = Sign;
            this.Expired = Expired;
        }

        public static Ticket_FECRED Get(int EMPRESA_ID)
        {
            using (ASF.Dal.DataAccess dal = new DataAccess())
            {
                DataSet ds = dal.ExecuteDataSet(System.Data.CommandType.StoredProcedure, "TICKET_GET_FECRED", new object[] { EMPRESA_ID });
                if (ds.Tables[0].Rows.Count == 0 || ds.Tables[0].Rows[0][0] is DBNull)
                    return new Ticket_FECRED();
                return new Ticket_FECRED((DateTime)ds.Tables[0].Rows[0][0], ds.Tables[0].Rows[0][1].ToString(), ds.Tables[0].Rows[0][2].ToString());
            }
        }

        public static Ticket_FECRED Set(int EMPRESA_ID, DateTime TTL, string Token, string Sign)
        {
            using (ASF.Dal.DataAccess dal = new DataAccess())
            {
                dal.ExecuteNonQuery(System.Data.CommandType.StoredProcedure, "TICKET_SET_FECRED", new object[] { EMPRESA_ID, TTL, Token, Sign });
            }
            return new Ticket_FECRED(TTL, Token, Sign);
        }
    }
}
