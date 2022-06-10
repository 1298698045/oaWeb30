using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;

namespace WebClient.apps.wf
{
    public partial class ProcessDetail : System.Web.UI.Page
    {
        private CallContext _caller = null;
        string _retURL = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.ProcessId = Request["id"];
            _caller = AppDataSource.GetCallContext();
            GetProcess(new Guid(ProcessId));

        }
        public void GetProcess(Guid processId)
        {
            try
            {
                ProcessDefinition proc = WfSchemeManager.GetProcess(processId);
                this.ProcessName = proc.Name;
                this.Description = proc.Description;
                this.EntityObjectId = proc.EntityObjectId.ToString();

                Template t = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), proc.EntityObjectId);
                if (t != null)
                    this.EntityObjectName = t.Title;

                int state = proc.StateCode;
                this.CreatedByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, proc.CreatedBy);
                this.ModifiedByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, proc.ModifiedBy);
                this.FolderName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.ItemTree, proc.FolderId);
                this.ModifiedOn = proc.ModifiedOn;
                this.CreatedOn = proc.CreatedOn;

                StateCodeName = "草稿";
                if (state == 1)
                    StateCodeName = "已发布";
                RenderGrid(proc);
                GetRules(proc);
                GetAccessControl();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        string tBody = "";
        void RenderGrid(ProcessDefinition proc)
        {
            int mode = 2;
            //CallContext caller = AppDataSource.GetCallContext();
            //QueryExpression queryExp = new QueryExpression();
            //Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            //EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
            string retURL = HttpUtility.UrlEncode( Request.RawUrl);
            //string objectId = "";
            int iRow = 1;
            string procId = proc.ID.ToString();
            foreach (ActivityDefinition entity in proc.Activities)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);

                //action
                //tRow += string.Format("<td  class=\" actionColumn  \"><a title=\"编辑 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('')\">编辑</a>&nbsp;|&nbsp;<a class=\"actionLink\" href=\"ProcStepFieldPriv.aspx?t=121&procid={0}&stepid={1}&retURL={2}\" title=\"流程、正文附件、字段访问权限 - 记录  - \">权限</a></td>",procId, entity.ID, retURL);
                tRow += string.Format("<td  class=\" actionColumn  \"><a class=\"actionLink\" href=\"/apps/wf/ProcStepFieldPriv.aspx?t=121&procid={0}&stepid={1}\" title=\"流程、正文附件、字段访问权限 - 记录  - {2}\">权限</a>", procId, entity.ID,iRow);
                tRow += string.Format(" | <a class=\"actionLink\" href=\"#\" onclick=\"showParticipantor('{0}','{1}','{2}')\" title=\"设置办理人员 - {3} - {4}\">办理人员</a>", procId, entity.ID, entity.ActivityCode, entity.Name, iRow);
                tRow += string.Format(" | <a class=\"actionLink\" href=\"#\" onclick=\"previewParticipantor('{0}','{1}','{2}')\" title=\"设置办理人员 - {3} - {4}\">预览人员</a>", procId, entity.ID, entity.ActivityCode, entity.Name, iRow);
                //name
                tRow += "</td>";
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>",  entity.Name);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", entity.ActivityCode);

                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", entity.Deadline);
                //action
                // tRow += string.Format(" <th scope=\"row\" class=\" dataCell  \"><a href=\"ViewObject.aspx?id={1}&setupid=CustomObjects\">{0}</a></th>", dr["DisplayName"].ToString(), dr["EntityId"].ToString());
                //string participantDef = "&nbsp;";
                //string participantJoins="&nbsp;";
                ParticipantDefinition partDef = WfSchemeManager.GetParticipantor(proc.ID, entity.ActivityCode);
                if (partDef != null)
                {
                    //if (partDef.ParticipantorTypeCode == 0)
                    //    participantDef = "主办";
                    //if (partDef.ParticipantorTypeCode == 1)
                    //    participantDef = "会签";
                    //if (partDef.ParticipantorTypeCode == 2)
                    //    participantDef = "单人签发";
                    //participantJoins = partDef.MValue;
                    tRow += string.Format("<td class=\" dataCell  \">{0}</td>", partDef.MPeopleName);
                }
                else
                    tRow += "<td class=\" dataCell  \">&nbsp;</td>";

                ActivityRightDefinition actRightDef = WfSchemeManager.GetStepRight(_caller, proc.ID, entity.ID);
                if (actRightDef!=null)
                {
                    tRow += "<td class=\" dataCell  \" nowrap=\"nowrap\">已设置</td>";
                }
                else
                {
                    tRow += "<td class=\" dataCell  \" nowrap=\"nowrap\">[未设置]</td>";
                }
                //tRow += string.Format("<td class=\" dataCell  \">{0}</td>", participantDef);
                tRow += "</tr>";

                tBody += tRow;
                mode++;
                iRow++;
            }
        }
        void GetRules(ProcessDefinition proc)
        { 
             int mode = 2;
            //CallContext caller = AppDataSource.GetCallContext();
            //QueryExpression queryExp = new QueryExpression();
            //Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            //EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
             string sql = string.Format("select * from WFRule Where ProcessId='{0}'",proc.ID);
            string retURL = HttpUtility.UrlEncode( Request.RawUrl);
            DataSet ds = DatabaseTool.GetDataSet(_caller.CustomerID,sql);
            //string objectId = "";
            int iRow = 1;
            string procId = proc.ID.ToString();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);

                string id = StringUtil.GetString(dr["RuleId"]);
                string name = StringUtil.GetString(dr["Name"]);
                //action
                //tRow += string.Format("<td  class=\" actionColumn  \"><a title=\"编辑 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('')\">编辑</a>&nbsp;|&nbsp;<a class=\"actionLink\" href=\"ProcStepFieldPriv.aspx?t=121&procid={0}&stepid={1}&retURL={2}\" title=\"流程、正文附件、字段访问权限 - 记录  - \">权限</a></td>",procId, entity.ID, retURL);
                string ruleCode = StringUtil.GetString(dr["RuleCode"]);
               
                tRow += string.Format("<td  class=\" actionColumn  \"><a class=\"actionLink\" href=\"#\" onclick=\"showCondition('{0}','{1}','{2}')\" title=\"设置转移条件 - {3} - {4}\">设置条件</a></td>", id, this.ProcessId, ruleCode, name, iRow);

                //name
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", name);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", "");
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", "");
                tRow += "</tr>";

                this.RuleHTML += tRow;
                mode++;
                iRow++;
            }
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        void GetAccessControl()
        {
            int mode = 1;
            List<ContentAccessItem> rules = WFInstanceAcessControl.GetContentAccessControl(_caller, new Guid(this.ProcessId));
            int sortNumber = 1;
            _retURL = HttpUtility.UrlEncode(Request.RawUrl);
            StringBuilder sb = new StringBuilder();
            foreach (ContentAccessItem aItem in rules)
            {
                //Entity entity = question.InnerEntity;

                sb.Append(RenderStartRow(mode));
                //int stateCode = MainUtil.GetInt(entity.Fields["QuestionType"].Value, 0);
                string objectName = aItem.ObjectName;

                string objectTypeName = "";
                int objectTypeCode = aItem.ObjectTypeCode;
                if (objectTypeCode == ObjectTypeCodes.SystemUser)
                    objectTypeName = "用户";
                if (objectTypeCode == ObjectTypeCodes.BusinessUnit)
                    objectTypeName = "部门";
                if (objectTypeCode == ObjectTypeCodes.Role)
                    objectTypeName = "角色";
                if (objectTypeCode == ObjectTypeCodes.Group)
                    objectTypeName = "组";
                if (objectTypeCode == 0)
                    objectTypeName = "组织";
                string rightName = "";
                // int required1 = MainUtil.GetInt(entity.Fields["QuestionType"].Value, -1);
                // if (required1 == 0)
                //     required = "必填";
                //action
                // if (stateCode == 2)
                //tRow += string.Format("<td  class=\" actionColumn  \">{0}</td>", "");
                // else
                string deleteURL = string.Format("/setup/own/deleteredirect.aspx?delID={0}&type={1}&retURL={2}", aItem.Id, ObjectTypeCodes.WFProcessInstanceAccessControl, this._retURL);
                if (aItem.Right == ContentRight.Owner || aItem.IsEveryone || aItem.IsMyBusinessUnit)
                {
                    sb.Append("<td  class=\" actionColumn  \"></td>");
                }
                else//<a title=\"编辑\" class=\"actionLink\" href=\"javascript:editQuestion('{0}')\">编辑</a> | 
                    sb.AppendFormat("<td  class=\" actionColumn  \"><a title=\"删除\" class=\"actionLink\" onclick=\"return confirmDelete();\" href=\"{2}\">删除</a></td>", aItem.Id, sortNumber, deleteURL);
                //name
                sb.AppendFormat(" <td class=\"dataCell\">{0}</td>", objectTypeName);
                sb.AppendFormat(" <td class=\"dataCell\">{0}</td>", objectName);
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["QuestionNumber"].Value));
                sb.AppendFormat(" <td class=\"dataCell\">{0}</td>", createRights(aItem));
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ExecutorIdentityName"].Value));
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", required);
                // tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["CreatedOn"].Value));
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ModifiedOn"].Value));
                sb.AppendFormat("</tr>");
                mode++;
                sortNumber++;
            }
            MembersHTML = sb.ToString();
        }
        string createRights(ContentAccessItem aItem)
        {
            ContentRight rightCode = aItem.Right;
            StringBuilder sb = new StringBuilder();
            int objectTypeCode = aItem.ObjectTypeCode;
            if (aItem.Right == ContentRight.Owner)
            {
                sb.Append("创建人");
                //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='3' onchange=\"changeRight('{0}','{1}',this.value)\" {2} />所有人", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Owner) ? "checked" : "");
            }
            else
            {
                sb.AppendFormat("<input type='radio' name='item_right_{1}' value='0' onchange=\"updateInstanceAccess('{0}',this.value)\" {2} />没有权限", aItem.Id, aItem.ObjectId, (rightCode == ContentRight.None) ? " checked " : "");
                //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='2' onchange=\"updateInstanceAccess('{0}',this.value)\" {2} />查看权限", aItem.Id, aItem.ObjectId, (rightCode == ContentRight.Read) ? "checked" : "");
                //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='4' onchange=\"updateInstanceAccess('{0}',this.value)\" {2} />查看/上传", aItem.Id, aItem.ObjectId, (rightCode == ContentRight.Collaborator) ? "checked" : "");
                sb.AppendFormat("<input type='radio' name='item_right_{1}' value='32' onchange=\"updateInstanceAccess('{0}',this.value)\" {2} />管理", aItem.Id, aItem.ObjectId, (rightCode == ContentRight.Manage) ? "checked" : "");
                //if (!aItem.IsEveryone)
                //    sb.AppendFormat("<input type='radio' name='item_right_{1}' value='3' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />所有人", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Owner) ? "checked" : "");
            }
            /*
        sb.AppendFormat("<select name='item_right' onchange=\"changeRight('{0}',this.value)\">",aItem.Id);
        sb.AppendFormat("<option value='{0}' {2}>{1}</option>", "0", "没有查看权限", (rightCode == ContentRight.None) ? "selected" : "");
        sb.AppendFormat("<option value='{0}' {2}>{1}</option>", "1", "查看权限", (rightCode == ContentRight.Read) ? "selected" : "");
        sb.AppendFormat("<option value='{0}' {2}>{1}</option>", "2", "协作者", (rightCode == ContentRight.Collaborator) ? "selected" : "");
        sb.AppendFormat("<option value='{0}' {2}>{1}</option>", "3", "所有人", (rightCode == ContentRight.Owner) ? "selected" : "");
        sb.Append("</select>");
        */
            return sb.ToString();
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string RuleHTML { get; set; }

        public string ProcessId { get; set; }
        public string ProcessName { get; set; }
        public string Description { get; set; }
        public string EntityObjectName { get; set; }
        public string EntityObjectId { get; set; }

        public string StateCodeName { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedByName { get; set; }
        public string FolderName { get; set; }

        public string CreatedOn { get; set; }
        public string ModifiedOn { get; set; }

        public string MembersHTML { get; set; }
    }
}