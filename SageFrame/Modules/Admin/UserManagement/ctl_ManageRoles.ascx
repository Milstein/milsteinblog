<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctl_ManageRoles.ascx.cs"
    Inherits="SageFrame.Modules.Admin.UserManagement.ctl_ManageRoles" %>
<h1>
    <asp:Label ID="lblRolesManagement" runat="server" Text="Roles Management" meta:resourcekey="lblRolesManagementResource1"></asp:Label>
</h1>
<asp:Panel ID="pnlRole" runat="server" meta:resourcekey="pnlRoleResource1">
    <div class="sfFormwrapper">
        <h2>
            <asp:Label ID="lblAddRoles" runat="server" Text="Add New Role" meta:resourcekey="lblAddRolesResource1"></asp:Label>
        </h2>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="15%">
                    <asp:Label ID="lblRole" runat="server" CssClass="sfFormlabel" Text="Role Name" meta:resourcekey="lblRoleResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRole" runat="server" CssClass="sfInputbox" meta:resourcekey="txtRoleResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="*" ControlToValidate="txtRole"
                        ValidationGroup="SageFrameRole" meta:resourcekey="rfvRoleResource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    <div class="sfButtonwrapper">
        <asp:LinkButton ID="imgAdd" runat="server" ValidationGroup="SageFrameRole" OnClick="imgAdd_Click"
            ToolTip="save" CssClass="icon-save sfBtn" Text="Save" meta:resourcekey="imgAddResource1" />
        <asp:LinkButton ID="imgCancel" runat="server" CausesValidation="False" OnClick="imgCancel_Click"
            ToolTip="cancel" CssClass="icon-close sfBtn" Text="Cancel" meta:resourcekey="imgCancelResource1" />
    </div>
</asp:Panel>
<asp:Panel ID="pnlRoles" runat="server" meta:resourcekey="pnlRolesResource1">
    <div class="sfButtonwrapper">
        <asp:LinkButton ID="imbAddNewRole" runat="server" OnClick="imbAddNewRole_Click" ToolTip="Add New Role"
            CssClass="icon-addnew sfBtn" Text="Add New Role" meta:resourcekey="imbAddNewRoleResource1" />
    </div>
    <div class="sfGridwrapper">
        <asp:GridView ID="gdvRoles" runat="server" AutoGenerateColumns="False" GridLines="None"
            OnRowDeleting="gdvRoles_RowDeleting" DataKeyNames="Role,RoleID" Width="100%"
            OnRowDataBound="gdvRoles_RowDataBound" OnRowCommand="gdvRoles_RowCommand" meta:resourcekey="gdvRolesResource1">
            <AlternatingRowStyle CssClass="sfEven" />
            <Columns>
                <asp:BoundField DataField="Role" HeaderText="Roles" meta:resourcekey="BoundFieldResource1" />
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:LinkButton ID="imbDelete" runat="server" CausesValidation="False" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Delete" CssClass="icon-delete" meta:resourcekey="imbDeleteResource1" OnClientClick="return ConfirmDialog(this, 'Confirmation', 'Are you sure you want to delete this role?');" ToolTip="Delete the role"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfDelete" />
                </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="sfOdd" />
        </asp:GridView>
    </div>
</asp:Panel>
