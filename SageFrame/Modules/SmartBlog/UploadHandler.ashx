﻿<%@ WebHandler Language="C#" Class="UploadHandler" %>
using System.Collections.Generic;
using System;
using System.Drawing;
using System.Web;
using System.IO;
using SageFrame.Web;


public class UploadHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        bool isValidFile = false;
        string validExtension = string.Empty;
        string retFilePath = string.Empty;
        string retMsg = "fail";
        string strBaseLocation = "Modules/SmartBlog/SummaryIcon/TempImage/";
        string strDestLocation = "Modules/SmartBlog/SummaryIcon/";
        string filename = string.Empty;
        HttpRequest Request = HttpContext.Current.Request;
        string[] allowExtensions = new string[] { "jpg","JPEG", "gif", "bmp","png" };

        if (Request.Files != null)
        {
            HttpFileCollection files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];                
                if (file.ContentLength > 0)
                {
                    if (allowExtensions.Length > 0)
                    {
                        if (IsValidExtension(allowExtensions, GetExtension(file.FileName.ToLower())))
                        {
                            isValidFile = true;
                            retMsg = "Valid file Extension";
                        }
                        else
                        {
                            retMsg = "Not valid file Extension";
                        }
                    }
                    else
                    {
                        isValidFile = true;
                    }
                    if (isValidFile)
                    {
                        filename = Path.GetFileName(file.FileName.Replace(" ","_"));                      
                        retFilePath = strBaseLocation;
                        strBaseLocation = HttpContext.Current.Server.MapPath("~/" + strBaseLocation);
                        strDestLocation = HttpContext.Current.Server.MapPath("~/" + strDestLocation);
                        string srcRoot = strBaseLocation + filename;
                        string desRoot = strDestLocation + filename;

                        if (Directory.Exists(strBaseLocation))
                        {
                            string[] Icons = Directory.GetFiles(strBaseLocation);
                            foreach (string SummaryIcon in Icons)
                            {
                                File.SetAttributes(SummaryIcon, System.IO.FileAttributes.Normal);
                                File.Delete(SummaryIcon);
                            }
                            Directory.Delete(strBaseLocation, true);
                        }            
                        

                        if (!Directory.Exists(strBaseLocation))
                        {
                            Directory.CreateDirectory(strBaseLocation);
                        }
                        if (!Directory.Exists(strDestLocation))
                        {
                            Directory.CreateDirectory(strDestLocation);
                        }
                        
                        string filePath = strBaseLocation + filename;
                        retFilePath = retFilePath + filename;
                        file.SaveAs(filePath);
                        retMsg = "filePath=" + retFilePath;
                        PictureManager.CreateThmnail(srcRoot, 150, desRoot);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(retMsg);
        
                      
                    }
                }

            }
        }
    }
   
    
    private string GetExtension(string fileName)
    {
        int index = fileName.LastIndexOf('.') ;
        string ext = fileName.Substring(index + 1, (fileName.Length - index)-1);
        return ext;
    }

    public bool IsValidExtension(string[] array,string ext) {

        bool found = false;    
    foreach (string s in array)    
    {
        if (s.Equals(ext))        
        {            
            found =true;            
            break;        
        }    
    } 
        return found; 
    
    }
    private bool callback()
    {
        return true;
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }
    
  
 }   