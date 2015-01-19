<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctl_MessageTemplateManagement.ascx.cs"
    Inherits="SageFrame.Modules.Admin.MessageManagement.ctl_MessageTemplateManagement" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<h1>
    <asp:Label ID="lblMessageTemplateManagement" runat="server" Text="Message Template Management" meta:resourcekey="lblMessageTemplateManagementResource1"></asp:Label></h1>
<asp:Panel ID="pnlMessageTemplate" runat="server" meta:resourcekey="pnlMessageTemplateResource1">
    <div class="sfFormwrapper">
        <h2 class="sfFormHeading">
            <asp:Label ID="lblAddEditMessageTemplate" runat="server" Text="Add/Edit Message Template" meta:resourcekey="lblAddEditMessageTemplateResource1"></asp:Label></h2>
        <asp:HiddenField ID="hdnMessageTemplateID" runat="server" Value="0" />
        <table cellspacing="0" cellpadding="0" border="0" class="sfMessageTable">
            <tr>
                <td>
                    <asp:Label ID="lblMessageTemplateType1" runat="server" CssClass="sfFormLabel" Text="Message Template Type" meta:resourcekey="lblMessageTemplateType1Resource1"></asp:Label>
                </td>
                <td width="5%">
                    :
                </td>
                <td>
                    <asp:DropDownList ID="ddlMessageTemplateType" ToolTip="Select Message Template Type"
                        runat="server" OnSelectedIndexChanged="ddlMessageTemplateType_SelectedIndexChanged"
                        AutoPostBack="True" CssClass="sfListmenu" meta:resourcekey="ddlMessageTemplateTypeResource1">
                    </asp:DropDownList>
                    <asp:HyperLink ID="hypAddMessageTemplateType" runat="server" meta:resourcekey="hypAddMessageTemplateTypeResource1" />
                    <asp:Label ID="lblAddMessageTemplateType" CssClass="icon-addnew sfBtn" runat="server"
                        Text="Add Message Template Type" AssociatedControlID="hypAddMessageTemplateType" meta:resourcekey="lblAddMessageTemplateTypeResource1"></asp:Label>
                    <asp:HyperLink ID="hypAddMessageTemplateToken" runat="server" meta:resourcekey="hypAddMessageTemplateTokenResource1" />
                    <asp:Label ID="lblAddMessageTemplateToken" runat="server" CssClass="icon-addnew sfBtn"
                        Text="Add Message Template Token" AssociatedControlID="hypAddMessageTemplateToken" meta:resourcekey="lblAddMessageTemplateTokenResource1"></asp:Label>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFromEmail" runat="server" CssClass="sfFormLabel" Text="From Email" meta:resourcekey="lblFromEmailResource1"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtMailFrom" runat="server" ToolTip="From Email Address" ValidationGroup="vdgMessageTemplate"
                        CssClass="sfNormalTextBox" meta:resourcekey="txtMailFromResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMailFrom"
                        ErrorMessage="*" ValidationGroup="vdgMessageTemplate" CssClass="sfError" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMailFrom"
                        SetFocusOnError="True" ErrorMessage="Invalid Email Address" ValidationGroup="vdgMessageTemplate"
                        Text="Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        CssClass="sfError" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSubject" runat="server" CssClass="sfFormLabel" Text="Subject" meta:resourcekey="lblSubjectResource1"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <div style="float: left;">
                        <asp:TextBox ID="txtSubject" runat="server" ToolTip="Message template subject" ValidationGroup="vdgMessageTemplate"
                            CssClass="sfNormalTextBox" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSubject"
                            SetFocusOnError="True" ErrorMessage="*" ValidationGroup="vdgMessageTemplate"
                            CssClass="sfsNormalRed" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator></div>
                    <div class="sfFormLinkButton">
                        <asp:HyperLink ID="lnkAddSubjectMessageToken" runat="server" meta:resourcekey="lnkAddSubjectMessageTokenResource1" />
                        <asp:Label ID="lblAddSubjectMessageToken" runat="server" CssClass="icon-addnew sfBtn"
                            Text="Add Subject Token" AssociatedControlID="lnkAddSubjectMessageToken" meta:resourcekey="lblAddSubjectMessageTokenResource1"></asp:Label></div>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server" CssClass="sfFormLabel" Text="Message" meta:resourcekey="lblMessageResource1"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <div class="sfFormLinkButton">
                        <asp:HyperLink ID="lnkAddBodyMessageToken" runat="server" meta:resourcekey="lnkAddBodyMessageTokenResource1" />
                        <asp:Label ID="lblAddBodyMessageToken" Text="Add Body Message Token" runat="server"
                            AssociatedControlID="lnkAddBodyMessageToken" CssClass="icon-addnew sfBtn" meta:resourcekey="lblAddBodyMessageTokenResource1"></asp:Label>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                    <div class="sfCkeditor sfCurve">
                        <table cellspacing="0" cellpadding="0" border="0" id="tblTextEditor" runat="server"
                            width="100%">
                            <tr runat="server">
                                <td id="Td1" class="editorheading" style="background-color: #ebcd5f;" runat="server">
                                    <asp:Label ID="lblEditorTitle" runat="server" CssClass="sfFormLabel" Text="Editor:" />
                                </td>
                            </tr>
                            <tr runat="server">
                                <td id="tdTextEditor" runat="server">
                                    <asp:Panel ID="pnlBasicTextBox" runat="server">
                                        <div id="divEdit" runat="server">
                                            <FCKeditorV2:FCKeditor ID="txtBody" runat="server" Height="450px" ToolbarSet="SageFrameLimited"
                                                Width="100%">
                                            </FCKeditorV2:FCKeditor>
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="sfButtonwrapper">
                        <label id="lblCustomizeEditor" runat="server" class="sfLocale icon-customize sfBtn">
                            Customized Editor
                            <asp:Button ID="btnCustomizeEditor" runat="server" CausesValidation="False"
                                OnClick="btnCustomizeEditor_Click" meta:resourcekey="btnCustomizeEditorResource1" /></label>
                        <label id="lblDefault" runat="server" class="sfLocale icon-customize sfBtn" visible="False">
                            Default Editor
                            <asp:Button ID="btnDefault" runat="server" CausesValidation="False" OnClick="btnDefault_Click"
                                Visible="False" meta:resourcekey="btnDefaultResource1" />
                        </label>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIsActive" runat="server" CssClass="sfFormLabel" Text="Active" meta:resourcekey="lblIsActiveResource1"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:CheckBox ID="chkIsActive" runat="server" CssClass="cssClassCheckBox" meta:resourcekey="chkIsActiveResource1" />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div class="sfButtonwrapper">
        <label class="sfLocale icon-save sfBtn">
            Save
            <asp:Button ID="imbSave" runat="server" OnClick="imbSave_Click" ToolTip="Click to save"
                ValidationGroup="vdgMessageTemplate" meta:resourcekey="imbSaveResource1" />
        </label>
        <label class="sfLocale icon-close sfBtn">
            Cancel
            <asp:Button ID="imbCancel" runat="server" OnClick="imbCancel_Click" ToolTip="Click to cancel"
                CausesValidation="False" meta:resourcekey="imbCancelResource1" /></label>
    </div>
