<%@ Page validateRequest="false" Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDEMPRESAS.aspx.vb" Inherits="eFactura.Web.frmCRUDEMPRESAS" %>

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

                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" 
                            BorderStyle="Solid" BorderWidth="1px" Height="104px" DataGridWidth="" 
                            ScrollTop="0">
<Columns>
<asp:BoundColumn Visible="False" DataField="EMPRESA_ID" HeaderText="EMPRESA_ID" ></asp:BoundColumn><asp:ButtonColumn DataTextField="CUIT" HeaderText="CUIT" CommandName="select"></asp:ButtonColumn><asp:BoundColumn DataField="RAZON_SOCIAL" HeaderText="RAZON_SOCIAL" ></asp:BoundColumn></Columns>
</cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                    <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
<tr>
<td ><cc1:LabelTyped id="lblCUIT" runat="server" CssClass="Label" EnableViewState="False">CUIT</cc1:LabelTyped></td>
<td ><cc1:TextBoxTyped id="txtCUIT" runat="server"  Width="90%" CssClass="TextBox" ToolTip="CUIT"  MaxLength="19" TextBoxWidth="AutoSize"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td ><cc1:LabelTyped id="lblPASSWORD" runat="server" Width="10%" CssClass="Label" EnableViewState="False">PASSWORD</cc1:LabelTyped></td>
<td ><cc1:TextBoxTyped id="txtPASSWORD" runat="server" Width="90%"   CssClass="TextBox" ToolTip="PASSWORD"  MaxLength="250" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblRAZON_SOCIAL" runat="server"  Width="10%" CssClass="Label" EnableViewState="False">RAZON_SOCIAL</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtRAZON_SOCIAL" runat="server" Width="90%"  CssClass="TextBox" ToolTip="RAZON_SOCIAL"  MaxLength="500" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblURL_AFIP_WSAA" runat="server" Width="10%" CssClass="Label" EnableViewState="False">URL_AFIP_WSAA</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtURL_AFIP_WSAA" runat="server" Width="90%"  CssClass="TextBox" ToolTip="URL_AFIP_WSAA"  MaxLength="500" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblURL_AFIP_WSFEv1" runat="server" Width="10%" CssClass="Label" EnableViewState="False">URL_AFIP_WSFEv1</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtURL_AFIP_WSFEv1" runat="server" Width="90%"  CssClass="TextBox" ToolTip="URL_AFIP_WSFEv1"  MaxLength="500" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblRUTA_ARCHIVO_CERTIFICADO" runat="server"  Width="10%" CssClass="Label" EnableViewState="False">RUTA_ARCHIVO_CERTIFICADO</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtRUTA_ARCHIVO_CERTIFICADO" runat="server" Width="90%"  CssClass="TextBox" ToolTip="RUTA_ARCHIVO_CERTIFICADO"  MaxLength="500" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblEMAILS" runat="server" Width="10%" CssClass="Label" EnableViewState="False">EMAILS</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtEMAILS" runat="server"  Width="90%"  CssClass="TextBox" ToolTip="EMAILS"  MaxLength="5000" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="lblTICKET_EXPIRED_DATE" runat="server"  Width="10%" CssClass="Label" EnableViewState="False">TICKET_EXPIRED_DATE</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTICKET_EXPIRED_DATE" runat="server" Width="90%"   CssClass="TextBox" ToolTip="TICKET_EXPIRED_DATE"  MaxLength="10" TextBoxWidth="AutoSize"  TextBoxType="ddMMyyyy" ></cc1:TextBoxTyped></td>
</tr>
<!-- PK 15/07 Se agregarn varios campos _FECRED, pero este campo esta de mas en la base, no se muestra.  
<tr>
<td><cc1:LabelTyped id="LabelTyped1" runat="server" CssClass="Label" EnableViewState="False">[URL_AFIP_WSAA_FECRED]</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtURL_AFIP_WSAA_FECRED" runat="server"  Width="800px" CssClass="TextBox" ToolTip="URL_AFIP_WSAA_FECRED"  MaxLength="500" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
-->
<tr>
<td><cc1:LabelTyped id="LabelTyped2" runat="server" Width="10%" CssClass="Label" EnableViewState="False">URL_AFIP_WSFEv1_FECRED</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtURL_AFIP_WSFEv1_FECRED" runat="server"  Width="90%" CssClass="TextBox" ToolTip="URL_AFIP_WSFEv1_FECRED"  MaxLength="500" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings" ></cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="LabelTyped3" runat="server" Width="10%" CssClass="Label" EnableViewState="False">TICKET_EXPIRED_DATE_FECRED</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTICKET_EXPIRED_DATE_FECRED" runat="server" Width="90%"   CssClass="TextBox" ToolTip="TICKET_EXPIRED_DATE_FECRED"  MaxLength="10" TextBoxWidth="AutoSize"  TextBoxType="ddMMyyyy" ></cc1:TextBoxTyped></td>
</tr>
<!-- PK 17/07 Se agrega INFO_AUXILIAR -->
<tr>
<td><cc1:LabelTyped id="lblINFO_AUXILIAR" runat="server" Width="10%" CssClass="Label" EnableViewState="False">INFO_AUXILIAR</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtINFO_AUXILIAR" runat="server"  Width="90%"  CssClass="TextBox" ToolTip="INFO_AUXILIAR"  MaxLength="5000" TextBoxWidth="UserSize"  TextMode="MultiLine"  TextBoxType="strings"  Rows="5" ></cc1:TextBoxTyped></td>
</tr>

