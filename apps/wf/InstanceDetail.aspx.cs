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
using Supermore.Configuration;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.GridBuilder;
using Supermore.Workflow.Evaluation;
using Supermore.Security;
using OA.Web.UI.WebControls;

namespace WebClient.apps.wf
{
    public partial class InstanceDetail : System.Web.UI.Page
    {
        string instanceId = "";
        string _instanceName= "";
        string _processId = "";
        string _ruleLogId = "";
        string html = "";
        string tBody = "";
        string pageSource = "";
        CallContext caller = null;
        TransitionLog tranLog = null;
        ProcessInstance instance;
        Guid currentStepId = Guid.Empty;
        Guid _formId = Guid.Empty;
        Guid createdBy = Guid.Empty;
        string tab = "";
        string version = Settings.GetSetting("JingeOffice.Version");//金格办公软件的版本
        public string viewLink = "";
        int editType = 0;
        private int instanceStateCode = 0;
        /// <summary>
        /// 附件权限
        /// </summary>
        private long attachRight = 4;

        protected void Page_Load(object sender, EventArgs e)
        {
            IsFormView = "0";
            MainDocEditMode = "1,1&readonly=0";
            //this.AttachEditType = "1";
            tab = Request["t"];
            pageSource = Request["source"];
            instanceId = Request["id"];
            caller = AppDataSource.GetCallContext();
            createdBy = new Guid(caller.UserID);
            this.OrganizationId = caller.CustomerID;
            this.EditMode = true;//默认编辑模式
            this.RetURL = Request["retURL"];

            if (Request["read"] != null)
            {
                if (string.IsNullOrEmpty(instanceId))
                    instanceId = DatabaseTool.GetFirstCellStr(caller.CustomerID, string.Format("select ProcessInstanceId from WFInstanceNotifyMembers where valueId='{0}'", Request["readid"]), "");
                this.IsFormView= "1";
                this.EditMode = false;
            }

            if (pageSource == "l") //从办理日志进入
            {                
                GetFromLog();
            }
            else
            {
                //流程是我进入              
                GetFromInstance();
            }
            GetStepPri();

            //后台不显示附件列表
            //RenderNoteList();

            GetForwardReaders();
            GetRelatedInstances();
           
            if (Request["read"] != null)
            {                
                this.EditMode = false;
                MainDocEditMode = "1,0&readonly=1";
                //set read
                WfInstanceManager.SetRead(caller, new Guid(instanceId));
            }

            if (!this.EditMode) //非编辑模式
            {
                MainDocEditMode = "1,0&readonly=1";
            }
            /*
            表单导出pdf地址
            appSettings 
            <add key="HttpUrl.WFForm.get" value="http://192.168.1.200:8032/api/form/export?fileType={0}&amp;fileName={1}&amp;instanceId={2}"/>
           */
            string httpUrlWFForm = Settings.GetAppSetting("HttpUrl.WFForm.get");
            if (!string.IsNullOrEmpty(httpUrlWFForm) && instance != null)
            {
                string fileName = instance.Name.Replace(" ", "");
                if (string.IsNullOrEmpty(fileName))
                {
                    fileName = DateTime.Now.ToString("yyyyMMddHHmmss");
                }
                this.WfFormExportPdfUrl = string.Format(httpUrlWFForm, "pdf", fileName, instanceId);
            }
            if (version == "2015")
            {
                //if (MainDocEditMode == "1,1")
                //{
                //    editType = 1;
                //}
                //else if (MainDocEditMode == "2,1")
                //{
                //    editType = 2;
                //}
                if (this.DocRights1 == 8) //可写
                {
                    editType = 1;
                }
                else if (this.DocRights1 == 16) //读写，留痕
                {
                    editType = 2;
                }
                viewLink = string.Format("/jgfiles/samples/OpenAndSave_Word.aspx?id={0}&filesource=2&organizationid={1}&EditType={2}", InstanceId, OrganizationId, editType);
            }
            else
            {
                viewLink = string.Format(@"/apps/files/DocEditor.aspx?Id={0}&fullscreen=0&EditType={1}&filesource=2&OrganizationId={2}", InstanceId, MainDocEditMode, OrganizationId);
            }
        }
        /// <summary>
        /// 获取待办任务
        /// </summary>
        void GetFromLog()
        {
            _ruleLogId = Request["id"];

            tranLog = WfInstanceManager.GetRuleLog(caller, new Guid(_ruleLogId));
            if (tranLog == null)
            {
                pageSource = "i";
                if (string.IsNullOrEmpty(this.RetURL))
                    this.RetURL = "/a0M/o?src=1";

                if (Request["action"] == "b")
                {
                    tranLog = WfInstanceManager.GetInstanceStartRuleLog(caller, new Guid(_ruleLogId));
                    if (tranLog != null)
                    {
                        instanceId = tranLog.ProcessInstanceId.ToString();
                        _ruleLogId = tranLog.ID.ToString();
                    }
                }
                if (tranLog == null)
                    return;
            }
            else
            {
                pageSource = "l";
            }

            //set read
            WfInstanceManager.SetRead(caller, new Guid(instanceId), new Guid(_ruleLogId));

            if (tranLog.FromActivityId == Guid.Empty)
            {
                this.IsFirstActivity = true;
            }
            else
                this._fromActivityId = tranLog.FromActivityId;

            currentStepId = tranLog.ToActivityId;
            instanceId = tranLog.ProcessInstanceId.ToString();
            GetInstance(tranLog.ProcessInstanceId);
            if (tranLog.StateCode == 2)
            {
                this.EditMode = false;
                IsFormView = "1";
            }
            else
            {
                //获取权限
                IsFormView = "0";
                this.EditMode = true;
            }
            if (string.IsNullOrEmpty(this.RetURL))
                this.RetURL = "/a0M/o?src=2";
        }
        /// <summary>
        /// 获取流程实例
        /// </summary>
        void GetFromInstance()
        {
           
            Guid processInstanceId = new Guid(instanceId);               
            GetInstance(processInstanceId);
            if (instance == null)
            {
                GetFromLog();
                return;
            }
            //获取第一步
            tranLog = WfInstanceManager.GetMyInstanceStartRuleLog(caller, processInstanceId);
            if (tranLog != null)
            {
                _ruleLogId = tranLog.ID.ToString();
                if (tranLog.FromActivityId == Guid.Empty) //bug,@@TODO 真实
                {
                    this.IsFirstActivity = true;
                }
                else
                {
                    this._fromActivityId = tranLog.FromActivityId;
                }
                currentStepId = tranLog.ToActivityId;
                if (tranLog.StateCode == 2)
                {
                    this.EditMode = false;
                    IsFormView = "1";
                 }
            }
            else
            {
                IsFormView = "1";
                this.EditMode = false;               
            }
            if (string.IsNullOrEmpty(this.RetURL))
                this.RetURL = "/a0M/o?src=1";
            
        }
        
