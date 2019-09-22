<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pagelist.aspx.vb" Inherits="pagelist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/admin/CSS/CSSStyle.css" rel="stylesheet" type="text/css" />
    <title>Admin</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Header" style="text-align:center" >
        <asp:Label id="pageHeader"
                   runat="server"
                   Text="Site Administration"
                   CssClass="pageheader" />

    </div>
    <div id="GridViewBody" style="width:auto">
        <%-- This SqlDataSource is used to populate the dropdown list with all the available page names saved in the Sql table 'TextSave'
             The 'Home' page is not selected because it is set up as the default value of the dropdown list --%>
        <asp:SqlDataSource ID="SqlDataSource2" 
                           runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="SELECT DISTINCT [PageName]
                                            FROM [TextSave] 
                                           WHERE ([PageName] != 'home')" />
        
        <%-- This label displays a text instruction next to the dropdown list --%>
        <asp:Label id="dropDownLabel"
                   runat="server"
                   Text="Select a Page Name"
                   CssClass="dropdownlabel" />
           
        <%-- This dropdown list displays all the page names returned by SqlDataSource2 (except the 'Home' page).
             This ListItem entry puts the value 'Home' in the dropdown list by default, the Selected="true" attribute means that the 'Home' pages
             are selected from SqlDataSource1 and populated in the GridView upon landing on this page  --%>
        <asp:DropDownList ID="PageNameDropDown"
                          runat="server" 
                          AutoPostBack="True" 
                          DataSourceID="SqlDataSource2" 
                          DataTextField="PageName" 
                          DataValueField="PageName"
                          AppendDataBoundItems="true"
                          CssClass="pagenamedropdown"
                          ToolTip="Choose the page name you wish to modify" >
                <asp:ListItem Text="Home"
                              Enabled="true"
                              Selected="true"
                              Value="Home" />
        </asp:DropDownList>
          
        <%-- This SqlDataSource is used to populate the GridView. 
             All versions of the page selected from the dropdown list are displayed with the most recent at the top --%>
        <asp:SqlDataSource ID="SqlDataSource1" 
                           runat="server"
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="SELECT *
                                            FROM [TextSave]
                                           WHERE ([PageName] = @PageName)
                                        ORDER BY [LastUpdated] Desc"
                           DeleteCommand="DELETE 
                                            FROM [TextSave]
                                           WHERE [RecordId] = @RecordId">

            <SelectParameters>
                <asp:ControlParameter ControlID="PageNameDropDown"
                                      Name="PageName"
                                      PropertyName="SelectedValue"
                                      Type="String" />
            </SelectParameters>

            <DeleteParameters>
                <asp:Parameter Name="RecordId" />
            </DeleteParameters>
        </asp:SqlDataSource>

          
        <%-- This GridView displays all the rows returned from SqlDataSource1
             The Gridview allows the user to Delete or Select the required record --%>
        <asp:GridView ID="GridView1" 
                      runat="server" 
                      AllowSorting="True" 
                      AutoGenerateColumns="False"
                      Allowpaging="true"
                      PageSize="10" 
                      DataKeyNames="RecordId" 
                      DataSourceID="SqlDataSource1" 
                      CssClass="gridview" 
                      Width="90%"  >
            <Columns>
                <asp:CommandField ShowSelectButton="True" 
                                  ShowDeleteButton="true"
                                  ButtonType="Button"
                                  ControlStyle-CssClass="gridviewbutton" />

                <asp:BoundField DataField="RecordID"
                                HeaderText="Record Id" >
                   <HeaderStyle HorizontalAlign="Center"
                                CssClass="empty" />
                     <ItemStyle HorizontalAlign="Center"
                                CssClass="empty" />
                </asp:BoundField>

                <asp:BoundField DataField="PageName"
                                HeaderText="Page Name" >
                   <HeaderStyle HorizontalAlign="Center" />
                     <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:BoundField DataField="LastUpdated"
                                HeaderText="Created"
                                SortExpression="LastUpdated"
                                dataformatstring="{0:MMMM d, yyyy - HH:mm:ss}"
                                htmlencode="false" >
                     <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <%-- Replace Boundfield with TemplateField to convert Boolean True/False to Yes/No
                <asp:BoundField DataField="Published"
                                HeaderText="Published"
                   <HeaderStyle HorizontalAlign="Center" />
                     <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField> --%>

                <asp:TemplateField HeaderText="Published" >
                    <ItemTemplate>
                        <%#IIf(Boolean.Parse(Eval("Published").ToString()), "Yes", "No")%>
                    </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:BoundField DataField="Style"
                                HeaderText="Style" >
                   <HeaderStyle HorizontalAlign="Center" />
                     <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <PagerSettings FirstPageText="First Page"
                           LastPageText="Last Page"
                           Mode="NumericFirstLast"
                           Position="TopAndBottom" /> 
        </asp:GridView>
        
        <%-- Button to create a new page --%>
        <asp:Button ID="createButton"
                    runat="server"
                    Text="Create New Page"
                    ToolTip="Create a brand new page"
                    CssClass="pagebutton" />

        <%-- Button to cancel back to the CMS website --%>
        <asp:Button ID="cancelButton" 
                    runat="server"
                    Text="Cancel"
                    ToolTip="Go back to main website"
                    CssClass="pagecancbutton" />

        <%-- Button to modify the customisable CSS --%>
        <%-- Removed
        <asp:Button ID="CssButton" 
                    runat="server"
                    Text="Custom CSS"
                    ToolTip="Modify the custom CSS file"
                    CssClass="pagecssbutton"  /> --%>

    </div>
    </form>
</body>
</html>
