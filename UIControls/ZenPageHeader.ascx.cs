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
//using Youyou.Apps;
using OA.Web.UI;

namespace WebClient.UIControls
{
    public partial class ZenPageHeader : System.Web.UI.UserControl
    {
       
        string currentEntityType = "";
        string appItems = "";
        string _currentAppCode = "";
        string _currentAppName = "";
        public string NavHTML = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            currentEntityType = Request["t"];
            LoadModules();
            LoadDbItems();
        }
        void LoadModules()
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
            if (string.IsNullOrEmpty(this._currentAppCode))
            {
                this._currentAppCode = "02u90000001";
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
                if (items.Count > 0)
                {
                    SystemAppItem item = items[0];
                    WebUtil.SetCookieValue("_currentAppCode", item.AppCode);
                    WebUtil.SetCookieValue("_currentAppName", item.Label);
                }
            }
        }
        void LoadDbItems()
        {
            if (Request["tsid"] != null)
            {
                _currentAppCode = Request["tsid"];
            }
            else
            {
                this._currentAppCode = WebUtil.GetCookieValue("_currentAppCode");
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
            //string str = "";
            StringBuilder sb = new StringBuilder();
            CallContext caller = AppDataSource.GetCallContext();
            Guid userId = new Guid(caller.UserID);

            //string temp = "<li id=\"mainMenu\" class=\"\"><a title=\"主导航菜单\" href=\"#\">{0}";
            //sb.AppendFormat(temp, "<img title=\"主导航菜单\" style=\"margin-top:5px;margin-right:3px;vertical-align: middle;\" src=\"/img/icon/hf4.png\" border=\"0\"/>");
            //laod menu
            //string mainNavs = FileUtil.ReadFromFile(Server.MapPath("/_ui/_pageBlockTemplate/MainTopNav.htm"));
            //sb.Append(mainNavs);
           // sb.Append("</a></li>");
            //home
            string selectedCss = "brandPrimaryBgr primaryPalette zen-active zen-firstItem primaryPalette";
            
            string home = "<li id=\"{0}\" class=\"{3}\"><a title=\"{1}选项卡\" href=\"{2}\" class='{4}'>{1}</a></li>";
            //if (currentEntityType
            string css = "";
            string linkSelectCss = "";
            Regex reg = new Regex("/home/home.aspx");
            bool isMatch = reg.IsMatch(this.Request.RawUrl);
            if (currentEntityType == "home" || isMatch)
            {
                css = selectedCss; linkSelectCss = "brandPrimaryFgr";
            }
            sb.AppendFormat(home, "Home", "主页", "/home/home.aspx", css, linkSelectCss);

            foreach (SystemAppTab node in tabs)
            {
                if (AuthorizationManager.TabIsAllowed(caller, node.Name, userId))
                    sb.Append(RenderAppTab(node));
            }
            NavHTML = sb.ToString();

        }
        string RenderAppTab(SystemAppTab tab)
        {
            //<li class="zen-firstItem" id="home_Tab"><a href="/home/home.aspx" title="主页选项卡">主页</a></li><li id="Chatter_Tab"><a href="/_ui/core/chatter/ui/ChatterPage" title="Chatter选项卡">Chatter</a></li><li id="UserProfile_Tab"><a href="/_ui/core/userprofile/UserProfilePage" title="简档选项卡">简档</a></li><li id="OtherUserProfile_Tab"><a href="/_ui/core/chatter/people/PeopleListPage" title="人员选项卡">人员</a></li><li id="CollaborationGroup_Tab"><a href="/_ui/core/chatter/groups/GroupListPage" title="小组选项卡">小组</a></li><li class="brandPrimaryBgr zen-active primaryPalette" id="File_Tab"><a href="/_ui/core/chatter/files/FileTabPage" class="brandPrimaryFgr" title="文件选项卡 - 已选取">文件</a><span class="zen-assistiveText">（当前选择的）</span></li><li id="AllTab_Tab"><a href="/home/showAllTabs.jsp">&nbsp;<img src="/s.gif" alt="所有选项卡"  class="allTabsArrow" title="所有选项卡"/>&nbsp;</a></li>
            //string firstClass = "zen-firstItem";
            //string firstClass = "zen-firstItem";
            string str = "";
            //string link = "<li class=\"{5}\"><a id=\"{0}\" href=\"{1}\" class=\"{2}\" onclick=\"{3}\" >{4}</a></li>";
            //<img style=\" margin-left: 3px;left: 0;position: absolute;\" src=\"/img/icon/home16.png\" border=\"0\"/>
            string temp = "<li id=\"{0}\" class=\"{3}\"><a title=\"{1}选项卡\" href=\"{2}\" {4}>{1}</a></li>";
            //<Module Id="WFTask" Label="事务办理" LinkUrl="/apps/wf/default.aspx" Class="zen-firstItem"></Module>
            string selectedCss = "brandPrimaryBgr zen-active primaryPalette";
            string linkSelectCss = "class='brandPrimaryFgr'";
            string id = tab.Name;
            string label = tab.Label;
            string css = "";
            string link = tab.LinkUrl;
            string pattern = "(*.)" + tab.TabCode + "(*.)";
            pattern = tab.LinkUrl;
            //System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(pattern,RegexOptions.IgnoreCase);
            //bool isMatch = regex.IsMatch(Request.RawUrl);
            bool isMatch = false ;

            int idx = string.Compare(currentEntityType, tab.TabCode, true);
            if (idx == 0)
                isMatch = true;

            if (isMatch)
            {
                css = selectedCss;
                linkSelectCss = "class='brandPrimaryFgr'";
            }
            else
            {
                linkSelectCss = "";
                //if (!string.IsNullOrEmpty(currentEntityType))
                //{
                Regex reg = new Regex("/home/home.aspx");
                isMatch = reg.IsMatch(this.Request.RawUrl);
                if (isMatch && reg.IsMatch(tab.LinkUrl))
                    css = selectedCss;
                // }
            }
            str = string.Format(temp, id, label, link, css, linkSelectCss);
            return str;
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