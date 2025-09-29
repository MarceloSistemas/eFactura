<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecCOUNTRIES.aspx.vb"
    Inherits="ASFSec.Web.frmCRUDsecCOUNTRIES" %>

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
        <cc1:HelperMenu ID="objMenu" runat="server">
        </cc1:HelperMenu>
        <div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
            <div class="content_area">
                <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                <div class="action_area">
                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader"
                        Title="Countries" />
                    <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                        <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td class="style1">
                                    <cc1:LabelTyped ID="lbltxtCOUNTRY_CD_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Code</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtCOUNTRY_CD_SEARCH" runat="server" Width="16px" CssClass="TextBox"
                                        ToolTip="Code" MaxLength="2" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <cc1:LabelTyped ID="lbltxtEN_COUNTRY_NM_SEARCH" runat="server" CssClass="Label" EnableViewState="False">English Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtEN_COUNTRY_NM_SEARCH" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="English Name" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <cc1:LabelTyped ID="lbltxtES_COUNTRY_NM_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Spanish Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtES_COUNTRY_NM_SEARCH" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Spanish Name" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <cc1:LabelTyped ID="lbltxtPT_COUNTRY_NM_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Portuguese Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtPT_COUNTRY_NM_SEARCH" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Portuguese Name" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                    <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped>
                                    <cc1:ButtonTyped ID="btnClean" runat="server" CssClass="Button" Text="Clean"></cc1:ButtonTyped>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid"
                        BorderWidth="1px" Height="104px" Width="100%">
                        <Columns>
                            <asp:BoundColumn DataField="COUNTRY_CD" HeaderText="Code"></asp:BoundColumn>
                            <asp:ButtonColumn DataTextField="EN_COUNTRY_NM" HeaderText="English Name" CommandName="select">
                            </asp:ButtonColumn>
                            <asp:BoundColumn DataField="ES_COUNTRY_NM" HeaderText="Spanish Name"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PT_COUNTRY_NM" HeaderText="Portuguese Name"></asp:BoundColumn>
                        </Columns>
                    </cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                        <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblCOUNTRY_CD" runat="server" CssClass="Label" EnableViewState="False">Code</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtCOUNTRY_CD" runat="server" Width="16px" CssClass="TextBox"
                                        ToolTip="Code" MaxLength="2" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblEN_COUNTRY_NM" runat="server" CssClass="Label" EnableViewState="False">English Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtEN_COUNTRY_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="English Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblES_COUNTRY_NM" runat="server" CssClass="Label" EnableViewState="False">Spanish Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtES_COUNTRY_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Spanish Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblPT_COUNTRY_NM" runat="server" CssClass="Label" EnableViewState="False">Portuguese Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtPT_COUNTRY_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Portuguese Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secCOUNTRIES"
                        CRUDToolBarName="objCRUDToolBarHeader" DataGridQueryListName="dgrList" DataMemberName="secCOUNTRIES"
                        MenuName="objMenu" SearchPanelName="PanelSearch" WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