        /// <summary>
        /// 获取流程实例
        /// </summary>
        /// <param name="processInstanceId"></param>
        public void GetInstance(Guid processInstanceId)
        {
            instance = WfInstanceManager.GetProcessInstance(this.caller,processInstanceId);
            if (instance != null)
            {
                this.InstanceState = instance.StateCode.ToString();//流程状态
                instanceStateCode = instance.StateCode;
                _processId = instance.SchemeId.ToString();
                _formId = instance.ProcessScheme.EntityLayoutId;
                InstanceName = instance.Name + " " + instance.ProcessInstanceNumber;
                this.EntityObjectType = instance.ObjectType;

                //检查是否可以编辑
                if (!instance.CanEdit)
                {
                    this.EditMode = false; 
                    IsFormView = "1";
                }
                else 
                {
                    this.EditMode = true;
                    IsFormView = "0";
                }
                if (instance.StateCode == 1)//运行状态
                {
                    //运行状态，并且是自己创建的流程，屏蔽掉默认填写按钮
                    //if (instance.CreatedBy == createdBy)
                    //{
                        this.EditMode = false;
                    //}
                }
                
                EntityDetailForm entityForm = new EntityDetailForm();              
                entityForm.Template = TemplateManager.GetTemplate(caller.OrganizationId, EntityTemplateIDs.WFProcessInstance);
                entityForm.Caller = caller;
                Entity insEntity = EntityManager.GetEntity(caller, EntityTemplateIDs.WFProcessInstance, processInstanceId);
                entityForm.Entity = insEntity;
                entityForm.Render();
                html = entityForm.ResultHTML;
                
                List<Entity> entities = WfInstanceManager.GetRuleLogs(processInstanceId);
                RenderRuleLogGrid(entities);
                //记录阅读日志
                string remoteIp = this.Request.ServerVariables["REMOTE_ADDR"];
                string browser = this.Request.Browser.Browser + this.Request.Browser.Version;
                WfInstanceManager.LogRead(caller, processInstanceId, remoteIp, browser);    
            }
        }

