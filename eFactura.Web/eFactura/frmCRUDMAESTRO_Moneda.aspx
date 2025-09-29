<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDMAESTRO_Moneda.aspx.vb" Inherits="eFactura.Web.frmCRUDMAESTRO_Moneda" %>

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
    
                      <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="" />
                    <asp:panel id="PanelSearch" runat="server" CssClass="PanelSearchForm">
<table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
<tr>
<td><cc1:LabelTyped id="lbltxtCodigo_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Codigo</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtCodigo_SEARCH" runat="server"  Width="24px" CssClass="TextBox" ToolTip="Codigo"  MaxLength="3" TextBoxWidth="UserSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lbltxtDescripcion_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Descripcion</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtDescripcion_SEARCH" runat="server"  Width="800px" CssClass="TextBox" ToolTip="Descripcion"  MaxLength="250" TextBoxWidth="UserSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lbltxtCODIGO_ERP_SEARCH" runat="server" CssClass="Label" EnableViewState="False">CODIGO_ERP</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtCODIGO_ERP_SEARCH" runat="server"  Width="400px" CssClass="TextBox" ToolTip="CODIGO_ERP"  MaxLength="50" TextBoxWidth="UserSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr><td></td><td><cc1:ButtonTyped id="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped><cc1:ButtonTyped id="btnClean" runat="server" CssClass="Button" Text="Clean"></cc1:ButtonTyped></td></tr></table></asp:panel>

                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Height="104px">
<Columns>
<asp:BoundColumn DataField="Codigo" HeaderText="Codigo" ></asp:BoundColumn><asp:ButtonColumn DataTextField="Descripcion" HeaderText="Descripcion" CommandName="select"></asp:ButtonColumn><asp:BoundColumn DataField="CODIGO_ERP" HeaderText="CODIGO_ERP" ></asp:BoundColumn></Columns>
</cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
<tr>
<td><cc1:LabelTyped id="lblDescripcion" runat="server" CssClass="Label" EnableViewState="False">Descripcion</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtDescripcion" runat="server"  Width="800px" CssClass="TextBox" ToolTip="Descripcion"  MaxLength="250" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblCODIGO_ERP" runat="server" CssClass="Label" EnableViewState="False">CODIGO_ERP</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtCODIGO_ERP" runat="server"  Width="400px" CssClass="TextBox" ToolTip="CODIGO_ERP"  MaxLength="50" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.MAESTRO_Moneda" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="MAESTRO_Moneda" MenuName="objMenu" SearchPanelName="PanelSearch"
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
        
                </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
