<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecLANGUAGES.aspx.vb" Inherits="ASFSec.Web.frmCRUDsecLANGUAGES" %>

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
    <cc1:HelperMenu id="objMenu" runat="server"></cc1:HelperMenu>
                <div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
            <div class="content_area">
                <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                <div class="action_area">

                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="Languages" />
                    
                    <cc1:ResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="Solid" BorderWidth="1px" Height="104px" Width="100%" 
                        DataGridWidth="">
<Columns>
<asp:BoundColumn DataField="LANGUAGE_CD" HeaderText="Code" ></asp:BoundColumn><asp:ButtonColumn DataTextField="LANGUAGE_NM" HeaderText="Name" CommandName="select"></asp:ButtonColumn></Columns>
</cc1:ResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
<tr>
<td><cc1:LabelTyped id="lblLANGUAGE_CD" runat="server" CssClass="Label" EnableViewState="False">Code</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtLANGUAGE_CD" runat="server"  Width="16px" CssClass="TextBox" ToolTip="Code"  MaxLength="2" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblLANGUAGE_NM" runat="server" CssClass="Label" EnableViewState="False">Name</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtLANGUAGE_NM" runat="server"  Width="400px" CssClass="TextBox" ToolTip="Name"  MaxLength="50" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblFLAG_TXT" runat="server" CssClass="Label" EnableViewState="False">Image Flag</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtFLAG_TXT" runat="server"  Width="800px" CssClass="TextBox" ToolTip="Image Flag"  MaxLength="100" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="True"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secLANGUAGES" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="secLANGUAGES" MenuName="objMenu" SearchPanelName=""
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
                    </div>
                    </div>
                    </div>
                    
    
    </div>
    </form>
</body>
</html>
