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

namespace WebClient.apps.wf
{
    public partial class InstanceJumpStep : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.InstanceId = Request["InstanceId"];
            if (Request["fromActivityId"] != null)
            {
                this.FromStepId = Request["fromActivityId"];
            }
            GetInstance(new  Guid(InstanceId));
            if (Request["save"] != null)
            {
                SaveData();
            }
        }
        void SaveData()
        {
            //int statusCode = 2;
            string memo = Request["memo"];
            string nextActivity = Request["jumpActivity_lkid"];
            string strToIdentityIds = "";
            Guid[] toIdentityIds = null;
            Guid nextTransationId = Guid.Empty;
            Guid executorIdentityId = Guid.Empty;
            Guid ruleLogId = Guid.Empty;
            Guid toActivityId = new Guid(nextActivity);
            caller = AppDataSource.GetCallContext();
            executorIdentityId = new Guid(caller.UserID);
            strToIdentityIds = Request["duel_reports1"];
            if (!string.IsNullOrEmpty(strToIdentityIds))
                toIdentityIds = MainUtil2.ToGuidArray(strToIdentityIds);

            WorkflowInit.Runtime.Skip(executorIdentityId, ruleLogId, new Guid(FromStepId), toActivityId, new Guid(this.InstanceId), memo, toIdentityIds,3);
            string retURL = Request["retURL"];
            if(string.IsNullOrEmpty(retURL))
                retURL="/a0M/o";
            MainUtil2.ClosePopupAndRefreshParent(this.Response, retURL);
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
            }
        }
        public string InstanceId { get; set; }

        public string ProcessId { get; set; }
        public string ProcessName { get; set; }

        public string InstanceName { get; set; }
        
        public string FromStepId { get; set; }
        public string FromStepName { get; set; }
    }
}