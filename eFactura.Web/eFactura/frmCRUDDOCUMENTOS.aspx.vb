Option Explicit On
Option Strict On
Imports System
Imports System.Collections
Imports System.Data.SqlClient
Imports eFactura.Core
Partial Public Class frmCRUDDOCUMENTOS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub objWebDataBinder_DeclareBindings() Handles objWebDataBinder.DeclareBindings
        objWebDataBinder.Add(Me.cboEMPRESA_ID.ID)
        objWebDataBinder.Add(Me.cboCbteTipo.ID)
        objWebDataBinder.Add(Me.txtPtoVta.ID, False)
        objWebDataBinder.Add(Me.txtCbteNro.ID, False)
        objWebDataBinder.Add(Me.txtConcepto.ID, False)
        objWebDataBinder.Add(Me.cboDocTipo.ID)
        objWebDataBinder.Add(Me.txtDocNro.ID, False)
        objWebDataBinder.Add(Me.txtCbteFecha.ID, False)
        objWebDataBinder.Add(Me.txtImpTotal.ID, False)
        objWebDataBinder.Add(Me.txtImpTotConc.ID, False)
        objWebDataBinder.Add(Me.txtImpNeto.ID, False)
        objWebDataBinder.Add(Me.txtImpOpEx.ID, False)
        objWebDataBinder.Add(Me.txtImpIva.ID, False)
        objWebDataBinder.Add(Me.txtImpTrib.ID, False)
        objWebDataBinder.Add(Me.txtFchServDesde.ID, False)
        objWebDataBinder.Add(Me.txtFchServHasta.ID, False)
        objWebDataBinder.Add(Me.txtFchVtoPago.ID, False)
        objWebDataBinder.Add(Me.cboMonId.ID)
        objWebDataBinder.Add(Me.txtMonCotiz.ID, False)
        objWebDataBinder.Add(Me.cboESTADO_ID.ID)
        objWebDataBinder.Add(Me.txtNOTAS.ID, False)
        objWebDataBinder.Add(Me.txtFECHA_ALTA.ID, False)
        objWebDataBinder.Add(Me.txtFECHA_ACTUALIZACION.ID, False)
        objWebDataBinder.Add(Me.txtCAE.ID, False)
        objWebDataBinder.Add(Me.txtCAEFchVto.ID, False)
        objWebDataBinder.Add(Me.txtError.ID, False)
    End Sub

    Private Sub objCRUDManagerHeader_OnQueryFixedData() Handles objCRUDManagerHeader.OnQueryFixedData
        Dim dstCombos As DataSet = objCRUDManagerHeader.GetFixedData(Nothing)
        Me.cboEMPRESA_ID.SetSource(dstCombos.Tables("EMPRESAS"))
        Me.cboCbteTipo.SetSource(dstCombos.Tables("MAESTRO_CbteTipo"))
        Me.cboDocTipo.SetSource(dstCombos.Tables("MAESTRO_DocTipo"))
        Me.cboMonId.SetSource(dstCombos.Tables("MAESTRO_Moneda"))
        Me.cboESTADO_ID.SetSource(dstCombos.Tables("MAESTRO_ESTADOS_DOCUMENTO"))
        Me.cboCbteTipo_SEARCH.SetSource(dstCombos.Tables("MAESTRO_CbteTipo"), ASF.WebControls.ComboBoxFirstItem.All)
        Me.cboESTADO_ID_SEARCH.SetSource(dstCombos.Tables("MAESTRO_ESTADOS_DOCUMENTO"), ASF.WebControls.ComboBoxFirstItem.All)
    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Me.ExecuteSearch()
    End Sub

    Private Sub btnClean_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClean.Click
        Me.CleanSearchControls()
    End Sub

    Private Sub ExecuteSearch()
        Dim objQueryParameters As ArrayList = New ArrayList
        If (Me.cboCbteTipo_SEARCH.SelectedValue <> "") Then
            objQueryParameters.Add(New SqlParameter("@CbteTipo", Me.cboCbteTipo_SEARCH.SelectedValue))
        End If
        If (Me.txtPtoVta_SEARCH.Text <> "") Then
            objQueryParameters.Add(New SqlParameter("@PtoVta", Integer.Parse(Me.txtPtoVta_SEARCH.Text)))
        End If
        If (Me.txtCbteNro_SEARCH.Text <> "") Then
            objQueryParameters.Add(New SqlParameter("@CbteNro", Integer.Parse(Me.txtCbteNro_SEARCH.Text)))
        End If
        If (Me.txtCbteFecha_SEARCH.Text <> "") Then
            objQueryParameters.Add(New SqlParameter("@CbteFecha", Me.txtCbteFecha_SEARCH.Text))
        End If
        If (Me.cboESTADO_ID_SEARCH.SelectedValue <> "") Then
            objQueryParameters.Add(New SqlParameter("@ESTADO_ID", Me.cboESTADO_ID_SEARCH.SelectedValue))
        End If
        Me.objWebDataBinder.ClearContents()
        objCRUDManagerHeader.DoQueryList_Param(objQueryParameters)
    End Sub

    Private Sub CleanSearchControls()
        Me.cboCbteTipo_SEARCH.SelectedIndex = 0
        Me.txtPtoVta_SEARCH.Text = ""
        Me.txtCbteNro_SEARCH.Text = ""
        Me.txtCbteFecha_SEARCH.Text = ""
        Me.cboESTADO_ID_SEARCH.SelectedIndex = 0
        Me.objWebDataBinder.ClearContents()
        Me.dgrList.DataSource = Nothing
        Me.dgrList.DataBind()
        Me.objCRUDManagerHeader.ResetForm()
    End Sub


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

        Try

        
            Dim engine As New AfipConnector(dtrEmpresa)
            Dim comprobante As AFIP.WSFEv1.FECompConsResponse = engine.FECompConsultar(Integer.Parse(Me.cboCbteTipo.SelectedValue), Integer.Parse(Me.txtCbteNro.Text), Integer.Parse(Me.txtPtoVta.Text))
            Dim oXS As New System.Xml.Serialization.XmlSerializer(comprobante.GetType())
            Dim sw As New IO.StringWriter()

            oXS.Serialize(sw, comprobante)

            Dim strControlDataXML As String = sw.ToString()

            Dim xmldoc As New System.Xml.XmlDocument
            strControlDataXML = strControlDataXML.Replace("<?xml version=""1.0"" encoding=""utf-16""?>", "").Replace(" xmlns=""http://ar.gov.afip.dif.FEV1/""", "").Replace(" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd=""http://www.w3.org/2001/XMLSchema""", "")

            Me.txtRta.Text = strControlDataXML
        Catch ex As Exception
            Me.txtRta.Text = ex.Message
        End Try
       
    End Sub

    Private Sub objWebDataBinder_PostEnableControls() Handles objWebDataBinder.PostEnableControls
        Me.objWebDataBinder.DisableControls()
        Me.cboESTADO_ID.Enabled = True
        Me.txtCAE.Enabled = True
        Me.txtCAEFchVto.Enabled = True

    End Sub

    Private Sub frmCRUDDOCUMENTOS_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'Me.objCRUDToolBarHeader.ButtonDelete.Visible = False
        Me.objCRUDToolBarHeader.ButtonNew.Visible = False
    End Sub
End Class

