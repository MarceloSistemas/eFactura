using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Net;
using System.Security;
using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography.X509Certificates;
using System.IO;

namespace eFactura.Core.AFIP
{
    /// <summary> 
    /// Clase para crear objetos Login Tickets 
    /// </summary> 
    /// <remarks> 
    /// Ver documentacion: 
    /// Especificacion Tecnica del Webservice de Autenticacion y Autorizacion 
    /// Version 1.0 
    /// Departamento de Seguridad Informatica - AFIP 
    /// </remarks> 
    class LoginTicket
    {
        // Entero de 32 bits sin signo que identifica el requerimiento 
        public UInt32 UniqueId;
        // Momento en que fue generado el requerimiento 
        public DateTime GenerationTime;
        // Momento en el que exoira la solicitud 
        public DateTime ExpirationTime;
        // Identificacion del WSN para el cual se solicita el TA 
        public string Service;
        // Firma de seguridad recibida en la respuesta 
        public string Sign;
        // Token de seguridad recibido en la respuesta 
        public string Token;

        public XmlDocument XmlLoginTicketRequest = null;
        public XmlDocument XmlLoginTicketResponse = null;
        public string RutaDelCertificadoFirmante;
        public string XmlStrLoginTicketRequestTemplate = "<loginTicketRequest><header><uniqueId></uniqueId><generationTime></generationTime><expirationTime></expirationTime></header><service></service></loginTicketRequest>";

        private bool _verboseMode = true;

        // OJO! NO ES THREAD-SAFE 
        private static UInt32 _globalUniqueID = 0;

        private SecureString GetSecureString(string value)
        {
            SecureString strPasswordSecureString = new SecureString();

            foreach (char character in value.ToCharArray())
            {
                strPasswordSecureString.AppendChar(character);
            }
            strPasswordSecureString.MakeReadOnly();
            return strPasswordSecureString;
        }

