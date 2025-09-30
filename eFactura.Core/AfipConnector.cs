using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Newtonsoft.Json;


namespace eFactura.Core
{
    public class AfipConnector
    {
        public AfipConnector(DocumentoRecord.EMPRESASRow empresa)
        {
            this.empresa = empresa;
        }

        private DocumentoRecord.EMPRESASRow empresa;
        private Ticket memoryCacheTicket = null;
        private Ticket_FECRED memoryCacheTicket_FECRED = null;

        private Ticket GetTicket()
        {
            lock (this)
            {
                if (memoryCacheTicket == null || memoryCacheTicket.Expired < DateTime.Now)
                {
                    memoryCacheTicket = Ticket.Get(empresa.EMPRESA_ID);

                    if (memoryCacheTicket.Expired < DateTime.Now)
                    {
                        try
                        {
                            AFIP.LoginTicket loginTicket = new eFactura.Core.AFIP.LoginTicket();
                            loginTicket.ObtenerLoginTicketResponse("wsfe", empresa.URL_AFIP_WSAA, empresa.RUTA_ARCHIVO_CERTIFICADO, empresa.PASSWORD, false);
                            //ticket.ObtenerLoginTicketResponse("wsmtxca", empresa.URL_AFIP_WSAA, empresa.RUTA_ARCHIVO_CERTIFICADO, empresa.PASSWORD, false);
                            memoryCacheTicket = Ticket.Set(empresa.EMPRESA_ID, DateTime.Now.AddHours(11).AddMinutes(30), loginTicket.Token, loginTicket.Sign);
                        }
                        catch (Exception exc)
                        {
                            Helpers.LoggerHelper.LogException("GetTicket - AFIP CONNECTOR: ", exc);
                            throw exc;
                        }
                    }
                }
            }
            return memoryCacheTicket;
        }

        // PK 16/07
        private Ticket_FECRED GetTicket_FECRED()
        {
            lock (this)
            {
                if (memoryCacheTicket_FECRED == null || memoryCacheTicket_FECRED.Expired < DateTime.Now)
                {
                    memoryCacheTicket_FECRED = Ticket_FECRED.Get(empresa.EMPRESA_ID);

                    if (memoryCacheTicket_FECRED.Expired < DateTime.Now)
                    {
                        try
                        {

                            /* Documentación extraida de "Manual_Desarrollador_WSFECRED_v1.0.3-rc1.pdf"
                            * Se validará en todos los casos que la CUIT solicitante se encuentre entre sus representados. 
                            * El Token y el Sign remitidos deberán ser válidos y no estar vencidos.
                            * De no superarse algunas de las situaciones descriptas anteriormente retornará un error del tipo excepcional.
                            * Recordar que para poder consumir el WSAA es necesario obtener un certificado digital desde clave fiscal, 
                            * y asociarlo al ws “Web Service Registro de Facturas de Crédito Electrónica MiPyMEs ”.
                            * Al momento de solicitar un Ticket de Acceso por medio del WSAA tener en cuenta que debe enviar 
                            * el tag service con el valor "wsfecred".
                            * Para más información deberá redirigirse a los manuales www.afip.gob.ar/ws.
                            */

                            AFIP.LoginTicket loginTicket = new eFactura.Core.AFIP.LoginTicket();
                            // PK 15/07 
                            loginTicket.ObtenerLoginTicketResponse("wsfecred", empresa.URL_AFIP_WSAA, empresa.RUTA_ARCHIVO_CERTIFICADO, empresa.PASSWORD, false);
                            memoryCacheTicket_FECRED = Ticket_FECRED.Set(empresa.EMPRESA_ID, DateTime.Now.AddHours(11).AddMinutes(30), loginTicket.Token, loginTicket.Sign);
                        }
                        catch (Exception exc)
                        {
                            Helpers.LoggerHelper.LogException("GetTicket_FECRED - AFIP CONNECTOR FECRED: ", exc);
                            throw exc;
                        }
                    }
                }
            }
            return memoryCacheTicket_FECRED;
        }

        // PK 15/07
        private AFIP.FECRED.AuthRequestType GetFECREDAuthRequest()
        {
            AFIP.FECRED.AuthRequestType result = new AFIP.FECRED.AuthRequestType();
            Ticket_FECRED ticket = GetTicket_FECRED();
            result.token = ticket.Token;
            result.sign = ticket.Sign;
            result.cuitRepresentada = empresa.CUIT;
            return result;
        }

