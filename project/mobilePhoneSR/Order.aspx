<%@ Page Title="Home" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="mobilePhoneSR.Order" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row"><%-- row 1: drop-down list --%>
        <div class="col-sm-8">
            <div class="form-group">
                <div class="col-sm-12"><asp:Label ID="lblWelcome" runat="server" CssClass="text-capitalize text-info"></asp:Label></div>
            </div>
            <div class="form-group">            
                <label class="col-sm-5">Please select a product:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" 
                        DataValueField="ProductID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:HomeConnectionString %>' 
                        SelectCommand="SELECT [Name], [ProductID], [Description], [Specification], [ImageFile], [Colour], [Warranty], [UnitPrice] FROM [products] ORDER BY [Name]">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div><%-- end of row 1 --%>

    <div class="row"><%-- row 2: FormView control --%>
        <asp:FormView ID="FormView1" runat="server" 
            DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <div class="col-sm-8"><%-- info column --%>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <h4><asp:Label Text='<%# Eval("Name") %>' runat="server" /></h4>
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <asp:Label Text='<%# Eval("Description") %>' runat="server" />
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <asp:Label ID="spec" runat="server" Text="Specification:" CssClass="text-primary"></asp:Label><br />
                            <asp:Label Text='<%# Eval("Specification") %>' runat="server" />
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <asp:Label ID="color" runat="server" Text="Colour: " CssClass="text-primary"></asp:Label>
                            <asp:Label Text='<%# Eval("Colour") %>' runat="server" />
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <asp:Label ID="warranty" runat="server" Text="Warranty: " CssClass="text-primary"></asp:Label>
                            <asp:Label Text='<%# Eval("Warranty") %>' runat="server" />
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <asp:Label ID="price" runat="server" Text="Price: " CssClass="text-primary"></asp:Label>
                            <asp:Label ID="lblUnitPrice" ClientIDMode="Static" 
                                Text='<%# Eval("UnitPrice", "{0:c} each") %>' runat="server" />
                        </div></div>
                </div>
                <div class="col-sm-4"><%-- product image column --%>
                    <asp:Image ID="imgProduct" runat="server" 
                        ImageUrl='<%# Eval("ImageFile", "Images/Products/{0}") %>' />
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" 
            ConnectionString='<%$ ConnectionStrings:HomeConnectionString %>' 
            SelectCommand="SELECT [ProductID], [Name], [Description], [Specification], [ImageFile], [Colour], [Warranty], [UnitPrice] FROM [products] WHERE ([ProductID] = @ProductID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProducts" Name="ProductID" 
                    PropertyName="SelectedValue" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div><%-- end of row 2 --%>

    <div class="row"><%-- row 3: quantity, buttons --%>
        <div class="col-sm-12">
            <div class="form-group">
                <label class="col-sm-1">Quantity:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtQuantity" runat="server" 
                        CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                        runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                        ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" 
                        ControlToValidate="txtQuantity" Display="Dynamic" 
                        ErrorMessage="Quantity must range from 1 to 500."
                        MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator></div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
                        onclick="btnAdd_Click" CssClass="btn" />
                    <asp:Button ID="btnCart" runat="server" Text="Go to Cart" 
                        PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn" />
                </div>
            </div>
        </div>
    </div><%-- end of row 3 --%>

    <div class="text-center">
        <asp:Label ID="lblCacheTimestamp" runat="server"></asp:Label><br />
        Page Hits: <asp:Label ID="lblPageHits" runat="server"></asp:Label>
    </div>

</asp:Content>
