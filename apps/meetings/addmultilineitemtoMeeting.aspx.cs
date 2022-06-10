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
using Supermore.Meetings;

namespace WebClient.apps.meetings
{
    public partial class addmultilineitemtoMeeting : System.Web.UI.Page
    {
        private CallContext _caller;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            MeetingManager manager = new MeetingManager();
            string svyId = Request["svyId"];
            string strids = Request["ids"];
            if (!string.IsNullOrEmpty(strids))
            {
                Meeting meeting = manager.GetMeeting(_caller, new Guid(svyId));
                string[] ids = strids.Split(',');
                foreach (string str1 in ids)
                {
                    manager.AddMember(_caller, meeting, str1, "",0, 0, false);
                }
                manager.SynchBusinessUnit(_caller, new Guid(svyId));
            }
            Response.Redirect(string.Format("/00V/detail?id={0}", svyId));
        }
    }
}