using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Supermore.IO;
using Supermore;

namespace WebClient.apps.scontent
{
    public partial class contentManageTab : System.Web.UI.Page
    {
        string tabs = "";
        private int _src = 1;
        private string entityType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["src"] != null)
                _src = MainUtil.GetInt(Request["src"], 1);

            RenderSubTabs();
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                //GetEntityList();
                //RenderFilters();

            }
        }
        void RenderSubTabs()
        {
            //onclick=\"return BaseAssociation.warnUnsavedData();\"
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul class=\"miniTabList\">");
            string rPath = "";
            
            if (_src == 2)
            {
                this.SubTitle = "通知公告管理";
                if(WebContext.IsAdministrator)
                    rPath = Server.MapPath("/App_Data/Pageblock/contentpub/ManageNotice.htm");
                else
                    rPath = Server.MapPath("/App_Data/Pageblock/contentpub/MyNotice.htm");
            }
            else if (_src == 4)
            {
                this.SubTitle = "规则制度";
                rPath = Server.MapPath("/App_Data/Pageblock/contentpub/ContentRule.htm");
            }
            else if (_src ==5)
            {
                this.SubTitle = "传阅";
                rPath = Server.MapPath("/App_Data/Pageblock/contentpub/ContentPassRead.htm");
            }
            else
            {
                this.SubTitle = "信息管理";
                if (WebContext.IsAdministrator)
                    rPath = Server.MapPath("/App_Data/Pageblock/contentpub/ManageContents.htm");
                else
                    rPath = Server.MapPath("/App_Data/Pageblock/contentpub/MyContents.htm");
            }

            sb.Append(" </ul>");
            _subTabContent = FileUtil.ReadFromFile(rPath);
            //tabs = sb.ToString();

        }

        public string SubTitle { get; set; }
        public string SubTabs
        {
            get { return tabs; }
        }
        string _subTabContent;
        public string SubTabContent
        {
            get { return _subTabContent; }
        }
    }
}