<!-- PK 24/09 Se agrega comprobante -->
<tr>
<td><cc1:LabelTyped id="lblCOMPROBANTE" runat="server" Width="10%" CssClass="Label" EnableViewState="False">CUIT</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtCUITEmisor" runat="server" Width="90%"   CssClass="TextBox" ToolTip="CUIT"  MaxLength="11" TextBoxWidth="AutoSize"  TextBoxType="strings" >30529923461</cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="LabelTIPOCMP" runat="server" Width="10%" CssClass="Label" EnableViewState="False">TIPO_CMP</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtTIPOCMP" runat="server" Width="90%"   CssClass="TextBox" ToolTip="TIPOCMP"  MaxLength="3" TextBoxWidth="AutoSize"  TextBoxType="strings" >201</cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="LabelPTOVTA" runat="server" Width="10%" CssClass="Label" EnableViewState="False">PTO_VTA</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtPTOVTA" runat="server" Width="90%"   CssClass="TextBox" ToolTip="PTOVTA"  MaxLength="3" TextBoxWidth="AutoSize"  TextBoxType="strings" >252</cc1:TextBoxTyped></td>
</tr>
<tr>
<td><cc1:LabelTyped id="LabelNROCMP" runat="server" Width="10%" CssClass="Label" EnableViewState="False">NRO_CMP</cc1:LabelTyped></td>
<td><cc1:TextBoxTyped id="txtNROCMP" runat="server" Width="90%"   CssClass="TextBox" ToolTip="NROCMP"  MaxLength="15" TextBoxWidth="AutoSize"  TextBoxType="strings" >1</cc1:TextBoxTyped></td>
</tr>



                        <tr>
                            <td width="10%">
                                <asp:Button style="width: 100%; height: 10%;" ID="btnViewPOS" runat="server" Text="ver PtoVta en AFIP" />
                                <!-- PK 15/07 Se agrega boton -->
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewFCE" runat="server" Text="Comprobar FCE (cuit=EMAILS)"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewJson" runat="server" Text="Validar Formato INFO AUX"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewOpc" runat="server" Text="Mostrar Opcionales AFIP"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewTiposCbte" runat="server" Text="Mostrar Tipos Cbte AFIP"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewTiposDoc" runat="server" Text="Mostrar Tipos Doc AFIP"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewTiposConcepto" runat="server" Text="Mostrar Tipos Concepto AFIP"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewConsultaFCE" runat="server" Text="Historia Estados Cmp FCE"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewComprobanteFCE" runat="server" Text="Comprobantes FCE"  />
                                <asp:Button style="width: 100%; height: 11%;" ID="btnViewCtaCte" runat="server" Text="Cta Corriente"  />
                            </td>
                            <td width="90%">
                                <asp:TextBox ID="txtRta" runat="server" ReadOnly="True" Rows="20" 
                                    TextMode="MultiLine" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
</table>
 
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="True"
                        BzAssemblyName="eFactura.BusObjects" BzClassName="eFactura.BusObjects.EMPRESAS" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="EMPRESAS" MenuName="objMenu" SearchPanelName=""
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
        
                </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
