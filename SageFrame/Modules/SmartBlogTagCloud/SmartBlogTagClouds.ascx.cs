using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;
using SageFrame.SmartBlog;
using System.Text;

public partial class Modules_SmartBlog_SmartBlogTagClouds : BaseAdministrationUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/TagCloud.js");
        GetPostTags();
    }

    public void GetPostTags()
    {
        List<SmartBlogInfo> objblogList = SmartBlogController.GetPostTag();

        //Randomize code here

        //int length = objblogList.Count;
        //List<SmartBlogInfo> objblogLists = new List<SmartBlogInfo>(length);
        //for (int i = 0; i < length; i++)
        //{
        //    Random ran = new Random();
        //    int index = ran.Next(0, length - 1);
        //    objblogLists.Add(objblogList[index]);
        //}


        StringBuilder html = new StringBuilder();
        html.Append("<ul id='tagList'>");
        foreach (SmartBlogInfo obj in objblogList)
        {
            string pathname = Request.Url.GetLeftPart(UriPartial.Path).ToString() + "?Tag=" + obj.TagName;
            html.Append("<li><a title='See all pages tagged with" + obj.TagName + "' href='" + pathname + "'>" + obj.TagName + "</a></li>");
        }
        html.Append("</ul>");
        lrtTagCloud.Text = html.ToString();
    }
}
