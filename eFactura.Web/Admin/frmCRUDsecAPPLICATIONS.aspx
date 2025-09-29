<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecAPPLICATIONS.aspx.vb"
    Inherits="ASFSec.Web.frmCRUDsecAPPLICATIONS" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    
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
                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader"
                        Title="Applications" />
                    <cc1:ResultsDataGrid  ID="dgrList" runat="server" AutoGenerateColumns="False"
                        BorderStyle="Solid" BorderWidth="1px" Height="104px" DataGridWidth="">
                        <Columns>
                            <asp:BoundColumn DataField="APPLICATION_NBR" HeaderText="#"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EN_APPLICATION_NM" HeaderText="English Name"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ES_APPLICATION_NM" HeaderText="Spanish Name"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PT_APPLICATION_NM" HeaderText="Portuguese Name"></asp:BoundColumn>
                            <asp:ButtonColumn DataTextField="DISPLAY_ORDER_NBR" HeaderText="Display Order" CommandName="select">
                            </asp:ButtonColumn>
                        </Columns>
                    </cc1:ResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                        <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblAPPLICATION_NBR" runat="server" CssClass="Label" EnableViewState="False">Application</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtAPPLICATION_NBR" runat="server" Width="40px" CssClass="TextBox"
                                        ToolTip="Application" MaxLength="5" TextBoxWidth="AutoSize" TextBoxType="integers"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblEN_APPLICATION_NM" runat="server" CssClass="Label" EnableViewState="False">English Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtEN_APPLICATION_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="English Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblES_APPLICATION_NM" runat="server" CssClass="Label" EnableViewState="False">Spanish Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtES_APPLICATION_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Spanish Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblPT_APPLICATION_NM" runat="server" CssClass="Label" EnableViewState="False">Portuguese Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtPT_APPLICATION_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Portuguese Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblDISPLAY_ORDER_NBR" runat="server" CssClass="Label" EnableViewState="False">Display Order</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtDISPLAY_ORDER_NBR" runat="server" Width="40px" CssClass="TextBox"
                                        ToolTip="Display Order" MaxLength="5" TextBoxWidth="AutoSize" TextBoxType="integers"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="True"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secAPPLICATIONS"
                        CRUDToolBarName="objCRUDToolBarHeader" DataGridQueryListName="dgrList" DataMemberName="secAPPLICATIONS"
                        MenuName="objMenu" SearchPanelName="" WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
