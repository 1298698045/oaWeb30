using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
using OA.Web.UI.FieldControls;
using Supermore.Configuration;
using Supermore.Organization;

namespace WebClient.apps.wf
{
    public partial class createInstancePop : System.Web.UI.Page
    {
        Guid identityId = Guid.Empty;
        CallContext caller = null;
        string entityType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            entityType = Request["entityType"];
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
                identityId = new Guid(caller.UserID);
            }
            if (Request["save"] != null)
            {
                CreateInstance();
            }
            //RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", Request["retURL"]);
            //GetWFCategory();
            //RenderGrid();
            Guid bussinessUnitId = caller.BussinessUnitId;
            this.BusinessUnitId = bussinessUnitId.ToString();
            this.BusinessUnitName = caller.BussinessUnitName;
          
            if (string.IsNullOrEmpty(this.BusinessUnitId))
            {
                SystemUser user = SecurityAuth.GetSystemUser(new Guid(caller.UserID));
                if (user != null)
                {
                    bussinessUnitId = user.BusinessUnitId;
                    this.BusinessUnitId = bussinessUnitId.ToString();
                }
            }
            if (string.IsNullOrEmpty(this.BusinessUnitName))
            {
                Entity entity = SecurityAuth.GetDepartment(caller, bussinessUnitId);
                if (entity != null)
                {
                    this.BusinessUnitName = entity.Name;
                }
            }
            this.ProcessName = Request["name"];

            /*
            BusinessUnitLookup lookup = new BusinessUnitLookup();
            lookup.EntityCode = "10";
            lookup.FieldLabel = "部门";
            lookup.FieldValue = this.BusinessUnitId;
            lookup.FieldName = "businessUnit";
            lookup.FieldValueText = this.BusinessUnitName;
            lookup.Render();
            businessUnitIdControlHtml = lookup.ControlHtml;
            */
            //businessUnitIdControlHtml = string.Format("<select id='businessUnit_lkid' name='businessUnit_lkid'><option value='{0}'>{1}</option><select>", this.BusinessUnitId, this.BusinessUnitName);
            SystemUserManager sysuserManager= new SystemUserManager();
            List<BusinessUnit> list = sysuserManager.GetSystemUserBusinessUnits(caller);
            var sb = string.Format("<select id='businessUnit_lkid' name='businessUnit_lkid'><option value='{0}'>{1}</option>", this.BusinessUnitId, this.BusinessUnitName);
            foreach (BusinessUnit item in list)
            {
                sb += string.Format("<option value='{0}'>{1}</option>", item.ID, StringUtil.GetString(item.Name));
            }
            sb += "</select>";
            sb += string.Format("<input name='BusinessUnitName' id='BusinessUnitName' type='hidden' value=\"{0}\">", this.BusinessUnitName);
            businessUnitIdControlHtml = sb;

