' This page creates a gridview list of all the versions of the page selected from the dropdown menu, with the most recent version at the top.
' The dropdown list always defaults to 'Home' when the page is loaded.
' The user can select the page version they want to edit or delete the page version they want to remove.
' Alternatively the user can create a brand new page, update the Customisable CSS or cancel back to the main website.


Partial Class pagelist
    Inherits System.Web.UI.Page

    ' When the 'Create New Page' button is clicked navigate to the Page Editor page with an empty 'pageid' request form variable.
    Protected Sub createButton_Click(sender As Object, e As EventArgs) Handles createButton.Click
        Response.Redirect("pageeditor.aspx?pageid=")
    End Sub

    ' When the 'Cancel' button is clicked navigate to the default page and display the Home page contents.
    Protected Sub cancelButton_Click(sender As Object, e As EventArgs) Handles cancelButton.Click
        Response.Redirect("~/default.aspx?name=home")
    End Sub

    ' When the 'Select' button is clicked navigate to the Page Editor page with the 'pageid' request form variable set to thast of the selected page. 
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim pageRow As GridViewRow = GridView1.SelectedRow

        Response.Redirect("pageeditor.aspx?pageid=" + pageRow.Cells(1).Text)
    End Sub

    ' When the 'CSS Editor' button is clicked navigate to the CSS Editor page. (Removed)
    ' Protected Sub CssButton_Click(sender As Object, e As EventArgs) Handles CssButton.Click
    '    Response.Redirect("CSSEditor.aspx")
    ' End Sub
End Class
