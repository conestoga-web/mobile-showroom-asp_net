<%@ Page Title="default" Language="C#" MasterPageFile="~/ShowRoom.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="mobilePhoneSR._default" %>
<%@ MasterType VirtualPath="~/ShowRoom.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">  
<div id="introduction">
    <h1>Choose your best!</h1>
    <div id="sample">
        <%--<h3>Online Showroom</h3>--%>
        <div id="caption">iPhone XS</div>
        <img src="/Images/first/iPhone_XS.jpg" id="image" alt="" />
        <div id="btn"><input type="button" id="play_pause" value="Pause" />
        <input type="button" id="change_speed" value="Speed" />
        <input type="button" id="view_slides" value="Slides" /></div>   
        <%--<p><span id="caption">iPhone XS-MAX</span></p>--%>
    </div>
    <p class="px">A Better Way to Shop for Phones and Plans</p>
    <p id="p1">Conestoga Online Mobile Shop offers the best choice if you are in the market for a new phone or seeking a new carrier to provide your wireless service. However you connect with the wider world, be it with the top operating systems, like Android or Apple's iOS, you can shop for the latest devices from the best manufacturers. It’s the Conestoga Online Mobile Shop Promise.
    </p>

    <p class="px">The Benefits of Best Buy Mobile</p>
    <p>Experienced staff will cover all the bases for you, helping you select from devices by a variety of vendors, including Apple, Google, Samsung, LG,  ASUS, and more.
        Whether you’re committed to the simple layout of iOS, or prefer the customization Android offers, you’ll love the huge selection of phones available. 
        You will also have the chance to sign up for a plan with any of the major carriers, or upgrade your own way with any of the unlocked devices available in-store or on the Conestoga Online Mobile Shop website.
    </p>

    <p>Do it all without having to worry about long lineups at any of our stand-alone Conestoga Online Mobile locations. Helpful staff stay on top of all the latest products, providing you with impartial and knowledgeable information on whatever you are shopping for. Straightforward pricing means you won’t have to guess how much you can expect to pay.
    </p>

    <p class="px">Mobile Services</p>
    <p>You can walk away from a Conestoga Online Mobile location ready to go with your new phone. Specialists can help you set up your new device, transfer data to a new handset, and help pair a new accessory. No matter what you come in for, you will get great service from non-commissioned staff eager to help.
    </p> 
        
</div>
</asp:Content>
