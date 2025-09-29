Option Explicit On
Option Strict On
Imports System
Imports System.Collections
Imports System.Data.SqlClient
Imports eFactura.Core

Partial Public Class frmCRUDPUNTO_VENTA_CONTROL
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub objWebDataBinder_DeclareBindings() Handles objWebDataBinder.DeclareBindings
        objWebDataBinder.Add(Me.cboEMPRESA_ID.ID)
        objWebDataBinder.Add(Me.txtPtoVta.ID, True)
        objWebDataBinder.Add(Me.cboCbteTipo.ID)
        objWebDataBinder.Add(Me.txtCbteNro.ID, False)
    End Sub

    Private Sub objCRUDManagerHeader_OnQueryFixedData() Handles objCRUDManagerHeader.OnQueryFixedData
        Dim dstCombos As DataSet = objCRUDManagerHeader.GetFixedData(Nothing)
        Me.cboEMPRESA_ID.SetSource(dstCombos.Tables("EMPRESAS"))
        Me.cboCbteTipo.SetSource(dstCombos.Tables("MAESTRO_CbteTipo"))
    End Sub

    '$btnSearchClick$
    '$btnCleanClick$
    '$ExecuteSearch$
    '$CleanControls$

    Protected Sub btnConsultar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnConsultar.Click
        Dim dst As New DocumentoRecord
        Dim dtrEmpresa As DocumentoRecord.EMPRESASRow = dst.EMPRESAS.NewEMPRESASRow
        Dim objEmpresa As New BusObjects.EMPRESAS

        Dim dstEmpresa As BusEntities.EMPRESASRecord = CType(objEmpresa.QueryRecord(Me.cboEMPRESA_ID.SelectedValue), BusEntities.EMPRESASRecord)

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
        Dim comprobante As AFIP.WSFEv1.FERecuperaLastCbteResponse = engine.FECompUltimoAutorizado(Integer.Parse(Me.txtPtoVta.Text), Integer.Parse(Me.cboCbteTipo.SelectedValue))
        Dim oXS As New System.Xml.Serialization.XmlSerializer(comprobante.GetType())
        Dim sw As New IO.StringWriter()

        oXS.Serialize(sw, comprobante)

        Dim strControlDataXML As String = sw.ToString()
        strControlDataXML = strControlDataXML.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")
        Me.txtRta.Text = strControlDataXML + Environment.NewLine + Environment.NewLine

        Try


            Dim datoscomprobante As AFIP.WSFEv1.FECompConsResponse = engine.FECompConsultar(comprobante.CbteTipo, comprobante.CbteNro, comprobante.PtoVta)
            Dim oXS1 As New System.Xml.Serialization.XmlSerializer(datoscomprobante.GetType())
            Dim sw1 As New IO.StringWriter()

            oXS1.Serialize(sw1, datoscomprobante)

            Dim strControlDataXML1 As String = sw1.ToString()

            strControlDataXML1 = strControlDataXML1.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = Me.txtRta.Text + strControlDataXML1
        Catch ex As Exception
            Me.txtRta.Text = Me.txtRta.Text + ex.Message
        End Try

    End Sub

    Private Sub objWebDataBinder_PostEnableControls() Handles objWebDataBinder.PostEnableControls
        Me.txtPtoVta.Enabled = False
        Me.cboCbteTipo.Enabled = False
        Me.cboEMPRESA_ID.Enabled = False
    End Sub

    Private Sub frmCRUDPUNTO_VENTA_CONTROL_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Me.objCRUDToolBarHeader.ButtonDelete.Visible = False
        Me.objCRUDToolBarHeader.ButtonNew.Visible = False
    End Sub
End Class