        /// <summary>
        /// 默认有权限
        /// </summary>
        private void GetStepPri()
        {
            ActivityRightDefinition actRight = null;
            if (!string.IsNullOrEmpty(_processId))
            {
                actRight = WfSchemeManager.GetStepRight(caller, new Guid(_processId), currentStepId);
            }
            else
            {
                return;
            }
            if (actRight != null)
            {
                //正文权限

                DocRights1 = actRight.DocRights1;
                
                if (actRight.DocRights1 == 8)
                {
                    MainDocEditMode = "1,1";
                }                
                else if (actRight.DocRights1 == 16 || actRight.DocRights1 == 32)//可编辑，有留痕
                {
                    MainDocEditMode = "2";
                }
                else
                {
                    MainDocEditMode = "0,0&readonly=1";
                }

                //附件权限
                if (this.EditMode)
                    attachRight = actRight.DocRights2;
                //actRight.a
                //if (attachRight >= 8)
                //   this.AttachEditType = "3";
                //流程终止
                HasFlowFinish = actRight.HasFlowFinish;
               
                //加签权限
            }
            else
            {
                MainDocEditMode = "1,1";
            }
            if (instanceStateCode == 0 || instanceStateCode == 5)
            {
                //流程实例 草稿箱，或者退件箱，附件可以修改
                AttachRight = 16;
                this.DocRights1 = 8;
                MainDocEditMode = "1";
                //this.AttachEditType = "1";
            }
           
            #region 并行分支
            ActivityDefinition actDef = WfSchemeManager.GetActivity(new Guid(_processId), currentStepId);
            if (actDef != null)
            {
                if (actDef.SplitType == SplitType.And) //如果是 并行分发就 弹出选择多个步骤
                {
                    StepSplitType = "2";
                    return;
                    RuleContext ruleContext = new RuleContext();
                    try
                    {
                        ProcessDefinition processScheme = instance.ProcessScheme;
                        
                        ruleContext.StartUser = SecurityAuth.GetSystemUser(caller, instance.CreatedBy);
                        Entity entity = EntityManager.GetEntity(caller, processScheme.EntityObjectId, instance.ProcessId);
                        if (entity != null)
                            ruleContext.FormData.Add(entity);
                    }
                    catch (Exception ex)
                    {
                        Supermore.Diagnostics.Trace.LogException(ex);
                    }

                    
                    bool defaultSelectAll = Settings.GetBoolSetting("WF.SplitSteps.DefaultSelectAll", false);
                    StringBuilder sb = new StringBuilder();
                    sb.Append(" <form name=\"editPage\" id=\"editPage\" action=''>");

                    sb.Append("<div class=\"overlay_panel\">");
                    sb.AppendFormat(" <input type=\"hidden\" name=\"instanceId\" id=\"instanceId\" value=\"{0}\" />", instanceId);
                    sb.AppendFormat(" <input type=\"hidden\" name=\"ruleLogId\" id=\"ruleLogId\" value=\"{0}\" />", _ruleLogId);
                    sb.AppendFormat(" <input type=\"hidden\" name=\"curStepId\" id=\"curStepId\" value=\"{0}\" />", currentStepId);

                    sb.Append("<div id=\"nextstep_picker_header_label\" class=\"upper_section\">由于本环节是并行分发，您必须至少选择一个，也可以全选多个“下一环节”。 </div>");
                    ProcessDefinition process = instance.ProcessScheme;
                    IEnumerable<TransitionDefinition> trans = process.GetPossibleTransitionsForActivityId(currentStepId);
                    bool hasCondition = false; //有条件的话
                    foreach (TransitionDefinition t in trans)
                    {
                        if (t.Condition != null)
                        {
                            defaultSelectAll = false;
                            hasCondition = true;
                            break;
                        }
                    }
                    int c = 0;
                    sb.AppendFormat("<div style='white-space: nowrap;display:inline' ><input type=\"checkbox\" name=\"selAll\" id=\"selAll\" onclick=\"selAllNextSteps(this.value)\" {0} /><span style=\"display:inline-block;cursor:pointer;\" >全选</span><div>", defaultSelectAll ? " checked=\"checked\" " : "");
                    sb.Append("<div class='mw_container' style=\"height:350px;overflow:auto;\">");

                    foreach (TransitionDefinition t in trans)
                    {
                        bool selectNextNode = defaultSelectAll;
                        bool isValidPass = false;
                        TransitionDefinition matchTran = EvaluateCondition(t, ruleContext,ref  isValidPass);
                        if (matchTran != null)//找到了符合条件的
                        {
                            if (matchTran.ID == t.ID) //当前的是符号条件的
                            {
                                selectNextNode = true;
                            }
                            else
                                selectNextNode = false;
                        }
                        else
                        {
                            selectNextNode = false;
                        }

                        //默认不能权限 checked='checked'
                        string activityEleId = string.Format("nextActivity{0}", c);
                        sb.AppendFormat("<div class=\"step\" style='white-space: nowrap;display:inline'><input type=\"checkbox\" name=\"nextActivity\" id=\"nextActivity{3}\"  value=\"{0}_{1}\" onclick=\"showSelActivityPeople(this,'{1}',{3})\"  {4} />{2}", t.ID, t.ToActivityId, t.To.Name, c, selectNextNode ? " checked=\"checked\" " : "");
                        //sb.AppendFormat("<a onclick=\"selActivityPeople('{0}','{2}')\" style='display:none' id=\"selActivityPeople{2}\" data-id=\"{0}\"><img title='选择 {1} 执行人' style=\"display:inline-block;cursor:pointer;\" src=\"/img/icon/alohaProfile16.png\" class=\"userIcon\" classname=\"userIcon\" alt=\"用户\" unselectable=\"on\" border='0'/></a> ", t.ToActivityId, t.To.Name, c);
                        //sb.AppendFormat("<input type='hidden' id='nextActivityPeople{0}' name='nextActivityPeople{0}' value='' />", c);
                        //sb.AppendFormat("<input type='hidden' id='nextActivityPeople{0}_lkid' name='nextActivityPeople{0}_lkid' value='' />", c);
                        //人员
                        sb.Append("<div style=\"margin-left:5px\">");
                        List<ParticipantMember> members = WfSchemeManager.GetStepParticipators(caller, process.ID, new Guid(instanceId), t.ToActivityId);
                        foreach (ParticipantMember mem in members)
                        {
                            //checked=\"checked\"
                            sb.AppendFormat("<div style=\"margin-left:10px;color:#999;\"><input  type=\"checkbox\" value=\"{0}\" id='participator_{1}_{0}' name=\"participator_{1}\" onclick=\"selectMemeber('{3}',this)\" {4} /><label style='color: #999;font-size:13px;'>{2}</label></div>", mem.UserId, t.ToActivityId, mem.FullName, activityEleId, selectNextNode ? " checked=\"checked\" " : "");
                        }
                        sb.Append("</div>");

                        sb.Append("</div><br/>");
                        c++;
                    }
                    sb.Append("</div></div>");

                    sb.Append(" </form> ");
                    string str = sb.ToString();

                    var jsonSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    str = jsonSerializer.Serialize(str);
                    str = str.Trim('\"');
                    this.SelectedStepsPopHTML = str;
                }
            }
            #endregion
        }

