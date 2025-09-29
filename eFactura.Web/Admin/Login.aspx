<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="ASFSec.Web.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Styles.css" />
    <style type="text/css">
        body {
	font-family:Arial, Helvetica, sans-serif;
	font-size: 11px;
	text-align: center;
	height:auto;	
	margin-top:1px;
    
	background-position:top center;
	background-color: white;
	background-repeat:no-repeat;
	
}
body form 
{
	margin:auto;
	margin-top:1px;	 
	height:auto;    
	text-align: center;
	width:950px;	

}

        
        .HeaderPanel{width:950px;height:55px;}
.LabelTitle
{
	font-weight: bold;
	font-size: 28px;
	text-indent: 0px;
	color:#0257A6;
	text-align: center;
	margin-top:0px;
	padding-top:0px;
	float:left;
	margin-left:200px;
	width:500px;
	padding-top:15px;
	
}

        .titulo
        {
            background: url(../images/tsr-r.gif) no-repeat right top;
            font-size: 14pt;
            color: #0257A6;
            font-family: helvetica,arial,sans-serif MARGIN-TOP:-10px;
            height: 40px;
            padding-top: 5px;
        }
        .titulo2
        {
            background: url(../images/tsr-r.gif) no-repeat right top;
            font-size: 13px;
            color: #555;
            font-family: helvetica,arial,sans-serif MARGIN-TOP:-10px;
            height: 40px;
            padding-top: 5px;
        }
        .contenido
        {
            padding-left: 10px;
            padding-right: 10px;
            border-right: #c7c7c7 1px solid;
            border-top: #c7c7c7 0px solid;
            border-left: #c7c7c7 1px solid;
            border-bottom: #c7c7c7 0px solid;
        }
        .tituloL
        {
            padding-right: 0px;
            padding-left: 11px;
            background: url(../images/tsr-l.gif) no-repeat left top;
        }
        .footer
        {
            padding-right: 10px;
            padding-left: 0px;
            background: url(../images/tsr-r.gif) no-repeat right bottom;
            padding-bottom: 0px;
            height: 10px;
        }
        .footerL
        {
            padding-top: -10px;
            padding-left: 11px;
            background: url(../images/tsr-l.gif) no-repeat left bottom;
            height: 10px;
        }
        
    </style>
</head>
<body>
    <div>
        <form id="form1" runat="server" defaultbutton="btnLogin">
        <div>
            <div class="HeaderPanel">
                <span class="LabelTitle">
                    <asp:Literal runat="server" ID="ltrLabel"></asp:Literal>
                </span>
                <div class="FlagsPanel">
                    <asp:LinkButton ID="btnES" runat="server" Text="<div class='ES_FLAG'>Español</div>"
                        TabIndex="99" />
                    <asp:LinkButton ID="btnEN" runat="server" Text="<div class='EN_FLAG'>English</div>"
                        TabIndex="98" />
                    <asp:LinkButton ID="btnPT" runat="server" Text="<div class='PT_FLAG'>Portugues</div>"
                        TabIndex="97" />
                </div>
        </div>
    </div>
    <div style="margin-top: 1px; text-align: center">
        <table cellspacing="10" align="center">
            <tr>
                <td valign="top">
                    <asp:Panel ID="PanelLogin" runat="server">
                        <div style="width: 300px">
                            <div class='tituloL'>
                            
                                <div class='titulo' align="center">
                                <div class='LabelLogin' align="center">
                                    <cc1:LiteralTyped runat="server" Text="Access" ID="ltrTitle"></cc1:LiteralTyped>
                                    </div>
                                </div>
                            </div>
                            <div class='contenido'>
                                <table class="label" style="width: 272px">
                                    <tr>
                                        <td style="width: 74px">
                                            <cc1:LabelTyped runat="server" Text="Email" ID="lblEMAIL_ADDR"></cc1:LabelTyped>
                                        </td>
                                        <td style="width: 145px">
                                            <cc1:TextBoxTyped TextBoxType="strings" ID="txtEMAIL_ADDR" runat="server" CssClass="TextBox"
                                                TabIndex="1" Width="184px" TextBoxWidth="UserSize" MaxLength="200" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 74px; height: 23px;">
                                            <cc1:LabelTyped ID="ltrUSER_PASSWORD_TXT" runat="server" Text="Password" />
                                        </td>
                                        <td style="width: 145px; height: 23px;">
                                            <cc1:TextBoxTyped TextBoxType="strings" ID="txtUSER_PASSWORD_TXT" runat="server"
                                                CssClass="TextBox" TabIndex="1" TextMode="Password" Width="184px" 
                                                TextBoxWidth="UserSize" MaxLength="200"></cc1:TextBoxTyped>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 22px" align="center">
                                            <cc1:ButtonTyped ID="btnLogin" runat="server" CssClass="button" Text="Sign In" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <cc1:LabelTyped ID="LblError" runat="server" Font-Bold="True" Font-Names="Arial"
                                                Font-Size="8pt" ForeColor="#C00000" TabIndex="5"></cc1:LabelTyped>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <cc1:ButtonTyped ID="btnForget" runat="server" Text="Lost your Password ?" Style="border: solid 0 white;
                                                background-color:Transparent; cursor: hand; font-size: 12px; color: #010f4c; font-family: helvetica,arial;
                                                font-weight: bold" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class='footerL'>
                                <div class='footer'>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PanelForget" runat="server" Visible="False">
                        <div style="width: 300px; vertical-align: top">
                            <div class='tituloL'>
                                <div class='titulo' align="center">
                                <div class="LabelLogin">
                                    <cc1:LiteralTyped runat="server" ID="ltrSendPassword" Text="Send Password" /></div>
                                    </div>
                            </div>
                            <div class='contenido' align="center">
                                <cc1:LabelTyped runat="server" ID="lblEmail2" Text="Email" CssClass="Label"></cc1:LabelTyped>
                                &nbsp;
                                <cc1:TextBoxTyped ID="txtEMAIL_ADDR2" runat="server" TextBoxType="strings" CssClass="TextBox"
                                    TabIndex="1" Width="154px" TextBoxWidth="UserSize" MaxLength="200"></cc1:TextBoxTyped>
                                <cc1:ButtonTyped ID="btnSend" runat="server" CssClass="button" Text="Send" />
                                <br />
                                <cc1:LabelTyped ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                                    ForeColor="#C00000" TabIndex="5"></cc1:LabelTyped><br />
                                <cc1:ButtonTyped Style="border: solid 0 white; background-color: White; cursor: hand;
                                    font-size: 12px; color: #010f4c; font-family: helvetica,arial; font-weight: bold"
                                    ID="btnGoLogin" runat="server" BorderStyle="None" Font-Size="11px" ForeColor="MidnightBlue"
                                    Height="27px" Text="Return to Access" Width="174px" />
                            </div>
                            <div class='footerL'>
                                <div class='footer'>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
        </table>
        <div style="margin-top: 270px; width: 1000px; text-align: center;">
        </div>
    </div>
    </form>

    <script type="text/javascript" language="javascript">
        try {
            document.getElementById("txtEMAIL_ADDR").focus();
        }
        catch (e) { }

        try {
            document.getElementById("txtEMAIL_ADDR2").focus();
        }
        catch (e) { }
    
    </script>

    </div>
</body>
</html>
