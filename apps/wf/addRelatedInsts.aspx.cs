using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using Supermore;
using Supermore.Queries;
using Supermore.Data.Query;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Data;
using OptimaJet.Workflow;


namespace WebClient.apps.wf
{
    public partial class addRelatedInsts : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["go"] != null)
            {
                caller = AppDataSource.GetCallContext();

                GetList();
            }
            if (Request["ins"] =="1")
            {
                AddInstance();
            }
        }
        public void AddInstance()
        { 
           
            string instanceid=Request["instanceid"];
            string str=Request["invtee"];
            if (string.IsNullOrEmpty(str))
                return;
            string[] invtee = str.Split(',');
            caller = AppDataSource.GetCallContext();
            foreach (string str2 in invtee)
            {
                if (!string.IsNullOrEmpty(str2))
                {
                    WfInstanceManager.AddRelatedInstance(caller, new Guid(instanceid), new Guid(str2));
                }
            }
        }
        public void GetList()
        {
            this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("instanceid",Request["instanceid"]);
            string srch = Request["srch"];
            string createdBy = Request["ApplyUserId_lkid"];
            srch = MainUtil2.FilterInjectSql(srch);
            QueryExpression queryExp = new QueryExpression();
            ConditionExpression cond = new ConditionExpression();
            /*
            cond = new ConditionExpression();
            cond.AttributeName = "CreatedBy";
            cond.Operator = ConditionOperator.Equal;
            cond.Values = new object[] { caller.UserID };
            queryExp.Criteria.Add(cond);
            */
            
            int mode = 2;
            string _retURL = HttpUtility.UrlEncode(Request.RawUrl);
            StringBuilder sb = new StringBuilder();
            int sortNumber = 1;
            string sql = "";
            
            if (string.IsNullOrEmpty(createdBy))
            {
                createdBy = caller.UserID;
            }

            if (!string.IsNullOrEmpty(srch))
            {
                /*
                string sql = @"select DISTINCT a.ProcessInstanceId,a.Name,a.CreatedOn from WFProcessInstance a JOIN dbo.WFRuleLog b
                                        ON a.ProcessInstanceId = b.ProcessInstanceId 
                                        WHERE b.ExecutorIdentityId ='{0}' AND a.Name like '%{1}%' And b.StateCode=2 And b.SourceDirect=2";
                sql = string.Format(sql, caller.UserID, srch);
                */
                sql = @"select DISTINCT a.ProcessInstanceId,a.Name,a.CreatedOn,a.CreatedBy,p.Name As ProcessIdName,u.FullName CreatedByName from WFProcessInstance a 
                                        JOIN WFProcess p  ON a.ProcessId = p.ProcessId                                        
                                        LEFT JOIN SystemUserBase u ON a.CreatedBy = u.SystemUserId
                                        WHERE (a.CreatedBy='{0}') AND a.Name like '%{1}%' And (a.StateCode=1 OR a.StateCode=3 OR a.StateCode=4) ORDER BY a.CreatedON DESC";
                sql = string.Format(sql, createdBy, srch);

                DataSet ds = AppDataSource.GetDataSet(this.caller, sql, null);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string tRow = "";
                    tRow += RenderStartRow(mode);

                    string processInstanceId = StringUtil.GetString(dr["ProcessInstanceId"]);
                    string name = StringUtil.GetString(dr["Name"]);
                    string createdOn = StringUtil.GetString(dr["CreatedOn"]);
                    string createdByName = "";
                    createdByName = StringUtil.GetString(dr["CreatedByName"]);
                    string processName = StringUtil.GetString(dr["ProcessIdName"]);

                    tRow += string.Format("<td class='actionColumn'><input class=\"actionLink\" id=\"{0}\" name=\"invtee\" title=\"选择 {1}\" type=\"checkbox\" value=\"{0}\" /></td>", processInstanceId, name);
                    //name
                    tRow += string.Format(" <td class=\" zen-deemphasize\"><a href='/122/detail?source=i&id={0}' target=\"_blank\">{1}</a></td>", processInstanceId, name);
                    tRow += string.Format(" <td class=\" zen-deemphasize\">{0}</td>", processName);
                    tRow += string.Format(" <td class=\"dataCell\">{0}</td>", createdByName);
                    tRow += string.Format(" <td class=\" zen-deemphasize\">{0}</td>", createdOn);
                    sb.Append(tRow);
                    sb.Append("</tr>");
                }
            }
            else
            {
                /*
                if (!string.IsNullOrEmpty(srch))
                {
                    cond.AttributeName = "Name";
                    cond.Operator = ConditionOperator.Contains;
                    cond.Values = new object[] { srch };
                    queryExp.Criteria.Add(cond);
                }
                if (!string.IsNullOrEmpty(createdBy))
                {
                    cond = new ConditionExpression();
                    cond.AttributeName = "CreatedBy";
                    cond.Operator = ConditionOperator.Equal;
                    cond.Values = new object[] { createdBy };
                    queryExp.Criteria.Add(cond);
                }
                queryExp.AddOrder("CreatedOn", OrderType.Descending);
                Template template = TemplateManager.GetTemplate(caller.OrganizationId, ObjectTypeCodes.WFProcessInstance);
                EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
                */
                sql = @"select a.ProcessInstanceId,a.Name,a.CreatedOn,a.CreatedBy,p.Name As ProcessIdName,u.FullName CreatedByName from WFProcessInstance a 
                                        JOIN WFProcess p  ON a.ProcessId = p.ProcessId                                        
                                        LEFT JOIN SystemUserBase u ON a.CreatedBy = u.SystemUserId
                                        WHERE (a.CreatedBy='{0}') AND a.Name like '%{1}%' And (a.StateCode=1 OR a.StateCode=4 OR a.StateCode=3) ORDER BY a.CreatedON DESC";
                sql = string.Format(sql, createdBy, srch);
               
                //foreach (Entity entity in entities)
                 DataSet ds = AppDataSource.GetDataSet(this.caller, sql, null);
                 foreach (DataRow entity in ds.Tables[0].Rows)
                {
                    // Entity entity = question.InnerEntity;
                    string tRow = "";
                    tRow += RenderStartRow(mode);
                    //int stateCode = MainUtil.GetInt(entity.Fields["QuestionType"].Value, 0);
                    string id = StringUtil.GetString(entity["ProcessInstanceId"]);
                    string name = StringUtil.GetString(entity["Name"]);
                    string createdOn = StringUtil.GetString(entity["CreatedOn"]);
                    string createdByName = StringUtil.GetString(entity["CreatedByName"]);
                    //string required = "必填";
                    //string deleteURL = string.Format("/setup/own/deleteredirect.aspx?delID={0}&type={1}&retURL={2}", entity.ID, ObjectTypeCodes.SurveyQuestion, _retURL);
                    //tRow += string.Format("<td  class=\" actionColumn  \"><a title=\"删除\" class=\"actionLink\" onclick=\"return confirmDelete();\" href=\"{2}\">删除</a> | <a title=\"上移\" class=\"actionLink\" href=\"javascript:sortQuestion('{0}',{1},'-1')\">上移</a> | <a title=\"下移\" class=\"actionLink\" href=\"javascript:sortQuestion('{0}',{1},'1')\">下移</a></td>", entity.ID, sortNumber, deleteURL);
                    tRow += string.Format("<td class='actionColumn'><input class=\"actionLink\" id=\"{0}\" name=\"invtee\" title=\"选择 {1}\" type=\"checkbox\" value=\"{0}\" /></td>",id, name);
                    //name
                    tRow += string.Format(" <td class=\" zen-deemphasize\"><a href='/122/detail?source=i&id={0}' target=\"_blank\">{1}</a></td>",id, name);
                    tRow += string.Format(" <td class=\"dataCell\">{0}</td>", "");
                    //string createdByName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
                    tRow += string.Format(" <td class=\"dataCell\">{0}</td>", createdByName);
                    tRow += string.Format(" <td class=\" zen-deemphasize\">{0}</td>", createdOn);
                    //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ExecutorIdentityName"].Value));
                    //tRow += string.Format(" <td class=\" zen-deemphasize\">{0}</td>", required);
                    sb.Append(tRow);
                    sb.Append("</tr>");

                    mode++;
                    sortNumber++;
                }
            }
            SearchGridHTML = sb.ToString();
        }

        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }

        public string SearchGridHTML { get; set; }
    }
}