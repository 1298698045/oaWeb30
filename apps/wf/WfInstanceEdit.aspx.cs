using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;

using Supermore;
using Supermore.Data;
//using Supermore.Data.DataProviders;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using OA.Web.UI.WebControls;
using Supermore.EntityFramework;


namespace WebClient.apps.wf
{
    public partial class WfInstanceEdit : System.Web.UI.Page
    {
        string instanceId = "";
        string _instanceName = "";
        string _processId = "";
        string html = "";
        string tBody = "";
        CallContext caller = null;
        Entity insEntity = null;
        Template fTemplate = null;
        Guid processInstanceId = Guid.Empty;
        ProcessInstance procInstance = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string instanceId = Request["id"];

            processInstanceId = new Guid(instanceId);
            procInstance = WfInstanceManager.GetProcessInstance(processInstanceId);
            caller = AppDataSource.GetCallContext();
            //GetToActivity(instanceId);
            if (Request["cancel"] != null)
            {
                Response.Redirect(string.Format("/apps/wf/InstanceDetail.aspx?t=122&id={0}", instanceId), true);
            }
            if (Request["save"] != null)
            {
                SaveData();
            }
            if (Request["save_new"] != null)
            {
                SaveData();
            }
            //instanceId = Request["id"];

            if (procInstance != null)
            {
                _processId = procInstance.SchemeId.ToString();
                InstanceName = procInstance.Name;
                this.ProcInstanceName = InstanceName;

                fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);
                this.ObjectTypeCode = fTemplate.ObjectTypeCode.ToString();
                if (fTemplate != null)
                {
                    
                    EntityEditForm entityForm = new EntityEditForm();
                    entityForm.Template = fTemplate;
                    entityForm.Caller = caller;
                    insEntity = EntityManager.GetEntity(caller, fTemplate, processInstanceId);
                    if (insEntity != null)
                        entityForm.Entity = insEntity;

                    entityForm.Render();
                    html = entityForm.ResultHTML;
                }
                //List<Entity> entities = WfInstanceManager.GetRuleLogs(processInstanceId);
                //RenderGrid(entities);
            }
            
        }

        void SaveData()
        {
            fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);
            bool isCreated = false;
            insEntity = EntityManager.GetEntity(caller, fTemplate, processInstanceId);
            if (insEntity == null)
            {
                insEntity = new Entity(processInstanceId, fTemplate.ID, new Guid(caller.CustomerID));
                isCreated = true;
            }            
               

            insEntity.BeginEdit();

            foreach (Supermore.EntityFramework.Templates.TemplateField tfield in this.fTemplate.Fields)
            {
                string fName = tfield.Name;
                string val = "";
                switch (tfield.FieldType.DType)
                {
                    case FieldTypeNames.Lookup:
                    case FieldTypeNames.MasterDetail:
                        val = Request[fName + "_lkid"];
                        break;
                    default:
                        val = Request[fName];
                        if (!string.IsNullOrEmpty(val))
                        {
                            val = val.Trim();
                        }
                        break;
                }
                if (!string.IsNullOrEmpty(val))
                {
                    Field field = insEntity.Fields[fName];
                    if (field != null)
                    {
                        field.Value = val;
                    }
                }
            }
            /*
            foreach (string key in HttpContext.Current.Request.Form.Keys)
            {
                if (string.IsNullOrEmpty(key)) continue;
                Field field = insEntity.Fields[key];
                if (field != null)
                {
                    field.Value = Request[key];
                }
            }
            foreach (string key in HttpContext.Current.Request.QueryString.Keys)
            {
                if (string.IsNullOrEmpty(key)) continue;
                Field field = insEntity.Fields[key];
                if (field != null)
                {
                    string val = Request[key];
                    if (!string.IsNullOrEmpty(val))
                        val = val.Trim();
                    field.Value = val;
                }
            }
            */
            if (isCreated)
            {
                insEntity.Fields["CreatedOn"].Value = DateTime.Now;
                insEntity.Fields["CreatedBy"].Value = caller.UserID;
                insEntity.Fields["ModifiedBy"].Value = caller.UserID;
            }
            else
            {
                insEntity.Fields["ModifiedBy"].Value = caller.UserID;
                insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
            }

            bool isSaved = insEntity.EndEdit();
            if (isSaved)
            {
                Response.Redirect("/apps/wf/InstanceDetail.aspx?t=123&id=" + processInstanceId,true);
            }
        }
        
        void GetToActivity(string procInstanceId)
        {
            ProcessInstance instance = WfInstanceManager.GetProcessInstance(new Guid(procInstanceId));
            this.ProcInstanceName = instance.Name;

            /*
            ProcessDefinition processScheme = instance.ProcessScheme;
            //instance.CurrentActivity
            ActivityDefinition initActivity = processScheme.InitialActivity;
            
            ActivityDefinition nextActivity = null;

            IEnumerable<TransitionDefinition> trans = processScheme.GetPossibleTransitionsForActivity(initActivity);
            TransitionDefinition tranDef = null;
            foreach (TransitionDefinition t in trans)
            {
                tranDef = t;
                nextActivity = t.To;

                this.RuleId = t.ID.ToString();

                this.FromStepId = t.FromActivityId.ToString();
                this.FromStepName = t.From.Name;

                this.ToStepId = t.ToActivityId.ToString();
                this.ToStepName = nextActivity.Name;

            }

            ParticipantDefinition nextParticipant = null;
            //获取下一步的执行人
            nextParticipant = WfSchemeManager.GetParticipantor(processScheme.ID, nextActivity.ActivityCode);

            if (nextParticipant.MSelectType == 0) //定义时候指定
            {

            }
            else if (nextParticipant.MSelectType == 1) //来源环节指定
            {

            }
            */
        }
        public string NextExecutorName { get; set; }
        public string NextExecutorId { get; set; }
        public string ToStepId { get; set; }
        public string ToStepName { get; set; }

        public string FromStepId { get; set; }
        public string FromStepName { get; set; }
        public string StartByName { get; set; }
        public string ProcInstanceName { get; set; }
        public string RuleId { get; set; }

        public string BodyText
        {
            get { return tBody; }
        }

        public string InstanceId
        {
            get { return instanceId; }
            set { instanceId = value; }
        }
        public string InstanceName
        {
            get { return _instanceName; }
            set { _instanceName = value; }
        }
        public string ProcessId
        {
            get { return _processId; }
            set { _processId = value; }
        }
        public string ResultHTML
        {
            get { return html; }
            set { html = value; }
        }
        public string ObjectTypeCode { get; set; }
    }
}