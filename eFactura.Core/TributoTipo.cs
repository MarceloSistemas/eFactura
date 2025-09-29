using System;
using System.Collections.Generic;
using System.Text;

namespace eFactura.Core
{
    public class TributoTipo
    {
        public short ID;
        public string Descripcion;
        public string FechaDesde;
        public string FechaHasta;

        public TributoTipo(short id, string Descripcion, string fechaDesde, string fechaHasta)
        {
            this.ID = id;
            this.Descripcion = Descripcion;
            this.FechaDesde = fechaDesde;
            this.FechaHasta = fechaHasta;
        }

        public static List<TributoTipo> GetAll(int EMPRESA_ID)
        {
            return AfipConnector.GetInstance(EMPRESA_ID).FEParamGetTiposTributos();
        }
    }
}
