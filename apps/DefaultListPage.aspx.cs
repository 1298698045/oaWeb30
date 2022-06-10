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
using Supermore.IO;

namespace WebClient.apps
{
    public partial class DefaultListPage : System.Web.UI.Page
    {
        private string entityType = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 2;
        private int _pageSize = 10;
        Template _template;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            // if (!Page.IsPostBack)
            // { }
            entityType = Request["t"];
            SystemAppTab tab = SystemAppTabs.GetTab(entityType);
            if (tab != null)
            {
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), entityType);
                if (_template == null)
                {
                    if (tab.TemplateId != Guid.Empty)
                    {
                        _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), tab.TemplateId);
                    }
                }
                if (_template != null)
                {
                    _typeCode = _template.ObjectTypeCode;
                    pageTitle = _template.Title;
                    this._fType = _template.ID.ToString();
                }
                this._tabCss = tab.TabCss + "Tab"; ;
            }
            //Session[""] = "";
            //System.Web.sess
            GetEntityList();
            RenderFilters();

            RenderFootLink();
        }

        public void GetEntityList()
        {
            Template template = null;
            EntityCollection entities = null;

            template = TemplateManager.GetTemplate(_caller.OrganizationId, this.TypeCode);

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
        EntityCollection  GetEntities(Template template)
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
                order.AttributeName = "ModifiedOn";
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

        void RenderFootLink()
        {
            string path = "/App_Data/PageTemplates/defaultListFooter/{0}.htm";
            path = string.Format(path, entityType);
            string realPath = Server.MapPath(path);
            if (FileUtil.Exists(realPath))
                _footBlock = FileUtil.ReadFromFile(path);
        }
        string _footBlock = "";
        public string BodyText
        {
            get { return tBody; }
        }
        public string FootBlock
        {
            get { return _footBlock; }
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
    }
}