﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditModuleDefinition.ascx.cs"
    Inherits="SageFrame.Modules.Admin.Extensions.Editors.EditModuleDefinition" %>
<%@ Register Src="PackageDetails.ascx" TagName="PackageDetails" TagPrefix="uc1" %>
<%@ Register Src="ModuleControlsDetails.ascx" TagName="ModuleControlsDetails" TagPrefix="uc2" %>
<div>
    <asp:Panel ID="pnlNewModuleSettings" runat="server" meta:resourcekey="pnlNewModuleSettingsResource1">
        <div class="sfCollapsewrapper sfFormwrapper sfModuleMgmt">
            <asp:UpdatePanel ID="udpModuleSettings" runat="server">
                <ContentTemplate>
                    <div id="divModuleSettings" runat="server" class="sfCollapsecontent">
                        <div>
                            <h3>Module Settings</h3>
                            <p class="sfNote">
                                <asp:Label ID="lblModuleSettingsHelp" runat="server" Text="In this section, you can set up more advanced settings for Module Controls on this Module." meta:resourcekey="lblModuleSettingsHelpResource1"></asp:Label>
                            </p>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="20%">
                                        <asp:Label ID="lblCreate" runat="server" Text="Create Module From" CssClass="sfFormlabel" meta:resourcekey="lblCreateResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCreate" runat="server" CssClass="sfListmenu" meta:resourcekey="ddlCreateResource1">
                                            <asp:ListItem Value="Control" Text="Control" meta:resourcekey="ListItemResource1" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblOwnerFolder" runat="server" Text="Owner Folder" CssClass="sfFormlabel" meta:resourcekey="lblOwnerFolderResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlOwner" runat="server" CssClass="sfListmenu" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlOwner_SelectedIndexChanged" meta:resourcekey="ddlOwnerResource1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblModuleFolder" runat="server" Text="Module Folder" CssClass="sfFormlabel" meta:resourcekey="lblModuleFolderResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlModule" runat="server" CssClass="sfListmenu" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlModule_SelectedIndexChanged" meta:resourcekey="ddlModuleResource1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFiles" runat="server" Text="Source" CssClass="sfFormlabel" meta:resourcekey="lblFilesResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlFiles" runat="server" CssClass="sfListmenu" meta:resourcekey="ddlFilesResource1" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="divPackageSettingsHolder" runat="server">
                <uc1:PackageDetails ID="PackageDetails1" runat="server" />
            </div>
            <div id="divmoduleControlSettingsHolder" runat="server">
                <uc2:ModuleControlsDetails ID="ModuleControlsDetails1" runat="server" />
            </div>
        </div>
        <div class="sfButtonwrapper">
            <asp:LinkButton ID="imbCreate" runat="server" OnClick="imbCreate_Click" CssClass="icon-save sfBtn"
                ValidationGroup="vdgExtension" Text="Save Module" meta:resourcekey="imbCreateResource1" />
            <asp:LinkButton ID="imbBack" runat="server" CausesValidation="False" CssClass="icon-close sfBtn"
                Text="Cancel" OnClick="imbBack_Click" meta:resourcekey="imbBackResource1" />
        </div>
    </asp:Panel>
</div>
