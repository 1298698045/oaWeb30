using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OA.Web.UI;
using Supermore;
using Supermore.Web;
using Supermore.Configuration;

namespace WebClient.UIControls
{
    public partial class TopNav : System.Web.UI.UserControl
    {
        string appItems = "";
        string _currentAppCode = "";
        string _currentAppName = "";
        string appHomeName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["pageName"] != null)
            {
                appHomeName = Request["pageName"];
                WebUtil.SetCookieValue("oa_home_page", appHomeName);
                WebUtil.SetSessionValue("oa_home_page", appHomeName);
            }
            if (Request["tsid"] != null)
            {
                _currentAppCode = Request["tsid"];
                WebContext.AppCode = _currentAppCode;
                //WebUtil.SetSessionValue("_currentAppCode", _currentAppCode);
                if (!string.IsNullOrEmpty(appHomeName))
                    WebUtil.SetCookieValue("oa_home_url_" + appHomeName, Request.RawUrl);
            }
            else
            {
                this._currentAppCode = WebContext.AppCode;
                this._currentAppName = WebUtil.GetCookieValue("_currentAppName");
            }
            if (string.IsNullOrEmpty(this._currentAppCode))
            {
                this._currentAppCode = Supermore.Configuration.Settings.GetSetting("DefaultApp");
            }
           
            int i = 0;
            List<SystemAppItem> items = null;
            string homeURL = "";
            object obj = AppWebCache.Get("app_menu_systems");
            if (obj == null)
            {
                AppWebCache.Insert("app_menu_systems", items);
                string appSystemName = Settings.GetSetting("Application.System");
                if (string.IsNullOrEmpty(appSystemName))
                    appSystemName = "oa";
                items = SystemAppTabs.GetSubSystemApps(appSystemName);
                //items = SystemAppTabs.GetApps(Supermore.WebContext.OrganizationId);
            }
            foreach (SystemAppItem item in items)
            {
                if (item.AppCode == this._currentAppCode)
                {
                    _currentAppCode = item.AppCode;
                    _currentAppName = item.Label;
                    WebContext.AppCode = item.AppCode;
                    WebUtil.SetCookieValue("_currentAppName", item.Label);

                    AppWebCache.Insert("app_" + _currentAppCode, item);

                    continue;
                }
                if (i == 0)
                {
                    if (string.IsNullOrEmpty(item.LinkUrl))
                        appItems += string.Format("<a href='/home/home.aspx?tsid={0}&pageName={1}' class='menuButtonMenuLink firstMenuItem'>{2}</a>", item.AppCode, item.Name, item.Label);
                    else
                    {

                        if (item.LinkUrl.IndexOf("?") > -1)
                        {
                            homeURL = item.LinkUrl + "&pageName=" + item.Name;
                        }
                        else
                            homeURL = item.LinkUrl + "?pageName=" + item.Name;

                        appItems += string.Format("<a href='{0}' class='menuButtonMenuLink'>{1}</a>", homeURL, item.Label);
                    }
                }
                else
                {
                    if (string.IsNullOrEmpty(item.LinkUrl))
                        appItems += string.Format("<a href='/home/home.aspx?tsid={0}&pageName={1}' class='menuButtonMenuLink'>{2}</a>", item.AppCode, item.Name, item.Label);
                    else
                    {

                        if (item.LinkUrl.IndexOf("?") > -1)
                        {
                            homeURL = item.LinkUrl + "&pageName=" + item.Name;// +"&tsid="+ item.AppCode;
                        }
                        else
                            homeURL = item.LinkUrl + "?pageName=" + item.Name;// + "&tsid=" + item.AppCode;

                        appItems += string.Format("<a href='{0}' class='menuButtonMenuLink'>{1}</a>", homeURL, item.Label);
                    }
                }
                i++;
            }

            if (string.IsNullOrEmpty(this._currentAppCode))
            {
                if (items.Count > 0)
                {
                    SystemAppItem item = items[0];
                    WebContext.AppCode = item.AppCode;
                    WebUtil.SetCookieValue("_currentAppName", item.Label);
                }
            }

        }

        public string ScreenName
        {
            get
            {
                return Supermore.WebContext.UserFullName;
            }
        }
        public bool IsAdmin
        {
            get { return WebContext.IsAdministrator; }
        }
        public string AppItems
        {
            get
            {
                return appItems;
            }
        }
        public string CurrentAppName
        {
            get
            {
                //this._currentAppCode = WebUtil.GetCookieValue("_currentAppCode");
                //this._currentAppName = WebUtil.GetCookieValue("_currentAppName");
                return _currentAppName;
            }
        }
    }
}