using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text.RegularExpressions;

using Supermore;
using Supermore.Data;
using Supermore.IO;
using Supermore.Security.SecurityControl;
using Supermore.Xml;
using Supermore.Web;

using OA.Web.UI;
using Supermore.Configuration;
//using Youyou.Apps;
namespace WebClient.UIControls
{
    public partial class MainNav : System.Web.UI.UserControl
    {
        string _currentAppCode = "";
        string currentEntityType = "";
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            if (caller == null)
            {
                return;
            }
            if (Request["pageName"] != null)
            {
                WebUtil.SetCookieValue("oa_home_page", Request["pageName"]);
                WebUtil.SetSessionValue("oa_home_page", Request["pageName"]);
            }
            currentEntityType = Request["t"];
            if (!string.IsNullOrEmpty(currentEntityType))
            {
                if (!AuthorizationManager.TabIsAllowed(caller, currentEntityType, new Guid(caller.UserID)))
                {
                    // Response.Redirect("/home/home.aspx?t=home");
                    Supermore.Diagnostics.Trace.LogToFile(string.Format("tab:{0},{1},{2},Reject", currentEntityType, caller.FullName, caller.UserID), "accesstab.txt");
                }
            }
            LoadDbItems();
        }
        void LoadDbItems()
        {
            if (Request["tsid"] != null)
            {
                _currentAppCode = Request["tsid"];
                 WebContext.AppCode= _currentAppCode;
            }
            else
            {
                this._currentAppCode = WebContext.AppCode;
            }
            List<SystemAppTab> tabs = null;
            object appTabs = AppWebCache.Get(this._currentAppCode);
            if (appTabs != null)
            {
                tabs = (List<SystemAppTab>)appTabs;
            }
            else
            {
                tabs = SystemAppTabs.GetAppTabs(this._currentAppCode);
                AppWebCache.Max(this._currentAppCode, tabs);
            }
            string version = GetBrowser();
            StringBuilder sb = new StringBuilder();

            if (caller == null)
            {
                //   //string custId = Request["customerid"];
                Supermore.Diagnostics.Trace.LogTest("Home Caller is null");
                return;
            }
            Guid userId = new Guid(caller.UserID);

            bool enableGlobalNavigator = Settings.GetBoolSetting("UI.EnableGlobalNavigator", false);

            if (enableGlobalNavigator)
            {
                string temp = "<li id=\"mainMenu\" class=\"\"><a title=\"主导航菜单\" href=\"#\">{0}";
                sb.AppendFormat(temp, "<img title=\"主导航菜单\" style=\"margin-top:5px;margin-right:3px;vertical-align: middle;\" src=\"/img/icon/hf4.png\" border=\"0\"/></a>");
                //laod menu
                string mainNavs = "";
                if (WebContext.IsAdministrator)
                {
                    mainNavs = FileUtil.ReadFromFile(Server.MapPath("/_ui/_pageBlockTemplate/MainTopNav.htm"));
                }
                else
                {
                    mainNavs = FileUtil.ReadFromFile(Server.MapPath("/_ui/_pageBlockTemplate/menu/user_menus.html"));
                }
                sb.Append(mainNavs);
                sb.Append("</li>");
            }
            //home
            string selectedCss = "topTabMenuItem active";
            string home = "<li class=\"{0}\"><a href=\"{1}\">{2}</a></li>";

            if (version.IndexOf("Chrome") > -1)
            {
                selectedCss = "topTabMenuItem  active";
                home = " <li class=\"{0}\"><a href=\"{1}\">{2}</a></li>";
            }
            string css = "topTabMenuItem  ";
            string appHomePageWidget = WebUtil.GetCookieValue("oa_home_page");

            string homeUrl = "";
            if (!string.IsNullOrEmpty(appHomePageWidget))
                homeUrl = WebUtil.GetCookieValue("oa_home_url_" + appHomePageWidget);
            if (string.IsNullOrEmpty(homeUrl))
            {
                homeUrl = Settings.GetSetting("Page.home");
                if (string.IsNullOrEmpty(homeUrl))
                {
                    homeUrl = "/home/home.aspx";
                }
            }
            Regex reg = new Regex(homeUrl);
            bool isMatch = reg.IsMatch(this.Request.RawUrl);

            if (currentEntityType == "home" || isMatch)
            {
                css = selectedCss;
            }

            if (homeUrl.IndexOf("pageName", StringComparison.InvariantCultureIgnoreCase) == -1)
            {

                if (homeUrl.IndexOf("?") > -1)
                    homeUrl += "&pageName=" + appHomePageWidget;
                else
                    homeUrl += "?pageName=" + appHomePageWidget;
            }

            sb.AppendFormat(home, css, homeUrl, "主页");


            string nav_templateName = "NAV";
            if (version == "IE8.0" || version == "IE9.0" || version == "IE7.0")
            {
                string ieVersion = "";
                if (version.IndexOf("IE8", StringComparison.InvariantCultureIgnoreCase) > -1)
                {
                    ieVersion = "IE8";
                }
                else if (version.IndexOf("IE9", StringComparison.InvariantCultureIgnoreCase) > -1)
                {
                    ieVersion = "IE9";
                }
                else if (version.IndexOf("IE7", StringComparison.InvariantCultureIgnoreCase) > -1)
                {
                    ieVersion = "IE7";
                }
                Session["Skin_BrowserName"] = ieVersion;
                nav_templateName = "NAV_IE8";
                foreach (SystemAppTab node in tabs)
                {
                    if (AuthorizationManager.TabIsAllowed(caller, node.Name, userId))
                        sb.Append(RenderIE8AppTab(node));
                }
            }
            else
            {

                if (version.IndexOf("Chrome") > -1 || version == "IE7.0")
                {
                    Session["Skin_BrowserName"] = "gc";
                    nav_templateName = "chrome";
                }
                else
                    Session["Skin_BrowserName"] = "base";
                foreach (SystemAppTab node in tabs)
                {
                    if (AuthorizationManager.TabIsAllowed(caller, node.Name, userId))
                        sb.Append(RenderAppTab2(node));
                }
            }
            string navData = sb.ToString();
            nav_templateName = "NAV2";
            LoadNavTemplate(nav_templateName, navData);

        }
        string RenderAppTab2(SystemAppTab tab)
        {
            string str = "";
            string temp = " <li class=\"topTabMenuItem {2}\">  <a href=\"{0}\">{1}</a> </li>";
            string selectedCss = " active";
            string id = tab.Name;
            string label = tab.Label;
            string css = "";
            string link = tab.LinkUrl;
            string pattern = "(*.)" + tab.TabCode + "(*.)";
            pattern = tab.LinkUrl;
            bool isMatch = false;
            if (!string.IsNullOrEmpty(currentEntityType))
                isMatch = currentEntityType.Equals(tab.TabCode, StringComparison.InvariantCultureIgnoreCase);
            if (isMatch)
                css = selectedCss;
            else
            {
                Regex reg = new Regex("/home/home.aspx");
                isMatch = reg.IsMatch(this.Request.RawUrl);
                if (isMatch && reg.IsMatch(tab.LinkUrl))
                    css = selectedCss;
            }
            str = string.Format(temp, link, label, css);
            return str;
        }
        string RenderAppTab(SystemAppTab tab)
        {
            string firstClass = "zen-firstItem";
            //string firstClass = "zen-firstItem";
            string str = "";
            //string link = "<li class=\"{5}\"><a id=\"{0}\" href=\"{1}\" class=\"{2}\" onclick=\"{3}\" >{4}</a></li>";
            //<img style=\" margin-left: 3px;left: 0;position: absolute;\" src=\"/img/icon/home16.png\" border=\"0\"/>
            string temp = "<li id=\"{0}_Tab\" class=\"{3}\"><a title=\"{1}选项卡\" href=\"{2}\">{1}</a></li>";
            //<Module Id="WFTask" Label="事务办理" LinkUrl="/apps/wf/default.aspx" Class="zen-firstItem"></Module>
            string selectedCss = "brandPrimaryBgr zen-active primaryPalette";

            string id = tab.Name;
            string label = tab.Label;
            string css = "";
            string link = tab.LinkUrl;
            string pattern = "(*.)" + tab.TabCode + "(*.)";
            pattern = tab.LinkUrl;
            //System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(pattern,RegexOptions.IgnoreCase);
            //bool isMatch = regex.IsMatch(Request.RawUrl);
            bool isMatch = false;
            if (!string.IsNullOrEmpty(currentEntityType))
                isMatch = currentEntityType.Equals(tab.TabCode, StringComparison.InvariantCultureIgnoreCase);
            if (isMatch)
                css = selectedCss;
            else
            {
                //if (!string.IsNullOrEmpty(currentEntityType))
                //{
                Regex reg = new Regex("/home/home.aspx");
                isMatch = reg.IsMatch(this.Request.RawUrl);
                if (isMatch && reg.IsMatch(tab.LinkUrl))
                    css = selectedCss;
                // }
            }
            str = string.Format(temp, id, label, link, css);
            return str;
        }
        string RenderIE8AppTab(SystemAppTab tab)
        {
            //<li id="Chatter_Tab"><a title="Chatter选项卡" href="/_ui/core/chatter/ui/ChatterPage">Chatter</a>
            //        <div class="zen-tabCornerRight"></div>
            //    </li>
            string firstClass = "zen-firstItem";
            //string firstClass = "zen-firstItem";
            string str = "";
            //string link = "<li class=\"{5}\"><a id=\"{0}\" href=\"{1}\" class=\"{2}\" onclick=\"{3}\" >{4}</a></li>";
            //<img style=\" margin-left: 3px;left: 0;position: absolute;\" src=\"/img/icon/home16.png\" border=\"0\"/>
            string temp = "<li id=\"{0}_Tab\" class=\"{3}\"><a title=\"{1}选项卡\" href=\"{2}\">{1}</a><div class=\"zen-tabCornerRight\"></div></li>";
            //<Module Id="WFTask" Label="事务办理" LinkUrl="/apps/wf/default.aspx" Class="zen-firstItem"></Module>
            string selectedCss = "zen-active brandPrimaryBgr primaryPalette";

            string id = tab.Name;
            string label = tab.Label;
            string css = "";
            string link = tab.LinkUrl;
            string pattern = "(*.)" + tab.TabCode + "(*.)";
            pattern = tab.LinkUrl;
            //System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(pattern,RegexOptions.IgnoreCase);
            //bool isMatch = regex.IsMatch(Request.RawUrl);
            bool isMatch = false;
            if (!string.IsNullOrEmpty(currentEntityType))
                isMatch = currentEntityType.Equals(tab.TabCode, StringComparison.InvariantCultureIgnoreCase);
            if (isMatch)
                css = selectedCss;
            else
            {
                //if (!string.IsNullOrEmpty(currentEntityType))
                //{
                Regex reg = new Regex("/home/home.aspx");
                isMatch = reg.IsMatch(this.Request.RawUrl);
                if (isMatch && reg.IsMatch(tab.LinkUrl))
                    css = selectedCss;
                // }
            }
            str = string.Format(temp, id, label, link, css);
            return str;
        }
        /// <summary>
        /// Render 360兼容模式
        /// </summary>
        /// <param name="tab"></param>
        /// <returns></returns>
        string RenderChromeAppTab(SystemAppTab tab)
        {

            string firstClass = "zen-firstItem";
            //string firstClass = "zen-firstItem";
            string str = "";
            string temp = "<li id=\"{0}_Tab\" class=\"{3}\"><a title=\"{1}选项卡\" href=\"{2}\">{1}</a><div class=\"zen-tabCornerRight\"></div></li>";
            string selectedCss = "zen-active brandPrimaryBgr primaryPalette";
            
            string id = tab.Name;
            string label = tab.Label;
            string css = "";
            string link = tab.LinkUrl;
            string pattern = "(*.)" + tab.TabCode + "(*.)";
            pattern = tab.LinkUrl;
            bool isMatch = false;
            if (!string.IsNullOrEmpty(currentEntityType))
                isMatch = currentEntityType.Equals(tab.TabCode, StringComparison.InvariantCultureIgnoreCase);
            if (isMatch)
            {
                css = selectedCss;
            }
            else
            {
                Regex reg = new Regex("/home/home.aspx");
                isMatch = reg.IsMatch(this.Request.RawUrl);
                if (isMatch && reg.IsMatch(tab.LinkUrl))
                    css = selectedCss;
            }
            str = string.Format(temp, id, label, link, css);
            return str;
        }
        void LoadXmlItems()
        {
            string currentTab = Request["tab"];
            if (!string.IsNullOrEmpty(currentTab))
            {
                Supermore.Web.WebUtil.SetSessionValue("currentTab", currentTab);
            }
            string filePath = HttpContext.Current.Server.MapPath("/App_Data/Apps.xml");
            XmlDocument xmlDoc = XmlUtil.LoadXmlFile(filePath);
            LoadApps(xmlDoc);
        }
        void LoadApps(XmlDocument xmlDoc)
        {
            string str = "";
            XmlNode root = xmlDoc.SelectSingleNode("Apps/App[@id='wf']");
            foreach (XmlNode node in root.ChildNodes)
            {
                str += RenderChildMenuItem(node);
            }
            NavHTML = str;
        }
        public string GetCurrentTab()
        {
            return Supermore.Web.WebUtil.GetSessionString("currentTab");
        }
        public static string GetBrowser()
        {
            HttpBrowserCapabilities bc = HttpContext.Current.Request.Browser;
            string browserName = bc.Browser + bc.Version;
            return browserName;
        }
        public string NavHTML = "";
        string RenderChildMenuItem(XmlNode node)
        {
            string firstClass = "zen-firstItem";
            //string firstClass = "zen-firstItem";
            string str = "";
            //string link = "<li class=\"{5}\"><a id=\"{0}\" href=\"{1}\" class=\"{2}\" onclick=\"{3}\" >{4}</a></li>";
            string temp = "<li id=\"{0}\" class=\"{3}\"><a title=\"{1}选项卡\" href=\"{2}\">{1}</a></li>";
            //<Module Id="WFTask" Label="事务办理" LinkUrl="/apps/wf/default.aspx" Class="zen-firstItem"></Module>
            string selectedCss = "brandPrimaryBgr zen-active primaryPalette";

            string id = XmlUtil.GetAttribute("Id", node);
            string label = XmlUtil.GetAttribute("Label", node);
            string css = XmlUtil.GetAttribute("Class", node);
            string link = XmlUtil.GetAttribute("LinkUrl", node);

            if (id == GetCurrentTab())
                css = selectedCss;
            str = string.Format(temp, id, label, link, css);
            return str;        
        }

        void LoadNavTemplate(string templateName, string navData)
        {
            //string version = GetBrowser();
            //if (version == "IE8.0" || version == "IE9.0")
            string _resultHTML = "";
            HttpContext _httpContext = HttpContext.Current;
            string path = "";
            //path = _httpContext.Request.MapPath("/UIControls/NAV_IE8.html");

            path = _httpContext.Request.MapPath(string.Format("/UIControls/{0}.html", templateName));

            string _wrappHTML = FileUtil.ReadFromFile(path);
            string regClass = @"{![^}]*}";
            Regex r = new Regex(regClass, RegexOptions.IgnoreCase);
            _resultHTML = SharedUtil.ReplaceTagsByRegex(_wrappHTML, r, (string matchValue) =>
            {
                //string meidiaOrigPath = matchValue;
                string tag = matchValue.Substring(2, matchValue.Length - 3);
                string str = "";
                if (tag == "NavData")
                {
                    return navData;
                }
                return str;
            });

            this.NavHTML = _resultHTML;

        }

        public string BrowserName
        {
            set { Session["Skin_BrowserName"] = value; }
        }
    }
}