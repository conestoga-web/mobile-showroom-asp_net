<%@ Page Title="Customer Survey" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" Inherits="mobilePhoneSR.CustomerSurvey" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <div class="row2">
        <div class="form-group">
            <div class="start_line">
                <label class="col-sm-2 text-primary">Enter your customer ID:</label>
  
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCustomerID" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents" CssClass="btn" ValidationGroup="GetIncidents" OnClick="BtnGetIncidents_Click" />
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" ErrorMessage="CustomerID re-entry" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCustomerID" ValidationGroup="GetIncidents">CustomerID is a required field.</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvCustomerID" runat="server" ErrorMessage="CustomerID re-entry" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCustomerID" ValidationGroup="GetIncidents" Operator="DataTypeCheck" Type="Integer">Must be an integer.</asp:CompareValidator>
                </div>
            </div>
        </div>
    </div>
    <div class="row2">
        <div class="form-group">
            <div class="id_check">
                <div class="col-sm-8">
                    <asp:Label ID="lblIdCheck" runat="server" EnableViewState="false" CssClass="text-info text-danger"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <div class="row2">
        <div class="form-group">
            <div class="list_incident">
                <div class="col-sm-8">
                    <asp:ListBox ID="lstIncident" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="IncidentID" DataValueField="IncidentID" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
                <div class="col-sm-8">
                    <asp:RequiredFieldValidator ID="rfvListIncident" runat="server" ErrorMessage="Customer Incident List" ControlToValidate="lstIncident" ValidationGroup="Submit" CssClass="text-danger">The list is required.</asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>
    <div class="row2">
        <%--<div class="col-sm-12">--%>
            <div class="rate"><h5>Please rate this incident by the following categories:</h5></div>
        <%--</div>--%>
    </div>
    <div class="row2">
        <div class="form-group">
            <div class="survey_rdo">
                <div class="col-sm-2"><asp:Label ID="lblResponseTime" runat="server" Text="Response time:" CssClass="text-info"></asp:Label></div>
                <div class="col-sm-10">
                    <asp:RadioButtonList ID="rblResponseTime" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="survey_rdo">
                <div class="col-sm-2"><asp:Label ID="lblTechnicianEfficiency" runat="server" Text="Technician efficiency:" CssClass="text-info"></asp:Label></div>
                <div class="col-sm-10">
                    <asp:RadioButtonList ID="rblTechEfficiency" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="survey_rdo">
                <div class="col-sm-2"><asp:Label ID="lblProblemResolution" runat="server" Text="Problem resolution:" CssClass="text-info"></asp:Label></div>
                <div class="col-sm-10">
                    <asp:RadioButtonList ID="rblProbResolution" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied &nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>
    </div>
    <div class="row2">
        <div class="form-group">
            <div class="comments">
                <label class="col-sm-2 text-primary">Additional comments:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtComments" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row2">
        <div class="form-group">
            <div class="ask_contact">
                    <div class="col-sm-5">
                        <asp:CheckBox ID="chkAskContact" runat="server" Text="Please contact me to discuss this incident" OnCheckedChanged="ChkAskContact_CheckedChanged" AutoPostBack="False" CssClass="text-info" />
                    </div>                   
            </div>
        </div>
        <div class="form-group">
            <div class="contact_rdo">
                    <div class="col-sm-12">
                        <asp:RadioButton ID="rdoEmail" runat="server" Text="Contact by email" GroupName="ContactBy" CssClass="text-info" />
                    </div>
                    <div class="col-sm-12">
                        <asp:RadioButton ID="rdoPhone" runat="server" Text="Contact by phone" GroupName="ContactBy" CssClass="text-info" />
                    </div>                     
            </div>
        </div>
    </div>
    <div class="row2">
        <div class="form-group">
                <div class="submit">
                    <div class="col-sm-12">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="BtnSubmit_Click" ValidationGroup="Submit" />
                    </div>
                </div>
        </div>
    </div>

</asp:Content>
