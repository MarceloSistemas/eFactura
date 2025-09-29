<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDPARAMETROS.aspx.vb" Inherits="eFactura.Web.frmCRUDPARAMETROS" %>

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
                                        <cc1:LabelTyped ID="lbltxtPARAMETRO_ID_SEARCH" runat="server" CssClass="Label" EnableViewState="False">PARAMETRO_ID</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtPARAMETRO_ID_SEARCH" runat="server" Width="400px" CssClass="TextBox" ToolTip="PARAMETRO_ID" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped></td>
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
                                <asp:BoundColumn DataField="PARAMETRO_ID" HeaderText="PARAMETRO_ID"></asp:BoundColumn>
                                <asp:ButtonColumn DataTextField="DESCRIPCION" HeaderText="DESCRIPCION" CommandName="select"></asp:ButtonColumn>
                                <asp:BoundColumn DataField="VALOR" HeaderText="VALOR"></asp:BoundColumn>
                            </Columns>
                        </cc1:SearchResultsDataGrid>
                        <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                            <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblDESCRIPCION" runat="server" CssClass="Label" EnableViewState="False">DESCRIPCION</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtDESCRIPCION" runat="server" Width="800px" CssClass="TextBox" ToolTip="DESCRIPCION" MaxLength="500" TextBoxWidth="UserSize" TextMode="MultiLine" TextBoxType="strings"></cc1:TextBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblVALOR" runat="server" CssClass="Label" EnableViewState="False">VALOR</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtVALOR" runat="server" Width="800px" CssClass="TextBox" ToolTip="VALOR" MaxLength="5000" TextBoxWidth="UserSize" TextMode="MultiLine" TextBoxType="strings"></cc1:TextBoxTyped></td>
                                </tr>
                            </table>

                        </asp:Panel>
                        <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                        </cc1:WebDataBinder>
                        <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                            BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.PARAMETROS" CRUDToolBarName="objCRUDToolBarHeader"
                            DataGridQueryListName="dgrList" DataMemberName="PARAMETROS" MenuName="objMenu" SearchPanelName="PanelSearch"
                            WebDataBinderName="objWebDataBinder">
                        </cc1:CRUDManagerHeader>

                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
