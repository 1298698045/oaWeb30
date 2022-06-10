using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;

using OptimaJet.Workflow.Core.Model;
using OptimaJet.Workflow;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework;
using Supermore.Workflow.Evaluation;
using Supermore.Data.Query;

namespace WebClient.apps.wf
{
    public partial class ProcRuleCondition : System.Web.UI.Page
    {
        string ruleid = "";
        string ruleCode = "";
        string processid = "";
        CallContext _caller;
        string _avaliableOptions = "";
        string _userName;
        EntityCollection entities = null;
        string strTemplateId = "";
        string fetchXml = "";
        string[] displayColumns = new string[] { };
        string _selectFields = "";
        StringBuilder sb = new StringBuilder();
        List<NodeExp> conds = new List<NodeExp>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["cancel"] != null)
                {
                    Response.Redirect(Request["retURL"], true);
                }
                ruleid = Request["ruleid"];
                _caller = AppDataSource.GetCallContext();
                if (string.IsNullOrEmpty(ruleid))
                {
                    ruleCode = Request["ruleCode"];
                    if (!string.IsNullOrEmpty(ruleCode))
                    {
                        string sql = string.Format("select RuleId from WFRule WHERE RuleCode='{0}'", ruleCode);
                        ruleid = DatabaseTool.GetFirstCellStr(_caller.CustomerID, sql, "");
                    }
                }

                processid = Request["processid"];
                _userName = _caller.UserName;

                if (!string.IsNullOrEmpty(ruleid))
                {
                    string sql = string.Format("select Name from WFRule WHERE RuleId='{0}'", ruleid);
                    this.QueryName = DatabaseTool.GetFirstCellStr(_caller.CustomerID, sql, "");
                }

                if (Request["save"] != null)
                {
                    //Response.Redirect(Request["retURL"], true);
                    SaveData();
                    string retURL = string.Format("/apps/wf/ProcRuleCondition.aspx?ruleCode={0}&processId={1}", ruleCode, processid);
                    Response.Redirect(retURL, false);
                }

                if (!string.IsNullOrEmpty(ruleid))
                {
                    string condXml = WfSchemeManager.GetRuleCondition(new Guid(ruleid), new Guid(processid));
                    if (!string.IsNullOrEmpty(condXml))
                        conds = DynamicRuleUtil.DeserializeQueryDynamicRule(condXml);
                }

                GetProcess();

