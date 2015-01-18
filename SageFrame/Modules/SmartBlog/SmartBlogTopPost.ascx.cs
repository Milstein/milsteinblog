using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;
using SageFrame.SmartBlog;

public partial class Modules_SmartBlog_SmartBlogTopPost : BaseAdministrationUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SmartBlogGetTopPost();
        }
    }
    protected void rptTopPost_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected void rptTopPost_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string TopPostID = (e.Item.FindControl("hdnTopPost") as HiddenField).Value;
        //string URL = "~/BlogDetail.aspx?ID=" + TopPostID;
        string URL = Request.Url.GetLeftPart(UriPartial.Path).ToString() + "?ID=" + TopPostID;
        (e.Item.FindControl("lnkTopPost") as HyperLink).NavigateUrl = URL;
    }
    public void SmartBlogGetTopPost()
    {
        List<SmartBlogInfo> objTopPost = SmartBlogController.SmartBlogGetTopPost();
        objTopPost.ForEach(delegate(SmartBlogInfo obj) { if (obj.PostTitle.Length > 30) { obj.PostTitle = string.Format("{0}..",obj.PostTitle.Substring(0, 30)); } else { obj.PostTitle = obj.PostTitle; } });
        rptTopPost.DataSource = objTopPost;
        rptTopPost.DataBind();
    }
}
