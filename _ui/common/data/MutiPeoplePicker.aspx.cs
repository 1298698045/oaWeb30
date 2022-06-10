using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Security;
using Supermore.Activities;
using Supermore.EntityFramework.Entities;
using Supermore.Organization;
namespace WebClient._ui.common.data
{
    public partial class MutiPeoplePicker : System.Web.UI.Page
    {
        CallContext caller;
        string _options = "";
        string _userName;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _userName = caller.UserName;

            //LoadUsers();
            LoadPublicGroups();
            LoadPersonalGroups();
            LoadRoles();
        }
        /*
        ['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, ''], 
        ['R', '小组：开发一组组', 'R:00G90000001c3rI', '开发一组组', existingSelduel_select_0, '']
        ['U', '用户：liu jack', 'U:0059000000390Wh', 'liu jack', existingSelduel_select_0, '']
        ['A', '角色：CEO', 'A:00G90000002JvmM', 'ceo', existingSelduel_select_0, '']
        */
        void LoadRoles()
        {
            List<Role> users = SecurityAuth.GetSystemRoles(caller);

            if (!string.IsNullOrEmpty(_options) && users.Count > 0)
                _options += ",";
           
            int i = 0;
            foreach (Role a in users)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['A', '角色：{0}', 'A:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
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
                _options += string.Format("['P', '个人小组：{0}', 'P:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        void LoadPublicGroups()
        {
            EntityCollection entities = GroupManager.GetPublicGroups(caller);
            if (!string.IsNullOrEmpty(_options) && entities.Count>0)
                _options += ",";
           
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['R', '小组：{0}', 'R:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        void LoadUsers()
        {

        }

        public string SelectOptions { get { return _options; } }
    }
}