        private AFIP.WSFEv1.FEAuthRequest GetFEAuthRequest()
        {

            AFIP.WSFEv1.FEAuthRequest result = new eFactura.Core.AFIP.WSFEv1.FEAuthRequest();
            Ticket ticket = GetTicket();
            result.Token = ticket.Token;
            result.Sign = ticket.Sign;
            result.Cuit = empresa.CUIT;
            return result;
        }

        private bool ResultadoExitoso(AFIP.WSFEv1.FECAEResponse response)
        {
            return response.FeCabResp.Resultado == "A" && response.FeDetResp.Length > 0;
        }


        // PK 17/07 Clase para soportar los datos que se vayan agregando para FECRED y que aún no se conocen
        private class Info_Auxiliar
        {
            public string cbuId { get; set; }
            public string cbuValor { get; set; }
            public string cbuAliasId { get; set; }
            public string cbuAliasValor { get; set; }
        }


        /// <summary>
        /// Método de autorización de comprobantes electrónicos por CAE (FECAESolicitar)
        /// El cliente envía la información del comprobante/lote que desea autorizar mediante un requerimiento 
        /// el cual es atendido por WSFEv1 pudiendo producirse las siguientes situaciones: 
        /// 
        /// • Supere todas las validaciones, el comprobante es aprobado, se asigna el CAE y su respectiva fecha 
        /// de vencimiento, 
        /// 
        /// • No supera alguna de las validaciones no excluyentes, el comprobante es aprobado con observaciones, 
        /// se le asigna el CAE con la fecha de vencimiento, 
        /// 
        /// • No supere alguna de las validaciones excluyentes, el comprobante no es aprobado y la solicitud es 
        /// rechazada. 
        /// 
        /// Cabe aclarar que las validaciones excluyentes son aquellas que en el caso de no ser 
        /// superadas provocan un rechazo y las validaciones no excluyentes aprueban la solicitud pero con 
        /// observaciones.
        /// </summary>
        /// <param name="documentId"></param>
        /// <param name="tables"></param>
        /// <param name="nota"></param>
        /// <param name="cae"></param>
        /// <returns></returns>
        public string FECAECabRequest(string documentId, DocumentoRecord tables, out string nota, out string cae, out string CAEFchVto, out string ErrorMsg)
        {
            string result = string.Empty;
            cae = string.Empty;
            CAEFchVto = string.Empty;
            ErrorMsg = string.Empty;
            try
            {
                string filterExpression = "DOCUMENTO_ID = '" + documentId + "'";

                DocumentoRecord.DOCUMENTOSRow[] rowsCabecera =
                    (DocumentoRecord.DOCUMENTOSRow[])tables.DOCUMENTOS.Select(filterExpression);

                if (rowsCabecera.Length == 0)
                {
                    nota = "DOCUMENT_MISSING_DATA";
                    return "F";
                }

                DocumentoRecord.DOCUMENTOSRow rowCabecera = rowsCabecera[0];

                AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
                AFIP.WSFEv1.FECAERequest cmp = new eFactura.Core.AFIP.WSFEv1.FECAERequest();

                cmp.FeCabReq = new eFactura.Core.AFIP.WSFEv1.FECAECabRequest();
                cmp.FeCabReq.PtoVta = rowCabecera.PtoVta;
                cmp.FeCabReq.CbteTipo = rowCabecera.CbteTipo;
                cmp.FeCabReq.CantReg = 1;


                // PK 03/09 No viene más de la tabla empresa, se obtiene de la tabla JDE
                // --- PK 17/07 parse el campo info_auxilar formato json en la clase info_auxiliar
                // --- Info_Auxiliar objInfo_Auxiliar = Newtonsoft.Json.JsonConvert.DeserializeObject<Info_Auxiliar>empresa.INFO_AUXILIAR);


                AFIP.WSFEv1.FECAEDetRequest[] arrItems = new eFactura.Core.AFIP.WSFEv1.FECAEDetRequest[1];
                arrItems[0] = new AFIP.WSFEv1.FECAEDetRequest();
                arrItems[0].Concepto = rowCabecera.Concepto;
                arrItems[0].DocTipo = rowCabecera.DocTipo;
                arrItems[0].DocNro = rowCabecera.DocNro;
                arrItems[0].CbteDesde = rowCabecera.CbteNro;
                arrItems[0].CbteHasta = rowCabecera.CbteNro;
                arrItems[0].CbteFch = rowCabecera.CbteFecha;
                arrItems[0].ImpTotal = Math.Abs(rowCabecera.ImpTotal);
                arrItems[0].ImpTotConc = Math.Abs(rowCabecera.ImpTotConc);
                arrItems[0].ImpNeto = Math.Abs(rowCabecera.ImpNeto);
                arrItems[0].ImpOpEx = Math.Abs(rowCabecera.ImpOpEx);
                arrItems[0].ImpTrib = Math.Abs(rowCabecera.ImpTrib);
                arrItems[0].ImpIVA = Math.Abs(rowCabecera.ImpIva);
                arrItems[0].FchServDesde = rowCabecera.FchServDesde;
                arrItems[0].FchServHasta = rowCabecera.FchServHasta;
                arrItems[0].MonId = rowCabecera.MonId;
                arrItems[0].MonCotiz = rowCabecera.MonCotiz;
                //

                arrItems[0].monCotizField = rowCabecera.MonCotiz;

                if (arrItems[0].MonId != "PES")
                {
                    arrItems[0].CanMisMonExt = "N";
                }
                else
                {
                    arrItems[0].MonCotizSpecified = true;
                    //arrItems[0].CanMisMonExt = "S";
                }

                try
                    {
                        arrItems[0].CondicionIVAReceptorId = int.Parse(rowCabecera.Condiva);
                    }
                    catch
                    {
                        arrItems[0].CondicionIVAReceptorId = 1;
                    }




                // PK 18/9 -- Validaciones AFIP 
                // 10057 - De enviarse el tag CbtesAsoc debe enviarse Tipo mayor a 0
                // 10053 - El  campo Id en Opcionales es obligatorio  y debe ser alguno de los  devueltos por el metodo FEParamGetTiposOpcional
                // 10175 - El campo FchVtoPago no debe informarse si NO es Factura de Credito.
                // 10153 - Si es Factura de Credito, tipo de comprobante Debito o Credito, es oblitagorio informar Comprobantes Asociados.
                // 10151 - Si el tipo de comprobante que esta autorizando es MiPyMEs (FCE) del tipo Debito o Credito, el campo CbtesAsoc.Cuit debe informarlo.
                // 10155 - Factura de Credito, CUIT emisor del comprobante asociado no coincide con el cuit emisor del comprobante a autorizar.
                // 10172 - Si informa comprobante MiPyMEs (FCE), debito o credito, no informar CBU y ALIAS.
                // 10162 - Si el comprobante es MiPyMEs (FCE) es obligatorio informar opcionales. Ver metodo FEParamGetTiposOpcional()

                // SOLO si es FCE le sumo los campos nuevos.
                // PK 03/09 Nuevos campos que se obtienen de la tabla que viene de JDE para FCE
                // PK 18/09 mandar a afip campos ditontos según tipo de factura 
                if (rowCabecera.CbteTipo > 200)
                {
                    if (rowCabecera.CbteTipo == 201 || rowCabecera.CbteTipo == 206 || rowCabecera.CbteTipo == 211)
                    {
                        arrItems[0].FchVtoPago = rowCabecera.cbteFchVto;
                        arrItems[0].Opcionales = new AFIP.WSFEv1.Opcional[3];
                        arrItems[0].Opcionales[0] = new AFIP.WSFEv1.Opcional();
                        arrItems[0].Opcionales[1] = new AFIP.WSFEv1.Opcional();
                        arrItems[0].Opcionales[2] = new AFIP.WSFEv1.Opcional();
                        arrItems[0].Opcionales[0].Id = "2101";
                        arrItems[0].Opcionales[0].Valor = rowCabecera.cbu;
                        arrItems[0].Opcionales[1].Id = "2102";
                        arrItems[0].Opcionales[1].Valor = rowCabecera.aliasCbu;
                        arrItems[0].Opcionales[2].Id = "27";
                        arrItems[0].Opcionales[2].Valor = "SCA";
                    }
                    else
                    {

                        // PK 18/09 POR AHORA se fuerza una "N" pero este valor debe venir de la tabla JDE
                        arrItems[0].Opcionales = new AFIP.WSFEv1.Opcional[1];
                        arrItems[0].Opcionales[0] = new AFIP.WSFEv1.Opcional();
                        arrItems[0].Opcionales[0].Id = "22";

                        arrItems[0].Opcionales[0].Valor = "N";
                        try { arrItems[0].Opcionales[0].Valor = rowCabecera.anulacion; }
                        catch { arrItems[0].Opcionales[0].Valor = "N"; }

                        arrItems[0].CbtesAsoc = new AFIP.WSFEv1.CbteAsoc[1];
                        arrItems[0].CbtesAsoc[0] = new AFIP.WSFEv1.CbteAsoc();
                        arrItems[0].CbtesAsoc[0].Tipo = rowCabecera.rCbteTipo;
                        arrItems[0].CbtesAsoc[0].PtoVta = rowCabecera.rPtoVta;
                        arrItems[0].CbtesAsoc[0].Nro = rowCabecera.rCbteNro;
                        arrItems[0].CbtesAsoc[0].Cuit = empresa.CUIT.ToString();
                        arrItems[0].CbtesAsoc[0].CbteFch = rowCabecera.rCbteFech;
                    }
                }
                else // por el erro 10197
                {
                    if (rowCabecera.rCbteTipo != null && rowCabecera.rCbteTipo > 0)
                    {
                        arrItems[0].CbtesAsoc = new AFIP.WSFEv1.CbteAsoc[1];
                        arrItems[0].CbtesAsoc[0] = new AFIP.WSFEv1.CbteAsoc();
                        arrItems[0].CbtesAsoc[0].Tipo = rowCabecera.rCbteTipo;
                        arrItems[0].CbtesAsoc[0].PtoVta = rowCabecera.rPtoVta;
                        arrItems[0].CbtesAsoc[0].Nro = rowCabecera.rCbteNro;
                        arrItems[0].CbtesAsoc[0].Cuit = empresa.CUIT.ToString();
                        arrItems[0].CbtesAsoc[0].CbteFch = rowCabecera.rCbteFech;
                    }
                }

                DocumentoRecord.DOCUMENTO_IVARow[] rowsIVA = (DocumentoRecord.DOCUMENTO_IVARow[])tables.DOCUMENTO_IVA.Select(filterExpression);

                if (rowsIVA.Length > 0)
                {
                    AFIP.WSFEv1.AlicIva[] arrIVA = new eFactura.Core.AFIP.WSFEv1.AlicIva[rowsIVA.Length];
                    for (int i = 0; i < arrIVA.Length; i++)
                    {
                        arrIVA[i] = new AFIP.WSFEv1.AlicIva();
                        arrIVA[i].Id = rowsIVA[i].IvaTipo;
                        arrIVA[i].BaseImp = Math.Abs(rowsIVA[i].BaseImp);
                        arrIVA[i].Importe = Math.Abs(rowsIVA[i].Importe);
                    }
                    arrItems[0].Iva = arrIVA;
                }

                DocumentoRecord.DOCUMENTO_TRIBUTOSRow[] rowTributos = (DocumentoRecord.DOCUMENTO_TRIBUTOSRow[])tables.DOCUMENTO_TRIBUTOS.Select(filterExpression);

                if (rowTributos.Length > 0)
                {
                    AFIP.WSFEv1.Tributo[] arrTributo = new eFactura.Core.AFIP.WSFEv1.Tributo[rowTributos.Length];
                    for (int i = 0; i < arrTributo.Length; i++)
                    {
                        arrTributo[i] = new eFactura.Core.AFIP.WSFEv1.Tributo();
                        arrTributo[i].Id = rowTributos[i].TributoTipo;
                        arrTributo[i].Desc = rowTributos[i].Desc;
                        arrTributo[i].BaseImp = Math.Abs(rowTributos[i].BaseImp);
                        arrTributo[i].Alic = rowTributos[i].Alic;
                        arrTributo[i].Importe = Math.Abs(rowTributos[i].Importe);

                    }
                    arrItems[0].Tributos = arrTributo;
                }

                arrItems[0].MonCotiz = rowCabecera.MonCotiz;

                cmp.FeDetReq = arrItems;

                AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
                objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;

                // PK 18/09 Logueo el request y el response
                Helpers.LoggerHelper.Log("Afip", "AFIP Request CAE: " + JsonConvert.SerializeObject(cmp));

                AFIP.WSFEv1.FECAEResponse objResponse = objWSFEv1.FECAESolicitar(auth, cmp);

                Helpers.LoggerHelper.Log("Afip", "AFIP Response CAE: " + JsonConvert.SerializeObject(objResponse));

                int idx;


                if (objResponse.Errors != null)
                {
                    for (idx = 0; idx < objResponse.Errors.Length; idx++)
                    {
                        ErrorMsg = ErrorMsg + objResponse.Errors[idx].Code + " - " + objResponse.Errors[idx].Msg + ",  ";
                    }
                }


                if (objResponse.FeDetResp[0].Observaciones != null)
                {
                    for (idx = 0; idx < objResponse.FeDetResp[0].Observaciones.Length; idx++)
                    {
                        ErrorMsg = ErrorMsg + objResponse.FeDetResp[0].Observaciones[idx].Code + " - " + objResponse.FeDetResp[0].Observaciones[idx].Msg + ",  ";
                    }
                }

                if (ResultadoExitoso(objResponse))
                {
                    result = "O";
                    PuntoDeVenta.SetDocumentedSent(rowCabecera.EMPRESA_ID, rowCabecera.PtoVta, rowCabecera.CbteTipo, rowCabecera.CbteNro);
                    cae = objResponse.FeDetResp[0].CAE;
                    CAEFchVto = objResponse.FeDetResp[0].CAEFchVto;
                }
                else
                {
                    result = "E";
                }


                nota = SerializeHelper.SerializeObject(objResponse, typeof(AFIP.WSFEv1.FECAEResponse));

            }
            ///ver el tema de errores manejados por la AFIP
            catch (Exception ex)
            {
                Helpers.LoggerHelper.LogException("FECAECabRequest: ", ex);
                Helpers.EmailHelper.SendFailNotification("FECAECabRequest: ", ex);
                nota = ex.Message;
                result = "F";
            }

            Console.WriteLine(nota);
            return result;
        }


