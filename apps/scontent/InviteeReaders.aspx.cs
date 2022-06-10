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
using Supermore.Configuration;
using Supermore.Security;
using Supermore.Contents;
using Supermore.Emails;
using Supermore.Mobile;
using Supermore.Messenger;
using Supermore.Data.Query;
using Supermore.Organization;

namespace WebClient.apps.scontent
{
    public partial class InviteeReaders : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            //this.PageTitle = "通知";
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
            string retURL = Request["retURL"];
            this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
            string save_new_url = this.Request.RawUrl; ;
            this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", save_new_url);

            GetData();
            //LoadUsers();
            LoadPublicGroups();
            LoadPersonalGroups();
            LoadRoles();
            LoadTitleLevels();
            LoadPosts();
        }
        void SaveData()
        {
            string strinviteeAll = Request["inviteeAll"];
            string Id = Request["id"];
           // bool isUpdated = false;
            Guid orgId = new Guid(caller.CustomerID);
            Guid contentId = new Guid(Id);
           
            string duel1 = Request["duel1"];
            Guid[] userids = new Guid[] { }; 
            if (!string.IsNullOrEmpty(duel1))
            {
                string[] pa = duel1.Split(',');
                for (int i = 0; i < pa.Length; i++)
                {
                    //A:6c27e345-7af4-42aa-bcc3-23ed06b27d9a
                    string tmp1 = pa[i];
                    string[] members = tmp1.Split(':');
                    Guid memberid = new Guid(members[1]);
                    if (members[0].EndsWith("A", StringComparison.InvariantCultureIgnoreCase)) //角色
                    {
                        //get roles
                        List<SystemUser> users = SecurityAuth.GetRoleSystemUsers(caller, memberid);
                        foreach (SystemUser user in users)
                        {
                            Array.Resize<Guid>(ref userids, userids.Length + 1);
                            userids[userids.Length - 1] = user.ID;
                            // toUserNames += user.FullName + ",";
                            ContentManager.InviteContentReader(caller, contentId, user.ID, user.FullName);
                            
                        }
                    }
                    else if (members[0].EndsWith("P", StringComparison.InvariantCultureIgnoreCase) || members[0].EndsWith("R", StringComparison.InvariantCultureIgnoreCase))//个人小组与公用小组
                    {
                        EntityCollection users = SecurityAuth.GetGroupMembers(caller, memberid);
                        foreach (Entity entity in users)
                        {
                            Array.Resize<Guid>(ref userids, userids.Length + 1);
                            userids[userids.Length - 1] = MainUtil.GetGuid(entity.Fields["RegardingObjectId"].Value);
                            //toUserNames += StringUtil.GetString(entity.Fields["RegardingObjectIdName"].Value) + ",";
                            Guid userId1 = MainUtil.GetGuid(entity.Fields["RegardingObjectId"].Value);
                            string userName = StringUtil.GetString(entity.Fields["RegardingObjectIdName"].Value);
                            ContentManager.InviteContentReader(caller, contentId, userId1, userName);
                        }
                    }
                    else if (members[0].EndsWith("U", StringComparison.InvariantCultureIgnoreCase))//用户
                    {
                        Array.Resize<Guid>(ref userids, userids.Length + 1);
                        userids[userids.Length - 1] = memberid;                        
                        string userName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, memberid);
                        ContentManager.InviteContentReader(caller, contentId, memberid, userName);
                        //ContentManager.InviteContentReader(caller, contentId, memberid, userName);
                    }
                }

            }

            //添加邀请
            EntityCollection entities = GetTargetUsers();
            foreach (Entity entity in entities)
            {
                SystemUser user = new SystemUser(entity);
                ContentManager.InviteContentReader(caller, contentId, user.ID, user.FullName);
               
            }
            string excludeUsers = Request["groupUser"];
            ContentManager.ExcludeContentReaders(caller, contentId, excludeUsers);
            string subject = Request["p6"];
            string content = Request["con20"];
            Guid sendBatchId = Guid.NewGuid();

            if (Request["sendMail"] != null)
            {
                int objectTypeCode = MainUtil.GetInt(Request["type"],ObjectTypeCodes.Content);
                foreach (Guid to in userids)
                {
                    SystemMessengerManager.CreateNotificationMessage(caller, new Guid(caller.UserID), to, subject, content, sendBatchId, objectTypeCode, contentId);
                }

                #region send people
               
                foreach (Entity entity in entities)
                {
                    SystemUser user = new SystemUser(entity);
                    SystemMessengerManager.CreateNotificationMessage(caller, new Guid(caller.UserID), user.ID, subject, content, sendBatchId, objectTypeCode, contentId);
                }
                #endregion
            }


            if (Request["sendSms"] != null && !string.IsNullOrEmpty(content))
            {
                #region send people
                /*
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

                    EntityCollection cols = SecurityAuth.GetUsers(caller, queryExp);
                    foreach (Entity entity in cols)
                    {
                        SystemUser user = new SystemUser(entity);
                        SmsMessageManager.PushSmsQueue(caller, user.ID, user.FullName, user.MobilePhone, content, 1, DateTime.Now, Id, Id);
                    }
                }
                else
                    */
                SmsMessageManager.PushSmsQueueAndSend(caller, userids, content, 100, DateTime.Now,sendBatchId);
                #endregion

                    #region send people
                    //entities = GetTargetUsers();
                    foreach (Entity entity in entities)
                    {
                        SystemUser user = new SystemUser(entity);
                        SmsMessageManager.PushSmsQueue(caller, user.ID, user.FullName, user.MobilePhone, content, 1, DateTime.Now, Id, Id);
                    }
                    #endregion
            }
            
            //string save_new_url = Request["save_new_url"];
            string retURL = Request["retURL"];
            if (string.IsNullOrEmpty(retURL))
            {
                retURL = "/091/o";// string.Format("/setup/own/groupdetail.aspx?id={0}&setupid=Groups", Id);
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
                cond.Values = new object[] { caller.BussinessUnitId };
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
                entities = SecurityAuth.GetUsers(caller, queryExp);
            }
            #endregion
            return entities;
        }

        void GetData()
        {
            string Id = Request["id"];
            this.PageTitle = EntityManager.GetEntityName(caller, EntityTemplateIDs.Notice, new Guid(Id));
            //this.ContentTitle = EntityManager.GetEntityName(caller, EntityTemplateIDs.Content, new Guid(Id));
            this.PageTitle =  this.ContentTitle;
        }
        void LoadRoles()
        {
            List<Role> entities = SecurityAuth.GetSystemRoles(caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count>0)
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
            EntityCollection entities = GroupManager.GetPublicGroups(caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
          
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                {
                    _options += ",";
                    SelectedOptions += ",";
                }
                int qty = MainUtil.GetInt(a.Fields["Quantity"].Value,0);
                string name = string.Format("{0}({1})", a.Name, qty);
                _options += string.Format("['R', '小组：{0}', 'R:{1}', '{0}', existingSelduel_select_0, '']", name, a.ID);
                SelectedOptions += string.Format("<option value='R:{0}'>{1}</option>", a.ID, a.Name);
                i++;
            }
        }
        void LoadPersonalGroups()
        {
            EntityCollection entities = GroupManager.GetPersonalGroups(caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
          
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _options += ",";
                int qty = MainUtil.GetInt(a.Fields["Quantity"].Value, 0);
                string name = string.Format("{0}({1})",a.Name , qty);
                _options += string.Format("['P', '个人小组：{0}', 'P:{1}', '{0}', existingSelduel_select_0, '']", name, a.ID);
                i++;
            }
        }
        /// <summary>
        /// 加载职级
        /// </summary>
        void LoadTitleLevels()
        {
            EntityCollection entities = StringEnumManager.GetFieldPicklist(caller, ObjectTypeCodes.SystemUser, "TitleLevel");
            StringBuilder sb = new StringBuilder();
            int i = 0;

            string[] vals = new string[] { };
            //if (fieldValues.ContainsKey("TitleLevel"))
            //{
            //    string str1 = (string)fieldValues["TitleLevel"];
            //    vals = str1.Split(' ');
            //}
            int line = 0;
            foreach (Entity entity in entities)
            {
                string vText = StringUtil.GetString(entity.Fields["Value"].Value);
                string aValue = StringUtil.GetString(entity.Fields["AttributeValue"].Value);
                string strCheck = " ";
                //if (Array.IndexOf(vals, aValue) > -1)
                //    strCheck = " checked='checked'";
                if (line >= 10)
                {
                    sb.Append("<br/>");
                    line = 0;
                }

                sb.AppendFormat("<div style='white-space: nowrap;display:inline' ><input type='checkbox' name='TitleLevel' id='TitleLevel_{0}' title='{1}' value='{2}' {3} /><span style=\"display:inline-block;cursor:pointer;\"> &nbsp;{1}&nbsp;</span></div>", i, vText, aValue, strCheck);
                i++;
                line++;
            }
            this.TitleLevelHTML = sb.ToString();
        }
        void LoadPosts()
        {
            EntityCollection entities = StringEnumManager.GetFieldPicklist(caller, ObjectTypeCodes.SystemUser, "PostId");
            StringBuilder sb = new StringBuilder();
            int i = 0;
            string[] vals = new string[] { };
            //if (fieldValues.ContainsKey("PostId"))
            //{
            //    string str1 = (string)fieldValues["PostId"];
            //    vals = str1.Split(' ');
            //}
            int line = 0;
            foreach (Entity entity in entities)
            {
                string strCheck = " ";
                string v = StringUtil.GetString(entity.Fields["Value"].Value);
                string aValue = StringUtil.GetString(entity.Fields["AttributeValue"].Value);

                if (line >= 10)
                {
                    sb.Append("<br/>");
                    line = 0;
                }
                //if (Array.IndexOf(vals, aValue) > -1)
                //    strCheck = " checked='checked'";

                sb.AppendFormat("<div style='white-space: nowrap;display:inline' ><input type='checkbox' name='PostId' id='PostId_{0}' title='{1}' value='{2}' {3} /><span style=\"display:inline-block;cursor:pointer;\"> &nbsp;{1}&nbsp;</span></div>", i, v, aValue, strCheck);

                line++;
                i++;
            }
            this.PostHTML = sb.ToString();

            //LoadDepts();
        }
       
        public string DeptIds { get; set; }
        public string DeptNames { get; set; }


        public string TitleLevelHTML { get; set; }
        public string PostHTML { get; set; }
        string _options = "";
        public string AvaliableOptions { get { return _options; } }
        /// <summary>
        /// 已选组
        /// </summary>
        public string SelectedOptions { get; set; }
        public string PageTitle { get; set; }

        public string ContentTitle { get; set; }
    }
}