<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctl_Extensions.ascx.cs"
    Inherits="SageFrame.Modules.Admin.Extensions.ctl_Extensions" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script type="text/javascript">
    //<![CDATA[
    $(function () {
        $('#divModulesLists input:checkbox:first').on("change", function () {
            if ($(this).is(":checked")) {
                $('#divModulesLists input:checkbox:not(:disabled)').prop("checked", true);
            }
            else {
                $('#divModulesLists input:checkbox:not(:disabled)').prop("checked", false);
            }
        });
    });
    //]]>
</script>
<h1>Modules Management</h1>
<asp:PlaceHolder ID="ExtensionPlaceHolder" runat="server">
    <div class="sfButtonwrapper sfPadding sfHideImg">
        <asp:ImageButton ID="imbInstallModule" runat="server" CausesValidation="False" OnClick="imbInstallModule_Click" />
        <asp:Label Style="cursor: pointer;" ID="lblInstallModule" runat="server" Text="Install Module"
            CssClass="icon-install-module sfBtn" AssociatedControlID="imbInstallModule" />
        <asp:ImageButton ID="imbCreateNewModule" runat="server" OnClick="imbCreateNewModule_Click" />
        <asp:Label ID="lblCreateNewModule" runat="server" Text="Create New Module" AssociatedControlID="imbCreateNewModule"
            CssClass="icon-addnew sfBtn" />
        <asp:ImageButton ID="imbAvailableModules" Style="display: none" runat="server" OnClick="imbAvailableModules_Click" />
        <asp:Label Style="display: none" ID="lblAvailableModule" runat="server" Text="Available Module"
            CssClass="icon-addnew sfBtn" AssociatedControlID="imbAvailableModules" />
        <asp:ImageButton ID="imbCreatePackage" runat="server" OnClick="imbCreatePackage_Click" />
        <asp:Label Style="cursor: pointer;" ID="lblCreatePackage" runat="server" Text="Create Package"
            CssClass="icon-addnew sfBtn" AssociatedControlID="imbCreatePackage" />
        <asp:ImageButton ID="imbCreateCompositeModule" runat="server" OnClick="imbCreateCompositeModule_Click" />
        <asp:Label Style="cursor: pointer;" ID="lblCreateCompositeModule" runat="server"
            CssClass="icon-addnew sfBtn" Text="Create Composite Package" AssociatedControlID="imbCreateCompositeModule" />
        <asp:ImageButton ID="imbDownloadModules" runat="server" OnClick="imbDownloadModules_Click" />
        <asp:Label Style="cursor: pointer;" ID="lblDownloadModules" runat="server" CssClass="icon-download sfBtn"
            Text="Download Modules" AssociatedControlID="imbDownloadModules" />
    </div>
    <div class="sfFormwrapper sfPadding sfTableOption">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td width="100">
                    <asp:Label ID="lblSearchModule" runat="server" CssClass="sfFormlabel" Text="Search Module"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSearchText" runat="server" CssClass="sfInputbox text sfFloatLeft"></asp:TextBox>
                    <div class="sfHideImg sfFloatLeft">
                        <asp:ImageButton ID="imgSearch" runat="server" OnClick="imgSearch_Click" ToolTip="Search" />
                        <asp:Label ID="lblSearch" runat="server" Text="" AssociatedControlID="imgSearch"
                            CssClass="icon-search sfBtn"></asp:Label>
                    </div>
                </td>
                <td></td>
                <td></td>
                <td width="80" class="sfTxtAlignRgt">
                    <asp:Label ID="lblSRow" runat="server" Text="Show rows" CssClass="sfFormlabel"></asp:Label>
                </td>
                <td width="50">
                    <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged"
                        CssClass="sfListmenu sfAuto">
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="50">50</asp:ListItem>
                        <asp:ListItem Value="100">100</asp:ListItem>
                        <asp:ListItem Value="150">150</asp:ListItem>
                        <asp:ListItem Value="200">200</asp:ListItem>
                        <asp:ListItem Value="250">250</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="sfHideImg sfTxtAlignRgt" width="150">
                    <asp:ImageButton ID="imbBtnSaveChanges" runat="server" ToolTip="Save changes" OnClick="imbBtnSaveChanges_Click"
                        OnClientClick="return ConfirmDialog(this, 'Confirmation', 'Are you sure you want to save the changes?');" />
                    <asp:Label ID="lblSaveChanges" runat="server" Text="Save changes" AssociatedControlID="imbBtnSaveChanges"
                        CssClass="icon-save sfBtn" Style="cursor: pointer;"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="sfGridwrapper" id="divModulesLists">
        <asp:GridView ID="gdvExtensions" runat="server" DataKeyNames="ModuleID" AutoGenerateColumns="False"
            GridLines="None" class="sfNotfound" Width="100%" EmptyDataText="No Record to Show..."
            OnRowCommand="gdvExtensions_RowCommand" OnPageIndexChanging="gdvExtensions_PageIndexChanging"
            OnRowDataBound="gdvExtensions_RowDataBound" OnRowDeleting="gdvExtensions_RowDeleting"
            OnRowEditing="gdvExtensions_RowEditing" OnRowUpdating="gdvExtensions_RowUpdating"
            AllowPaging="true">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnModuleID" runat="server" Value='<%# Eval("ModuleID") %>' />
                        <asp:LinkButton ID="lnkName" runat="server" CommandArgument='<%# Eval("ModuleID") %>'
                            CommandName="Edit" Text='<%# Eval("FriendlyName") %>' CssClass="sfFormlabel"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfColName"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate>
                        <asp:Label ID="lblType" runat="server" Text='<%# Eval("PackageType") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfColType"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfColDescription"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" HeaderStyle-CssClass="sfColversion">
                    <ItemTemplate>
                        <asp:Label ID="lblVersion" runat="server" Text='<%# Eval("Version") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfColversion"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="In Use" HeaderStyle-CssClass="sfInuse">
                    <ItemTemplate>
                        <asp:Label ID="lblInUse" runat="server" Text='<%# ConvertToYesNo(Eval("InUse").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfInuse"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <input id="chkBoxIsActiveHeader" runat="server" class="cssCheckBoxIsActiveHeader"
                            type="checkbox" />
                        <asp:Label ID="lblIsActive" runat="server" Text="Active"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnIsActive" runat="server" Value='<%# Eval("IsActive") %>' />
                        <asp:HiddenField ID="hdnIsAdmin" runat="server" Value='<%# Eval("IsAdmin") %>' />
                        <input id="chkBoxIsActiveItem" runat="server" type="checkbox" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfIsactive" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%-- <asp:ImageButton ID="imbEdit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ModuleID") %>'
                         CssClass="sfEdit"   CommandName="Edit" ImageUrl='<%# GetTemplateImageUrl("imgedit.png", true) %>'
                            ToolTip="Edit Module"  />--%>
                        <asp:LinkButton ID="imbEdit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ModuleID") %>'
                            CssClass="icon-edit" CommandName="Edit" ToolTip="Edit Module" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfDelete"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="imbDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ModuleID") %>'
                            CssClass="icon-delete" CommandName="Delete" ImageUrl='<%# GetTemplateImageUrl("imgdelete.png", true) %>'
                            ToolTip="Delete Module" OnClientClick="return ConfirmDialog(this, 'Confirmation', 'Are you sure you want to delete this extension?');" />
                    </ItemTemplate>
                    <HeaderStyle CssClass="sfDelete"></HeaderStyle>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="sfPagination" />
            <RowStyle CssClass="sfOdd" />
            <AlternatingRowStyle CssClass="sfEven" />
        </asp:GridView>
    </div>
</asp:PlaceHolder>
