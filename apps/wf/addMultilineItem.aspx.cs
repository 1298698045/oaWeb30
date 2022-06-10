using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.GridBuilder;
using Supermore.Pipelines.RenderForm;
using Supermore.Pipelines.RenderMultilineitem;
using Supermore.ScriptEngine;

namespace WebClient.apps.wf
{
    public partial class addMultilineItem : System.Web.UI.Page
    {
        CallContext caller = null;
        string[] fieldNames = new string[] { };

        protected void Page_Load(object sender, EventArgs e)
        {
            RenderMultilineItems();
            if (Request["save"] != null)
            {
                SaveMultilineItem();
                /*
                 <input id="InstanceId" type="hidden" value="569ae514-b083-481c-b4e5-d2591bc1b896" name="InstanceId">
                <input id="PurchaseBillId_lkid" type="hidden" value="569ae514-b083-481c-b4e5-d2591bc1b896" name="PurchaseBillId_lkid">
                <input id="PurchaseBillId" type="hidden" value="物资请购单 GE" name="PurchaseBillId">
                <input id="templateid" type="hidden" value="3585dab8-b9f1-4f92-be94-bae13841b1de" name="templateid">
                <input id="RuleLogId" type="hidden" value="569ae514-b083-481c-b4e5-d2591bc1b896" name="RuleLogId">
                */
                this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("InstanceId", Request["InstanceId"]);
                this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("templateid", Request["templateid"]);
                this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("RuleLogId", Request["RuleLogId"]);
            }
        }
        private void RenderMultilineItems()
        {
            caller = AppDataSource.GetCallContext();

            string templateId = Request["templateId"];
            //InstanceId={0}&{1}_lkid={2}&{1}={3}&templateid={4}&amp;RuleLogId={5}&amp;retURL={6}

            Template relatedTemp = TemplateManager.GetTemplate(caller.OrganizationId, new Guid(templateId));
            this.ObjectTypeCode = relatedTemp.ObjectTypeCode;
            /*
            TemplateField foreignField = relatedTemp.GetMasterForeignField();

            relatedListEntityRender.Template = relatedTemp;
            relatedListEntityRender.ForignFieldName = foreignField.Name;
            if (args.EntityData != null)
            {
                relatedListEntityRender.ForignFieldValue = args.EntityData.ID.ToString();
                relatedListEntityRender.ForignFieldValueName = args.EntityData.Name;
            }
            */
            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(caller, relatedTemp.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            SavedQueryParser parser = new SavedQueryParser();
            //string DisplayColumnNames = StringUtil.GetString(dr["DisplayColumnNames"]);
            string[] cols = DisplayColumnNames.Split(',');

            GetRuleLog();

            Hashtable fieldRights = new Hashtable();
            ActivityRightDefinition arDef = WfSchemeManager.GetStepRight(caller, this.ProcessId, this.CurrentStepId);
            if (arDef != null)
                fieldRights = arDef.FieldRights;

            //检查权限
            foreach (string col in cols)
            {
                int fRight = GetFieldRight(relatedTemp, fieldRights, col);
                if (fRight == 8 || fRight == 16)
                {
                    Array.Resize<string>(ref fieldNames, fieldNames.Length + 1);
                    fieldNames[fieldNames.Length - 1] = col;
                }
            }

            RenderFormArgs args = new RenderFormArgs();
            args.MasterTemplate = relatedTemp;
            args.Caller = caller;
            args.MasterTemplateId = relatedTemp.ID;

            RenderMultilineform renderMultilineform = new RenderMultilineform();
            renderMultilineform.Caller = caller;
            renderMultilineform.Columns = parser.ParseColumns(relatedTemp, fieldNames);
            renderMultilineform.Template = relatedTemp;
            renderMultilineform.Render(args);
            MultilineHTML = renderMultilineform.TableHTML;
        }
        public void GetRuleLog()
        {
            string ruleLogId = Request["ruleLogId"];
            if (string.IsNullOrEmpty(ruleLogId))
                return;
            TransitionLog tranLog = WfInstanceManager.GetRuleLog(caller, new Guid(ruleLogId));
            this.CurrentStepId = tranLog.ToActivityId;

            ProcessInstance procInstance = WfInstanceManager.GetProcessInstance(tranLog.ProcessInstanceId);
            if (procInstance != null)
            {
                this.ProcessId = procInstance.SchemeId;
            }
        }
        private void SaveMultilineItem()
        {
            CallContext caller = AppDataSource.GetCallContext();

            string templateId = Request["templateId"];
            string instanceId = Request["InstanceId"];
            try
            {
                //InstanceId={0}&{1}_lkid={2}&{1}={3}&templateid={4}&amp;RuleLogId={5}&amp;retURL={6}
                Template relatedTemp = TemplateManager.GetTemplate(caller.OrganizationId, new Guid(templateId));
                Supermore.EntityFramework.Templates.TemplateField foreignField = relatedTemp.GetMasterForeignField();
                string forignFieldName = foreignField.Name;
                Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(caller, relatedTemp.ID);
                string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);

                Template masterTemplate = TemplateManager.GetTemplate(caller, foreignField.ReferencedEntityObjectTypeCode);
                string[] cols = DisplayColumnNames.Split(',');
                Entity insEntity = null;
                for (int i = 0; i < 20; i++)
                {
                    insEntity = null;
                    Dictionary<string, string> vals = new Dictionary<string, string>();
                    bool isValidRow = true;
                    #region field values
                    foreach (string fieldName in fieldNames)
                    {
                        Supermore.EntityFramework.Templates.TemplateField tfield = relatedTemp.GetField(fieldName);
                        string fName = fieldName + i.ToString();
                        string val = Request[fName];
                        Supermore.Diagnostics.Trace.LogError("字段："+ fName+",值："+ val);
                        
                        switch (tfield.FieldType.DType)
                        {
                            case FieldTypeCodes.Lookup:
                            case FieldTypeCodes.MasterDetail:
                            case FieldTypeCodes.User:
                            case FieldTypeCodes.BusinessUnit:
                                //DeptName0_lkid
                                val = Request[fieldName + i + "_lkid"];
                                if (!tfield.IsNullable && string.IsNullOrEmpty(val))
                                {
                                    isValidRow = false;
                                    break;
                                }
                                break;
                            case FieldTypeCodes.CheckBox:
                                if (Request[fName] != null) //bug,如果权限控制不显示该字段，默认也修改了。糟糕
                                    val = "1";
                                else
                                    val = "0";
                                break;
                            case FieldTypeCodes.DateTime:
                                string date = Request[fName];
                                string time = Request[fName + "_time"];
                                if (string.IsNullOrEmpty(time))
                                {
                                    time = "00:00";
                                }
                                if (!string.IsNullOrEmpty(date))
                                {
                                    val = string.Format("{0} {1}", date, time);
                                }
                                break;
                            case FieldTypeCodes.LongTextArea:
                            case FieldTypeCodes.TextArea:
                                val = Request[fName];
                                break;
                            default:
                                val = Request[fName];
                                if (!tfield.IsNullable && string.IsNullOrEmpty(val))
                                {
                                    isValidRow = false;
                                    break;
                                }

                                if (!string.IsNullOrEmpty(val))
                                {
                                    val = val.Trim();
                                }
                                break;
                        }
                        if (!string.IsNullOrEmpty(val))
                            vals.Add(fieldName, val);
                    }
                    #endregion

                    if (vals.Count > 0 && isValidRow)
                    {

                        insEntity = new Entity(Guid.NewGuid(), relatedTemp.ID, caller.OrganizationId);
                        insEntity.BeginEdit();
                        foreach (string key in vals.Keys)
                        {
                            insEntity.Fields[key].Value = vals[key];
                        }
                        insEntity.Fields[forignFieldName].Value = instanceId;

                        if (insEntity.Fields["CreatedOn"] != null)
                            insEntity.Fields["CreatedOn"].Value = DateTime.Now;
                        if (insEntity.Fields["CreatedBy"] != null)
                            insEntity.Fields["CreatedBy"].Value = caller.UserID;
                        if (insEntity.Fields["ModifiedBy"] != null)
                            insEntity.Fields["ModifiedBy"].Value = caller.UserID;
                        if (insEntity.Fields["ModifiedOn"] != null)
                            insEntity.Fields["ModifiedOn"].Value = DateTime.Now;

                        bool isSaved = insEntity.EndEdit();
                        if (!isSaved)
                        {
                            Supermore.Diagnostics.Trace.LogError("保存失败！");
                        }
                        else
                        {
                            Supermore.Diagnostics.Trace.LogError("批量保存行成功！");
                        }
                        //计算公式
                        insEntity = EntityManager.GetEntity(caller, relatedTemp, insEntity.ID);
                        EntityScriptEvaluator.CalculateFormulaFields(caller, relatedTemp, insEntity);
                    }
                }


                //计算公式1
                insEntity = EntityManager.GetEntity(caller, masterTemplate, new Guid(instanceId));
                if (insEntity != null)
                    EntityScriptEvaluator.CalculateFormulaFields(caller, masterTemplate, insEntity);

                //汇总聚合字段
                EntityUtil.SumFields(caller, masterTemplate, instanceId);

                //计算公式1
                insEntity = EntityManager.GetEntity(caller, masterTemplate, new Guid(instanceId));
                if (insEntity != null)
                    EntityScriptEvaluator.CalculateFormulaFields(caller, masterTemplate, insEntity);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }
        int GetFieldRight(Supermore.EntityFramework.Templates.Template template, Hashtable fieldRights, string fieldName)
        {
            int right = 4;
            //if (renderArgs.RenderMode == FormEditMode.Preview) return right;
            string key = template.Name + "~" + fieldName;
            if (fieldRights.ContainsKey(key))
            {
                right = MainUtil.GetInt(fieldRights[key], 4);
            }

            return right;
        }
        public Guid CurrentStepId { get; set; }
        public Guid ProcessId { get; set; }

        // public Guid CurrentStepId { get; set; }

        public string MultilineHTML { get; set; }
        public int ObjectTypeCode { get; set; }
    }
}