<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmCRUDsecOPTIONS.aspx.vb"
    Inherits="ASFSec.Web.frmCRUDsecOPTIONS" %>

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
                        Title="Options" />
                    <asp:Panel ID="PanelSearch" runat="server" CssClass="PanelSearchForm">
                        <table id="tblSearch" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblcboAPPLICATION_NBR_SEARCH" runat="server" CssClass="Label"
                                        EnableViewState="False">Application</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:ComboBoxTyped ID="cboAPPLICATION_NBR_SEARCH" runat="server" Width="285px" CssClass="TextBox"
                                        ToolTip="Application" Height="19px">
                                    </cc1:ComboBoxTyped>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <cc1:LabelTyped ID="lbltxtEN_OPTION_NM_SEARCH" runat="server" CssClass="Label" EnableViewState="False">English Name</cc1:LabelTyped>
                                    &nbsp;<cc1:TextBoxTyped ID="txtEN_OPTION_NM_SEARCH" runat="server" CssClass="TextBox"
                                        MaxLength="50" TextBoxType="strings" TextBoxWidth="UserSize" ToolTip="English Name"
                                        Width="291px"></cc1:TextBoxTyped>
                                    <cc1:ButtonTyped ID="btnSearch" runat="server" CssClass="Button" Height="20px" Text="Search" />
                                    <cc1:ButtonTyped ID="btnClean" runat="server" CssClass="Button" Text="Clean" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:SearchResultsDataGrid ID="dgrList" runat="server" AutoGenerateColumns="False" BorderStyle="Solid"
                        BorderWidth="1px" Height="104px"  DataGridWidth="">
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="OPTION_NBR" HeaderText="OPTION_NBR">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="EN_APPLICATION_NM" HeaderText="Application Name"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EN_MENU_NM" HeaderText="Menu Name"></asp:BoundColumn>
                            <asp:ButtonColumn DataTextField="EN_OPTION_NM" HeaderText="Option Name" CommandName="select">
                            </asp:ButtonColumn>
                            <asp:BoundColumn DataField="OPTION_ORDER_NBR" HeaderText="Order"></asp:BoundColumn>
                        </Columns>
                    </cc1:SearchResultsDataGrid>
                    <asp:Panel ID="PanelControls" runat="server" CssClass="PanelControls">
                        <table id="tblControls" cellspacing="1" cellpadding="1" border="0">
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblMENU_NBR" runat="server" CssClass="Label" EnableViewState="False">Menu</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:ComboBoxTyped ID="cboMENU_NBR" runat="server" Width="401px" CssClass="TextBox"
                                        ToolTip="Menu" Height="16px">
                                    </cc1:ComboBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblEN_OPTION_NM" runat="server" CssClass="Label" EnableViewState="False">English Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtEN_OPTION_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="English Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblES_OPTION_NM" runat="server" CssClass="Label" EnableViewState="False">Spanish Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtES_OPTION_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Spanish Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblPT_OPTION_NM" runat="server" CssClass="Label" EnableViewState="False">Portuguese Name</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtPT_OPTION_NM" runat="server" Width="400px" CssClass="TextBox"
                                        ToolTip="Portuguese Name" MaxLength="50" TextBoxWidth="AutoSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblOPTION_URL_ADDR" runat="server" CssClass="Label" EnableViewState="False">URL</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtOPTION_URL_ADDR" onkeyup="CompleteTag();" runat="server"
                                        CssClass="TextBox" MaxLength="250" TextBoxType="strings" TextBoxWidth="UserSize"
                                        ToolTip="URL" Width="800px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblOPTION_TAG_TXT" runat="server" CssClass="Label" EnableViewState="False">Tag</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:TextBoxTyped ID="txtOPTION_TAG_TXT" runat="server" Width="800px" CssClass="TextBox"
                                        ToolTip="Tag" MaxLength="250" TextBoxWidth="UserSize" TextBoxType="strings"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:LabelTyped ID="lblIS_PAGE_FG" runat="server" CssClass="Label" EnableViewState="False">Is Page</cc1:LabelTyped>
                                </td>
                                <td>
                                    <cc1:CheckBoxTyped ID="chkIS_PAGE_FG" runat="server" Width="20px" CssClass="TextBox"
                                        ToolTip="Is Page"></cc1:CheckBoxTyped>
                                    &nbsp;
                                    <cc1:LabelTyped ID="lblOPTION_ORDER_NBR" runat="server" CssClass="Label" EnableViewState="False">Order</cc1:LabelTyped>
                                    &nbsp;&nbsp;
                                    <cc1:TextBoxTyped ID="txtOPTION_ORDER_NBR" runat="server" CssClass="TextBox" MaxLength="5"
                                        TextBoxType="integers" TextBoxWidth="AutoSize" ToolTip="Order" Width="40px"></cc1:TextBoxTyped>
                                    &nbsp;
                                    <cc1:LabelTyped ID="lblUSER_TYPE_CD" runat="server" CssClass="Label" EnableViewState="False">User Type</cc1:LabelTyped>
                                    &nbsp;
                                    <cc1:ComboBoxTyped ID="cboUSER_TYPE_CD" runat="server" CssClass="TextBox" ToolTip="User Type"
                                        Width="400px">
                                    </cc1:ComboBoxTyped>
                                </td>
                            </tr>
                        </table>
                        <cc1:ScrollableDataGrid ID="dgrELEMENTS_TRANSLATIONS" runat="server" AutoGenerateColumns="False"
                            BorderStyle="Solid" BorderWidth="1px" Height="300px" Width="1100px" DataGridWidth="">
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="OBJECT_NM" HeaderText="OBJECT_NM"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ELEMENT_NM" HeaderText="Element Name"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ELEMENT_TXT" HeaderText="Element Text"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="English Text">
                                    <ItemTemplate>
                                        <cc1:TextBoxTyped TextBoxWidth="UserSize" MaxLength="250" Width="150px" Enabled="false"
                                            autocomplete="off" runat="server" ID="txtEN_TXT" Text='<%# DataBinder.Eval(Container, "DataItem.EN_TXT") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Spanish Text">
                                    <ItemTemplate>
                                        <cc1:TextBoxTyped TextBoxWidth="UserSize" MaxLength="250" Width="150px" Enabled="false"
                                            autocomplete="off" runat="server" ID="txtES_TXT" Text='<%# DataBinder.Eval(Container, "DataItem.ES_TXT") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Portuguese Text">
                                    <ItemTemplate>
                                        <cc1:TextBoxTyped TextBoxWidth="UserSize" MaxLength="250" Width="150px" Enabled="false"
                                            autocomplete="off" runat="server" ID="txtPT_TXT" Text='<%# DataBinder.Eval(Container, "DataItem.PT_TXT") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Visible<br/> Eng.">
                                    <ItemTemplate>
                                        <cc1:CheckBoxTyped runat="server" ID="chkEN_VISIBLE_FG" Enabled="false" Checked='<%# DataBinder.Eval(Container, "DataItem.EN_VISIBLE_FG") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Visible<br/> Span.">
                                    <ItemTemplate>
                                        <cc1:CheckBoxTyped runat="server" ID="chkES_VISIBLE_FG" Enabled="false" Checked='<%# DataBinder.Eval(Container, "DataItem.ES_VISIBLE_FG") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Visible<br/> Port.">
                                    <ItemTemplate>
                                        <cc1:CheckBoxTyped runat="server" ID="chkPT_VISIBLE_FG" Enabled="false" Checked='<%# DataBinder.Eval(Container, "DataItem.PT_VISIBLE_FG") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </cc1:ScrollableDataGrid>
                    </asp:Panel>
                    <cc1:WebDataBinder ID="objWebDataBinder" runat="server">
                    </cc1:WebDataBinder>
                    <cc1:CRUDManagerHeader ID="objCRUDManagerHeader" runat="server" AutoQueryList="False"
                        BzAssemblyName="ASFSec.BusObjects" BzClassName="ASFSec.BusObjects.secOPTIONS"
                        CRUDToolBarName="objCRUDToolBarHeader" DataGridQueryListName="dgrList" DataMemberName="secOPTIONS"
                        MenuName="objMenu" SearchPanelName="PanelSearch" WebDataBinderName="objWebDataBinder">
                    </cc1:CRUDManagerHeader>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>

<script language="javascript" type="text/javascript">
    function CompleteTag() {
        document.getElementById("txtOPTION_TAG_TXT").value = document.getElementById("txtOPTION_URL_ADDR").value.toUpperCase().replace("~\\", "").replace("\\", "_").replace(".ASPX", "");
    }

</script>

</html>
