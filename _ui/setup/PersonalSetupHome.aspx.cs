using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;
using Supermore.Security;

namespace WebClient._ui.setup
{
    public partial class PersonalSetupHome : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();

            SystemUser systemUser = SecurityAuth.GetSystemUser(caller, new Guid(caller.UserID));
            this.FullName = systemUser.FullName;
        }

        public string FullName { get; set; }
        public string UserName { get; set; }
    }
}