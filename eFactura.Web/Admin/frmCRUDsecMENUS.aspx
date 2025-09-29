<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecMENUS.aspx.vb" Inherits="ASFSec.Web.frmCRUDsecMENUS" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="CMS">
    <cc1:HelperMenu id="objMenu" runat="server"></cc1:HelperMenu>
    <div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
            <div class="content_area">
                <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                <div class="action_area">
        
                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="Menus" />
                    <asp:panel id="PanelSearch" runat="server" CssClass="PanelSearchForm">
<table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
<tr>
<td><cc1:LabelTyped id="lblcboAPPLICATION_NBR_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Application</cc1:LabelTyped></td>
<td><cc1:ComboBoxTyped id="cboAPPLICATION_NBR_SEARCH" runat="server"  Width="400px" CssClass="TextBox" ToolTip="Application"></cc1:ComboBoxTyped>
    <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" 
        Text="Search" />
    <cc1:ButtonTyped ID="btnClean" runat="server" CssClass="Button" 
        Text="Clean" />
    </td>
</tr>
                        </table></asp:panel>

                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="Solid" BorderWidth="1px" Height="104px" Width="100%" 
                        DataGridWidth="">
<Columns>
<asp:BoundColumn Visible="False" DataField="MENU_NBR" HeaderText="Menu" ></asp:BoundColumn>
    <asp:BoundColumn DataField="EN_APPLICATION_NM" HeaderText="Application Name" ></asp:BoundColumn>
    <asp:ButtonColumn DataTextField="EN_MENU_NM" HeaderText="Menu Name" 
        CommandName="select"></asp:ButtonColumn><asp:BoundColumn DataField="MENU_ORDER_NBR" HeaderText="Order" ></asp:BoundColumn></Columns>
</cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
<tr>
<td><cc1:LabelTyped id="lblEN_MENU_NM" runat="server" CssClass="Label" EnableViewState="False">English Name</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtEN_MENU_NM" runat="server"  Width="240px" CssClass="TextBox" ToolTip="English Name"  MaxLength="30" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblES_MENU_NM" runat="server" CssClass="Label" EnableViewState="False">Spanish Name</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtES_MENU_NM" runat="server"  Width="240px" CssClass="TextBox" ToolTip="Spanish Name"  MaxLength="30" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblPT_MENU_NM" runat="server" CssClass="Label" EnableViewState="False">Portuguese Name</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtPT_MENU_NM" runat="server"  Width="240px" CssClass="TextBox" ToolTip="Portuguese Name"  MaxLength="30" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblAPPLICATION_NBR" runat="server" CssClass="Label" EnableViewState="False">Application</cc1:LabelTyped></td>
<td><cc1:ComboBoxTyped id="cboAPPLICATION_NBR" runat="server"  Width="400px" CssClass="TextBox" ToolTip="Application"></cc1:ComboBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblMENU_ORDER_NBR" runat="server" CssClass="Label" EnableViewState="False">Order</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtMENU_ORDER_NBR" runat="server"  Width="40px" CssClass="TextBox" ToolTip="Order"  MaxLength="5" TextBoxWidth="AutoSize"  TextBoxType="integers" ></cc1:TextBoxTyped></td>
</tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secMENUS" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="secMENUS" MenuName="objMenu" SearchPanelName="PanelSearch"
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
    
                </div>
            </div>
        </div>
    </div>

    </form>
</body>
</html>
