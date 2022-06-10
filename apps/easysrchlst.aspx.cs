using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.GridBuilder;
using OA.Web.UI;
using OA.Web.UI.FieldControls;
using OA.Web.UI.WebControls;

namespace WebClient.apps
{
    public partial class easysrchlst : System.Web.UI.Page
    {
        private string tBody = "";
        private string _filterOptionHTML = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 2;
        private int _pageSize = 25;
        private Template _template;
        private string _initJson = "";
        private string entityType = "";
        private string tabName = "";
        private string _templateCode = "";
        private string _tmeplateId = "";
        string _configFile = "";
        SqlQueryListJsonRender relatedEntityListRenderer = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            _configFile = Request["configFile"];
            tabName = Request["t"];
            entityType = Request["entityCode"];
            SystemAppTab tab = SystemAppTabs.GetTab(entityType);
            if (tab != null)
            {
                this._tabCss = tab.TabCss + "Tab";
            }
            else
            {
                this._tabCss = "homeTab";
                _templateCode = entityType;
            }

            GetTemplate(entityType);

            GetEntityList();
            //RenderFilters();

        }
        void GetTemplate(string entityCode)
        {
            _template = TemplateManager.GetTemplate(_caller.OrganizationId, entityCode);
            if (_template != null)
            {
                this._templateCode = entityCode;
                _typeCode = _template.ObjectTypeCode;
                pageTitle = _template.Title;
                this._fType = _template.ID.ToString();
            }
        }
        public void GetEntityList()
        {
            //EntityCollection entities = null;
            string retURL = this.Request.RawUrl;
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            if (_template == null)
                _template = TemplateManager.GetTemplate(_caller.OrganizationId, _templateCode);
            if (string.IsNullOrEmpty(pageTitle) && _template != null)
            {
                pageTitle = _template.Title;
                _typeCode = _template.ObjectTypeCode;
            }
            //SavedQueryParser parser = new SavedQueryParser();
            //QueryExpression queryExp = new QueryExpression();
            //queryExp.IsPaged = true;
            //queryExp.PageInfo.PageNumber = 1;
            //queryExp.PageInfo.PageSize = _pageSize;

            //queryExp.AddOrder("ModifiedOn", OrderType.Descending);

            //GridSort gSort = new GridSort();
            //gSort.SortField = "ModifiedOn";
            //gSort.Direction = SortDirect.DESC;
            //List<GridSort> gSorts = new List<GridSort>();
            //gSorts.Add(gSort);

            //Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, _template.ID);
            //string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            //this.DisplayFields = DisplayColumnNames;
            //string[] cols = DisplayColumnNames.Split(',');
            //queryExp.ColumnSet.AddColumn(_template.PKField.Name);
            //foreach (string c in cols)
            //    queryExp.ColumnSet.AddColumn(c);

            int total = 0;
            //entities = EntityManager.GetEntities(_caller, _template, queryExp);
            //int total = SavedQueryManager.Count(_caller, _template, queryExp);
            if (_template != null)
            {
                _tmeplateId = this._template.ID.ToString();
            }
            relatedEntityListRenderer = new SqlQueryListJsonRender();
            relatedEntityListRenderer.ConfigFile = _configFile;
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.ShowActionColumn = true;
            relatedEntityListRenderer.ShowEntityButtons = true;
            relatedEntityListRenderer.LinkOpenBlank = true;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = _pageSize;
            relatedEntityListRenderer.CurrentPage = 1;
            relatedEntityListRenderer.Execute();
            //_initJson = relatedEntityListRenderer.ToInitJson();
            string dataJson = relatedEntityListRenderer.ToJson();
            dataJson = dataJson.Substring(10);
            string queryURL = string.Format("/_ui/common/list/SqlListServlet?showAction=0&templateid={0}&filterId={1}&configFile=" + _configFile, _tmeplateId, "");
            // string docIn = "/_ui/busop/docinitem/DocInItemListServlet";
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '" + queryURL + "');";
            this.pageTitle = relatedEntityListRenderer.Title;
            GetSearchFilter();
        }
        void GetSearchFilter()
        {
            SearchFilterLayout filterRender = new SearchFilterLayout();
            filterRender.Caller = _caller;
            filterRender.RenderSearchFilterControl(relatedEntityListRenderer.SearchParameters);
            SearchFilterHTML = filterRender.SearchFilterHTML;
            /*
            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchFilterLayout(_caller, _template.ID);
            string displayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = displayColumnNames.Split(',');

           
            filterRender.Template = this._template;
            filterRender.SearchFilterFields = displayColumnNames;
            filterRender.Caller = _caller;
            filterRender.Render();
            SearchFilterHTML = filterRender.SearchFilterHTML;
            
            //显示列
            layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, _template.ID);
            displayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            this.DisplayFields = displayColumnNames;
            */

        }

        #region old

        EntityCollection GetEntities(Template template)
        {
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = false;
            queryExp.PageInfo.Count = 15;
            //if (!string.IsNullOrEmpty(lksrch))
            //{
            //    ConditionExpression con = new ConditionExpression();
            //    con.AttributeName = template.NameField;
            //    con.Operator = ConditionOperator.Like;
            //    con.Values = new object[] { lksrch };
            //    queryExp.Criteria.Add(con);

            //    OrderExpression order = new OrderExpression();
            //    order.AttributeName = template.NameField;
            //    order.OrderType = OrderType.Ascending;
            //    queryExp.Orders.Add(order);
            //}
            //else
            {
                OrderExpression order = new OrderExpression();
                order.AttributeName = "CreatedOn";
                order.OrderType = OrderType.Descending;
                queryExp.Orders.Add(order);
            }

            EntityCollection entities = EntityManager.GetEntities(_caller, template, queryExp);
            return entities;
        }
        void RenderFilters()
        {
            List<SavedQuery> listOptions = SavedQueryManager.GetSavedQueries(_caller, TypeCode, 0);
            foreach (SavedQuery savedQuery in listOptions)
            {
                if (savedQuery.IsDefault)
                {
                    _filterOptionHTML += string.Format("<option selected=\"selected\" value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                    // if (string.IsNullOrEmpty(filterID))
                    //     filterID = savedQuery.ID.ToString();
                    this.DefaultFilterId = savedQuery.ID.ToString();
                }
                else
                {
                    _filterOptionHTML += string.Format("<option value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                }
            }
        }
        #endregion

        public string SearchFilterHTML { get; set; }
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
        public string Fcfs
        {
            get { return _filterOptionHTML; }
        }
        public string DefaultFilterId { get; set; }
        public string TabCss
        {
            get { return _tabCss; }
        }
        public string EntityCode
        {
            get { return entityType; }
        }
        string _fType = "";
        public string FType
        {
            get { return _fType; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }
        public string DisplayFields { get; set; }
    }
}