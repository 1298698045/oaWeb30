using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OA.Web.UI.FieldControls;
using Supermore;
//using Supermore.Activities;
using Supermore.Configuration;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;

using Supermore.OrgResource;
using Youyou.Meetings;

namespace WebClient.apps.resm
{
    public partial class appointRes : System.Web.UI.Page
    {
        CallContext caller = null;
        string retURL = "";
        string invtee = "";
        string evt13 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["cancel"] != null)
                {
                    retURL = Request["cancelURL"];
                    Response.Redirect(retURL);
                }
                retURL = Request["retURL"];
                if (!string.IsNullOrEmpty(retURL))
                {
                    RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
                    RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", string.Format("/025/e?rType={0}&retURL={1}", Request["rType"], retURL));
                }
                this.ResourceType = MainUtil.GetInt(Request["rType"], 1);
                this.AllowApprove = MainUtil.GetBool(Request["approve"], false);
                invtee = Request["invtee"];
                evt13 = Request["evt13"]; //时间
                if (!string.IsNullOrEmpty(invtee))
                {
                    this.ResourceId = invtee;
                }
                caller = AppDataSource.GetCallContext();
                if (Request["save"] != null)
                {
                    Save(false, "save");
                }
                if (Request["save_new"] != null || Request["savenewtask"] != null || Request["savenewevent"] != null)
                {
                    string cmdName = Request["save_new"];

                    Save(true, cmdName);
                }

                GetData();
                GetResources();
                GetAttaches("");
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        void GetData()
        {
            this.OwningUser = caller.UserID;
            this.OwningUserName = WebContext.UserFullName;

            if (Request["evt4"] != null)
            {
                this.DateNow = Request["evt4"];
                this.ScheduledStart = this.DateNow;
                this.ScheduledEnd = this.DateNow;
            }
            else
            {
                this.ScheduledStart = DateTime.Now.ToString("yyyy-MM-dd");
                this.ScheduledEnd = DateTime.Now.ToString("yyyy-MM-dd");
                this.DateNow = DateTime.Now.ToString("yyyy-MM-dd");
            }
            
            this.DateNowTime = DateTime.Now.ToString("HH:00");
            this.ScheduledStartTime = DateTime.Now.ToString("HH:00");
            this.ScheduledEndTime = DateTime.Now.AddHours(1).ToString("HH:00");

            string strId = Request["id"];
            if (string.IsNullOrEmpty(strId))
            {
                //GetAppointStatus(0);
                return;
            }
            Entity entity = null;
            entity = EntityManager.GetEntity(caller, EntityTemplateIDs.ResourceAppointment, new Guid(strId));
            ResourceAppointment act = new ResourceAppointment(entity);
            ScheduledEnd = act.ScheduledEnd.ToString("yyyy-MM-dd");
            this.Description = act.Description;
            this.Subject = act.Subject;
            this.OwningUser = act.OwningUser.ToString();
            this.OwningUserName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, act.OwningUser);
            this.ScheduledStart = act.ScheduledStart.ToString("yyyy-MM-dd");
            this.ScheduledEnd = act.ScheduledEnd.ToString("yyyy-MM-dd");
            this.TelePhone = act.TelePhone;
            this.ScheduledStartTime = act.ScheduledStart.ToString("HH:mm");
            this.ScheduledEndTime = act.ScheduledEnd.ToString("HH:mm");

