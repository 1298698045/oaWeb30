using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using OA.Web.UI.WebControls;
using OA.Web.UI;

namespace WebClient.apps
{
    public partial class RecDetail : System.Web.UI.Page
    {
        CallContext _caller = null;
        Template _template;
        int _typeCode = 0;
        string _formHTML = "";
        string _id = "";
        string _templateCode = "";
        private string _pageTitle = "";
        private string _tabCss = "";
        int attachRight = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            _templateCode = Request["t"];
            this.EntityId = Request["id"];
            this._id = EntityId;
            _caller = AppDataSource.GetCallContext();
            this.FromURL = Request["retURL"];
            this.RetURL = string.Format("/{0}/detail?id={1}", _templateCode, this._id);
            this.attachRight = MainUtil.GetInt(Request["attachRight"], 8);

            GetTemp();
            RenderViewForm();
           
        }
        void GetTemp()
        {
            SystemAppTab tab = SystemAppTabs.GetTab(_templateCode);
            if (tab != null)
            {
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), _templateCode);
                if (_template == null)
                {
                    if (tab.TemplateId != Guid.Empty)
                    {
                        _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), tab.TemplateId);
                    }
                }
                this._tabCss = tab.TabCss + "Tab";
            }
            else
            {
                this._tabCss = "accountTab";
            }
            if (_template == null)
            {
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), _templateCode);
                
            }
            if (_template != null)
            {
                _typeCode = _template.ObjectTypeCode;
                _pageTitle = _template.Title;
                this._entityTitle = _template.Title;
                if (!string.IsNullOrEmpty(_template.EditPageUrl))
                {
                    if(_template.EditPageUrl.IndexOf('?')>-1)
                        this.EditURL = string.Format("{0}&id={1}&retURL={2}",_template.EditPageUrl,this.EntityId,HttpUtility.UrlEncode(this.RetURL));
                    else
                        this.EditURL = string.Format("{0}?id={1}&retURL={2}", _template.EditPageUrl, this.EntityId, HttpUtility.UrlEncode(this.RetURL));
                    //<%=EntityCode%>/e?id=<%=EntityId%>&retURL=<%=RetURL%>
                    //<%=EntityCode%>/e?id=<%=EntityId%>&retURL=<%=RetURL%
                }
                else
                {
                    this.EditURL = string.Format("/{0}/e?id={1}&retURL={2}",this.EntityCode,this.EntityId,HttpUtility.UrlEncode(this.RetURL));
                }
            }
        }
        void RenderViewForm()
        {
            if (string.IsNullOrEmpty(_id)) return;
            try
            {
                EntityDetailForm entityForm = new EntityDetailForm();
                //Template masterTemplate = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.HREmployee);
                Template masterTemplate = _template;
                entityForm.Template = masterTemplate;
                entityForm.Caller = _caller;
                Entity insEntity = EntityManager.GetEntity(_caller, masterTemplate, new Guid(_id));
                entityForm.Entity = insEntity;
                entityForm.Render();
                _formHTML = entityForm.ResultHTML;

                this.EntityName = insEntity.Name;
                EntityRelatedListControl entityRelatedListControl = new EntityRelatedListControl();
                entityRelatedListControl.Caller = this._caller;
                entityRelatedListControl.EntityDataId = new Guid(_id);
                entityRelatedListControl.EntityDataIdName = EntityName;
                entityRelatedListControl.EntityLayoutId = masterTemplate.ID.ToString();
                entityRelatedListControl.RetURL = HttpUtility.UrlEncode(this.RetURL);
                entityRelatedListControl.Render();

                RelatedListHTML = entityRelatedListControl.RelatedListHTML;

                RenderNoteList(_id, masterTemplate.ObjectTypeCode);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }

        void RenderNoteList(string objectId,int objectTypeCode)
        {
            RelatedNoteList noteList = new RelatedNoteList();
            noteList.RelatedObjectId = objectId;
            noteList.RelatedObjectName = this.EntityName;
            noteList.EntityTemplateCode = objectTypeCode;
            noteList.AccessRight = attachRight;
            noteList.Caller = this._caller;
            noteList.RetURL = HttpUtility.UrlEncode(this.RetURL);
            //noteList.RetURL = HttpUtility.UrlEncode(string.Format("/apps/wf/InstanceDetail.aspx?t={0}&id={1}", tab, instanceId));
            noteList.Render();
            RelatedNoteListHTML = noteList.ResultHTML;
        }

        public string EntityId { get; set; }
        public string EntityName { set; get; }

        string _entityTitle = "";
        public string EntityDisplayName
        {
            get { return _entityTitle; }
        }
        public string TabCss
        {
            get { return _tabCss; }
        }
        public string EntityCode
        {
            get { return _templateCode; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }

        public string FormHTML
        {
            get { return _formHTML; }
            set { _formHTML = value; }
        }

        public string RelatedNoteListHTML { get; set; }
        public string RelatedListHTML { set; get; }
        public string FromURL { get; set; }
        public string RetURL { get; set; }

        public string ReturnURL { get; set; }

        public string EditURL { get; set; }
    }
}