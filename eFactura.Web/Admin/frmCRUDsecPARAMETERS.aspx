<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecPARAMETERS.aspx.vb" Inherits="ASFSec.Web.frmCRUDsecPARAMETERS" %>
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

                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" 
                        CRUDManagerName="objCRUDManagerHeader" Title="Parameters" />
                    <asp:panel id="PanelSearch" runat="server" CssClass="PanelSearchForm">
<table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
<tr>
<td><cc1:LabelTyped id="lblcboAPPLICATION_NBR_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Application</cc1:LabelTyped></td>
<td><cc1:ComboBoxTyped id="cboAPPLICATION_NBR_SEARCH" runat="server"  Width="336px" 
        CssClass="TextBox" ToolTip="Application"></cc1:ComboBoxTyped>&nbsp;&nbsp;
    <cc1:LabelTyped ID="lbltxtPARAMETER_CD_SEARCH" runat="server" CssClass="Label" 
        EnableViewState="False">Code</cc1:LabelTyped>
    &nbsp;<cc1:TextBoxTyped ID="txtPARAMETER_CD_SEARCH" runat="server" 
        CssClass="TextBox" MaxLength="50" TextBoxType="strings" TextBoxWidth="UserSize" 
        ToolTip="PARAMETER_CD" Width="318px"></cc1:TextBoxTyped>
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
<asp:BoundColumn DataField="PARAMETER_CD" HeaderText="Code" ></asp:BoundColumn><asp:ButtonColumn DataTextField="PARAMETER_DESC" HeaderText="Description" CommandName="select"></asp:ButtonColumn><asp:BoundColumn Visible="False" DataField="EN_PARAMETER_VALUE_TXT" HeaderText="English Value" ></asp:BoundColumn><asp:BoundColumn DataField="EN_APPLICATION_NM" HeaderText="Application" ></asp:BoundColumn></Columns>
</cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
<tr>
<td><cc1:LabelTyped id="lblPARAMETER_CD" runat="server" CssClass="Label" EnableViewState="False">Code</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtPARAMETER_CD" runat="server"  Width="400px" CssClass="TextBox" ToolTip="PARAMETER_CD"  MaxLength="50" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <cc1:LabelTyped ID="lblIS_TRANSLATED_FG" runat="server" CssClass="Label" 
        EnableViewState="False">Language Independent</cc1:LabelTyped>
    &nbsp;<cc1:CheckBoxTyped ID="chkLANGUAGE_INDEPENDENT_FG" runat="server" CssClass="TextBox" 
        ToolTip="LANGUAGE INDEPENDENT" Width="20px" />
    </td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblPARAMETER_DESC" runat="server" CssClass="Label" EnableViewState="False">Description</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtPARAMETER_DESC" runat="server"  Width="800px" CssClass="TextBox" ToolTip="Description"  MaxLength="100" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblAPPLICATION_NBR" runat="server" CssClass="Label" EnableViewState="False">Application</cc1:LabelTyped></td>
<td><cc1:ComboBoxTyped id="cboAPPLICATION_NBR" runat="server"  Width="363px" 
        CssClass="TextBox" ToolTip="Application"></cc1:ComboBoxTyped>&nbsp;&nbsp;
    <cc1:LabelTyped ID="lblPARAMETER_TYPE_CD" runat="server" CssClass="Label" 
        EnableViewState="False">Type</cc1:LabelTyped>
    &nbsp;<cc1:ComboBoxTyped ID="cboPARAMETER_TYPE_CD" runat="server" CssClass="TextBox" 
        ToolTip="Type" Width="400px">
    </cc1:ComboBoxTyped>
    </td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblEN_PARAMETER_VALUE_TXT" runat="server" CssClass="Label" EnableViewState="False">English Value</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtEN_PARAMETER_VALUE_TXT" runat="server" Rows="10" Width="800px" CssClass="TextBox" ToolTip="English Value"  MaxLength="999" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblES_PARAMETER_VALUE_TXT" runat="server" CssClass="Label" EnableViewState="False">Spanish Value</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtES_PARAMETER_VALUE_TXT" runat="server" Rows="10" Width="800px" CssClass="TextBox" ToolTip="Spanish Value"  MaxLength="999" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblPT_PARAMETER_VALUE_TXT" runat="server" CssClass="Label" EnableViewState="False">Portuguese Value</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtPT_PARAMETER_VALUE_TXT" runat="server" Rows="10" Width="800px" CssClass="TextBox" ToolTip="Portuguese Value"  MaxLength="999" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secPARAMETERS" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="secPARAMETERS" MenuName="objMenu" SearchPanelName="PanelSearch"
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
</div>
</div>
</div>
    
    </div>
    </form>
</body>
</html>
