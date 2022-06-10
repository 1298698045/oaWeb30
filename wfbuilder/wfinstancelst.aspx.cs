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
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Security.SecurityControl;
using OA.Web.UI;
using OA.Web.UI.WebControls;
using OptimaJet.Workflow;

namespace WebClient.wfbuilder
{
    public partial class wfinstancelst : System.Web.UI.Page
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

            GetSearchFilter();
        }
        public void GetEntityList()
        {
            _templateCode = "122";
            EntityCollection entities = null;
            string retURL = this.Request.RawUrl;
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            if (_template == null)
                _template = TemplateManager.GetTemplate(_caller.OrganizationId, _templateCode);
            SavedQueryParser parser = new SavedQueryParser();
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = 1;
            queryExp.PageInfo.PageSize = _pageSize;

            ConditionExpression condExp = new ConditionExpression();
            //condExp.AttributeName = "StateCode";
            //condExp.DataType = AttributeDataType.Number;
            //condExp.Operator = ConditionOperator.GreaterThan;
            //condExp.Values = new object[] { 0 };
            //queryExp.Criteria.Add(condExp);

            condExp.AttributeName = "BusinessUnitId";
            //condExp.DataType = AttributeDataType.e;
            condExp.Operator = ConditionOperator.Equal;
            condExp.Values = new object[] { _caller.BussinessUnitId };
            queryExp.Criteria.Add(condExp);

            queryExp.AddOrder("CreatedOn", OrderType.Descending);

            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, _template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = DisplayColumnNames.Split(',');
            queryExp.ColumnSet.AddColumn(_template.PKField.Name);
            foreach (string c in cols)
                queryExp.ColumnSet.AddColumn(c);

            entities = WfInstanceManager.GetAccessInstances(_caller, 1, 25);

            int total = 25;// SavedQueryManager.Count(_caller, _template, queryExp);

            WFInstanceListRender relatedEntityListRenderer = new WFInstanceListRender();
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            //relatedEntityListRenderer.Query = savedQuery;
            relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.EntityType = "122";
            //relatedEntityListRenderer.ShowActionColumn = false;
            //relatedEntityListRenderer.ShowEntityButtons = false;
            relatedEntityListRenderer.Columns = parser.ParseColumns(_template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = _pageSize;
            relatedEntityListRenderer.CurrentPage = 1;
            relatedEntityListRenderer.Execute();
            //_initJson = relatedEntityListRenderer.ToInitJson();
            string dataJson = relatedEntityListRenderer.ToJson();
            dataJson = dataJson.Substring(10);
            //_initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '/_ui/busop/wfinstance/InstanceListServlet?StateCode=0');";
            string url = "/_ui/workflow/wfinstance/ManageInstancesListServlet?filterType=122&actionCol=no&processPara=1&filterState=instance_all&filterId=CBC8869A-92D5-4CEC-BB6D-1DC87A71A52C";
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '" + url + "');";
            

        }

        void GetSearchFilter()
        {
            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchFilterLayout(_caller, _template.ID);
            string displayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = displayColumnNames.Split(',');

            SearchFilterLayout filterRender = new SearchFilterLayout();
            filterRender.Template = this._template;
            filterRender.SearchFilterFields = displayColumnNames;
            filterRender.Caller = _caller;
            filterRender.Render();
            SearchLineHTML = filterRender.SearchFilterHTML;

            //显示列
            //layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, _template.ID);
            //displayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            //this.DisplayFields = displayColumnNames;

        }

        public string InitJson
        {
            get { return _initJson; }
        }
        public string SearchLineHTML { get; set; }
    }
}