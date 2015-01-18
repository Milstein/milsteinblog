<%@ WebService Language="C#" Class="SmartBlogService" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SageFrame.SmartBlog;
using SageFrame.Web;
using SageFrame.SageFrameClass.MessageManagement;
using SageFrame.Templating;
using System.IO;
using System.Globalization;
using SageFrame.Localization;
using System.Text;
using SageFrame.SageFrameClass.MessageManagement;
using SageFrame.NewsLetter;

/// <summary>
/// Summary description for SmartBlogService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SmartBlogService : SageFrame.Services.AuthenticateService
{

    [WebMethod]
    public void SaveCategory(string CategoryName)
    {
        SmartBlogController.AddCategory(CategoryName);
    }
    [WebMethod]
    public void SaveTag(string TagName)
    {
        SmartBlogController.AddTag(TagName);
    }
    [WebMethod]
    public int GetID(string Flag)
    {
        return SmartBlogController.GetID(Flag);
    }
    [WebMethod]
    public List<SmartBlogInfo> GetTagCategoryID(string Flag, string TCName, string PostID)
    {
        return SmartBlogController.GetTagCategoryID(Flag, TCName, PostID);
    }
    [WebMethod]
    public void AddUpdatePost(string Flag, string PostTitle, string PostDescription, string Tags, string Category, string PostSummary, string SummaryIcon, string Author, string Culture, int PortalID, string PostURL, string secureToken, string SageFrameUserName, int userModuleID, string AddedBy)
    {
        SageFrameConfig sageconfig = new SageFrameConfig();
        string From = sageconfig.GetSettingsByKey(SageFrameSettingKeys.SiteAdminEmailAddress);

        try
        {
            if (IsPostAuthenticated(PortalID, userModuleID, SageFrameUserName, secureToken))
            {
                int PostID = SmartBlogController.AddUpdatePost(Flag, PostTitle, PostDescription, Tags, Category, PostSummary, SummaryIcon, Author, Culture, AddedBy);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    [WebMethod]
    public List<SmartBlogInfo> GetPost(string Author, string Mode, string pageNo, int range, string secureToken, string SageFrameUserName, int userModuleID, int PortalID)
    {
        List<SmartBlogInfo> lstBlog = new List<SmartBlogInfo>();
        try
        {
            if (IsPostAuthenticated(PortalID, userModuleID, SageFrameUserName, secureToken))
            {
                lstBlog = SmartBlogController.SmartBlogGetPost(Author, Mode, Int32.Parse(pageNo), range);
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
        return lstBlog;

    }
    [WebMethod]
    public void DeletePost(int PostID)
    {
        SmartBlogController.DeletePost(PostID);

    }

    [WebMethod]
    public List<SmartBlogInfo> GetPostByPostID(int PostID)
    {
        try
        {
            List<SmartBlogInfo> objInfo = new List<SmartBlogInfo>();
            //  if (IsPostAuthenticated(PortalID, userModuleID, SageFrameUserName, secureToken))
            // {
            objInfo = SmartBlogController.GetPostByPostID(PostID);

            //  } 
            return objInfo;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    [WebMethod]
    public void PostComment(int PostID, string Comment, string Email, string IsApproved, string UserName, string User, string PostURL, string secureToken, string SageFrameUserName, int userModuleID, int PortalID)
    {
        if (IsPostAuthenticated(PortalID, userModuleID, SageFrameUserName, secureToken))
        {
            SmartBlogService objSmartBlog = new SmartBlogService();
            List<SmartBlogInfo> objSmartInfo = objSmartBlog.GetPostCommentByPostID(PostID);
            SageFrameConfig sageconfig = new SageFrameConfig();

            string From = Email;
            string PostTitle = "";
            string Body = "";

            string Subject = UserName + " has Commented on the Post ";
            string Author = sageconfig.GetSettingsByKey(SageFrameSettingKeys.SiteAdminEmailAddress);

            if (Email == string.Empty || Email == null)
            {
                From = Author;
                Email = Author;
            }

            foreach (SmartBlogInfo objInfo in objSmartInfo)
            {
                PostTitle = objInfo.PostTitle;
                Body = LoadMailBody(PostURL, PostID, PostTitle);
                MailHelper.SendMailNoAttachment(From, objInfo.Email, Subject, Body, "", "");
            }
            if (From != Author)
            {
                MailHelper.SendMailNoAttachment(From, Author, Subject, Body, "", "");
            }
            SmartBlogController.PostComment(PostID, Comment, Email, IsApproved, UserName);
        }

        else
        {
            Server.Transfer("~/sf/sflogin.aspx");
        }
    }

    private string LoadMailBody(string PostURL, int PostID, string PostTitle)
    {

        StringBuilder html = new StringBuilder();
        html.Append("<table>");
        html.Append("<tr><td> There is a New Comment On the Post </td></tr>");
        html.Append("<tr><td>");
        html.Append("<a href='" + PostURL + PostID + "'>" + PostTitle + "</a>");
        html.Append("</td>");
        html.Append("</tr>");
        html.Append("</table>");
        return html.ToString();
    }

    [WebMethod]
    public List<SmartBlogInfo> GetCommentByPostID(int PostID, string Mode, int pageNo, int range)
    {
        return SmartBlogController.GetCommentByPostID(PostID, Mode, pageNo, range);
    }

    [WebMethod]
    public List<SmartBlogInfo> GetPostCommentByPostID(int PostID)
    {
        return SmartBlogController.GetPostCommentByPostID(PostID, "V");
    }

    [WebMethod]
    public string GetPostCommentByPostID(int PostID, string Mode, int pageNo, int range)
    {
        try
        {
            List<SmartBlogInfo> objComment = new List<SmartBlogInfo>();
            StringBuilder html = new StringBuilder();
            objComment = SmartBlogController.GetCommentByPostID(PostID, Mode, pageNo, range);
            foreach (SmartBlogInfo objInfo in objComment)
            {
                html.Append("<div class='sfNewArticle' id='divPostID' value='" + PostID + "'>");
                html.Append("<ul class='sfArticleInfo'>");
                html.Append("<li class='sfdate'>" + objInfo.CommentDate + "</li>");
                html.Append("<p>" + objInfo.Comment + "</p>");
                html.Append("<div class='CommentUser' style = 'margin-left:125px'><p > " + objInfo.UserName + "</p></div>");
                html.Append("<div class='Comments' id='Comment_" + objInfo.CommentID + "'></div>");
                html.Append("</div>");

            }
            return html.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public void SendCommentNotification(string PostTitle, string PostAuthor, string secureToken, string SageFrameUserName, int userModuleID, int PortalID)
    {
        try
        {
            if (IsPostAuthenticated(PortalID, userModuleID, SageFrameUserName, secureToken))
            {
                string Email = string.Empty;
                Email = SmartBlogController.GetEmailByAuthor(PostAuthor);
                Email = Email.Replace(",", "");
                SageFrameConfig pagebase = new SageFrameConfig();
                string emailSuperAdmin = pagebase.GetSettingsByKey(SageFrameSettingKeys.SuperUserEmail);//"milsonmun@hotmail.com";
                string emailSiteAdmin = pagebase.GetSettingsByKey(SageFrameSettingKeys.SiteAdminEmailAddress);
                string subject = "Comment Notification";
                string messageText = "You have a comment on your post." + "<br/>" + PostTitle + "<br/>";

                MailHelper.SendMailNoAttachment(emailSuperAdmin, Email, subject, messageText, string.Empty, string.Empty);
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    [WebMethod]
    public int GetCommentCount(string PostID)
    {
        return SmartBlogController.GetCommentCount(PostID);
    }
    [WebMethod]
    public int GetApproveCommentCount(string PostID)
    {
        return SmartBlogController.GetApproveCommentCount(PostID);
    }

    [WebMethod]
    public void ApproveComment(string CommentIDs)
    {
        SmartBlogController.ApproveComment(CommentIDs);
    }
    [WebMethod]
    public void ApprovePost(string PostIDs)
    {
        SmartBlogController.ApprovePost(PostIDs);
    }

    [WebMethod]
    public void UnapproveComment(string CommentIDs)
    {
        SmartBlogController.UnapproveComment(CommentIDs);
    }

    [WebMethod]
    public void UpdateComment(string CommentID, string Comment)
    {
        SmartBlogController.UpdateComment(CommentID, Comment);
    }
    [WebMethod]
    public void DeleteComment(string CommentID)
    {
        SmartBlogController.DeleteComment(CommentID);
    }
    [WebMethod]
    public void DeleteTagCategoryByID(string Flag, string ID)
    {

        SmartBlogController.DeleteTagCategoryByID(Flag, ID);
    }


    [WebMethod]
    public List<SmartBlogInfo> GetPostTag()
    {
        List<SmartBlogInfo> tagInfo = SmartBlogController.GetPostTag();
        foreach (SmartBlogInfo tag in tagInfo)
        {
            tag.TagUrl = tag.TagName;
        }
        return (tagInfo);
    }
    [WebMethod]
    public void DeleteSummaryIcon(string IconPath)
    {
        try
        {
            string filepath = Utils.GetAbsolutePath(string.Format("Modules/SmartBlog/SummaryIcon/{0}", IconPath));
            if (File.Exists(filepath))
            {
                File.SetAttributes(filepath, System.IO.FileAttributes.Normal);
                File.Delete(filepath);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [WebMethod]
    public void SaveSmartBlogSetting(string SettingKey, string SettingValue, int PortalID, string UpdatedBy, string AddedBy)
    {

        SmartBlogController.SaveSmartBlogSetting(SettingKey, SettingValue, PortalID, UpdatedBy, AddedBy);
    }
    [WebMethod]
    public List<SmartBlogCultureInfo> loadCultureList()
    {
        List<Language> lstAllCultures = LocaleController.GetCultures();
        List<SmartBlogCultureInfo> lstCulture = new List<SmartBlogCultureInfo>();
        foreach (Language objLst in lstAllCultures)
        {
            SmartBlogCultureInfo objInfo = new SmartBlogCultureInfo();
            objInfo.LanguageName = objLst.LanguageName;
            objInfo.LanguageCode = objLst.LanguageCode;
            lstCulture.Add(objInfo);
        }
        return lstCulture;
    }
    [WebMethod]
    public SmartBlogInfo GetCount(string Mode, string Author)
    {
        SmartBlogController objController = new SmartBlogController();
        return objController.GetCount(Mode, Author);
    }
    [WebMethod]
    public SmartBlogInfo GetPostCount(int PostID, string Mode)
    {
        SmartBlogController objController = new SmartBlogController();
        SmartBlogInfo obj = new SmartBlogInfo();
        //obj = objController.GetPostCount
        return objController.GetPostCount(PostID, Mode);
    }

    [WebMethod]
    public string SmartBlogViewPost(int pageNo, int range, string PassURL)
    {
        //string Culture = GetCurrentCulture();
        List<SmartBlogInfo> objPost = SmartBlogController.SmartBlogGetPost("superuser", "a", pageNo, range);
        StringBuilder html = GetaHtmlFormat(objPost, PassURL);
        return html.ToString();
    }

    [WebMethod]
    public string SmartBlogGetPostByTag(string Tag, int offset, string PassURL)
    {
        try
        {
            List<SmartBlogInfo> objTag = new List<SmartBlogInfo>();
            StringBuilder html = new StringBuilder();
            objTag = SmartBlogController.GetPostByTag(Tag, offset);
            int count = 0;
            count = objTag.Count;
            html = GetaHtmlFormat(objTag, PassURL);
            html.Append("<div id='divTotal' style='display:none'>");
            html.Append("<span>" + count + "</span>");
            html.Append("</div>");
            return html.ToString();
        }

        catch (Exception ex)
        {
            throw ex;
        }

    }
    [WebMethod]
    public List<SmartBlogInfo> SmartBlogGetPostByArchive(string date, int offset)
    {
        List<SmartBlogInfo> objArchive = SmartBlogController.SmartBlogGetPostByArchive(date, offset);
        return objArchive;
    }

    [WebMethod]
    public string SmartBlogGetPostByDate(string postDate, string postMonth, int offSet, string PassURL)
    {
        try
        {
            StringBuilder html = new StringBuilder();
            List<SmartBlogInfo> lstBlog = new List<SmartBlogInfo>();
            SmartBlogController controller = new SmartBlogController();
            lstBlog = controller.SmartBlogGetPostByDate(postDate, postMonth, offSet);
            int count = 0;
            count = lstBlog.Count;
            html = GetaHtmlFormat(lstBlog, PassURL);
            html.Append("<div id='divTotal' style='display:none'>");
            html.Append("<span>" + count + "</span>");
            html.Append("</div>");
            return html.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private StringBuilder GetaHtmlFormat(List<SmartBlogInfo> objinfo, string PassURL)
    {

        StringBuilder html = new StringBuilder();


        int count = 0;
        int countComment = 0;

        foreach (SmartBlogInfo objInfo in objinfo)
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
            // html.Append("<span class='sfBtn btnComment' id='setComment_" + objInfo.PostID + "'>Comment</span>");
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
        return html;
    }
}


