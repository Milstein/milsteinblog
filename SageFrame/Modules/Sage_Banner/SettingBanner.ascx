<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SettingBanner.ascx.cs"
    Inherits="Modules_Sage_Banner_SettingBanner" %>
<div id="divBannerSetting" runat="server" class="sfFormwrapper">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="25%">
                <asp:Label ID="lblBannerToUse" runat="server" CssClass="sfFormlabel" Text="Bannner Use" meta:resourcekey="lblBannerToUseResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                
                <asp:DropDownList ID="ddlBannerListToUse" runat="server" CssClass="sfListmenu" meta:resourcekey="ddlBannerListToUseResource1">
                </asp:DropDownList> 
                <label class="icon-refresh">              
                <asp:Button runat="server" ID="btnRefreshList" OnClick=" btnRefreshList_Click" meta:resourcekey="btnRefreshListResource1" /></label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMode" runat="server" CssClass="sfFormlabel" Text="Transition Mode" meta:resourcekey="lblModeResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:DropDownList ID="ddlTransitionMode" runat="server" CssClass="sfListmenu" meta:resourcekey="ddlTransitionModeResource1">
                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">horizontal</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource2"> fade</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblInfiniteLoop" runat="server" CssClass="sfFormlabel" Text="Infinite loop" meta:resourcekey="lblInfiniteLoopResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:CheckBox ID="chkInfiniteLoop" runat="server" meta:resourcekey="chkInfiniteLoopResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSpeed" runat="server" CssClass="sfFormlabel" Text="Speed(in ms)" meta:resourcekey="lblSpeedResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:TextBox ID="txtSpeed" runat="server" CssClass="sfInputbox" meta:resourcekey="txtSpeedResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtSpeed" runat="server" ControlToValidate="txtSpeed"
                    SetFocusOnError="True" ValidationGroup="bannersetting" ErrorMessage="*" CssClass="cssClasssNormalRed"
                    Display="Dynamic" meta:resourcekey="rfvtxtSpeedResource1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revtxtSpeed" runat="server" ControlToValidate="txtSpeed"
                    ErrorMessage="*" ValidationExpression="^\d+$" meta:resourcekey="revtxtSpeedResource1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPager" runat="server" CssClass="sfFormlabel" Text="PagerType" meta:resourcekey="lblPagerResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:Label ID="lblNumeric" runat="server" CssClass="sfFormlabel" Text="Numeric" meta:resourcekey="lblNumericResource1"></asp:Label>
                <asp:CheckBox ID="chkNumeric" runat="server" meta:resourcekey="chkNumericResource1" />
            </td>
        </tr>
        <tr id="tdAutoslide" runat="server">
            <td>
                <asp:Label ID="lblAuto" runat="server" CssClass="sfFormlabel" Text="Auto Slide" meta:resourcekey="lblAutoResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:CheckBox ID="chkAutoSlide" runat="server" meta:resourcekey="chkAutoSlideResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPause" runat="server" CssClass="sfFormlabel" Text="Pause Time(in ms)" meta:resourcekey="lblPauseResource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:TextBox ID="txtPauseTime" runat="server" Text="0" CssClass="sfInputbox" meta:resourcekey="txtPauseTimeResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtPauseTime" runat="server" ControlToValidate="txtPauseTime"
                    SetFocusOnError="True" ValidationGroup="bannersetting" ErrorMessage="*" CssClass="cssClasssNormalRed"
                    Display="Dynamic" meta:resourcekey="rfvtxtPauseTimeResource1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPauseTime"
                ErrorMessage="*"  ValidationExpression="^\d+$" ValidationGroup="bannersetting" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="sfFormlabel" Text="Enable Next/Prev Button" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td width="30">
                :
            </td>
            <td>
                <asp:CheckBox ID="chkEnableControl" runat="server" meta:resourcekey="chkEnableControlResource1" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
                <div class="sfButtonwrapper" runat="server">
                 <label class="sfLocale icon-save sfBtn">Save
                    <asp:Button ID="imbSaveBannerSetting" runat="server" ValidationGroup="bannersetting"
                        OnClick="imbSaveBannerSetting_Click" meta:resourcekey="imbSaveBannerSettingResource1" /></label>
                    
                </div>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSettingMessage" runat="server" CssClass="sfFormlabel" meta:resourcekey="lblSettingMessageResource1"></asp:Label>
</div>
