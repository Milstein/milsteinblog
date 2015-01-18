using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;
using SageFrame.SmartBlog;

public partial class Modules_SmartBlog_SmartBlogArchive : BaseAdministrationUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SmartBlogGetArchive();
        }
    }
    protected void rptrArchive_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
        string ArchiveDate = (e.Item.FindControl("hdnArchiveDate") as HiddenField).Value;
        string URL = Request.Url.GetLeftPart(UriPartial.Path).ToString() + "?date=" + ArchiveDate;
        //string URL = "~/Blogs.aspx?date=" + ArchiveDate;
        (e.Item.FindControl("lnkArchives") as HyperLink).NavigateUrl = URL;
        
    }
    protected void rptrArchive_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
    }
    public void SmartBlogGetArchive()
    {
        List<SmartBlogInfo> objArchive = SmartBlogController.SmartBlogGetArchives();
        List<SmartBlogInfo> objDisplayArchives = objArchive.Count > 10 ? objArchive.GetRange(0, 10) : objArchive.GetRange(0, objArchive.Count);
        rptArchive.DataSource = objDisplayArchives;
        rptArchive.DataBind();
    }
}
