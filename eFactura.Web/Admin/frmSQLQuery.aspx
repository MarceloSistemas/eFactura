<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmSQLQuery.aspx.vb" Inherits="ASFSec.Web.frmSQLQuery" %>

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
                    <asp:TextBox ID="TextBox1" runat="server" Height="302px" TextMode="MultiLine" Width="940px"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
                    <asp:DataGrid ID="grid" runat="server" Width="937px">
                    </asp:DataGrid>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