        /// <summary>
        /// Recuperador de los puntos de venta asignados a Facturación Electrónica que soporten CAE y CAEA vía Web Services (FEParamGetPtosVenta)
        /// Este método permite consultar los puntos de venta para ambos tipos de Código de Autorización (CAE y CAEA) gestionados por la CUIT emisora.
        /// </summary>
        /// <returns></returns>
        /// 


        // PK 15/07 Llamado a AFIP para comprobar monto minimo para operar con FECRED para un CUIT y una fecha dados, ver el monto devuelto
        public AFIP.FECRED.ConsultarMontoObligadoRecepcionReturnType ConsultarMontoObligado(long lCUIT, DateTime dFecha)
        {
            try
            {
                AFIP.FECRED.AuthRequestType auth = GetFECREDAuthRequest();
                AFIP.FECRED.FECredService objWSFECRED = new AFIP.FECRED.FECredService();
                // "https://serviciosjava.afip.gob.ar/wsfecred/FECredService"
                objWSFECRED.Url = empresa.URL_AFIP_WSFEv1_FECRED;
                AFIP.FECRED.ConsultarMontoObligadoRecepcionReturnType objResponse = objWSFECRED.consultarMontoObligadoRecepcion(auth, lCUIT, dFecha);
                // 30500001735
                return objResponse;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("ConsultarMontoObligado: ", exc);
                throw exc;
            }
        }

