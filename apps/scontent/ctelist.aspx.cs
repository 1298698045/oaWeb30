using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore.Contents;
using Supermore.EntityFramework.Entities;
using Supermore;
using Supermore.Data;
using System.Text;
using OA.Web.UI.WebControls;
using Supermore.EntityFramework.Templates;
using Supermore.Data.Query;

namespace WebClient.apps.scontent
{
    public partial class ctelist : System.Web.UI.Page
    {
        CallContext _caller = null;
        string strId = "";
        int typeCode = 100201;
        string _id = "";
        string tabCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            _id = Request["id"];
            tabCode = Request["t"];

            GetCategories();
            GetLinks();
        }

        void GetCategories()
        {
            StringBuilder sb = new StringBuilder();
            //string sele = "";
            EntityCollection entities = ItemTreeManager.GetFolders(_caller, typeCode);
            //ItemTree selItem = ItemTreeManager.GetCategoryItem(_caller, new Guid(_id));
            //if (selItem != null)
            //{
            //    sb.AppendFormat("<li onclick=\"\"><a class=\"wchannel-item active\" href=\"/apps/scontent/ctelist.aspx?t={2}&id={0}\" target=''><span>{1}</span> </a></li>", selItem.FolderId, selItem.Name, tabCode);
            //}
            foreach (Entity entity in entities)
            {
                //if (selItem.ItemId == entity.ID)
                //    continue;
                if (string.Compare(_id, entity.ID.ToString(), true) == 0)
                    sb.AppendFormat("<li onclick=\"\"><a class=\"wchannel-item active\" href=\"/apps/scontent/ctelist.aspx?t={2}&id={0}\" target=''><span>{1}</span> </a></li>", entity.ID, entity.Name, tabCode);
                else
                    sb.AppendFormat("<li onclick=\"\"><a class=\"wchannel-item \" href=\"/apps/scontent/ctelist.aspx?t={2}&id={0}\" target=''><span>{1}</span> </a></li>", entity.ID, entity.Name, tabCode);

                //    _options += string.Format("<option value='{0}'>{1}</option>", entity.ID.ToString().ToLower(), entity.Name);
            }
            Categories = sb.ToString();
            GetList();
        }
        EntityCollection entities = null;
        Template _template = null;
        void GetDataList()
        {
            int pageSize = 25;
            int pageNumber = MainUtil.GetInt(Request["page"], 1);
            //objectTypeCode = MainUtil.GetInt(Request["contentTypeCode"], 1);
            QueryExpression queryExp = new QueryExpression();
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = pageNumber;
            queryExp.PageInfo.Count = pageSize;

            ConditionExpression conditionExpression = new ConditionExpression();
            conditionExpression.AttributeName = "StateCode";
            conditionExpression.Operator = ConditionOperator.Equal;
            conditionExpression.Values = new object[] { 1 };
            conditionExpression.DataType = AttributeDataType.Number;
            queryExp.Criteria.Add(conditionExpression);

            if (!string.IsNullOrEmpty(_id))
            {
                conditionExpression = new ConditionExpression();
                conditionExpression.AttributeName = "FolderId";
                conditionExpression.Operator = ConditionOperator.Equal;
                conditionExpression.Values = new object[] { _id };
                //conditionExpression.DataType = AttributeDataType.Number;
                queryExp.Criteria.Add(conditionExpression);
            }
            queryExp.AddOrder("CreatedOn", OrderType.Descending);

            _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), ObjectTypeCodes.Content);
            entities = EntityManager.GetEntities(_caller, _template, queryExp);
        }
        void GetList()
        {
            StringBuilder sb = new StringBuilder();
            //entities = ContentManager.GetFolderContents(_caller, new Guid(_id));
            GetDataList();
            foreach (Entity entity in entities)
            {
                if (_template == null)
                    _template = entity.Template; ;
                EntityFieldRenderFormPageTemplate pageRender = new EntityFieldRenderFormPageTemplate();
                pageRender.Template = _template;
                pageRender.Entity = entity;
                pageRender.Caller = _caller;
                pageRender.PageTemplateVirtualPath = "~/App_Data/PageTemplates/content/ContentListItem.htm";
                pageRender.Render();
                sb.Append(pageRender.ResultHTML);
            }
            HTMLResult = sb.ToString();
        }
        void GetLinks()
        {
            try
            {
                //QuickLinkBlock quickLinkBlock = new QuickLinkBlock();
                //quickLinkBlock.Caller = _caller;
                //quickLinkBlock.Render();
                //this.HTMLQuickLink = quickLinkBlock.HTMLResult;

                EntityCollection col = null;
                QueryExpression queryExp = new QueryExpression();
                queryExp.IsPaged = false;
                queryExp.PageInfo.PageSize = 20;
                OrderExpression order = new OrderExpression();
                order.AttributeName = "ClickCount";
                order.OrderType = OrderType.Descending;
                queryExp.Orders.Add(order);

                entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.QuickLink, queryExp);
                 StringBuilder sb = new StringBuilder();
                foreach (Entity entity in entities)
                {
                    sb.AppendFormat(" <li class=\"item\"><a target=\"_blank\" href=\"{0}\">{1}</a></li>",entity.Fields["LinkUrl"].Value,entity.Fields["Name"].Value);
                }
               HTMLQuickLink = sb.ToString();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        public string Categories { get; set; }
        public string HTMLResult { get; set; }
        public string HTMLQuickLink { get; set; }
        public string PageTitle { get; set; }
    }
}