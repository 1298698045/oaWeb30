using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
using Supermore.Caching;
using Supermore.Data;
//using Supermore.Data.Items;
//using Supermore.Data.Fields;
//using Supermore.Data.Managers;
//using Supermore.Workflows;
using Supermore.Web;
using Supermore.EntityFramework.Entities;
using Supermore;

namespace WebClient.apps.flowdesigner.editors
{
    public partial class Monitor2 : System.Web.UI.Page
    {
        string schemeXml = "";
        string schemeId = "";
        string _instanceId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            schemeId = Request["schemeId"];
            _instanceId = Request["InstanceId"];
            //curItem = ItemManager.GetItem(new ID(id), Silverwinder.Context.Language, Data.Version.Latest,Client.ContentDatabase);
            //WorkflowProcessItem processItem = new WorkflowProcessItem(curItem);
            //string layout = processItem.Layout;
            //this.txtFlowLayout.Value = layout;
            //AppScriptManager.ExecuteJavascriptFun(this.Page, typeof(WFlowDesigner), "doloadFlowDesigner", "loadFlowDesigner();");
            //this.ClientScript.RegisterStartupScript(this.GetType(), "doloadFlowDesigner", "loadFlowDesigner();");
            // ScriptManager.RegisterStartupScript(this.Page, GetType(), "doloadFlowDesigner", "loadFlowDesigner();", true);
            if (!string.IsNullOrEmpty(schemeId))
            {
                schemeXml = WfSchemeManager.GetProcessScheme(new Guid(schemeId));
            }
            if (!string.IsNullOrEmpty(_instanceId))
            {
                ProcessInstance _instance = WfInstanceManager.GetProcessInstance(new Guid(_instanceId));
                if (_instance != null)
                {
                    this.InstanceName = _instance.Name;
                    //this.ProcessId = _instance.SchemeId.ToString();
                }

                _stateXml = "<process>";
                ProcessDefinition process = WfSchemeManager.GetProcess(new Guid(schemeId));
                List<Entity> logs = WfInstanceManager.GetRuleLogs(new Guid(_instanceId));
                foreach (Entity log in logs)
                {
                    Guid activityId = MainUtil.GetGuid(log.Fields["ToActivityId"].Value);
                    ActivityDefinition actDef = process.FindActivity(activityId);
                    if (actDef == null) continue;
                    int stateCode = MainUtil.GetInt(log.Fields["StateCode"].Value, 0);
                    string stateName = "";
                    if (stateCode == 0)
                        stateName = "Running";
                    if (stateCode == 1)
                        stateName = "Running";
                    if (stateCode == 2)
                        stateName = "Completed";
                    _stateXml += string.Format("<update id=\"{0}\" state=\"{1}\"/>", actDef.ActivityCode, stateName);
                }
                _stateXml += "</process>";
            }
        }
        string _stateXml = "";
        public string SchemeXml
        {
            get { return schemeXml; }
        }
        public string StateXml
        {
            get { return _stateXml; }
        }
        public string SchemeId
        {
            get { return schemeId; }
        }
        public string InstanceId
        {
            get { return _instanceId; }
        }

        public string InstanceName
        {
            get;
            set;
        }
    }
}