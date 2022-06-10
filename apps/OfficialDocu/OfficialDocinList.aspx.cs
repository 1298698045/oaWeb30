using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.IO;

namespace WebClient.apps.OfficialDocu
{
    public partial class OfficialDocinList : System.Web.UI.Page
    {
        private string entityType = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        private CallContext _caller;
        private int _typeCode = 122;
        private int _pageSize = 15;
        private int _src = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["src"] != null)
                _src = MainUtil.GetInt(Request["src"], 1);

            //if (_src == 1)
            //{
            //    _typeCode = 122; //自己申请事务
            //}
            //else
            //{
            //    _typeCode = 123;  //别人发起 流转事务
            //}
            RenderSubTabs();
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                //GetEntityList();
                //RenderFilters();
            }
        }
        string tabs = "";
        void RenderSubTabs()
        {
            string rPath = "";
            if (_src == 1)
            {
                rPath = Server.MapPath("/App_Data/Pageblock/Officialdoc/DocOutlist.htm");
                this.SubTitle = "发文管理";
            }
            else if (_src == 2)
            {
                this.SubTitle = "收文管理";
                rPath = Server.MapPath("/App_Data/Pageblock/Officialdoc/DocInlist.htm");
            }
            else if (_src == 3)
            {
                this.SubTitle = "公文督办";
                rPath = Server.MapPath("/App_Data/Pageblock/Officialdoc/OverseeDoc.htm");
            }
            _subTabContent = FileUtil.ReadFromFile(rPath);
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string Fcfs
        {
            get { return _filterOptionHTML; }
        }
        public string SubTabs
        {
            get { return tabs; }
        }
        string _subTabContent;
        public string SubTabContent
        {
            get { return _subTabContent; }
        }
        public string SubTitle { get; set; }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }
    }
}