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

using Supermore.Pipelines;
using Supermore.Pipelines.RenderForm;
using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;
using Supermore.Web;

namespace WebClient.apps.wf
{
    public partial class WFFormPrint : System.Web.UI.Page
    {
        private Guid formId = Guid.Empty;
        private string _instanceId = "";
        private Guid processInstanceId = Guid.Empty;
        private Guid _templateId = Guid.Empty;
        private CallContext caller = null;
        private CallContext _instanceCaller = null;
        private ProcessInstance procInstance = null;
        private Entity insEntity = null;
        private Template fTemplate = null;
        private string _ruleLogId = "";
        private Guid instanceOrganizationId = Guid.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _ruleLogId = Request["RuleLogId"];
            _instanceId = Request["InstanceId"];
            processInstanceId = new Guid(_instanceId);

            GetInstance(processInstanceId);
            GetRuleLog();
           
            //formId = Request["id"];
            //templateId = Request["templateid"];
            formId = procInstance.ProcessScheme.EntityLayoutId;
            if (formId != Guid.Empty)
            {
                RenderFormArgs args = new RenderFormArgs();
                args.RenderMode = FormEditMode.View;
                args.ProcessInstanceId = processInstanceId;
                args.ProcessInstance = procInstance;
                args.FormId = formId;
                args.MasterTemplateId = _templateId;
                args.Caller = caller;

                _instanceCaller = caller;
                if (SiteUtil.IsMultipleCustomer)
                {
                    instanceOrganizationId = procInstance.OrganizationId;
                    if (instanceOrganizationId != caller.OrganizationId)
                    {
                        _instanceCaller = AppDataSource.GetCallerByCustomerId(instanceOrganizationId);
                        _instanceCaller.UserID = caller.UserID;
                        _instanceCaller.UserName = caller.UserName;
                        _instanceCaller.FullName = caller.FullName;
                        _instanceCaller.BussinessUnitId = caller.BussinessUnitId;
                        _instanceCaller.BussinessUnitName = caller.BussinessUnitName;
                        args.Caller = _instanceCaller;
                        caller = _instanceCaller;
                    }
                }
                else
                {
                    instanceOrganizationId = caller.OrganizationId;
                }

                args.OrganizationId = instanceOrganizationId;
                args.ProcessInstanceStatus = procInstance.StateCode;
                Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), _templateId);
                args.MasterTemplate = template;
                args.EntityData = EntityManager.GetEntity(caller, template, processInstanceId);
                args.QueryString = this.Request.QueryString;
                if (this.CurrentStepId != Guid.Empty)
                {
                    ActivityRightDefinition arDef = WfSchemeManager.GetStepRight(caller, procInstance.SchemeId, this.CurrentStepId);
                    if (arDef != null)
                        args.FieldRights = arDef.FieldRights;
                }
                // PipelineManager.GetInstance().RunPipeline
                CorePipeline.Run("renderForm", args);
                this.RenderHTML = args.ResultHTML;
                this.ObjectTypeCode = template.ObjectTypeCode.ToString();
            }
            Response.Write(this.RenderHTML);
        }
        public void GetInstance(Guid processInstanceId)
        {
            procInstance = WfInstanceManager.GetProcessInstance(processInstanceId);
            if (procInstance != null)
            {
                //_instance.fo
                // _processId = instance.SchemeId.ToString();
                // InstanceName = instance.Name;
                _templateId = procInstance.ProcessScheme.EntityObjectId;
                fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);
                //if (template != null)
                //{ 
                //    EntityDetailForm entityForm = new EntityDetailForm();
                //    entityForm.Template = template;
                //    Entity insEntity = EntityManager.GetEntity(caller, template, processInstanceId);
                //    entityForm.Entity = insEntity;
                //    entityForm.Render();
                //    html = entityForm.ResultHTML;
                //}
                //List<Entity> entities = WfInstanceManager.GetRuleLogs(processInstanceId);
                //RenderGrid(entities);
            }
        }
        public void GetRuleLog()
        {
            if (string.IsNullOrEmpty(_ruleLogId))
                return;
            TransitionLog tranLog = WfInstanceManager.GetRuleLog(caller, new Guid(_ruleLogId));
            this.CurrentStepId = tranLog.ToActivityId;
        }
        public string RenderHTML { get; set; }
        public string ObjectTypeCode { get; set; }
        public Guid CurrentStepId { get; set; }
    }
}