<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDLOGS.aspx.vb" Inherits="eFactura.Web.frmCRUDLOGS" %>

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
    <cc1:HelperMenu id="objMenu"  runat="server"/>
    	<div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
                <div class="content_area">
                   <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                    <div class="action_area">
    
                      <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="" />
                    <asp:panel id="PanelSearch" runat="server" CssClass="PanelSearchForm">
<table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
<tr>
<td><cc1:LabelTyped id="lbltxtLOG_ID_SEARCH" runat="server" CssClass="Label" EnableViewState="False">LOG_ID</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtLOG_ID_SEARCH" runat="server"  Width="64px" CssClass="TextBox" ToolTip="LOG_ID"  MaxLength="8" TextBoxWidth="UserSize"  TextBoxType="integers" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lbltxtFECHA_SEARCH" runat="server" CssClass="Label" EnableViewState="False">FECHA</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtFECHA_SEARCH" runat="server"  Width="80px" CssClass="TextBox" ToolTip="FECHA"  MaxLength="10" TextBoxWidth="UserSize"  TextBoxType="ddMMyyyy" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lbltxtTIPO_SEARCH" runat="server" CssClass="Label" EnableViewState="False">TIPO</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTIPO_SEARCH" runat="server"  Width="160px" CssClass="TextBox" ToolTip="TIPO"  MaxLength="20" TextBoxWidth="UserSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lbltxtTEXTO_SEARCH" runat="server" CssClass="Label" EnableViewState="False">TEXTO</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTEXTO_SEARCH" runat="server"  Width="800px" CssClass="TextBox" ToolTip="TEXTO"  MaxLength="5000" TextBoxWidth="UserSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr><td></td><td><cc1:ButtonTyped id="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped><cc1:ButtonTyped id="btnClean" runat="server" CssClass="Button" Text="Clean"></cc1:ButtonTyped></td></tr></table></asp:panel>

                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Height="104px">
<Columns>
<asp:BoundColumn Visible="False" DataField="LOG_ID" HeaderText="LOG_ID" ></asp:BoundColumn><asp:ButtonColumn DataTextField="FECHA" HeaderText="FECHA" CommandName="select"></asp:ButtonColumn><asp:BoundColumn DataField="TIPO" HeaderText="TIPO" ></asp:BoundColumn><asp:BoundColumn DataField="TEXTO" HeaderText="TEXTO" ></asp:BoundColumn></Columns>
</cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
<tr>
<td><cc1:LabelTyped id="lblFECHA" runat="server" CssClass="Label" EnableViewState="False">FECHA</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtFECHA" runat="server"  Width="80px" CssClass="TextBox" ToolTip="FECHA"  MaxLength="10" TextBoxWidth="AutoSize"  TextBoxType="ddMMyyyy" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblTIPO" runat="server" CssClass="Label" EnableViewState="False">TIPO</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTIPO" runat="server"  Width="160px" CssClass="TextBox" ToolTip="TIPO"  MaxLength="20" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblTEXTO" runat="server" CssClass="Label" EnableViewState="False">TEXTO</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTEXTO" runat="server"  Width="800px" CssClass="TextBox" ToolTip="TEXTO"  MaxLength="5000" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.LOGS" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="LOGS" MenuName="objMenu" SearchPanelName="PanelSearch"
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
        
                </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
