


<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDPUNTO_VENTA_CONTROL.aspx.vb" Inherits="eFactura.Web.frmCRUDPUNTO_VENTA_CONTROL" %>

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

                        <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="Puntos de Venta" />

                        <div style="width:100%; height:200px;overflow:scroll" >
                        <asp:DataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Height="104px" CssClass="DataGrid">
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="PUNTO_VENTA" HeaderText="PUNTO_VENTA" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:ButtonColumn DataTextField="PtoVta" HeaderText="Punto Venta" CommandName="select" HeaderStyle-CssClass="DataGridHeader" ></asp:ButtonColumn>
                                <asp:BoundColumn DataField="CbteNro" HeaderText="Número" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Descripcion" HeaderText="Descripcion" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                            </div>
                        <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                            <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblEMPRESA_ID" runat="server" CssClass="Label" EnableViewState="False">Empresa</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboEMPRESA_ID" runat="server" Width="800px" CssClass="TextBox" ToolTip="Empresa"></cc1:ComboBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblPtoVta" runat="server" CssClass="Label" EnableViewState="False">Punto Venta</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtPtoVta" runat="server" Width="64px" CssClass="TextBox" ToolTip="Punto Venta" MaxLength="8" TextBoxWidth="AutoSize" TextBoxType="integers"></cc1:TextBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblCbteTipo" runat="server" CssClass="Label" EnableViewState="False">Tipo Comprobante</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboCbteTipo" runat="server" Width="800px"
                                            CssClass="TextBox" ToolTip="Tipo Comprobante">
                                        </cc1:ComboBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblCbteNro" runat="server" CssClass="Label" EnableViewState="False">Número</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtCbteNro" runat="server" Width="64px" CssClass="TextBox" ToolTip="Número" MaxLength="8" TextBoxWidth="AutoSize" TextBoxType="integers"></cc1:TextBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnConsultar" runat="server" Text="ver último AFIP" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRta" runat="server" ReadOnly="True" Rows="10"
                                            TextMode="MultiLine" Width="782px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>
                        <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                        </cc1:WebDataBinder>
                        <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="True"
                            BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.PUNTO_VENTA_CONTROL" CRUDToolBarName="objCRUDToolBarHeader"
                            DataGridQueryListName="dgrList" DataMemberName="PUNTO_VENTA_CONTROL" MenuName="objMenu" SearchPanelName=""
                            WebDataBinderName="objWebDataBinder">
                        </cc1:CRUDManagerHeader>

                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
    <style>
    .DataGridHeader {
        position: sticky;
        inset-block-start: 0; /* "top" */
    }

    DataGrid tfoot {
        position: sticky;
        inset-block-end: 0; /* "bottom" */
        background-color:#054172;
        color: white;
    }
</style>

</html>