        // PK 17/07 Llamado a AFIP para comprobar monto minimo para operar con FECRED para un CUIT -- DEPRECADO OBSOLETO
        public AFIP.FECRED.consultarObligadoRecepcionReturnType consultarObligadoRecepción(long lCUIT)
        {
            try
            {
                AFIP.FECRED.AuthRequestType auth = GetFECREDAuthRequest();
                AFIP.FECRED.FECredService objWSFECRED = new AFIP.FECRED.FECredService();
                objWSFECRED.Url = empresa.URL_AFIP_WSFEv1_FECRED;
                AFIP.FECRED.consultarObligadoRecepcionReturnType objResponse = objWSFECRED.consultarObligadoRecepcion(auth, lCUIT);
                // 30515786046;
                // 30515488479;
                return objResponse;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("consultarObligadoRecepción: ", exc);
                throw exc;
            }
        }


        // PK 17/09 Llamado a AFIP para consultar comprobantes FECRED
        public AFIP.FECRED.ConsultarCmpReturnType ConsultarComprobantes
            (AFIP.FECRED.RolSimpleType rolCUITRepresentada, long CUITContraparte, bool CUITContraparteSpecified, short codTipoCmp, bool codTipoCmpSpecified, AFIP.FECRED.EstadoCmpSimpleType estadoCmp, bool estadoCmpSpecified, AFIP.FECRED.FiltroFechaType filtroFecha, long codCteCte, bool codCteCteSpecified, AFIP.FECRED.EstadoCtaCteSimpleType estadoCtaCte, bool estadoCteCteSpecified)
        {
            try
            {
                AFIP.FECRED.AuthRequestType auth = GetFECREDAuthRequest();
                AFIP.FECRED.FECredService objWSFECRED = new AFIP.FECRED.FECredService();
                // "https://serviciosjava.afip.gob.ar/wsfecred/FECredService"
                objWSFECRED.Url = empresa.URL_AFIP_WSFEv1_FECRED;

                //AFIP.FECRED.RolSimpleType rolCUITRepresentada = AFIP.FECRED.RolSimpleType.Emisor;
                //long CUITContraparte = long.MinValue ;
                //bool CUITContraparteSpecified = false;
                //short codTipoCmp = short.MinValue;
                //bool codTipoCmpSpecified = false;
                //AFIP.FECRED.EstadoCmpSimpleType estadoCmp = AFIP.FECRED.EstadoCmpSimpleType.Aceptado;
                //bool estadoCmpSpecified = false;
                //AFIP.FECRED.FiltroFechaType filtroFecha = null;
                //long codCteCte = long.MinValue;
                //bool codCteCteSpecified = false;
                //AFIP.FECRED.EstadoCtaCteSimpleType estadoCtaCte = AFIP.FECRED.EstadoCtaCteSimpleType.Aceptada;
                //bool estadoCteCteSpecified = false;


                AFIP.FECRED.ConsultarCmpReturnType objResponse = objWSFECRED.consultarComprobantes(auth,
                    rolCUITRepresentada,
                    CUITContraparte,
                    CUITContraparteSpecified,
                    codTipoCmp,
                    codTipoCmpSpecified,
                    estadoCmp,
                    estadoCmpSpecified,
                    filtroFecha,
                    codCteCte,
                    codCteCteSpecified,
                    estadoCtaCte,
                    estadoCteCteSpecified);
                return objResponse;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("ConsultarComprobantes: ", exc);
                throw exc;
            }
        }

