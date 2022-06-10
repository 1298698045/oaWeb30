using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.Data.Query;

using OA.Web.UI;
namespace WebClient.apps.mobile
{
    public partial class SmsLogs : System.Web.UI.Page
    {
        private string entityType = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 30021;
        private int _pageSize = 10;
        Template _template;
        private string _templateCode = "";
        private string _tmeplateId = "";
        private string _initJson = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                GetEntityList();
                //RenderFilters();
            }
        }
        public void GetEntityList2()
        {
            EntityCollection entities = null;
            string retURL = this.Request.RawUrl;
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            if (_template == null)
                _template = TemplateManager.GetTemplate(_caller.OrganizationId, _templateCode);

            if (_template != null)
            {
                _typeCode = _template.ObjectTypeCode;
                pageTitle = _template.Title;
            }

            SavedQueryParser parser = new SavedQueryParser();
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = 1;
            queryExp.PageInfo.PageSize = _pageSize;
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            //savedQuery.
            // SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);
            queryExp.AddOrder("CreatedOn", OrderType.Ascending);

            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, _template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            this.DisplayFields = DisplayColumnNames;
            string[] cols = DisplayColumnNames.Split(',');
            queryExp.ColumnSet.AddColumn(_template.PKField.Name);
            foreach (string c in cols)
                queryExp.ColumnSet.AddColumn(c);

            entities = EntityManager.GetEntities(_caller, _template, queryExp);
            // _template = savedQuery.Template;
            int total = SavedQueryManager.Count(_caller, _template, queryExp);

            _tmeplateId = this._template.ID.ToString();

            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            //relatedEntityListRenderer.Query = savedQuery;
            relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.ShowActionColumn = false;
            relatedEntityListRenderer.ShowEntityButtons = false;
            relatedEntityListRenderer.LinkOpenBlank = true;
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
            string queryURL = "/_ui/entity/SearchEntityListServlet?templateid=" + _tmeplateId;
            // string docIn = "/_ui/busop/docinitem/DocInItemListServlet";
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '" + queryURL + "');";

        }

        
        public void GetEntityList()
        {
            Template template = null;
            EntityCollection entities = null;

            template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.SmsMessageLogBase);

            Entity layoutEntity = TemplateSearchLayoutManager.GetDefaultTabLayout(_caller, template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = DisplayColumnNames.Split(',');

            entities = GetEntities(template);
            //SavedQuery savedQuery = SavedQueryManager.GetDefaultQuery(_caller, this.TypeCode);
            RelatedEntityListRenderer relatedEntityListRenderer = new RelatedEntityListRenderer();
            relatedEntityListRenderer.ShowActionColumn = false;
            relatedEntityListRenderer.RetURL = this.Request.RawUrl;
            //entities = SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);
            SavedQueryParser parser = new SavedQueryParser();
            relatedEntityListRenderer.Caller = this._caller;
            relatedEntityListRenderer.Template = template;
            //relatedEntityListRenderer.Columns = parser.ParseColumns(template, savedQuery.ColumnSetXml);
            relatedEntityListRenderer.Columns = parser.ParseColumns(template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.Render();

            tBody = relatedEntityListRenderer.TableHTML;
            // SavedQueryManager
        }
        EntityCollection GetEntities(Template template)
        {
            string lksrchUserName = Request["srch_UserId"];
            string lksrchStartDate = Request["srch_StartDate"];
            string lksrchEndDate = Request["srch_EndDate"];
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = 1;
            queryExp.PageInfo.Count = 100;

            ConditionExpression con = new ConditionExpression();
            if (string.IsNullOrEmpty(lksrchStartDate))
            {
                lksrchStartDate = DateTime.Now.ToString("yyyy-MM-01");
            }
            if (string.IsNullOrEmpty(lksrchEndDate))
            {
                lksrchEndDate = DateTime.Now.ToString("yyyy-M-d");
            }
            con.AttributeName = "CreatedOn";
            con.Operator = ConditionOperator.GreaterEqual;
            con.Values = new object[] { lksrchStartDate+" 00:00:00" };
            queryExp.Criteria.Add(con);

            // lksrchEndDate = DateTime.Now.ToString("yyyy-M-d");
            con = new ConditionExpression();
            con.AttributeName = "CreatedOn";
            con.Operator = ConditionOperator.LessEqual;
            con.Values = new object[] { lksrchEndDate + " 23:59:59" };
            queryExp.Criteria.Add(con);


            if (!string.IsNullOrEmpty(lksrchUserName))
            {
                con = new ConditionExpression();
                con.AttributeName = "FullName";
                con.Operator = ConditionOperator.Like;
                con.Values = new object[] { lksrchUserName };
                queryExp.Criteria.Add(con);
            }

            //else
            //{
            OrderExpression order = new OrderExpression();
            order.AttributeName = "CreatedOn";
            order.OrderType = OrderType.Descending;
            queryExp.Orders.Add(order);
            // }

            EntityCollection entities = EntityManager.GetEntities(_caller, template, queryExp);
            return entities;
        }
        public string InitJson
        {
            get { return _initJson; }
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string PageTitle
        {
            get { return pageTitle; }
        }
        public string DisplayFields { get; set; }
    }
}