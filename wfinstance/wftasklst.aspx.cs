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
    public partial class wftasklst : System.Web.UI.Page
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
            SrchLineControl srchLineControl = new SrchLineControl();
            srchLineControl.Template = _template;
            srchLineControl.Render();
            SearchLineHTML = srchLineControl.OutHTML;
        }
        public void GetEntityList()
        {
            //_templateCode = "a0V";
           
            string retURL = this.Request.RawUrl;

            //if (_template == null)
            //    _template = TemplateManager.GetTemplate(_caller.OrganizationId, _templateCode);
            //SavedQueryParser parser = new SavedQueryParser();
            //QueryExpression queryExp = new QueryExpression();
            //queryExp.IsPaged = true;
            //queryExp.PageInfo.PageNumber = 1;
            //queryExp.PageInfo.PageSize = _pageSize;
            //ConditionExpression condExp = new ConditionExpression();
            //condExp.AttributeName = "StateCode";
            //condExp.DataType = AttributeDataType.Number;
            //condExp.Operator = ConditionOperator.In;
            //condExp.Values = new object[] { 0, 1, 3, 4 };
            //queryExp.Criteria.Add(condExp);

            //queryExp.AddOrder("ModifiedOn", OrderType.Descending);

            //Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, _template.ID);
            //string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            //string[] cols = DisplayColumnNames.Split(',');
            //queryExp.ColumnSet.AddColumn(_template.PKField.Name);
            //foreach (string c in cols)
            //    queryExp.ColumnSet.AddColumn(c);
           // entities = EntityManager.GetEntities(_caller, _template, queryExp);

            WFRuleLogListRender relatedEntityListRenderer = new WFRuleLogListRender();
            relatedEntityListRenderer.GridConfigId = "wfrulelog";
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            //relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = 25;
            relatedEntityListRenderer.CurrentPage = 1;
            relatedEntityListRenderer.Execute();
            string dataJson = relatedEntityListRenderer.ToJson();
            dataJson = dataJson.Substring(10);
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '/_ui/gridx/list/ListServlet?gridid=wfrulelog');";
        }
       
        public string InitJson
        {
            get { return _initJson; }
        }
        public string SearchLineHTML { get; set; }
    }
}