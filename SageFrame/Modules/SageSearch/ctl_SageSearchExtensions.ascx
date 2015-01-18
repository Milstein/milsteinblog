<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctl_SageSearchExtensions.ascx.cs"
    Inherits="Modules_SageSearch_ctl_SageSearchExtensions" %>
<h2>
    <asp:Label ID="lblSageSearchExtensionManagement" runat="server" Text="Search Extension Management" meta:resourcekey="lblSageSearchExtensionManagementResource1"></asp:Label>
</h2>
<div class="sfButtonwrapper" id="actionWrapper" runat="server">
    <asp:ImageButton ID="imbAddNew" runat="server" CausesValidation="False" OnClick="imbAddNew_Click" meta:resourcekey="imbAddNewResource1" />
    <asp:Label ID="lblAddNew" runat="server" Text="Add New" AssociatedControlID="imbAddNew"
        Style="cursor: pointer;" meta:resourcekey="lblAddNewResource1"></asp:Label>
</div>
<div class="cssClassGridWrapper" id="gdvWrapper" runat="server">
    <asp:GridView Width="100%" runat="server" ID="gdvList" AutoGenerateColumns="False"
        AllowPaging="True" EmptyDataText=".........No Extensions found........." OnPageIndexChanging="gdvList_PageIndexChanging"
        OnRowCommand="gdvList_RowCommand" OnRowDataBound="gdvList_RowDataBound" OnRowDeleting="gdvList_RowDeleting"
        OnRowEditing="gdvList_RowEditing" OnRowUpdating="gdvList_RowUpdating" meta:resourcekey="gdvListResource1">
        <Columns>
            <asp:TemplateField HeaderText="Title" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkUsername" runat="server" CommandArgument='<%# Eval("SageFrameSearchProcedureID") %>'
                        CommandName="Edit" Text='<%# Eval("SageFrameSearchTitle") %>' meta:resourcekey="lnkUsernameResource1"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Procedure Name" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="lblSageFrameSearchProcedureName" runat="server" Text='<%# Eval("SageFrameSearchProcedureName") %>' meta:resourcekey="lblSageFrameSearchProcedureNameResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Execute As" meta:resourcekey="TemplateFieldResource3">
                <ItemTemplate>
                    <asp:Label ID="lblSageFrameSearchProcedureExecuteAs" runat="server" Text='<%# Eval("SageFrameSearchProcedureExecuteAs") %>' meta:resourcekey="lblSageFrameSearchProcedureExecuteAsResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UpdatedOn" meta:resourcekey="TemplateFieldResource4">
                <ItemTemplate>
                    <asp:Label ID="lblNewsDate" runat="server" Text='<%# Eval("UpdatedOn") %>' meta:resourcekey="lblNewsDateResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                <ItemTemplate>
                    <asp:ImageButton ID="imbEdit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("SageFrameSearchProcedureID") %>'
                        CommandName="Edit" ToolTip="Edit" ImageUrl='<%# GetTemplateImageUrl("imgedit.png", true) %>' meta:resourcekey="imbEditResource1" />
                </ItemTemplate>
                <HeaderStyle CssClass="cssClassColumnEdit" />
            </asp:TemplateField>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                <ItemTemplate>
                    <asp:ImageButton ID="imbDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("SageFrameSearchProcedureID") %>'
                        CommandName="Delete" ToolTip="Delete" ImageUrl='<%# GetTemplateImageUrl("imgdelete.png", true) %>' meta:resourcekey="imbDeleteResource1" />
                </ItemTemplate>
                <HeaderStyle CssClass="cssClassColumnDelete" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="cssClassHeadingOne" />
        <RowStyle CssClass="cssClassAlternativeOdd" />
        <AlternatingRowStyle CssClass="cssClassAlternativeEven" />
    </asp:GridView>
</div>
<div id="frmWrapper" runat="server">
    <div class="sfFormwrapper">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="20%">
                    <asp:Label ID="lblSageFrameSearchTitle" runat="server" Text="Title:" CssClass="sfFormlabel"
                        ToolTip="Fill the tile for your search" meta:resourcekey="lblSageFrameSearchTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSageFrameSearchTitle" runat="server" ValidationGroup="SearchExtensionValidation"
                        CssClass="sfInputbox" meta:resourcekey="txtSageFrameSearchTitleResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="SearchExtensionValidation"
                        ControlToValidate="txtSageFrameSearchTitle" runat="server" ErrorMessage="*" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSageFrameSearchProcedureName" runat="server" Text="Procedure Name:"
                        CssClass="sfFormlabel" meta:resourcekey="lblSageFrameSearchProcedureNameResource2"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSageFrameSearchProcedureName" runat="server" ValidationGroup="SearchExtensionValidation"
                        CssClass="sfInputbox" meta:resourcekey="txtSageFrameSearchProcedureNameResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="SearchExtensionValidation"
                        ControlToValidate="txtSageFrameSearchProcedureName" runat="server" ErrorMessage="*" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSageFrameSearchProcedureExecuteAs" runat="server" Text="Execute As:"
                        CssClass="sfFormlabel" ToolTip="like dbo" meta:resourcekey="lblSageFrameSearchProcedureExecuteAsResource2"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSageFrameSearchProcedureExecuteAs" ValidationGroup="SearchExtensionValidation"
                        Text="dbo" runat="server" CssClass="sfInputbox" meta:resourcekey="txtSageFrameSearchProcedureExecuteAsResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="SearchExtensionValidation"
                        ControlToValidate="txtSageFrameSearchProcedureExecuteAs" runat="server" ErrorMessage="*" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    <div class="sfButtonwrapper">
        <asp:ImageButton ID="imbSave" runat="server" ValidationGroup="SearchExtensionValidation"
            OnClick="imbSave_Click" meta:resourcekey="imbSaveResource1" />
        <asp:Label ID="lblSave" runat="server" Text="Save" AssociatedControlID="imbSave"
            Style="cursor: pointer;" meta:resourcekey="lblSaveResource1"></asp:Label>
        <asp:ImageButton ID="imbCancel" runat="server" OnClick="imbCancel_Click" meta:resourcekey="imbCancelResource1" />
        <asp:Label ID="lblCancel" runat="server" Text="Cancel" AssociatedControlID="imbCancel"
            Style="cursor: pointer;" meta:resourcekey="lblCancelResource1"></asp:Label>
    </div>
</div>