        /// <summary>
        /// 评估条件
        /// </summary>
        /// <param name="t"></param>
        /// <param name="ruleContext"></param>
        /// <returns></returns>
        private TransitionDefinition EvaluateCondition(TransitionDefinition t, RuleContext ruleContext,ref bool isValidPass)
        {
            isValidPass = false;
            ConditionParser conditionParser = new Supermore.Workflow.Evaluation.ConditionParser();

            if (t.Condition != null)
            {
                bool isEval = conditionParser.Evaluate(t.Condition.EntityCondtion, ruleContext);
                if (isEval)
                {
                    isValidPass = true;
                    return t;
                }
            }

            return null;
        }

        void RenderNoteList()
        {
            try
            {
                string retURL = "";                        
                if (pageSource == "i")
                    retURL = string.Format("/a0M/e?id={0}&source=i", this.instanceId);
                else
                    retURL = string.Format("/a0M/e?id={0}&source=l", this._ruleLogId);
                retURL = HttpUtility.UrlEncode(retURL);

                RelatedNoteList noteList = new RelatedNoteList();
                noteList.RelatedObjectId = instanceId;
                noteList.RelatedObjectName = this.InstanceName;
                noteList.EntityTemplateCode = instance.ObjectType;
                noteList.AccessRight = attachRight;
                noteList.Caller = this.caller;
                //noteList.RetURL = HttpUtility.UrlEncode(string.Format("/apps/wf/InstanceDetail.aspx?t={0}&id={1}", tab, instanceId));
                noteList.RetURL = retURL;
                noteList.Render();
                RelatedNoteListData = noteList.ResultHTML;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            
        }
        /// <summary>
        /// 传阅记录
        /// </summary>
        void GetForwardReaders()
        {
            Template template = null;
            EntityCollection entities = null;
            try
            {
                string sql = string.Format("select a.*,b.FullName from WFProcessInstanceReadLogBase a JOIN SystemUserBase b ON a.CreatedBy = b.SystemUserId WHERE a.ProcessInstanceId='{0}' ORDER BY a.CreatedOn DESC", this.instanceId);
                StringBuilder sb = new StringBuilder();
                DataSet ds = AppDataSource.GetDataSet(caller, sql);
                int seq = 1;
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb.Append("<tr class='dataRow odd'>");
                    sb.AppendFormat("<td class='dataCell'>{2}、</td><td class='dataCell'>{0}</td><td class='dataCell'>{1}</td>", StringUtil.GetString(dr["FullName"]), StringUtil.GetString(dr["CreatedOn"]),seq);
                    sb.AppendFormat("<td class='dataCell'>{0}</td>", StringUtil.GetString(dr["IPAddr"]));
                    sb.AppendFormat("<td class='dataCell'>{0}</td>", StringUtil.GetString(dr["BrowserName"]));
                    sb.Append("</tr>");
                    seq++;
                }
                ReadLogListHTML = sb.ToString();

                template = TemplateManager.GetTemplate(this.caller.OrganizationId, ObjectTypeCodes.WFInstanceNotifyMembers);

                Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(this.caller, template.ID);
                if (layoutEntity == null) return;
                string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
                string[] cols = DisplayColumnNames.Split(',');

                QueryExpression queryExp = new QueryExpression();
                queryExp.IsPaged = false;
                ConditionExpression con = new ConditionExpression();
                con.AttributeName = "ProcessInstanceId";
                con.Operator = ConditionOperator.Equal;
                con.Values = new object[] { this.InstanceId };
                queryExp.Criteria.Add(con);

                entities = EntityManager.GetEntities(this.caller, template, queryExp);

                RelatedEntityListRenderer relatedEntityListRenderer = new RelatedEntityListRenderer();
                relatedEntityListRenderer.ShowActionColumn = false;
                relatedEntityListRenderer.RetURL = this.Request.RawUrl;

                SavedQueryParser parser = new SavedQueryParser();
                relatedEntityListRenderer.Caller = this.caller;
                relatedEntityListRenderer.Template = template;
                relatedEntityListRenderer.Columns = parser.ParseColumns(template, cols);
                relatedEntityListRenderer.Entities = entities;
                relatedEntityListRenderer.Render();

                this.ForwardReaderListHTML = relatedEntityListRenderer.TableHTML;

             
            }
            catch(Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
       
        
        void RenderRuleLogGrid(List<Entity> entities)
        {
            int mode = 2;
            //CallContext caller = AppDataSource.GetCallContext();
            //QueryExpression queryExp = new QueryExpression();
            //Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            //EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
            string retURL = HttpUtility.UrlEncode(Request.RawUrl);
            //string objectId = "";
            foreach (Entity entity in entities)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);
                int stateCode = MainUtil.GetInt(entity.Fields["StateCode"].Value, 0);
                string stateName = "办理中";
                if (stateCode==0)
                    stateName = "办理中";
                if (stateCode == 1)
                    stateName = "办理中";
                if (stateCode == 2)
                    stateName = "已完成";
                //if (stateCode == 16)
                //    stateName = "退回发起人";
                if (stateCode == 99)
                    stateName = "等上一步会签完成";
                //action
               // if (stateCode == 2)
                    tRow += string.Format("<td  class=\" actionColumn  \">{0}</td>", "");
               // else
                //    tRow += string.Format("<td  class=\" actionColumn  \"><a title=\"催办\" class=\"actionLink\" href=\"javascript:openPopupFocus('')\">催办</a></td>", entity.ID, "", retURL);

                //name
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>",StringUtil.GetString(entity.Fields["FromActivityName"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString( entity.Fields["ToActivityName"].Value));

                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ToIdentityName"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ExecutorIdentityName"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["SourceType"].Value));

