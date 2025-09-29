Option Explicit On
Option Strict On
Imports System
Imports System.Collections
Imports System.Data.SqlClient
Imports eFactura.Core

Partial Public Class frmCRUDEMPRESAS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub objWebDataBinder_DeclareBindings() Handles objWebDataBinder.DeclareBindings
        objWebDataBinder.Add(Me.txtCUIT.ID, False)
        objWebDataBinder.Add(Me.txtPASSWORD.ID, False)
        objWebDataBinder.Add(Me.txtRAZON_SOCIAL.ID, False)
        objWebDataBinder.Add(Me.txtURL_AFIP_WSAA.ID, False)
        objWebDataBinder.Add(Me.txtURL_AFIP_WSFEv1.ID, False)
        objWebDataBinder.Add(Me.txtRUTA_ARCHIVO_CERTIFICADO.ID, False)
        objWebDataBinder.Add(Me.txtEMAILS.ID, False)
        objWebDataBinder.Add(Me.txtTICKET_EXPIRED_DATE.ID, False)
        ' PK 15/07
        objWebDataBinder.Add(Me.txtURL_AFIP_WSAA_FECRED.ID, False)
        objWebDataBinder.Add(Me.txtURL_AFIP_WSFEv1_FECRED.ID, False)
        objWebDataBinder.Add(Me.txtTICKET_EXPIRED_DATE_FECRED.ID, False)
        ' ---------
        ' PK 15/07
        objWebDataBinder.Add(Me.txtINFO_AUXILIAR.ID, False)
    End Sub

    '$objCRUDManagerHeader_OnQueryFixedData()$
   
    Protected Sub btnViewPOS_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnViewPOS.Click
        Dim dst As New DocumentoRecord
        Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
        Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

        dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
        dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
        dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
        dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
        dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
        dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
        dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
        dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
        dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
        dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
        dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1

        Dim engine As New AfipConnector(dtrEmpresa)
        Dim comprobante As AFIP.WSFEv1.FEPtoVentaResponse = engine.FEParamGetPtosVenta()


        Dim oXS As New System.Xml.Serialization.XmlSerializer(comprobante.GetType())
        Dim sw As New IO.StringWriter()

        oXS.Serialize(sw, comprobante)

        Dim strControlDataXML As String = sw.ToString()
        strControlDataXML = strControlDataXML.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")
        Me.txtRta.Text = strControlDataXML
    End Sub

    Private Sub objWebDataBinder_PostEnableControls() Handles objWebDataBinder.PostEnableControls
        Me.txtCUIT.Enabled = False
    End Sub

    Private Sub frmCRUDEMPRESAS_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Me.objCRUDToolBarHeader.ButtonDelete.Visible = False
    End Sub

    ' PK 15/07
    ' Es un boton para hacer pruebas, se debe quitar en la version final
    Protected Sub btnViewFCE_Click(sender As Object, e As EventArgs) Handles btnViewFCE.Click
        Try
            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)

            ' PK Llamado a AFIP para comprobar monto minimo para operar con FECRED para un cuit y una fecha dados, ver el monto devuelto
            Dim lCUIT As Long = Long.Parse(Me.txtEMAILS.Text)
            Dim comprobante1 As AFIP.FECRED.ConsultarMontoObligadoRecepcionReturnType = engine.ConsultarMontoObligado(lCUIT, System.DateTime.Today)

            ' PK Llamado a AFIP para comprobar monto minimo para operar con FECRED para un CUIT (DEPRECADO)
            Dim comprobante2 As AFIP.FECRED.consultarObligadoRecepcionReturnType = engine.consultarObligadoRecepción(lCUIT)


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Dim oXS2 As New System.Xml.Serialization.XmlSerializer(comprobante2.GetType())
            Dim sw2 As New IO.StringWriter()
            oXS2.Serialize(sw2, comprobante2)
            Dim strControlDataXML2 As String = sw2.ToString()
            strControlDataXML2 = strControlDataXML2.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado AFIP ACTUAL: " + vbCrLf + strControlDataXML1 + vbCrLf + vbCrLf + "Resultado AFIP DEPRECADO: " + vbCrLf + strControlDataXML2
        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try

    End Sub

    ' PK 17/07
    ' Es un bot�n para probar si el JSon del campo INFO_AUXILIAR est� bien formateado
    Protected Sub btnViewJson_Click(sender As Object, e As EventArgs) Handles btnViewJson.Click
        Try
            Dim sJSon = Me.txtINFO_AUXILIAR.Text
            If eFactura.Core.JSonHelper.Validate(sJSon) Then
                Me.txtRta.Text = "OK. Formato valido en el campo INFO_AUXILIAR, vista mejorada: " + vbCrLf + eFactura.Core.JSonHelper.Convert(sJSon)
            Else
                eFactura.Core.JSonHelper.Convert(sJSon)
            End If
        Catch ex As Exception
            Me.txtRta.Text = "Error. Formato invalido en el campo INFO_AUXILIAR, motivo: " + vbCrLf + ex.Message
        End Try
    End Sub

    Protected Sub btnViewOpc_Click(sender As Object, e As EventArgs) Handles btnViewOpc.Click

        Try

            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            ' PK Llamado a AFIP para Mostrar los parametros opcionales de la AFIP
            Dim comprobante1 As AFIP.WSFEv1.OpcionalTipoResponse = engine.FEParamGetTiposOpcional()


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = "Parametros Opcionales:" + vbCrLf + strControlDataXML1
        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try

    End Sub

    Protected Sub btnViewTiposCbte_Click(sender As Object, e As EventArgs) Handles btnViewTiposCbte.Click
        Try

            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim comprobante1 As AFIP.WSFEv1.CbteTipoResponse = engine.FEParamGetTiposCbte()


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = "Tiposde Comprobante:" + vbCrLf + strControlDataXML1
        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try
    End Sub

    Protected Sub btnViewTiposDoc_Click(sender As Object, e As EventArgs) Handles btnViewTiposDoc.Click
        Try

            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim comprobante1 As AFIP.WSFEv1.DocTipoResponse = engine.FEParamGetTiposDoc()


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = "Tiposde Comprobante:" + vbCrLf + strControlDataXML1
        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try
    End Sub

    Protected Sub btnViewTiposConcepto_Click(sender As Object, e As EventArgs) Handles btnViewTiposConcepto.Click
        Try

            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim comprobante1 As AFIP.WSFEv1.ConceptoTipoResponse = engine.FEParamGetTiposConcepto()


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = "Tiposde Comprobante:" + vbCrLf + strControlDataXML1
        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try
    End Sub

    Protected Sub btnViewConsultaFCE_Click(sender As Object, e As EventArgs) Handles btnViewConsultaFCE.Click

        Try
            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim lCUIT As Long = Long.Parse(Me.txtEMAILS.Text)

            Dim idComprobante As New AFIP.FECRED.IdComprobanteType
            idComprobante.CUITEmisor = Long.Parse(Me.txtCUITEmisor.Text)
            idComprobante.codTipoCmp = Short.Parse(Me.txtTIPOCMP.Text)
            idComprobante.ptoVta = Integer.Parse(Me.txtPTOVTA.Text)
            idComprobante.nroCmp = Long.Parse(Me.txtNROCMP.Text)
            Dim comprobante1 As AFIP.FECRED.ConsultarHistorialEstadosComprobanteReturnType = engine.consultarHistorialEstadosComprobante(idComprobante)


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            If comprobante1.arrayErrores.Length = 0 Then

                Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado Consulta Comprobante: " + vbCrLf + strControlDataXML1 + vbCrLf + vbCrLf + "Ultimo estado del comprobante:  " + vbCrLf + "" + comprobante1.arrayHistorialEstados.Last.estado.ToString()

            Else

                Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado Consulta Comprobante: " + vbCrLf + strControlDataXML1 + vbCrLf + vbCrLf + "Ultimo estado del comprobante:  " + vbCrLf + vbCrLf + comprobante1.arrayErrores.Last.descripcion.ToString()
            End If



        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try

    End Sub

    Protected Sub btnViewComprobanteFCE_Click(sender As Object, e As EventArgs) Handles btnViewComprobanteFCE.Click

        Try
            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim lCUIT As Long = Long.Parse(Me.txtEMAILS.Text)

            Dim idComprobante As New AFIP.FECRED.IdComprobanteType
            idComprobante.CUITEmisor = Long.Parse(Me.txtCUITEmisor.Text)
            idComprobante.codTipoCmp = Short.Parse(Me.txtTIPOCMP.Text)
            idComprobante.ptoVta = Integer.Parse(Me.txtPTOVTA.Text)
            idComprobante.nroCmp = Long.Parse(Me.txtNROCMP.Text)
            Dim filtroFecha As New AFIP.FECRED.FiltroFechaType
            filtroFecha.tipo = AFIP.FECRED.TipoFechaSimpleType.Emision
            filtroFecha.desde = Convert.ToDateTime("01/01/2001")
            filtroFecha.hasta = Convert.ToDateTime("01/01/2001")

            Dim comprobante1 As AFIP.FECRED.ConsultarCmpReturnType = engine.ConsultarComprobantes(AFIP.FECRED.RolSimpleType.Emisor, 0, False, 0, False, AFIP.FECRED.EstadoCmpSimpleType.Aceptado, False, filtroFecha, 0, False, AFIP.FECRED.EstadoCtaCteSimpleType.Aceptada, False)


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            If comprobante1.arrayErrores.Length = 0 Then

                Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado Consulta Comprobante: " + vbCrLf + strControlDataXML1

            Else

                Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado Consulta Comprobante: " + vbCrLf + strControlDataXML1 + vbCrLf + vbCrLf + "Ultimo estado del comprobante:  " + vbCrLf + vbCrLf + comprobante1.arrayErrores.Last.descripcion.ToString()
            End If



        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try
    End Sub

    Protected Sub btnViewCtaCte_Click(sender As Object, e As EventArgs) Handles btnViewCtaCte.Click
        Try
            Dim dst As New DocumentoRecord
            Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
            Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objCRUDManagerHeader.GetSessionDataSet(), BusEntities.EMPRESASRecord)

            dtrEmpresa.CUIT = dstEmpresa.EMPRESAS(0).CUIT
            dtrEmpresa.EMAILS = dstEmpresa.EMPRESAS(0).EMAILS
            dtrEmpresa.EMPRESA_ID = dstEmpresa.EMPRESAS(0).EMPRESA_ID
            dtrEmpresa.PASSWORD = dstEmpresa.EMPRESAS(0).PASSWORD
            dtrEmpresa.RAZON_SOCIAL = dstEmpresa.EMPRESAS(0).RAZON_SOCIAL
            dtrEmpresa.RUTA_ARCHIVO_CERTIFICADO = dstEmpresa.EMPRESAS(0).RUTA_ARCHIVO_CERTIFICADO
            dtrEmpresa.TICKET_EXPIRED_DATE = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE
            dtrEmpresa.TICKET_SIGN = dstEmpresa.EMPRESAS(0).TICKET_SIGN
            dtrEmpresa.TICKET_TOKEN = dstEmpresa.EMPRESAS(0).TICKET_TOKEN
            dtrEmpresa.URL_AFIP_WSAA = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA
            dtrEmpresa.URL_AFIP_WSFEv1 = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1
            dtrEmpresa.TICKET_EXPIRED_DATE_FECRED = dstEmpresa.EMPRESAS(0).TICKET_EXPIRED_DATE_FECRED
            dtrEmpresa.TICKET_SIGN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_SIGN_FECRED
            dtrEmpresa.TICKET_TOKEN_FECRED = dstEmpresa.EMPRESAS(0).TICKET_TOKEN_FECRED
            dtrEmpresa.URL_AFIP_WSAA_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSAA_FECRED
            dtrEmpresa.URL_AFIP_WSFEv1_FECRED = dstEmpresa.EMPRESAS(0).URL_AFIP_WSFEv1_FECRED
            dtrEmpresa.INFO_AUXILIAR = dstEmpresa.EMPRESAS(0).INFO_AUXILIAR

            Dim engine As New AfipConnector(dtrEmpresa)
            Dim lCUIT As Long = Long.Parse(Me.txtEMAILS.Text)

            Dim idComprobante As New AFIP.FECRED.IdComprobanteType
            idComprobante.CUITEmisor = Long.Parse(Me.txtCUITEmisor.Text)
            idComprobante.codTipoCmp = Short.Parse(Me.txtTIPOCMP.Text)
            idComprobante.ptoVta = Integer.Parse(Me.txtPTOVTA.Text)
            idComprobante.nroCmp = Long.Parse(Me.txtNROCMP.Text)

            Dim idCtaCte As New AFIP.FECRED.IdCtaCteType
            idCtaCte.Item = idComprobante

            Dim comprobante1 As AFIP.FECRED.ConsultarCtaCteReturnType = engine.consultarCtaCte(idCtaCte)


            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(comprobante1.GetType())
            Dim sw1 As New IO.StringWriter()
            oXS1.Serialize(sw1, comprobante1)
            Dim strControlDataXML1 As String = sw1.ToString()
            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            If comprobante1.arrayErrores.Length = 0 Then

                Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado Consulta Comprobante: " + vbCrLf + strControlDataXML1

            Else

                Me.txtRta.Text = "CUIT: " + Long.Parse(Me.txtEMAILS.Text).ToString + vbCrLf + "Resultado Consulta Comprobante: " + vbCrLf + strControlDataXML1 + vbCrLf + vbCrLf + "Ultimo estado del comprobante:  " + vbCrLf + vbCrLf + comprobante1.arrayErrores.Last.descripcion.ToString()
            End If



        Catch ex As Exception
            Me.txtRta.Text = "ERROR:" + vbCrLf + ex.Message
        End Try
    End Sub
End Class

