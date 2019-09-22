<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link id="CSSFile" rel="stylesheet" type="text/css" runat="server" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <%-- This SqlDataSource retrieves the most current published version of the required page via the 'name' request form.
             If no 'name' request form is provided then default to the 'home' page --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                               ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                               SelectCommand="SELECT TextString, PageName, HeaderText, Style FROM TextSave AS A 
                                                               WHERE (LastUpdated = (SELECT MAX(LastUpdated) AS Expr1 
                                                                                       FROM TextSave AS B WHERE (PageName = A.PageName)
                                                                                        AND (Published='true')))
                                                                 AND (PageName = @PageName)">
                                                                                     
            <SelectParameters>
                <asp:QueryStringParameter Name="PageName" 
                                          DbType = "String"
                                          Direction = "Input"
                                          QueryStringField="name"
                                          DefaultValue="home"
                                          ConvertEmptyStringToNull="False" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <%-- This SqlDataSource retrieves the page names of all the published pages in the Sql table 'TextSave'. This is used to populated the navigational menu. --%>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                               ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                               SelectCommand="SELECT [PageName] FROM TextSave AS A 
                                                               WHERE (LastUpdated = (SELECT MAX(LastUpdated) AS Expr1 
                                                                                       FROM TextSave AS B WHERE (PageName = A.PageName)
                                                                                        AND (Published='true')))
                                                               ORDER BY NavBarOrder">
         </asp:SqlDataSource>

        <br />
        <%-- This label is used to write out the generated HTML on the page. --%>
        <asp:Label ID="htmlLabel"
                   runat="server"
                CssStyle="defaultpagedisplay" >
        </asp:Label>    
    </div>
    </form>
</body>
</html>
