<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecROLES.aspx.vb"
    Inherits="ASFSec.Web.frmCRUDsecROLES" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="~\Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="CMS">
        <cc1:HelperMenu ID="objMenu" runat="server" MultiApplications="True">
        </cc1:HelperMenu>
        <div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
            <div class="content_area">
                <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                <div class="action_area">
                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader"
                        Title="User Roles" />
                    <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                        <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblcboAPPLICATION_NBR_SEARCH" runat="server" CssClass="Label"
                                        EnableViewState="False">Application</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:ComboBoxTyped ID="cboAPPLICATION_NBR_SEARCH" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Application">
                                    </cc1:ComboBoxTyped>
                                    <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid"
                        BorderWidth="1px" Height="104px" Width="100%" DataGridWidth="">
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="ROLE_NBR" HeaderText="Role"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EN_APPLICATION_NM" HeaderText="Application"></asp:BoundColumn>
                            <asp:ButtonColumn DataTextField="ROLE_NM" HeaderText="Role" CommandName="select">
                            </asp:ButtonColumn>
                        </Columns>
                    </cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                        <table id="tblControls" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td style="width: 75px">
                                    <cc1:LabelTyped ID="lblcboAPPLICATION_NBR" runat="server" CssClass="Label" EnableViewState="False">Application</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:ComboBoxTyped ID="cboAPPLICATION_NBR" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Application" AutoPostBack="True">
                                    </cc1:ComboBoxTyped>
                                    &nbsp; &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblROLE_NM" runat="server" CssClass="Label" EnableViewState="False">Role</cc1:LabelTyped>&nbsp;
                                    <cc1:TextBoxTyped ID="txtROLE_NM" runat="server" Width="240px" CssClass="TextBox"
                                        ToolTip="Role" MaxLength="30" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                        </table>
                        <cc1:ScrollableDataGrid ID="dgrOptions" runat="server" Width="930px" AutoGenerateColumns="False"
                            DataGridWidth="">
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="OPTION_NBR" HeaderText="OPTION_NBR">
                                </asp:BoundColumn>
                                <asp:TemplateColumn>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Checkbox1" runat="server" name="Checkbox1" Enabled="False" Checked='<%# DataBinder.Eval(Container, "DataItem.ENABLED_FG") %>'>
                                        </asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn Visible="False" DataField="ENABLED_FG" HeaderText="Enabled"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EN_MENU_NM" HeaderText="Menu"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EN_OPTION_NM" HeaderText="Option"></asp:BoundColumn>
                            </Columns>
                            <HeaderStyle Width="900px" />
                        </cc1:ScrollableDataGrid><br />
                    </asp:Panel>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secROLES" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="secROLES" MenuName="objMenu"
                        SearchPanelName="PanelSearch" WebDataBinderName="objWebDataBinder">
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
