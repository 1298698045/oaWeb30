using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;

namespace WebClient._ui.common.data
{
    public partial class LookupMutiPicker : System.Web.UI.Page
    {
        string cnt = "";

        private string lktp = "10"; //查询的对象（Entity)
        private string lknm = ""; //目标字段（Control)
        private string lksrch = ""; //当前控件值（Control Value)
        private string lkfm = "editPage"; //当前表单（Form)
        private string entityID = "";
        //private string entityType = "FB7EB197-5E8C-4F05-9298-A8107F957B1B";
        private CallContext _caller;
        private int returnTypeCode = 0;
        EntityCollection entities = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //cnt = Request["cnt"];
            //int cnt1 = 1;
            lktp = Request["lktp"];
            lknm = Request["lknm"];
            lksrch = Request["lksrch"];
            lkfm = Request["lkfm"];
            _caller = AppDataSource.GetCallContext();
            //StringBuilder sb = new StringBuilder();
            ////for (int i = 0; i < cnt1; i++)
            //foreach(Entity entity in entities)
            //{
            //    //sb.AppendFormat("<li class=\"listItem{0}\"><a href=\"javascript:pickValue({0});\"><script type=\"text/javascript\">document.write(getPickValue({0}));</script></a></li>", i);
            //    sb.AppendFormat("<li class=\"listItem{0}\"><a href=\"javascript:pickValue({0});\"><script type=\"text/javascript\">document.write(getPickValue({0}));</script></a></li>", i);
            //    //int 
            //}
            RenderList();
            this.HTMLGrid = GetFieldPicklist();
        }
        string GetFieldPicklist()
        {
            int mode = 2;
            int iRow = 0;
            //EntityCollection entities = StringEnumManager.GetFieldPicklist(_caller, this.objectTypeCode, lookupField);
            StringBuilder sb = new StringBuilder();

            foreach (Entity entity in entities)
            {
                sb.Append(RenderStartRow(mode, iRow));
                string id = entity.ID.ToString();
                string name = StringUtil.GetString(entity.Fields["Name"].Value);
                sb.AppendFormat("<td class=\"actionColumn\"><input id=\"chkbox{0}\" name=\"chkbox{0}\" onclick=\"FilterLookupPage.prototype.doCheckbox({0});\" type=\"checkbox\" value=\"{1}\" title=\"{2}\"  />", iRow, id,name);

                sb.Append(" </td>");
                sb.AppendFormat("<td ><label for=\"chkbox{0}\">{1}</label></td>", iRow, name);

                sb.Append("</tr>");
                iRow++;
                mode++;
            }
            this.HTMLGrid = sb.ToString();
            return this.HTMLGrid;
        }
        string RenderStartRow(int mode, int iRow)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            if (iRow == 0)
                css += " first ";
            tRow = "<tr class=\" dataRow " + css + "\">";

            return tRow;
        }
        void RenderList()
        {

            SavedQuery savedQuery = null;

           

            //SavedQueryParser parser = new SavedQueryParser();

            //LookupEntityListRenderer listBockRender = new LookupEntityListRenderer();
            //listBockRender.SearchFieldControl = this.lknm;
            //listBockRender.SearchForm = this.lkfm;
            Template template = null;
            //list.QueryId 
            savedQuery = SavedQueryManager.GetSavedQueryByName(_caller, lktp);
            QueryExpression queryExp = null;
            if (savedQuery != null)
            {
                /*
                template = savedQuery.Template;
                listBockRender.Columns = parser.ParseColumns(template, savedQuery.ColumnSetXml);
                if (!string.IsNullOrEmpty(lksrch))
                {
                    queryExp = new QueryExpression();
                    ConditionExpression con = new ConditionExpression();
                    con.AttributeName = template.NameField;
                    con.Operator = ConditionOperator.Like;
                    con.Values = new object[] { lksrch };
                    queryExp.Criteria.Add(con);

                    OrderExpression order = new OrderExpression();
                    order.AttributeName = template.NameField;
                    order.OrderType = OrderType.Ascending;
                    queryExp.Orders.Add(order);
                }

                string sql = SavedQueryManager.GetSqlFromQuery(_caller, savedQuery, queryExp);
                entities = EntityManager.GetEntities(_caller, savedQuery.Template, sql);
                */
            }
            else
            {
                returnTypeCode = MainUtil.GetInt(lktp, 0);
                template = TemplateManager.GetTemplate(_caller.OrganizationId, returnTypeCode);
                queryExp = new QueryExpression();
                queryExp.IsPaged = false;
                queryExp.PageInfo.Count = 50;
                ConditionExpression con = new ConditionExpression();
                if (!string.IsNullOrEmpty(lksrch))
                {
                    
                    con.AttributeName = template.NameField;
                    con.Operator = ConditionOperator.Like;
                    con.Values = new object[] { lksrch };
                    queryExp.Criteria.Add(con);

                    OrderExpression order = new OrderExpression();
                    order.AttributeName = template.NameField;
                    order.OrderType = OrderType.Ascending;
                    queryExp.Orders.Add(order);
                }
                else
                {
                    OrderExpression order = new OrderExpression();
                    order.AttributeName = "CreatedOn";
                    order.OrderType = OrderType.Descending;
                    queryExp.Orders.Add(order);
                }

                if (returnTypeCode == 10)
                {
                    con = new ConditionExpression();
                    con.AttributeName ="IsDisabled";
                    con.Operator = ConditionOperator.Equal;
                    con.Values = new object[] { 0 };
                    queryExp.Criteria.Add(con);
                }

                entities = EntityManager.GetEntities(_caller, template, queryExp);
                //Entity layoutEntity = TemplateSearchLayoutManager.GetLookupLayout(_caller, template.ID);
                //string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
                //string[] cols = DisplayColumnNames.Split(',');
                //listBockRender.Columns = parser.ParseColumns(template, cols);
            }
            //listBockRender.Template = template;
            //listBockRender.Entities = entities;
            //listBockRender.Render();
            //output.Write(listBockRender.TableHTML);


        }


        public string HTMLGrid { get; set; }
    }
}