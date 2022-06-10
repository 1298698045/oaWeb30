using Supermore.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Supermore.apps.meetings
{
    public partial class meetingpeolst : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool todayEnable = Settings.GetBoolSetting("MeetingRoom.Today.Enable", true);
            if (!todayEnable)
            {
                return;
            }
        }
    }
}