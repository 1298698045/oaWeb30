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
using OptimaJet.Workflow;
using Supermore.Security.SecurityControl;


namespace WebClient.apps.wf
{
    public partial class MyApplyList : System.Web.UI.Page
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
            if (Request["src"]!=null)
            _src = MainUtil.GetInt( Request["src"],1);
            _caller = AppDataSource.GetCallContext();
            if (_src == 1)
            {
                _typeCode = 122; //自己申请事务
            }
            else
            {
                _typeCode = 123;  //别人发起 流转事务
                if (!AuthorizationManager.TabIsAllowed(_caller, "WFInstance", new Guid(_caller.UserID)))
                {
                    Response.Redirect("/home/home.aspx?t=home&token=" + DateTime.Now.ToString("yyyyMMddHHmmss"));
                }
            }
            RenderSubTabs();
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                //GetEntityList();
                //RenderFilters();
                
            }
        }
        public void GetEntityList()
        {

            

            SavedQuery savedQuery = SavedQueryManager.GetDefaultQuery(_caller, this.TypeCode);
            RelatedEntityListRenderer relatedEntityListRenderer = new RelatedEntityListRenderer();

            EntityCollection entities = SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);

            SavedQueryParser parser = new SavedQueryParser();
            relatedEntityListRenderer.Caller = this._caller;
            relatedEntityListRenderer.Template = savedQuery.Template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(savedQuery.Template, savedQuery.ColumnSetXml);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.Render();

            tBody = relatedEntityListRenderer.TableHTML;
            // SavedQueryManager
        }
        void RenderFilters()
        {
            List<SavedQuery> listOptions = SavedQueryManager.GetSavedQueries(_caller, TypeCode, 0);
            foreach (SavedQuery savedQuery in listOptions)
            {
                if (savedQuery.IsDefault)
                {
                    _filterOptionHTML += string.Format("<option selected=\"selected\" value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                    // if (string.IsNullOrEmpty(filterID))
                    //     filterID = savedQuery.ID.ToString();
                }
                else
                {
                    _filterOptionHTML += string.Format("<option value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                }
            }
        }

        string tabs = "";
        void RenderSubTabs()
        {
            //onclick=\"return BaseAssociation.warnUnsavedData();\"
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul class=\"miniTabList\">");
            string rPath = "";
            /*
            if (_src == 2)
            {
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"由我发起 创建的事务 子选项卡\" id=\"startInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=1\">我发起事务</a></li>");
                sb.Append(" <li class=\"currentTab\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"receiveInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=2\">我接收事务</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"我发起知会，传阅 与我收到的知会与传阅\" id=\"zhihuiTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=3\">知会传阅</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"notifyMsgTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=4\">催办消息</a></li>");
                rPath = Server.MapPath("/App_Data/Pageblock/wf/AssignInstance.htm");
            }
            else if (_src == 3)
            {
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"由我发起 创建的事务 子选项卡\" id=\"startInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=1\">我发起事务</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"receiveInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=2\">我接收事务</a></li>");
                sb.Append(" <li class=\"currentTab\"><a  title=\"我发起知会，传阅 与我收到的知会与传阅\" id=\"zhihuiTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=3\">知会传阅</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"notifyMsgTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=4\">催办消息</a></li>");
                rPath = Server.MapPath("/App_Data/Pageblock/wf/NotifyMsg.htm");
            }
            else if (_src == 4)
            {
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"由我发起 创建的事务 子选项卡\" id=\"startInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=1\">我发起事务</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"receiveInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=2\">我接收事务</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"我发起知会，传阅 与我收到的知会与传阅\" id=\"zhihuiTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=3\">知会传阅</a></li>");
                sb.Append(" <li class=\"currentTab\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"notifyMsgTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=4\">催办消息</a></li>");
                rPath = Server.MapPath("/App_Data/Pageblock/wf/ReminderMsg.htm");
            }
            else
            {
                sb.Append(" <li class=\"currentTab\"><a  title=\"由我发起 创建的事务 子选项卡\" id=\"startInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=1\">我发起事务</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"receiveInstanceTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=2\">我接收事务</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a  title=\"我发起知会，传阅 与我收到的知会与传阅\" id=\"zhihuiTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=3\">知会传阅</a></li>");
                sb.Append(" <li class=\"secondaryPalette\"><a title=\"别人发起,流转到我办理的事务 子选项卡\" id=\"notifyMsgTab\" href=\"/apps/wf/MyApplyList.aspx?t=122&src=4\">催办消息</a></li>");
                //<li class="secondaryPalette"><a onclick="return BaseAssociation.warnUnsavedData();" title="未解决的 电子邮件 子选项卡 - 已选取" id="associationQueueEmailTab" href="/6AC?src=4">电子邮件</a></li>
                //<li class="secondaryPalette"><a onclick="return BaseAssociation.warnUnsavedData();" title="未解决的 任务 子选项卡" id="associationQueueTaskTab" href="/6AD?src=4">任务</a></li>-->
                rPath = Server.MapPath("/App_Data/Pageblock/wf/CreateInstance.htm");
            }
            */
            if (_src == 2)
            {
                this.SubTitle = "事务管理";
                rPath = Server.MapPath("/App_Data/Pageblock/wf/ManageInstance.htm");

                _caller = AppDataSource.GetCallContext();
                //权限
                if (!AuthorizationManager.TabIsAllowed(_caller, "WFInstance", new Guid(_caller.UserID)))
                {
                    Response.Redirect("/home/home.aspx");
                }
            }
            else
            {
                this.SubTitle = "我的管理";
                rPath = Server.MapPath("/App_Data/Pageblock/wf/MyInstance.htm");
            }
            
            sb.Append(" </ul>");
            _subTabContent = FileUtil.ReadFromFile(rPath);
            //tabs = sb.ToString();

        }
        
        public string BodyText
        {
            get { return tBody; }
        }
        public string Fcfs
        {
            get { return _filterOptionHTML; }
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
        
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }
    }
}