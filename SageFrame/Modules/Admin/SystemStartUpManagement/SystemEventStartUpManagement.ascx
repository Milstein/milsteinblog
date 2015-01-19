<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SystemEventStartUpManagement.ascx.cs"
    Inherits="Modules_Admin_SystemStartUpManagement_SystemEventStartUpManagement" %>
<h2>
    <label id="lblSystemEventManagement">
        System Event StartUp Management</label></h2>
<asp:Panel ID="pnlEventStartUp" runat="server" meta:resourcekey="pnlEventStartUpResource1">
    <div class="sfFormwrapper">
        <h2>
            <asp:Label ID="lblAddEditSystemEventStartUp" runat="server" Text="Add/Edit System Event StartUp" meta:resourcekey="lblAddEditSystemEventStartUpResource1"></asp:Label>
        </h2>
        <asp:HiddenField ID="hdnPortalStartUpID" runat="server" Value="0" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td width="140">
                    <asp:Label ID="lblControlUrl" runat="server" CssClass="sfFormlabel" Text="Control Url" meta:resourcekey="lblControlUrlResource1"></asp:Label>
                </td>
                <td width="30">:
                </td>
                <td>
                    <asp:DropDownList ID="ddlControlUrl" ToolTip="Select Control Url"
                        runat="server" CssClass="sfListmenu" meta:resourcekey="ddlControlUrlResource1">
                    </asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEventLocation" runat="server" CssClass="sfFormlabel" Text="Event Location" meta:resourcekey="lblEventLocationResource1"></asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:DropDownList ID="ddlEventLocation" ToolTip="Select Event Type"
                        runat="server" CssClass="sfListmenu" meta:resourcekey="ddlEventLocationResource1">
                    </asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIsAdmin" runat="server" CssClass="sfFormlabel" Text="Is Admin" meta:resourcekey="lblIsAdminResource1"></asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:CheckBox ID="chkIsAdmin" runat="server" CssClass="sfCheckbox" meta:resourcekey="chkIsAdminResource1" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIsControlUrl" runat="server" CssClass="sfFormlabel" Text="Is ControlUrl" meta:resourcekey="lblIsControlUrlResource1"></asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:CheckBox ID="chkIsControlUrl" runat="server" CssClass="sfCheckbox" meta:resourcekey="chkIsControlUrlResource1" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIsActive" runat="server" CssClass="sfFormlabel" Text="Is Active" meta:resourcekey="lblIsActiveResource1"></asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:CheckBox ID="chkIsActive" runat="server" CssClass="sfCheckbox" meta:resourcekey="chkIsActiveResource1" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="sfButtonwrapper">
        <label id="lblSave" class="sfBtn icon-save" runat="server">
            Save
        <asp:Button ID="imbSave" runat="server" OnClick="imbSave_Click" meta:resourcekey="imbSaveResource1" />
        </label>
        <label id="lblCancel" class="sfBtn icon-close" runat="server">
            Cancel
        <asp:Button ID="imbCancel" runat="server" OnClick="imbCancel_Click"
            CausesValidation="False" meta:resourcekey="imbCancelResource1" />
        </label>

    </div>
</asp:Panel>
<asp:Panel ID="pnlSystemEventStartUpList" runat="server" meta:resourcekey="pnlSystemEventStartUpListResource1">
    <div class="sfButtonwrapper">
        <label id="lblAddNew" class="sfBtn icon-addnew" runat="server">
            Add System Event StartUp
       <asp:Button ID="imbAddNew" runat="server" OnClick="imbAddNew_Click" meta:resourcekey="imbAddNewResource1" />
        </label>

    </div>
    <div class="sfGridwrapper">
        <asp:GridView ID="grdList" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record to Show..."
            GridLines="None" AllowPaging="True" PageSize="15" BorderColor="White" BorderWidth="0px"
            OnPageIndexChanging="grdList_PageIndexChanging" OnRowCommand="grdList_RowCommand" OnRowDataBound="gdvList_RowDataBound"
            Width="100%" meta:resourcekey="grdListResource1">
            <AlternatingRowStyle CssClass="sfEven" />
            <Columns>
                <asp:TemplateField HeaderText="ControlUrl" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("PortalStartUpID") %>' CommandName="EditEvent" meta:resourcekey="LinkButton1Resource1"><asp:Label runat="server" Text='<%# Eval("ControlUrl") %>' ID="lblSubject" meta:resourcekey="lblSubjectResource1"></asp:Label>
</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Event Location" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label ID="lblEventLocation" runat="server" meta:resourcekey="lblEventLocationResource2" Text='<%# Eval("EventLocationName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:BoundField DataField="IsAdmin" HeaderText="Is Admin" meta:resourcekey="BoundFieldResource1">
                <HeaderStyle CssClass="sfColumnIsActive" />
                </asp:BoundField>
                <asp:BoundField DataField="IsControlUrl" HeaderText="Is ControlUrl" meta:resourcekey="BoundFieldResource2">
                <HeaderStyle CssClass="sfColumnIsActive" />
                </asp:BoundField>
                <asp:BoundField DataField="IsSystem" HeaderText="Is System" meta:resourcekey="BoundFieldResource3">
                <HeaderStyle CssClass="sfColumnIsActive" />
                </asp:BoundField>
                <asp:BoundField DataField="IsActive" HeaderText="Is Active" meta:resourcekey="BoundFieldResource4">
                <HeaderStyle CssClass="sfColumnIsActive" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="AddedOn" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <%# Eval("AddedOn","{0:yyyy/MM/dd}") %>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfColumnAddedOn" HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AddedBy" meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <asp:Label ID="lblAddedeBY" runat="server" meta:resourcekey="lblAddedeBYResource1" Text='<%# Eval("AddedBy") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfAddedBy" HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                    <ItemTemplate>
                        <asp:ImageButton ID="imbEdit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("PortalStartUpID") %>' CommandName="EditEvent" ImageUrl='<%# GetTemplateImageUrl("imgedit.png", true) %>' meta:resourcekey="imbEditResource1" ToolTip="Edit" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfColumnEdit" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField meta:resourceKey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:ImageButton ID="imbDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("PortalStartUpID") %>' CommandName="DeleteEvent" ImageUrl='<%# GetTemplateImageUrl("imgdelete.png", true) %>' meta:resourceKey="imbDeleteResource1" OnClientClick="return ConfirmDialog(this, 'Confirmation', 'Are you sure you want to delete this startup event?');" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfDelete" VerticalAlign="Top" />
                    <ItemStyle VerticalAlign="Top" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="sfClassHeadingOne" />
            <PagerStyle CssClass="sfPagination" />
            <RowStyle CssClass="sfOdd" />
        </asp:GridView>
    </div>
</asp:Panel>