        // PK 23/09 Llamado a AFIP para consultar historia de estados de un comprobante FECRED
        public AFIP.FECRED.ConsultarHistorialEstadosComprobanteReturnType consultarHistorialEstadosComprobante(AFIP.FECRED.IdComprobanteType idComprobante)
        {
            try
            {
                AFIP.FECRED.AuthRequestType auth = GetFECREDAuthRequest();
                AFIP.FECRED.FECredService objWSFECRED = new AFIP.FECRED.FECredService();
                objWSFECRED.Url = empresa.URL_AFIP_WSFEv1_FECRED;
                AFIP.FECRED.ConsultarHistorialEstadosComprobanteReturnType objResponse = objWSFECRED.consultarHistorialEstadosComprobante(auth, idComprobante);
                Helpers.LoggerHelper.Log("Afip", "AFIP Response Estado FCE: " + JsonConvert.SerializeObject(objResponse));
                return objResponse;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("consultarHistorialEstadosComprobante: ", exc);
                throw exc;
            }
        }


        // PK 04/10 Llamado a AFIP para consultar Cta Cte FECRED
        public AFIP.FECRED.ConsultarCtaCteReturnType consultarCtaCte(AFIP.FECRED.IdCtaCteType idCtaCte)
        {
            try
            {
                AFIP.FECRED.AuthRequestType auth = GetFECREDAuthRequest();
                AFIP.FECRED.FECredService objWSFECRED = new AFIP.FECRED.FECredService();
                objWSFECRED.Url = empresa.URL_AFIP_WSFEv1_FECRED;
                AFIP.FECRED.ConsultarCtaCteReturnType objResponse = objWSFECRED.consultarCtaCte(auth, idCtaCte);
                return objResponse;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("consultarCtaCte: ", exc);
                throw exc;
            }
        }


