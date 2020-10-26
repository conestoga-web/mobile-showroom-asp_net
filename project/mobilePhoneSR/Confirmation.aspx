<%@ Page Title="Confirmation" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="mobilePhoneSR.Confirmation" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div>
        <div class="form-group">
            <asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" CssClass="form-control" 
                    Columns="50" Rows="25"></asp:TextBox>  
        </div>
        <div class="form-group">
             <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-default"
                PostBackUrl="~/Order.aspx" Text="Continue Shopping" />
        </div>
    </div>
</asp:Content>
