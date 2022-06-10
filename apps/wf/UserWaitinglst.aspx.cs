using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
/*using Supermore.Data.Query;*/
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.GridBuilder;
using OA.Web.UI;
using OA.Web.UI.FieldControls;
using OA.Web.UI.WebControls;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;

namespace WebClient.apps.wf
{
    public partial class UserWaitinglst : System.Web.UI.Page
    {
        private CallContext _caller;
        string userId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            userId = Request["id"];
            _caller = AppDataSource.GetCallContext();
            GetList();
        }

        void GetList()
        {
           IEnumerable<TransitionLog> logs = WfInstanceManager.GetUserUnfinishedTransitions(_caller, userId);
           RenderGrid(logs);
           //foreach (TransitionLog log in logs)
           //{
           //    RenderGrid(log);
           //}
        }

        string tBody = "";
        void RenderGrid(IEnumerable<TransitionLog> logs)
        {
            int mode = 2;
            string retURL = HttpUtility.UrlEncode(Request.RawUrl);
            int iRow = 1;
            foreach (TransitionLog entity in logs)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);
                //action
                //tRow += string.Format("<td  class=\" actionColumn  \"><a title=\"编辑 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('')\">编辑</a>&nbsp;|&nbsp;<a class=\"actionLink\" href=\"ProcStepFieldPriv.aspx?t=121&procid={0}&stepid={1}&retURL={2}\" title=\"流程、正文附件、字段访问权限 - 记录  - \">权限</a></td>",procId, entity.ID, retURL);
                tRow += string.Format("<td  class=\" actionColumn  \"><a class=\"actionLink\" target='_blank' href=\"/122/detail?id={0}\" title=\"{2} - 记录  - {1}\">查看</a>&nbsp;|&nbsp;", entity.ProcessInstanceId, entity.InstanceName, iRow);
                tRow += string.Format("<a class=\"actionLink\" href=\"/122/detail?id={0}\" title=\"催办  - \">催办</a></td>",entity.ProcessInstanceId);
                //name
                tRow += string.Format(" <td class=\"dataCell\"><a class=\"actionLink\" target='_blank' href=\"/122/detail?id={0}\">{1}</a></td>", entity.ProcessInstanceId, entity.InstanceName);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", entity.ToActivityName);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", entity.FromActivityName);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", entity.Deadline);
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", entity.);
                tRow += string.Format("<td class=\" dataCell  \">{0}</td>", entity.CreatedOn);
                tRow += "</tr>";
                tBody += tRow;
                mode++;
                iRow++;
            }
        }

        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string UserName { get; set; }
    }
}