Option Explicit On
Option Strict On
Imports System
Imports System.Collections
Imports System.Data.SqlClient

Public Partial Class frmCRUDsecSTATES
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub objWebDataBinder_DeclareBindings() Handles objWebDataBinder.DeclareBindings
        objWebDataBinder.Add(Me.txtSTATE_CD.ID, True)
        objWebDataBinder.Add(Me.txtSTATE_NM.ID, True)
        objWebDataBinder.Add(Me.cboCOUNTRY_CD.ID)
    End Sub

    Private Sub objCRUDManagerHeader_OnQueryFixedData() Handles objCRUDManagerHeader.OnQueryFixedData
Dim dstCombos As DataSet = objCRUDManagerHeader.GetFixedData(Nothing)
Me.cboCOUNTRY_CD.SetSource(dstCombos.Tables("secCOUNTRIES"))
Me.cboCOUNTRY_CD_SEARCH.SetSource(dstCombos.Tables("secCOUNTRIES"),ASF.WebControls.ComboBoxFirstItem.All)
End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click 
 Me.ExecuteSearch() 
End Sub

    Private Sub btnClean_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClean.Click 
 Me.CleanSearchControls() 
End Sub

    Private Sub ExecuteSearch()
Dim objQueryParameters As ArrayList = New ArrayList
If (Me.cboCOUNTRY_CD_SEARCH.SelectedValue <> "") Then
   objQueryParameters.Add(New SqlParameter("@COUNTRY_CD", Me.cboCOUNTRY_CD_SEARCH.SelectedValue))
End If
If (Me.txtSTATE_NM_SEARCH.Text <> "") Then
   objQueryParameters.Add(New SqlParameter("@STATE_NM",Me.txtSTATE_NM_SEARCH.Text))
End If
Me.objWebDataBinder.ClearContents()
objCRUDManagerHeader.DoQueryList_Param(objQueryParameters)
End Sub

    Private Sub CleanSearchControls()
Me.cboCOUNTRY_CD_SEARCH.SelectedIndex = 0 
Me.txtSTATE_NM_SEARCH.Text = "" 
Me.objWebDataBinder.ClearContents()
Me.dgrList.DataSource = Nothing
Me.dgrList.DataBind()
Me.objCRUDManagerHeader.ResetForm()
End Sub

    
End Class

 