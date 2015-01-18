using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;

public partial class Modules_SmartBlog_SmartBlogReadDetails : BaseAdministrationUserControl
{
    public string RedirectUrl;

    protected void Page_Load(object sender, EventArgs e)
    {
        IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/SmartBlogReadDetails.js", "/Modules/SmartBlog/JS/jquery.alerts.js");
        IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/shCore.js", "/Modules/SmartBlog/JS/shBrushJScript.js", "/Modules/SmartBlog/JS/shBrushCSharp.js", "/Modules/SmartBlog/JS/shBrushCss.js", "/Modules/SmartBlog/JS/shBrushSql.js");
        IncludeCss("SmartBlog", "/Modules/SmartBlog/css/module.css", "/Modules/SmartBlog/css/shCoreDefault.css");
        IncludeJs("SmartBlog", false, "/js/jquery.validate.js");
        RedirectUrl = GetHostURL;
        
     
    }

    public string GetHostURL
    {
        get
        {
            string hostUrl = Page.Request.Url.Scheme + "://" + Request.Url.Authority + GetApplicationName;
            return hostUrl;
        }
    }
}
