using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;
using OA.Web.UI.WebControls;
using OA.Web.UI;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Meetings;

namespace WebClient.apps.meetings
{
    public partial class meetingResp : System.Web.UI.Page
    {
        CallContext _caller = null;
        string _id = "";
        string _formHTML = "";
        string _meetingId = "";
        MeetingManager meetngManager = new MeetingManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            this._id = Request["id"];
            _meetingId = this._id;
            MeetingManager meetngManager = new MeetingManager();
            Meeting meeting = meetngManager.GetMeeting(_caller, new Guid(_id));
            //_meetingId = meetingItem.Fields["MeetingId"].Value.ToString();
            string response = Request["response"];
            string leaveBillId = "";
            int IsMySelf = MainUtil.GetInt(Request["isMySelf"], 0);//是否本人参与
            if (Request["accept"] != null)
            {
               //SaveData();
            }
            if (Request["acceptjoin"] != null)
            {
                meetngManager.AcceptMeeting(_caller, new Guid(this._meetingId), IsMySelf, "");
                Response.Redirect(string.Format("/00V/detail?id={0}&readonly=1", _meetingId));
            }
            if (Request["decline"] != null)
            {
                meetngManager.DeclineMeeting(_caller, new Guid(this._meetingId), response, IsMySelf, "");
                Response.Redirect(string.Format("/00V/detail?id={0}&readonly=1", _meetingId));
            }
            Template _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), ObjectTypeCodes.Meeting);
            EntityDetailForm entityForm = new EntityDetailForm();
            Template masterTemplate = _template;
            entityForm.Template = masterTemplate;
            entityForm.Caller = _caller;
            Entity insEntity = EntityManager.GetEntity(_caller, masterTemplate, new Guid(_meetingId));
            this.PageTitle = insEntity.Name;
            entityForm.Entity = insEntity;
            entityForm.Render();
            _formHTML = entityForm.ResultHTML;

            RenderNoteList(this._meetingId, ObjectTypeCodes.Meeting);
        }
        void SaveData()
        {
            string res = Request["response"];
            string id = Request["id"];
            string accept = Request["accept"];
            //if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(res))
            if (string.IsNullOrEmpty(id))
                return;

           // meetngManager.SaveMeetingItem(_caller, new Guid(id), res);
            Response.Redirect(string.Format("/00V/detail?id={0}&readonly=1", _meetingId));
        }

        void RenderNoteList(string objectId, int objectTypeCode)
        {
            RelatedNoteList noteList = new RelatedNoteList();
            noteList.RelatedObjectId = objectId;
            noteList.RelatedObjectName = this.PageTitle;
            noteList.EntityTemplateCode = objectTypeCode;
            // noteList.AccessRight = attachRight;
            noteList.Caller = this._caller;
            noteList.RetURL = HttpUtility.UrlEncode(this.RetURL);
            //noteList.RetURL = HttpUtility.UrlEncode(string.Format("/apps/wf/InstanceDetail.aspx?t={0}&id={1}", tab, instanceId));
            noteList.Render();
            RelatedNoteListHTML = noteList.ResultHTML;

        }

        public string RelatedNoteListHTML { get; set; }

        public string RetURL
        {
            get;
            set;
        }
        public string PageTitle { get; set; }
        public string FormHTML
        {
            get { return _formHTML; }
            set { _formHTML = value; }
        } 
    }
}