Imports System.Net
Imports System.Web.Http
Imports eFactura.Core

Public Class AFIPServiceController
    Inherits ApiController

    ' GET api/<controller>/5
    Public Function GetValue(ByVal id As String) As Object

        ' Para probar desde POSTMAN
        '  http://localhost:1514/Api/AfipService/20130531734
        ' Respuesta
        ' {
        ' "id": "20130531734",
        ' "MontoDesde": 2000000.0,
        ' "Obligado": "S",
        ' "FechaDesdeDeprecada": "8/1/2019 12:00:00 AM",
        ' "ObligadoDeprecado": "S"
        ' }
        ' 
        ' Otros CUITS
        ' CUIT 20076397644 -> FECHA DESDE 01/09/2019
        ' CUIT 20130531734 -> FECHA DESDE 01/08/2019
        ' CUIT 30501086246 -> FECHA DESDE 01/07/2019
        ' CUIT 30500526935 -> FECHA DESDE 01/06/2019
        ' CUIT 30500000127 -> FECHA DESDE 01/05/2019 


        Try
            Dim dstEmpresa As New BusEntities.EMPRESASRecord
            Dim dal = New ASF.Dal.DataAccess()
            dal.FillDataSet(System.Data.CommandType.StoredProcedure, "EMPRESAS_SEL", dstEmpresa, New Object() {1})
            Dim empresa = dstEmpresa.EMPRESAS(0)


            Dim documentoTables As New DocumentoRecord
            Dim dtrEmpresa = documentoTables.EMPRESAS.NewEMPRESASRow

            dtrEmpresa.CUIT = empresa.CUIT
            dtrEmpresa.EMAILS = empresa.EMAILS
            dtrEmpresa.EMPRESA_ID = empresa.EMPRESA_ID
            dtrEmpresa.PASSWORD = empresa.PASSWORD
            dtrEmpresa.RAZON_SOCIAL = empresa.RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = empresa.RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = empresa.TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = empresa.TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = empresa.TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = empresa.URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = empresa.URL_AFIP_WSFEv1
            'dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = empresa.TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = empresa.TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = empresa.TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = empresa.URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = empresa.URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = empresa.INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim lCUIT As Long = Long.Parse(id)

            Dim comprobante1 As AFIP.FECRED.ConsultarMontoObligadoRecepcionReturnType = engine.ConsultarMontoObligado(lCUIT, System.DateTime.Today)
            Dim comprobante2 As New AFIP.FECRED.consultarObligadoRecepcionReturnType

            Try
                comprobante2 = engine.consultarObligadoRecepción(lCUIT)
            Catch ex As Exception
                comprobante2.respuesta = ex.Message
                comprobante2.desde = New Date(1000, 1, 1)
            End Try

            Return New With {.id = id, _
                             .MontoDesde = comprobante1.montoDesde, _
                             .Obligado = comprobante1.obligado.ToString(),
                             .FechaDesdeDeprecada = comprobante2.desde.ToString(),
                             .ObligadoDeprecado = comprobante2.respuesta.ToString()
                            }
        Catch ex As Exception
            Return New With {.id = id, _
                             .MontoDesde = 0, _
                             .Obligado = "ERROR: " + ex.Message, _
                             .FechaDesdeDeprecada = "", _
                             .ObligadoDeprecado = ""
                            }
        End Try
    End Function

End Class
