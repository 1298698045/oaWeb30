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
using Supermore.Security;
using Supermore.ScriptEngine;
using Supermore.Configuration;
using Supermore.Workflow;
using Supermore.Web;

namespace WebClient.apps.wf
{
    public partial class WfFormEdit : System.Web.UI.Page
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
        private string _isPreview = "";
        private bool beenSaved = false;
        private Guid instanceOrganizationId = Guid.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _ruleLogId = Request["RuleLogId"];
            _instanceId = Request["InstanceId"];
            processInstanceId = new Guid(_instanceId);
            _isPreview = Request["isPreview"];
            GetInstance(processInstanceId);
            GetRuleLog();
            
            if (Request["btnSaveData"] == "1")
            {
                SaveFormData();
            }
            try
            {
                //formId = Request["id"];
                //templateId = Request["templateid"];
                formId = procInstance.ProcessScheme.EntityLayoutId;
                if (formId != Guid.Empty)
                {
                    RenderFormArgs args = new RenderFormArgs();
                    if (_isPreview == "1")
                        args.RenderMode = FormEditMode.View;
                    else
                        args.RenderMode = FormEditMode.Edit;
                    args.PostSaveAction = beenSaved;
                    args.ProcessInstanceId = processInstanceId;
                    args.ProcessInstance = procInstance;
                    args.ProcessRuleLogId = MainUtil.GetGuid(_ruleLogId);
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

                    Template template = TemplateManager.GetTemplate(instanceOrganizationId, _templateId);
                    if (template == null)
                    {
                        Supermore.Diagnostics.Trace.LogError(string.Format("{0}: Template {1} IS NULL。", instanceOrganizationId, _templateId));
                        return;
                    }
                    args.MasterTemplate = template;
                    args.EntityData = EntityManager.GetEntity(_instanceCaller, template, processInstanceId);
                    args.QueryString = this.Request.QueryString;
                    args.RetURL = HttpUtility.UrlEncode(this.Request.RawUrl);
                    args.SystemUserBusinessUnits = SecurityAuth.GetSystemUserBusinessUnits(_instanceCaller);

                    if (this.CurrentStepId != Guid.Empty)
                    {
                        ActivityRightDefinition arDef = WfSchemeManager.GetStepRight(_instanceCaller, procInstance.SchemeId, this.CurrentStepId);
                        if (arDef != null)
                        {
                            args.FieldRights = arDef.FieldRights;
                            args.TableRights = arDef.TableRights;
                        }
                    }
                    // PipelineManager.GetInstance().RunPipeline
                    CorePipeline.Run("renderForm", args);
                    this.RenderHTML = args.ResultHTML;
                    this.ObjectTypeCode = template.ObjectTypeCode.ToString();
                }
                Response.Write(this.RenderHTML);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }

        private void SaveFormData()
        {
            int fieldChanges = 0;
            try
            {
                bool enableEmptyComment = Settings.GetBoolSetting("WF.Comment.Empty", true);    //空意见是否保存
                bool isUniqueComment = Settings.GetBoolSetting("WF.Comment.Unique", false);     //一人只保留一个意见
                string remoteIp = this.Request.ServerVariables["REMOTE_ADDR"];
                //集团版本
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
                        caller = _instanceCaller;
                    }
                }
                
