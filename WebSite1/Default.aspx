<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:HyperLink ID="HenLichKham" runat="server" href="HenKham.aspx"
        Font-Size="Large" Font-Underline="True" ForeColor="#6600CC">Hẹn Lịch Khám</asp:HyperLink>
</asp:Content>
