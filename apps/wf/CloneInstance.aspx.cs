using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OA.Web.UI.FieldControls;

using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.Queries;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework;
using Supermore.Security;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
namespace WebClient.apps.wf
{
    public partial class CloneInstance : System.Web.UI.Page
    {
        Guid identityId = Guid.Empty;
        CallContext caller = null;
        string entityType = "";
        string _parentInstanceId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           // entityType = Request["entityType"];
            if (Request["parentId"] != null)
                _parentInstanceId = Request["parentId"];
            if (Request["parentInstanceId"] != null)
                _parentInstanceId = Request["parentInstanceId"];

            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                if (string.IsNullOrEmpty(cancelURL))
                    cancelURL = Request["retURL"];
                if (string.IsNullOrEmpty(cancelURL))
                    cancelURL = "/apps/wf/MyApplyList.aspx?t=122";
                Response.Redirect(cancelURL);
            }
            caller = AppDataSource.GetCallContext();
            if (!string.IsNullOrEmpty(WebContext.UserId))
            {
                identityId = new Guid(WebContext.UserId);
            }

            ProcessInstance procInstance = WfInstanceManager.GetProcessInstance(new Guid(_parentInstanceId));
            //entityType = procInstance.ProcessScheme.FolderId.ToString();
            if (procInstance != null)
            {
                entityType = procInstance.ProcessScheme.EntityType.ToString();
                this.ParentInstanceName = procInstance.Name;
            }
            if (Request["goNext"] != null)
            {
                CreateInstance();
            }
            RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", Request["retURL"]);
           // GetWFCategory();
            RenderGrid();

            SystemUser user = SecurityAuth.GetSystemUser(new Guid(caller.UserID));
            this.BusinessUnitId = user.BusinessUnitId.ToString();
            Entity entity = SecurityAuth.GetDepartment(caller, user.BusinessUnitId);
            if (entity != null)
            {
                this.BusinessUnitName = entity.Name;
            }

            BusinessUnitLookup lookup = new BusinessUnitLookup();
            lookup.EntityCode = "10";
            lookup.FieldLabel = "部门";
            lookup.FieldValue = this.BusinessUnitId;
            lookup.FieldName = "businessUnit";
            lookup.FieldValueText = this.BusinessUnitName;
            lookup.Render();
            businessUnitIdControlHtml = lookup.ControlHtml;

