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

using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;

namespace WebClient.apps.wf
{
    public partial class WfApproveContainer : System.Web.UI.Page
    {
        Guid formId = Guid.Empty;
        string instanceId = "";
        Guid templateId = Guid.Empty;
        CallContext caller = null;
        ProcessInstance _instance = null;
        string _instanceName = "";
        string _processId = "";
        string _ruleLogId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _ruleLogId = Request["RuleLogId"];
            instanceId = Request["instanceId"];

            GetInstance(new Guid(instanceId));
            GetRuleLog();
            GetStepRight(_instance.SchemeId);
        }
        public void GetInstance(Guid processInstanceId)
        {
            _instance = WfInstanceManager.GetProcessInstance(processInstanceId);
            if (_instance != null)
            {
                this.InstanceName = _instance.Name;
                this.ProcessId = _instance.SchemeId.ToString();
            }
        }
        public void GetRuleLog()
        {
            if (string.IsNullOrEmpty(_ruleLogId))
                return;
            TransitionLog tranLog = WfInstanceManager.GetRuleLog(caller, new Guid(_ruleLogId));
            this.CurrentStepId = tranLog.ToActivityId;
            this.CurrentStepName = tranLog.ToActivityName;
        }
        public void GetStepRight(Guid processSchemeId)
        {
            if (string.IsNullOrEmpty(_ruleLogId))
                return;
            ActivityRightDefinition arDef = WfSchemeManager.GetStepRight(caller, processSchemeId, this.CurrentStepId);
            if (arDef != null)
            { 
            
            }
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
        public Guid CurrentStepId { get; set; }
        public string CurrentStepName { get; set; }
    }
}