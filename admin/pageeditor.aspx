<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pageeditor.aspx.vb" Inherits="Default2" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/admin/CSS/CSSStyle.css" rel="stylesheet" type="text/css" />
    <title>Editor</title>

    <%-- This script area sets the parameters for the tinyMCE text editor --%>

    <script type="text/javascript" src='<%=ResolveUrl("~/Scripts/tinymce/tinymce.min.js")%>'>
    </script>
    <script type="text/javascript">
        tinymce.init({
            selector: ".tinymce",
            theme: "modern",
            menubar: false,
            resize: false,
            statusbar: false,
            plugins: ["advlist autolink lists link image charmap preview hr anchor emoticons textcolor",
                "pagebreak code nonbreaking table contextmenu directionality paste image"],
            image_list: [{ title: 'Flowers', value: '/Images/flower.jpg' },
                         { title: 'Kitten', value: '/Images/kitten.jpg' },
                         { title: 'Boat', value: '/Images/boat.jpg' },
                         { title: 'Coffee', value: '/Images/coffee-bean-background.jpg' },
                         { title: 'Lipsum Mug', value: '/Images/lipsum08.gif' },
                         { title: 'St Michaels', value: '/Images/St Michaels.jpg' }],
            toolbar1: "styleselect fontselect fontsizeselect forecolor backcolor | cut copy paste bold italic underline | pagebreak code preview | undo redo",
            toolbar2: "alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | emoticons"
        });
    </script>
