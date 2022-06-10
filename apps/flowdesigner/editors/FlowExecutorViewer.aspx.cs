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

namespace Silverwinder.Shell.flowdesigner.editors
{
    public partial class FlowExecutorViewer : System.Web.UI.Page
    {
        //Item curItem = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string id = Request["id"];
            //Database db = Client.ContentDatabase;
            //ActivityInstanceItem actInstanceItem = WorkflowManager.GetWorkflowActivityInstance(new ID(id),  db);

            //string procId = actInstanceItem.ProcessId;
            //WorkflowProcessItem processItem = WorkflowManager.GetWorkflow(new ID(procId), db);

            ////WorkflowProcessItem processItem = new WorkflowProcessItem(curItem);
            //string layout = processItem.Layout;
            //this.txtFlowLayout.Value = layout;
        }
    }
}
