<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmartBlogReadDetails.ascx.cs"
    Inherits="Modules_SmartBlog_SmartBlogReadDetails" %>

<script type="text/javascript">

    $(function() {
        SyntaxHighlighter.all();
        $(this).SageSmartBlogReadDetails({
            CultureCode: 'en-US',
            baseURL: '',
            Mode: false,
            AppName: '/sageframe'
        });
    });
    var postURL = '<%=RedirectUrl %>';
    var Mode = 'D';
</script>
<%--
<script type="text/javascript">
    var __st_loadLate = true; //if __st_loadLate is defined then the widget will not load on domcontent ready
</script>

<script type="text/javascript">    var switchTo5x = false;</script>

<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>

<script type="text/javascript">    stLight.options({ publisher: '938d4fda-409f-4c0b-b300-33191719abed' });</script>
--%>
<div class="clsBlog" id="divBlogDetails">
<div class="clsBlog">
    <div class="title">
    </div>
    <div style="clear: both">
    </div>
    <span class="spnCommentCount">
    </span> 
    <div class="topTools">
        <span class="date"></span><span class="tag"></span><span class="category"></span>
        <span class="author">By </span>
    </div>
    <div style="clear: both">
    </div>
    <div class="desc">
    </div>
    <input type="button" value="Back" title="Back" class="sfBtn sfBack" id="btnBack" />
</div>
<div id="divSocialSharing" class="clsBlog">
   
      <input type="button" value="Post Comment" title="Post Comment" class="sfBtn" id="btnComment" />
       
    <span class='st_linkedin_hcount'>&nbsp;&nbsp;&nbsp; </span><span class='st_googleplus_hcount'></span>
    <span class='st_twitter_hcount'></span><span class='st_facebook_hcount'></span><span
        class='st_sharethis_hcount'></span><span class='st_fblike_hcount'></span>
  
      <input type="button" value="Show Comment" title="Post Comment" class="sfBtn" id="btnShowPost" />
       
</div>
<div id="divDisplayComment"  style="overflow:scroll; height:400px; display:none" class="sfComment divDisplayComment" >
</div>
<div class="clsComment" id="divComment" style="display:none">
    <h2>
        Leave a Comment</h2>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <label class="sfFormlabel">
                    <b>UserName:</b></label>
            </td>
            <td>
                <input type="text" class="sfInputbox" name="txtUserName" id="txtUserName" />
            </td>
        </tr>
        <tr id="trEmail">
            <td>
                <label class="sfFormlabel">
                    <b>Email:</b></label>
            </td>
            <td>
                <input type="text" name="txtEmail" class="sfInputbox" id="txtEmail" />
            </td>
        </tr>
        <tr>
            <td>
                <label class="sfFormlabel">
                    <b>Comment:</b></label>
            </td>
            <td>
                <textarea id="txtComment" name="txtComment" class="sfTextarea" style="height: 130px;
                    width: 300px;"></textarea>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <input type="button" value="Post Comment" title="Post Comment" class="sfBtn" id="btnPostComment" />
            </td>
        </tr>
    </table>
</div>
<div id="divCommentNotification">
</div>
</div>