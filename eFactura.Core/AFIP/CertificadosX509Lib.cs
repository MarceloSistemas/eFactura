using System;
using System.Collections.Generic;
using System.Text;
using System.Security;
using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography.X509Certificates;

namespace eFactura.Core.AFIP
{
    /// <summary> 
    /// Libreria de utilidades para manejo de certificados 
    /// </summary> 
    /// <remarks></remarks> 
    class CertificadosX509Lib
    {

        public static bool VerboseMode = false;

        /// <summary> 
        /// Firma mensaje 
        /// </summary> 
        /// <param name="argBytesMsg">Bytes del mensaje</param> 
        /// <param name="argCertFirmante">Certificado usado para firmar</param> 
        /// <returns>Bytes del mensaje firmado</returns> 
        /// <remarks></remarks> 
        public static byte[] FirmaBytesMensaje(byte[] argBytesMsg, X509Certificate2 argCertFirmante)
        {
            try
            {
                // Pongo el mensaje en un objeto ContentInfo (requerido para construir el obj SignedCms) 
                ContentInfo infoContenido = new ContentInfo(argBytesMsg);
                SignedCms cmsFirmado = new SignedCms(infoContenido);

                // Creo objeto CmsSigner que tiene las caracteristicas del firmante 
                CmsSigner cmsFirmante = new CmsSigner(argCertFirmante);
                cmsFirmante.IncludeOption = X509IncludeOption.EndCertOnly;

               
                // Firmo el mensaje PKCS #7 
                cmsFirmado.ComputeSignature(cmsFirmante);

               
                // Encodeo el mensaje PKCS #7. 
                return cmsFirmado.Encode();
            }
            catch (Exception excepcionAlFirmar)
            {
                Helpers.LoggerHelper.LogException(excepcionAlFirmar);
                throw new Exception("***Error al firmar: " + excepcionAlFirmar.Message);
            }
        }

        /// <summary> 
        /// Lee certificado de disco 
        /// </summary> 
        /// <param name="argArchivo">Ruta del certificado a leer.</param> 
        /// <returns>Un objeto certificado X509</returns> 
        /// <remarks></remarks> 
        public static X509Certificate2 ObtieneCertificadoDesdeArchivo(string argArchivo, SecureString argPassword)
        {
            X509Certificate2 objCert = new X509Certificate2();
            try
            {
                if (argPassword.IsReadOnly())
                {
                    //objCert.Import(System.IO.File.ReadAllBytes(argArchivo));
                    objCert.Import(System.IO.File.ReadAllBytes(argArchivo), argPassword,X509KeyStorageFlags.MachineKeySet);
                }
                else
                {
                    objCert.Import(System.IO.File.ReadAllBytes(argArchivo));
                }
                return objCert;
            }
            catch (Exception excepcionAlImportarCertificado)
            {
                Helpers.LoggerHelper.LogException(excepcionAlImportarCertificado);
                throw new Exception(excepcionAlImportarCertificado.Message + " " + excepcionAlImportarCertificado.StackTrace);
            }
        }

    }

}
