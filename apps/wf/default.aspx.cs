using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.Data.Query;


namespace WebClient.apps.wf
{
    public partial class _default : System.Web.UI.Page
    {
        private string entityType = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        CallContext _caller;
        int _typeCode = 121;
        int _pageSize = 10;
        EntityCollection entities = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                _caller = AppDataSource.GetCallContext();
                GetEntityList();
                RenderFilters();
            }
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
        public void GetEntityList1(Template template)
        {

           

            SavedQuery savedQuery = SavedQueryManager.GetDefaultQuery(_caller, this.TypeCode);
            RelatedEntityListRenderer relatedEntityListRenderer = new RelatedEntityListRenderer();
            relatedEntityListRenderer.ShowActionColumn = false;
            relatedEntityListRenderer.RetURL = this.Request.RawUrl;
            // entities = SavedQueryManager.GetEntityies(_caller, savedQuery, _pageSize, 1, null);
            entities = GetEntities(template);
            SavedQueryParser parser = new SavedQueryParser();
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.Template = savedQuery.Template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(savedQuery.Template, savedQuery.ColumnSetXml);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.Render();

            tBody = relatedEntityListRenderer.TableHTML;
            // SavedQueryManager
        }
        EntityCollection GetEntities(Template template)
        {
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = false;
            queryExp.PageInfo.Count = 25;
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
            //{
            OrderExpression order = new OrderExpression();
            order.AttributeName = "ModifiedOn";
            order.OrderType = OrderType.Descending;
            queryExp.Orders.Add(order);
            //}

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
                }
                else
                {
                    _filterOptionHTML += string.Format("<option value=\"{0}\">{1}</option>", savedQuery.ID.ToString(), savedQuery.Name);
                }
            }
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string Fcfs
        {
            get { return _filterOptionHTML; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }
    }
}