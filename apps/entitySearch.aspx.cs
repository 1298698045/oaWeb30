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
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.EntityFramework.Entities;
using OA.Web.UI;
using OA.Web.UI.WebControls;
namespace WebClient.apps
{
    public partial class entitySearch : System.Web.UI.Page
    {
        CallContext _caller;
        int _pageSize = 25;
        string _initJson = "";
        Template _template = null;
        string _templateCode = "";
        string _tmeplateId = "";
        private string _tabCss = "";
        private string pageTitle = "";
        private int _typeCode = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            _templateCode = Request["t"];
            _caller = AppDataSource.GetCallContext();
            _tmeplateId = Request["templateId"];
            //if (_templateCode == "docinSrch")
            //{
            //    _templateCode = "A08";
            //}
            //if (_templateCode == "docoutSrch")
            //{
            //    _templateCode = "A09";
            //}
            //SystemAppTab tab = SystemAppTabs.GetTab(_templateCode);
            //if (tab != null)
            //{
            //    if (tab.TemplateId != Guid.Empty)
            //    {
            //        _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), tab.TemplateId);
            //        if (_template != null)
            //        {
            //            _typeCode = _template.ObjectTypeCode;
            //            pageTitle = _template.Title;
            //        }
            //    }
            //    this._tabCss = tab.TabCss + "Tab"; ;
            //}
            _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), new Guid(_tmeplateId));
            if (_template != null)
            {
                _typeCode = _template.ObjectTypeCode;
                pageTitle = _template.Title;
            }

            GetEntityList();
            //  <cc1:SrchLineControl runat="server" id="SrchLineControl1" EntityCode="a0V"/>
            SrchLineControl srchLineControl = new SrchLineControl();
            srchLineControl.Template = _template;
            srchLineControl.Render();
            SearchLineHTML = srchLineControl.OutHTML;
        }
        public void GetEntityList()
        {
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
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            //savedQuery.
            // SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);
            queryExp.AddOrder("CreatedOn", OrderType.Descending);

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
        public string InitJson
        {
            get { return _initJson; }
        }
        public string SearchLineHTML { get; set; }

        public string PageTitle
        {
            get { return pageTitle; }
        }
        public string TabCss
        {
            get { return _tabCss; }
        }

        public string DisplayFields { get; set; }
        public int TypeCode { get { return _typeCode; } set { _typeCode = value; } }
    }
}