            this.UserName = WebContext.UserFullName;
        }

        public void CreateInstance()
        {
            string processName = Request["instanceName"];
            string procTempId = Request["pr_template_id"];
            string businessUnitId = Request["businessUnit_lkid"];
            if (string.IsNullOrEmpty(processName) || string.IsNullOrEmpty(procTempId))
            {
                return;
            }
            Guid processInstanceId = Guid.NewGuid();
            Guid processSchemeId = new Guid(procTempId);
            string strDeadline = Request["instanceDeadline"];

            Guid identityUnitId = new Guid(businessUnitId);
            //Guid identityId
            int deadline = MainUtil.GetInt(strDeadline, 3);
            string desc = Request["desc"];

            int priority = 0;
            priority = MainUtil.GetInt(Request["priority"], 0);
            //bool isCreated = WfInstanceManager.CreateInstance(processName,deadline, processInstanceId, processSchemeId, identityId);
            WorkflowInit.Runtime.CreateInstance(processName, deadline, processInstanceId, processSchemeId, identityId, identityUnitId, desc,priority);
            //设置父实例
            Guid parentInstanceId = new Guid(_parentInstanceId);
            WfInstanceManager.SetParentInstance(processInstanceId, parentInstanceId);
            //创建对应的实体
            CreateEntity(processInstanceId, processSchemeId, processName);
            string t = Request["t"];
            if (string.IsNullOrEmpty(t))
                t = "122";
            //string url = string.Format("/apps/wf/WfApproveContainer.aspx?t={1}&InstanceId={0}&RuleLogId={0}", processInstanceId,t);
            string url = string.Format("/{0}/detail?source=i&id={1}&retURL=/{0}/o", t, processInstanceId);
            this.Response.Redirect(url);
            //this.Response.Redirect("WfInstanceEdit.aspx?t=122&id=" + processInstanceId.ToString());
        }
        void CreateEntity(Guid processInstanceId, Guid processSchemeId, string processName)
        {
            //processSchemeId
            try
            {

                
                ProcessDefinition proc = WfSchemeManager.GetProcess(processSchemeId);
                Template temp = TemplateManager.GetTemplate(caller.OrganizationId, proc.EntityObjectId);

                Entity parentEntity = EntityManager.GetEntity(caller, temp, new Guid(_parentInstanceId));

                Entity entity = new Entity(processInstanceId, temp.ID, caller.OrganizationId);
                entity.BeginEdit();

                foreach (Field field in parentEntity.Fields)
                {
                    if (!field.Name.Equals("ValueId",StringComparison.InvariantCultureIgnoreCase))
                        entity.Fields[field.Name].Value = field.Value;
                }

                if (entity.Fields["Approve3"] != null)
                    entity.Fields["Approve3"].Value = "";
                if (entity.Fields["Approve5"] != null)
                     entity.Fields["Approve5"].Value = "";
                if (entity.Fields["Approve6"] != null)
                    entity.Fields["Approve6"].Value = "";
                
                                
                entity.Fields[temp.NameField].Value = processName;
                entity.Fields["CreatedBy"].Value = caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                entity.EndEdit();
            }
            catch(Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }
        string _category = "";
        void GetWFCategory()
        {
            EntityCollection entities = ItemTreeManager.GetFolders(caller, ObjectTypeCodes.WFProcess);
            foreach (Entity entity in entities)
            {
                _category += string.Format("<option value='{0}'>{1}</option>", entity.ID.ToString(), entity.Name);
            }
        }

        string tBody = "";
        void RenderGrid()
        {
            int mode = 2;

            QueryExpression queryExp = new QueryExpression();

            ConditionExpression cond = new ConditionExpression();
            cond.AttributeName = "StateCode";
            cond.Operator = ConditionOperator.Equal;
            cond.Values = new object[] { 1 };
            queryExp.Criteria.Add(cond);
            int iRow = 0;

            if (!string.IsNullOrEmpty(entityType))
            {
                cond = new ConditionExpression();
                cond.AttributeName = "EntityType";
                cond.Operator = ConditionOperator.Equal;
                cond.Values = new object[] { entityType };
                queryExp.Criteria.Add(cond);

                queryExp.AddOrder("Priority", OrderType.Descending);
            }
            else
            {

                queryExp.AddOrder("FolderId", OrderType.Ascending);
                //queryExp.AddOrder("FolderId", OrderType.Ascending);
            }
            Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
            foreach (Entity entity in entities)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);

                //action
                tRow += string.Format("<td  class=\" dataCell  \" scope=\"row\"><a title=\"预览 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('/apps/flowdesigner/editors/monitor2.aspx?schemeId={0}', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false)\">预览</a></td>", entity.ID);
                //name
                if (!string.IsNullOrEmpty(entityType) && iRow == 0)
                    tRow += string.Format(" <td class=\"dataCell\"><input type=\"radio\" value=\"{0}\" name=\"pr_template_id\" id=\"pr_template_id{0}\"  processname=\"{1}\" onclick='selectProcess(this)' checked /><label  for=\"pr_template_id{0}\">{1}</label></td>", entity.ID, entity.Name);
                else
                    tRow += string.Format(" <td class=\"dataCell\"><input type=\"radio\" value=\"{0}\" name=\"pr_template_id\" id=\"pr_template_id{0}\" processname=\"{1}\" onclick='selectProcess(this)' /><label  for=\"pr_template_id{0}\">{1}</label></td>", entity.ID, entity.Name);
                //action
                // tRow += string.Format(" <th scope=\"row\" class=\" dataCell  \"><a href=\"ViewObject.aspx?id={1}&setupid=CustomObjects\">{0}</a></th>", dr["DisplayName"].ToString(), dr["EntityId"].ToString());

                tRow += "<td class=\" dataCell  \">&nbsp;</td>";
                //tRow += string.Format("<td class=\" dataCell  \">{0}</td>", StringUtil.GetString(entity.Fields["Description"].Value));
                //tRow += "<td class=\" dataCell  \">&nbsp;</td>";

                tRow += "</tr>";
                tBody += tRow;

                iRow++;
                mode++;
            }
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        public string BodyText
        {
            get { return tBody; }
        }
        public string WFCategory
        {
            get { return _category; }
        }
        public string UserName { get; set; }
        string businessUnitIdControlHtml = "";
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public string BusinessUnitIdControlHtml
        {
            get { return businessUnitIdControlHtml; }
            set { businessUnitIdControlHtml = value; }
        }
        /*public string InstanceName { set; get; }*/
        public string ParentInstanceId { set { _parentInstanceId = value; } get { return _parentInstanceId; } }
        public string ParentInstanceName { set; get; }
    }
}