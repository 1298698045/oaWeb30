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
using Supermore.ScriptEngine;

namespace WebClient.apps.wf
{
    public partial class SubfrmEdit : System.Web.UI.Page
    {
        Guid formId = Guid.Empty;
        string _instanceId = "";
        Guid processInstanceId = Guid.Empty;
        Guid _templateId = Guid.Empty;
        CallContext caller = null;
        ProcessInstance procInstance = null;
        Entity insEntity = null;
        Template fTemplate = null;
        string _ruleLogId = "";
        string _isPreview = "";
        string _id = "";
        private Guid instanceOrganizationId = Guid.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _ruleLogId = Request["RuleLogId"];
            _instanceId = Request["InstanceId"];
            _templateId = new Guid(Request["templateId"]);
            processInstanceId = new Guid(_instanceId);
            _isPreview = Request["isPreview"];
            _id = Request["id"];
            GetInstance(processInstanceId);
            GetRuleLog();
            if (Request["btnSaveData"] == "1")
            {
                SaveFormData();
            }

            //formId = Request["id"];
            //templateId = Request["templateid"];
            //formId = procInstance.ProcessScheme.EntityLayoutId;
            formId = _templateId;
            if (formId != Guid.Empty)
            {
                RenderFormArgs args = new RenderFormArgs();
                if (_isPreview == "1")
                    args.RenderMode = FormEditMode.View;
                else
                    args.RenderMode = FormEditMode.Edit;
                args.QueryString = this.Request.QueryString;
                args.IsSlaveEntity = true;
                args.ProcessInstanceId = processInstanceId;
                args.ProcessInstance = procInstance;
                args.ProcessRuleLogId = MainUtil.GetGuid(_ruleLogId);
                args.FormId = formId;
                args.MasterTemplateId = _templateId;
                args.SlaveTemplateId = _templateId;
                args.Caller = caller;

                instanceOrganizationId = procInstance.OrganizationId;
                
                args.OrganizationId = instanceOrganizationId;
                args.ProcessInstanceStatus = procInstance.StateCode;

                fTemplate = TemplateManager.GetTemplate(new Guid(caller.CustomerID), _templateId);
                if (fTemplate != null)
                {
                    args.MasterTemplate = fTemplate;
                    args.SlaveTemplate = fTemplate;
                }
                if (!string.IsNullOrEmpty(_id))
                    args.EntityData = EntityManager.GetEntity(caller, fTemplate, new Guid(_id));
                args.RetURL = this.Request["RetURL"];
                if (this.CurrentStepId != Guid.Empty)
                {
                    ActivityRightDefinition arDef = WfSchemeManager.GetStepRight(caller, procInstance.SchemeId, this.CurrentStepId);
                    if (arDef != null)
                        args.FieldRights = arDef.FieldRights;
                }
                // PipelineManager.GetInstance().RunPipeline
                CorePipeline.Run("renderForm", args);
                this.RenderHTML = args.ResultHTML;
                this.ObjectTypeCode = fTemplate.ObjectTypeCode.ToString();
            }
            Response.Write(this.RenderHTML);
        }

