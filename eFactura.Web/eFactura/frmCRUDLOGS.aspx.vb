Option Explicit On
Option Strict On
Imports System
Imports System.Collections
Imports System.Data.SqlClient

Public Partial Class frmCRUDLOGS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub objWebDataBinder_DeclareBindings() Handles objWebDataBinder.DeclareBindings
objWebDataBinder.Add(Me.txtFECHA.ID,false)
objWebDataBinder.Add(Me.txtTIPO.ID,false)
objWebDataBinder.Add(Me.txtTEXTO.ID,false)
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
If (Me.txtLOG_ID_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@LOG_ID",Integer.Parse(Me.txtLOG_ID_SEARCH.Text)))
End If
If (Me.txtFECHA_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@FECHA",Me.txtFECHA_SEARCH.GetDate()))
End If
If (Me.txtTIPO_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@TIPO",Me.txtTIPO_SEARCH.Text))
End If
If (Me.txtTEXTO_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@TEXTO",Me.txtTEXTO_SEARCH.Text))
End If
Me.objWebDataBinder.ClearContents()
objCRUDManagerHeader.DoQueryList_Param(objQueryParameters)
End Sub

    Private Sub CleanSearchControls()
Me.txtLOG_ID_SEARCH.Text = "" 
Me.txtFECHA_SEARCH.Text = "" 
Me.txtTIPO_SEARCH.Text = "" 
Me.txtTEXTO_SEARCH.Text = "" 
Me.objWebDataBinder.ClearContents()
Me.dgrList.DataSource = Nothing
Me.dgrList.DataBind()
Me.objCRUDManagerHeader.ResetForm()
End Sub

    
End Class

 