        // PK 16/07 POR MA trear los parametros opcionales de la AFIP
        public AFIP.WSFEv1.OpcionalTipoResponse FEParamGetTiposOpcional()
        {
            AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
            AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
            objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
            AFIP.WSFEv1.OpcionalTipoResponse objResponse = objWSFEv1.FEParamGetTiposOpcional(auth);
            return objResponse;
        }

        // PK 17/09 trear los parametros FEParamGetTiposCbte de la AFIP
        public AFIP.WSFEv1.CbteTipoResponse FEParamGetTiposCbte()
        {
            AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
            AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
            objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
            AFIP.WSFEv1.CbteTipoResponse objResponse = objWSFEv1.FEParamGetTiposCbte(auth);
            return objResponse;
        }

        // PK 17/09 trear los parametros FEParamGetTiposDoc de la AFIP
        public AFIP.WSFEv1.DocTipoResponse FEParamGetTiposDoc()
        {
            AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
            AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
            objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
            AFIP.WSFEv1.DocTipoResponse objResponse = objWSFEv1.FEParamGetTiposDoc(auth);
            return objResponse;
        }

        // PK 17/09 trear los parametros FEParamGetTiposConcepto de la AFIP
        public AFIP.WSFEv1.ConceptoTipoResponse FEParamGetTiposConcepto()
        {
            AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
            AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
            objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
            AFIP.WSFEv1.ConceptoTipoResponse objResponse = objWSFEv1.FEParamGetTiposConcepto(auth);
            return objResponse;
        }

