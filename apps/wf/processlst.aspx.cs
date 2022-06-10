using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Security.SecurityControl;

namespace WebClient.apps.wf
{
    public partial class processlst : System.Web.UI.Page
    {
        CallContext _caller;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();

            if (!AuthorizationManager.TabIsAllowed(_caller, "wfdefinition", new Guid(_caller.UserID)))
            {
                Response.Redirect("/home/home.aspx");
            }
        }
    }
}