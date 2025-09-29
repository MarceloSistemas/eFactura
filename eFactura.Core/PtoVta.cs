using System;
using System.Collections.Generic;
using System.Text;

namespace eFactura.Core
{
    public class EstadoPtoVta
    {
        public short Nro { get; set; }
        public string EmisionTipo { get; set; }
        public string Bloqueado { get; set; }
        public string FchBaja { get; set; }
    }
}
