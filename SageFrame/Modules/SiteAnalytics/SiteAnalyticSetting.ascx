<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SiteAnalyticSetting.ascx.cs"
    Inherits="Modules_DashBoardControl_DashBoardControlSetting" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div id="sfFormwrapper">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" CssClass="sfFormlabel" meta:resourcekey="lblStartDateResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="sfInputbox" meta:resourcekey="txtStartDateResource1"></asp:TextBox>
                <cc1:CalendarExtender ID="ccStartDate" runat="server" TargetControlID="txtStartDate" Enabled="True">
                </cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                    ErrorMessage="*" ToolTip="Field is required" ValidationGroup="rfvS" meta:resourcekey="rfvStartDateResource1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvStartDate" runat="server" ControlToValidate="txtStartDate"
                    ErrorMessage="Must Be Valid Date" Operator="DataTypeCheck" SetFocusOnError="True"
                    Type="Date" ValidationGroup="rfvS" meta:resourcekey="cvStartDateResource1"></asp:CompareValidator>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEndDate" runat="server" Text="End Date" CssClass="sfFormlabel" meta:resourcekey="lblEndDateResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="sfInputbox" meta:resourcekey="txtEndDateResource1"></asp:TextBox>
                <cc1:CalendarExtender ID="ccEndDate" runat="server" TargetControlID="txtEndDate" Enabled="True">
                </cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                    ErrorMessage="*" ToolTip="Field is required" ValidationGroup="rfvS" meta:resourcekey="rfvEndDateResource1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvEndDate" runat="server" ControlToValidate="txtEndDate"
                    ErrorMessage="Must Be Valid Date" Operator="DataTypeCheck" SetFocusOnError="True"
                    Type="Date" ValidationGroup="rfvS" meta:resourcekey="cvEndDateResource1"></asp:CompareValidator>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="rfvS"
                    CssClass="sfBtn" meta:resourcekey="btnSaveResource1" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
