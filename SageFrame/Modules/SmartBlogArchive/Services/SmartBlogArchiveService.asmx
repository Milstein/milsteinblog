<%@ WebService Language="C#"  Class="SmartBlogArchiveService" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SageFrame.SmartBlog;

/// <summary>
/// Summary description for SmartBlogArchiveService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class SmartBlogArchiveService : System.Web.Services.WebService {

    public SmartBlogArchiveService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    
    [WebMethod]    
    public List<SmartBlogInfo> SmartBlogGetArchive()
    {
        try
        {
            List<SmartBlogInfo> objArchive = SmartBlogController.SmartBlogGetArchives();
            //List<SmartBlogInfo> objDisplayArchives = objArchive.Count > 10 ? objArchive.GetRange(0, 10) : objArchive.GetRange(0, objArchive.Count);
            return objArchive;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}