            this.ResourceId = act.ResourceId.ToString();
            GetAppointStatus(act.StateCode);
            GetAttaches(act.Attachs);
            //this.IsAllDayEvent = act.IsAllDayEvent;
            //this.PriorityCode = act.PriorityCode;
            if (act.InnerEntity.CreatedBy == new Guid(caller.UserID))
            {
                ShowButton = true;
            }
            else
            {
                if (!this.AllowApprove)
                {
                    ShowButton = false;
                }
            }
        }

        void GetResources()
        {
            Guid sele = Guid.Empty;
            if (!string.IsNullOrEmpty(this.ResourceId))
            {
                sele = new Guid(this.ResourceId);
            }
            _options += string.Format("<option value='{0}'>{1}</option>", "","--请选择--");
           List<OrganizationResource> entities = OrgResourceManager.GetResources(caller, this.ResourceType);
           foreach (OrganizationResource entity in entities)
           {
               if (sele == entity.ID)
                   _options += string.Format("<option value='{0}' selected='selected'>{1}</option>", entity.ID, entity.InnerEntity.Name);
               else
                   _options += string.Format("<option value='{0}'>{1}</option>", entity.ID.ToString().ToLower(), entity.InnerEntity.Name);
           }
        }
        void GetAppointStatus(int status)
        {
            _approveStatus = "";
            _approveStatus += string.Format("<option value='{0}' {2}>{1}</option>", "0", "未审批",(status==0) ? "selected='selected'":"");
            if (this.AllowApprove)
            {
                _approveStatus += string.Format("<option value='{0}' {2}>{1}</option>", "1", "审批通过", (status == 1) ? "selected='selected'" : "");
                _approveStatus += string.Format("<option value='{0}' {2}>{1}</option>", "2", "审批不通过", (status == 2) ? "selected='selected'" : "");
                this.ShowButton = true;
            }
        }
        string _attachs = "";
        void GetAttaches(string attachs)
        {
            MutipleCheckbox checkboxs = new MutipleCheckbox();
            checkboxs.FieldName = "Attachs";
            checkboxs.ControlId = "Attachs";
            checkboxs.Options = "0|电脑,1|投影,2|多媒体,3|视频同步";
            checkboxs.FieldValue = attachs;
            checkboxs.RenderField();
            _attachs = checkboxs.ControlHtml;
            //if (string.IsNullOrEmpty(_attachs))
            //{
            //    _attachs = "<input type=\"checkbox\" name=\"Attachs\" value=\"电脑\" checked=\"checked\"/>";
            //    _attachs += "<input type=\"checkbox\" name=\"Attachs\" value=\"投影\" checked=\"checked\"/>";
            //}
            //else
            //{
            //   // _attachs = "<input type=\"checkbox\" name=\"Attachs\" value=\"电脑\" checked=\"checked\"/>";
            //   // _attachs += "<input type=\"checkbox\" name=\"Attachs\" value=\"投影\" checked=\"checked\"/>";
            //    //_attachs = "";
            //}
        }
        void Save(bool saveNew, string cmdName)
        {

            string Id = Request["id"];
            bool isUpdated = false;
            string subject = Request["evt5"];
            string resourceId = Request["orgResources"];

            try
            {
                if (string.IsNullOrEmpty(subject))
                {
                    retURL = "/025/e?rType=2&retURL=%2F025%2Fc?rType=2";
                    Response.Redirect(retURL);
                    return;
                }
                if (string.IsNullOrEmpty(resourceId))
                {

                    retURL = "/025/e?rType=2&retURL=%2F025%2Fc?rType=2";
                    Response.Redirect(retURL);
                    return;
                }

                Guid orgId = new Guid(caller.CustomerID);
                Entity entity = null;
                if (string.IsNullOrEmpty(Id))
                {
                    entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.ResourceAppointment, orgId);
                }
                else
                {
                    entity = EntityManager.GetEntity(caller, EntityTemplateIDs.ResourceAppointment, new Guid(Id));
                    isUpdated = true;
                }

                int stateCode = MainUtil.GetInt(Request["approveStatus"], 0);
                entity.BeginEdit();
                entity.Fields["Subject"].Value = subject;
                if (stateCode > 0)
                {
                    entity.Fields["StateCode"].Value = stateCode;
                    entity.Fields["StatusCode"].Value = 0;// Request["tsk12"];
                                                          // entity.Fields["PriorityCode"].Value = 0;// Request["tsk13"];
                }
                // entity.Fields["PriorityCode"].Value = 0;// Request["tsk13"];

                if (stateCode > 0)
                    entity.Fields["HandleBy"].Value = caller.UserID; //审批人

                string StartDateTime = Request["StartDateTime"];
                string EndDateTime = Request["EndDateTime"];
                string StartDateTime_time = Request["StartDateTime_time"];
                string EndDateTime_time = Request["EndDateTime_time"];

                entity.Fields["ResourceId"].Value = resourceId;

                if (string.IsNullOrEmpty(Request["evt1_lkid"]))
                {
                    entity.Fields["OwningUser"].Value = caller.UserID;
                }
                else
                    entity.Fields["OwningUser"].Value = Request["evt1_lkid"];

                string attach = StringUtil.GetString(Request["attachs"]);
                //if(string.IsNullOrEmpty(
                entity.Fields["Attachs"].Value = attach;

                string descripition = Request["evt6"];
                //entity.Fields["ScheduledEnd"].Value = Request["tsk4"];
                entity.Fields["Description"].Value = descripition;
                DateTime dt1 = DateTime.Now;
                DateTime dt2 = DateTime.Now;

                string startTime = StartDateTime + " " + StartDateTime_time;
                string endTime = EndDateTime + " " + EndDateTime_time;

                dt1 = DateTime.Parse(startTime);
                dt2 = DateTime.Parse(endTime);

                int limitDays = Settings.GetIntSetting("MeetingRoom.LimitRange", 30);
                DateTime dtEndRage = DateTime.Now.AddDays(limitDays);
                if (dt2 > dtEndRage)
                {
                    retURL = "/025/e?rType=2&retURL=" + retURL;
                    Response.Redirect(retURL);
                    return;
                }

                startTime = dt1.ToString("yyyy-MM-dd HH:mm:ss");
                endTime = dt2.ToString("yyyy-MM-dd HH:mm:ss");

                entity.Fields["ScheduledStart"].Value = startTime;
                entity.Fields["ScheduledEnd"].Value = endTime;

                if (entity.Fields["TelePhone"] != null)
                    entity.Fields["TelePhone"].Value = Request["TelePhone"];
                if (entity.Fields["PeopleQty"] != null)
                    entity.Fields["PeopleQty"].Value = Request["PeopleQty"];
               
                if (!isUpdated)
                {
                    //entity.Fields["DeletionStateCode"].Value = 0;
                    //entity.Fields["BusinessUnitId"].Value = orgId;    //部门
                    //entity.Fields["IsPublic"].Value = 0;
                    entity.Fields["OrganizationId"].Value = orgId;                  
                    entity.Fields["CreatedBy"].Value = caller.UserID;
                    entity.Fields["ModifiedBy"].Value = caller.UserID;
                    entity.Fields["CreatedOn"].Value = DateTime.Now;
                    entity.Fields["ModifiedOn"].Value = DateTime.Now;
                }
                else
                {
                    entity.Fields["ModifiedBy"].Value = caller.UserID;
                    entity.Fields["ModifiedOn"].Value = DateTime.Now;
                }

                bool isSaved = false;
                ResourceAppointmentInfo info = RoomManager.CheckRoomFree(caller, startTime, endTime, resourceId, Id);
                if (info.IsFree)
                {
                    isSaved = entity.EndEdit();
                }
                else
                {
                    //提醒
                    //string msg = "";
                }
                if (isSaved)
                {
                    if (Request["notifySms"] != null)
                    {
                        Entity resourceEntity = EntityManager.GetEntity(caller, EntityTemplateIDs.Resource, new Guid(resourceId));
                        string resouceName = resourceEntity.Name;
                        Guid[] approveIds = null; //会议室审批人
                        OrganizationResource orgResource = new OrganizationResource(resourceEntity);
                        if (!string.IsNullOrEmpty(orgResource.ApproveByIds))
                            approveIds = MainUtil2.ToGuidArray(orgResource.ApproveByIds, ',');

                        string msg = string.Format(" 会议室预约:{0} 预约了[{1}] {2} {3}至{4}点 会议室，请尽快审批！", caller.FullName, resouceName, StartDateTime, StartDateTime_time, EndDateTime_time);
                        Supermore.Mobile.SmsMessageManager.PushSmsQueueAndSend(caller, approveIds, msg, 2, DateTime.Now, Guid.NewGuid());
                    }
                    MeetingManager meetingMgr = new MeetingManager();
                    meetingMgr.Create(caller, entity.ID, subject, startTime, endTime, "", new Guid(resourceId), "", descripition);
                }
                //string retURL = "";
                if (saveNew)
                {
                    string save_new_url = Request["save_new_url"];
                    if (string.IsNullOrEmpty(save_new_url))
                        retURL = "/025/c?rType=2";
                    Response.Redirect(save_new_url);
                }
                else
                {
                    
                    string retURL = Request["retURL"];
                    if (string.IsNullOrEmpty(retURL))
                    {
                        retURL = string.Format("/025/c?rType=2&md0={0}&md3={1}", dt1.Year, dt1.DayOfYear);
                        //retURL = "/025/c?rType=2";
                    }
                    Response.Redirect(retURL);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/025/c?rType=2");
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }

        public string DateNow { get; set; }
        public string DateNowTime { get; set; }
        //public string DateNowStartTime { get; set; }
        //public string DateNowEndTime { get; set; }

        public int ResourceType { get; set; }
        public int StateCode { get; set; }
        public string ResourceId { get; set; }
        public string Description { get; set; }
        public string Subject { get; set; }

        public string TelePhone { get; set; }

        //public bool IsAllDayEvent { get; set; }
        public string ScheduledStart { get; set; }
        public string ScheduledStartTime { get; set; }

        public string ScheduledEnd { get; set; }
        public string ScheduledEndTime { get; set; }

        //public string ReminderDate { get; set; }
        public string OwningUser { get; set; }
        public string OwningUserName { get; set; }
        public bool AllowApprove { get; set; }

        //public string TelePhone { get; set; }
        public int PeopleQty { get; set; }
        
        
        string _options = "";
        public string OrgResources
        {
            get { return _options; }
        }
        string _approveStatus = "";
        public string ApproveStatus
        {
            get { return _approveStatus; }
        }

        public string Attaches
        {
            get { return _attachs; }
        }
        bool _showButton = true;
        public bool ShowButton
        {
            get { return _showButton; }
            set { _showButton = value; }
        }
    }
}