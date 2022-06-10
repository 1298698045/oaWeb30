using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using Supermore.GridBuilder;
using OA.Web.UI;
using OA.Web.UI.WebControls;


namespace WebClient.apps
{
    public partial class filterFieldQuery : System.Web.UI.Page
    {
        CallContext _caller;
        int _pageSize = 25;
        string _initJson = "";
        Template _template = null;
        string _templateCode = "";
        private string _tabCss = " campaignTab ";
        int _objectTypeCode = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            GetEntityList();
            GetSearchFilter();
            //  <cc1:SrchLineControl runat="server" id="SrchLineControl1" EntityCode="a0V"/>
            //SrchLineControl srchLineControl = new SrchLineControl();
            //srchLineControl.Template = _template;
            //srchLineControl.Render();
            //SearchLineHTML = srchLineControl.OutHTML;
        }
        void GetSearchFilter()
        {
            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchFilterLayout(_caller, _template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);

            this.DisplayFields = DisplayColumnNames;
            string[] cols = DisplayColumnNames.Split(',');

            SearchFilterLayout filterRender = new SearchFilterLayout();
            filterRender.Template = this._template;
            filterRender.Caller = _caller;
            filterRender.SearchFilterFields = this.DisplayFields;
            filterRender.Render();
            SearchFilterHTML = filterRender.SearchFilterHTML;

        }
        public void GetEntityList()
        {
            string filterID = Request["id"];

            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            _template = savedQuery.Template;
            EntityCollection entities = null;
            string retURL = this.Request.RawUrl;
            this.pageTitle = this._template.Title;
            _objectTypeCode = this._template.ObjectTypeCode;
            this.SubTitle = savedQuery.Name;
            SavedQueryParser parser = new SavedQueryParser();


            entities = SavedQueryManager.GetEntityies(_caller, savedQuery, 25, 1, null);
            // _template = savedQuery.Template;
            int total = SavedQueryManager.Count(_caller, savedQuery, null);

            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Query = savedQuery;
            relatedEntityListRenderer.Template = _template;
            relatedEntityListRenderer.ShowActionColumn = true;
            //relatedEntityListRenderer.ShowEntityButtons = false;
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
        public string TabCss
        {
            get { return _tabCss; }
        }
        public string InitJson
        {
            get { return _initJson; }
        }
        string pageTitle = "";
        public string PageTitle
        {
            get { return pageTitle; }
        }
        /// <summary>
        /// 添加到对象
        /// </summary>
        public string SubTitle { get; set; }
        public string SearchLineHTML { get; set; }
        /// <summary>
        /// 查询字段
        /// </summary>
        public string SearchFilterHTML { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string DisplayFields { get; set; }

        public int ObjectTypeCode { set { _objectTypeCode = value; } get { return _objectTypeCode; } }
    }
}