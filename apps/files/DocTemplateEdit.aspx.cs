using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iWebOffice.ocx.c.net;

using Supermore;
using Supermore.Configuration;
using Supermore.Files;
using Supermore.Data.DataProviders;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;



namespace WebClient.apps.files
{
    public partial class DocTemplateEdit : System.Web.UI.Page
    {
        string instanceId = "";
        Supermore.CallContext caller;
        public string PageTitle;

        // 在此处放置用户代码以初始化页面

        public string mDescript;
        public string mFileName;
        public string mFileDate;
        public string mIsPublic;
        public string mDisabled;

        public string mHttpUrl;
        public string mScriptName;
        public string mServerName;
        public string mServerUrl;


        public string mRecordID;
        public string mTemplate;
        public string mFileType;
        public string mEditType;
        public string mUserName;
        public iDBManage2000 DBAobj;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 在此处放置用户代码以初始化页面
            DBAobj = new iDBManage2000();
            DBAobj.Open();


            mDisabled = "";
            mScriptName = "DocTemplateEdit.aspx";
            mServerName = "officeServer.aspx";
            //mHttpUrl = "http://" + Request.ServerVariables["HTTP_HOST"] + Request.ServerVariables["SCRIPT_NAME"];
            string remoteAddr = Request.ServerVariables["REMOTE_ADDR"];
            string reverseProxyLocalIP = Settings.GetSetting("SiteRoot.ReverseProxy.LocalIP"); //内网反向代理服务器IP
            string reverseProxyProxyIP = Settings.GetSetting("SiteRoot.ReverseProxy.ProxyIP");
            if (MainUtil2.IsProxySet())
            {
                if (remoteAddr == reverseProxyLocalIP) //反向代理 用反向代理的服务器地址
                {
                    mHttpUrl = Settings.GetSetting("SiteRoot.Proxy") + Request.ServerVariables["SCRIPT_NAME"];
                }
                else
                {                 
                    mHttpUrl = string.Format("http://{0}:{1}{2}", Request.ServerVariables["HTTP_HOST"], Request.Url.Port, Request.ServerVariables["SCRIPT_NAME"]);
                }
            }
            else
            {
                if (Request.Url.Port != 80)
                {
                    int pos = -1;
                    string url = Request.Url.ToString();
                    pos = url.IndexOf('?');
                    mHttpUrl = url.Substring(0, pos);
                    //mHttpUrl = string.Format("http://{0}:{1}{2}", Request.ServerVariables["HTTP_HOST"], Request.Url.Port, Request.ServerVariables["SCRIPT_NAME"]);
                }
                else
                    mHttpUrl = "http://" + Request.ServerVariables["HTTP_HOST"] + Request.ServerVariables["SCRIPT_NAME"];
            }

            mHttpUrl = mHttpUrl.Substring(0, mHttpUrl.Length - mScriptName.Length);
            mServerUrl = mHttpUrl + mServerName;

            Supermore.Diagnostics.Trace.LogError("DocTemplate Edit Http Url:" + mServerUrl);

            if (Request["OrganizationId"] != null)
            {
                if (mServerUrl.IndexOf("?") > -1)
                    mServerUrl += "&OrganizationId=" + Request["OrganizationId"];
                else
                    mServerUrl += "?OrganizationId=" + Request["OrganizationId"];
            }
            else
            {
                caller = AppDataSource.GetCallContext();
                mServerUrl += "?OrganizationId=" + caller.OrganizationId;
            }

            mRecordID = Request.QueryString["RecordID"];
            mTemplate = Request.QueryString["Template"];
            mFileType = Request.QueryString["FileType"];
            mEditType = Request.QueryString["EditType"];
            mUserName = Request.QueryString["UserName"];

            //取得编号
            if (mRecordID == null)
            {
                mRecordID = "";	//编号为空
            }
            //取得模式
            if (mEditType == null)
            {
                mEditType = "1";		// 1 起草
            }
            //取得类型
            if (mFileType == null)
            {
                mFileType = ".doc";	// 默认为.doc文档
            }
            //取得用户名
            if (mUserName == null)
            {
                #region new
                caller = AppDataSource.GetCallContext();
                try
                {
                    mUserName = caller.UserName;
                }
                catch
                { }
                #endregion
            }

            //取得模板
            if (mTemplate == null)
            {
                mTemplate = "";	// 默认没有模板
            }

            //打开数据库

            string strSelectCmd = "Select * From Template_File Where RecordID='" + mRecordID + "'";
            SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            SqlDataReader mReader = mCommand.ExecuteReader();
            if (mReader.Read())
            {
                mRecordID = mReader["RecordID"].ToString();
                mFileName = mReader["FileName"].ToString();
                mFileType = mReader["FileType"].ToString();
                mDescript = mReader["Descript"].ToString();
                mIsPublic = mReader["IsPublic"].ToString();
                PageTitle = mFileName;
            }
            else
            {
                System.DateTime SystemTime;
                SystemTime = DateTime.Now;
                mRecordID = SystemTime.ToString("yyyyMMddhhmmss");
                mFileName = "文档模板.doc";               
                mDescript = "";
            }
            mReader.Close();

            if (mEditType.CompareTo("0") == 0)
            {
                mDisabled = "disabled";
            }
            else
            {
                mDisabled = "";
            }

            //mFileName = mRecordID + mFileType;

            DBAobj.Close();
        }
        public bool IsIE()
        {
            return MainUtil2.IsIEBrowser();
        }
    }
}