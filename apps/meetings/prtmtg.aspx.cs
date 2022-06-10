using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Meetings;
using OA.Web.UI.WebControls;
using OA.Web.UI;
using Supermore.Web;

namespace WebClient.apps.meetings
{
    public partial class prtmtg : System.Web.UI.Page
    {
        string _id = "";
        CallContext _caller = null;
        Meeting _meeting = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._id = Request["id"];
            _caller = AppDataSource.GetCallContext();
            GetMeeting();
        }
        void GetMeeting()
        {
            Entity entity = null;
            if (!string.IsNullOrEmpty(_id))
                entity = EntityManager.GetEntity(_caller, ObjectTypeCodes.Meeting, new Guid(_id));
            //_meeting = new Meeting(entity);
            this.EntityName = entity.Name;
            

            EntityFormBasePageTemplate formRender = new EntityFormBasePageTemplate();
            if (Request["exitQcode"] == "1")
                formRender.PageTemplateVirtualPath = "~/App_Data/PageTemplates/meeting/prtmeetingexitqcode.htm";
            else
                formRender.PageTemplateVirtualPath = "~/App_Data/PageTemplates/meeting/prtmeeting.htm";
            formRender.Caller = _caller;
            formRender.Entity = entity;
            if (entity != null)
                formRender.Template = entity.Template;
            else
                formRender.Template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.Meeting);
            formRender.Render();
            EntityFormBody = formRender.ResultHTML;
            //只打印 已提交的
            MeetingManager meetngManager = new MeetingManager();
            List<MeetingItem> items = meetngManager.GetSubmitMeetingItems(_caller, new Guid(_id));
            StringBuilder sb = new StringBuilder();
            foreach (MeetingItem item in items)
            {
                string content = item.Description;
                content = content.Replace("\r\n", "<br/>");
                string createBy = string.Format("{0} <span style='font-size:11px;color: #505050;'>{1}</span>", item.OwningUserName, item.OwningBusinessUnitName);
                sb.AppendFormat(" <div style=\"display: block;\"  class=\"card\"><div style=\"display: block;\" class=\"cardInner\"><div><span class=\"label\">{0}</span><a href=\"/?id={1}\" class=\"fr small\"></a></div><div class=\"scrollable mt8\" style=\"\"><div class=\"content\">{2}</div> </div></div> </div>", createBy, item.MeetingItemId, content);
            }
            this.MeetingItemHTML = sb.ToString();
            string mobileSite = SiteUtil.SiteRootMobile;
            this.MeetingItemHTML = this.MeetingItemHTML.Replace("{!SiteRoot.Mobile}", mobileSite);

            //签到人

        }
        public string EntityFormBody { get; set; }

        public string MeetingItemHTML { get; set; }
        public Meeting Meeting
        {
            get { return _meeting; }
        }
        public string EntityName { set; get; }
    }
}