        public AFIP.WSFEv1.FEPtoVentaResponse FEParamGetPtosVenta()
        {

            try
            {
                AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
                AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
                objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
                AFIP.WSFEv1.FEPtoVentaResponse objResponse = objWSFEv1.FEParamGetPtosVenta(auth);
                return objResponse;

            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("FEParamGetPtosVenta: ", exc);
                throw exc;
                //return null;
            }

        }


        /// <summary>
        /// Recuperador de ultimo valor de comprobante registrado (FECompUltimoAutorizado)
        /// Retorna el ultimo comprobante autorizado para el tipo de comprobante / cuit / punto de venta ingresado / Tipo de Emisión
        /// </summary>
        /// <param name="PtoVta"></param>
        /// <param name="CbteTipo"></param>
        /// <returns></returns>
        public AFIP.WSFEv1.FERecuperaLastCbteResponse FECompUltimoAutorizado(int PtoVta, int CbteTipo)
        {
            try
            {

                AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
                AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
                objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
                AFIP.WSFEv1.FERecuperaLastCbteResponse objResponse = objWSFEv1.FECompUltimoAutorizado(auth, PtoVta, CbteTipo);

                //return new Cbte(objResponse.PtoVta, objResponse.CbteTipo, objResponse.CbteNro);
                return objResponse;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("FECompUltimoAutorizado: ", exc);
                throw exc;
            }
        }

        /// <summary>
        /// Método para consultar Comprobantes Emitidos y su código (FECompConsultar)
        /// Esta operación permite consultar mediante tipo, numero de comprobante y punto de venta los datos 
        /// de un comprobante ya emitido. Dentro de los datos del comprobante resultante se obtiene el tipo de 
        /// emisión utilizado para generar el código de autorización.
        /// </summary>
        /// <param name="CbteTipo"></param>
        /// <param name="CbteNro"></param>
        /// <param name="PtoVta"></param>
        /// <returns></returns>
        public AFIP.WSFEv1.FECompConsResponse FECompConsultar(int CbteTipo, long CbteNro, int PtoVta)
        {
            try
            {
                eFactura.Core.AFIP.WSFEv1.FECompConsultaReq cmp = new eFactura.Core.AFIP.WSFEv1.FECompConsultaReq();
                cmp.CbteNro = CbteNro;
                cmp.CbteTipo = CbteTipo;
                cmp.PtoVta = PtoVta;

                AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
                AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
                objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
                AFIP.WSFEv1.FECompConsultaResponse objResponse = objWSFEv1.FECompConsultar(auth, cmp);

                if (objResponse.ResultGet == null)
                {
                    var errmsg = "";
                    foreach (var ee in objResponse.Errors)
                    {
                        errmsg = errmsg + "  " + ee.Msg;
                    }


                    throw new Exception(errmsg);
                }

                return objResponse.ResultGet;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("FECompConsultar: ", exc);
                throw exc;
            }
        }

