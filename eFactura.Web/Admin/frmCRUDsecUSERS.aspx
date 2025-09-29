<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecUSERS.aspx.vb"
    Inherits="ASFSec.Web.frmCRUDUSERS" %>
<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="CMS">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
        <cc1:HelperMenu ID="objMenu" runat="server" />
        <div class="content_wrapper">
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
            <div class="content_area">
                <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                <div class="action_area">
                    <cc1:HelperCRUDToolBarHeader ID="objCRUDToolBarHeader" runat="server" CRUDManagerName="objCRUDManagerHeader"
                        Title="Users" />
                    <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                        <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lbltxtEMAIL_ADDR_SEARCH" runat="server" CssClass="Label" EnableViewState="False">E-Mail</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtEMAIL_ADDR_SEARCH" runat="server" Width="392px" CssClass="TextBox"
                                        ToolTip="E-Mail" MaxLength="80" TextBoxWidth="UserSize" 
                                        TextBoxType="strings"></cc1:TextBoxTyped>
                                    <cc1:LabelTyped ID="lbltxtLAST_NAME_TXT_SEARCH" runat="server" CssClass="Label" EnableViewState="False">Last Name</cc1:LabelTyped>
                                    <cc1:TextBoxTyped ID="txtLAST_NAME_TXT_SEARCH" runat="server" Width="248px" CssClass="TextBox"
                                        ToolTip="Last Name" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                    &nbsp;&nbsp;
                                    
                                    <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" Text="Search"></cc1:ButtonTyped><cc1:ButtonTyped
                                        ID="btnClean" runat="server" CssClass="Button" Text="Clean"></cc1:ButtonTyped>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                            <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid"
                                BorderWidth="1px" Height="104px" DataGridWidth="">
                                <Columns>
                                    <asp:BoundColumn Visible="False" DataField="USER_NBR" HeaderText="Code"></asp:BoundColumn>
                                    <asp:ButtonColumn DataTextField="EMAIL_ADDR" HeaderText="E-Mail" CommandName="select">
                                    </asp:ButtonColumn>
                                    <asp:BoundColumn DataField="NAME_TXT" HeaderText="Name"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="LAST_NAME_TXT" HeaderText="Last Name"></asp:BoundColumn>
                                </Columns>
                            </cc1:SearchResultsDataGrid>
                    
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                        <table id="tblControls" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblEMAIL_ADDR" runat="server" CssClass="Label" EnableViewState="False">E-Mail</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtEMAIL_ADDR" runat="server" Width="504px" CssClass="TextBox"
                                        ToolTip="E-Mail" MaxLength="80" TextBoxWidth="UserSize" TextBoxType="Email"></cc1:TextBoxTyped>
                                    &nbsp; &nbsp;
                                    <cc1:LabelTyped ID="lblENABLED_FG" runat="server" CssClass="Label" EnableViewState="False">Enabled</cc1:LabelTyped>
                                    <cc1:CheckBoxTyped ID="chkENABLED_FG" runat="server" Width="20px" CssClass="TextBox"
                                        ToolTip="Enabled"></cc1:CheckBoxTyped>&nbsp;&nbsp; &nbsp;<cc1:LabelTyped ID="lblCHANGE_PASSWORD_FG"
                                            runat="server" CssClass="Label" EnableViewState="False">Change Password</cc1:LabelTyped>
                                    <cc1:CheckBoxTyped ID="chkCHANGE_PASSWORD_FG" runat="server" Width="20px" CssClass="TextBox"
                                        ToolTip="Change Password"></cc1:CheckBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblNAME_TXT" runat="server" CssClass="Label" EnableViewState="False">Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtNAME_TXT" runat="server" Width="390px" CssClass="TextBox"
                                        ToolTip="First Name" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblLAST_NAME_TXT" runat="server" CssClass="Label" EnableViewState="False">Last Name </cc1:LabelTyped>
                                    &nbsp;<cc1:TextBoxTyped ID="txtLAST_NAME_TXT" runat="server" Width="390px" CssClass="TextBox"
                                        ToolTip="Last Name" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblPHONE_TXT" runat="server" CssClass="Label" EnableViewState="False">Phone </cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtPHONE_TXT" runat="server" Width="390px" CssClass="TextBox"
                                        ToolTip="Phone Number" MaxLength="50" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblBIRTH_DT" runat="server" CssClass="Label" EnableViewState="False">Birth Date</cc1:LabelTyped>
                                    &nbsp;
                                    <cc1:TextBoxTyped ID="txtBIRTH_DT" runat="server" CssClass="TextBox" MaxLength="10"
                                        TextBoxType="CultureDate" TextBoxWidth="AutoSize" ToolTip="Birth Date" Width="80px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblUSER_ADDR" runat="server" CssClass="Label" EnableViewState="False">Address</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtUSER_ADDR" runat="server" Width="800px" CssClass="TextBox"
                                        ToolTip="Address" MaxLength="100" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblCOUNTRY_CD" runat="server" CssClass="Label" EnableViewState="False">Country</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:ComboBoxTyped ID="cboCOUNTRY_CD" runat="server" CssClass="TextBox" ToolTip="Country"
                                        Width="400px">
                                    </cc1:ComboBoxTyped>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblLANGUAGE_CD" runat="server" CssClass="Label" EnableViewState="False">Language</cc1:LabelTyped>
                                    &nbsp;<cc1:ComboBoxTyped ID="cboLANGUAGE_CD" runat="server" CssClass="TextBox" ToolTip="Language"
                                        Width="160px">
                                    </cc1:ComboBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblCUIT_TXT" runat="server" CssClass="Label" EnableViewState="False">Tax Code</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtCUIT_TXT" runat="server" Width="96px" CssClass="TextBox"
                                        ToolTip="Tax Code" MaxLength="12" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                    &nbsp;&nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblREFERENTIAL_CD" runat="server" CssClass="Label" EnableViewState="False">Referencial ID</cc1:LabelTyped>
                                    &nbsp;<cc1:TextBoxTyped ID="txtREFERENTIAL_CD" runat="server" CssClass="TextBox"
                                        MaxLength="100" TextBoxType="strings" TextBoxWidth="UserSize" ToolTip="Referencial ID"
                                        Width="600px"></cc1:TextBoxTyped>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblLAST_LOGIN_TS" runat="server" CssClass="Label" EnableViewState="False">Last Logon</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtLAST_LOGIN_TS" runat="server" CssClass="TextBox" MaxLength="30"
                                        TextBoxType="strings" TextBoxWidth="AutoSize" ToolTip="Last Logon" Width="200px"></cc1:TextBoxTyped>
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lblLOGINS_QTY" runat="server" CssClass="Label" EnableViewState="False">Logins Qty</cc1:LabelTyped>
                                    &nbsp;<cc1:TextBoxTyped ID="txtLOGINS_QTY" runat="server" CssClass="TextBox" MaxLength="8"
                                        TextBoxType="integers" TextBoxWidth="AutoSize" ToolTip="Logins Qty" Width="64px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                        </table>
                    <asp:Panel ID="PanelRoles" runat="server" CssClass="Panel">
                                            <cc1:LabelTyped ID="lbl" runat="server" Text="Assigned Roles" Font-Bold=true> </cc1:LabelTyped>
                        <cc1:ScrollableDataGrid ID="dgrRoles" runat="server" AutoGenerateColumns="False"
                            DataGridWidth="" Height="200px" Width="930px">
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Checkbox12" runat="server" name="Checkbox1" Enabled="False" Checked='<%# DataBinder.Eval(Container, "DataItem.ENABLED_FG") %>'>
                                        </asp:CheckBox>
                                    </ItemTemplate>
                                    <HeaderStyle Width="20px" />
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="ENABLED_FG" HeaderText="Enabled" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ROLE_NBR" HeaderText="ROLE_NBR" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="APPLICATION_NM" HeaderText="Application"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ROLE_NM" HeaderText="Role"></asp:BoundColumn>
                            </Columns>
                        </cc1:ScrollableDataGrid></asp:Panel>
                        <br />
                        <cc1:LabelTyped ID="lblActivities" runat="server" Text="Activities Detail" Font-Bold=true> </cc1:LabelTyped>
                                                <asp:Panel ID="PanelActivities" runat="server" CssClass="Panel">
                        <cc1:ScrollableDataGrid ID="dgrActivities" runat="server" 
                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" 
                            DataGridWidth="" Height="104px" ScrollTop="0" Width="930px">
                            <Columns>
                                <asp:BoundColumn DataField="ACTIVITY_TS" DataFormatString="{0:G}" 
                                    HeaderText="Date"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ACTIVITY_NM" HeaderText="Activity">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="ACTIVITY_DESC" HeaderText="Details">
                                </asp:BoundColumn>
                            </Columns>
                        </cc1:ScrollableDataGrid>
                        </asp:Panel>

                    </asp:Panel>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secUSERS" CRUDToolBarName="objCRUDToolBarHeader"
                        DataGridQueryListName="dgrList" DataMemberName="secUSERS" MenuName="objMenu"
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