</asp:Panel>
<asp:Panel ID="pnlMessageTemplateList" runat="server" meta:resourcekey="pnlMessageTemplateListResource1">
    <div class="sfButtonwrapper">
        <label class="sfLocale icon-addnew sfBtn">
            Add New Message Template
            <asp:Button ID="imbAddNew" runat="server" OnClick="imbAddNew_Click" ToolTip="Click to add message template" meta:resourcekey="imbAddNewResource1" />
        </label>
    </div>
    <div class="sfGridwrapper">
        <asp:GridView ID="grdList" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record to Show..."
            GridLines="None" AllowPaging="True" PageSize="15" BorderColor="White" BorderWidth="0px"
            OnPageIndexChanging="grdList_PageIndexChanging" OnRowCommand="grdList_RowCommand"
            OnRowDataBound="grdList_RowDataBound" OnRowDeleting="grdList_RowDeleting" OnRowEditing="grdList_RowEditing"
            OnRowUpdating="grdList_RowUpdating" Width="100%" meta:resourcekey="grdListResource1">
            <AlternatingRowStyle CssClass="cssClassAlternativeEven" />
            <Columns>
                <asp:TemplateField HeaderText="Message Template Subject" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("MessageTemplateID") %>' CommandName="Edit"><asp:Label runat="server" Text='<%# Eval("Subject") %>' ID="lblSubject" meta:resourcekey="lblSubjectResource2"></asp:Label>
