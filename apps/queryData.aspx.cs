using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.EntityFramework.Entities;
using OA.Web.UI;
using OA.Web.UI.WebControls;
using Supermore.Data.Query;

namespace WebClient.apps
{
    public partial class queryData : System.Web.UI.Page
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
            //  <cc1:SrchLineControl runat="server" id="SrchLineControl1" EntityCode="a0V"/>
            SrchLineControl srchLineControl = new SrchLineControl();
            srchLineControl.Template = _template;
            srchLineControl.Render();
            SearchLineHTML = srchLineControl.OutHTML;
        }
        public void GetEntityList()
        {
            string filterID = Request["id"];

            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            _template = savedQuery.Template;
            EntityCollection entities = null;
            string retURL = this.Request.RawUrl;

            //if (_template == null)
            //    _template = TemplateManager.GetTemplate(_caller.OrganizationId, _templateCode);
            SavedQueryParser parser = new SavedQueryParser();

            //QueryExpression extraQueryExpression = new QueryExpression();
            //if (!string.IsNullOrEmpty(srch))
            //{
            //    extraQueryExpression = new QueryExpression();
            //    ConditionOperator condOperator = ConditionOperator.Contains;
            //    extraQueryExpression.Criteria.AddCondition(savedQuery.Template.NameField, condOperator, srch);
            //}
            //if (!string.IsNullOrEmpty(filterQuery))
            //{
            //    string[] conds = filterQuery.Split('\n');
            //    foreach (string condLine in conds)
            //    {
            //        if (string.IsNullOrEmpty(condLine)) continue;
            //        string[] v = condLine.Split('\t');
            //        string fValue = v[2];
            //        if (!string.IsNullOrEmpty(fValue))
            //        {
            //            ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1].Trim());
            //            extraQueryExpression.Criteria.AddCondition(v[0].Trim(), condOperator, fValue.Trim());
            //        }
            //    }
            //}

            //List<GridSort> sorts = new List<GridSort>();
            //if (!string.IsNullOrEmpty(sort))
            //{
            //    GridSort orderExp = new GridSort();
            //    if (sort.Substring(0, 1) == "-")
            //    {
            //        orderExp.SortField = sort.Substring(1);
            //        orderExp.Direction = SortDirect.DESC;
            //    }
            //    else
            //    {
            //        orderExp.SortField = sort;
            //        orderExp.Direction = SortDirect.ASC;
            //    }
            //    sorts.Add(orderExp);
            //}
            entities = SavedQueryManager.GetEntityies(_caller, savedQuery, 25, 1, null);
            // _template = savedQuery.Template;
            int total = SavedQueryManager.Count(_caller, savedQuery, null);

            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Query = savedQuery;
            relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.ShowActionColumn = false;
            relatedEntityListRenderer.ShowEntityButtons = false;
            //relatedEntityListRenderer.Columns = parser.ParseColumns(_template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = _pageSize;
            relatedEntityListRenderer.CurrentPage = 1;
            relatedEntityListRenderer.Execute();
            //_initJson = relatedEntityListRenderer.ToInitJson();
            string dataJson = relatedEntityListRenderer.ToJson();
            dataJson = dataJson.Substring(10);
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '/_ui/entity/list/ListQueryServlet');";

        }

        public string InitJson
        {
            get { return _initJson; }
        }

        public string SearchLineHTML { get; set; }
        
    }
}