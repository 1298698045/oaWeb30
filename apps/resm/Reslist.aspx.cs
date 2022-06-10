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

namespace WebClient.apps.resm
{
    public partial class Reslist : System.Web.UI.Page
    {
        private string entityType = "";
        private string tBody = "";
       // private string _filterOptionHTML = "";
        private string pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 2;
        private int _pageSize = 10;
        Template _template;
        private string rType = "1";

        protected void Page_Load(object sender, EventArgs e)
        {
            rType = Request["rType"];
            _caller = AppDataSource.GetCallContext();
            if (!Page.IsPostBack)
            {
                entityType = Request["t"];
                
                if (rType == "1")
                {
                    this.pageTitle = "车辆";
                }
                if (rType == "2")
                {
                    this.pageTitle = "会议室";
                }
                //GetEntityList();
               
            }
        }
        public void GetEntityList()
        {
            Template template = null;
            EntityCollection entities = null;

            template = TemplateManager.GetTemplate(_caller.OrganizationId, EntityTemplateIDs.Resource);

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
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = false;
            //queryExp.PageInfo.Count = 15;
            //if (!string.IsNullOrEmpty(lksrch))
            //{
            ConditionExpression con = new ConditionExpression();
            con.AttributeName = "ResourceTypeCode";
            con.Operator = ConditionOperator.Equal;
            con.DataType = AttributeDataType.Number;
            con.Values = new object[] { rType };
            queryExp.Criteria.Add(con);

            //    OrderExpression order = new OrderExpression();
            //    order.AttributeName = template.NameField;
            //    order.OrderType = OrderType.Ascending;
            //    queryExp.Orders.Add(order);
            //}
            //else
            {
                OrderExpression order = new OrderExpression();
                order.AttributeName = "Name";
                //order.OrderType = OrderType.Descending;
                queryExp.Orders.Add(order);
            }

            EntityCollection entities = EntityManager.GetEntities(_caller, template, queryExp);
            return entities;
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string PageTitle
        {
            get { return pageTitle; }
        }
    }
}