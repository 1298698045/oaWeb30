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
using Supermore.EntityFramework.Templates;
using Supermore.Meetings;

namespace WebClient.apps.meetings
{
    public partial class mtgSummary : System.Web.UI.Page
    {
        CallContext _caller = null;
        string t = "";
        string _wrappHTML = "";
        string _resultHTML = "";
        Template _template;
        Entity insEntity = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            string strId = Request["id"];
            t = Request["t"];
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                cancelURL = HttpUtility.UrlDecode(cancelURL);
                Response.Redirect(cancelURL);
            }
            if (Request["save"] != null)
            {
                SaveData();
            }
            insEntity = EntityManager.GetEntity(_caller, ObjectTypeCodes.MeetingSummary, new Guid(strId));
            if (insEntity != null)
            {
                this.Contents = StringUtil.GetString(insEntity.Fields["MeetingSummary"].Value);
                this.CTitle = insEntity.Name;
            }
            string retURL = Request["retURL"];
            RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
        }
        void SaveData()
        {

            string strId = Request["id"];
            _template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.MeetingSummary);
            string cpn4 = Request["cpn4"];
            if (!string.IsNullOrEmpty(strId))
            {
                insEntity = EntityManager.GetEntity(_caller, _template, new Guid(strId));
                if (insEntity == null)
                {
                    insEntity = new Entity(new Guid(strId), _template.ID, _caller.OrganizationId);
                }
            }
            #region form
            insEntity.BeginEdit();
            insEntity.Fields["MeetingSummary"].Value = cpn4;
            insEntity.Fields["CreatedBy"].Value = _caller.UserID;
            insEntity.Fields["CreatedOn"].Value = DateTime.Now;
            insEntity.Fields["ModifiedBy"].Value = _caller.UserID;
            insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
            #endregion
            string retURL = Request["retURL"];
            if (string.IsNullOrEmpty(retURL))
            {
                retURL = string.Format("/00V/detail?id={0}", strId);
            }
            bool isSaved = insEntity.EndEdit();
            if (isSaved)
            {
                Response.Redirect(retURL, true);
            }
        }
        public string Contents { get; set; }
        public string CTitle { get; set; }
    }
}