<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="mobilePhoneSR.ContactUs" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">   
<div class="contact">
    <div class="row">
        <div class="form-group"> 
            <h1>How to Contact us</h1>
        </div>
    </div>
    <div class="row">
        <div class="form-group"> 
            <h3>If you ever have any questions or comments about our products,</h3>
            <h3>please be sure to contact us in whatever way is most convenient for you.</h3>
        </div>
    </div>
    <div class="row">
        <div class="form-group">                            
            <div class="col-sm-12">
                <label class="col-sm-3">Phone: </label><div class ="col-sm-6"><asp:Label ID="lblPhone" runat="server"></asp:Label></div>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3">Email: </label><div class ="col-sm-6"><asp:Label ID="lblEmail" runat="server" >
                    <asp:HyperLink ID="Email" runat="server" NavigateUrl="mailto:mobileshowroom@onlineshop.com">mobileshowroom@onlineshop.com</asp:HyperLink></asp:Label></div>
            </div>
            <div class="col-sm-12">
                <label class="col-sm-3">Fax: </label><div class ="col-sm-6"><asp:Label ID="lblFax" runat="server"></asp:Label></div>
            </div>   
            <div class="col-sm-12">
                <label class="col-sm-3">Head Office: </label><div class ="col-sm-6"><asp:Label ID="lblAddress" runat="server"></asp:Label></div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