                string createdBy = StringUtil.GetString(entity.Fields["CreatedBy"].Value);
                string createdByName = "";
                if (!string.IsNullOrEmpty(createdBy))
                    createdByName = EntityManager.GetEntityName(this.caller, ObjectTypeCodes.SystemUser, new Guid(createdBy));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", createdByName);

                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["CreatedOn"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ModifiedOn"].Value));

                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["TimeCost"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["Deadline"].Value));
                               
                int executeStatus = MainUtil.GetInt(entity.Fields["StatusCode"].Value, 0);
                //int stateCode = MainUtil.GetInt(entity.Fields["StateCode"].Value, 0);
                //string stateCodeName = "";
                string statusName = "";
                 
                if (executeStatus == 1)
                {
                    statusName = "流转下一步";
                }
                else if (executeStatus == 2)
                {
                    statusName = "跳转";
                }
                else if (executeStatus == 3)
                {
                    statusName = "终止";                    
                }
                else if (executeStatus == 4)
                {
                    statusName = "撤销回起草人";                    
                }
                else if (executeStatus == 5)
                {
                    statusName = "退回";//退回到某一环节
                }
                else if (executeStatus == 16)
                {
                    statusName = "退回发起人";//退回发起人
                }
                else if (executeStatus == 6)
                {
                    statusName = "直接结束";//退回到某一环节
                }
                tRow += string.Format(" <td class=\"dataCell\">{0}/{1}</td>", statusName, stateName);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["Description"].Value));

                tRow += "</tr>";

                tBody += tRow;
                mode++;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        void GetRelatedInstances()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                Guid processInstanceId = new Guid(instanceId);
                List<ProcessInstance> instances = WfInstanceManager.GetRelatedInstances(caller, processInstanceId);
                if (instances.Count == 0)
                    return;
                int mode = 2;
                string retURL = "";
                //if(pageSource=="l")                
                if (pageSource == "i")
                    retURL = string.Format("/a0M/e?id={0}&source=i", this.instanceId);
                else
                    retURL = string.Format("/a0M/e?id={0}&source=l", this._ruleLogId);
                retURL = HttpUtility.UrlEncode(retURL);
                string deleteURL = "";
                foreach (ProcessInstance isnt in instances)
                {
                    //string tRow = "";
                    sb.Append(RenderStartRow(mode));
                    string actionCol1 = "";
                    if (attachRight >= 4)
                    {
                        string delActionCol = "&nbsp;|&nbsp;<a title=\"删除 （新窗口）\" class=\"actionLink\" onclick=\"return confirmDelete();\" href=\"{0}\">删除</a>";
                        deleteURL = string.Format("/setup/own/deleteredirect.aspx?delID={0}&type={1}&retURL={2}", isnt.ValueId, ObjectTypeCodes.WFProcessInstanceRelated, retURL);
                        actionCol1 = string.Format(delActionCol, deleteURL);
                    }
                    sb.Append("<td class=\"actionColumn\">");
                    sb.AppendFormat("<a href='/a0M/detail?source=i&id={0}&retURL={2}' title=\"{1}\" class=\"actionLink\" target='_blank'>查看</a>", isnt.ProcessId, isnt.Name,  retURL);
                    sb.Append(actionCol1);
                    sb.Append("</td>");
                    //sb.AppendFormat("<td  class=\" actionColumn  \"><a title=\"删除\" class=\"actionLink\" href=\"{0}\">删除</a></td>", isnt.ProcessId, "", this.RetURL);
                    sb.AppendFormat(" <td class=\"dataCell\"><a href='/a0M/detail?source=i&id={0}&retURL={2}' target='_blank'>{1}</a></td>", isnt.ProcessId, isnt.Name, retURL);
                    sb.AppendFormat(" <td class=\"dataCell\">{0}</td>", isnt.CreatedOn);
                    sb.Append("</tr>");
                }
                this.RelatedInstanceHTML = sb.ToString();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }

        public string WfFormExportPdfUrl { get; set; }

        public string RelatedNoteListData { get; set; }

        public string ForwardReaderListHTML { get; set; }

        public string ReadLogListHTML { get; set; }

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
        /// <summary>
        /// 事务状态
        /// </summary>
        public string InstanceState { get; set; }
        public Guid FormLayoutId { get { return _formId; } set { _formId = value; } }
        public string ProcessId
        {
            get { return _processId; }
            set { _processId = value; }
        }
        
        /// <summary>
        /// 流转事务ID
        /// </summary>
        public string RuleLogId
        {
            get { return this._ruleLogId ; }
            set { this._ruleLogId = value; }
        }
        Guid _fromActivityId = Guid.Empty;
        bool _isFirstActivity = false;
        bool _isFinalActivity = false;
        /// <summary>
        /// 当前步骤的来源步骤
        /// </summary>
        public Guid FromActivityId
        {
            get { return _fromActivityId; }
            set { _fromActivityId = value; } 
        }
        public Guid StepId { 
            get { return currentStepId; } 
            set { currentStepId = value; } 
        }
        public string CurrentStepName { get; set; }
        /// <summary>
        /// 是否是第一步
        /// </summary>
        public bool IsFirstActivity
        {
            get { return _isFirstActivity; }
            set { _isFirstActivity = value; }
        }
        public bool IsFinalActivity
        {
            get { return _isFinalActivity; }
            set { _isFinalActivity = value; }
        }

        public string ResultHTML
        {
            get { return html; }
            set { html = value; }
        }
        /// <summary>
        /// 相关流程HTML
        /// </summary>
        public string RelatedInstanceHTML { get; set; }
        public bool EditMode { get; set; }
        /// <summary>
        /// 正文编辑模式(0,0 -只读 1,1-可编辑 2 可编辑，有痕迹
        /// </summary>
        public string MainDocEditMode { get; set; }
        /// <summary>
        /// 正文权限
        /// </summary>
        public long DocRights1 { get; set; }
        /// <summary>
        /// 附件权限
        /// </summary>
        public long AttachRight {
            get { return attachRight  ;}
            set {  attachRight = value;}
        }
        /// <summary>
        /// 附件编辑方式
        /// </summary>
        [Obsolete("无用")]
        public string AttachEditType { get; set; }

        public string RetURL { get; set; }
        /// <summary>
        /// 如果流程完成，变成查看模式，控件不显示
        /// </summary>
        public string IsFormView { get; set; }
        public string StepSplitType { get; set; }
        public string SelectedStepsPopHTML { get; set; }
        /// <summary>
        /// 流程关联的对象类型
        /// </summary>
        public int EntityObjectType { get; set; }
        /// <summary>
        /// 结束权限
        /// </summary>
        public bool HasFlowFinish { get; set; }

        public bool CouldBackLast { get; set; }

        public string OrganizationId { get; set; }
    }
}