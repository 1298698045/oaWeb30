using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using OA.Web.UI;
using Supermore.Web;
namespace WebClient.UIControls
{
    public partial class TopNavNoMain : System.Web.UI.UserControl
    {
        string appItems = "";
        string _currentAppCode = "";
        string _currentAppName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["tsid"] != null)
                {
                    _currentAppCode = Request["tsid"];
                }
                else
                {
                    this._currentAppCode = WebUtil.GetCookieValue("_currentAppCode");
                    this._currentAppName = WebUtil.GetCookieValue("_currentAppName");
                }
                int i = 0;
                List<SystemAppItem> items = SystemAppTabs.GetApps();
                foreach (SystemAppItem item in items)
                {
                    if (item.AppCode == this._currentAppCode)
                    {
                        _currentAppCode = item.AppCode;
                        _currentAppName = item.Label;
                        WebUtil.SetCookieValue("_currentAppCode", item.AppCode);
                        WebUtil.SetCookieValue("_currentAppName", item.Label);
                        continue;
                    }
                    if (i == 0)
                        appItems += string.Format("<a href='/home/home.aspx?tsid={0}' class='menuButtonMenuLink firstMenuItem'>{1}</a>", item.AppCode, item.Label);
                    else
                        appItems += string.Format("<a href='/home/home.aspx?tsid={0}' class='menuButtonMenuLink'>{1}</a>", item.AppCode, item.Label);
                    i++;
                }

                if (string.IsNullOrEmpty(this._currentAppCode))
                {
                    SystemAppItem item = items[0];
                    WebUtil.SetCookieValue("_currentAppCode", item.AppCode);
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