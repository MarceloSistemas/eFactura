<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecSTATES.aspx.vb" Inherits="Campaigns.Web.frmCRUDsecSTATES" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="~/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="CMS">
    <cc1:HelperMenu id="objMenu" runat="server"/>
    	<div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
                <div class="content_area">
                   <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                    <div class="action_area">
    
                      <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="Country States" />
                    <asp:panel id="PanelSearch" runat="server" CssClass="PanelSearchForm">
<table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
<tr>
<td><cc1:LabelTyped id="lblcboCOUNTRY_CD_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Country</cc1:LabelTyped></td>
<td><cc1:ComboBoxTyped id="cboCOUNTRY_CD_SEARCH" runat="server"  Width="400px" CssClass="TextBox" ToolTip="Country"></cc1:ComboBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lbltxtSTATE_NM_SEARCH" runat="server" CssClass="Label" EnableViewState="False">State Name</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtSTATE_NM_SEARCH" runat="server"  Width="800px" CssClass="TextBox" ToolTip="State Name"  MaxLength="150" TextBoxWidth="UserSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr><td></td><td><cc1:ButtonTyped id="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped><cc1:ButtonTyped id="btnClean" runat="server" CssClass="Button" Text="Clean"></cc1:ButtonTyped></td></tr></table></asp:panel>

                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Height="104px">
<Columns>
<asp:BoundColumn DataField="STATE_CD" HeaderText="State Code" ></asp:BoundColumn><asp:ButtonColumn DataTextField="STATE_NM" HeaderText="State Name" CommandName="select"></asp:ButtonColumn><asp:BoundColumn DataField="EN_COUNTRY_NM" HeaderText="English Name" ></asp:BoundColumn></Columns>
</cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                    <tr>
<td><cc1:LabelTyped id="lblCOUNTRY_CD" runat="server" CssClass="Label" EnableViewState="False">Country</cc1:LabelTyped></td>
<td><cc1:ComboBoxTyped id="cboCOUNTRY_CD" runat="server"  Width="400px" CssClass="TextBox" ToolTip="Country"></cc1:ComboBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblSTATE_CD" runat="server" CssClass="Label" EnableViewState="False">State Code</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtSTATE_CD" runat="server"  Width="20px" CssClass="TextBox" ToolTip="State Code"  MaxLength="2" TextBoxWidth="UserSize"  TextMode="SingleLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>

     
<tr>
<td><cc1:LabelTyped id="lblSTATE_NM" runat="server" CssClass="Label" EnableViewState="False">State Name</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtSTATE_NM" runat="server"  Width="800px" CssClass="TextBox" ToolTip="State Name"  MaxLength="150" TextBoxWidth="UserSize"  TextMode="SingleLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="Campaigns.BusObjects" BzClassName="Campaigns.BusObjects.secSTATES" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="secSTATES" MenuName="objMenu" SearchPanelName="PanelSearch"
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
        
                </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
