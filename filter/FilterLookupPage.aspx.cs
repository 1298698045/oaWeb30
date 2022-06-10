using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.IO;

namespace WebClient.filter
{
    public partial class FilterLookupPage : System.Web.UI.Page
    {
        string lookupField = "";
        CallContext _caller = null;
        string strTemplateId = "";
        string strFieldId = "";
        Template template = null;
        int objectTypeCode = 0;
        string _templateName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            lookupField = Request["lookup"];
            if (Request["objectTypeCode"] != null)
                this.objectTypeCode = MainUtil.GetInt(Request["objectTypeCode"], 0);
            else
            {
                if (lookupField.IndexOf('.') > -1)
                {
                    string[] fieldArray = lookupField.Split('.');
                    _templateName = fieldArray[0];
                    lookupField = fieldArray[1];
                    string sql = string.Format("select ObjectTypeCode from Entity where Name='{0}'",_templateName);
                    object obj = DatabaseTool.GetFirstCellVal(_caller.CustomerID, sql, 0);
                    objectTypeCode = (int)obj;
                }
            }
            
            GetFieldPicklist();
        }

        string GetFieldPicklist()
        {
            int mode = 2;
            int iRow = 0;
            EntityCollection entities = StringEnumManager.GetFieldPicklist(_caller, this.objectTypeCode, lookupField);
            StringBuilder sb = new StringBuilder();
           
            foreach (Entity entity in entities)
            {
                sb.Append(RenderStartRow(mode, iRow));
                string attributeValue=StringUtil.GetString(entity.Fields["AttributeValue"].Value);
                sb.AppendFormat("<td class=\"actionColumn\"><input id=\"chkbox{0}\" name=\"chkbox{0}\" onclick=\"FilterLookupPage.prototype.doCheckbox({0});\" type=\"checkbox\" value=\"{1}\" />", iRow, attributeValue);
                
                sb.Append(" </td>");
                sb.AppendFormat("<td ><label for=\"chkbox{0}\">{1}</label></td>", iRow,entity.Fields["Value"].Value);
                
                sb.Append("</tr>");
                iRow++;
                mode++;
            }
            this.HTMLGrid = sb.ToString();
            return this.HTMLGrid;
        }
        string RenderStartRow(int mode,int iRow)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            if (iRow == 0)
                css += " first ";
            tRow = "<tr class=\" dataRow " + css + "\">";

            return tRow;
        }
        public string HTMLGrid { get; set; }
    }
}