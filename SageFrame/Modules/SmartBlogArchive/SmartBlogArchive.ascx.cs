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
    public string ArchiveURL = string.Empty;
    public string MonthlyArchiveUrlI = string.Empty;
    public string MonthlyArchiveUrlII = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        IncludeJS();
        string modulePath = ResolveUrl(this.AppRelativeTemplateSourceDirectory);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "globalVariables", " var ArchiveServicePath='" + ResolveUrl(modulePath) + "';", true);
        ArchiveURL = Request.Url.GetLeftPart(UriPartial.Path).ToString() + "?date=";
        MonthlyArchiveUrlI = Request.Url.GetLeftPart(UriPartial.Path).ToString() + "?date=";
        MonthlyArchiveUrlII = "&month=";
    }
    private void IncludeJS()
    {
        IncludeJs("SmartBlogArchive", "/Modules/SmartBlogArchive/js/SmartBlogArchive.js");
    }
    
    
}
