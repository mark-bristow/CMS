Imports System.IO

Partial Class admin_CSSEditor
    Inherits System.Web.UI.Page

    Protected Sub CSSSave_Click(sender As Object, e As EventArgs) Handles CSSSave.Click

        Dim CSSFile As String = Server.MapPath("~/CSS/Custom.css")
        Dim objStreamWriter As New StreamWriter(CSSFile)

        File.SetAttributes(CSSFile, FileAttributes.Normal)

        objStreamWriter.Write(CSStext.Text)
        objStreamWriter.Close()

        Response.Redirect("pagelist.aspx")
    End Sub

    Protected Sub CSSCancel_Click(sender As Object, e As EventArgs) Handles CSSCancel.Click
        Response.Redirect("pagelist.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim objStreamReader As StreamReader
            Dim strLine As String
            Dim builder As New StringBuilder
            Dim CSSFile As String = Server.MapPath("~/CSS/Custom.css")

            objStreamReader = New StreamReader(CSSFile)

            strLine = objStreamReader.ReadLine

            builder.AppendLine(strLine)

            Do While Not strLine Is Nothing
                CSStext.Text = strLine
                strLine = objStreamReader.ReadLine
                builder.AppendLine(strLine)
            Loop

            objStreamReader.Close()

            CSStext.Text = builder.ToString

        End If

    End Sub
End Class
