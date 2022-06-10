using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iWebOffice.ocx.c.net;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;


namespace WebClient.layouteditor
{
    public partial class docLayoutEditor : System.Web.UI.Page
    {
        public string mHttpUrl;
        public string mScriptName;
        public string mServerName;
        public string mServerUrl;
        public string mRecordID = "";
        CallContext caller = null;
        string formId = "";
        public iDBManage2000 DBAobj;

        protected void Page_Load(object sender, EventArgs e)
        {
            formId = Request["id"];
            mRecordID = formId;
            try
            {
                caller = AppDataSource.GetCallContext();
                mScriptName = "DocEditor.aspx";
                mServerName = "/apps/files/officeServer.aspx";
                int hostPort = Request.Url.Port;
                if (hostPort == 80)
                {
                    mHttpUrl = "http://" + Request.ServerVariables["HTTP_HOST"];
                }
                else
                {
                    string hostName = Request.ServerVariables["HTTP_HOST"];
                    // mHttpUrl = string.Format("http://{0}:{1}", Request.ServerVariables["HTTP_HOST"], hostPort);
                    if (hostName.IndexOf(':') > -1)
                        mHttpUrl = "http://" + Request.ServerVariables["HTTP_HOST"];
                    else
                        mHttpUrl = string.Format("http://{0}:{1}", Request.ServerVariables["HTTP_HOST"], hostPort);
                }
                string remoteAddr = Request.ServerVariables["REMOTE_ADDR"];
                string reverseProxyLocalIP = Settings.GetSetting("SiteRoot.ReverseProxy.LocalIP"); //内网反向代理服务器IP
                string reverseProxyProxyIP = Settings.GetSetting("SiteRoot.ReverseProxy.ProxyIP");
                if (MainUtil2.IsProxySet())
                {
                    if (remoteAddr == reverseProxyLocalIP) //反向代理用反向代理的服务器地址
                    {
                        mHttpUrl = Settings.GetSetting("SiteRoot.Proxy") + Request.ServerVariables["SCRIPT_NAME"];
                    }
                    else
                    {
                        /*http://:9005
                         12 - 4
                         */
                        string host = Request.ServerVariables["HTTP_HOST"];
                        string port = Request.Url.Port.ToString();
                        string port1 = host.Substring(host.Length - port.Length);
                        if (port == port1)
                            mHttpUrl = string.Format("http://{0}", host);
                        else
                            mHttpUrl = string.Format("http://{0}:{1}", host, port);
                        //mHttpUrl = string.Format("http://{0}:{1}{2}", Request.ServerVariables["HTTP_HOST"], Request.Url.Port, Request.ServerVariables["SCRIPT_NAME"]);
                    }
                    Supermore.Diagnostics.Trace.LogError(mHttpUrl);
                    //Supermore.Diagnostics.Trace.LogTest(string.Format("REMOTE_ADDR:{0},reverseProxyLocalIP:{1}", remoteAddr, reverseProxyLocalIP));
                }
                //else
                //{
                //    mHttpUrl = "http://" + Request.ServerVariables["HTTP_HOST"] + Request.ServerVariables["SCRIPT_NAME"];
                //}
                //mHttpUrl = mHttpUrl.Substring(0, mHttpUrl.Length - mScriptName.Length);
                mServerUrl = mHttpUrl + mServerName;        //取得OfficeServer文件的完整URL

                GetForm();
                GetFields();

                DBAobj = new iDBManage2000();
                DBAobj.Open();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        public void GetFields()
        {
            StringBuilder sb = new StringBuilder();
            string sql = "SELECT * FROM Attribute WHERE EntityId='{0}' AND (IsCustomField=1 OR IsNameField=1 )ORDER BY ColumnNumber";
            sql = string.Format(sql, EntityTemplateId);
            EntityCollection entities = EntityManager.GetEntities(caller, EntityTemplateIDs.Attribute, sql);

            foreach (Entity entity in entities)
            {
                sb.AppendFormat("<option value='f:{0}'>{1}</option>", entity.ID, entity.Fields["DisplayName"].Value);
            }

            //get detail entity
            sql = "SELECT EntityId,Name,DisplayName FROM Entity WHERE MasterEntityId='{0}'  ";
            sql = string.Format(sql, EntityTemplateId);
            entities = EntityManager.GetEntities(caller, EntityTemplateIDs.Entity, sql);
            foreach (Entity entity in entities)
            {
                sb.AppendFormat("<option value='t:{0}'>{1}</option>", entity.ID, entity.Fields["DisplayName"].Value);
            }

            FieldOptions = sb.ToString();
        }
        public void GetForm()
        {
            Entity entity = EntityManager.GetEntity(caller, EntityTemplateIDs.EntityForm, new Guid(formId));
            this.FormTitle = entity.Name;
            this.EntityTemplateId = StringUtil.GetString(entity.Fields["EntityId"].Value);
        }
        void SaveEntity()
        {

        }
        public string FormId { get { return formId; } set { formId = value; } }
        public string FormTitle { get; set; }
        public string EntityTemplateId { get; set; }
        public string FieldOptions { get; set; }
    }
}