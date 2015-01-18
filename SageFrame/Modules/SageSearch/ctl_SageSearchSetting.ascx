<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctl_SageSearchSetting.ascx.cs"
    Inherits="Modules_SageSearch_ctl_SageSearchSetting" %>
<div class="sfFormwrapper">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="20%">
                <asp:Label ID="lblSearchButtonType" runat="server" Text="Button Type:" CssClass="sfFormlabel"
                    ToolTip="Choose one of them Button, or Image or Link" meta:resourcekey="lblSearchButtonTypeResource1"></asp:Label>
            </td>
            <td class="cssClassRadioBtnWrapper">
                <asp:RadioButtonList ID="rdblSearchButtonType" ToolTip="Choose one of them Button, or Image or Link" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                    CssClass="cssClassRadioBtn" meta:resourcekey="rdblSearchButtonTypeResource1">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSearchButtonText" runat="server" Text="Button Text:" CssClass="sfFormlabel"
                    ToolTip="like Search/Go/..." meta:resourcekey="lblSearchButtonTextResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSearchButtonText" MaxLength="20" ToolTip="like Search/Go/..."
                    runat="server" CssClass="sfInputbox" meta:resourcekey="txtSearchButtonTextResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSearchButtonImage" runat="server" Text="Button Image:" CssClass="sfFormlabel"
                    ToolTip="like imbSearch.png <br/> Before Setting the image name you must be sure that the image is in your template of adjusted size. This image will play role when you set the button type is Image" meta:resourcekey="lblSearchButtonImageResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSearchButtonImage" ToolTip="like imbSearch.png <br/> Before Setting the image name you must be sure that the image is in your template of adjusted size. This image will play role when you set the button type is Image"
                    runat="server" CssClass="sfInputbox" meta:resourcekey="txtSearchButtonImageResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSearchResultPageName" runat="server" Text="Result Page Name:" CssClass="sfFormlabel"
                    ToolTip="Note You shure that this page is exists on your portal and Serch result module is placed on the page." meta:resourcekey="lblSearchResultPageNameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSearchResultPageName" ToolTip="Note You shure that this page is exists on your portal and Serch result module is placed on the page."
                    runat="server" CssClass="sfInputbox" meta:resourcekey="txtSearchResultPageNameResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSearchResultPerPage" runat="server" Text="Result Per Page:" CssClass="sfFormlabel"
                    ToolTip="10/20/30 etc" meta:resourcekey="lblSearchResultPerPageResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSearchResultPerPage" ToolTip="10/20/30 etc" runat="server" CssClass="sfInputbox"
                    MaxLength="5" meta:resourcekey="txtSearchResultPerPageResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMaxSearchChracterAllowedWithSpace" runat="server" Text="Number of Character allowed:"
                    CssClass="sfFormlabel" ToolTip="Like 50/100/200 or its upto you the default value is 200<br/>Note Count include with space." meta:resourcekey="lblMaxSearchChracterAllowedWithSpaceResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMaxSearchChracterAllowedWithSpace" ToolTip="Like 50/100/200 or its upto you the default value is 200<br/>Note Count include with space."
                    runat="server" CssClass="sfInputbox" MaxLength="10" meta:resourcekey="txtMaxSearchChracterAllowedWithSpaceResource1"></asp:TextBox>
            </td>
        </tr>
        <tr runat="server" visible="false">
            <td>
                <asp:Label ID="lblMaxResultCharacter" runat="server" Text="Number of Result Character allowed:"
                    CssClass="sfFormlabel" ToolTip="Note Count include with space." meta:resourcekey="lblMaxResultCharacterResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMaxResultCharacter" ToolTip="Note Count include with space."
                    runat="server" CssClass="sfInputbox" MaxLength="10" meta:resourcekey="txtMaxResultCharacterResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
<div class="sfButtonwrapper">
    <label class="sfLocale icon-save sfBtn">
        Save
        <asp:Button ID="imbSave" runat="server" OnClick="imbSave_Click" meta:resourcekey="imbSaveResource1" /></label>
    <%-- <asp:Label ID="lblSave" runat="server" Text="Save" AssociatedControlID="imbSave"
        Style="cursor: pointer;"></asp:Label>--%>
    <label class="sfLocale icon-close sfBtn">
        Cancel
        <asp:Button ID="imbCancel" runat="server" OnClick="imbCancel_Click" meta:resourcekey="imbCancelResource1" /></label>
    
</div>
