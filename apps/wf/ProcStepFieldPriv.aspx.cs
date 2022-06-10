using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.Contents;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;

namespace WebClient.apps.wf
{
    public partial class ProcStepFieldPriv : System.Web.UI.Page
    {
        private CallContext _caller = null;
        string stepId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            stepId = Request["stepid"];
            if (!Page.IsPostBack)
            {
                string procId = Request["procid"];
                ProcessDefinition proc = WfSchemeManager.GetProcess(new Guid(procId));
                this.ProcessName = proc.Name;
                this.ProcessId = procId;
                this.EntityObjectId = proc.EntityObjectId.ToString();
                //this.Description = proc.Description;
                RenderCustomFields();
            }
            GetStep();
        }
        private void GetStep()
        {
           ActivityDefinition actDef = WfSchemeManager.GetActivity(new Guid(this.ProcessId), new Guid(stepId));
           StepName = actDef.Name;
        }
        private void RenderCustomFields()
        {
            int mode = 2;
            _caller = AppDataSource.GetCallContext();
            StringBuilder sb = new StringBuilder();
            string sql = "SELECT * FROM Attribute WHERE EntityId='{0}' AND (IsCustomField=1 OR IsNameField=1) ORDER BY ColumnNumber";
            sql = string.Format(sql, this.EntityObjectId);
            EntityCollection entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.Attribute, sql);
            Template template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), new Guid(this.EntityObjectId));
            string tableName = template.Name;
            
            foreach (Entity entity in entities)
            {
                sb.Append(RenderStartRow(mode));

                Guid atypeId = MainUtil.GetGuid(entity.Fields["AttributeTypeId"]);
                string fieldTypeName = "";
                Supermore.EntityFramework.FieldType fType= Supermore.EntityFramework.FieldType.GetFieldType(atypeId);
                if (fType != null)
                {
                    fieldTypeName =string.Format("【{0}】",fType.Description);
                }
                sb.AppendFormat("<th class=\" dataCell  \" scope=\"row\">{0}({1}){2}</th>", entity.Fields["DisplayName"].Value.ToString() , entity.Fields["Name"].Value.ToString(), fieldTypeName);
                //sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", entity.Fields["Name"].Value);
                //Guid fId = MainUtil.GetGuid(entity.Fields["AttributeTypeId"].Value);
                //Supermore.EntityFramework.FieldType fType = Supermore.EntityFramework.FieldType.GetFieldType(fId);
                string fname =StringUtil.GetString( entity.Fields["Name"].Value);
                sb.AppendFormat("<td class=\" booleanColumn zen-deemphasize  \">{0}</td>", CreatePris(tableName,fname));
                //sb.Append("<td class=\"dataCell\">&nbsp;</td>");
                //sb.Append("<td class=\"dataCell\">&nbsp;</td>");
                sb.Append("</tr>");
                if (mode == 2)
                    mode = 1;
                else
                    mode = 2;

            }
            sb.Append(GetChildEntity());
            this.CustomFields = sb.ToString();
        }
        int mode = 2;
        string GetChildEntity()
        {
            StringBuilder sb = new StringBuilder();
            string sql = "SELECT EntityId,Name,DisplayName FROM Entity WHERE MasterEntityId='{0}'  ";
            sql = string.Format(sql, this.EntityObjectId);
            EntityCollection entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.Entity, sql);
            foreach (Entity entity in entities)
            {
               // sb.AppendFormat("<option value='t:{0}'>{1}</option>", entity.ID, entity.Fields["DisplayName"].Value);
                sb.Append(RenderStartRow(mode));
                string tableName = StringUtil.GetString(entity.Fields["Name"].Value);
                sb.AppendFormat("<th class=\" dataCell  \" scope=\"row\"><b>子表 - 【{0}】 </b></th>", entity.Fields["DisplayName"].Value.ToString());
                sb.AppendFormat("<td class=\" booleanColumn zen-deemphasize  \">{0}</td>", CreateSubTablePris(tableName));
                sb.Append("</tr>");
                mode++;

                sb.Append(RenderEntityAttributes(entity.ID.ToString()));
                
            }
            return sb.ToString();
        }
        /// <summary>
        /// 表字段
        /// </summary>
        /// <param name="templateId"></param>
        /// <returns></returns>
        string RenderEntityAttributes(string templateId)
        {
            StringBuilder sb = new StringBuilder();
           
            string sql = "SELECT * FROM Attribute WHERE EntityId='{0}' AND  (IsCustomField=1 OR IsNameField=1) ORDER BY ColumnNumber";
            sql = string.Format(sql, templateId);
            EntityCollection entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.Attribute, sql);
            Template template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), new Guid(templateId));
            string tableName = template.Name;
            string tempDisplayName = template.Title;
            foreach (Entity entity in entities)
            {
                sb.Append(RenderStartRow(mode));

                sb.AppendFormat("<th class=\" dataCell  \" scope=\"row\"><b>{0}(子表)</b> - {1}</th>", tempDisplayName, entity.Fields["DisplayName"].Value.ToString());
                //sb.AppendFormat("<td class=\" dataCell  \">{0}</td>", entity.Fields["Name"].Value);
                //Guid fId = MainUtil.GetGuid(entity.Fields["AttributeTypeId"].Value);
                //Supermore.EntityFramework.FieldType fType = Supermore.EntityFramework.FieldType.GetFieldType(fId);
                string fname = StringUtil.GetString(entity.Fields["Name"].Value);
                sb.AppendFormat("<td class=\" booleanColumn zen-deemphasize  \">{0}</td>", CreatePris(tableName, fname));
                //sb.Append("<td class=\"dataCell\">&nbsp;</td>");
                //sb.Append("<td class=\"dataCell\">&nbsp;</td>");
                sb.Append("</tr>");
                if (mode == 2)
                    mode = 1;
                else
                    mode = 2;

            }
            return sb.ToString();
        }
        string CreatePris(string tableName,string fieldName)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("<input type='radio' id='pri_{0}~{1}_2' name='pri_{0}~{1}' value='2' tag='hide' />不可见", tableName, fieldName);
            sb.AppendFormat("<input type='radio' id='pri_{0}~{1}_4' name='pri_{0}~{1}' value='4' checked='checked' tag='read' />只读", tableName, fieldName);
            sb.AppendFormat("<input type='radio' id='pri_{0}~{1}_8' name='pri_{0}~{1}' value='8'  tag='write' />读写", tableName, fieldName);
            //显示用默认值更新
            sb.AppendFormat("<input type='radio' id='pri_{0}~{1}_16' name='pri_{0}~{1}' value='16'  tag='default' />显示默认值且不可修改", tableName, fieldName);

            sb.AppendFormat("<input type='radio' id='pri_{0}~{1}_32' name='pri_{0}~{1}' value='32'  tag='defaultupdate' />显示默认值且可修改", tableName, fieldName);
            /*
            sb.AppendFormat("<select id='pri_{0}~{1}' name='pri_{0}~{1}'>", tableName,fieldName);
            sb.Append("<option value='2'>不可见</option>");
            sb.Append("<option value='8'>读写</option>");  
            sb.Append("<option value='4'>只读</option>");                     
             sb.Append("</select>");
            */
            return  sb.ToString();
        }
        /// <summary>
        /// 字表权限
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        string CreateSubTablePris(string tableName)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("<input type='checkbox' id='tablepri_{0}_list' name='tablepri_{0}' value='list' checked='checked' tag='list' />可见", tableName);
            sb.AppendFormat("<input type='checkbox' id='tablepri_{0}_add' name='tablepri_{0}' value='add'  tag='add' />可新增", tableName);
            sb.AppendFormat("<input type='checkbox' id='tablepri_{0}_delete' name='tablepri_{0}' value='delete'  tag='delete' />可删除", tableName);
            
            return sb.ToString();
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        public string EntityObjectId { get; set; }
        public string ProcessId { get; set; }
        public string ProcessName { get; set; }
        public string StepName { get; set; }

        public string CustomFields
        {
            get;
            set;
        }
    }
}