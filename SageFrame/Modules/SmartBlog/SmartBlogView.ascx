<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmartBlogView.ascx.cs"
    Inherits="Modules_SmartBlog_SmartBlogView" %>
<%@ Register Src="~/Modules/SmartBlog/SmartBlogReadDetails.ascx" TagName="SmartBLogDetail"
    TagPrefix="uc4" %>

<script type="text/javascript">    
    var culture = '<%=Culture %>';
    var passURL = '<%=PassURL %>';
    var portalID = '<%=PortalID %>';
    var postURL = '<%=RedirectUrl %>';
    var secureToken = '<%=SecureToken %>';
    var userModuleID = '<%=UserModuleID %>';
</script>

<asp:Literal runat="server" ID="ltrSpn" meta:resourcekey="ltrSpnResource1"></asp:Literal>
<div class="sfFormwrapper">
    <div id="divBlogs">
        <div id="divNewPost">
        </div>
       <asp:Literal runat="server" ID="ltrPost" meta:resourcekey="ltrPostResource1"></asp:Literal> 
        <div id="loadingDiv" style="display: none;">
            Loading...
        </div>
        <asp:Button ID="btnBack" runat="server" CssClass="sfBtn" Text="Back" Visible="False" meta:resourcekey="btnBackResource1" />
    </div>
    <div id="divDetails" style="display: none">
        <uc4:SmartBLogDetail ID="smrtblogDetail" runat="server" />
    </div>
</div>

