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
//using Supermore.ELearning;

namespace WebClient.apps
{
    public partial class addSelectItemTo : System.Web.UI.Page
    {
        private string tBody = "";
        private string _filterOptionHTML = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 2;
        private int _pageSize = 50;
        private Template _template;
        private string _initJson = "";
        private string entityType = "";
        private string _templateCode = "";
        private string _tmeplateId = "";
        private int objectType = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                SystemAppTab tab = SystemAppTabs.GetTab(entityType);
                if (tab != null)
                {
                    this._tabCss = tab.TabCss + "Tab";
                   // _template = TemplateManager.GetTemplate(_caller.OrganizationId, entityType);
                }
                objectType = MainUtil.GetInt(Request["objectType"], 8);
                _template = TemplateManager.GetTemplate(_caller.OrganizationId, objectType);
                
                if (_template != null)
                {
                    this._templateCode = entityType;
                    _typeCode = _template.ObjectTypeCode;
                    pageTitle = _template.Title;
                    this._fType = _template.ID.ToString();
                }

                GetEntityList();
                GetSearchFilter();
            }
           
            string strid = Request["addTo"];
            int addObjectTypeTo = MainUtil.GetInt(Request["addObjectTypeTo"], 0);
            this.AddToTitle = EntityManager.GetEntityName(_caller, addObjectTypeTo, new Guid(strid));
            if (addObjectTypeTo == ObjectTypeCodes.Meeting)
            {
                this.ActionURL = "/apps/meetings/addmultilineitemtoMeeting.aspx";
            }
            else if (addObjectTypeTo == ObjectTypeCodes.Survey)
            {
                this.ActionURL = "/survey/addmultilineitemtoSvy.aspx"; 
            }
            else if (addObjectTypeTo == HRObjectTypeCodes.PerformanceEvaluationObject)
            {
                this.ActionURL = "/perform/addmultilineitemtoObj.aspx?addObjectTypeTo=" + addObjectTypeTo;
            }
            else if (addObjectTypeTo == HRObjectTypeCodes.PerformanceEvaluationAudience)
            {
                this.ActionURL = "/perform/addmultilineitemtoObj.aspx?addObjectTypeTo=" + addObjectTypeTo;
            }
            //else if (addObjectTypeTo == ELearningObjectTypeCodes.ELExaminationPaperAudience)
            //{
            //    this.ActionURL = "/elg/addmultilineitem.aspx?addObjectTypeTo=" + addObjectTypeTo;
            //}
            else if (addObjectTypeTo == ObjectTypeCodes.Notice || addObjectTypeTo == ObjectTypeCodes.Content)
            {
                this.ActionURL = "/apps/scontent/addmultilineitemtoContent.aspx";
            }
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
            queryExp.AddOrder("ModifiedOn", OrderType.Descending);

            GridSort gSort = new GridSort();
            gSort.Field = "ModifiedOn";
            gSort.Direction = SortDirect.DESC;
            List<GridSort> gSorts = new List<GridSort>();
            gSorts.Add(gSort);

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
            relatedEntityListRenderer.EnableFieldOpenLink = false;
            relatedEntityListRenderer.Columns = parser.ParseColumns(_template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.Sorts = gSorts;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = _pageSize;
            relatedEntityListRenderer.CurrentPage = 1;
            relatedEntityListRenderer.Execute();
            //_initJson = relatedEntityListRenderer.ToInitJson();
            string dataJson = relatedEntityListRenderer.ToJson();
            dataJson = dataJson.Substring(10);
            string queryURL = "/_ui/entity/SearchEntityListServlet?actionCol=no&showAction=0&templateid=" + _tmeplateId;
            // string docIn = "/_ui/busop/docinitem/DocInItemListServlet";
            _initJson = "new LineItemListViewport('lineItemView', 'PricebookEntry'," + dataJson + ", '80190000000PJyk', '" + queryURL + "');";

            GetSearchFilter();
        }
        void GetSearchFilter()
        {
            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchFilterLayout(_caller, _template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);

            this.DisplayFields = DisplayColumnNames;
            string[] cols = DisplayColumnNames.Split(',');

            SearchFilterLayout filterRender = new SearchFilterLayout();
            filterRender.Template = this._template;
            filterRender.SearchFilterFields = this.DisplayFields;
            filterRender.Caller = _caller;
            filterRender.Render();
            SearchFilterHTML = filterRender.SearchFilterHTML;

        }
              
        /// <summary>
        /// 查询字段
        /// </summary>
        public string SearchFilterHTML { get; set; }
        public string SearchLineHTML { get; set; }
        /// <summary>
        /// 初始js
        /// </summary>
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
        /// <summary>
        /// 添加到对象
        /// </summary>
        public string AddToTitle { get; set; }
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

        public int ObjectTypeCode { get { return objectType; } }

        public string DisplayFields { get; set; }

        public string ActionURL { get; set; }
    }
}