                GetFormTemplateFields();

            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
           
           
        }
        void SaveData()
        {
            //<fetchxml><filter><condition entityname="SystemUser"  name="PostId" operator="eq" value="24" logical="And"/></filter></fetchxml>
            
            StringBuilder sb = new StringBuilder();
            sb.Append("<fetchxml><filter>");
            for (int i = 1; i <= 10; i++)
            {
                string flog = "flog" + i; //逻辑运算符
                string fcol = "fcol" + i;
                string fop = "fop" + i;
                string fval = "fval" + i;
                string logical = Request[flog];
                string colName = Request[fcol];
                string oper = Request[fop];
                string colValue = Request[fval];
                if (string.IsNullOrEmpty(logical)) logical = "AND";
                if (!string.IsNullOrEmpty(colName) && !string.IsNullOrEmpty(oper) && !string.IsNullOrEmpty(colValue))
                {
                    sb.AppendFormat("<condition  name=\"{0}\" operator=\"{1}\" value=\"{2}\" logical=\"{3}\"/>", colName, oper, colValue, logical);
                }
                
            }
            sb.Append("</filter></fetchxml>");
            string cond = sb.ToString();
            WfSchemeManager.SaveRuleCondition(new Guid(ruleid), new Guid(processid), cond);
        }
        void GetProcess()
        {
            string processId = Request["processId"];
            if (string.IsNullOrEmpty(processId))
                return;

           ProcessDefinition profDef = WfSchemeManager.GetProcess(_caller,new Guid(processId));
           if (profDef != null)
           {
               strTemplateId = profDef.EntityObjectId.ToString();
           }
            /*
            this.QueryName = savedQuery.Name;
            string sql = string.Format("SELECT EntityId FROM Entity WHERE OrganizationId='{0}' AND ObjectTypeCode={1}", _caller.CustomerID, savedQuery.ReturnedTypeCode);
            strTemplateId = DatabaseTool.GetFirstCellStr(_caller.CustomerID, sql, "");
            string columXml = savedQuery.ColumnSetXml;
            fetchXml = savedQuery.FetchXml;
            */

        }

        void GetFormTemplateFields()
        {
           //string sql = "";

            Template userTemp = TemplateManager.GetTemplate(_caller.OrganizationId, EntityTemplateIDs.SystemUser);
            templates[0] = userTemp;

            if (string.IsNullOrEmpty(strTemplateId))
                return;
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, new Guid(strTemplateId));
            if (template != null)
            {
                this.EntityTitle = template.Title;
                templates[1] = template;
            }
            //sql = "SELECT EntityId FROM Entity WHERE EntityId='{0}'";
            //strTemplateId = DatabaseTool.GetFirstCellStr(_caller.CustomerID, sql, "");
            RenderConditionFields();
            /*
            foreach (Entity entity in entities)
            {
                // _selectFields += string.Format(" <option value=\"{0}\">{1}</option>", entity.Name, entity.Fields["DisplayName"].Value);
                foreach (string strField in displayColumns)
                {
                    if (strField.Equals(entity.Name, StringComparison.InvariantCultureIgnoreCase))
                    {
                        this.DisplayColums += string.Format(" <option value=\"{0}\">{1}</option>", entity.Name, entity.Fields["DisplayName"].Value);
                        break;
                    }
                }
            }
            */
        }
        Template[] templates = new Template[2] { null,null};
        string newLine = "\r\n";
        void RenderConditionFields()
        {
            int i = 1;

            foreach (NodeExp exp in  conds)
            {
                RenderConditionField(templates, exp, i);
                i++;
            }

            for (; i <= 10; i++)
            {
                //string selectField = "";
                RenderConditionField(templates, null, i);
            }
            sb.Append("<script type=\"text/javascript\">");
            sb.Append(" var type2ops = new Array();" + newLine);
            sb.Append("var value2ops = new Array();" + newLine);
            sb.Append("var val2type = new Array();" + newLine);
            //sb.Append("var oppLabels = new Array(); " + newLine);

            foreach (Template template in templates)
            {               
                sb.Append(RenderScriptBlock(template));               
            }
            sb.Append("</script>");
            FilterConditionHTML = sb.ToString();
        }

        void RenderConditionField(Template[] templates, NodeExp exp, int sortNum)
        {
            //int sortNum = 0;
            //style="display: none"
            string selectField = "";
            string oper = "";
            string fValue = "";
            string logical = "";
            if (exp != null)
            {
                if(exp.LogicalOperator== LogicalOperator.And)
                    logical = "AND";
                if (exp.LogicalOperator == LogicalOperator.Or)
                    logical = "OR";

                selectField = exp.FieldName;
               // oper = exp.Operator.ToString();
                oper = QueryUtil.ToOperatorString(exp.Operator);
                fValue =MainUtil2.ArrayToString(exp.Values);
            }
            sb.AppendFormat(" <tr id=\"frow{0}\" style=\"{1}\">", sortNum, (sortNum > 5 ? "display: none" : ""));
            sb.AppendFormat("<td> <span class=\"textBox\" id=\"f{0}\" style=\"display: none\">{0}.</span> </td>", sortNum);


            //logical 逻辑一下符
            string tmp1 = "";
            tmp1 += string.Format("<option value=\"AND\" {0} >与</option>", (logical == "AND") ? "selected" : "");
            tmp1 += string.Format("<option value=\"OR\" {0} >或</option>", (logical == "OR") ? "selected" : "");

            sb.AppendFormat("<td>  <select class=\"logical\" id=\"flog{0}\" name=\"flog{0}\" title=\"逻辑运算符 {0}\"><option value=\"\"></option> {1} </select></td>", sortNum, tmp1);

            /*
            <optgroup label="联系人：一般"><option value="LAST_ACTIVITY">上次活动日期</option>
                <option value="LAST_UPDATE">上次修改日期</option>
                <option selected="selected" value="CREATED_DATE">创建日期</option>
                <option value="LAST_SIT_REQUEST">上次保持联系请求日期</option>
                <option value="LAST_SIT_UPDATE">上次保持联系保存日期</option>
            </optgroup>
            */
            //字段
            sb.AppendFormat("<td> <select class=\"column\" id=\"fcol{0}\" name=\"fcol{0}\" onchange=\"updateOperator(this, 'fop{0}', 'flkp{0}');; selectNotNone('fop{0}')\"   title=\"搜索条件 {0}\"><option value=\"\">--无--</option>", sortNum);

            foreach (Template template in templates)
            {
                _selectFields = "";
                string sql = "SELECT * FROM Attribute WHERE EntityId='{0}' AND IsCustomField=1 ORDER BY ColumnNumber";
                sql = string.Format(sql, template.ID);
                entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.Attribute, sql);
                string templateName = template.Name;
                sb.AppendFormat("<optgroup label=\"{0}\">", template.Title);
                foreach (Entity entity in entities)
                {
                    string fieldName = StringUtil.GetString(entity.Fields["Name"].Value);
                    string combine = string.Format("{0}.{1}", templateName, fieldName);
                    if (string.Compare(combine, selectField, StringComparison.InvariantCultureIgnoreCase) == 0 || string.Compare(fieldName, selectField, StringComparison.InvariantCultureIgnoreCase) == 0)
                        _selectFields += string.Format(" <option value=\"{0}.{1}\" selected>{2}</option>", templateName,fieldName , entity.Fields["DisplayName"].Value);
                    else
                        _selectFields += string.Format(" <option value=\"{0}.{1}\">{2}</option>", templateName, fieldName, entity.Fields["DisplayName"].Value);
                }
                sb.Append(_selectFields);
                sb.AppendFormat("</optgroup>");
            } 
            sb.Append(" </select> </td>");

            
            //operators
            string curSelOpe = GetSelectOption(oper);
            if (!string.IsNullOrEmpty(curSelOpe))
                sb.AppendFormat("<td>  <select class=\"operator\" id=\"fop{0}\" name=\"fop{0}\" title=\"运算符 {0}\"><option value=\"\">--无--</option>{1} </select></td>", sortNum, curSelOpe);
            else
                sb.AppendFormat("<td>  <select class=\"operator\" id=\"fop{0}\" name=\"fop{0}\" title=\"运算符 {0}\"><option value=\"\">--无--</option> </select></td>", sortNum);
            
            sb.AppendFormat("<td> <input id=\"fval{0}\" maxlength=\"80\" name=\"fval{0}\" size=\"20\" value=\"{1}\" title=\"值 {0}\" type=\"text\" /></td>", sortNum,fValue);
            sb.Append("<td>");
            sb.AppendFormat("<span style=\"display:none\" id=\"flkp{0}\"><a title=\"查找（新窗口） （新窗口）\" href=\"javascript:openPopupFocus%28%27%27%2C%20%27filter_lookup%27%2C%20620%2C%20430%2C%20%27width%3D620%2Cheight%3D430%2Cresizable%3Dyes%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cscrollbars%3Dyes%2Cmenubar%3Dno%2Cdirectories%3Dno%2Clocation%3Dno%2Cdependant%3Dno%27%2C%20false%2C%20true%29%3BopenFilterLookupWindow%28%27editPage%27%2C%20%27%2Fui%2Flist%2FFilterLookupPage%27%2C%20%27fcol{0}%27%2C%20%27fval{0}%27%29%3B\"><img title=\"查找（新窗口） （新窗口）\" onmouseover=\"this.className = 'lookupIconOn';this.className = 'lookupIconOn';\" onmouseout=\"this.className = 'lookupIcon';this.className = 'lookupIcon';\" onfocus=\"this.className = 'lookupIconOn';\" onblur=\"this.className = 'lookupIcon';\" class=\"lookupIcon\" alt=\"查找（新窗口） （新窗口）\" src=\"/s.gif\"></a></span>", sortNum);
            sb.Append(" </td>");
            sb.AppendFormat("<td><span class=\"textBox\" id=\"and{0}\" style=\"visibility: visible\">与</span> </td>", sortNum);
            sb.AppendFormat(" </tr>");
            sb.ToString();
        }
        private string GetLogical(string logical)
        {
            string option = "";
            switch (logical.ToLower())
            {

                case "and":
                    option = "<option value='AND' selected>与</option>";
                    break;
                case "or":
                    option = "<option value='OR' selected>或</option>";
                    break;
            }
            return option;
        }
        private string GetSelectOption(string oper)
        {
            string option = "";
            switch (oper.ToLower())
            { 
                
                case "eq":
                    option = "<option value='eq' selected>等于</option>";
                    break;
                case "neq":
                    option = "<option value='neq' selected>不等于</option>";
                    break;
                case "lt":
                    option = "<option value='lt' selected>小于</option>";
                    break;
                case "gt":
                    option = "<option value='gt' selected>大于</option>";
                    break;
                case "le":
                    option = "<option value='le' selected>小于或等于</option>";
                    break;
                case "ge":
                    option = "<option value='ge' selected>大于或等于</option>";
                    break;
                case "contains":
                    option = "<option value='contains' selected>包含</option>";
                    break;
                case "beginswith":
                    option = "<option value='beginswith' selected>开始字符</option>";
                    break;
                case "not-like":
                    option = "<option value='not-like' selected>不包含</option>";
                    break;
                case "in":
                    option = "<option value='in' selected>包括范围</option>";
                    break;
                case "not-in":
                    option = "<option value='not-in' selected>排除</option>";
                    break;
                    
            }
            return option;
        }

        private string RenderScriptBlock(Template template)
        {
           
            StringBuilder sb = new StringBuilder();
            
            //sb.Append("type2ops['Text'] = ['eq', 'neq', 'in', 'not-in'];" + newLine);
            sb.Append("type2ops['Date'] = ['eq', 'neq', 'lt', 'gt', 'le', 'ge'];" + newLine);
            sb.Append("type2ops['Integer'] = ['eq', 'neq', 'lt', 'gt', 'le', 'ge'];" + newLine);
            sb.Append("type2ops['Text'] = ['eq', 'neq', 'lt', 'gt', 'le', 'ge', 'contains','beginswith', 'not-like'];" + newLine);
            //type2ops['StaticEnum'] = ['e','n','l','g','m','h','c','k','s','i'];
            //sb.Append("type2ops['StaticEnum'] = ['eq','neq','in'];" + newLine);
            sb.Append("type2ops['StaticEnum'] = ['eq','neq','in','not-in'];" + newLine);

            
            foreach (Supermore.EntityFramework.Templates.TemplateField tf in template.Fields)
            {
                if (tf.FieldType == null)
                    continue;
                if (!tf.IsCustomField || tf.IsPKAttribute)
                    continue;
                if (tf.FieldType.DType == FieldTypeCodes.Lookup ||
                    tf.FieldType.DType == FieldTypeCodes.User || tf.FieldType.DType == FieldTypeCodes.BusinessUnit)
                    //|| tf.FieldType.DType == FieldTypeCodes.Picklist
                    continue;
                sb.Append(RenderJs(template,tf) + newLine);
            }

            sb.Append(" function selectNotNone(opSelName) { var selObj = document.getElementById(opSelName); if (selObj.selectedIndex == 0) selObj.selectedIndex = 1; }" + newLine);
            //sb.Append(" function initializeOperator(selName, colName, lookupName) { var obj = document.getElementById(colName); if (obj) { obj = document.getElementById(selName); if (obj != null) { updateOperator(obj, colName, lookupName); } } }" + newLine);
            //sb.Append("  function onLoadCriteria() { initializeOperator('PricebookEntrycol0', 'PricebookEntryoper0', null); initializeOperator('PricebookEntrycol1', 'PricebookEntryoper1', null); initializeOperator('PricebookEntrycol2', 'PricebookEntryoper2', null); initializeOperator('PricebookEntrycol3', 'PricebookEntryoper3', null); initializeOperator('PricebookEntrycol4', 'PricebookEntryoper4', null); }" + newLine);

            return sb.ToString();
        }
        public string RenderJs(Template template,Supermore.EntityFramework.Templates.TemplateField tField)
        {
            string str1 = "";
            string dbType = tField.FieldType.DType;
            switch (dbType)
            {
                case FieldTypeCodes.User:
                case FieldTypeCodes.BusinessUnit:
                case FieldTypeCodes.Lookup:
                case FieldTypeCodes.MasterDetail:

                    str1 = "val2type['" + template.Name+"."+tField.Name + "'] = 'Text';";
                    break;
                case FieldTypeCodes.Numeric:
                    str1 = "val2type['" + template.Name + "." + tField.Name + "'] = 'Integer';";
                    break;
                case FieldTypeCodes.DateTime:
                case FieldTypeCodes.Date:
                    str1 = "val2type['" + template.Name + "." + tField.Name + "'] = 'Date';";
                    break;
                case FieldTypeCodes.DroplistText:
                case FieldTypeCodes.Picklist:
                    str1 = "val2type['" + template.Name + "." + tField.Name + "'] = 'StaticEnum';";
                    break;

                case FieldTypeCodes.Text:
                default:

                    str1 = "val2type['" + template.Name + "." + tField.Name + "'] = 'Text';";
                    break;
            }
            return str1;
        }
        public string EntityTitle { get; set; }

        public string QueryName { get; set; }
        public string AvaliableFields { get { return _selectFields; } }
        public string FilterConditionHTML { get; set; }
        /// <summary>
        /// 可选显示角色、组
        /// </summary>
        public string AvaliableOptions { get { return _avaliableOptions; } }

        /// <summary>
        /// 可选显示的字段
        /// </summary>
        public string AvaliableDisplayColums { get; set; }
        /// <summary>
        /// 已选显示的字段
        /// </summary>
        public string DisplayColums { get; set; }

        int _orderOfEvaluation = 1;
        public int OrderOfEvaluation
        {
            get { return _orderOfEvaluation; }
            set { _orderOfEvaluation = value; }
        }
    }
}