        private void SaveFormData()
        {
            bool isCreated = false;
            int fieldChanges = 0;
            try
            {
                if (fTemplate == null)
                {
                    fTemplate = TemplateManager.GetTemplate(new Guid(caller.CustomerID), _templateId);
                }
                //fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);

                if (!string.IsNullOrEmpty(_id))
                {
                    insEntity = EntityManager.GetEntity(caller, fTemplate, new Guid(_id));
                }
                if (insEntity == null)
                {
                    insEntity = new Entity(Guid.NewGuid(), fTemplate.ID, new Guid(caller.CustomerID));
                    isCreated = true;
                }
                string strIschild = Request["ischild"];//字表

                insEntity.BeginEdit();

                foreach (Supermore.EntityFramework.Templates.TemplateField tfield in this.fTemplate.Fields)
                {
                    string fName = tfield.Name;
                    string val = "";
                    bool hasField = true;
                    switch (tfield.FieldType.DType)
                    {
                        case FieldTypeCodes.Lookup:
                        case FieldTypeCodes.MasterDetail:
                        case FieldTypeCodes.User:
                        case FieldTypeCodes.BusinessUnit:
                            if (Request[fName] == null)
                            {
                                hasField = false;
                                continue;
                            }
                            val = Request[fName + "_lkid"];
                            break;
                        case FieldTypeCodes.DateTime:
                            string date = Request[fName];
                            string time = Request[fName + "_time"];
                            if (date == null) continue;//如果Request 不到，说明表单上没有
                            if (string.IsNullOrEmpty(time))
                            {
                                time = "00:00";
                            }
                            if (!string.IsNullOrEmpty(date))
                            {
                                val = string.Format("{0} {1}", date, time);
                                //insEntity.Fields[fName].Value = val;
                                fieldChanges++;
                            }
                            break;
                        case FieldTypeCodes.Comment://存成Text的xml格式。
                            val = Request[fName];
                            string orgComXml = StringUtil.GetString(insEntity.Fields[fName].Value);
                            if (!string.IsNullOrEmpty(orgComXml) && val != null)
                            {
                                string userName = WebContext.UserFullName;
                                CommentFieldValueCollection rows = EntityHelper.ToCommentFieldValueFromXml(orgComXml);
                                CommentFieldValue cValue = rows.SelectByUserName(_ruleLogId, userName);
                                if (cValue == null)
                                {
                                    cValue = new CommentFieldValue();
                                    rows.Add(cValue);
                                }
                                cValue.RecId = _ruleLogId;
                                cValue.Comment = val;
                                cValue.CreateTime = DateTime.Now.ToString("yyyy-MM-dd tthh:mm");
                                cValue.UserId = caller.UserID;
                                cValue.UserName = WebContext.UserFullName;
                                cValue.DeptName = WebContext.BusinessUnitName;
                                cValue.UserId = caller.UserID;

                                val = rows.ToXml();
                            }
                            else
                            {
                                if (val != null)
                                {
                                    CommentFieldValueCollection rows = new CommentFieldValueCollection();
                                    CommentFieldValue cValue = new CommentFieldValue();
                                    if (!string.IsNullOrEmpty(val))
                                    {
                                        cValue.Comment = val;
                                    }
                                    cValue.RecId = _ruleLogId;
                                    cValue.DeptName = WebContext.BusinessUnitName;
                                    cValue.CreateTime = DateTime.Now.ToString("yyyy-MM-dd tthh:mm");
                                    cValue.UserName = WebContext.UserFullName;
                                    cValue.UserId = caller.UserID;
                                    //cValue.IPAddr
                                    rows.Add(cValue);
                                    val = rows.ToXml();
                                }
                            }
                            break;
                        default:
                            if (Request[fName] == null) //表单上没有插入字段
                            {
                                hasField = false;
                                continue;
                            }
                            val = Request[fName];
                            if (!string.IsNullOrEmpty(val))
                            {
                                val = val.Trim();
                            }
                            break;
                    }
                    //if (!string.IsNullOrEmpty(val)) //bug,如果为空，保存不了
                    if (hasField)//表单上插入了字段
                    {
                        Field field = insEntity.Fields[fName];
                        if (field != null)
                        {
                            field.Value = val;
                        }
                    }
                }

                if (isCreated)
                {
                    insEntity.Fields["CreatedOn"].Value = DateTime.Now;
                    insEntity.Fields["CreatedBy"].Value = caller.UserID;
                    insEntity.Fields["ModifiedBy"].Value = caller.UserID;
                    insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                }
                else
                {
                    insEntity.Fields["ModifiedBy"].Value = caller.UserID;
                    insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                }

                bool isSaved = insEntity.EndEdit();
                if (isSaved)
                {

                    //计算子公式字段
                    insEntity = EntityManager.GetEntity(caller, fTemplate, insEntity.ID);
                    EntityScriptEvaluator.CalculateFormulaFields(caller, fTemplate, insEntity);
                }
                //汇总聚合字段
                Supermore.EntityFramework.Templates.TemplateField foreignField = fTemplate.GetMasterForeignField();
                Template masterTemplate = TemplateManager.GetTemplate(caller, foreignField.ReferencedEntityObjectTypeCode);

                if (masterTemplate != null)
                {
                    //先执行 计算公式
                    insEntity = EntityManager.GetEntity(caller, masterTemplate, processInstanceId);
                    EntityScriptEvaluator.CalculateFormulaFields(caller, masterTemplate, insEntity);
                    //再执行 汇总累计字段
                    EntityUtil.SumFields(caller, masterTemplate, processInstanceId.ToString());
                    //再执行 计算公式
                    insEntity = EntityManager.GetEntity(caller, masterTemplate, processInstanceId);
                    EntityScriptEvaluator.CalculateFormulaFields(caller, masterTemplate, insEntity);
                }

                Response.Redirect(string.Format("saveSuccess.aspx?InstanceId={0}&RuleLogId={1}", processInstanceId, _ruleLogId), false);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        public void GetInstance(Guid processInstanceId)
        {
            procInstance = WfInstanceManager.GetProcessInstance(processInstanceId);
            //if (procInstance != null)
            //{
            //    _templateId = procInstance.ProcessScheme.EntityObjectId;
            //    if (fTemplate == null)
            //        fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);
            //}
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