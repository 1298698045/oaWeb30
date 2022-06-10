using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Security;
using Youyou.Calendars;

namespace WebClient.ui.core.activity
{
    public partial class ReminderSettings : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();

            if (Request["save"] != null)
            {
                // Save();
             
                if (Request["sharecalendar_to_all"] != null)
                {
                    CalendarAccess.ShareAll(caller, new Guid(caller.UserID), true);
                }
                else
                    CalendarAccess.ShareAll(caller, new Guid(caller.UserID), false);

                if (Request["enableReminderSms"] != null)
                {
                    UserSettingsManager.EnableReminderSms(caller, true);
                }
                else
                {
                    UserSettingsManager.EnableReminderSms(caller, false);
                }
            }

            bool isEnableReminderSms = UserSettingsManager.IsEnableReminderSms(caller, new Guid(caller.UserID));
            if (isEnableReminderSms)
                this.HTMLEnableReminderSms = " checked ";
        }
        public string HTMLEnableReminderSms { get; set; }
    }
}