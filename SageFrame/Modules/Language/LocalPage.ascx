﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LocalPage.ascx.cs" Inherits="Modules_LocalPage_LocalPage" %>
<h1>
    <asp:Label ID="lblLocalPageEditor" runat="server" Text="Localize Menu" meta:resourcekey="lblLocalPageEditorResource1"></asp:Label></h1>
<div>
    <div class="sfFormwrapper sfTableOption">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15%">
                    <asp:Label ID="lblAvailableLocales" runat="server" CssClass="sfFormlabel" Text="Available Locales" meta:resourcekey="lblAvailableLocalesResource1"></asp:Label>
                </td>
                <td width="30">:
                </td>
                <td>
                    <asp:DropDownList ID="ddlAvailableLocales" runat="server" CssClass="sfListmenu" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlAvailableLocales_SelectedIndexChanged" meta:resourcekey="ddlAvailableLocalesResource1">
                    </asp:DropDownList>
                    <asp:Image ID="imgFlag" runat="server" meta:resourcekey="imgFlagResource1" />
                </td>
            </tr>
        </table>
    </div>
    <div class="sfGridwrapper">
        <asp:GridView ID="gdvLocalPage" class="cssClassKeyValueGrid" DataKeyNames="PageID"
            runat="server" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="gdvLocalPage_SelectedIndexChanged"
            OnSelectedIndexChanging="gdvLocalPage_SelectedIndexChanging" OnPageIndexChanging="gdvLocalPage_PageIndexChanging" meta:resourcekey="gdvLocalPageResource1">
            <Columns>
                <asp:TemplateField HeaderText="S.N" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Default Values" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label ID="lbldefaultValue" runat="server" Text='<%# Eval("PageName") %>' meta:resourcekey="lbldefaultValueResource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Local Values" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:TextBox ID="txtLocalPageName" Style="width: 350px" ToolTip="<%# Container.DataItemIndex+1 %>"
                            runat="server" CssClass="sfInputbox" Text='<%# Eval("LocalPageName") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Local Caption" meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <asp:TextBox ID="txtLocalPageCaption" Style="width: 200px" ToolTip="<%# Container.DataItemIndex+1 %>"
                            runat="server" CssClass="sfInputbox" Text='<%# Eval("LocalPageCaption") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle CssClass="sfEven" />
            <RowStyle CssClass="sfOdd" />
        </asp:GridView>
    </div>
    <div class="sfButtonwrapper">
        <label class="sfLocale icon-save sfBtn">
            Save
            <asp:Button ID="imbUpdate" runat="server" OnClick="imbUpdate_Click"
                Style="height: 16px" meta:resourcekey="imbUpdateResource1" />
        </label>
        <label class="sfLocale icon-close sfBtn">
            Cancel
            <asp:Button ID="imbCancel" runat="server" OnClick="imbCancel_Click" meta:resourcekey="imbCancelResource1" /><label></label>
    </div>
</div>
