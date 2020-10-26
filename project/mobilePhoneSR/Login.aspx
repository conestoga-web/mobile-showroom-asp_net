<%@ Page Title="Login" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="mobilePhoneSR.Login" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        <h3>Please log in...</h3>

        <div class="form-group">
            <label class="control-label col-sm-2">First Name:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                    ErrorMessage="Required" CssClass="text-danger" 
                    Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">Last Name:</label>
            <div class="col-sm-5">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-5">
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                    ErrorMessage="Required" CssClass="text-danger" 
                    Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator> 
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btn" 
                    OnClick="btnContinue_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn"
                    CausesValidation="False" PostBackUrl="~/Order.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
