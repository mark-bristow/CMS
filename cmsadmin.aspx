<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cmsadmin.aspx.vb" Inherits="cmsadmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/admin/CSS/CSSStyle.css" rel="stylesheet" type="text/css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Header" style="text-align:center" >
            <%-- This label displays the page header text --%>
            <asp:Label id="pageHeader"
                       runat="server"
                       Text="CMS Administrator Login"
                       CssClass="pageheader" />
        </div>
        <div>
            <%-- This label provides a text tag for the 'Login Id' textbox --%>
            <asp:Label ID="loginBoxLabel"
                       runat="server"
                       Text="Login Id"
                       cssclass="loginlabel" />

            <%-- This textbox allows the user to enter a login id --%>
            <asp:TextBox ID="loginText"
                         runat="server"
                         CssClass="loginbox"
                         ToolTip="Enter your login id" />

            <%-- This fieldvalidator displays a message if the 'Login Id' textbox is left blank --%>   
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server"
                                        ControlToValidate="loginText"
                                        ErrorMessage="You must enter a Login Id"
                                        CssClass="loginvalidator" />

            <%-- This label provides a text tag for the 'Password' textbox --%>
            <asp:Label ID="passwordBoxLabel"
                       runat="server"
                       Text="Password"
                       CssClass="passwordlabel" />

            <%-- This textbox allows the user to enter a password --%>
            <asp:TextBox ID="passwordText"
                         runat="server" 
                         TextMode="Password"
                         CssClass="passwordbox"
                         ToolTip="Enter your password" />

            <%-- This fieldvalidator displays a message if the 'Password' textbox is left blank --%>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server"
                                        ControlToValidate="passwordText"
                                        ErrorMessage="You must enter a Password"
                                        CssClass="passwordvalidator" />

            <%-- This button allows the user to login to the CMS Administration area --%> 
            <asp:Button ID="loginButton"
                        runat="server"
                        Text="Login"
                        Width="100px"
                        CssClass="loginbutton"
                        ToolTip="Press enter to login" />

            <%-- This button allows the user to cancel back to the main website --%>
            <asp:Button ID="cancelButton"
                        runat="server"
                        CausesValidation="false"
                        Text="Cancel"
                        Width="100px"
                        CssClass="logincancbutton"
                        ToolTip="Cancel back to the main website" />

            <%-- This label displays an error message is the login attempt is unsuccessful --%>
            <asp:Label ID="msgLabel"
                       runat="server"
                       CssClass="msglabel" />
        </div>
        <%-- This SqlDataSource counts the number of rows in the Sql table 'Users' with the input LoginId and Password combination --%>
        <asp:SqlDataSource ID="SqlDataSource1"
                           runat="server"
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                           SelectCommand="SELECT Count(*)
                                            FROM [Users]
                                           WHERE ([UserId] = @UserId and [Password] = @Password)" >
            <SelectParameters>
                <asp:ControlParameter ControlID="loginText"
                                      Name="UserId"
                                      PropertyName="Text"
                                      Type="String" />
                <asp:ControlParameter ControlID="passwordText"
                                      Name="Password" 
                                      PropertyName="Text"
                                      Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
