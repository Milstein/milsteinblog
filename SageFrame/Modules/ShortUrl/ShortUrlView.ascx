<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShortUrlView.ascx.cs"
    Inherits="Modules_ShortUrl_ShortUrlView" %>
<div runat="server">
    <asp:TextBox ID="txtUrl" runat="server" meta:resourcekey="txtUrlResource1"></asp:TextBox>
    <asp:Button ID="btnGenerateShortUrl" runat="server" Text="Generate Code" 
        onclick="btnGenerateShortUrl_Click" meta:resourcekey="btnGenerateShortUrlResource1" />
</div>
<div runat="server">
    <asp:Label ID="lblShortUrl" runat="server" meta:resourcekey="lblShortUrlResource1"></asp:Label>
    <asp:HyperLink ID="hypCode" runat="server" Target="_blank"></asp:HyperLink>
</div>