</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="From Email" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label ID="lblFromEmail" runat="server" meta:resourcekey="lblFromEmailResource2" Text='<%# Eval("MailFrom") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:BoundField DataField="IsActive" HeaderText="Active" meta:resourcekey="BoundFieldResource1">
                <HeaderStyle CssClass="cssClassColumnIsActive" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Added On" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <%# Eval("AddedOn","{0:yyyy/MM/dd}") %>
                    </ItemTemplate>
                    <HeaderStyle CssClass="cssClassColumnAddedOn" HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Updated On" meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <%# Eval("UpdatedOn","{0:yyyy/MM/dd}") %>
                    </ItemTemplate>
                    <HeaderStyle CssClass="cssClassColumnUpdatedOn" HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                    <ItemTemplate>
                        <asp:LinkButton ID="imbEdit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("MessageTemplateID") %>' CommandName="Edit" CssClass="icon-edit" meta:resourcekey="imbEditResource1" ToolTip="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="cssClassColumnEdit" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="cssClassHeadingOne" />
            <PagerStyle CssClass="sfPagination" />
            <RowStyle CssClass="cssClassAlternativeOdd" />
        </asp:GridView>
    </div>
</asp:Panel>
<cc2:modalpopupextender runat="server" id="mpeAddMessageTokenModalPopup" targetcontrolid="hiddenTargetControlForAddMessageTokenModalPopup"
    popupcontrolid="pnlAddMessageTokenPopup" backgroundcssclass="ModalPopupBG" okcontrolid="btnAddMessageTokenOk"
    cancelcontrolid="btnAddMessageTokenCancel" popupdraghandlecontrolid="pnlAddMessageTokenHandle"
    repositionmode="RepositionOnWindowScroll" dynamicservicepath="" enabled="True">
</cc2:modalpopupextender>
<asp:Panel ID="pnlAddMessageTokenPopup" runat="server" Style="display: none;" meta:resourcekey="pnlAddMessageTokenPopupResource1">
    <div class="sfPopup">
        <div class="sfPopupinner">
            <asp:Panel ID="pnlAddMessageTokenHandle" runat="server" CssClass="cssClassPopTitle" meta:resourcekey="pnlAddMessageTokenHandleResource1">
                Select message token</asp:Panel>
            <div class="sfPopupclose" id="btnAddMessageTokenCancel" runat="server">
            </div>
            <asp:Panel ID="pnlPopupBody" runat="server" meta:resourcekey="pnlPopupBodyResource1">
                <asp:ListBox ID="lstMessageToken" runat="server" Rows="10" CssClass="cssClassPopUpMessage" meta:resourcekey="lstMessageTokenResource1">
                </asp:ListBox>
            </asp:Panel>
            <div class="sfButtonwrapper">
                <input type="button" id="btnAddMessageTokenOk" runat="server" value="Add" class="sfBtn" />
            &nbsp;&nbsp;</div>
        </div>
    </div>
</asp:Panel>
<asp:HiddenField runat="server" ID="hiddenTargetControlForAddMessageTokenModalPopup" />
<cc2:modalpopupextender backgroundcssclass="ModalPopupBG" id="mpeMessageTemplateType"
    okcontrolid="btnCancelMessageTemplateType" cancelcontrolid="btnCancelMessageTemplateType"
    targetcontrolid="btnopen" popupcontrolid="pnlMessageTemplateType" popupdraghandlecontrolid="pnlDragHandlerMessageTemplateType"
    repositionmode="RepositionOnWindowScroll" runat="server" dynamicservicepath=""
    enabled="True">
