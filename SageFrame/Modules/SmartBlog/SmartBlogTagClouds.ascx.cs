﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SageFrame.Web;

public partial class Modules_SmartBlog_SmartBlogTagClouds : BaseAdministrationUserControl
{
    public string RedirectUrl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        IncludeJs("SmartBlog", "/Modules/SmartBlog/JS/TagCloud.js");


    }



}