                if (fTemplate == null)
                    fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);
                bool isCreated = false;
                insEntity = EntityManager.GetEntity(caller, fTemplate, processInstanceId);
                if (insEntity == null)
                {
                    insEntity = new Entity(processInstanceId, fTemplate.ID, new Guid(caller.CustomerID));
                    isCreated = true;
                }
                //string strIschild = Request["ischild"];//字表

                insEntity.BeginEdit();

                foreach (Supermore.EntityFramework.Templates.TemplateField tfield in this.fTemplate.Fields)
                {
                    if (tfield.FieldType == null)
                    {
                        Supermore.Diagnostics.Trace.LogError(string.Format("{0} field type is null", tfield.Name));
                        continue;
                    }
                    string fName = tfield.Name;
                    string val = null;
                   
                    switch (tfield.FieldType.DType)
                    {
                        case FieldTypeCodes.Lookup:
                        case FieldTypeCodes.MasterDetail:
                        case FieldTypeCodes.User:
                        case FieldTypeCodes.BusinessUnit:
                            val = Request[fName + "_lkid"];
                            //如果Request 不到，说明表单上没有
                            if (val == null) continue;                                                     
                            break;
                        case FieldTypeCodes.CheckBox:
                            //val = "True";
                            if (Request[fName] != null) //bug,如果权限控制不显示该字段，默认也修改了。糟糕
                                insEntity.Fields[fName].Value = true;
                            else
                                insEntity.Fields[fName].Value = false;
                            fieldChanges++;
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
                        case FieldTypeCodes.LongTextArea:
                        case FieldTypeCodes.TextArea:
                            val = Request[fName];
                            break;
                        #region 评论
                        case FieldTypeCodes.Comment://存成Text的xml格式。
                        case FieldTypeCodes.CommentSignature:
                            val = Request[fName];
                            string userId = caller.UserID;
                            if (string.IsNullOrEmpty(userId))
                                userId = WebContext.UserId;
                            string userFullName = WebContext.UserFullName;
                            string deptName = WebContext.BusinessUnitName;
                            string jobTitle = WebContext.UserTitle;
                            SystemUser user = null;
                            string systemUserBusinessUnitJobTitle = Request["systemUserBusinessUnitJobTitle"];//兼职部门
                            //Supermore.Diagnostics.Trace.LogError("systemUserBusinessUnitJobTitle:" + systemUserBusinessUnitJobTitle);

                            if (!string.IsNullOrEmpty(systemUserBusinessUnitJobTitle))
                            {
                                string[] titles = systemUserBusinessUnitJobTitle.Split('|');
                                if (titles.Length > 0)
                                    deptName = titles[0];

                                if (titles.Length > 1)
                                    jobTitle = titles[1];
                            }
                            else
                            {
                                if (string.IsNullOrEmpty(userFullName))
                                {
                                    user = SecurityAuth.GetSystemUser(new Guid(userId));
                                    userFullName = user.FullName;
                                }
                                if (string.IsNullOrEmpty(deptName))
                                {
                                    if (user == null)
                                    {
                                        user = SecurityAuth.GetSystemUser(new Guid(userId));
                                    }
                                    deptName = EntityManager.GetEntityName(caller, EntityTemplateIDs.BusinessUnit, user.BusinessUnitId);
                                    //deptName = EntityManager.GetEntityName(caller, EntityTemplateIDs.BusinessUnit, caller.BussinessUnitId);
                                }
                            }                        
                            
                            if (val != null)
                            {
                                string orgComXml = StringUtil.GetString(insEntity.Fields[fName].Value);
                                if (!string.IsNullOrEmpty(orgComXml))
                                {
                                    // string userName = WebContext.UserFullName;
                                    CommentFieldValueCollection rows = EntityHelper.ToCommentFieldValueFromXml(orgComXml);
                                    CommentFieldValue cValue = null;
                                    if (isUniqueComment)
                                        cValue = rows.SelectByUserName(userFullName); //一个人只保留一个意见
                                    else
                                        cValue = rows.SelectByUserName(_ruleLogId.ToUpper(), userFullName);
                                    string fValue = val.Trim();
                                    if (cValue == null)
                                    {
                                        cValue = new CommentFieldValue();
                                        if (!enableEmptyComment && string.IsNullOrEmpty(fValue)) //空意见不保存
                                        { }
                                        else
                                        {
                                            rows.Add(cValue);
                                        }
                                    }
                                    cValue.RecId = _ruleLogId.ToUpper();
                                    cValue.Comment = fValue;
                                    cValue.CreateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                    cValue.UserId = userId;
                                    cValue.UserName = userFullName;
                                    cValue.DeptName = deptName;
                                    cValue.JobTitle = jobTitle;
                                    cValue.IPAddr = remoteIp;
                                    val = rows.ToXml();
                                }
                                else
                                {

                                    CommentFieldValueCollection rows = new CommentFieldValueCollection();
                                    CommentFieldValue cValue = new CommentFieldValue();
                                    if (!string.IsNullOrEmpty(val))
                                    {
                                        cValue.Comment = val;
                                    }
                                    cValue.RecId = _ruleLogId;
                                    cValue.CreateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                    cValue.UserName = userFullName;
                                    cValue.DeptName = deptName;
                                    cValue.JobTitle = jobTitle;
                                    cValue.UserId = userId;                                   
                                    cValue.IPAddr = remoteIp;
                                  
                                    if (!enableEmptyComment && string.IsNullOrEmpty(val)) //空意见不保存
                                    { }
                                    else
                                        rows.Add(cValue);
                                    val = rows.ToXml();

                                }
                            }
                            //Supermore.Diagnostics.Trace.LogError("Title:" + jobTitle);
                            fieldChanges++;
                            break;
                        case FieldTypeCodes.CertificateAuthority:
                            val = SaveCA(fName);
                            fieldChanges++;
                            break;
                        #endregion
                                                    
                        default:
                            val = Request[fName];
                            if (!string.IsNullOrEmpty(val))
                            {
                                val = val.Trim();
                            }
                            break;
                    }
                    if (val != null)
                    {
                        Field field = insEntity.Fields[fName];
                        if (field != null)
                        {
                           
                            if (isCreated) //创建模式
                            {
                                if (!string.IsNullOrEmpty(val))
                                    field.Value = val;
                            }
                            else
                            {
                                //@@比对输入值与数据值是否一致，如果一致，不修改;
                                string oValue = StringUtil.GetString(field.Value);
                                if (oValue != val)
                                {
                                    field.Value = val;
                                    fieldChanges++;
                                }
                            }
                        }
                    }
                }

                if (isCreated)
                {
                    insEntity.Fields["CreatedOn"].Value = DateTime.Now;
                    insEntity.Fields["CreatedBy"].Value = caller.UserID;
                    insEntity.Fields["ModifiedBy"].Value = caller.UserID;
                    insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                    beenSaved = insEntity.EndEdit();
                }
                else
                {
                    if (fieldChanges > 0)
                    {
                        insEntity.Fields["ModifiedBy"].Value = caller.UserID;
                        insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                        beenSaved = insEntity.EndEdit();
                    }
                    else
                        beenSaved = true;
                }

                //汇总聚合字段 合计，再转换
                EntityUtil.SumFields(caller, fTemplate, insEntity.ID.ToString());

                //计算公式
                insEntity = EntityManager.GetEntity(caller, fTemplate,processInstanceId);
                EntityScriptEvaluator.CalculateFormulaFields(caller, fTemplate, insEntity);

                //if(fTemplate.fTemplate)

                bool enableCA = Settings.GetBoolSetting("WF.CA.Enable", false);
                if (enableCA)
                {
                    string signData = Request["HidSignData"];
                    if (!string.IsNullOrEmpty(signData))
                    {
                        WFUserSignDataManager signDataMgr = new WFUserSignDataManager();
                        signDataMgr.UpdateSignData(caller, processInstanceId, processInstanceId.ToString(), signData);
                    }
                }

                string _saveAction = Request["_saveAction"];
                if (beenSaved)
                {
                    Response.Redirect(string.Format("WfFormEdit.aspx?InstanceId={0}&RuleLogId={1}&_saved=1&_saveAction={2}", processInstanceId, _ruleLogId, _saveAction), false);
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
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
                Guid organizationId = procInstance.OrganizationId;
                if (organizationId == Guid.Empty)
                {
                    Supermore.Diagnostics.Trace.Log("The OrganizationId of WFProcessInstance is empty.ProcessInstanceId:" + processInstanceId.ToString());
                    organizationId = this.caller.OrganizationId;
                }
                //fTemplate = TemplateManager.GetTemplate(organizationId, procInstance.ProcessScheme.EntityObjectId);
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
            if (tranLog != null)
                this.CurrentStepId = tranLog.ToActivityId;
        }
        
        string SaveCA(string fName)
        {
            string val = Request[fName];
            string comment = val;
            string signdata = Request[fName + "_signdata"];
            string userId = caller.UserID;
            if (string.IsNullOrEmpty(userId))
                userId = WebContext.UserId;
            #region 
            
            string userFullName = WebContext.UserFullName;
            string deptName = WebContext.BusinessUnitName;
            string jobTitle = WebContext.UserTitle;
            SystemUser user = null;
            if (string.IsNullOrEmpty(userFullName))
            {
                user = SecurityAuth.GetSystemUser(new Guid(userId));
                userFullName = user.FullName;
            }
            if (string.IsNullOrEmpty(deptName))
            {
                if (user == null)
                {
                    user = SecurityAuth.GetSystemUser(new Guid(userId));
                }
                deptName = EntityManager.GetEntityName(caller, EntityTemplateIDs.BusinessUnit, user.BusinessUnitId);
            }
            string orgComXml = StringUtil.GetString(insEntity.Fields[fName].Value);
            if (!string.IsNullOrEmpty(orgComXml) && val != null)
            {
                // string userName = WebContext.UserFullName;
                CommentFieldValueCollection rows = EntityHelper.ToCommentFieldValueFromXml(orgComXml);
                CommentFieldValue cValue = rows.SelectByUserName(_ruleLogId.ToUpper(), userFullName);
                string fValue = val.Trim();
                if (cValue == null)
                {
                    cValue = new CommentFieldValue();
                    rows.Add(cValue);
                }
                cValue.RecId = _ruleLogId.ToUpper();
                cValue.Comment = fValue;
                cValue.CreateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                cValue.UserId = userId;
                cValue.UserName = userFullName;
                cValue.DeptName = deptName;
                cValue.JobTitle = jobTitle;
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
                    cValue.CreateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    cValue.UserId = userId;
                    cValue.UserName = userFullName;
                    cValue.DeptName = deptName;
                    cValue.JobTitle = jobTitle;
                    
                    rows.Add(cValue);
                    val = rows.ToXml();
                }
            }
            
            #endregion
            if (!string.IsNullOrEmpty(signdata))
                WfInstanceManager.SaveSignData(caller, _instanceId, this.CurrentStepId.ToString(), _ruleLogId, fName, comment, signdata);

            return val; //意见数据
        }
        public string RenderHTML { get; set; }
        public string ObjectTypeCode { get; set; }
        public Guid CurrentStepId { get; set; }
    }
}