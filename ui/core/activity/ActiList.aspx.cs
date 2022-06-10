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

namespace WebClient.ui.core.activity
{
    public partial class ActiList : System.Web.UI.Page
    {
        private string entityTypeCode = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        CallContext _caller;
        int _typeCode = 4200;
        int _pageSize = 10;
        string filterID = "";
        string _initJson = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            entityTypeCode = Request["t"];
            filterID = Request["fcf"];
            _caller = AppDataSource.GetCallContext();
            //GetEntityList();
            RenderFilters();
        }
        public void GetEntityList()
        {

            

            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();

            EntityCollection entities = SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);

            SavedQueryParser parser = new SavedQueryParser();
            relatedEntityListRenderer.Query = savedQuery;
            relatedEntityListRenderer.Template = savedQuery.Template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(savedQuery.Template, savedQuery.ColumnSetXml);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.Execute();
            _initJson = relatedEntityListRenderer.ToInitJson();
            // SavedQueryManager
        }
        void RenderFilters()
        {
            List<SavedQuery> listOptions = SavedQueryManager.GetSavedQueries(_caller, TypeCode, 0);
            foreach (SavedQuery savedQuery in listOptions)
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
        public string InitJson
        {
            get { return _initJson; }
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
    }
}