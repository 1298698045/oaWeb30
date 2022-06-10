using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.Security;
using Supermore.Messenger;
using Supermore.Mobile;
using Supermore.Meetings;

using OA.Web.UI;
using OA.Web.UI.FieldControls;
using OA.Web.UI.WebControls;
using Supermore.Organization;

namespace WebClient.apps.meetings
{
    public partial class inviteAddMtgItem : System.Web.UI.Page
    {
        private string tBody = "";
        private string _filterOptionHTML = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 2;
        private int _pageSize = 10;
        private Template _template;
        private string _initJson = "";
        private string entityType = "";
        private string _templateCode = "";
        private string _tmeplateId = "";
        private int objectType = 0;
        MeetingManager meetingManager = new MeetingManager();
        string strid = "";
        int objectTypeTo = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            strid = Request["id"];
            _caller = AppDataSource.GetCallContext();
            objectTypeTo = ObjectTypeCodes.Meeting;// MainUtil.GetInt(Request["addObjectTypeTo"], 0);
            Meeting meeting = meetingManager.GetMeeting(_caller, new Guid(strid));
            this.AddToTitle = meeting.Subject;

            //this.Message = string.Format(" 会议 [{0}] 将于 {1} 开始。请登陆OA填写相关议题。", meeting.Subject,meeting.ScheduledStart.ToString("yyyy-MM-dd HH:mm"));
            string meetingLocation = string.Format("{0} {1}", meeting.Location, meeting.GetRoomName(_caller));
            this.Message = string.Format(" 会议通知：“{0}” 将于 {1} 在 “{2}” 召开，请登录OA，在首页右侧 [今日日程]处 填写需要讨论的会议议题。另外请提前10分钟到场进行手机APP签到。未下载办公APP的，请提前下载。", meeting.Subject, meeting.ScheduledStart.ToString("yyyy-MM-dd HH:mm"), meetingLocation);

            if (objectTypeTo == ObjectTypeCodes.Meeting)
            {
                this.ActionURL = "/apps/meetings/addmultilineitemtoMeeting.aspx";
            }
            else if (objectTypeTo == ObjectTypeCodes.Survey)
            {
                this.ActionURL = "/survey/addmultilineitemtoSvy.aspx";
            }
            else if (objectTypeTo == ObjectTypeCodes.Notice || objectTypeTo == ObjectTypeCodes.Content)
            {
                this.ActionURL = "/apps/scontent/addmultilineitemtoContent.aspx";
            }
            if (Request["save"] != null)
            {
                SaveData();
            }
            if (Request["save_new"] != null)
            {
                SaveData();
            }
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                Response.Redirect(cancelURL, true);
            }
            this.RetURL = Request["retURL"];
            this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", RetURL);
            string save_new_url = this.Request.RawUrl; ;
            this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", save_new_url);

