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

namespace WebClient.apps
{
    public partial class FilterListPage : System.Web.UI.Page
    {
        private string entityTypeCode = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        CallContext _caller;
        int _typeCode = 2;
        int _pageSize = 10;
        string filterID = "";
        string _initJson = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private Template _template;

        protected void Page_Load(object sender, EventArgs e)
        {
            entityTypeCode = Request["t"];
            filterID= Request["fcf"];
            //GetEntityList();
            //RenderFilters();
            _caller = AppDataSource.GetCallContext();
            SystemAppTab tab = SystemAppTabs.GetTab(entityTypeCode);
            
            if (tab != null)
            {
                //tab.Name
                //if (tab.TemplateId != Guid.Empty)
                //{ }
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), entityTypeCode);
                if (_template != null)
                {
                    _typeCode = _template.ObjectTypeCode;
                    pageTitle = _template.Title;
                    this.EntityQueryListBlock1.TypeCode = _typeCode;
                }
                
                this._tabCss = tab.TabCss+"Tab";
                this.EntityQueryListBlock1.BlockCss = tab.TabCss;
            }

        }
        public void GetEntityList()
        {                        

            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller,new Guid(filterID));
            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();

            EntityCollection entities = SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);

            SavedQueryParser parser = new SavedQueryParser();
            relatedEntityListRenderer.Query = savedQuery;
            relatedEntityListRenderer.Template = savedQuery.Template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(savedQuery.Template, savedQuery.ColumnSetXml);
            relatedEntityListRenderer.Entities = entities;            
            relatedEntityListRenderer.Execute();
            _initJson = relatedEntityListRenderer.ToInitJson();
            
        }
        void RenderFilters()
        {
            List<SavedQuery> listOptions = SavedQueryManager.GetSavedQueries(_caller, TypeCode, 0);
            foreach (SavedQuery savedQuery in listOptions)
            {
                if (!string.IsNullOrEmpty(filterID))
                {
                    if (savedQuery.ID == new Guid(filterID))
                        _filterOptionHTML += string.Format("<option selected=\"selected\" value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                }
                else
                {
                    if (savedQuery.IsDefault)
                    {
                        _filterOptionHTML += string.Format("<option selected=\"selected\" value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                        if (string.IsNullOrEmpty(filterID))
                            filterID = savedQuery.ID.ToString();
                    }
                    else
                    {
                        _filterOptionHTML += string.Format("<option value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                    }
                }
            }
        }
        public string InitJson
        {
            get { return _initJson; }
        }
        public string PageTitle
        {
            get { return pageTitle; }
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string Fcfs
        {
            get { return _filterOptionHTML; }
        }
        public string QueryId
        {
            get { return this.filterID; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }
        public string TabCss
        {
            get { return _tabCss; }
        }
    }
}