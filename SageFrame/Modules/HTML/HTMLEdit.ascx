﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HTMLEdit.ascx.cs" Inherits="SageFrame.Modules.HTML.HTMLEdit" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<div class="cssClassHTMLModule">
    <asp:UpdatePanel ID="udpSage" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdfHTMLTextID" runat="server" />
            <asp:HiddenField ID="hdnUserModuleID" runat="server" Value="0" />
            <asp:HiddenField ID="hdfIsActive" runat="server" />
            <div id="divViewWrapper" runat="server" class="cssClassViewWrraper">
                <div class="cssClassTopSetting" id="divEditContent" runat="server">
                </div>
                <asp:Literal ID="ltrContent" EnableViewState="False" runat="server" meta:resourcekey="ltrContentResource1"></asp:Literal>
            </div>
            <div id="divEditWrapper" runat="server" class="cssClassEditWrapper">
                <div class="sfFormwrapper">
                    <table cellspacing="0" cellpadding="0" border="0" width="95%" class="editorborder">
                        <tr>
                            <td>
                                <div class="cssClassHtmlViewBorder">
                                    <table cellspacing="0" cellpadding="0" border="0" id="tblTextEditor" width="100%" runat="server" class="cssClassHtmlViewTable">

                                        <tr runat="server">
                                            <td class="editorheading" runat="server">
                                                <asp:Label ID="Label1" runat="server" CssClass="sfFormlabel" Text="Country:" />
                                                &nbsp;<asp:DropDownList
                                                    ID="ddlLanuage" runat="server" DataTextField="LanguageName" AutoPostBack="True"
                                                    DataValueField="LanguageCode"
                                                    OnSelectedIndexChanged="ddlLanuage_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td class="editorheading" runat="server">
                                                <asp:Label ID="lblView" runat="server" CssClass="sfFormlabel" Text="Editor:" />
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server">
                                                <CKEditor:CKEditorControl ID="txtBody" runat="server" Width=""></CKEditor:CKEditorControl>
                                                <asp:Label ID="lblError" runat="server" CssClass="sfError" Visible="False"
                                                    EnableViewState="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="sfButtonwrapper" style="display: none">
                                    <asp:Button ID="btnCustomizeEditor" runat="server" CausesValidation="False" CssClass="cssClassButtonEditor"
                                        Text="Customize Editor" OnClick="btnCustomizeEditor_Click" meta:resourcekey="btnCustomizeEditorResource1" />
                                    <asp:Button ID="btnDefault" runat="server" CausesValidation="False" CssClass="cssClassButtonEditor"
                                        Text="Default Editor" OnClick="btnDefault_Click" Visible="False" meta:resourcekey="btnDefaultResource1" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPublish" runat="server" CssClass="sfFormlabel" Style="display: none" Text="Publish" meta:resourcekey="lblPublishResource1" />
                                <asp:CheckBox ID="chkPublish" runat="server" Checked="True" Style="display: none" CssClass="sfCheckbox" meta:resourcekey="chkPublishResource1" />
                                <asp:Label ID="lblAllowComment" Style="display: none" runat="server" CssClass="sfFormlabel" Text="Allow Comment" meta:resourcekey="lblAllowCommentResource1" />
                                <asp:CheckBox ID="chkAllowComment" Style="display: none" runat="server" CssClass="sfCheckbox" meta:resourcekey="chkAllowCommentResource1" />
                            </td>
                        </tr>
                    </table>
                    <div class="sfButtonwrapper">
                        <label class="sfLocale icon-save sfBtn">
                            Save
                    <asp:Button ID="imbSave" runat="server" OnClick="imbSave_Click"
                        ValidationGroup="body" Height="16px" meta:resourcekey="imbSaveResource1" /></label>
                        </asp:Label>
                    </div>
                </div>
            </div>
            <div id="divAddComment" runat="server" style="display: none" class="cssClassCommentWrapper">
                <div class="cssClassAddComment cssClassTopSetting">
                    <asp:ImageButton ID="imbAddComment" runat="server" OnClick="imbAddComment_Click" meta:resourcekey="imbAddCommentResource1" />
                    <asp:Label ID="lblAddComment" runat="server" Text="Add Comment" AssociatedControlID="imbAddComment" CssClass="cssClassHtmlViewCursor" meta:resourcekey="lblAddCommentResource1"></asp:Label>
                </div>
            </div>
            <div id="divViewComment" style="display: none" runat="server" class="cssClassCommentWrapper">
                <div class="cssClassGridWrapper">
                    <div class="cssClassHtmlViewComentTable">
                        <asp:GridView ID="gdvHTMLList" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
                            AllowPaging="True" PageSize="15" OnPageIndexChanging="gdvList_PageIndexChanging"
                            OnRowCommand="gdvList_RowCommand" OnRowDataBound="gdvList_RowDataBound" OnRowDeleting="gdvList_RowDeleting"
                            OnRowEditing="gdvList_RowEditing" OnRowUpdating="gdvList_RowUpdating" OnSelectedIndexChanged="gdvHTMLList_SelectedIndexChanged" meta:resourcekey="gdvHTMLListResource1">
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblCommentCount" runat="server" meta:resourcekey="lblCommentCountResource1"></asp:Label>
                                        <asp:Label ID="lblCommentTitle" runat="server" Text="Comment(s)" meta:resourcekey="lblCommentTitleResource1"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="cssClassCommentBy">
                                            <asp:Label ID="lblAddedBy" runat="server" Text='<%# Eval("AddedBy") + " on " + Eval("AddedOn") + " Says:" %>' meta:resourcekey="lblAddedByResource1" />
                                        </div>
                                        <div class="cssClassComment">
                                            <asp:Literal ID="ltrComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Literal>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("HTMLCommentID") %>'
                                            CommandName="Edit" ImageUrl='<%# GetTemplateImageUrl("imgedit.png", true) %>'
                                            ToolTip="Edit" CssClass="cssClassColumnEdit" meta:resourcekey="imgEditResource1" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("HTMLCommentID") %>'
                                            CommandName="Delete" ImageUrl='<%# GetTemplateImageUrl("imgdelete.png", true) %>'
                                            ToolTip="Delete" CssClass="cssClassColumnDelete" meta:resourcekey="imgDeleteResource1" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="cssClassHeadingOne" />
                            <RowStyle CssClass="cssClassAlternativeOdd" VerticalAlign="Top" />
                            <AlternatingRowStyle CssClass="cssClassAlternativeEven" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div id="divEditComment" style="display: none" runat="server" class="cssClassEditCommentWrapper">
                <div class="sfFormwrapper">
                    <table id="tblEditComment" runat="server" cellpadding="0" cellspacing="0" border="0" class="cssClassHtmlViewTable">
                        <tr runat="server">
                            <td runat="server">
                                <asp:Label ID="lblComment" runat="server" CssClass="sfFormlabel" Text="Comment"></asp:Label>
                            </td>
                            <td runat="server">
                                <asp:TextBox ID="txtComment" CssClass="CssClassNormalTextBoxHtml" runat="server" TextMode="MultiLine"
                                    Rows="6" ValidationGroup="ValidateComment"></asp:TextBox>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server"></td>
                            <td runat="server">
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="sfError" EnableViewState="False"></asp:Label>
                            </td>
                        </tr>
                        <tr id="rowApprove" runat="server">
                            <td runat="server">
                                <asp:Label ID="lblApprove" runat="server" CssClass="sfFormlabel" Text="Approve"></asp:Label>
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="chkApprove" runat="server" CssClass="sfCheckbox"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr id="rowIsActive" runat="server">
                            <td runat="server">
                                <asp:Label ID="lblIsActive" runat="server" CssClass="sfFormlabel" Text="IsActive" />
                            </td>
                            <td runat="server">
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="sfCheckbox"></asp:CheckBox>
                            </td>
                        </tr>
                    </table>
                    <div class="sfButtonwrapper" style="display: none">
                        <asp:ImageButton ID="imbAdd" runat="server" OnClick="imbAdd_Click" ValidationGroup="ValidateComment" meta:resourcekey="imbAddResource1" />
                        <asp:Label ID="lblAdd" runat="server" Text="Add" AssociatedControlID="imbAdd" CssClass="cssClassHtmlViewCursor" meta:resourcekey="lblAddResource1"></asp:Label>
                        <asp:ImageButton ID="imbBack" runat="server" OnClick="imbBack_Click" meta:resourcekey="imbBackResource1" />
                        <asp:Label ID="lblBack" runat="server" Text="Cancel" AssociatedControlID="imbBack" CssClass="cssClassHtmlViewCursor" meta:resourcekey="lblBackResource1"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
