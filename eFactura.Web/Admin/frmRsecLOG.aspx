<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmRsecLOG.aspx.vb" Inherits="ASFSec.Web.frmRsecLOG" %>

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
                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" Title="Events Log" />
                    
                    <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                        <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lbltxtTYPE_CD_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Type</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtTYPE_CD_SEARCH" runat="server" Width="160px" CssClass="TextBox"
                                        ToolTip="Type" MaxLength="20" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                    &nbsp;
                                    <cc1:LabelTyped ID="lbltxtELEMENT_TEXT_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Text</cc1:LabelTyped>
                                    &nbsp;
                                    <cc1:TextBoxTyped ID="txtELEMENT_TEXT_SEARCH" runat="server" CssClass="TextBox" MaxLength="3000"
                                        TextBoxType="strings" TextBoxWidth="UserSize" ToolTip="Text" Width="612px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lbltxtLOG_TS_FROM_SEARCH" runat="server" CssClass="Label" EnableViewState="False">From</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtLOG_TS_FROM_SEARCH" runat="server" CssClass="TextBox" MaxLength="10"
                                        TextBoxType="CultureDate" TextBoxWidth="UserSize" ToolTip="From" Width="80px"></cc1:TextBoxTyped>
                                    &nbsp;
                                    <cc1:LabelTyped ID="lbltxtLOG_TS_TO_SEARCH" runat="server" CssClass="Label" EnableViewState="False">To</cc1:LabelTyped>
                                    &nbsp;
                                    <cc1:TextBoxTyped ID="txtLOG_TS_TO_SEARCH" runat="server" CssClass="TextBox" MaxLength="10"
                                        TextBoxType="CultureDate" TextBoxWidth="UserSize" ToolTip="To" Width="80px"></cc1:TextBoxTyped>
                                    <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" Text="Search" />
                                    <cc1:ButtonTyped ID="btnClean" runat="server" CssClass="Button" Text="Clean" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" 
                        AutoGenerateColumns="False" BorderStyle="Solid"
                        BorderWidth="1px"  DataGridWidth="" Height="140px">
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="LOG_NBR" HeaderText="LOG_NBR"></asp:BoundColumn>
                            <asp:ButtonColumn DataTextField="LOG_TS" HeaderText="Datetime" CommandName="select"
                                DataTextFormatString="{0:G}"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="TYPE_CD" HeaderText="Type"></asp:BoundColumn>
                        </Columns>
                    </cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                        <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblLOG_TS" runat="server" CssClass="Label" EnableViewState="False">Datetime</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtLOG_TS" runat="server" Width="80px" CssClass="TextBox" ToolTip="Datetime"
                                        MaxLength="10" TextBoxWidth="AutoSize" TextBoxType="ddMMyyyy"></cc1:TextBoxTyped>
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblTYPE_CD" runat="server" CssClass="Label" EnableViewState="False">Type</cc1:LabelTyped>
                                    &nbsp;<cc1:TextBoxTyped ID="txtTYPE_CD" runat="server" CssClass="TextBox" MaxLength="20"
                                        TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Type" Width="160px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblELEMENT_TEXT" runat="server" CssClass="Label" EnableViewState="False">Text</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtELEMENT_TEXT" runat="server" Width="800px" CssClass="TextBox"
                                        ToolTip="Text" MaxLength="3000" TextBoxWidth="UserSize" TextMode="MultiLine"
                                        TextBoxType="strings" Height="537px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secLOG" CRUDToolBarName=""
                        DataGridQueryListName="dgrList" DataMemberName="secLOG" MenuName="objMenu" SearchPanelName="PanelSearch"
                        WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                </div>
            </div>
        </div>
    </div>
    
    </form>
</body>
</html>
