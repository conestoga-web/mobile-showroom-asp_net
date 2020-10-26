<%@ Page Title="Questions and Answers" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="mobilePhoneSR.Questions" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <div class="col-xs-12 table-responsive">
        <h1>Q & A</h1>
        <asp:GridView ID="grdQuestions" runat="server"
            AutoGenerateColumns="False" DataKeyNames="CustomerID"
            DataSourceID="SqlDataSource1"
            CssClass="table table-bordered table-condensed"
            OnPreRender="grdQuestions_PreRender" 
            OnRowDeleted="grdQuestions_RowDeleted" 
            OnRowUpdated="grdQuestions_RowUpdated">
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="ID" 
                    ReadOnly="True">
                    <ItemStyle CssClass="col-xs-1" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Question">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridQuestion" runat="server" CssClass="form-control" 
                                Text='<%# Bind("Questions") %>' TextMode="MultiLine" MaxLength="250"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvGridQuestion" runat="server" 
                            ControlToValidate="txtGridQuestion" ValidationGroup="Edit" 
                            Text="*" ErrorMessage="Question is a required field" 
                            CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvGridQuestion" runat="server" ErrorMessage="A question must be less than 250 characters" 
                            CssClass="text-danger" Display="Dynamic" ControlToValidate="txtGridQuestion" 
                            ValidationGroup="Edit" Type="String">
                        </asp:RangeValidator>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridQuestion" runat="server" 
                            Text='<%# Bind("Questions") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-5" />
                </asp:TemplateField>                   
                <asp:TemplateField HeaderText="DueDate" SortExpression="DueDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridDueDate" runat="server" Text='<%# Bind("DueDate", "{0:d}") %>' MaxLength="10" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="DueDate" runat="server" Text='<%# Bind("DueDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CausesValidation="True" 
                    ShowEditButton="True" ValidationGroup="Edit">
                    <ItemStyle CssClass="col-xs-1" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True">
                    <ItemStyle CssClass="col-xs-1" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle CssClass="bg-halloween" />
            <AlternatingRowStyle CssClass="altRow" />
            <EditRowStyle CssClass="warning" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HomeConnectionString %>"
            ConflictDetection="CompareAllValues" 
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT CustomerID, Questions, DueDate FROM customers"
            DeleteCommand="DELETE FROM customers WHERE (CustomerID = @original_CustomerID) AND (Questions = @original_Questions)" 
            InsertCommand="INSERT INTO customers(CustomerID, FirstName, LastName, Questions, Email, PhoneNumber, DueDate) VALUES (@CustomerID, @FirstName, @LastName, @Questions, @Email, @PhoneNumber, @DueDate)" 
            UpdateCommand="UPDATE customers SET Questions = @Questions, DueDate = @DueDate WHERE (CustomerID = @original_CustomerID) AND (Questions = @original_Questions)">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="String"></asp:Parameter>
                <%--<asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
                <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>--%>
                <asp:Parameter Name="original_Questions" Type="String"></asp:Parameter>
<%--                <asp:Parameter Name="original_Answers" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_DueDate" Type="DateTime" />--%>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String"></asp:Parameter>
                <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Questions" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
                <%--<asp:Parameter Name="original_CategoryID" Type="String" />--%>
                <%--<asp:Parameter Name="original_ProductID" />--%>
                <asp:Parameter Name="DueDate" Type="DateTime"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Questions" Type="String"></asp:Parameter>
                <asp:Parameter Name="DueDate" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="original_CustomerID" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Questions" Type="String"></asp:Parameter>
                <%--<asp:Parameter Name="original_DueDate" Type="DateTime"></asp:Parameter>--%>
            </UpdateParameters>
        </asp:SqlDataSource>  
                
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:" 
            ValidationGroup="Edit" CssClass="text-danger" />  
    </div>

    <div class="col-xs-12">
        <h4>To create a new question, enter the question and the following information, and click Add New Question,</h4>
        <h4>then our support team will reply by e-mail as soon as possible.</h4><br />
        <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                CssClass="text-danger"></asp:Label></p>

        <div class="form-group">
            <label for="txtID" class="col-sm-2">ID</label>
            <div class="col-sm-3">
                <asp:TextBox ID="txtID" runat="server" MaxLength="10" 
                    CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-offset-3 col-sm-4">
                <asp:RequiredFieldValidator ID="rfvID" runat="server" 
                    ControlToValidate="txtID" CssClass="text-danger" 
                    ErrorMessage="ID is a required field">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtFirstName" class="col-sm-2">First Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="15" 
                    CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-offset-2 col-sm-4">
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                ControlToValidate="txtFirstName" CssClass="text-danger" 
                ErrorMessage="First Name is a required field">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtLastName" class="col-sm-2">Last Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtLastName" runat="server" MaxLength="15" 
                    CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-offset-2 col-sm-4">
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                ControlToValidate="txtLastName" CssClass="text-danger" 
                ErrorMessage="Last Name is a required field">
                </asp:RequiredFieldValidator>
            </div>
        </div>          
        <div class="form-group">
            <label for="txtQuestion" class="col-sm-2">Question</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtQuestion" runat="server" 
                    CssClass="form-control" TextMode="MultiLine" MaxLength="250"></asp:TextBox>
                <asp:Label ID="lblQuestion" runat="server" CssClass="text-danger" Text="A question must be less than 250 characters."></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvQuestion" runat="server" 
                ControlToValidate="txtQuestion" CssClass="text-danger" 
                ErrorMessage="Question is a required field">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtEmail" class="col-sm-2">e-Mail:</label>
            <div class="col-sm-3">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="30" 
                    CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="txtEmail" CssClass="text-danger" 
                ErrorMessage="e-Mail is a required field">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="txtPhoneNumber" class="col-sm-2">Phone Number:</label>
            <div class="col-sm-3">
                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="15" 
                    CssClass="form-control" TextMode="Phone"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="txtDueDate" class="col-sm-2">Due Date:</label>
            <div class="col-sm-3">
                <asp:TextBox ID="txtDueDate" runat="server" MaxLength="10" 
                    CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
        </div>

        <asp:Button ID="btnAdd" runat="server" Text="Add New Question" 
            CssClass="btn" OnClick="btnAdd_Click" />
    </div>

</asp:Content>
