<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ChangePassword.aspx.vb"
    Inherits="ASFSec.Web.ChangePassword" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change</title>
    <link href="~/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 41px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="CMS">
        <cc1:HelperMenu ID="objMenu" runat="server">
        </cc1:HelperMenu>
        <div>
            <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
            <div class="content_area">
                <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                <div class="action_area">
                    <div style="text-align:left">
                    <cc1:HelperCRUDToolBarHeader ID="objCommonToolBarHeader" runat="server" Title="Change Password" />
                    </div>
                    <center>
                        <table style="border: 1px solid #C0C0C0; width: 288px; height: 104px; margin-top: 2px;"
                            cellspacing="0" cellpadding="0">
                            
                            <tr>
                                <td align="left" style="width: 130px; height: 10px">
                                </td>
                                <td align="left" style="width: 133px">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" >
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="Label1" runat="server" CssClass="Label" EnableViewState="False"
                                        Width="105px">Current password</cc1:LabelTyped>
                                </td>
                                <td align="left">
                                    <cc1:TextBoxTyped ID="txtUSER_PASSWORD_TXT" runat="server" CssClass="TextBox" MaxLength="80"
                                        TextBoxType="strings" TextBoxWidth="UserSize" TextMode="Password" ToolTip="Clave Actual"
                                        Width="120px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" >
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="Label2" runat="server" CssClass="Label" EnableViewState="False"
                                        Width="105px">New password</cc1:LabelTyped>
                                </td>
                                <td align="left" class="style6">
                                    <cc1:TextBoxTyped ID="txtNEW_PASSWORD_TXT" runat="server" CssClass="TextBox" MaxLength="80"
                                        TextBoxType="strings" TextBoxWidth="UserSize" TextMode="Password" ToolTip="Clave Actual"
                                        Width="120px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    &nbsp;&nbsp;
                                    <cc1:LabelTyped ID="Label3" runat="server" CssClass="Label" EnableViewState="False"
                                        Width="121px">Confirm new password</cc1:LabelTyped>
                                </td>
                                <td align="left" >
                                    <cc1:TextBoxTyped ID="txtCONFIRMED_PASSWORD_TXT" runat="server" CssClass="TextBox"
                                        MaxLength="80" TextBoxType="strings" TextBoxWidth="UserSize" TextMode="Password"
                                        ToolTip="Clave Actual" Width="120px"></cc1:TextBoxTyped>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" class="style1" >
                                    <cc1:ButtonTyped ID="btnConfirm" runat="server" Text="Confirm" />
                                    <cc1:ButtonTyped ID="btnCancel" runat="server" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                        <cc1:LabelTyped ID="lblError" runat="server" CssClass="Label" EnableViewState="False"
                            Font-Bold="True" ForeColor="#C00000"></cc1:LabelTyped>
                    </center>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