</cc2:modalpopupextender>
<asp:Panel ID="pnlMessageTemplateType" runat="server" Style="display: none" CssClass="sfPopup" meta:resourcekey="pnlMessageTemplateTypeResource1">
    <asp:Panel ID="pnlDragHandlerMessageTemplateType" runat="server" meta:resourcekey="pnlDragHandlerMessageTemplateTypeResource1">
        <asp:Label ID="lblAMTT" runat="server" Text="Add Message Template Type" CssClass="cssClassPopTitle" meta:resourcekey="lblAMTTResource1"></asp:Label>
    </asp:Panel>
    <div class="sfPopupclose" id="btnCancelMessageTemplateType" runat="server">
    </div>
    <div class="cssClassFormWrapper ">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblMessageTemplateType" runat="server" CssClass="cssClassFormLabel"
                        Text="Message Template Type" meta:resourcekey="lblMessageTemplateTypeResource1"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtMessageTemplateType" runat="server" EnableViewState="False" meta:resourcekey="txtMessageTemplateTypeResource1"></asp:TextBox>
                    <asp:Label ID="lblErrorMessageTemplateType" runat="server" CssClass="sfError" Text="*"
                        Visible="False" meta:resourcekey="lblErrorMessageTemplateTypeResource1"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvMessageTemplateType" runat="server" ControlToValidate="txtMessageTemplateType"
                        Display="Dynamic" ErrorMessage="Message Template Type Name Is Required" ValidationGroup="AddMsgTempType"
                        SetFocusOnError="True" meta:resourcekey="rfvMessageTemplateTypeResource1" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div class="cssClassButtonWrapper">
            <asp:Button ID="btnOkMessageTemplateType" runat="server" Text="Add" OnClick="btnOkMessageTemplateType_Click"
                ValidationGroup="AddMsgTempType" meta:resourcekey="btnOkMessageTemplateTypeResource1" />
        </div>
    </div>
</asp:Panel>
<cc2:modalpopupextender backgroundcssclass="ModalPopupBG" id="mpeMessageTemplateToken"
    okcontrolid="btnCancelMessageTemplateToken" cancelcontrolid="btnCancelMessageTemplateToken"
    targetcontrolid="btnopen" popupcontrolid="pnlMessageTemplateToken" popupdraghandlecontrolid="pnlDragHandlerMessageTemplateToken"
    repositionmode="RepositionOnWindowScroll" runat="server" dynamicservicepath=""
    enabled="True">
</cc2:modalpopupextender>
<asp:Panel ID="pnlMessageTemplateToken" runat="server" Style="display: none" CssClass="sfPopup" meta:resourcekey="pnlMessageTemplateTokenResource1">
    <asp:Panel ID="pnlDragHandlerMessageTemplateToken" runat="server" CssClass="cssClassPopTitle" meta:resourcekey="pnlDragHandlerMessageTemplateTokenResource1">
        <asp:Label ID="lblMessageTempToken" runat="server" Text="Add Message Template Token" meta:resourcekey="lblMessageTempTokenResource1"></asp:Label>
    </asp:Panel>
    <div class="sfPopupclose" id="btnCancelMessageTemplateToken" runat="server">
    </div>
    <div class="cssClassFormWrapper">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblMessageTemplateToken" runat="server" CssClass="cssClassFormLabel"
                        Text="Message Template Token" meta:resourcekey="lblMessageTemplateTokenResource1"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtMessageTemplateToken" runat="server" EnableViewState="False" meta:resourcekey="txtMessageTemplateTokenResource1"></asp:TextBox>
                    <asp:Label ID="lblErrorMessageTemplateToken" runat="server" CssClass="cssClassError"
                        Text="*" Visible="False" meta:resourcekey="lblErrorMessageTemplateTokenResource1"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvMessageTemplateToken" runat="server" ControlToValidate="txtMessageTemplateToken"
                        Display="Dynamic" ErrorMessage="Message Template Token Name Is Required" ValidationGroup="AddMsgTempToken"
                        SetFocusOnError="True" meta:resourcekey="rfvMessageTemplateTokenResource1" Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div class="cssClassButtonWrapper">
            <asp:Button ID="btnOkMessageTemplateToken" runat="server" Text="Add" OnClick="btnOkMessageTemplateToken_Click"
                ValidationGroup="AddMsgTempToken" meta:resourcekey="btnOkMessageTemplateTokenResource1" />
        </div>
    </div>
</asp:Panel>
<asp:HiddenField runat="server" ID="hdnAddMessageTemplateType" />
<asp:HiddenField runat="server" ID="hdnAddMessageTemplateToken" />
<asp:Button ID="btnopen" Style="display: none" runat="server" Text="Button" meta:resourcekey="btnopenResource1" />

<script type="text/javascript">
    function ClearTemplateText(textControlID, errLblID) {
        var textBox = $("#" + textControlID);
        if (textBox != null) {
            $(textBox).val('');
        }
        var errLbl = $("#" + errLblID);
        if (errLbl != null) {
            $(errLbl).val('*');
            $(errLbl).hide();
        }
    }   
</script>

