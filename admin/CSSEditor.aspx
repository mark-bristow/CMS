<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CSSEditor.aspx.vb" Inherits="admin_CSSEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CSS Editor</title>
    <link href="~/admin/CSS/CSSStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="Header" style="text-align:center" >
        <asp:Label id="pageHeader"
                   runat="server"
                   Text="Custom CSS Editor"
                   CssClass="pageheader" />

    </div>
    <div class="auto-style1">
    
        <asp:TextBox ID="CSStext"
                     runat="server"
                     ClientIdMode="Static"
                     CssClass="auto-style2"
                     TextMode="MultiLine"
                     Height="550px"
                     Width="1200px" />
    
        <br />
        <br />
        <asp:Button ID="CSSSave"
                    runat="server"
                    Text="Save"
                    ToolTip="Save updated CSS"
                    CssClass="csspagebutton"
                    Width="160px" />

        <asp:Button ID="CSSCancel"
                    runat="server"
                    Text="Cancel"
                    ToolTip="Cancel without saving"
                    CssClass="csscancbutton"
                    Width="160px" />
    
    </div>
    </form>
</body>
</html>
