<%@ Page Title="Product Maintenance" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="mobilePhoneSR.Maintenance" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <div class="pm">
            <div class="form-group">

                <div class="col-sm-5 table-responsive">
                    <asp:GridView ID="grdProducts" runat="server" SelectedIndex="0"
                        AutoGenerateColumns="False" DataKeyNames="ProductID" 
                        DataSourceID="SqlDataSource1" AllowPaging="True" 
                        CssClass="table table-bordered table-striped table-condensed" 
                        OnPreRender="grdProducts_PreRender">
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="ID" 
                                ReadOnly="True">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name">
                                <ItemStyle CssClass="col-xs-3" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CategoryName" HeaderText="Category"> 
                                <ItemStyle CssClass="col-xs-3" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Link" ShowSelectButton="true"> 
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle CssClass="bg-info" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle CssClass="pagerStyle" 
                            BackColor="#D4F4FA" HorizontalAlign="Center" />
                        <SelectedRowStyle CssClass="warning" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HomeConnectionString %>" 
                        SelectCommand="SELECT products.ProductID, products.Name, products.UnitPrice, products.OnHand, categories.CategoryName FROM products INNER JOIN categories ON products.CategoryID = categories.CategoryID ORDER BY products.Name">
                    </asp:SqlDataSource> 
                
                    <p><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            HeaderText="Please correct the following errors:" 
                            CssClass="text-danger" /></p>
                    <p><asp:Label ID="lblError" runat="server" 
                        EnableViewState="false" CssClass="text-danger"></asp:Label></p>   
                </div>  

                <div class="col-sm-6">
                    <asp:FormView ID="fvProduct" runat="server" DataKeyNames="ProductID" 
                        DataSourceID="SqlDataSource2" OnItemDeleting="fvProduct_ItemDeleting" 
                        OnItemDeleted="fvProduct_ItemDeleted" OnItemInserted="fvProduct_ItemInserted" 
                        OnItemUpdated="fvProduct_ItemUpdated">
                        <EditItemTemplate>
                            <div class="container-fluid">
                                <div class="form-group">
                                    <label for="NameTextBox">Name:</label>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic" 
                                        ControlToValidate="NameTextBox" CssClass="text-danger"
                                        ErrorMessage="Name is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' 
                                        CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="DescriptionTextBox">Description:</label>
                                    <asp:RequiredFieldValidator ID="rfvDesc" runat="server" 
                                        ControlToValidate="DescriptionTextBox" CssClass="text-danger" Display="Dynamic"
                                        ErrorMessage="Description is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                        Text='<%# Bind("Description") %>' CssClass="form-control"
                                        TextMode="MultiLine" Rows="3" />
                                </div>
                                <div class="form-group">
                                    <label for="SpecificationTextBox">Specification:</label>
                                    <asp:RequiredFieldValidator ID="rfvSpecification" runat="server" Display="Dynamic"
                                        ControlToValidate="SpecificationTextBox" CssClass="text-danger"
                                        ErrorMessage="Specification is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="SpecificationTextBox" runat="server" 
                                        Text='<%# Bind("Specification") %>' CssClass="form-control" 
                                        TextMode="MultiLine" Rows="6" />
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategory">Category:</label>
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="CategoryID" 
                                        SelectedValue='<%# Bind("CategoryID") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ColourTextBox">Colour:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" 
                                        ControlToValidate="ColourTextBox" CssClass="text-danger"
                                        ErrorMessage="Colour is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="ColourTextBox" runat="server" Text='<%# Bind("Colour") %>' 
                                        CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="WarrantyTextBox">Warranty Period:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" 
                                        ControlToValidate="WarrantyTextBox" CssClass="text-danger"
                                        ErrorMessage="Warranty Period is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="WarrantyTextBox" runat="server" Text='<%# Bind("Warranty") %>' 
                                        CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="ImageFileTextBox">Image File:</label>
                                    <asp:TextBox ID="ImageFileTextBox" runat="server" 
                                        Text='<%# Bind("ImageFile") %>' CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="UnitPriceTextBox">Unit Price:</label>
                                    <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" Display="Dynamic"  
                                        ControlToValidate="UnitPriceTextBox" CssClass="text-danger"
                                        ErrorMessage="Unit Price is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvUnitPrice" runat="server" Display="Dynamic" 
                                        ControlToValidate="UnitPriceTextBox" Type="Double" Operator="GreaterThan" 
                                        ErrorMessage="Unit Price must be a number greater than zero." Text="*" 
                                        CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                                    <asp:TextBox ID="UnitPriceTextBox" runat="server" 
                                        Text='<%# Bind("UnitPrice") %>' CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="OnHandTextBox">On Hand:</label>
                                    <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" Display="Dynamic" 
                                        ControlToValidate="OnHandTextBox" CssClass="text-danger"
                                        ErrorMessage="On Hand is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvOnHand" runat="server" Display="Dynamic" 
                                        ControlToValidate="OnHandTextBox" CssClass="text-danger"
                                        Type="Integer" Operator="GreaterThan" ValueToCompare="0" 
                                        ErrorMessage="On Hand must be a whole number greater than zero." Text="*">
                                    </asp:CompareValidator>
                                    <asp:TextBox ID="OnHandTextBox" runat="server" Text='<%# Bind("OnHand") %>' 
                                        CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </div>
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="container-fluid">
                                <div class="form-group">
                                    <label for="ProductIDTextBox">Product ID:</label>
                                    <asp:RequiredFieldValidator ID="rfvProductID" runat="server" Display="Dynamic" 
                                        ControlToValidate="ProductIDTextBox" CssClass="text-danger"
                                        ErrorMessage="ProductID is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="ProductIDTextBox" runat="server" 
                                        Text='<%# Bind("ProductID") %>' CssClass="form-control" />  
                                </div>
                                <div class="form-group">
                                    <label for="NameTextBox">Name:</label>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic" 
                                        ControlToValidate="NameTextBox" CssClass="text-danger"
                                        ErrorMessage="Name is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="NameTextBox" runat="server" 
                                        Text='<%# Bind("Name") %>' CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="DescriptionTextBox">Description:</label>
                                    <asp:RequiredFieldValidator ID="rfvDesc" runat="server" 
                                        ControlToValidate="DescriptionTextBox" CssClass="text-danger" Display="Dynamic"
                                        ErrorMessage="Description is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                        Text='<%# Bind("Description") %>' CssClass="form-control"
                                        TextMode="MultiLine" Rows="3" />
                                </div>
                                <div class="form-group">
                                    <label for="Specification">Specification:</label>
                                    <asp:RequiredFieldValidator ID="rfvSpecification" runat="server" Display="Dynamic"
                                        ControlToValidate="SpecificationTextBox" CssClass="text-danger"
                                        ErrorMessage="Specification is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="SpecificationTextBox" runat="server" 
                                        Text='<%# Bind("Specification") %>' CssClass="form-control" 
                                        TextMode="MultiLine" Rows="6" />
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategory">Category:</label>
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        DataSourceID="SqlDataSource3" DataTextField="CategoryName" 
                                        DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>' 
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ColourTextBox">Colour:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" 
                                        ControlToValidate="ColourTextBox" CssClass="text-danger"
                                        ErrorMessage="Colour is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="ColourTextBox" runat="server" Text='<%# Bind("Colour") %>' 
                                        CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="WarrantyTextBox">Warranty Period:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" 
                                        ControlToValidate="WarrantyTextBox" CssClass="text-danger"
                                        ErrorMessage="Warranty Period is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox ID="WarrantyTextBox" runat="server" Text='<%# Bind("Warranty") %>' 
                                        CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="ImageFileTextBox">Image File:</label>
                                    <asp:TextBox ID="ImageFileTextBox" runat="server" 
                                        Text='<%# Bind("ImageFile") %>' CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="UnitPriceTextBox">Unit Price:</label>
                                    <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" Display="Dynamic"  
                                        ControlToValidate="UnitPriceTextBox" CssClass="text-danger"
                                        ErrorMessage="Unit Price is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvUnitPrice" runat="server" Display="Dynamic" 
                                        ControlToValidate="UnitPriceTextBox" Type="Double" Operator="GreaterThan" 
                                        ErrorMessage="Unit Price must be a number greater than zero." Text="*" 
                                        CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                                    <asp:TextBox ID="UnitPriceTextBox" runat="server" 
                                        Text='<%# Bind("UnitPrice") %>' CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label for="OnHandTextBox">On Hand:</label>
                                    <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" Display="Dynamic" 
                                        ControlToValidate="OnHandTextBox" CssClass="text-danger"
                                        ErrorMessage="On Hand is a required field." Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvOnHand" runat="server" Display="Dynamic" 
                                        ControlToValidate="OnHandTextBox" CssClass="text-danger"
                                        Type="Integer" Operator="GreaterThan" ValueToCompare="0" 
                                        ErrorMessage="On Hand must be a whole number greater than zero." Text="*">
                                    </asp:CompareValidator>
                                    <asp:TextBox ID="OnHandTextBox" runat="server" 
                                        Text='<%# Bind("OnHand") %>' CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="list-group">
                                <div class="bg-info">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <b><asp:Label ID="NameLabel" runat="server" 
                                                Text='<%# Bind("Name") %>' /></b>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Label ID="UnitPriceLabel" runat="server" 
                                                Text='<%# Bind("UnitPrice", "{0:c}") %>' /> each
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <asp:Label ID="DescriptionLabel" runat="server" 
                                        Text='<%# Bind("Description") %>' />
                                    &nbsp;-&nbsp;
                                    <asp:Label ID="Specification" runat="server" 
                                        Text='<%# Bind("Specification") %>' />
                                </div>
                            </div>

                            <table class="table table-bordered">
                                <thead class="bg-info">
                                    <tr>
                                        <th>Product ID</th>
                                        <th>On Hand</th>
                                        <th>Category</th>
                                        <th>Image File</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><asp:Label ID="ProductIDLabel" runat="server" 
                                            Text='<%# Eval("ProductID") %>' /></td>
                                        <td><asp:Label ID="OnHandLabel" runat="server" 
                                            Text='<%# Bind("OnHand") %>' /></td>
                                        <td><asp:Label ID="CategoryIDLabel" runat="server" 
                                            Text='<%# Bind("CategoryName") %>' /></td>
                                        <td><asp:Label ID="ImageFileLabel" runat="server" 
                                            Text='<%# Bind("ImageFile") %>' /></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="list-group">
                                <div class="list-group-item">
                                    <asp:LinkButton ID="EditButton" runat="server" 
                                        CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" 
                                        CausesValidation="False" CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" 
                                        CausesValidation="False" CommandName="New" Text="New" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:HomeConnectionString %>"
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT products.ProductID, products.Name, products.Description, products.Specification, products.CategoryID, products.ImageFile, products.Colour, products.Warranty, products.UnitPrice, products.OnHand, categories.CategoryName FROM products INNER JOIN categories ON products.CategoryID = categories.CategoryID WHERE (products.ProductID = @ProductID)" 
                        DeleteCommand="DELETE FROM [products] 
                            WHERE ([ProductID] = @original_ProductID) 
                            AND ([Name] = @original_Name) 
                            AND ([Description] = @original_Description) 
                            AND ([Specification] = @original_Specification) 
                            AND ([CategoryID] = @original_CategoryID) 
                            AND (([ImageFile] = @original_ImageFile) 
                            OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL)) 
                            AND ([Colour] = @original_Colour) 
                            AND ([Warranty] = @original_Warranty) 
                            AND ([UnitPrice] = @original_UnitPrice) 
                            AND (([OnHand] = @original_OnHand) 
                            OR (OnHand IS NULL AND @original_OnHand IS NULL))" 
                        InsertCommand="INSERT INTO [products] ([ProductID], [Name], 
                            [Description], [Specification], [CategoryID], [ImageFile], 
                            [Colour], [Warranty], [UnitPrice], [OnHand]) 
                          VALUES (@ProductID, @Name, @Description, @Specification, 
                            @CategoryID, @ImageFile, @Colour, @Warranty, @UnitPrice, @OnHand)" 
                        UpdateCommand="UPDATE [products] SET [Name] = @Name, 
                            [Description] = @Description, 
                            [Specification] = @Specification, 
                            [CategoryID] = @CategoryID, 
                            [ImageFile] = @ImageFile, 
                            [Colour] = @Colour, 
                            [UnitPrice] = @UnitPrice, 
                            [OnHand] = @OnHand, [Warranty] = @Warranty 
                          WHERE ([ProductID] = @original_ProductID) 
                            AND ([Name] = @original_Name) 
                            AND ([Description] = @original_Description) 
                            AND ([Specification] = @original_Specification) 
                            AND ([CategoryID] = @original_CategoryID) 
                            AND (([ImageFile] = @original_ImageFile) 
                            OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL)) 
                            AND ([Colour] = @original_Colour) 
                            AND ([UnitPrice] = @original_UnitPrice) 
                            AND (([OnHand] = @original_OnHand) 
                            OR (OnHand IS NULL AND @original_OnHand IS NULL)) 
                            AND ([Warranty] = @original_Warranty)" ConflictDetection="CompareAllValues">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ProductID" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Description" Type="String" />
                            <asp:Parameter Name="original_Specification" Type="String" />
                            <asp:Parameter Name="original_CategoryID" Type="String" />
                            <asp:Parameter Name="original_ImageFile" Type="String" />
                            <asp:Parameter Name="original_Colour" Type="String" />
                            <asp:Parameter Name="original_Warranty" Type="String" />
                            <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                            <asp:Parameter Name="original_OnHand" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ProductID" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Specification" Type="String" />
                            <asp:Parameter Name="CategoryID" Type="String" />
                            <asp:Parameter Name="ImageFile" Type="String" />
                            <asp:Parameter Name="Colour" Type="String" />
                            <asp:Parameter Name="Warranty" Type="String" />
                            <asp:Parameter Name="UnitPrice" Type="Decimal" />
                            <asp:Parameter Name="OnHand" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="grdProducts" Name="ProductID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Specification" Type="String" />
                            <asp:Parameter Name="CategoryID" Type="String" />
                            <asp:Parameter Name="ImageFile" Type="String" />
                            <asp:Parameter Name="Colour" Type="String" />
                            <asp:Parameter Name="UnitPrice" Type="Decimal" />
                            <asp:Parameter Name="OnHand" Type="Int32" />
                            <asp:Parameter Name="Warranty" Type="String" />
                            <asp:Parameter Name="original_ProductID" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Description" Type="String" />
                            <asp:Parameter Name="original_Specification" Type="String" />
                            <asp:Parameter Name="original_CategoryID" Type="String" />
                            <asp:Parameter Name="original_ImageFile" Type="String" />
                            <asp:Parameter Name="original_Colour" Type="String" />
                            <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                            <asp:Parameter Name="original_OnHand" Type="Int32" />
                            <asp:Parameter Name="original_Warranty" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:HomeConnectionString %>' 
                        SelectCommand="SELECT * FROM [categories] ORDER BY [CategoryName]">
                    </asp:SqlDataSource> 
                </div>

            </div>
        </div>
    </div>
</asp:Content>