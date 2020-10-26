<%@ Page Title="Products" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="mobilePhoneSR.Products" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src='/Images/Products/<%# Eval("ImageFile") %>' 
                            alt='<%# Eval("Name") %>' />
                        <div class="caption">
                            <h3><%# Eval("Name") %></h3>
                            <p><b>Price: <%# Eval("UnitPrice", "{0:c}") %></b>
                            <br><br><%# Eval("Specification") %>
                            <br><br><%# Eval("Colour") %>                           
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceByCategory"
        ConnectionString='<%$ ConnectionStrings:HomeConnectionString %>'
        SelectCommand="SELECT [ProductID], [Name], [Specification], [ImageFile], [UnitPrice], [Colour] FROM [products] WHERE ([CategoryID] = @CategoryID) ORDER BY [Name]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="catID" 
                Name="CategoryID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceAll"
        ConnectionString='<%$ ConnectionStrings:HomeConnectionString %>'
        SelectCommand="SELECT [ProductID], [Name], [Specification], [ImageFile], [Colour], [UnitPrice] FROM [products] ORDER BY [Name]">
    </asp:SqlDataSource>
    
</asp:Content>