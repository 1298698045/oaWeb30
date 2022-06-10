using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
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
using Supermore.Meetings;
using OA.Web.UI.WebControls;
using OA.Web.UI;



namespace WebClient.apps.meetings
{
    public partial class mtgView : System.Web.UI.Page
    {
        private CallContext _caller = null;
        private Template _template;
        private int _typeCode = 0;
        private string _formHTML = "";
        private string _id = "";
        private string _templateCode = "";
        private string _pageTitle = "";
        private string _tabCss = "";
        private bool _hasRight = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            this._id = Request["id"];
            this.NextRetURL = HttpUtility.UrlEncode(this.Request.RawUrl);
            //this._id = EntityId;
            RenderViewForm();
            GetCheckinInvitees();
            GetNotCheckinInvitees();
            GetEventAttendeeDecline();
            RenderMeetingSummaryNoteList(this._id);
        }
        void RenderViewForm()
        {
            try
            {
                if (string.IsNullOrEmpty(_id)) return;
                EntityDetailForm entityForm = new EntityDetailForm();
                if (_template == null)
                {
                    _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), ObjectTypeCodes.Meeting);

                }
                Guid meetingId = new Guid(_id);
                entityForm.FilterFields = new string[] { "MeetingSummary" };
                //Template masterTemplate = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.HREmployee);
                Template masterTemplate = _template;
                entityForm.Template = masterTemplate;
                entityForm.Caller = _caller;
                Entity insEntity = EntityManager.GetEntity(_caller, masterTemplate, new Guid(_id));
                
                entityForm.Entity = insEntity;
                entityForm.Render();
                _formHTML = entityForm.ResultHTML;
                this.EntityName = insEntity.Name;
                
                if (new Guid(_caller.UserID) == insEntity.CreatedBy)
                {
                    ShowButtonHTML = " display:block";
                }
                else
                    ShowButtonHTML = " display:none";

                MeetingManager meetngManager = new MeetingManager();
                List<MeetingItem> items = meetngManager.GetMeetingItems(_caller, new Guid(_id));
                StringBuilder sb = new StringBuilder();
                foreach (MeetingItem item in items)
                {
                    string content = item.Description;
                    string contentValue = Supermore.Data.DataUtil.ToJsonString(content);
                    content = content.Replace("\n", "<br/>");
                    string createBy = string.Format("{0} <span style='font-size:11px;color: #505050;'>{1}</span>", item.OwningUserName, item.OwningBusinessUnitName);

                    sb.AppendFormat(" <div style=\"display: block;\"  class=\"card\"><div style=\"display: block;\" class=\"cardInner\"><div><span class=\"label\">{0}</span><a href=\"javascript:doEditMeetingItem('{1}','{3}')\" class=\"fr small\">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<span stryle='padding-right:10px;margin-left:10px;' class=\"label\"><a href=\"javascript:prtMeetingItem('{1}')\" class=\"fr small\">打印</a></span></div><div class=\"scrollable mt8\" style=\"\"><div class=\"content\">{2}</div> </div></div> </div>", createBy, item.MeetingItemId, content, contentValue);
                }
                this.MeetingItemHTML = sb.ToString();

                //附件
                /*
                EntityRelatedListControl entityRelatedListControl = new EntityRelatedListControl();
                entityRelatedListControl.Caller = this._caller;
                entityRelatedListControl.EntityDataId = new Guid(_id);
                entityRelatedListControl.EntityDataIdName = EntityName;
                entityRelatedListControl.EntityLayoutId = masterTemplate.ID.ToString();
                entityRelatedListControl.RetURL = HttpUtility.UrlEncode(this.Request.RawUrl);
                entityRelatedListControl.Render();
                RelatedListHTML = entityRelatedListControl.RelatedListHTML;
                 */
                RenderNoteList(_id, ObjectTypeCodes.Meeting);
                //if (insEntity.CreatedBy == new Guid(_caller.UserID))

