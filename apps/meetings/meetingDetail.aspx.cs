using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using OA.Web.UI.WebControls;
using OA.Web.UI;
using System.Text;
using System.Data;

namespace WebClient.apps.meetings
{
    public partial class meetingDetail : System.Web.UI.Page
    {
        CallContext _caller = null;
        Template _template;
        int _typeCode = 0;
        string _formHTML = "";
        string _id = "";
        string _templateCode = "";
        private string _pageTitle = "";
        private string _tabCss = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _templateCode = Request["t"];
            this.EntityId = Request["id"];
            this._id = EntityId;
            _caller = AppDataSource.GetCallContext();
            GetTemp();
            RenderViewForm();
            this.RetURL = string.Format("/{0}/detail?id={1}", _templateCode, this._id);
            this.FromURL = Request["retURL"];
        }
        void GetTemp()
        {
            //SystemAppTab tab = SystemAppTabs.GetTab(_templateCode);
            //if (tab != null)
            //{
            //    _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), _templateCode);
            //    if (_template == null)
            //    {
            //        if (tab.TemplateId != Guid.Empty)
            //        {
            //            _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), tab.TemplateId);
            //        }
            //    }
            //    this._tabCss = tab.TabCss + "Tab";
            //}
            //else
            //{
            //    this._tabCss = "accountTab";
            //}
            if (_template == null)
            {
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), _templateCode);

            }
            if (_template != null)
            {
                _typeCode = _template.ObjectTypeCode;
                _pageTitle = _template.Title;
                this._entityTitle = _template.Title;
            }
        }
        void RenderViewForm()
        {
            if (string.IsNullOrEmpty(_id)) return;
            EntityDetailForm entityForm = new EntityDetailForm();
            //Template masterTemplate = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.HREmployee);
            Template masterTemplate = _template;
            entityForm.Template = masterTemplate;
            entityForm.Caller = _caller;
            Entity insEntity = EntityManager.GetEntity(_caller, masterTemplate, new Guid(_id));
            entityForm.Entity = insEntity;
            entityForm.Render();
            _formHTML = entityForm.ResultHTML;

            GetEventAttendeeAccept();
            GetEventAttendeeNotDecided();
            GetEventAttendeeDecline();

            this.EntityName = insEntity.Name;
            EntityRelatedListControl entityRelatedListControl = new EntityRelatedListControl();
            entityRelatedListControl.Caller = this._caller;
            entityRelatedListControl.EntityDataId = new Guid(_id);
            entityRelatedListControl.EntityDataIdName = EntityName;
            entityRelatedListControl.EntityLayoutId = masterTemplate.ID.ToString();
            entityRelatedListControl.RetURL = HttpUtility.UrlEncode(this.Request.RawUrl);
            entityRelatedListControl.Render();

            RelatedListHTML = entityRelatedListControl.RelatedListHTML;
        }
        string RenderGrid(int status)
        {
            int mode = 2;
            StringBuilder sb = new StringBuilder();
            string sql = "SELECT a.*,u.FullName FROM ActivityPointerBase a JOIN SystemUserBase u ON a.OwningUser=u.SystemUserId WHERE RegardingObjectId='{0}' And a.AcceptedStatus={1} ORDER BY a.ModifiedOn DESC";
            sql = string.Format(sql, Request["id"], status);
            DataSet ds = AppDataSource.GetDataSet(_caller, sql,null);

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                sb.Append(RenderStartRow(mode));

                sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", dr["FullName"]);
                sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", "用户");
                sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", StringUtil.GetString(dr["LeaveMessage"]));
                //sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", entity.CreatedOn.ToString("yyyy-MM-dd tthh:ss"));
                sb.Append("</tr>");
            }
            return sb.ToString();
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        /// <summary>
        /// 已接受
        /// </summary>
        void GetEventAttendeeAccept()
        {
            this.AttendeeAcceptHTML = RenderGrid(1);
        }
        /// <summary>
        /// 未响应
        /// </summary>
        void GetEventAttendeeNotDecided()
        {
            this.AttendeeNotDecidedHTML = RenderGrid(0);
        }
        /// <summary>
        /// 已拒绝
        /// </summary>
        void GetEventAttendeeDecline()
        {
            this.AttendeeDeclineHTML = RenderGrid(2);
        }
        public string EntityId { get; set; }
        public string EntityName { set; get; }

        string _entityTitle = "";
        public string EntityDisplayName
        {
            get { return _entityTitle; }
        }
        public string TabCss
        {
            get { return _tabCss; }
        }
        public string EntityCode
        {
            get { return _templateCode; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }

        public string FormHTML
        {
            get { return _formHTML; }
            set { _formHTML = value; }
        }


        public string RelatedListHTML { set; get; }
        public string FromURL { get; set; }
        public string RetURL { get; set; }


        public string AttendeeAcceptHTML { get; set; }
        public string AttendeeNotDecidedHTML { get; set; }
        public string AttendeeDeclineHTML { get; set; }
    }
}