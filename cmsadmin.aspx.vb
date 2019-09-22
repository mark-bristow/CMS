
Imports System.Data
Imports System.Data.SqlClient

' This page allows the user to attempt to login into the CMS Administration area.
' If users enter a correct login id and password a login session is created and the user is redirected to the 'Page List' page

Partial Class cmsadmin
    Inherits System.Web.UI.Page

    Protected Sub GetRow()
        ' Declare variables
        Dim sqldataview As DataView
        Dim sqldata As String

        ' Fetch the selected row from Sql table 'Users' using SqlDataSource1
        sqldataview = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        ' Move the value of column 1 (Row Count) of SqlDataSource1 into a string
        sqldata = CType(sqldataview.Table.Rows(0)(0), String)

        ' If a row count value of 1 is returned then the Administrator logon Id and Password are valid, continue to 'Page List' otherwise
        ' display error message
        If (sqldata = 1) Then
            FormsAuthentication.RedirectFromLoginPage(loginText.Text, createPersistentCookie:=False)
            Response.Redirect("admin/pagelist.aspx")
        Else
            msgLabel.Text = "Password is incorrect"
        End If

    End Sub

    Protected Sub loginButton_Click(sender As Object, e As EventArgs) Handles loginButton.Click
        ' If the Login Button is pressed Perform sql Select using bound data input
        GetRow()
    End Sub

    Protected Sub cancelButton_Click(sender As Object, e As EventArgs) Handles cancelButton.Click
        ' Redirect to default aspx page and render the 'Home Page' html
        Response.Redirect("default.aspx?name=home")
    End Sub

End Class
