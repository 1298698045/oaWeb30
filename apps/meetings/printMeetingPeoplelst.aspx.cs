using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Meetings;
using OA.Web.UI.WebControls;
using OA.Web.UI;
using System.Text;

namespace WebClient.apps.meetings
{
    public partial class printMeetingPeoplelst : System.Web.UI.Page
    {
        CallContext _caller = null;
        Template _template;
        string _id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            this._id = Request["id"];
            GetPeoples();
        }

        void GetPeoples()
        {
            MeetingManager meetngManager = new MeetingManager();
            List<MeetingPeople> list = null;
            Meeting meeting = meetngManager.GetMeeting(_caller, new Guid(_id));
            this.Subject = meeting.Subject;
            this.ScheduledStart = meeting.ScheduledStart.ToString("yyyy-MM-dd HH:mm");
            bool isClockIn = false;
            if (Request["Status"] == "1")
            {
                list = meetngManager.GetMeetingNotCheckInPeoples(_caller, new Guid(_id));
                isClockIn = false;
            }
            else
            {
                list = meetngManager.GetMeetingCheckInPeoples(_caller, new Guid(_id));
                isClockIn = true;
            }
           StringBuilder sb = new StringBuilder();
           sb.Append("<table class=\"list\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" ");
           if (!isClockIn)
           {
               sb.Append(" style=\"font-size:30px;color:red;\"");
           }
           sb.Append(" >");
           sb.Append(" <tr class=\"headerRow\">");
           sb.Append(" <th scope=\"col\" class=\" zen-deemphasize\" style='width:80px;'>序号</th>");
           sb.Append(" <th scope=\"col\" class=\" zen-deemphasize\">单位部门</th>");
           sb.Append(" <th scope=\"col\" class=\" zen-deemphasize\">姓名</th>");
           if (isClockIn)
           {
               sb.Append(" <th scope=\"col\" class=\" zen-deemphasize\">签到时间</th>");
               sb.Append("  <th scope=\"col\" class=\" zen-deemphasize\">签退时间</th>");
           }
           sb.Append("  <th scope=\"col\" class=\" zen-deemphasize\">备注</th>");
           sb.Append("</tr>");
           //  <th scope="col" class=" zen-deemphasize">联系电话</th>
           //<th scope="col" class=" zen-deemphasize">电话</th>
           int rowNum = 1;
           foreach (MeetingPeople peo in list)
           {
               sb.Append("<tr class=\" dataRow odd\" >");
               string style = "";
               if (!isClockIn)
               {
                   style = " style=\"font-size:35px;color:red !important;\"";
               }
               //sb.Append(" >");
               sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", rowNum);
               sb.AppendFormat("<td class=\" dataCell  \" {1}>{0}</td>", peo.BusinessUnitIdName, style);
               sb.AppendFormat("<td class=\" dataCell  \" nowrap='nowrap' {1}>{0}</td>", peo.OwningUserName, style);
               if (isClockIn)
               {
                   sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", peo.Checkin);
                   sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", peo.Clockout);
               }
               sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", peo.Description);
               sb.Append("</tr>");
               rowNum++;
           }
           this.GridHTML = sb.ToString();
        }
        public string GridHTML { get; set; }

        public string Subject { get; set; }
        public string ScheduledStart { get; set; }
    }
}