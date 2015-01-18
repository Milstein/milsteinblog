<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmartBlogEdit.ascx.cs"
    Inherits="Modules_SmartBlog_SmartBlogEdit" %>

<script type="text/javascript">
    $(function()
    {
        $(this).SageSmartBlog({
            CultureCode: 'en-US',
            baseURL: '',
            Mode: false,
            AppName: '/sageframe'
        });
    });

    var postURL = '<%=RedirectUrl %>';
    var portalID = '<%=PortalID %>';
    var secureToken = '<%=SecureToken %>';
    var userModuleID = '<%=UserModuleID %>';
    var SageFrameUserName = '<%=SageFrameUserName %>';
</script>

<div class="sfFormwrapper">
    <div id="divUnPublishPost">
    </div>
    <div id="divPost">
        <fieldset>
            <legend>Post </legend>
            <input type="button" title="AddNew" value="NewPost" class="sfBtn" id="btnNewPost" />
            <input type="button" title="Import" value="Import" class="sfBtn" id="btmWPImport" />
            <div id="divWPImport">
                <fieldset>
                    <legend>Import Word Press Blog</legend>
                    <asp:FileUpload ID="fuBlogFile" runat="server" meta:resourcekey="fuBlogFileResource1" />
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
                    <asp:RadioButtonList ID="rblSource" runat="server" meta:resourcekey="rblSourceResource1">
                        <asp:ListItem Value="w" Selected="True" meta:resourcekey="ListItemResource1">WordPress</asp:ListItem>
                        <asp:ListItem Value="b" meta:resourcekey="ListItemResource2">Blogger</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="fuBlogFile" ErrorMessage="RequiredFieldValidator" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lblUploadMsg" runat="server" meta:resourcekey="lblUploadMsgResource1"></asp:Label>
                </fieldset>
            </div>
            <div id="divNewPost">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblCulture" Text="Select Culture" CssClass="sfFormlabel" meta:resourcekey="lblCultureResource1"></asp:Label>
                            <select id="slcCulture" class="sfListmenu">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTitle" runat="server" Text="Post Title" CssClass="sfFormlabel" meta:resourcekey="lblTitleResource1"></asp:Label>
                            <textarea id="txtTitle" class="sfTextarea" style="height: 25px; width: 555px"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPost" runat="server" Text="Post" CssClass="sfFormlabel" meta:resourcekey="lblPostResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="txtPost" class="sfTextarea"></textarea>
                        </td>
                    </tr>   
                       <tr>
                        <td>
                            <asp:Label ID="lblSummary" runat="server" Text="Summary" CssClass="sfFormlabel" meta:resourcekey="lblSummaryResource1"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <textarea id="txtSummary" class="sfTextarea" style="height: 233px; width: 604px"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTag" runat="server" Text="Tag" CssClass="sfFormlabel" meta:resourcekey="lblTagResource1"></asp:Label>
                            <div id="divAddTag">
                            
                            </div>
                            <input type="text" id="txtTag" class="sfInputbox" />
                            <input type="button" title="Add" value="Add" class="sfBtn" id="btnAddTag" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCategory" runat="server" Text="Category" CssClass="sfFormlabel" meta:resourcekey="lblCategoryResource1"></asp:Label>
                            <div id="divAddCategory">
                            </div>
                            <input type="text" id="txtCategory" class="sfInputbox" />
                            <input type="button" title="Add" value="Add" class="sfBtn" id="btnAddCategory" />
                        </td>
                    </tr>
                 
                    <tr>
                    <td>
                    <asp:Label ID="lblAuthor" CssClass="sfFormlabel" Text="Author" runat="server" meta:resourcekey="lblAuthorResource1"></asp:Label>
                    </td>
                    </tr>
                    <tr>
                    <td>
                    
                    <input type="text" id="txtAuthor" class="sfInputbox" />

                    </td>
                    </tr>
                    </tr>

                
                    <tr>
                        <td>
                            <div id="divUploadSummary">
                                <label class="sfFormlabel">
                                    Summary Snapshot</label>
                                <input type="file" id="fupIconSummary" />
                                <div class="sfUploadedFilesSummary" id="divUploadSummaryIcon">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" title="Add" value="Post" class="sfBtn" id="btnPost" />
                            <input type="button" title="Update" value="Update" class="sfBtn" id="btnUpdate" />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divDisplayPost" class="sfGridwrapper">
                <table id="tblPost" width="100%">
                </table>
                <div id="divPaging">
                </div>
            </div>
            <div id="divComment" class="sfGridwrapper">
                <table id="tblComment" width="100%">
                </table>
                <div id="divCommentPaging">
                </div>
            </div>
            <%-- <input type="button" title="Aprrove" value="Approve Comment" class="sfBtn" id="btnApprove" />--%>
            <div id="divEditcomment">
                <textarea id="txtEditComment" class="sfTextarea" style="height: 25px; width: 555px"></textarea>
                <input type="button" title="Save" value="Save" class="sfBtn" id="btnSaveComment" />
            </div>
        </fieldset>
    </div>
    <input type="button" title="Cancel" value="Cancel" class="sfBtn" id="btnCancel" />
</div>

<%--<div id="divDisplayPost" class="sfGridwrapper">
    <table id="tblPost">
    </table>
    <div id="divPaging">
    </div>
</div> 
 --%>