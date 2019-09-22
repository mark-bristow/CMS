Imports System.Data
Imports System.Data.SqlClient

' This page displays the selected editable web page details and allow the user to edit them and save them, or to create a new page and save the details.

Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub GetRow()
        'Declare variables
        Dim selectDV As DataView
        Dim selectList As String

        ' Fetch the selected row from Sql table 'TextSave' using SqlDataSource1
        selectDV = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        ' Move the value of column 1 (TextString) of SqlDataSource1 into a string
        selectList = CType(selectDV.Table.Rows(0)(0), String)

        ' If TextString has a value display it in the textbox
        If (selectList > "") Then
            htmlEditorTxt.Text = selectList
        End If

        ' Move the value of column 2 (PageName) of SqlDataSource1 into a string
        selectList = CType(selectDV.Table.Rows(0)(1), String)

        ' If PageName has a value display it in the textbox
        If (selectList > "") Then
            PageName.Text = selectList
        End If

        ' Move the value of column 3 (PageHeader) of SqlDataSource1 into a string
        selectList = CType(selectDV.Table.Rows(0)(2), String)

        ' If PageHeader has a value display it in the textbox
        If (selectList > "") Then
            PageHeader.Text = selectList
        End If

        ' Move the value of column 4 (NavBarOrder) of SqlDataSource1 into a string
        selectList = CType(selectDV.Table.Rows(0)(3), String)

        ' If NavBarOrder has a value display it in the textbox
        If (selectList > "") Then
            NavBarOrder.Text = selectList
        End If

        ' Move the value of column 5 (PagePublished) of SqlDataSource1 into a string
        selectList = CType(selectDV.Table.Rows(0)(4), String)

        ' If Pagepublished has a value display it in the dropdown list
        If (selectList > "") Then
            PagePublished.Text = selectList
        End If

        ' Move the value of column 6 (Style) of SqlDataSource1 into a string
        selectList = CType(selectDV.Table.Rows(0)(5), String)

        ' If Style has a value display it in the dropdown list
        If (selectList > "") Then
            Style.Text = selectList
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' When the page loads determine if a request form parameter is passed in from the calling page.
        ' If a value is passed use it to get the page information from the Sql table TextSave
        ' If no value is passed then the user is creating a new page so do not get any details from the database.
        If (Request.QueryString(0) > "") Then
            GetRow()
        End If
    End Sub

    Protected Sub SaveButton_Click(sender As Object, e As EventArgs) Handles SaveButton.Click
        ' If the Save Button is clicked Insert the editted page details into Sql table TextSave
        If htmlEditorTxt.Text = String.Empty Then
            htmlEditorTxt.Text = "A"
        End If

        SqlDataSource1.Insert()

        ' Redirect back to 'Page List' page
        Response.Redirect("pagelist.aspx")
    End Sub

    Protected Sub CancButton_Click(sender As Object, e As EventArgs) Handles CancButton.Click
        ' If the Cancel Button is clicked then redirect back to 'Page List' page
        Response.Redirect("pagelist.aspx")
    End Sub

End Class
