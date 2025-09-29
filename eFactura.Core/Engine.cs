using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;
using Newtonsoft;
using System.Linq;

namespace eFactura.Core
{
    public class Engine
    {

        public void Execute()
        {

            try
            {
                Process();

            }
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("Error en eFactura.Core / Engine / Execute: ", ex);
                Console.WriteLine("Error en eFactura.Core / Engine / Execute: " + ex.Message);
                Console.WriteLine("Lugar: " + ex.InnerException);
            }

        }

        private void Process()
        {

            try
            {
                DocumentoRecord tables = new DocumentoRecord();
                ASF.Dal.DataAccess dal = new ASF.Dal.DataAccess();
                dal.FillDataSet(System.Data.CommandType.StoredProcedure, "PROCESS_GET", tables);
                dal.Dispose();
                dal = null;

                foreach (DocumentoRecord.DOCUMENTOSRow row in tables.DOCUMENTOS.Rows)
                {
                    if (CheckDocumentSequence(row))
                    {
                        string nota, cae, caeFchVto, errorMsg;
                        string documentID = row.DOCUMENTO_ID;
                        DocumentoRecord.EMPRESASRow[] empresas =
                            (DocumentoRecord.EMPRESASRow[])tables.EMPRESAS.Select("EMPRESA_ID = '" + row.EMPRESA_ID + "'");
                        if (empresas.Length == 0)
                        {
                            row.ESTADO_ID = "F";
                            row.NOTAS = "EMPRESA_MISSING_DATA";
                            row.Error = "EMPRESA_MISSING_DATA";
                        }
                        else
                        {
                            AfipConnector afipConnector = AfipConnector.GetInstance(empresas[0]);
                            Console.WriteLine("afipConnector.FECAECabRequest");
                            row.ESTADO_ID = afipConnector.FECAECabRequest(documentID, tables, out nota, out cae, out caeFchVto, out errorMsg);
                            Console.WriteLine("AFIP: documentID / CAE / caeFchVto /errorMsg: " + documentID + " / " + cae + " / " + caeFchVto + " / " + errorMsg);
                            Helpers.LoggerHelper.Log("Afip", "AFIP: Doc/CAE/Vto/error: " + documentID + "/" + cae + "/" + caeFchVto + "/" + errorMsg);
                            row.NOTAS = nota;
                            row.CAE = cae;
                            row.CAEFchVto = caeFchVto;
                            row.Error = errorMsg;
                        }
                    }
                    else
                    {
                        row.ESTADO_ID = "S";
                        row.NOTAS = "SEQUENCE_INCORRECT";
                        row.Error = "SEQUENCE_INCORRECT";
                        // PK 09/09/2019 fuerzo los valores null a cero/blanco
                        if (row.IsNull("EMPRESA_ID")) row.EMPRESA_ID = 0;
                        if (row.IsNull("DOCUMENTO_ID")) row.DOCUMENTO_ID = "";
                        if (row.IsNull("ESTADO_ID")) row.ESTADO_ID = "";
                        if (row.IsNull("NOTAS")) row.NOTAS = "";
                        if (row.IsNull("CAE")) row.CAE = "";
                        if (row.IsNull("CAEFchVto")) row.CAEFchVto = "";
                        if (row.IsNull("Error")) row.Error = "";
                    }
                    ActualizarEstado(row);
                }
            }
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("Error en eFactura.Core/Engine/Execute/Process: " + ex.Message + "Linea: " + ex.InnerException, ex);
                Console.WriteLine("--Error en Process: --" + ex.Message);
                Console.WriteLine("--Linea del Error:  --" + ex.InnerException);
            }
        }

        public void ActualizarEstado(DocumentoRecord.DOCUMENTOSRow row)
        {
            try
            {
                using (ASF.Dal.DataAccess dal = new ASF.Dal.DataAccess())
                {
                    object[] paramters = new object[]{
                            row.EMPRESA_ID, row.DOCUMENTO_ID, row.ESTADO_ID, row.NOTAS, row.CAE,row.CAEFchVto, row.Error};
                    dal.ExecuteNonQuery(CommandType.StoredProcedure, "DOCUMENTO_ESTADO_SET", paramters);
                }
            }
            catch (Exception exc)
            {
                Console.WriteLine("Error en ActualizarEstado: " + exc.Message);
                Helpers.LoggerHelper.LogException("Error en eFactura.Core / Engine / Execute /ActualizarEstado: ", exc);
                Helpers.EmailHelper.SendFailNotification("Error en ActualizarEstado: ", exc);
            }
        }

        private bool CheckDocumentSequence(DocumentoRecord.DOCUMENTOSRow row)
        {
            try
            {
                bool result = true;

                int empresaID = row.EMPRESA_ID;
                int ptoVta = row.PtoVta;
                int cbteTipo = row.CbteTipo;
                int cbteNro = row.CbteNro;
                result = PuntoDeVenta.IsExpectedDocumentToSend(empresaID, ptoVta, cbteTipo, cbteNro);
                return result;
            }
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("Error en CheckDocumentSequence", ex);
                throw ex;
            }

        }

        // PK - Actualiza el estado de las facturas FCE consultandolo en  AFIP
        public void ActualizarEstadoFacturasFCE(ASF.Dal.DataAccess objDalJDE)
        {
            try
            {

                int horaIni = int.Parse(Parametros.GetParameter("INI_BATCH_CONSULTA_FCE_HORA"));
                int horaFin = int.Parse(Parametros.GetParameter("FIN_BATCH_CONSULTA_FCE_HORA"));
                int minIni = int.Parse(Parametros.GetParameter("INI_BATCH_CONSULTA_FCE_MINUTO"));
                int minFin = int.Parse(Parametros.GetParameter("FIN_BATCH_CONSULTA_FCE_MINUTO"));
                string corriendo = ((Parametros.GetParameter("FLAG_BATCH_CONSULTA_CORRIENDO")).Trim()).Substring(0, 1);
                string forzar = ((Parametros.GetParameter("FORZAR_BATCH_CONSULTA_FCE")).Trim()).Substring(0, 1);
                int horaActual = System.DateTime.Now.Hour;
                int minutoActual = System.DateTime.Now.Minute;

                if (forzar == "S" ||
                       (corriendo == "N" &&
                           (horaActual >= horaIni && horaActual <= horaFin) &&
                           (minutoActual >= minIni && minutoActual <= minFin)))
                {

                    Parametros param = new Parametros();
                    param.SetParameter("FLAG_BATCH_CONSULTA_CORRIENDO", "S");
                    DocumentoRecord tables = new DocumentoRecord();
                    ASF.Dal.DataAccess dal = new ASF.Dal.DataAccess();
                    dal.FillDataSet(System.Data.CommandType.StoredProcedure, "DOCSFCE_GET", tables);
                    Helpers.LoggerHelper.Log("Debug", "--INI Batch estados FCE- Cantidad Docs:" + tables.DOCUMENTOS.Rows.Count.ToString());

                    foreach (DocumentoRecord.DOCUMENTOSRow row in tables.DOCUMENTOS.Rows)
                    {

                        DocumentoRecord.EMPRESASRow[] empresas = (DocumentoRecord.EMPRESASRow[])tables.EMPRESAS.Select("EMPRESA_ID = '" + row.EMPRESA_ID + "'");
                        AfipConnector afipConnector = new AfipConnector(empresas[0]);
                        AFIP.FECRED.IdComprobanteType idComprobante = new AFIP.FECRED.IdComprobanteType();
                        idComprobante.CUITEmisor = empresas[0].CUIT;
                        idComprobante.codTipoCmp = (short)row.CbteTipo;
                        idComprobante.ptoVta = row.PtoVta;
                        idComprobante.nroCmp = row.CbteNro;

                        AFIP.FECRED.ConsultarHistorialEstadosComprobanteReturnType historia = afipConnector.consultarHistorialEstadosComprobante(idComprobante);


                        if (historia.arrayHistorialEstados != null)
                        {
                            // MA 04/10 
                            var listaEstados = new List<estado>();
                            for (var ix = 0; ix < historia.arrayHistorialEstados.Length; ix++)
                            {
                                var ss = new estado();
                                ss.codigo = historia.arrayHistorialEstados[ix].estado.ToString();
                                ss.fecha = historia.arrayHistorialEstados[ix].fechaHoraEstado.ToString("yyyyMMddHHmmss");
                                listaEstados.Add(ss);
                            }
                            var last = (from l in listaEstados orderby l.fecha descending select l).ToList().First();
                            string ultimoEstado = last.codigo.ToString();
                            string ultimoEstadoLetra = "";

                            switch ((ultimoEstado.Trim()).Substring(0, 4))
                            {
                                case "Pend":
                                    ultimoEstadoLetra = "P";
                                    break;
                                case "Rece":
                                    ultimoEstadoLetra = "C";
                                    break;
                                case "Rech":
                                    ultimoEstadoLetra = "R";
                                    break;
                                case "Acep":
                                    ultimoEstadoLetra = "A";
                                    break;
                                case "Info":
                                    ultimoEstadoLetra = "I";
                                    break;

                                default:
                                    ultimoEstadoLetra = "P";
                                    break;
                            }

                            object[] paramters = new object[]{
                            row.DOCUMENTO_ID, ultimoEstadoLetra};
                            dal.ExecuteNonQuery(CommandType.StoredProcedure, "DOCUMENTOS_UPDT2", paramters);
                            
                            String strUpdate = String.Format("update proddta.f56BEJFEL set estadoafip= '{3}' where cbteTipo = {0} and PtoVta = {1} and CbteNro = {2}", row.CbteTipo, row.PtoVta, row.CbteNro, ultimoEstadoLetra);
                            try
                            {
                                objDalJDE.ExecuteNonQuery(CommandType.Text, strUpdate);
                            }
                            catch (Exception ex0)
                            {
                                Console.WriteLine("Error en: Actualizar tabla JDE con estado FCE Afip: " + strUpdate + "CbteTipo PtoVta CbteNro ultimoEstadoLetra" + row.CbteTipo + row.PtoVta + row.CbteNro + ultimoEstadoLetra + ex0.Message);
                                Helpers.LoggerHelper.LogException("Error en: Actualizar tabla JDE con estado FCE Afip: " + strUpdate + "CbteTipo PtoVta CbteNro ultimoEstadoLetra" + row.CbteTipo + row.PtoVta + row.CbteNro + ultimoEstadoLetra, ex0);
                            }

                        }
                    }
                    param.SetParameter("FLAG_BATCH_CONSULTA_CORRIENDO", "N");
                    Helpers.LoggerHelper.Log("Debug", "--FIN Batch estados FCE-");

                    dal.Dispose();
                    dal = null;
                }
            }
            catch (Exception ex)
            {
                Parametros param = new Parametros();
                param.SetParameter("FLAG_BATCH_CONSULTA_CORRIENDO", "N");
                Helpers.LoggerHelper.Log("Debug", "--FIN Batch estados FCE CON ERROR-");
                Helpers.LoggerHelper.LogException("Error en eFactura.Core / Engine / ActualizarEstadoFacturasFCE: ", ex);
                Console.WriteLine("Error en eFactura.Core / Engine / ActualizarEstadoFacturasFCE: " + ex.Message);
                Console.WriteLine("Lugar: " + ex.InnerException);
                
            }

        }
    }


    public class estado
    {
        public string codigo { get; set; }
        public string fecha { get; set; }
    }
}
