<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDMAESTRO_ESTADOS_DOCUMENTO.aspx.vb" Inherits="eFactura.Web.frmCRUDMAESTRO_ESTADOS_DOCUMENTO" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="~/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="CMS">
            <cc1:HelperMenu ID="objMenu" runat="server" />
            <div class="content_wrapper">
                <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
                <div class="content_area">
                    <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                    <div class="action_area">

                        <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="" />
                        <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                            <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lbltxtESTADO_ID_SEARCH" runat="server" CssClass="Label" EnableViewState="False">ESTADO_ID</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtESTADO_ID_SEARCH" runat="server" Width="8px" CssClass="TextBox" ToolTip="ESTADO_ID" MaxLength="1" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lbltxtDESCRIPCION_SEARCH" runat="server" CssClass="Label" EnableViewState="False">DESCRIPCION</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtDESCRIPCION_SEARCH" runat="server" Width="800px" CssClass="TextBox" ToolTip="DESCRIPCION" MaxLength="250" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped><cc1:ButtonTyped ID="btnClean" runat="server" CssClass="Button" Text="Clean"></cc1:ButtonTyped></td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Height="104px">
                            <Columns>
                                <asp:BoundColumn DataField="ESTADO_ID" HeaderText="ESTADO_ID"></asp:BoundColumn>
                                <asp:ButtonColumn DataTextField="DESCRIPCION" HeaderText="DESCRIPCION" CommandName="select"></asp:ButtonColumn>
                            </Columns>
                        </cc1:SearchResultsDataGrid>
                        <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                            <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblDESCRIPCION" runat="server" CssClass="Label" EnableViewState="False">DESCRIPCION</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtDESCRIPCION" runat="server" Width="800px" CssClass="TextBox" ToolTip="DESCRIPCION" MaxLength="250" TextBoxWidth="UserSize" TextMode="MultiLine" TextBoxType="strings"></cc1:TextBoxTyped></td>
                                </tr>
                            </table>

                        </asp:Panel>
                        <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                        </cc1:WebDataBinder>
                        <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                            BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.MAESTRO_ESTADOS_DOCUMENTO" CRUDToolBarName="objCRUDToolBarHeader"
                            DataGridQueryListName="dgrList" DataMemberName="MAESTRO_ESTADOS_DOCUMENTO" MenuName="objMenu" SearchPanelName="PanelSearch"
                            WebDataBinderName="objWebDataBinder">
                        </cc1:CRUDManagerHeader>

                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
