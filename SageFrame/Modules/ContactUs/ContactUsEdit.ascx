<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUsEdit.ascx.cs"
    Inherits="SageFrame.Modules.ContactUs.ContactUsEdit" %>
<div class="sfFormwrapper">
    <div class="sfGridwrapper">
        <asp:GridView runat="server" ID="gdvContacters" Width="100%" AutoGenerateColumns="False"
            AllowPaging="True" OnPageIndexChanging="gdvContacters_PageIndexChanging" OnRowCancelingEdit="gdvContacters_RowCancelingEdit"
            OnRowCommand="gdvContacters_RowCommand" OnRowDataBound="gdvContacters_RowDataBound"
            OnRowDeleting="gdvContacters_RowDeleting" OnRowEditing="gdvContacters_RowEditing"
            OnRowUpdating="gdvContacters_RowUpdating" EmptyDataText="...Contact Not  Found..." meta:resourcekey="gdvContactersResource1">
            <Columns>
                <asp:TemplateField HeaderText="S.No." meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <HeaderStyle VerticalAlign="Top" CssClass="sfEdit" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' meta:resourcekey="lblNameResource1" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' meta:resourcekey="lblEmailResource1" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AddedOn") %>' meta:resourcekey="lblDateResource1" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message" meta:resourcekey="TemplateFieldResource5">
                    <ItemTemplate>
                        <asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Message") %>' meta:resourcekey="lblMessageResource1" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" meta:resourcekey="TemplateFieldResource6">
                    <ItemTemplate>
                        <asp:LinkButton ID="imbDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ContactUsID") %>'
                            CommandName="Delete" CssClass="icon-delete" 
                            OnClientClick="return ConfirmDialog(this, 'Confirmation', 'Are you sure you want to delete ?');" meta:resourcekey="imbDeleteResource1" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfDelete" />
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle CssClass="sfEven" />
            <PagerStyle CssClass="sfPagination" />
            <RowStyle CssClass="sfOdd" />
        </asp:GridView>
    </div>
</div>
