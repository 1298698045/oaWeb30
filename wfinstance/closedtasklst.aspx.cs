using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.Queries;
using Supermore.GridBuilder;
using Youyou.GridBuilder;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Security.SecurityControl;
using OA.Web.UI;
using OA.Web.UI.WebControls;

namespace WebClient.wfinstance
{
    public partial class closedtasklst : System.Web.UI.Page
    {
        CallContext _caller;
        int _pageSize = 25;
        string _initJson = "";
        Template _template = null;
        string _templateCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            GetEntityList();
            //SrchLineControl srchLineControl = new SrchLineControl();
            //srchLineControl.Template = _template;
            //srchLineControl.Render();
            //SearchLineHTML = srchLineControl.OutHTML;
        }
        public void GetEntityList()
        {
          
            string retURL = this.Request.RawUrl;

            WFRuleLogClosedGridRender relatedEntityListRenderer = new WFRuleLogClosedGridRender();
            relatedEntityListRenderer.GridConfigId = "closedwfrulelog";
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            //relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = 25;
            relatedEntityListRenderer.CurrentPage = 1;
            relatedEntityListRenderer.Execute();
            string dataJson = relatedEntityListRenderer.ToJson();
            dataJson = dataJson.Substring(10);
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '/_ui/gridx/list/ListServlet?gridid=closedwfrulelog');";
        }

        public string InitJson
        {
            get { return _initJson; }
        }
        public string SearchLineHTML { get; set; }
    }
}