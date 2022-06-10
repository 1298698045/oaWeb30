using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using OptimaJet.Workflow;

using Supermore;
using OptimaJet.Workflow.Core.Model;
using Supermore.Data;
using Supermore.Workflow.Evaluation;
using Supermore.Security;
using Supermore.EntityFramework.Entities;

namespace WebClient.apps.wf
{
    public partial class StartProcInstance : System.Web.UI.Page
    {
        string _ruleLogId = "";
        CallContext caller = null;
        ProcessInstance procInstance = null;
        string _procInstanceId = "";
        string _possibleActivities = "";
        protected void Page_Load(object sender, EventArgs e)
        {
                        
            _ruleLogId = Request["RuleLogId"];
            //this.OwnerName = WebContext.UserName;
            _procInstanceId = Request["id"];
            if (string.IsNullOrEmpty(_procInstanceId))
                _procInstanceId = Request["InstanceId"];
            string t = Request["t"];

            if (Request["cancel"] != null)
            {
                Response.Redirect(string.Format("/{0}/detail?id={1}&retURL=/{0}/o", t, _procInstanceId), true);
            }
            caller = AppDataSource.GetCallContext();

            try
            {
                // GetInitActivity(instanceId);
                GetTransition(_procInstanceId);

                if (Request["save"] != null)
                {
                    Guid executorIdentityId = new Guid(caller.UserID);
                    //if (!string.IsNullOrEmpty(WebContext.UserId))
                    // {                   
                    //}
                    //string strNextExecutorId = Request["act1_lkid"];
                    string instAction = Request["instAction"];
                    string memo = Request["memo"]; //留言
                    Guid curStepId = new Guid(FromStepId);
                    Guid nextTransationId = Guid.Empty;
                    Guid nextStepId = Guid.Empty;
                    string nextActivity = "";
                    int statusCode = 0;
                    Guid[] toIdentityIds = null;
                    string strToIdentityIds = "";
                    string strDeadline = Request["cpn11"];
                    int deadline = MainUtil.GetInt(strDeadline, 3);
                    #region action
                    if (instAction == "n") //下一步
                    {
                        statusCode = 1;
                        nextActivity = Request["nextActivity"];  //流转下一步 格式  ‘{流转ID},{下一环节ID}’
                        if (!string.IsNullOrEmpty(nextActivity))
                        {
                            string[] tArray = nextActivity.Split(',');
                            nextTransationId = new Guid(tArray[0]);
                            nextStepId = new Guid(tArray[1]);
                        }
                    }
                    else if (instAction == "j") //跳转
                    {
                        statusCode = 2;
                        //nextActivity = Request["jumpActivity_lkid"];
                        nextActivity = Request["jumpActivity"];
                    }
                    else if (instAction == "t") //终止
                    {
                        statusCode = 3;
                    }
                    else if (instAction == "c") //撤销回起草人
                    {
                        statusCode = 4;
                    }
                    else if (instAction == "b" || instAction == "p") //退回
                    {
                        statusCode = 5;  //
                        //nextActivity = Request["backActivity_lkid"];
                        nextActivity = Request["backActivity"];
                    }
                    else if (instAction == "f") //结束
                    {
                        statusCode = 6;  //
                        //nextActivity = Request["jumpActivity_lkid"];
                    }
                    #endregion

                    if (instAction == "n" || instAction == "j")//整除流程，跳转，回退
                    {
                        //@@ToDO ,如果是最后一步，就不需要再选人
                        //如果是退回，则自动选择以前的人
                        strToIdentityIds = Request["duel_reports1"];
                        if (string.IsNullOrEmpty(strToIdentityIds) && !string.IsNullOrEmpty(nextActivity) && !IsFinal) //未选执行人
                            return;
                    }
                    //|| instAction == "b"

                    Guid proceInstanceId = new Guid(_procInstanceId);

                    if (!string.IsNullOrEmpty(strToIdentityIds))
                        toIdentityIds = MainUtil2.ToGuidArray(strToIdentityIds);

                    //toNext
                    if (instAction == "j")//跳转
                    {
                        WorkflowInit.Runtime.Skip(executorIdentityId, new Guid(_ruleLogId), curStepId, new Guid(nextActivity), proceInstanceId, memo, toIdentityIds, deadline);
                    }
                    else if (instAction == "f")//结束流程
                    {
                        WorkflowInit.Runtime.Finish(executorIdentityId, new Guid(_ruleLogId), curStepId, proceInstanceId, memo);
                    }
                    else if (instAction == "b")//回退流程
                    {
                        //WorkflowInit.Runtime.Pullback(executorIdentityId, new Guid(_ruleLogId), curStepId, new Guid(nextActivity), proceInstanceId, memo, deadline);
                        WfInstanceManager.SendBack(executorIdentityId, new Guid(_ruleLogId), curStepId, new Guid(nextActivity), proceInstanceId, memo, deadline);
                    }
                    else if (instAction == "s")//退回的发起节点
                    {
                        WfInstanceManager.SendBackStart(caller, executorIdentityId, new Guid(_ruleLogId), curStepId, proceInstanceId, memo);
                    }
                    else if (instAction == "p")//回退上一环节流程
                    {
                        //WorkflowInit.Runtime.Pullback(executorIdentityId, new Guid(_ruleLogId), curStepId, new Guid(FromActivityId), proceInstanceId, memo, deadline);
                        WfInstanceManager.SendBackLast(executorIdentityId, new Guid(_ruleLogId), curStepId, proceInstanceId, memo, deadline);
                    }
                    else
                        WorkflowInit.Runtime.Execute(executorIdentityId, new Guid(_ruleLogId), curStepId, proceInstanceId, statusCode, memo, nextTransationId, toIdentityIds, deadline);

                    #region send msg
                    if (Request["isZhihui"] != null)
                    {
                        string zhihuiInfo = Request["zhihuiInfo"]; //知会信息
                        string zhihuiMember = Request["zhihuiMember_lkid"];
                        if (!string.IsNullOrEmpty(zhihuiMember))
                        {
                            //Guid[] members= MainUtil2.ToGuidArray(zhihuiMember, ',');
                            //string[] members = zhihuiMember.Split(',');
                            bool zhihuiChannel1 = MainUtil.GetBool(Request["zhihuiChannel1"], false);
                            bool zhihuiChannel2 = MainUtil.GetBool(Request["zhihuiChannel2"], false);
                            WfInstanceManager.NotifyRelatedGroupMembers(caller, proceInstanceId, this.ProcInstanceName, 1, zhihuiMember, zhihuiInfo, zhihuiChannel1, zhihuiChannel2);
                        }
                    }
                    if (instAction != "f" && !IsFinal)
                    {
                        string notifyType1 = Request["notifyType1"]; //邮件，APP推送
                        string notifyType2 = Request["notifyType2"]; //短信
                        bool notifyEmail = true;// MainUtil.GetBool(notifyType1, true);
                        bool notifySms = true;// MainUtil.GetBool(notifyType2, true);

                        if (string.IsNullOrEmpty(notifyType1))
                            notifyEmail = false;
                        if (string.IsNullOrEmpty(notifyType2))
                            notifySms = false;

                        string notifyMsg = Request["notifyMsg"];
                        string title = "流程事务办理提醒";// +this.ProcInstanceName;
                        //提醒下一步办理人员
                        if (!string.IsNullOrEmpty(notifyMsg))
                            WfInstanceManager.RemindParticipantor(caller, proceInstanceId, title, notifyMsg, notifyEmail, notifySms, true);
                    }
                    #endregion

                    string retURL = "";// Request["retURL"];
                    if (string.IsNullOrEmpty(t))
                    {
                        t = "a0M";
                    }
                    retURL = string.Format("/{0}/o", t);
                    //retURL = "/apps/wf/instancedetail.aspx?t=122&source=i&id=" + proceInstanceId;
                    //retURL = string.Format("/{0}/detail?source=l&id={1}&retURL=/{0}/o", t, _ruleLogId);                    
                    //retURL = string.Format("/{0}/detail?source=l&id={1}&retURL=/{0}/o", t, _ruleLogId);
                    //retURL = string.Format("/{0}/detail?source=i&id={1}&retURL=/{0}/o", t, proceInstanceId);
                    Response.Redirect(retURL,false);
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                Response.Redirect("/a0M/o", true);
                //Response.Redirect("/wfinstance/instlst.aspx?gridid=mydraftinstances&t=a0M", true);
            }
        }
      
        void GetTransition(string procInstanceId)
        {
           
            procInstance = WfInstanceManager.GetProcessInstance(caller,new Guid(procInstanceId));
            ProcessDefinition processScheme =  procInstance.ProcessScheme;
            //if(processScheme==null)
            //processScheme = WfSchemeManager.GetProcess(procInstance.SchemeId);
       
            this.ProcInstanceName = procInstance.Name;
            this.ProcessName = processScheme.Name;
            this.ProcessId = processScheme.ID.ToString();
            ActivityDefinition nextActivity = null;
            
            if (string.IsNullOrEmpty(_ruleLogId))
                return;
            TransitionLog tranLog = WfInstanceManager.GetRuleLog(caller, new Guid(_ruleLogId));
            FromActivityId = tranLog.FromActivityId.ToString();
            this.FromStepId = tranLog.ToActivityId.ToString();
            this.FromStepName = tranLog.ToActivityName;
            int deadline = tranLog.Deadline;
            if (deadline == 0) deadline = 3;

            //tranLog.FromActivityId == Guid.Empty ||
            //processScheme.get
            if (tranLog.ToActivityId == processScheme.InitialActivity.ID)
            //if (fromActivity == null)
            {
                //if (fromActivity.IsInitial) //开始节点屏蔽，退回
                //{
                    IsInitial = true;
                //}
            }
           //tranLog.f
            //tranLog.CreatedBy;
            ConditionParser conditionParser = new Supermore.Workflow.Evaluation.ConditionParser();
            RuleContext ruleContext = new RuleContext();
            ruleContext.StartUser = SecurityAuth.GetSystemUser(caller, procInstance.CreatedBy);

            Entity entity = EntityManager.GetEntity(caller, processScheme.EntityObjectId, new Guid(procInstanceId));
            if (entity != null)
                ruleContext.FormData.Add(entity);

            string selectStep = "";
            IEnumerable<TransitionDefinition> trans = processScheme.GetPossibleTransitionsForActivityId(tranLog.ToActivityId);
            TransitionDefinition tranDef = null;
            TransitionDefinition matchTran = EvaluateCondition(trans, ruleContext);
            bool hasSelected = false;//是否已经选择默认步骤
            
            foreach (TransitionDefinition t in trans)
            {
                tranDef = t;
                nextActivity = t.To;
                //this.RuleId = t.ID.ToString();
                this.ToStepId = t.ToActivityId.ToString();
                this.ToStepName = nextActivity.Name;

                if (matchTran != null)//找到了符合条件的
                {
                    if (matchTran.ID == t.ID) //当前的是符号条件的
                    {
                        selectStep = nextActivity.Name;
                        _possibleActivities += string.Format("<option value='{0},{1}' selected>{2}</option>", t.ID, this.ToStepId, this.ToStepName);
                        hasSelected = true;
                        this.NextDeadline = nextActivity.Deadline;
                    }
                    else
                        _possibleActivities += string.Format("<option value='{0},{1}'>{2}</option>", t.ID, this.ToStepId, this.ToStepName);
                }
                else {
                    
                    //没找到符号条件的，就选择没有设置条件的
                    if (t.Condition == null && (!hasSelected))
                    {
                        _possibleActivities += string.Format("<option value='{0},{1}' selected>{2}</option>", t.ID, this.ToStepId, this.ToStepName);
                        hasSelected=true;
                        this.NextDeadline = nextActivity.Deadline;
                    }
                    else
                    {
                        _possibleActivities += string.Format("<option value='{0},{1}'>{2}</option>", t.ID, this.ToStepId, this.ToStepName);
                    }

                    if (string.IsNullOrEmpty(selectStep))
                        selectStep = this.ToStepName;
                }
           
            }
            //tranLog.ToActivityId
            //this.NotifyMessage = string.Format("流程事务:[ {0} ]，步骤为:[ {2} ] 需要您办理，期限 {1} 天.", procInstance.Name, deadline, selectStep);
            this.NotifyMessage = string.Format("流程事务:[ {0} ]，请您查阅！", procInstance.Name);
            this.NotifyReadMessage = string.Format(" [ {0} ] 文件或事务 需要您阅示！！从首页或者我的事物的知会传阅中查看。", procInstance.Name);

            if (trans.Count() <= 0)
            {
                this.IsFinal = true;
            }
           
        }
        void GetInitActivity(string procInstanceId)
        {
            ProcessInstance instance = WfInstanceManager.GetProcessInstance(new Guid(procInstanceId));
            ProcessDefinition processScheme = instance.ProcessScheme;
            ActivityDefinition initActivity = processScheme.InitialActivity;
            this.ProcInstanceName = instance.Name;
            this.ProcessName = processScheme.Name;
            this.ProcessId = processScheme.ID.ToString();
            ActivityDefinition nextActivity = null;
            
            this.FromStepId = initActivity.ID.ToString();
            this.FromStepName = initActivity.Name;

            IEnumerable<TransitionDefinition> trans = processScheme.GetPossibleTransitionsForActivity(initActivity);
            TransitionDefinition tranDef = null;
            foreach (TransitionDefinition t in trans)
            {
                tranDef = t;
                nextActivity = t.To;                
                //this.RuleId = t.ID.ToString();
                
                this.ToStepId = t.ToActivityId.ToString();
                this.ToStepName = nextActivity.Name;
               
                _possibleActivities += string.Format("<option value='{0},{1}'>{2}</option>", t.ID,this.ToStepId, this.ToStepName);
            }
            /*
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
        /// <summary>
        /// 验证符号条件的 转移条件
        /// </summary>
        /// <param name="trans"></param>
        /// <param name="ruleContext"></param>
        /// <returns></returns>
        private TransitionDefinition EvaluateCondition(IEnumerable<TransitionDefinition> trans, RuleContext ruleContext)
        {
            ConditionParser conditionParser = new Supermore.Workflow.Evaluation.ConditionParser();
            foreach (TransitionDefinition t in trans)
            {
                if (t.Condition != null)
                {
                    bool isEval = conditionParser.Evaluate(t.Condition.EntityCondtion, ruleContext);
                    if (isEval)
                    {
                        return t;
                    }
                }
            }
            return null;
        }
        /// <summary>
        /// 结束
        /// </summary>
        public bool IsFinal { get; set; }
        /// <summary>
        /// 开始节点
        /// </summary>
        public bool IsInitial { get; set; }

        public string ProcInstanceName { get; set; }
        public string RuleId { get; set; }
        public string RuleLogId { get; set; }
        public string ProcessId { get; set; }
        public string ProcessName { get; set; }
        /// <summary>
        /// 流程实例ID
        /// </summary>
        public string ProcessInstanceId { get { return _procInstanceId; } set { _procInstanceId = value; } }
              
        public string FromStepId { get; set; }
        public string FromStepName { get; set; }
        public string FromActivityId { get; set; }
        public string ToStepId { get; set; }
        public string ToStepName { get; set; }

        int _deadline = 3;
        /// <summary>
        /// 下一步办理期限，默认3天
        /// </summary>
        public int NextDeadline {
            get { return _deadline;}
            set { 
                _deadline = value;
                if (_deadline <= 0)
                    _deadline = 3;
            }
        }

        public string NextExecutorName { get; set; }
        public string NextExecutorId { get; set; }

        public string StartByName { get; set; }

        public string PossibleActivities { get { return _possibleActivities; } }
        /// <summary>
        /// 默认通知消息
        /// </summary>
        public string NotifyMessage { get; set; }
        /// <summary>
        /// 默认传阅与知会消息
        /// </summary>
        public string NotifyReadMessage { get; set; }
    }
}