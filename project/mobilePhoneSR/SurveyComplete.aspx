<%@ Page Title="Survey Complete" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" Inherits="mobilePhoneSR.SurveyComplete" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
<%--        <form id="form1" runat="server" class="form-horizontal">--%>
    <div class="row">
        <div class="text-info"><h4>Thank you for your feedback!</h4></div>
    </div>
    <div class="row">
        <div class="form-group">
            <div class="col-sm-12">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="text-info"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group">
            <div class="col-sm-12">
                <asp:Button ID="btnSurvey" runat="server" Text="Return to Survey" CssClass="btn" OnClick="btnSurvey_Click" />
                <%--<asp:Button ID="btnSurvey" runat="server" Text="Return to Survey" CssClass="btn" PostBackUrl="~/CustomerSupport/CompleteCustomerSurvey" OnClick="btnSurvey_Click" />--%>
            </div>
        </div>
    </div>
<%--        </form>--%>
</asp:Content>
