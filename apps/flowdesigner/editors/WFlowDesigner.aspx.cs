using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using Supermore.Web;

using Supermore.Data;
using Supermore.Data.Items;
using Supermore.Data.Fields;
using Supermore.Data.Managers;
//using Supermore.Workflows;
using Supermore.Caching;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
using Supermore;

namespace WebClient.apps.flowdesigner.editors
{
    public partial class WFlowDesigner : System.Web.UI.Page
    {
        //Item curItem = null;
        string schemeXml = "";
        string schemeId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            schemeId = Request["id"];
            //curItem = ItemManager.GetItem(new ID(id), Silverwinder.Context.Language, Data.Version.Latest,Client.ContentDatabase);
            //WorkflowProcessItem processItem = new WorkflowProcessItem(curItem);
            //string layout = processItem.Layout;
            //this.txtFlowLayout.Value = layout;
            //AppScriptManager.ExecuteJavascriptFun(this.Page, typeof(WFlowDesigner), "doloadFlowDesigner", "loadFlowDesigner();");
            //this.ClientScript.RegisterStartupScript(this.GetType(), "doloadFlowDesigner", "loadFlowDesigner();");
           // ScriptManager.RegisterStartupScript(this.Page, GetType(), "doloadFlowDesigner", "loadFlowDesigner();", true);
            if (!string.IsNullOrEmpty(schemeId))
            {
                Guid procId = new Guid(schemeId);
                schemeXml = WfSchemeManager.GetProcessScheme(procId);

                ProcessDefinition proc = WfSchemeManager.GetProcess(procId);
                this.ProcessName = proc.Name;
                this.ProcessCode = proc.ProcessCode;

                long c = WfSchemeManager.GetNextRuleCode(procId);
                if (c <= 0)
                {
                    string str1 = proc.ProcessCode.ToString() + "600";
                    this.NextRuleCode += MainUtil.GetLong(str1, 0);
                }
                else
                {
                    this.NextRuleCode = c;
                }

                c = WfSchemeManager.GetNextStepCode(procId);
                if (c <= 0)
                {
                    string str1 = proc.ProcessCode.ToString() + "100";
                    this.NextStepCode += MainUtil.GetLong(str1, 0);
                }
                else
                {
                    this.NextStepCode = c;
                }

            }
        }

        public string SchemeXml {
            get { return schemeXml; }
        }
        public string SchemeId
        {
            get { return schemeId; }
        }
        public string ProcessName { get; set; }
        public long ProcessCode { get; set; }
        public long NextStepCode { get; set; }
        public long NextRuleCode { get; set; }
    }
}
