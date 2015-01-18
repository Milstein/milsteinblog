using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;
using SageFrame.SmartBlog;
using System.Web.UI.HtmlControls;
using SageFrame.Common.CommonFunction;
using System.Text;

public partial class Modules_SmartBlog_SmartBlogView : BaseAdministrationUserControl
{

    public string PassURL = "";
    public int UserModuleID = 0;
    public int PortalID = 0;
    public string Culture = "";
    public string RedirectUrl = "";
    public string SecureToken = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        PassURL = GetHostURL + "/blog.aspx?ID=";
        IncludeCss("SmartBlog", "/Modules/SmartBlog/css/module.css");
        IncludeJs("SmartBlogs", "/Modules/SmartBlog/JS/SmartBlogView.js");
        IncludeJs("SmartBlog", false, "/js/jquery.validate.js");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SageFrameGlobalVar2", " var SageFrameUserName='" + GetUsername + "';", true);
        string modulePath = ResolveUrl(this.AppRelativeTemplateSourceDirectory);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "globalVariables", " var ServicePath='" + ResolveUrl(modulePath) + "';", true);
        RedirectUrl = GetHostURL + "/Blog.aspx?ID=";
        SecureToken = SageFrameSecureToken;
        if (!IsPostBack)
        {
            UserModuleID = Int32.Parse(SageUserModuleID);
            PortalID = GetPortalID;
            Culture = GetCurrentCulture();
        }
        if (Request.QueryString == null || Request.QueryString.ToString() == string.Empty || Request.QueryString.Count == 0)
        {
            ViewPost();
        }
        else {
            StringBuilder sb = new StringBuilder();
            sb.Append("<div id='divPostViewByTag'></div>");
            ltrPost.Text = sb.ToString();
        }

    }
    public void ViewPost()
    {
        List<SmartBlogInfo> objPost = SmartBlogController.SmartBlogGetPost("superuser", "a", 1, 5);
        StringBuilder html = new StringBuilder();

       
        html.Append("<div id='DivPostView'>");
        int count = 0;
        int countComment = 0;

        foreach (SmartBlogInfo objInfo in objPost)
        {
            count = objInfo.Count;

            countComment = objInfo.ApproveComment;
            html.Append("<div class='sfNewArticle'>");
            html.Append("<h3><a href='");
            html.Append(PassURL + objInfo.PostID);
            html.Append("/");
            html.Append(objInfo.PostTitle);
            html.Append("'>");
            html.Append(objInfo.PostTitle);
            html.Append("</a></h3>");
            html.Append("<ul class='sfArticleInfo'>");
            html.Append("<li class='sfdate'>");
            html.Append(objInfo.BlogPostDate);
            html.Append("</li>");
            html.Append("<li class='sfcomments'><a href='");
            html.Append(PassURL + objInfo.PostID);
            html.Append("'>");
            html.Append(objInfo.ApproveComment);
            html.Append("</a></li>");
            html.Append("<li class='sfTag'>");
            html.Append(objInfo.Tags);
            html.Append("</li>");
            html.Append("<li class='sfCateogory'>");
            html.Append(objInfo.Categories);
            html.Append("</li></ul>");
            if (objInfo.SummaryIcon == string.Empty)
            {
                html.Append("<p>");
                html.Append(objInfo.PostSummary);
                html.Append("</p>");
            }
            else
            {
                html.Append("<p><a href='");
                html.Append(PassURL + objInfo.PostID);
                html.Append("'><img src='Modules/SmartBlog/SummaryIcon/");
                html.Append(objInfo.SummaryIcon);
                html.Append("' alt='Summary'></a>");
                html.Append(objInfo.PostSummary);
                html.Append("</p>");
            }
            html.Append("<div class='btnButtonClass'>");
            //html.Append("<span class='sfBtn btnComment' id='setComment_"+objInfo.PostID+"'>Comment</span>");
            if (countComment != 0)
            {
                html.Append("<a class='sfBtn btnPost' value=");
                html.Append(countComment);
                html.Append(" id='showPost_");
                html.Append(objInfo.PostID);
                html.Append("'>Show Post</a>");

            }
            html.Append("</div>");
            html.Append("<div style='clear: both '></div>");

            html.Append("<div class='clsComment' id='divComment_");
            html.Append(objInfo.PostID);
            html.Append("' style='display:none'><h2>Leave a Comment</h2>");
            html.Append("<table cellpadding='0' cellspacing='0' border='0' width='100%'>");
            html.Append("<tr><td><label class='sfFormlabel'><b>UserName:</b></label></td><td>");
            html.Append("<input type='text' class='sfInputbox' name='txtUserName' id='txtUserName_");
            html.Append(objInfo.PostID);
            html.Append("' />");
            html.Append("</td></tr><tr id='trEmail_");
            html.Append(objInfo.PostID);
            html.Append("'><td><label class='sfFormlabel'><b>Email:</b>");
            html.Append("</label></td><td><input type='text' name='txtEmail' class='sfInputbox' id='txtEmail_");
            html.Append(objInfo.PostID);
            html.Append("' />");
            html.Append("</td></tr><tr><td><label class='sfFormlabel'><b>Comment:</b></label></td><td>");
            html.Append("<textarea id='txtComment_");
            html.Append(objInfo.PostID);
            html.Append("' name='txtComment' class='sfTextarea' style='height: 130px;width: 300px;'></textarea></td>");
            html.Append("</tr><tr><td></td><td><input type='button' value='Post Comment' title='Post Comment' class='sfBtn btnPostComment' id='btnPostComment_");
            html.Append(objInfo.PostID);
            html.Append("' />");
            html.Append("</td></tr></table></div> ");
            html.Append("<div class='DivCommentView' id='DivCommentView_");
            html.Append(objInfo.PostID);
            html.Append("' style='display:none; overflow-y:scroll; height:400px'>");

            html.Append("<div class='commentList' id='divCommentList_");
            html.Append(objInfo.PostID);
            html.Append("'></div>");
            html.Append("</div>");
            html.Append("<div class='Posts' id='Post_");
            html.Append(objInfo.PostID);
            html.Append("'></div>");
            html.Append("</div>");

        }
        html.Append("</div>");
        html.Append("<span class='spnTotal' style='display:none'>");
        html.Append(count);
        html.Append("</span>");
        //ltrSpn.Text = "<span class='spnTotal'>" + count + "</span>";
        ltrPost.Text = html.ToString();
    }

    public string GetHostURL
    {
        get
        {
            string hostUrl = Page.Request.Url.Scheme + "://" + Request.Url.Authority + GetApplicationName;
            return hostUrl;
        }
    }
    public void SaveLike(int PostID, string LikeIP)
    {
        if (CheckLike(PostID, LikeIP))
        {
            SmartBlogController.SaveLikeByPostID(PostID, LikeIP);
        }

    }
    public bool CheckLike(int PostID, string LikeIP)
    {
        int Check = SmartBlogController.CheckLike(PostID, LikeIP);
        if (Check > 0)
            return false;
        else
            return true;
    }

    public int CurrentPage
    {
        get
        {
            // look for current page in ViewState
            object obj = this.ViewState["_CurrentPage"];
            if (obj == null)
                return 0; // default page index of 0
            else
                return (int)obj;
        }

        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    }

    protected void cmdPrev_Click(object sender, EventArgs e)
    {

        CurrentPage -= 1;
        // SmartBlogViewPost();

    }
    protected void cmdNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        // SmartBlogViewPost();

    }
    public SmartBlogSettingInfo GetSetting()
    {
        int PortalID = GetPortalID;
        return SmartBlogController.GetSetting(PortalID);
    }
}