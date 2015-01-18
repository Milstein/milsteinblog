<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InstallWizard.aspx.cs" Inherits="Install_InstallWizard" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/install.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            var flag;
            var check = "";
            var ExistingDatabasename = "<%=txtExistingDatabaseName.ClientID%>";
            var NewDatabasename = "<%=txtNewDataBaseName.ClientID%>";
            var btnInstall = "<%=btnInstall.ClientID%>";
            var txtServer = "<%=txtServer.ClientID%>";
            var txtUserId = "<%=txtUserId.ClientID%>";
            var txtPassword = "<%=txtPassword.ClientID%>";
            var chkIntegrated = "<%=chkIntegrated.ClientID %>";
            var txtDataBase = "<%=txtDataBase.ClientID %>";
            var btnTestPermission = "<%=btnTestPermission.ClientID %>";

            $('#' + ExistingDatabasename).attr('disabled', 'disabled');

            check = document.cookie.split(';');
            flag = check[0];
            if (flag == "rdbExistingDatabase") {
                $('#rdbExistingDatabase').attr("checked", true);
                $('#rdbCreateDatabase').attr("checked", false);
                $('#' + NewDatabasename).attr('disabled', 'true').addClass("sfInactive");
                $('#' + NewDatabasename).val('');
                $('#' + ExistingDatabasename).attr('disabled', false).removeClass("sfInactive");

            } if (flag == "rdbCreateDatabase") {
                $('#rdbExistingDatabase').attr("checked", false);
                $('#rdbCreateDatabase').attr("checked", true);
                $('#' + ExistingDatabasename).attr("disabled", "disabled").addClass("sfInactive");
                $('#' + ExistingDatabasename).val('');
                $('#' + NewDatabasename).attr('disabled', false).removeClass("sfInactive");

            }


            $('#' + btnTestPermission).bind("click", function(e) {
                if ($('#rdbCreateDatabase').attr("checked")) {
                    document.cookie = $('#rdbCreateDatabase').attr("id");
                    check = document.cookie.split(';');
                    flag = check[0];
                } else {
                    document.cookie = $('#rdbExistingDatabase').attr("id");
                    check = document.cookie.split(';');
                    flag = check[0];
                }

            });


            $('#' + btnInstall).bind("click", function() {

                if ($('#' + chkIntegrated).attr('checked')) {

                    if ($('#' + txtServer).val() == "") {
                        $("#lblServerError").text("Please Enter a Server name");
                        return false;
                    }
                    if ($('#' + txtDataBase).val() == "") {
                        $("#lblDatabaseError").text("Please Enter a Database Name");
                        return false;
                    }
                }
                else {
                    var result = true;
                    result = CheckValidation();
                    return result;
                }

            });


            $('#rdbCreateDatabase').bind("click", function() {
                $('#' + ExistingDatabasename).attr("disabled", "disabled").addClass("sfInactive");
                $('#' + ExistingDatabasename).val('');
                $('#' + NewDatabasename).attr('disabled', false).removeClass("sfInactive");
                $('#lblExistingDatabaseError').html('');
                $('#lblNewDatabaseError').show();

            });
            $('#rdbExistingDatabase').bind("click", function() {
                $('#' + NewDatabasename).attr('disabled', 'true').addClass("sfInactive");
                $('#' + NewDatabasename).val('');
                $('#' + ExistingDatabasename).attr('disabled', false).removeClass("sfInactive");
                $('#lblNewDatabaseError').html('');
                $('#lblExistingDatabaseError').show();
            });

            $('#' + txtServer).keyup(function(e) {
                if ($(this).val().length > 0) {
                    $('#lblServerError').html('').hide();
                }
            });
            $('#' + txtDataBase).keyup(function(e) {
                if ($(this).val().length > 0) {
                    $('#lblDatabaseError').html('').hide();
                }
            });
            $('#' + txtUserId).keyup(function(e) {
                if ($(this).val().length > 0) {
                    $('#lblUserIdError').html('').hide();
                }
            });
            $('#' + txtPassword).keyup(function(e) {
                if ($(this).val().length > 0) {
                    $('#lblPasswordError').html('').hide();
                }
            });
            $('#' + ExistingDatabasename).keyup(function(e) {
                if ($(this).val().length > 0) {
                    $('#lblExistingDatabaseError').html('').hide();
                }
            });
            $('#' + NewDatabasename).keyup(function(e) {
                if ($(this).val().length > 0) {
                    $('#lblNewDatabaseError').html('').hide();
                }
            });
            function CheckValidation() {
                if ($('#' + txtServer).val() == "") {
                    $("#lblServerError").text("Please Enter a Server name");
                    return false;
                }
                if ($('#' + txtUserId).val() == "") {

                    $("#lblUserIdError").text("Please Enter a UserId");
                    return false;
                }
                if ($('#' + txtPassword).val() == "") {

                    $("#lblPasswordError").text("Please Enter a Password");
                    return false;
                }
                if ($('#rdbExistingDatabase').prop("checked") && $('#' + ExistingDatabasename).val().trim().length == 0) {
                    $("#lblExistingDatabaseError").text("Please Enter a Exesting Database Name");
                    return false;
                }
                if ($('#rdbCreateDatabase').prop("checked") && $('#' + NewDatabasename).val().trim().length == 0) {
                    $("#lblNewDatabaseError").text("Please Enter a New Database Name");
                    return false;
                }

            }
            $('#divTemplateList input:radio').prop("checked", false);
            $('#divTemplateList input:radio:first').prop("checked", true);
            $('#divTemplateList input:radio').on("change", function() {
                ////                if ($(this).attr("checked")) {
                ////                    $('#divTemplateList input:radio').not($(this)).attr("checked", false);
                ////                }
                ////                else {
                // $(this).prop("checked", true);
                $('#divTemplateList input:radio').not($(this)).attr("checked", false);
                //}
            });

        });
        function eraseCookie(name) {
            createCookie(name, "", -1);
        }

    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/SageFrameWebService.asmx" />
        </Services>
    </asp:ScriptManager>
    <div id="sfInstallWrapper" class="clearfix">
        <div class="sfLogo">
            <h1>
                <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1" />
            </h1>
            <div class="sfVersion">
                <asp:Label ID="lblVersion" runat="server" meta:resourcekey="lblVersionResource1" />
            </div>
        </div>
        <div id="divHelp" class="sfHelp">
            <a href="~/Help.htm" class="icon-help" runat="server" data-title="Help" target="_blank"></a>
        </div>
        <div class="sfOuter sfCurve">
            <div class="sfInner sfCurve">
                <asp:Label ID="lblInstallError" runat="server" Visible="False" meta:resourcekey="lblInstallErrorResource1" />
                <asp:HiddenField ID="hdnConnectionStringForAll" runat="server" />
                <asp:HiddenField ID="hdnNextButtonClientID" runat="server" Value="0" />
                <asp:Label ID="lblPermissionsError" runat="server" CssClass="cssClasssNormalRed"
                    EnableViewState="False" Visible="False" meta:resourcekey="lblPermissionsErrorResource1" />
                <asp:Label ID="lblDataBaseError" runat="server" CssClass="cssClasssNormalRed" EnableViewState="False" meta:resourcekey="lblDataBaseErrorResource1" />
                <asp:Label ID="lblRequiredDatabaseName" runat="server" CssClass="cssClasssNormalRed"
                    EnableViewState="False" meta:resourcekey="lblRequiredDatabaseNameResource1" />
                <asp:Panel ID="pnlStartInstall" runat="server" meta:resourcekey="pnlStartInstallResource1">
                    <div class="sfInstallpart">
                        <div class="sfFormwrapper">
                            <p class="sfWelcomeText">
                                Welcome to the SageFrame Installation Wizard.
                            </p>
                            <h2>
                                Let's get started !</h2>
                            <table id="tblDatabase" runat="server" cellpadding="0" cellspacing="0" border="0"
                                width="100%" class="sfInstalllationTable">
                                <tr runat="server">
                                    <td colspan="3" runat="server">
                                        <h3>
                                            Database Credentials</h3>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td width="140px" runat="server">
                                        <asp:Label ID="lblServer" runat="server" CssClass="sfFormlabel" />
                                    </td>
                                    <td colspan="2" runat="server">
                                        <asp:TextBox ID="txtServer" runat="server" CssClass="sfInputbox" />
                                        <i class="icon-info" data-title="Enter the Name or IP Address of the computer where the Database is located.">
                                        </i>
                                        <label id="lblServerError" class="sfError">
                                        </label>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr class="sfTdseperator" runat="server">
                                    <td runat="server">
                                        <asp:Label ID="lblIntegrated" runat="server" CssClass="sfFormlabel" />
                                    </td>
                                    <td colspan="2" runat="server">
                                        <asp:CheckBox ID="chkIntegrated" runat="server" AutoPostBack="True" OnCheckedChanged="chkIntegrated_CheckedChanged"
                                            CssClass="sfCheckBox" />
                                        <asp:Label ID="lblIntegratedHelp" runat="server" CssClass="sfHelptext sfInline" />
                                    </td>
                                </tr>
                                <tr id="trDatabaseName" runat="server" visible="False" class="sfTdseperator">
                                    <td runat="server">
                                        <br />
                                        <span class="sfFormlabel">Database Name</span>
                                    </td>
                                    <td colspan="2" runat="server">
                                        <br />
                                        <asp:TextBox ID="txtDataBase" runat="server" CssClass="sfInputbox" />
                                        <i class="icon-info" data-title="Enter a database name"></i>
                                        <label id="Label1" class="sfError">
                                        </label>
                                    </td>
                                </tr>
                                <tr id="trUser" runat="server" class="sfTdseperator">
                                    <td runat="server">
                                    </td>
                                    <td colspan="2" class="sfCustomLabel" runat="server">
                                        <table cellpadding="0" cellspacing="0" width="100%" border="0" class="sfSubTable">
                                            <tr>
                                                <td width="75px;">
                                                    <asp:Label ID="lblUserID" runat="server" CssClass="sfFormlabel" />
                                                </td>
                                                <td width="215px;">
                                                    <asp:TextBox ID="txtUserId" runat="server" CssClass="sfInputbox" />
                                                    <label id="lblUserIdError" class="sfError">
                                                    </label>
                                                </td>
                                                <td>
                                                    <i class="icon-info" data-title="User ID to access the server"></i>
                                                </td>
                                            </tr>
                                            <tr id="trPassword" runat="server" class="sfTdseperator">
                                                <td runat="server">
                                                    <asp:Label ID="lblPassword" runat="server" CssClass="sfFormlabel" />
                                                </td>
                                                <td runat="server">
                                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="sfInputbox" TextMode="Password" />
                                                    <label id="lblPasswordError" class="sfError">
                                                    </label>
                                                </td>
                                                <td runat="server">
                                                    <i class="icon-info" data-title="Password to access the server"></i>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                                <tr id="trDatabaseHeading" runat="server">
                                    <td runat="server">
                                        <span class="sfFormlabel">Database Name</span>
                                    </td>
                                    <td id="trrdbCreateDatabase" runat="server" class="sfTdseperator">
                                        <label>
                                            <input id="rdbCreateDatabase" type="radio" name="rdbDataBase" checked="checked" />
                                            Create New Database</label>
                                    </td>
                                    <td id="trrdbExistingDatabase" runat="server" class="sfgap">
                                        <label>
                                            <input id="rdbExistingDatabase" type="radio" name="rdbDataBase" />
                                            Existing Database</label>
                                    </td>
                                </tr>
                                <tr class="sfDBNameField" runat="server">
                                    <td runat="server">
                                    </td>
                                    <td id="trnewDatabase" runat="server" class="sfgap">
                                        <asp:TextBox ID="txtNewDataBaseName" runat="server" CssClass="sfInputbox" />
                                        <label id="lblNewDatabaseError" class="sfError">
                                        </label>
                                    </td>
                                    <td id="trExistingDatabase" runat="server" class="sfgap2">
                                        <asp:TextBox ID="txtExistingDatabaseName" runat="server" CssClass="sfInputbox" />
                                        <label id="lblExistingDatabaseError" class="sfError">
                                        </label>
                                    </td>
                                </tr>
                            </table>
                            <div class="sfButtonwrapper">
                                <p>
                                    (Optional) You can test your database connectivity before installing SageFrame to
                                    check whether you have configured database properly or not. However, you can skip
                                    this step and install SageFrame directly as well.</p>
                                <asp:Button ID="btnTestPermission" runat="server" CssClass="sfBtn" Text=" Test Configuration"
                                    OnClick="btnTestPermission_Click" meta:resourcekey="btnTestPermissionResource1" /></div>
                        </div>
                        <div id="divTemplateList" class="sfTemplate">
                            <h3>
                                Choose Template
                            </h3>
                            <ul>
                                <asp:Repeater ID="rptrTemplateList" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <p>
                                                <asp:RadioButton ID="chkIsActive" runat="server" GroupName="SelectTemplate" Text='<%# Eval("TemplateName") %>' meta:resourcekey="chkIsActiveResource1" />
                                                <asp:Label ID="lblTemplateName" runat="server" Text='<%# Eval("TemplateName") %>'
                                                    CssClass="sfHide" meta:resourcekey="lblTemplateNameResource1" />
                                            </p>
                                            <asp:Image ID="imgThubNail" runat="server" ImageUrl='<%# Eval("ThumbImage") %>' meta:resourcekey="imgThubNailResource1" />
                                            <br />
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
            </div>
            <div class="sfinstalbtn">
                <asp:Button ID="btnInstall" runat="server" CssClass="sfBtn" Text="Install SageFrame"
                    OnClick="btnInstall_Click" meta:resourcekey="btnInstallResource1" />
            </div>
            </asp:Panel>
            <asp:Timer runat="server" ID="UpdateTimer" Interval="1000" OnTick="UpdateTimer_Tick"
                Enabled="False" />
            <asp:UpdatePanel runat="server" ID="TimedPanel" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    <div class="sfProcessWrapper">
                        <div class="sfmaincontent">
                            <div class="sfloadingDiv" id="loadingDiv" runat="server">
                               <h2> <asp:Label ID="lblDBProgress" runat="server" Text="Installing Database Scripts ...Please wait...This may take a moment"
                                    EnableViewState="False" meta:resourcekey="lblDBProgressResource1"></asp:Label></h2>
                                <asp:Image ID="imgDBProgress" runat="server" AlternateText="Installing Database Scripts..."
                                    ToolTip="Installing Database Scripts..." meta:resourcekey="imgDBProgressResource1" />
                            </div>
                            <asp:TextBox ID="txtFeedback" runat="server" class="cssClassFeedBack" Columns="60"
                                Rows="6" TextMode="MultiLine" ReadOnly="True" meta:resourcekey="txtFeedbackResource1"></asp:TextBox>
                            <asp:Label ID="lblInstallErrorOccur" runat="server" Visible="False" EnableViewState="False" meta:resourcekey="lblInstallErrorOccurResource1" />
                        </div>
                    </div>
                    <div class="sfButtonwrapper">
                        <asp:Button ID="btnCancel" runat="server" CssClass="sfBtn" Text="Cancel" Visible="False"
                            OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
