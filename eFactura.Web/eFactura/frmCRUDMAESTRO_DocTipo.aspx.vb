Option Explicit On
Option Strict On
Imports System
Imports System.Collections
Imports System.Data.SqlClient

Public Partial Class frmCRUDMAESTRO_DocTipo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub objWebDataBinder_DeclareBindings() Handles objWebDataBinder.DeclareBindings
objWebDataBinder.Add(Me.txtDescripcion.ID,false)
objWebDataBinder.Add(Me.txtCODIGO_ERP.ID,false)
End Sub

    '$objCRUDManagerHeader_OnQueryFixedData()$
    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click 
 Me.ExecuteSearch() 
End Sub

    Private Sub btnClean_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClean.Click 
 Me.CleanSearchControls() 
End Sub

    Private Sub ExecuteSearch()
Dim objQueryParameters As ArrayList = New ArrayList
If (Me.txtCodigo_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@Codigo",Integer.Parse(Me.txtCodigo_SEARCH.Text)))
End If
If (Me.txtDescripcion_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@Descripcion",Me.txtDescripcion_SEARCH.Text))
End If
If (Me.txtCODIGO_ERP_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@CODIGO_ERP",Me.txtCODIGO_ERP_SEARCH.Text))
End If
Me.objWebDataBinder.ClearContents()
objCRUDManagerHeader.DoQueryList_Param(objQueryParameters)
End Sub

    Private Sub CleanSearchControls()
Me.txtCodigo_SEARCH.Text = "" 
Me.txtDescripcion_SEARCH.Text = "" 
Me.txtCODIGO_ERP_SEARCH.Text = "" 
Me.objWebDataBinder.ClearContents()
Me.dgrList.DataSource = Nothing
Me.dgrList.DataBind()
Me.objCRUDManagerHeader.ResetForm()
End Sub

    
End Class

 