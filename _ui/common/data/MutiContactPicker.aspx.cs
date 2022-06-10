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

namespace WebClient._ui.common.data
{
    public partial class MutiContactPicker : System.Web.UI.Page
    {
        CallContext caller;
        string _options = "";
        string _userName;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _userName = caller.UserName;

            //LoadUsers();
            //LoadPublicGroups();
            //LoadPersonalGroups();
            // LoadRoles();
        }
    }
}