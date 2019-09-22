Imports System.Data.SqlClient
Imports System.Data

' This page is the main driver of the content of this CMS Administrated Website.
' This page retrieves the page content from a Sql database table depending on the request form parameter passed in when the page loads.
' If no request form parameter is passed into this page (as when the user first lands on the website Url) then the 'Home' page is loaded.
' The page structure and content is displayed in the browser in the form of HTML 

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Upon landing on Default.aspx load the page content from Sql table 'TextSave' using the request form variable 'name' as key.
        ' If 'name' is not provided, such as when the user first lands on the home page, then the page name 'home' is defaulted.
        ' See the QueryStringParameters for SqlDataSource1 in Default.aspx for the mechanism that achieves this.

        GetPage()

    End Sub

    Protected Sub GetPage()
        ' Declare variables
        Dim sqldataview As DataView
        Dim sqldata As String
        Dim menuindex As Integer = 0
        Dim builder As New StringBuilder
        Dim htmlstring As String

        ' Fetch the selected row from Sql table 'TextSave' using SqlDataSource1
        sqldataview = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        ' Move the value of column 2 (PageName) of SqlDataSource1 into a string
        sqldata = CType(sqldataview.Table.Rows(0)(1), String)

        ' If PageName has a value move into the HTML <Title> tag, otherwise default <Title> to 'My Website'
        If (sqldata > "") Then
            Page.Title = sqldata
        Else
            Page.Title = "My Website"
        End If

        ' Put <div> tag information of the Page Content container into stringbuilder string
        builder.AppendLine("<div id='container' style='width:100%;'>")
        builder.AppendLine("<div id='header' >")
        builder.AppendLine("<h1 style='margin-bottom:0;margin-top:0;text-align:center;'>")

        ' Move the value of column 3 (HeaderText) of SqlDatasource1 into a string
        sqldata = CType(sqldataview.Table.Rows(0)(2), String)

        ' If HeaderText has a value add it into the <h1> tag of the stringbuilder string, otherwise default <h1> to 'Header'
        If (sqldata > "") Then
            builder.Append(sqldata)
        Else
            builder.Append("Header")
        End If

        ' Move the value of column 4 (Style) of SqlDatasource1 into a string
        sqldata = CType(sqldataview.Table.Rows(0)(3), String)

        ' If Style has a value add it into the HTML CCSFile tag, otherwise default the CSS file to ~/CSS/default.css
        If (sqldata > "") Then
            If Not (IsPostBack) Then
                CSSFile.Attributes.Add("href", "~/CSS/" + sqldata + ".css")
            End If
        Else
            If Not (IsPostBack) Then
                CSSFile.Attributes.Add("href", "~/CSS/default.css")
            End If
        End If

        ' Put <div> tag information of the Navigation Menu into stringbuilder string
        builder.AppendLine("</h1>")
        builder.AppendLine("</div>")
        builder.AppendLine("<div id='menu' >")
        builder.Append("<br>")
        builder.AppendLine("<ul>")

        ' Fetch the names of all the published pages from Sql table 'TextSave' using SqlDataSource2
        sqldataview = CType(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)

        ' Loop through all the rows returned from 'TextSave' via SqlDataSource2 and move each page name into a HTML Url link and Name tag within an unordered list
        ' Max 10 pages
        While (menuindex < sqldataview.Table.Rows.Count) And (menuindex < 10)
            sqldata = CType(sqldataview.Table.Rows(menuindex)(0), String)

            If (sqldata > "") Then
                builder.AppendLine("<li><a href='default.aspx?name=")
                builder.Append(sqldata)
                builder.Append("'>")
                builder.Append(sqldata)
                builder.AppendLine("</a>")
                builder.AppendLine("</li>")
            Else
                Response.Write("Page cannot be rendered")
            End If
            menuindex += 1
        End While

        ' End the unordered list, close the 'Menu' <div> tag and open the 'Content' <div> tag
        builder.AppendLine("</ul>")
        builder.AppendLine("</div>")
        builder.AppendLine("<div id='content' >")

        ' Move the value of column 1 (TextString) of SqlDatasource1 into a string
        sqldataview = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        sqldata = CType(sqldataview.Table.Rows(0)(0), String)

        ' If TextString has a value add it into stringbuilder string, otherwise display an error message
        If (sqldata > "") Then
            builder.Append(sqldata)
        Else
            Response.Write("Page cannot be rendered")
        End If

        ' Close the 'Container' <div> tag and create the footer <div> in the stringbuilder string
        builder.AppendLine("</div>")
        builder.AppendLine("<div id='footer' > ")
        builder.Append("mwb-development.com")
        builder.AppendLine("</div>")
        builder.AppendLine("</div>")

        ' Write out the stringbuilder HTML string to the page, via asp:label 'htmlLabel'
        htmlstring = builder.ToString
        htmlLabel.Text = Server.HtmlDecode(htmlstring)

    End Sub
End Class
