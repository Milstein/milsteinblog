using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;
using SageFrame.SmartBlog;
using System.Globalization;
using System.Web.Hosting;

public partial class Modules_SmartBlog_SmartBlogEdit : BaseAdministrationUserControl
{
    public string RedirectUrl;
    public int PortalID = 0;
    public int UserModuleID = 0;
    public string SecureToken = "";
    public string SageFrameUserName ="";
  
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptInclude("J9", ResolveUrl("~/Editors/ckeditor/ckeditor.js"));
        UserModuleID = Int32.Parse(SageUserModuleID);
        SecureToken = SageFrameSecureToken;
        SageFrameUserName = GetUsername;
        PortalID = GetPortalID;
       
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ckEditorUserModuleID", " var ckEditorUserModuleID='" + SageUserModuleID + "';", true);

        RedirectUrl = Request.Url.Scheme + "://" + Request.Url.Authority + "/blogViewDetail" + SageFrameSettingKeys.PageExtension + "?ID=";
        IncludeJs("SmartBlog", "/Editors/ckeditor/ckeditor.js");
        IncludeJs("SmartBlog", "/Editors/ckeditor/adapters/jquery.js");
        IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/SmartBlog.js");
        IncludeCss("SmartBlogCss", "/Modules/SmartBlog/css/Paging.css");
        IncludeCss("SmartBlogCss", "/Modules/SmartBlog/css/Module.css");
        IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/Paging.js");
        IncludeJs("MenuManager", false, "/Administrator/Templates/Default/js/ajaxupload.js", "/js/jquery.validate.js");
        IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/jquery.alerts.js");

       
        string appPath = Request.ApplicationPath != "/" ? Request.ApplicationPath : "";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SmartBlog1", " var SageFrameAppPath='" + appPath + "';", true);
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string file = HostingEnvironment.ApplicationPhysicalPath + this.fuBlogFile.FileName;
            this.fuBlogFile.SaveAs(file);

            switch(rblSource.SelectedValue)
            {
                case "w":
                    WebXMLReader.FetchXmlFromWordPress(file);
                    break;
                case "b":
                    WebXMLReader.FetchXmlFromBlogger(file);
                   break;

            }
            lblUploadMsg.Text = "Imported File Successfully";
        }
        catch (Exception ex)
        {
            lblUploadMsg.Text = "Error in uploading";
        }
    }

}
