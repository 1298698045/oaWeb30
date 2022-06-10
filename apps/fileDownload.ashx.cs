﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebClient.apps
{
    /// <summary>
    /// Summary description for fileDownload
    /// </summary>
    public class fileDownload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}