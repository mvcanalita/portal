<%@ Page Title="Error Page!" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="jdaPortal.Pages.ErrorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="col-md-8">
            <h3>Unexpected Error!</h3>
            <p>
                <asp:Label ID="lblError" runat="server" Text="The system has encountered an explainable error.."></asp:Label>
            </p>
        </div>
    </div>
</asp:Content>
