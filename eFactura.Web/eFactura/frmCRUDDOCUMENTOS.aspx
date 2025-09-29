

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDDOCUMENTOS.aspx.vb" Inherits="eFactura.Web.frmCRUDDOCUMENTOS" %>

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

                        <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader" Title="Documentos" />
                        <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                            <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lbltxtCbteFecha_SEARCH" runat="server" CssClass="Label"
                                            EnableViewState="False">fecha Comprobante</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtCbteFecha_SEARCH" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="strings" TextBoxWidth="UserSize"
                                            ToolTip="fecha Comprobante" Width="64px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblcboESTADO_ID_SEARCH" runat="server" CssClass="Label"
        EnableViewState="False">Estado</cc1:LabelTyped>
                                        &nbsp;
    <cc1:ComboBoxTyped ID="cboESTADO_ID_SEARCH" runat="server" CssClass="TextBox"
        ToolTip="Estado" Width="448px">
    </cc1:ComboBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblcboCbteTipo_SEARCH" runat="server" CssClass="Label"
                                            EnableViewState="False">Tipo Comprobante</cc1:LabelTyped>
                                    </td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboCbteTipo_SEARCH" runat="server" CssClass="TextBox"
                                            ToolTip="Tipo Comprobante" Width="300px">
                                        </cc1:ComboBoxTyped>
                                        &nbsp;
            <cc1:LabelTyped ID="lbltxtPtoVta_SEARCH" runat="server" CssClass="Label"
                EnableViewState="False">Punto de Venta</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtPtoVta_SEARCH" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="integers" TextBoxWidth="UserSize"
                                            ToolTip="Punto de Venta" Width="64px"></cc1:TextBoxTyped>
                                        &nbsp;&nbsp;
            <cc1:LabelTyped ID="lbltxtCbteNro_SEARCH" runat="server" CssClass="Label"
                EnableViewState="False">Número</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtCbteNro_SEARCH" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="integers" TextBoxWidth="UserSize" ToolTip="Número"
                                            Width="64px"></cc1:TextBoxTyped>
                                        <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button"
                                            Text="Search" />
                                        <cc1:ButtonTyped ID="btnClean" runat="server" CssClass="Button" Text="Reset" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                                                <div style="width:100%; height:200px;overflow:scroll" >
                        <asp:DataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" Height="104px" DataGridWidth="" ScrollTop="0" CssClass="DataGrid">
                            <Columns>
                                <asp:BoundColumn DataField="DOCUMENTO_ID" HeaderText="ID" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:ButtonColumn DataTextField="PtoVta" HeaderText="Punto de Venta" CommandName="select" HeaderStyle-CssClass="DataGridHeader"></asp:ButtonColumn>
                                <asp:BoundColumn DataField="Tipo" HeaderText="Tipo" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="CbteNro" HeaderText="Número" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Moneda" HeaderText="Moneda" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ImpTotal" HeaderText="Total" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Estado" HeaderText="Estado" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="FECHA_ACTUALIZACION" HeaderText="Fecha Actualización" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Error" HeaderText="ERROR" HeaderStyle-CssClass="DataGridHeader" ItemStyle-CssClass="DataGridItem"></asp:BoundColumn>
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
                                        <cc1:LabelTyped ID="lblCbteTipo" runat="server" CssClass="Label" EnableViewState="False">Tipo Comprobante</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboCbteTipo" runat="server" Width="300px"
                                            CssClass="TextBox" ToolTip="Tipo Comprobante">
                                        </cc1:ComboBoxTyped>&nbsp;
    <cc1:LabelTyped ID="lblPtoVta" runat="server" CssClass="Label"
        EnableViewState="False">Punto de Venta</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtPtoVta" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="integers" TextBoxWidth="AutoSize"
                                            ToolTip="Punto de Venta" Width="64px"></cc1:TextBoxTyped>
                                        &nbsp;<cc1:LabelTyped ID="lblCbteNro" runat="server" CssClass="Label"
                                            EnableViewState="False">Número</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtCbteNro" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="integers" TextBoxWidth="AutoSize" ToolTip="Número"
                                            Width="64px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblConcepto" runat="server" CssClass="Label"
        EnableViewState="False">Concepto</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtConcepto" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="integers" TextBoxWidth="AutoSize" ToolTip="Concepto"
                                            Width="64px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblDocTipo" runat="server" CssClass="Label" EnableViewState="False">Tipo Documento</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboDocTipo" runat="server" Width="400px"
                                            CssClass="TextBox" ToolTip="Tipo Documento">
                                        </cc1:ComboBoxTyped>
                                        <cc1:LabelTyped ID="lblDocNro" runat="server" CssClass="Label"
                                            EnableViewState="False">Nro Documento</cc1:LabelTyped>
                                        <cc1:TextBoxTyped ID="txtDocNro" runat="server" CssClass="TextBox"
                                            MaxLength="19" TextBoxType="strings" TextBoxWidth="AutoSize"
                                            ToolTip="Nro Documento" Width="152px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblImpTotal" runat="server" CssClass="Label"
                                            EnableViewState="False">Total</cc1:LabelTyped>
                                    </td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtImpTotal" runat="server" CssClass="TextBox"
                                            MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Total"
                                            Width="160px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblImpTotConc" runat="server" CssClass="Label"
        EnableViewState="False">Neto No gravado</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtImpTotConc" runat="server" CssClass="TextBox"
                                            MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize"
                                            ToolTip="Neto No gravado" Width="160px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblImpNeto" runat="server" CssClass="Label"
        EnableViewState="False">Neto</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtImpNeto" runat="server" CssClass="TextBox"
                                            MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Neto"
                                            Width="160px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblImpOpEx" runat="server" CssClass="Label"
        EnableViewState="False">Excento</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtImpOpEx" runat="server" CssClass="TextBox"
                                            MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Excento"
                                            Width="160px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblImpIva" runat="server" CssClass="Label"
                                            EnableViewState="False">Iva</cc1:LabelTyped>
                                    </td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtImpIva" runat="server" CssClass="TextBox"
                                            MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Iva"
                                            Width="160px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblImpTrib" runat="server" CssClass="Label"
        EnableViewState="False">Tributos</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtImpTrib" runat="server" CssClass="TextBox"
                                            MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Tributos"
                                            Width="160px"></cc1:TextBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblCbteFecha" runat="server" CssClass="Label"
        EnableViewState="False">fecha Comprobante</cc1:LabelTyped>
                                        &nbsp;<cc1:TextBoxTyped ID="txtCbteFecha" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="strings" TextBoxWidth="AutoSize"
                                            ToolTip="fecha Comprobante" Width="64px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblFchServDesde" runat="server" CssClass="Label" EnableViewState="False">FchServDesde</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtFchServDesde" runat="server" Width="64px" CssClass="TextBox" ToolTip="FchServDesde" MaxLength="8" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                        <cc1:LabelTyped ID="lblFchServHasta" runat="server" CssClass="Label"
                                            EnableViewState="False">FchServHasta</cc1:LabelTyped>
                                        <cc1:TextBoxTyped ID="txtFchServHasta" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="strings" TextBoxWidth="AutoSize"
                                            ToolTip="FchServHasta" Width="64px"></cc1:TextBoxTyped>
                                        <cc1:LabelTyped ID="lblFchVtoPago" runat="server" CssClass="Label"
                                            EnableViewState="False">FchVtoPago</cc1:LabelTyped>
                                        <cc1:TextBoxTyped ID="txtFchVtoPago" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="strings" TextBoxWidth="AutoSize"
                                            ToolTip="FchVtoPago" Width="64px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblMonId" runat="server" CssClass="Label"
                                            EnableViewState="False">Moneda</cc1:LabelTyped>
                                    </td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboMonId" runat="server" CssClass="TextBox"
                                            ToolTip="Moneda" Width="400px">
                                        </cc1:ComboBoxTyped>
                                        &nbsp;
    <cc1:LabelTyped ID="lblMonCotiz" runat="server" CssClass="Label"
        EnableViewState="False">Cotización</cc1:LabelTyped>
                                        &nbsp;
    <cc1:TextBoxTyped ID="txtMonCotiz" runat="server" CssClass="TextBox"
        MaxLength="20" TextBoxType="strings" TextBoxWidth="AutoSize"
        ToolTip="Cotización" Width="160px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblESTADO_ID" runat="server" CssClass="Label"
                                            EnableViewState="False">Estado</cc1:LabelTyped>
                                    </td>
                                    <td>
                                        <cc1:ComboBoxTyped ID="cboESTADO_ID" runat="server" CssClass="TextBox"
                                            ToolTip="Estado" Width="400px">
                                        </cc1:ComboBoxTyped>
                                        <cc1:LabelTyped ID="lblFECHA_ALTA" runat="server" CssClass="Label"
                                            EnableViewState="False">Fecha Alta</cc1:LabelTyped>
                                        <cc1:TextBoxTyped ID="txtFECHA_ALTA" runat="server" CssClass="TextBox"
                                            MaxLength="10" TextBoxType="CultureDate" TextBoxWidth="AutoSize"
                                            ToolTip="Fecha Alta" Width="80px"></cc1:TextBoxTyped>
                                        <cc1:LabelTyped ID="lblFECHA_ACTUALIZACION" runat="server" CssClass="Label"
                                            EnableViewState="False">Fecha Actualización</cc1:LabelTyped>
                                        <cc1:TextBoxTyped ID="txtFECHA_ACTUALIZACION" runat="server" CssClass="TextBox"
                                            MaxLength="10" TextBoxType="CultureDate" TextBoxWidth="AutoSize"
                                            ToolTip="Fecha Actualización" Width="80px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblCAE" runat="server" CssClass="Label" EnableViewState="False">CAE</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtCAE" runat="server" Width="112px" CssClass="TextBox" ToolTip="CAE" MaxLength="14" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                        <cc1:LabelTyped ID="lblCAEFchVto" runat="server" CssClass="Label"
                                            EnableViewState="False">VTO CAE</cc1:LabelTyped>
                                        <cc1:TextBoxTyped ID="txtCAEFchVto" runat="server" CssClass="TextBox"
                                            MaxLength="8" TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="VTO CAE"
                                            Width="64px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblError" runat="server" CssClass="Label" EnableViewState="False">ERROR</cc1:LabelTyped></td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtError" runat="server" Width="800px" CssClass="TextBox" ToolTip="ERROR" MaxLength="2500" TextBoxWidth="UserSize" TextMode="MultiLine" TextBoxType="strings"></cc1:TextBoxTyped></td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:LabelTyped ID="lblNOTAS" runat="server" CssClass="Label"
                                            EnableViewState="False">Notas</cc1:LabelTyped>
                                    </td>
                                    <td>
                                        <cc1:TextBoxTyped ID="txtNOTAS" runat="server" CssClass="TextBox"
                                            MaxLength="5000" TextBoxType="strings" TextBoxWidth="UserSize"
                                            TextMode="MultiLine" ToolTip="Notas" Width="800px"></cc1:TextBoxTyped>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnConsultar" runat="server" Text="Ver en AFIP" Height="32px"
                                            Width="127px" />
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
                        <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                            BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.DOCUMENTOS" CRUDToolBarName="objCRUDToolBarHeader"
                            DataGridQueryListName="dgrList" DataMemberName="DOCUMENTOS" MenuName="objMenu" SearchPanelName="PanelSearch"
                            WebDataBinderName="objWebDataBinder">
                        </cc1:CRUDManagerHeader>

                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
    <style>
    .DataGrid .DataGridHeader {
        position: sticky;
        inset-block-start: 0; /* "top" */
    }

  
</style>

</html>