        /// <summary> 
        /// Construye un Login Ticket obtenido del WSAA 
        /// </summary> 
        /// <param name="argServicio">Servicio al que se desea acceder</param> 
        /// <param name="argUrlWsaa">URL del WSAA</param> 
        /// <param name="argRutaCertX509Firmante">Ruta del certificado X509 (con clave privada) usado para firmar</param> 
        /// <param name="argVerbose">Nivel detallado de descripcion? true/false</param> 
        /// <remarks></remarks> 
        public string ObtenerLoginTicketResponse(string argServicio, string argUrlWsaa, string argRutaCertX509Firmante, string argPassword, bool argVerbose)
        {

            this.RutaDelCertificadoFirmante = argRutaCertX509Firmante;
            this._verboseMode = argVerbose;
            CertificadosX509Lib.VerboseMode = argVerbose;

            string cmsFirmadoBase64;
            string loginTicketResponse;

            XmlNode xmlNodoUniqueId;
            XmlNode xmlNodoGenerationTime;
            XmlNode xmlNodoExpirationTime;
            XmlNode xmlNodoService;

            // PASO 1: Genero el Login Ticket Request 
            try
            {
                XmlLoginTicketRequest = new XmlDocument();
                XmlLoginTicketRequest.LoadXml(XmlStrLoginTicketRequestTemplate);

                xmlNodoUniqueId = XmlLoginTicketRequest.SelectSingleNode("//uniqueId");
                xmlNodoGenerationTime = XmlLoginTicketRequest.SelectSingleNode("//generationTime");
                xmlNodoExpirationTime = XmlLoginTicketRequest.SelectSingleNode("//expirationTime");
                xmlNodoService = XmlLoginTicketRequest.SelectSingleNode("//service");

                xmlNodoGenerationTime.InnerText = DateTime.Now.AddMinutes(-10).ToString("s");
                xmlNodoExpirationTime.InnerText = DateTime.Now.AddMinutes(+10).ToString("s");
                xmlNodoUniqueId.InnerText = Convert.ToString(_globalUniqueID);
                xmlNodoService.InnerText = argServicio;
                this.Service = argServicio;

                _globalUniqueID += 1;

                if (this._verboseMode)
                {
                    Console.WriteLine(XmlLoginTicketRequest.OuterXml);
                }
            }

            catch (Exception excepcionAlGenerarLoginTicketRequest)
            {
                Helpers.LoggerHelper.LogException(excepcionAlGenerarLoginTicketRequest);
                throw new Exception("***Error GENERANDO el LoginTicketRequest : " + excepcionAlGenerarLoginTicketRequest.Message);
            }

            // PASO 2: Firmo el Login Ticket Request 
            try
            {
                if (this._verboseMode)
                {
                    Console.WriteLine("***Leyendo certificado: {0}", RutaDelCertificadoFirmante);
                }

                X509Certificate2 certFirmante = CertificadosX509Lib.ObtieneCertificadoDesdeArchivo(RutaDelCertificadoFirmante, GetSecureString(argPassword));

                if (this._verboseMode)
                {
                    Console.WriteLine("***Firmando: ");
                    Console.WriteLine(XmlLoginTicketRequest.OuterXml);
                }

                // Convierto el login ticket request a bytes, para firmar 
                Encoding EncodedMsg = Encoding.UTF8;
                byte[] msgBytes = EncodedMsg.GetBytes(XmlLoginTicketRequest.OuterXml);

                // Firmo el msg y paso a Base64 
                byte[] encodedSignedCms = CertificadosX509Lib.FirmaBytesMensaje(msgBytes, certFirmante);
                cmsFirmadoBase64 = Convert.ToBase64String(encodedSignedCms);
            }

            catch (Exception excepcionAlFirmar)
            {
                Helpers.LoggerHelper.LogException(excepcionAlFirmar);
                throw new Exception("***Error FIRMANDO el LoginTicketRequest : " + excepcionAlFirmar.Message);
            }

            // PASO 3: Invoco al WSAA para obtener el Login Ticket Response 
            try
            {
                if (this._verboseMode)
                {
                    Console.WriteLine("***Llamando al WSAA en URL: {0}", argUrlWsaa);
                    Console.WriteLine("***Argumento en el request:");
                    Console.WriteLine(cmsFirmadoBase64);
                }

                //TODO: Verificar como hacer para cambiar dinamicamente la URL a produccion
                AFIP.WSAA.LoginCMSService servicioWsaa = new AFIP.WSAA.LoginCMSService();
                servicioWsaa.Url = argUrlWsaa;
                loginTicketResponse = servicioWsaa.loginCms(cmsFirmadoBase64);


                if (this._verboseMode)
                {
                    Console.WriteLine("***LoguinTicketResponse: ");
                    Console.WriteLine(loginTicketResponse);
                }
            }

            catch (Exception excepcionAlInvocarWsaa)
            {
                Helpers.LoggerHelper.LogException(excepcionAlInvocarWsaa);
                throw new Exception("***Error INVOCANDO al servicio WSAA : " + excepcionAlInvocarWsaa.Message);
            }


            // PASO 4: Analizo el Login Ticket Response recibido del WSAA 
            try
            {
                XmlLoginTicketResponse = new XmlDocument();
                XmlLoginTicketResponse.LoadXml(loginTicketResponse);

                this.UniqueId = UInt32.Parse(XmlLoginTicketResponse.SelectSingleNode("//uniqueId").InnerText);
                this.GenerationTime = DateTime.Parse(XmlLoginTicketResponse.SelectSingleNode("//generationTime").InnerText);
                this.ExpirationTime = DateTime.Parse(XmlLoginTicketResponse.SelectSingleNode("//expirationTime").InnerText);
                this.Sign = XmlLoginTicketResponse.SelectSingleNode("//sign").InnerText;
                this.Token = XmlLoginTicketResponse.SelectSingleNode("//token").InnerText;
            }
            catch (Exception excepcionAlAnalizarLoginTicketResponse)
            {
                Helpers.LoggerHelper.LogException(excepcionAlAnalizarLoginTicketResponse);
                throw new Exception("***Error ANALIZANDO el LoginTicketResponse : " + excepcionAlAnalizarLoginTicketResponse.Message);
            }

            return loginTicketResponse;

        }
    }
}
