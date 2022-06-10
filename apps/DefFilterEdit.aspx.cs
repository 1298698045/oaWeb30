using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.Security;
using Supermore.Activities;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using System.Text;
using System.Xml;
using Supermore.Xml;
using Supermore.Organization;

namespace WebClient.apps
{
    public partial class DefFilterEdit : System.Web.UI.Page
    {
        CallContext _caller;
        string _avaliableOptions = "";
        string _userName;
        EntityCollection entities = null;
        string strTemplateId = "";
        string fetchXml = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["cancel"] != null)
            {
                Response.Redirect(Request["retURL"], true);
            }

            
            _caller = AppDataSource.GetCallContext();
            _userName = _caller.UserName;

            if (Request["save"] != null)
            {
               SaveData();
            }

            GetQuery();

            GetTemplateFields();
            //LoadUsers();
            LoadPublicGroups();
            //LoadPersonalGroups();
            LoadRoles();

            RenderConditionFields();
        }
        void GetQuery()
        {
            string id = Request["id"];
            if (string.IsNullOrEmpty(id))
                return;
            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(id));

            this.QueryName = savedQuery.Name;

            string sql = string.Format("SELECT EntityId FROM Entity WHERE OrganizationId='{0}' AND ObjectTypeCode={1}", _caller.CustomerID, savedQuery.ReturnedTypeCode);
            strTemplateId = DatabaseTool.GetFirstCellStr(_caller.CustomerID, sql, "");
            string columXml = savedQuery.ColumnSetXml;
            fetchXml = savedQuery.FetchXml;

            //QueryExpression queryExp = QueryUtil.DeserializeQueryExpression("", fetchXml);

            XmlNodeList nodes = XmlUtil.CreateXmlDocument(columXml).SelectNodes("columnset/column");
            int i = 0;
            foreach (XmlNode node in nodes)
            {
                string fieldName = node.InnerText;
                //string label = "";
                Array.Resize<string>(ref displayColumns, displayColumns.Length + 1);
                displayColumns[i] = fieldName;

                i++;
            }

        }

        void SaveData()
        {
            string id = Request["id"];
            if (string.IsNullOrEmpty(id))
                return;

            string colselector1 = Request["colselector1"];//显示列
            string fname =Request["fname"];
            string fscope0 = Request["fscope0"];//所有人过滤
            string fshare = Request["fshare"];//仅对我可视fsharenone;所有用户皆可视fshareall;某些用户组可视fsharegroups

            SavedQuery savedQuery = null;
            Entity entity = null;
            bool isNew = false;

            savedQuery.InnerEntity.BeginEdit();

            if (string.IsNullOrEmpty(id))
            {
                entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.SavedQuery, _caller.OrganizationId);
                savedQuery = new SavedQuery(entity);
                isNew = true;
                savedQuery.IsUserDefined = isNew;
            }
            else
                savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(id));

            //<columnset><column>Title</column><column>FolderId</column><column>StateCode</column></columnset>
            string[] columns = colselector1.Split(',');
            string columnset = "<columnset>";
            foreach (string col in columns)
                columnset += string.Format("<column>{0}</column>", col);
            columnset += "</columnset>";
                       
            savedQuery.Name = fname;
            savedQuery.ColumnSetXml = columnset;
            savedQuery.InnerEntity.EndEdit();

            string retURL = Request["retURL"];
            Response.Redirect(retURL);

        }
        
        string[] displayColumns = new string[] { };
        string _selectFields = "";
        StringBuilder sb = new StringBuilder();

        void GetTemplateFields()
        {
            string sql = "";
            //ftype=01I90000001SlVR
            string ftype = Request["ftype"];//01I90000001SlVR
            switch (ftype)
            { 
                default:
                    if (MainUtil2.IsID(ftype))
                    {
                        strTemplateId = ftype;
                    }
                    break;
            }

            if (string.IsNullOrEmpty(strTemplateId))
                return;
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, new Guid(strTemplateId));
            if (template != null)
            {
                this.EntityTitle = template.Title;
            }
            //sql = "SELECT EntityId FROM Entity WHERE EntityId='{0}'";
            //strTemplateId = DatabaseTool.GetFirstCellStr(_caller.CustomerID, sql, "");
            sql = "SELECT * FROM Attribute WHERE EntityId='{0}' AND IsGridColumn=1 ORDER BY ColumnNumber";
            sql = string.Format(sql, strTemplateId);
            entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.Attribute, sql);

            foreach (string strField in displayColumns)
            {
                EntityCollection selCols = entities.Select("Name", strField);
                if (selCols.Count > 0)
                {
                    Entity entity = selCols[0];
                    this.DisplayColums += string.Format(" <option value=\"{0}\">{1}</option>", strField, entity.Fields["DisplayName"].Value);
                }
            }
            foreach (Entity entity in entities)
            {              
                bool isDisplay = IsSelectDisplayField(entity, displayColumns);
                if (!isDisplay)
                {
                    string fieldName = StringUtil.GetString(entity.Fields["Name"].Value);
                    this.AvaliableFields += string.Format(" <option value=\"{0}\">{1}</option>", fieldName, entity.Fields["DisplayName"].Value);
                }
            }
        }

        bool IsSelectDisplayField(Entity entity, string[] displayColumns)
        {
            string fieldName = StringUtil.GetString(entity.Fields["Name"].Value);
            //if(Array.IndexOf( displayColumns,fieldName,StringCom))>-1)
            //return true;
            foreach (string strField in displayColumns)
            {
                if (strField.Equals(fieldName, StringComparison.InvariantCultureIgnoreCase))
                {
                    //this.DisplayColums += string.Format(" <option value=\"{0}\">{1}</option>", fieldName, entity.Fields["DisplayName"].Value);
                    return true;
                }
            }
            return false;
        }

        void RenderConditionFields()
        {
            for (int i = 1; i <= 10; i++)
            {
                string selectField = "";
                RenderConditionField(selectField,i);
            }
           FilterConditionHTML= sb.ToString();
        }

        void RenderConditionField(string selectField, int sortNum)
        {
            //int sortNum = 0;
            //style="display: none"
           
            sb.AppendFormat(" <tr id=\"frow{0}\" style=\"{1}\">",sortNum, (sortNum>5 ? "display: none":""));
            sb.AppendFormat("<td> <span class=\"textBox\" id=\"f{0}\" style=\"display: none\">{0}.</span> </td>", sortNum);
            sb.AppendFormat("<td> <select class=\"column\" id=\"fcol{0}\" name=\"fcol{0}\" onchange=\"updateOperator(this, 'fop{0}', 'flkp{0}');; selectNotNone('fop{0}')\"   title=\"搜索条件 {0}\"><option value=\"\">--无--</option>", sortNum);
            _selectFields = "";
            foreach (Entity entity in entities)
            {
                if (string.Compare(entity.Name,selectField,StringComparison.InvariantCultureIgnoreCase)==0)
                    _selectFields += string.Format(" <option value=\"{0}\" selected>{1}</option>", entity.Name, entity.Fields["DisplayName"].Value);
                else
                     _selectFields += string.Format(" <option value=\"{0}\">{1}</option>", entity.Name, entity.Fields["DisplayName"].Value);
            }
            sb.Append(_selectFields);
            sb.Append(" </select> </td>");

            sb.AppendFormat("<td>  <select class=\"operator\" id=\"fop{0}\" name=\"fop{0}\" title=\"运算符 {0}\"><option value=\"\">--无--</option> </select></td>", sortNum);
            sb.AppendFormat("<td> <input id=\"fval{0}\" maxlength=\"80\" name=\"fval{0}\" size=\"20\" title=\"值 {0}\" type=\"text\" /></td>", sortNum);
            sb.Append("<td>");
            sb.AppendFormat("<span style=\"display:none\" id=\"flkp{0}\"><a title=\"查找（新窗口） （新窗口）\" href=\"javascript:openPopupFocus%28%27%27%2C%20%27filter_lookup%27%2C%20620%2C%20430%2C%20%27width%3D620%2Cheight%3D430%2Cresizable%3Dyes%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cscrollbars%3Dyes%2Cmenubar%3Dno%2Cdirectories%3Dno%2Clocation%3Dno%2Cdependant%3Dno%27%2C%20false%2C%20true%29%3BopenFilterLookupWindow%28%27editPage%27%2C%20%27%2Fui%2Flist%2FFilterLookupPage%27%2C%20%27fcol{0}%27%2C%20%27fval{0}%27%29%3B\"><img title=\"查找（新窗口） （新窗口）\" onmouseover=\"this.className = 'lookupIconOn';this.className = 'lookupIconOn';\" onmouseout=\"this.className = 'lookupIcon';this.className = 'lookupIcon';\" onfocus=\"this.className = 'lookupIconOn';\" onblur=\"this.className = 'lookupIcon';\" class=\"lookupIcon\" alt=\"查找（新窗口） （新窗口）\" src=\"/s.gif\"></a></span>", sortNum);
            sb.Append(" </td>");
            sb.AppendFormat("<td><span class=\"textBox\" id=\"and{0}\" style=\"visibility: visible\">AND</span> </td>", sortNum);
            sb.AppendFormat(" </tr>");
            sb.ToString();
        }

        void LoadRoles()
        {
            if (!string.IsNullOrEmpty(_avaliableOptions))
                _avaliableOptions += ",";
            List<Role> users = SecurityAuth.GetSystemRoles(_caller);
            int i = 0;
            foreach (Role a in users)
            {
                if (i > 0)
                    _avaliableOptions += ",";
                _avaliableOptions += string.Format("['A', '角色：{0}', 'A:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        void LoadPublicGroups()
        {
            if (!string.IsNullOrEmpty(_avaliableOptions))
                _avaliableOptions += ",";
            EntityCollection entities = GroupManager.GetPublicGroups(_caller);
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _avaliableOptions += ",";
                _avaliableOptions += string.Format("['R', '小组：{0}', 'R:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }

        public string EntityTitle { get; set; }

        public string QueryName { get; set; }
        /// <summary>
        ///列表 - 可选字段 
        /// </summary>
        public string AvaliableFields { get; set; }
        /// <summary>
        /// 列表 - 已选显示的字段
        /// </summary>
        public string DisplayColums { get; set; }

        public string FilterConditionHTML { get; set; }
        /// <summary>
        /// 可选显示角色、组
        /// </summary>
        public string AvaliableOptions { get { return _avaliableOptions; } }

        /// <summary>
        /// 可选显示的字段
        /// </summary>
        public string AvaliableDisplayColums { get; set; }
        
    }
}