            this.UserFullName = WebContext.UserFullName;
            bool isDefaultName = Settings.GetBoolSetting("WF.ProcessInstance.DefaultName", true);
            if (isDefaultName)
                this.InstanceName = string.Format("{0} {1} {2} {3}", this.ProcessName, this.BusinessUnitName, this.UserFullName,DateTime.Now.ToString("yyyy-MM-dd"));
            //else
           

        }
        public void CreateInstance()
        {
            string instanceName = Request["instanceName"];
            string procTempId = Request["pr_template_id"];
            string businessUnitId = Request["businessUnit_lkid"];
            string processName = Request["processName"];
            if (string.IsNullOrEmpty(instanceName) || string.IsNullOrEmpty(procTempId))
            {
                return;
            }
            
            bool isDefaultName = Settings.GetBoolSetting("WF.ProcessInstance.DefaultName", true);
            if (!isDefaultName)
            {
                //instanceName = string.Format("{0} {1}", processName, instanceName);
                //instanceName = string.Format("{0} {1}", processName, instanceName);
            }
            
            Guid identityUnitId = Guid.Empty;
            if (string.IsNullOrEmpty(businessUnitId))
                identityUnitId = caller.BussinessUnitId;
            else
                identityUnitId = new Guid(businessUnitId);

            Guid processInstanceId = Guid.NewGuid();
            Guid processSchemeId = new Guid(procTempId);
            string strDeadline = Request["instanceDeadline"];

            
            //Guid identityId
            int deadline = MainUtil.GetInt(strDeadline, 3);
            string desc = Request["desc"];
            int priority = 0;
            priority = MainUtil.GetInt(Request["priority"], 0);
            instanceName = instanceName.Replace("'", "");
            instanceName = instanceName.Replace("\"", "“");
            //bool isCreated = WfInstanceManager.CreateInstance(processName,deadline, processInstanceId, processSchemeId, identityId);
            WorkflowInit.Runtime.CreateInstance(instanceName.Trim(), deadline, processInstanceId, processSchemeId, identityId, identityUnitId, desc, priority);
            //创建对应的实体
            CreateEntity(processInstanceId, processSchemeId, instanceName.Trim(), identityUnitId);
            string t = Request["t"];
            if (string.IsNullOrEmpty(t))
                t = "a0M";
           // string url = string.Format("/{0}/detail?source=i&id={1}&retURL=/{0}/o", t, processInstanceId);
           // this.Response.Redirect(url);
            string scriptBlock = string.Format("<script> parent.window.location='/{0}/detail?source=i&id={1}&retURL=/{0}/o';</script>", t, processInstanceId);
            this.Response.Clear();
            this.Response.Write(scriptBlock);
           
        }
        void CreateEntity(Guid processInstanceId, Guid processSchemeId, string processName, Guid identityUnitId,string autoNumber="")
        {
            //processSchemeId
            try
            {
                ProcessDefinition proc = WfSchemeManager.GetProcess(processSchemeId);
                Template temp = TemplateManager.GetTemplate(caller.OrganizationId, proc.EntityObjectId);
                Entity entity = new Entity(processInstanceId, temp.ID, caller.OrganizationId);
                entity.BeginEdit();
                entity.Fields[temp.NameField].Value = processName;
                entity.Fields["CreatedBy"].Value = caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;

                //entity.Fields[temp.NameField].Value = processName;

                if (entity.Fields["Title"] != null)
                    entity.Fields["Title"].Value = processName;

                if (entity.Fields["OwningUser"] != null)
                    entity.Fields["OwningUser"].Value = caller.UserID;

                if (entity.Fields["StatusCode"] != null)
                    entity.Fields["StatusCode"].Value = 0;
                //
                if (entity.Fields["AutoNumber"] != null)
                    entity.Fields["AutoNumber"].Value = autoNumber;

                //获取部门字段
                try
                {
                    Supermore.EntityFramework.Templates.TemplateField[] BusinesUnityTypeFields = temp.GetBusinesUnityTypeFields();
                    if (BusinesUnityTypeFields != null)
                    {
                        foreach (Supermore.EntityFramework.Templates.TemplateField tf in BusinesUnityTypeFields)
                        {
                            entity.Fields[tf.Name].Value = identityUnitId;
                        }
                    }
                    //默认值
                    Supermore.EntityFramework.Templates.TemplateField[] defFields = temp.Fields;
                    if (defFields != null)
                    {
                        foreach (Supermore.EntityFramework.Templates.TemplateField tf in defFields)
                        {

                            if (tf.IsStandardField)
                                continue;
                            if (!string.IsNullOrEmpty(tf.DefaultValue))
                                entity.Fields[tf.Name].Value = tf.DefaultValue.Trim();
                        }
                    }
                }
                catch (Exception ex2)
                {
                    Supermore.Diagnostics.Trace.LogException(ex2);
                }

                bool isSaved = entity.EndEdit();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        void UpdateEntity(Guid processInstanceId, Guid processSchemeId, string processName)
        {
            //processSchemeId
            try
            {
                ProcessDefinition proc = WfSchemeManager.GetProcess(processSchemeId);
                Template temp = TemplateManager.GetTemplate(caller.OrganizationId, proc.EntityObjectId);
                Entity entity = EntityManager.GetEntity(caller, temp, processInstanceId);
                entity.BeginEdit();
                entity.Fields[temp.NameField].Value = processName;
                entity.Fields["CreatedBy"].Value = caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                entity.EndEdit();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }

        public string UserFullName { get; set; }

        public string InstanceName { get; set; }
        public string ProcessName { get; set; }

        string businessUnitIdControlHtml = "";
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public string BusinessUnitIdControlHtml
        {
            get { return businessUnitIdControlHtml; }
            set { businessUnitIdControlHtml = value; }
        }
    }
}