</head>
<body class="auto-style1">
    <form id="form1" runat="server">
    <div>
    <%-- This textbox allows the user to edit the page content using the TinyMCE wysiwyg editor --%>
    <asp:TextBox ID="htmlEditorTxt"
                 runat="server"
                 ClientIDMode="Static"
                 TextMode="MultiLine"
                 CssClass="tinymce"
                 Height="525px"
                 Width="1250px"
                 Overflow="Hidden" />
        <br />
    </div>
        <%-- This fieldvalidator displays a message if the 'HTML Editor' textbox is left blank --%>   
        <asp:RequiredFieldValidator ID="htmlEditorTxtValidator"
                                    runat="server"
                                    ControlToValidate="htmlEditorTxt"
                                    ErrorMessage="You must enter some page text"
                                    CssClass="tinypagetextvalidator" />

        <%-- This label provides a text tag for the 'Page Name' textbox --%>
        <asp:label ID="pageNameLabel"
                   runat="server"
                   Text="Page Name"
                   CssClass="tinypagenamelabel" />
          
        <%-- This textbox displays the Page Name --%>        
        <asp:TextBox ID="PageName"
                     runat="server"
                     CssClass="tinypagenamebox"
                     MaxLength="20"
                     Width="200px"
                     ToolTip="This page name appears in the menu and browser title" />

        <%-- This fieldvalidator displays a message if the 'Page Name' textbox is left blank --%>   
        <asp:RequiredFieldValidator ID="PageNameValidator"
                                    runat="server"
                                    ControlToValidate="PageName"
                                    ErrorMessage="You must enter a page name"
                                    CssClass="tinypagenamevalidator" />

        <%-- This label provides a text tag for the 'Page Header' textbox --%>
        <asp:label ID="PageHeaderLabel"
                   runat="server"
                   Text="Header Text"
                   CssClass="tinypageheaderlabel" />

        <%-- This textbox displays the Page Header --%> 
        <asp:TextBox ID="PageHeader"
                     runat="server"
                     CssClass="tinypageheaderbox"
                     MaxLength="30"
                     ToolTip="This header appears at the top of your page"
                     Width="400px" />

        <%-- This fieldvalidator displays a message if the 'Page Header' textbox is left blank --%>
        <asp:RequiredFieldValidator ID="PageHeaderValidator"
                                    runat="server"
                                    ControlToValidate="PageHeader"
                                    ErrorMessage="You must enter Page Header Text"
                                    CssClass="tinypageheadervalidator" />

        <%-- This label provides a text tag for the 'Navigational Bar Order' textbox --%>
        <asp:label ID="NavBarOrderLabel"
                   runat="server"
                   Text="Page Order"
                   CssClass="tinypageorderlabel" />

        <%-- This textbox displays the Navigational Bar Order --%> 
        <asp:TextBox ID="NavBarOrder"
                     runat="server"
                     CssClass="tinypageorderbox"
                     ToolTip="This number dictates the position the page name appears in the menu"
                     Width="30px" />

        <%-- This fieldvalidator displays a message if the 'Navigational Bar Order' textbox is left blank --%>
        <asp:RequiredFieldValidator ID="NavBarOrderValidator"
                                    runat="server"
                                    ControlToValidate="NavBarOrder"
                                    ErrorMessage="You must enter a page order"
                                    CssClass="tinypageordervalidator" />

        <%-- This fieldvalidator displays a message if the 'Navigational Bar Order' textbox is not an integer --%>
        <asp:comparevalidator ID="NavBarOrderValidator2"
                              runat="server"
                              ControltoValidate="NavBarOrder"
                              Operator="DataTypeCheck"
                              CSSClass="tinypageordervalidator"
                              type="Integer"
                              ErrorMessage="Entry must be an integer" />

        <%-- This label provides a text tag for the 'Page Published' textbox --%>
        <asp:label ID="PublishedLabel"
                   runat="server"
                   Text="Publish?"
                   CssClass="tinypagepublishedlabel" />

        <%-- This dropdown list displays the Page Published status --%> 
        <asp:DropDownList ID="PagePublished"
                     runat="server"                     
                     CssClass="tinypagepublishedbox"
                     ToolTip="Make this page version visible to the public"
                     Width="70px"
                     selectedValue='<%# Bind("Published") %>' >
                     <asp:ListItem  Text="Yes" Value="True" /> 
                     <asp:ListItem  Text="No" Value="False" /> 
        </asp:DropDownList>

        <%-- This label provides a text tag for the 'Style' textbox --%>
        <asp:label ID="StyleLabel"
                   runat="server"
                   Text="Theme"
                   CssClass="tinypagestylelabel" />

        <%-- This dropdown list displays the Page Style --%> 
        <asp:DropDownList ID="Style"
                     runat="server"                     
                     CssClass="tinypagestylebox"
                     ToolTip="Choose the style of this page"
                     Width="100px"
                     selectedValue='<%# Bind("Style")%>' >
                     <asp:ListItem  Text="default" Value="default" /> 
                     <asp:ListItem  Text="Autumn"  Value="Autumn" />
                     <asp:ListItem  Text="Spring"  Value="Spring" />
                     <asp:ListItem  Text="Summer"  Value="Summer" />
                     <asp:ListItem  Text="Winter"  Value="Winter" />
        </asp:DropDownList>

        <%-- This button allows the user to save the page changes --%> 
        <asp:Button ID="SaveButton"
                    runat="server"
                    Text="Save Changes"
                    tooltip="Save page details"
                    CssClass="tinysavebutton" />

        <%-- This button allows the user to cancel any changes --%> 
        <asp:Button ID="CancButton"
                    runat="server" 
                    Text="Cancel"
                    CausesValidation="false"
                    tooltip="Cancel back to the page list"
                    CssClass="tinycancbutton" />

        <%-- This label leaves some blank space at the bottom of the page --%> 
        <asp:Label ID="empty"
                    runat="server"
                    text="filler"
                    CssClass="empty" />

        <%-- This SqlDataSource selects page data from the Sql TextSave table and binds the selected columns to the textboxes on the page.
             It also allows the data in the page textboxes to be inserted into the Sql TextSave table. --%>
        <asp:SqlDataSource ID="SqlDataSource1" 
                           runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="SELECT [TextString], [PageName], [HeaderText], [NavBarOrder], [Published], [Style]
                                            FROM [TextSave]
                                           WHERE ([RecordId] = @RecordId)"
                           InsertCommand="Insert into TextSave values (@PageName, @TextString, @HeaderText, @NavBarOrder, GetDate(), @Published, @Style)">
            <InsertParameters>
                <asp:FormParameter Name="PageName"
                                   FormField="PageName" />
                <asp:FormParameter Name="TextString"
                                   FormField="htmlEditorTxt" />
                <asp:FormParameter Name="PageTitle"
                                   FormField="PageTitle" />
                <asp:FormParameter Name="HeaderText"
                                   FormField="PageHeader" />
                <asp:FormParameter Name="NavBarOrder"
                                   FormField="NavBarOrder" />
                <asp:Parameter Name="LastUpdated"
                               Type="DateTime" />
                <asp:FormParameter Name="Published"
                                   FormField="PagePublished" />
                <asp:FormParameter Name="Style"
                                   FormField="Style" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="RecordId"
                                          DbType="Int32"
                                          Direction="Input"
                                          QueryStringField="pageid"
                                          DefaultValue=""
                                          ConvertEmptyStringToNull="false" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