        /// <summary>
        /// Recuperador de valores referenciales de códigos de Tipos de Tributos (FEParamGetTiposTributos)
        /// </summary>
        /// <returns></returns>
        public List<TributoTipo> FEParamGetTiposTributos()
        {
            try
            {
                AFIP.WSFEv1.FEAuthRequest auth = GetFEAuthRequest();
                AFIP.WSFEv1.Service objWSFEv1 = new eFactura.Core.AFIP.WSFEv1.Service();
                objWSFEv1.Url = empresa.URL_AFIP_WSFEv1;
                AFIP.WSFEv1.FETributoResponse objResponse = objWSFEv1.FEParamGetTiposTributos(auth);

                List<TributoTipo> result = new List<TributoTipo>();

                foreach (AFIP.WSFEv1.TributoTipo tt in objResponse.ResultGet)
                {
                    result.Add(new TributoTipo(tt.Id, tt.Desc, tt.FchDesde, tt.FchHasta));
                }
                return result;
            }
            catch (Exception exc)
            {
                Helpers.LoggerHelper.LogException("FEParamGetTiposTributos: ", exc);
                throw exc;
            }
        }

        public void GetPuntoVenta()
        {
            var obj = new AFIP.MTXCAService.MTXCAService();
            var ar = new eFactura.Core.AFIP.MTXCAService.AuthRequestType();
            Ticket ticket = GetTicket();
            ar.cuitRepresentada = this.empresa.CUIT;
            ar.sign = ticket.Sign;
            ar.token = ticket.Token;
            var evento = new eFactura.Core.AFIP.MTXCAService.CodigoDescripcionType();
            //var evento = new eFactura.Core.AFIP.WS
            var pp = obj.consultarPuntosVenta(ar, out evento);
            var uc = new eFactura.Core.AFIP.MTXCAService.ConsultaUltimoComprobanteAutorizadoRequestType();
            uc.codigoTipoComprobante = 3;
            uc.numeroPuntoVenta = 8321;
            long numComprobante;
            bool numComprobanteSpecified;
            eFactura.Core.AFIP.MTXCAService.CodigoDescripcionType[] errores;
            obj.consultarUltimoComprobanteAutorizado(ar, uc, out numComprobante, out numComprobanteSpecified, out errores, out evento);


        }



        #region Singleton
        static Dictionary<string, AfipConnector> instances = new Dictionary<string, AfipConnector>();
        private static Object thisLock = new Object();

        public static AfipConnector GetInstance(DocumentoRecord.EMPRESASRow empresaRow)
        {
            lock (thisLock)
            {
                string key = string.Format("{0}@{1}@{2}", empresaRow.CUIT.ToString().Trim(), empresaRow.RUTA_ARCHIVO_CERTIFICADO, empresaRow.URL_AFIP_WSAA);
                if (!instances.ContainsKey(key))
                {
                    instances.Add(key, new AfipConnector(empresaRow));
                }

                return instances[key];
            }

        }






        public static AfipConnector GetInstance(int EMPRESA_ID)
        {
            DocumentoRecord tables = new DocumentoRecord();
            using (ASF.Dal.DataAccess dal = new ASF.Dal.DataAccess())
            {
                dal.FillDataSet(System.Data.CommandType.StoredProcedure, "PROCESS_GET", tables);
            }
            DocumentoRecord.EMPRESASRow[] empresas =
                (DocumentoRecord.EMPRESASRow[])tables.EMPRESAS.Select("EMPRESA_ID = " + EMPRESA_ID.ToString());
            if (empresas.Length == 0)
                return null;
            return GetInstance(empresas[0]);
        }
        #endregion Singleton
    }
}
