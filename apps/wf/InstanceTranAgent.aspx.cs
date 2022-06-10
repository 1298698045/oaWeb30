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
using Supermore.Security;
using Supermore.Emails;
using Supermore.Mobile;

namespace WebClient.apps.wf
{
    public partial class InstanceTranAgent : System.Web.UI.Page
    {
        CallContext caller = null;
        string _ruleLogId = "";
        TransitionLog tranLog = null;
        ProcessInstance instance;
        Guid currentStepId = Guid.Empty;
        string _instanceId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _ruleLogId = Request["RuleLogId"];
            if (!string.IsNullOrEmpty(_ruleLogId))
            {
                GetFromLog();
            }
            else
            {
                this.InstanceId = Request["InstanceId"];
                GetInstance(new Guid(InstanceId));                
            }
            //DelegatedApproverId, ManagerId
            if (this.ExecutorIdentityId != Guid.Empty)
            {
                SystemUser systemUser = SecurityAuth.GetSystemUser(caller, this.ExecutorIdentityId);

                if (systemUser.DelegatedApproverId != Guid.Empty)
                {
                    SystemUser delegatedSystemUser = SecurityAuth.GetSystemUser(caller, systemUser.DelegatedApproverId);

                    if (delegatedSystemUser != null)
                    {
                        this.AgentUserName = delegatedSystemUser.FullName;
                        this.AgentUserId = delegatedSystemUser.DelegatedApproverId.ToString();
                    }
                }
            }
            
            if (Request["save"] != null)
            {
                SaveData();
            }
        }
        void SaveData()
        {
            try
            {
                string agentname_lkid = Request["agentname_lkid"];
                if (string.IsNullOrEmpty(agentname_lkid))
                {
                    return; 
                }
                string memo = Request["notifyMsg"];
                string agentname = Request["agentname"];
                //Guid orgExecutorId = new Guid(caller.UserID);
                Guid agentUserId = new Guid(agentname_lkid);
                if (agentUserId == Guid.Empty)
                    return;

                if (string.IsNullOrEmpty(_ruleLogId))
                {
                    //从管理界面，进行转代理
                   IEnumerable<TransitionLog> logs = WfInstanceManager.GetUnfinishedTransitions(caller, new Guid(this.InstanceId));
                   if (logs.Count<TransitionLog>() > 0)
                   {
                       foreach (TransitionLog log in logs)
                       {
                           _ruleLogId = log.ID.ToString();
                       }
                   }
                }

                WorkflowInit.Runtime.TransferAgent(new Guid(_ruleLogId), this.ExecutorIdentityId, agentUserId, agentname, memo);

                //string content = string.Format("亲爱的{0}：<br/>麻烦您帮助我处理一下如下事务：{1}<br/>",agentname,this.InstanceName) + memo;
                string subject = "流程转代理:" + InstanceName;
                Guid sendBatchId = Guid.NewGuid();
                //InnerMailManager.CreateHtmlEmail(caller, new Guid(caller.UserID), agentUserId, subject, memo, sendBatchId, 100);
                SmsMessageManager.PushSmsQueueAndSend(caller, new Guid[] { agentUserId }, memo, 100, DateTime.Now, sendBatchId);
                //WfInstanceManager.RemindParticipantor(caller, new Guid(this.InstanceId), msg, false, true);
                MainUtil2.ClosePopupAndRefreshParent(this.Response, "/a0M/o");
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }
        void GetFromLog()
        {
            //_ruleLogId = Request["id"];

            tranLog = WfInstanceManager.GetRuleLog(caller, new Guid(_ruleLogId));
            currentStepId = tranLog.ToActivityId;
            this.InstanceId = tranLog.ProcessInstanceId.ToString();
            this.ExecutorIdentityId = tranLog.ExecutorIdentityId;
            //tranLog.ExecutorIdentityId; //执行人
            GetInstance(tranLog.ProcessInstanceId);

            this.NotifyMessage = string.Format("流程转代理: 亲，[{0}]转过来的 [{1}]事务，需要您办理，请速办理！", WebContext.UserFullName, InstanceName);
            //if (tranLog.StateCode == 2)
            //{
            //    this.EditMode = false;
            //}
            //else
            //{
            //    //获取权限
            //}
            //if (string.IsNullOrEmpty(this.RetURL))
            //    this.RetURL = "/apps/wf/MyApplyList.aspx?t=122&src=2";
        }
        public void GetInstance(Guid processInstanceId)
        {
            ProcessInstance instance = WfInstanceManager.GetProcessInstance(processInstanceId);
            if (instance != null)
            {
                this.ProcessId = instance.SchemeId.ToString();
                //_formId = instance.ProcessScheme.EntityLayoutId;
                InstanceName = instance.Name;
                this.FromStepId = instance.CurrentActivityId.ToString();
                this.FromStepName = instance.CurrentActivityName;
                //if (instance.StateCode >= 3)
                //    this.EditMode = false;
                this.NotifyMessage = string.Format("流程办理: [{0}]事务需要您办理，请登录OA或者凤凰办公APP办理！", InstanceName);
            }
        }
        public string InstanceId { get { return _instanceId; } set { _instanceId = value; } }

        public string ProcessId { get; set; }
        public string ProcessName { get; set; }

        public string InstanceName { get; set; }

        public Guid ExecutorIdentityId { get; set; }

        public string FromStepId { get; set; }
        public string FromStepName { get; set; }

        public string AgentUserId { get; set; }
        public string AgentUserName { get; set; }

        public string NotifyMessage { get; set; }
    }
}