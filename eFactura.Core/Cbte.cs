using System;
using System.Collections.Generic;
using System.Text;

namespace eFactura.Core
{
    public class Cbte
    {
        public int PtoVta {get; set;}
        public int CbteTipo {get; set;}
        public int CbteNro { get; set; }

        public Cbte(int PtoVta, int CbteTipo, int CbteNro)
        {
            this.PtoVta = PtoVta;
            this.CbteTipo = CbteTipo;
            this.CbteNro = CbteNro;
        }
    }
}
