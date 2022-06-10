using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.Security;
using Supermore.Activities;
using Supermore.Organization;
using Youyou.Calendars;

namespace WebClient.apps.scontent
{
    public partial class ApproveInfo : System.Web.UI.Page
    {
        CallContext caller;
        string _options = "";
        string _userName;
        string parentId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Request["cancel"] != null)
            {
                string retURL = Request["cancelURL"];
                Response.Redirect(retURL);
            }
            caller = AppDataSource.GetCallContext();
            _userName = caller.UserName;
            if (Request["save"] != null)
            {
                SaveData();
            }
            if (!Page.IsPostBack)
            {
                string retURL = Request["retURL"];
                this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
            }
            LoadUsers();
            LoadRoles();
            LoadBusinessUnits();
        }
        void SaveData()
        {
            bool isUpdated = false;
            string duel1 = Request["duel1"];
            //U:443e0098-5d12-4a7f-a8e5-588c168f5c7d,A:633c3c66-059e-4b9c-a63f-87e4a1b0e2ee
            string p6 = Request["p6"];//日历访问权限
            Guid calendarId = new Guid(caller.UserID);
            int approveStatus = MainUtil.GetInt(Request["approveStatus"], 0);
            ContentManager.PulishNotice(caller, new Guid(parentId), approveStatus);

            int right = MainUtil.GetInt(p6, 0);
            if (!string.IsNullOrEmpty(duel1))
            {
                string[] strSelect = duel1.Split(',');
                for (int i = 0; i < strSelect.Length; i++)
                {
                    string[] v = strSelect[i].Split(':');
                    string type = v[0];
                    string value = v[1];
                    if (type == "U")
                    {
                        CalendarAccess.AssignUsers(caller, calendarId, new Guid[] { new Guid(value) }, right, "手动授权");
                    }
                    if (type == "A")
                    {
                        CalendarAccess.AssignRoles(caller, calendarId, new Guid[] { new Guid(value) }, right, "手动授权");
                    }
                }

            }
            if (!isUpdated)
            {
                //SecurityAuth.CreateUser(entity);
            }
            string retURL = Request["retURL"];
            string save_new_url = Request["save_new_url"];
            //if (saveNew)
            {
                //     Response.Redirect(save_new_url);
            }
            //else
            //{
            Response.Redirect(retURL);
            //}
        }
        void LoadUsers()
        {
            List<SystemUser> users = SecurityAuth.GetAllSystemUsers(caller);
            int i = 0;
            foreach (SystemUser user in users)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['U', '用户：{0}', 'U:{1}', '{0}', existingSelduel_select_0, '']", user.UserName, user.ID);
                i++;
            }
        }
        void LoadRoles()
        {
            List<Role> users = SecurityAuth.GetSystemRoles(caller);
            int i = 0;
            foreach (Role a in users)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['A', '角色：{0}', 'A:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        void LoadBusinessUnits()
        {
            List<BusinessUnit> users = OrganizationManager.GetBusinessUnits(caller);
            int i = 0;
            foreach (BusinessUnit a in users)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['B', '部门：{0}', 'B:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        public string SelectOptions { get { return _options; } }
    }
}