                if (insEntity.CreatedBy == new Guid(_caller.UserID))
                {
                    _hasRight = true;
                    IsOwningUser = true;
                }
                Entity entity = EntityManager.GetEntity(_caller, ObjectTypeCodes.MeetingSummary, meetingId);
                this.MeetingSummary = StringUtil.GetString(entity.Fields["MeetingSummary"].Value);
            }
            catch(Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }
        void RenderNoteList(string objectId, int objectTypeCode)
        {
            RelatedNoteList noteList = new RelatedNoteList();
            noteList.RelatedObjectId = objectId;
            noteList.RelatedObjectName = this.EntityName;
            noteList.EntityTemplateCode = objectTypeCode;
            // noteList.AccessRight = attachRight;
            noteList.Caller = this._caller;
            noteList.RetURL = string.Format("%2F00V%2Fdetail?id={0}" , objectId);
            noteList.Render();
            RelatedListHTML = noteList.ResultHTML;
        }
        void RenderMeetingSummaryNoteList(string objectId)
        {
            RelatedNoteList noteList = new RelatedNoteList();
            noteList.Title = "纪要附件";
            noteList.RelatedObjectId = objectId;
            noteList.RelatedObjectName = this.EntityName;
            noteList.EntityTemplateCode = ObjectTypeCodes.MeetingSummary;
            // noteList.AccessRight = attachRight;
            noteList.Caller = this._caller;
            noteList.RetURL = string.Format("%2F00V%2Fdetail?id={0}", objectId);
            noteList.Render();
            MeetingSummaryRelatedListHTML = noteList.ResultHTML;
        }
        string RenderGrid(int status)
        {
            int mode = 2;
            StringBuilder sb = new StringBuilder();
            string mtgId = Request["id"];
            string sql="";
            if (status == 2)
                sql = "SELECT a.*,u.FullName,b.Name As BusinessUnitIdName FROM MeetingAudienceBase a LEFT JOIN BusinessUnitBase b ON a.OwningBusinessUnit = b.BusinessUnitId LEFT JOIN SystemUserBase u ON a.InviteeId=u.SystemUserId  WHERE MeetingId='{0}' And a.CheckinStatus={1} ORDER BY a.CheckIn";
            else
                sql = "SELECT a.*,u.FullName,b.Name As BusinessUnitIdName FROM MeetingAudienceBase a LEFT JOIN BusinessUnitBase b ON a.OwningBusinessUnit = b.BusinessUnitId LEFT JOIN SystemUserBase u ON a.InviteeId=u.SystemUserId  WHERE MeetingId='{0}' And a.CheckinStatus={1} ORDER BY b.Name,u.FullName";
            sql = string.Format(sql, mtgId, status);
            DataSet ds = AppDataSource.GetDataSet(_caller, sql, null);

            if (ds.Tables.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb.Append(RenderStartRow(mode));
                    string mtgItemId = StringUtil.GetString(dr["ValueId"]);
                    int statusCode = MainUtil.GetInt(dr["StatusCode"], 0);
                    string fullName = StringUtil.GetString(dr["FullName"]);
                    //MeetingItemId
                    sb.Append("<td class=\" actionColumn  \">");
                    if (_hasRight)
                    {
                        sb.AppendFormat("<a class='actionLink' onclick=\"return confirmDelete()\" href='/setup/own/deleteredirect.aspx?delID={0}&type=5002&retURL=%2F00V%2Fdetail?id={1}&_CONFIRMATIONTOKEN='>删除</a>", mtgItemId, mtgId);
                        sb.AppendFormat("&nbsp;|&nbsp;<a  href=\"#\" class=\"actionLink\" onclick=\"return markAudience('{0}','{1}',{2});\"><span>备注人员</span></a>", mtgItemId, fullName, 5002);
                    }
                    sb.Append("</td>");
                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", fullName);
                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", dr["BusinessUnitIdName"]);
                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", dr["Checkin"]);
                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", dr["Checkout"]);
                   
                    string statusName = "未接受";
                    if (statusCode == 1)
                        statusName = "已接受";
                    if (statusCode == 2)
                        statusName = "已拒绝";

                    int checkStatus = MainUtil.GetInt(dr["CheckinStatus"], 0);
                    string checkStatusName = "未签到";
                    if (checkStatus == 1)
                        checkStatusName = "未签到";
                    if (checkStatus == 2)
                        checkStatusName = "已签到";

                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", statusName);
                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", checkStatusName);
                    //sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", entity.CreatedOn.ToString("yyyy-MM-dd tthh:ss"));
                    sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", dr["Description"]);
                    sb.Append("</tr>");
                }
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
        /// 已签到
        /// </summary>
        void GetCheckinInvitees()
        {
            this.CheckinInviteesHTML = RenderGrid(2);
        }
        /// <summary>
        /// 未响应
        /// </summary>
        void GetNotCheckinInvitees()
        {
            this.CheckinNotInviteesHTML = RenderGrid(0);
        }
        /// <summary>
        /// 已拒绝
        /// </summary>
        void GetEventAttendeeDecline()
        {
            this.AttendeeDeclineHTML = RenderGrid(2);
        }
        public string FormHTML
        {
            get { return _formHTML; }
            set { _formHTML = value; }
        }
        public string EntityId
        {
            get { return this._id; }
            set { this._id = value; }
        }
        public string EntityName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string NextRetURL { get; set; }
        /// <summary>
        /// 签到
        /// </summary>
        public string CheckinInviteesHTML { get; set; }
        /// <summary>
        /// 未签到
        /// </summary>
        public string CheckinNotInviteesHTML { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string AttendeeDeclineHTML { get; set; }
        /// <summary>
        /// 会议议题
        /// </summary>
        public string MeetingItemHTML { get; set; }
        /// <summary>
        /// 附件
        /// </summary>
        public string RelatedListHTML { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string MeetingSummaryRelatedListHTML { get; set; }
        /// <summary>
        /// 会议纪要
        /// </summary>
        public string MeetingSummary { get; set; }
        /// <summary>
        /// 显示按钮
        /// </summary>
        public string ShowButtonHTML { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public bool IsOwningUser { get; set; }
    }
}