            LoadPublicGroups();
            LoadPersonalGroups();
            LoadRoles();
            //LoadTitleLevels();
            //LoadPosts();
           
        }

        
        void SaveData()
        {

            string Id = Request["id"];
            // bool isUpdated = false;
            Guid orgId = _caller.OrganizationId;
            Guid contentId = new Guid(Id);

            MeetingManager manager = new MeetingManager();
            Meeting meeting = manager.GetMeeting(_caller, new Guid(Id));
            string duel1 = Request["duel1"];
            Guid[] userids = new Guid[] { };
            if (!string.IsNullOrEmpty(duel1))
            {
                string[] pa = duel1.Split(',');
                int sortNumber = 1;
                for (int i = 0; i < pa.Length; i++)
                {
                    //A:6c27e345-7af4-42aa-bcc3-23ed06b27d9a
                    string tmp1 = pa[i];
                    string[] members = tmp1.Split(':');
                    Guid memberid = new Guid(members[1]);
                    if (members[0].EndsWith("A", StringComparison.InvariantCultureIgnoreCase)) //角色
                    {
                        //get roles
                        List<SystemUser> users = SecurityAuth.GetRoleSystemUsers(_caller, memberid);
                        foreach (SystemUser user in users)
                        {
                            Array.Resize<Guid>(ref userids, userids.Length + 1);
                            userids[userids.Length - 1] = user.ID;
                            manager.AddMember(_caller, meeting, user, 0, 0, true);
                            manager.AddMeetingItem(_caller, meeting.ID, user.ID, user.BusinessUnitId, "", "", sortNumber);
                            sortNumber++;
                        }
                    }
                    else if (members[0].EndsWith("P", StringComparison.InvariantCultureIgnoreCase) || members[0].EndsWith("R", StringComparison.InvariantCultureIgnoreCase))//个人小组与公用小组
                    {
                        EntityCollection users = SecurityAuth.GetGroupMembers(_caller, memberid);
                        foreach (Entity entity in users)
                        {
                            Array.Resize<Guid>(ref userids, userids.Length + 1);
                            userids[userids.Length - 1] = MainUtil.GetGuid(entity.Fields["RegardingObjectId"].Value);
                            //toUserNames += StringUtil.GetString(entity.Fields["RegardingObjectIdName"].Value) + ",";
                            Guid userId1 = MainUtil.GetGuid(entity.Fields["RegardingObjectId"].Value);
                            string userName = StringUtil.GetString(entity.Fields["RegardingObjectIdName"].Value);
                            //ContentManager.InviteContentReader(_caller, contentId, userId1, userName);
                            manager.AddMember(_caller, meeting, userId1.ToString(), userName, 0, 0, true);

                            manager.AddMeetingItem(_caller, meeting.ID, userId1, Guid.Empty, "", "",sortNumber);
                            sortNumber++;
                        }
                        manager.SynchBusinessUnit(_caller, meeting.ID);
                    }
                    else if (members[0].EndsWith("U", StringComparison.InvariantCultureIgnoreCase))//用户
                    {
                        Array.Resize<Guid>(ref userids, userids.Length + 1);
                        userids[userids.Length - 1] = memberid;
                        SystemUser user = SecurityAuth.GetSystemUser(_caller, memberid);
                        //ContentManager.InviteContentReader(_caller, contentId, memberid, userName);
                        manager.AddMember(_caller, meeting, user, 0, 0, true);

                        manager.AddMeetingItem(_caller, meeting.ID, memberid, user.BusinessUnitId, "", "",sortNumber);
                        sortNumber++;
                    }
                }

            }

            //添加邀请
            //EntityCollection entities = GetTargetUsers();
            //foreach (Entity entity in entities)
            //{
            //    SystemUser user = new SystemUser(entity);
            //    //ContentManager.InviteContentReader(_caller, contentId, user.ID, user.FullName);
            //    manager.AddMember(_caller, meeting, user.ID.ToString());
            //}

            string subject = Request["p6"];
            string content = Request["con20"];
            if (Request["sendMail"] != null)
            {
                Guid sendBatchId = Guid.NewGuid();
                foreach (Guid to in userids)
                {
                    SystemMessengerManager.CreateNotificationMessage(_caller, new Guid(_caller.UserID), to, subject, content, sendBatchId, ObjectTypeCodes.Meeting, new Guid(strid));
                }

                #region send people

                //foreach (Entity entity in entities)
                //{
                //    SystemUser user = new SystemUser(entity);
                //    SystemMessengerManager.CreateNotificationMessage(_caller, new Guid(_caller.UserID), user.ID, subject, content, sendBatchId, 1);
                //}
                #endregion
            }


            if (Request["sendSms"] != null)
            {
                #region send people
                QueryExpression queryExp = new QueryExpression();
                ConditionExpression cond = new ConditionExpression();
                if (Request["allPeople"] != null)
                {
                    //发送所有
                    cond.AttributeName = "MobilePhone";
                    cond.Operator = ConditionOperator.NotNull;
                    queryExp.Criteria.Add(cond);

                    cond = new ConditionExpression();
                    cond.AttributeName = "IsDisabled";
                    cond.Operator = ConditionOperator.Equal;
                    cond.Values = new object[] { 0 };
                    queryExp.Criteria.Add(cond);

                    EntityCollection cols = SecurityAuth.GetUsers(_caller, queryExp);
                    foreach (Entity entity in cols)
                    {
                        SystemUser user = new SystemUser(entity);
                        SmsMessageManager.PushSmsQueue(_caller, user.ID, user.FullName, user.MobilePhone, content, 1, DateTime.Now, Id, Id);
                    }
                }
                else
                    SmsMessageManager.PushSmsQueueAndSend(_caller, userids, content, 100, DateTime.Now,Guid.NewGuid());
                #endregion

                #region send people
                //entities = GetTargetUsers();
                //foreach (Entity entity in entities)
                //{
                //    SystemUser user = new SystemUser(entity);
                //    SmsMessageManager.PushSmsQueue(_caller, user.ID, user.FullName, user.MobilePhone, content, 1, DateTime.Now, Id, Id);
                //}
                #endregion
            }

            //string save_new_url = Request["save_new_url"];
            string retURL = Request["retURL"];
            if (string.IsNullOrEmpty(retURL))
            {
                retURL = "/00V/detail?="+Id;// string.Format("/setup/own/groupdetail.aspx?id={0}&setupid=Groups", Id);
            }
            Response.Redirect(retURL);
        }
        /// <summary>
        /// 根据界面获取目标发送人
        /// </summary>
        /// <returns></returns>
        private EntityCollection GetTargetUsers()
        {
            EntityCollection entities = new EntityCollection();
            #region send people
            //发送
            QueryExpression queryExp = new QueryExpression();
            ConditionExpression cond = null;
            string deptType = Request["deptType"]; //选部门 0  @MyBusinessUnitId本部门
            if (deptType == "@MyBusinessUnitId")
            {
                cond = new ConditionExpression();
                cond.AttributeName = "BusinessUnitId";
                cond.Operator = ConditionOperator.Equal;
                cond.Values = new object[] { _caller.BussinessUnitId };
                queryExp.Criteria.Add(cond);

            }
            else
            {
                string businessUnitId_lkid = Request["businessUnitId_lkid"];
                if (!string.IsNullOrEmpty(businessUnitId_lkid))
                {
                    cond = new ConditionExpression();
                    cond.AttributeName = "BusinessUnitId";
                    cond.Operator = ConditionOperator.In;
                    cond.Values = businessUnitId_lkid.Split(',');
                    queryExp.Criteria.Add(cond);
                }
            }
            string strPostId = Request["PostId"]; //岗位
            string strTitleLevel = Request["TitleLevel"]; //岗位
            if (!string.IsNullOrEmpty(strPostId))
            {
                cond = new ConditionExpression();
                cond.AttributeName = "PostId";
                cond.Operator = ConditionOperator.In;
                cond.Values = strPostId.Split(',');
                queryExp.Criteria.Add(cond);
            }
            if (!string.IsNullOrEmpty(strTitleLevel))
            {
                cond = new ConditionExpression();
                cond.AttributeName = "TitleLevel";
                cond.Operator = ConditionOperator.In;
                cond.Values = strTitleLevel.Split(',');
                queryExp.Criteria.Add(cond);
            }
            if (queryExp.Criteria.Conditions.Count > 0)
            {
                entities = SecurityAuth.GetUsers(_caller, queryExp);
            }
            #endregion
            return entities;
        }
        void LoadRoles()
        {
            List<Role> entities = SecurityAuth.GetSystemRoles(_caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
            
            int i = 0;
            foreach (Role a in entities)
            {
                if (i > 0)
                    _options += ",";
                int qty = a.Quantity;
                string name = string.Format("{0}({1})", a.Name, qty);
                _options += string.Format("['A', '角色：{0}', 'A:{1}', '{0}', existingSelduel_select_0, '']", name, a.ID);
                i++;
            }
        }
        void LoadPublicGroups()
        {
            EntityCollection entities = GroupManager.GetPublicGroups(_caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
           
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _options += ",";
                int qty = MainUtil.GetInt(a.Fields["Quantity"].Value, 0);
                string name = string.Format("{0}({1})", a.Name, qty);
                _options += string.Format("['R', '小组：{0}', 'R:{1}', '{0}', existingSelduel_select_0, '']", name, a.ID);
                i++;
            }
        }
        void LoadPersonalGroups()
        {
            EntityCollection entities = GroupManager.GetPersonalGroups(_caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
          
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _options += ",";
                int qty = MainUtil.GetInt(a.Fields["Quantity"].Value, 0);
                string name = string.Format("{0}({1})", a.Name, qty);
                _options += string.Format("['P', '个人小组：{0}', 'P:{1}', '{0}', existingSelduel_select_0, '']", name, a.ID);
                i++;
            }
        }
        string _options = "";
        //string pageTitle = "";
        public string PageTitle
        {
            get { return pageTitle; }
        }
        string _message = "";
        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }
        public string AvaliableOptions { get { return _options; } }
        //AvaliableOptions
        /// <summary>
        /// 添加到对象
        /// </summary>
        public string AddToTitle { get; set; }
        public string ActionURL { get; set; }
        public string RelatedNoteListHTML { get; set; }

        public string RetURL { 
            get; 
            set; 
        }
    }
}