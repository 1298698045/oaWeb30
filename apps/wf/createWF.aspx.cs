using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using Supermore;
using Supermore.Data;
using Supermore.Contents;
using Supermore.EntityFramework.Entities;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
using Supermore.Web.UI.WebControls;
using Supermore.Security;

namespace WebClient.apps.wf
{
    public partial class createWF : System.Web.UI.Page
    {
        private CallContext _caller = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.OwnerName = WebContext.UserFullName;
            _caller = AppDataSource.GetCallContext();
            this.ShareAll = " checked=\"checked\" ";
            // <input type="hidden" value="" id="cancelURL" name="cancelURL">
            //<input type="hidden" value="" id="retURL" name="retURL">
            if (!Page.IsPostBack)
            {
                string retURL = Request["retURL"];
                if (string.IsNullOrEmpty(retURL))
                    retURL = "/121/o";
                this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
                this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("retURL", retURL);
            }
            if (Request["cancel"] != null)
            {
                string cancelURL= Request["cancelURL"];
                Response.Redirect(cancelURL);
            }
            if (Request["id"] != null)
            {
                this.ProcessId = Request["id"];

                GetData();
            }
            else
                this.ProcessName = "新建流程定义";

            if (Request["save"] != null)
            {
                SaveData();
            }
            
        }
        bool isClone = false;

        void SaveData()
        {
            isClone = (Request["clone"] == "1") ? true : false;
            string id = Request["id"];
            Guid userId = Guid.Empty;
            if (!string.IsNullOrEmpty(WebContext.UserId))
            {
                userId = new Guid(WebContext.UserId);
            }
            string procName = Request["wfName"];

            Guid proceId = Guid.NewGuid();
            string desc = Request["cpn4"];

            try
            {
                //string strTypeCode = Request["cpn2"];
                int procTypeCode = 0;// MainUtil.GetInt(strTypeCode, 0);
                Guid folderId = MainUtil.GetGuid(Request["parent_lkid"], Guid.Empty);
                //Guid entityObjectId = MainUtil.GetGuid(Request["objectId_lkid"], Guid.Empty);
                //string objectIdName = Request["objectId"];
                string folderIdName = Request["parent"];
                string entityLayoutName = Request["entityLayout"];
                Guid formId = MainUtil.GetGuid(Request["entityLayout_lkid"], Guid.Empty);
                string priority = Request["priority"];
                if (string.IsNullOrEmpty(procName))
                    return;
                //if (string.IsNullOrEmpty(objectIdName))
                //    return;
                if (string.IsNullOrEmpty(entityLayoutName))
                    return;
                //if (string.IsNullOrEmpty(objectIdName))
                //    return;
                if (string.IsNullOrEmpty(folderIdName))
                    return;

                Entity formTemp = EntityManager.GetEntity(_caller, EntityTemplateIDs.EntityForm, formId);
                Guid entityObjectId = MainUtil.GetGuid(formTemp.Fields["EntityId"].Value, Guid.Empty);

                if (string.IsNullOrEmpty(id))
                {
                    bool isTrue = WfSchemeManager.CreateProcess(proceId, procName, procTypeCode, desc, userId, folderId, entityObjectId, formId);
                    if (isTrue)
                    {
                        Response.Redirect(string.Format("/apps/flowdesigner/editors/WFlowDesigner.aspx?id={0}&procName=", proceId.ToString(), procName));
                    }
                }
                else
                {

                    Entity entity = EntityManager.GetEntity(_caller, ObjectTypeCodes.WFProcess, new Guid(id));

                    entity.BeginEdit();
                    entity.Fields["Name"].Value = procName;
                    entity.Fields["Description"].Value = Request["description"];
                    entity.Fields["FolderId"].Value = folderId;
                    entity.Fields["EntityObjectId"].Value = entityObjectId;
                    entity.Fields["EntityLayoutId"].Value = formId;
                    if (!string.IsNullOrEmpty(priority))
                        entity.Fields["Priority"].Value = priority;
                    else
                        entity.Fields["Priority"].Value = 0;

                    if (Request["requireAttach"] != null)
                    {
                        if (entity.Fields["RequireAttach"] != null)
                            entity.Fields["RequireAttach"].Value = 1;
                    }
                    else
                    {
                        entity.Fields["RequireAttach"].Value = 0;
                    }
                    if (entity.Fields["Position"] != null)
                        entity.Fields["Position"].Value = MainUtil.GetInt(Request["Position"], 1000);
                    string fshare = Request["fshare"];
                    int shareCode = 1;
                    if (!string.IsNullOrEmpty(fshare))
                    {
                        if (fshare == "fsharegroups")
                            shareCode = 0;
                        else //"fshareall"
                            shareCode = 1;
                        //shareCode = MainUtil.GetInt(fshare,1);
                    }
                    else
                    {
                        shareCode = 1;
                    }

                    if (entity.Fields["ShareAll"] != null)
                    {
                        entity.Fields["ShareAll"].Value = shareCode;
                        if (fshare == "fsharegroups") //部分
                        {
                            string duel1 = Request["duel1"];
                            WfSchemeManager.AddPrcessAccess(_caller, entity.ID, duel1);
                        }
                    }
                    entity.Fields["ModifiedBy"].Value = _caller.UserID;
                    entity.Fields["ModifiedOn"].Value = DateTime.Now;
                    bool isSaved = entity.EndEdit();

                    string sql = "UPDATE  WFProcess SET EntityType=(SELECT ObjectTypeCode FROM Entity WHERE EntityId='{0}') WHERE ProcessId='{1}'";
                    sql = string.Format(sql, entityObjectId, id);
                    int iRes = AppDataSource.ProcessDBUpdate(_caller, sql, null);
                   
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);


            }


            Response.Redirect(string.Format("/121/detail?id={0}&retURL=%2f121%2fo", id));
        }

        void GetData()
        {
            ProcessDefinition proc = WfSchemeManager.GetProcess(_caller,new Guid(this.ProcessId));
            this.ProcessName = proc.Name;
            this.Description = proc.Description;
            int state = proc.StateCode;
            this.FolderId = proc.FolderId.ToString();
            this.EntityObjectId = proc.EntityObjectId.ToString();
            this.EntityObjectName = proc.EntityObjectName;
            this.EntityLayoutId = proc.EntityLayoutId.ToString();
            this.EntityLayoutName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.EntityForm, proc.EntityLayoutId);
            this.CreatedByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, proc.CreatedBy);
            this.ModifiedByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, proc.ModifiedBy);
            this.FolderName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.ItemTree, proc.FolderId);
            this.Position = proc.DisplayOrder;
            if (proc.RequireAttach)
            {
                this.RequireAttachHTML = " checked='checked' ";
            }

            EntityAccessObjectCollection accessObjects = new EntityAccessObjectCollection();
            if (proc.ShareAll == 1)
            {
                this.ShareGroups = "";
                this.ShareAll = " checked=\"checked\" ";
                this.ShareScriptHTML="<script>document.getElementById('fsharefshareall').checked = true;</script>";
            }
            else
            {
                this.ShareGroups = " checked=\"checked\" ";
                this.ShareScriptHTML = "<script>Sfdc.Dom.show('duel');document.getElementById('fsharefsharegroups').checked = true;</script>";
                this.ShareAll = " ";
                accessObjects = WfSchemeManager.GetPrcessAccessObjects(_caller, proc.ID);
            }
            this.ModifiedOn = proc.ModifiedOn;
            this.CreatedOn = proc.CreatedOn;

            StateCodeName = "草稿";
            if (state == 1)
                StateCodeName = "可用";
            
            
            GroupsListBoxRender listboxData = new GroupsListBoxRender();
            listboxData.ListValue = accessObjects.ToString();
            listboxData.Render(_caller);

            int c = 0;
            if (accessObjects.Count > 0)
                c = 0;

            string selectOptions =  listboxData.SelectedOptions;
            foreach (EntityAccessObject accessItem in accessObjects)
            {
                if (accessItem.ObjectTypeCode == 8)
                {
                    if (c > 0)
                        selectOptions += ",";
                    //selectOptions += string.Format("['U', '用户：{0}', 'U:{1}', '{0}', existingSelduel_select_0, '']", accessItem.ObjectIdName, accessItem.ObjectId.ToString().ToUpper());
                    selectOptions += string.Format("<option value='U:{1}'>用户：{0}</option>", accessItem.ObjectIdName, accessItem.ObjectId.ToString().ToUpper());
                    c++;
                }
                if (accessItem.ObjectTypeCode == ObjectTypeCodes.BusinessUnit)
                {
                    if (c > 0)
                        selectOptions += ",";
                    selectOptions += string.Format("<option value='B:{1}'>部门：{0}</option>", accessItem.ObjectIdName, accessItem.ObjectId.ToString().ToUpper());
                    c++;
                }
                if (accessItem.ObjectTypeCode == ObjectTypeCodes.Role)
                {
                    if (c > 0)
                        selectOptions += ",";
                    selectOptions += string.Format("<option value='A:{1}'>角色：{0}</option>", accessItem.ObjectIdName, accessItem.ObjectId.ToString().ToUpper());
                    c++;
                }
                if (accessItem.ObjectTypeCode == ObjectTypeCodes.Group)
                {
                    if (c > 0)
                        selectOptions += ",";
                    selectOptions += string.Format("<option value='R:{1}'>小组：{0}</option>", accessItem.ObjectIdName, accessItem.ObjectId.ToString().ToUpper());
                    c++;
                }
            }

            this.SelectedOptions = selectOptions;
            this.AvailableSelectOptions = listboxData.AvailableSelectOptions;

            RenderAttachRightCodeControlHTML(proc.Priority);
           
        }

        void RenderAttachRightCodeControlHTML(int priority)
        {
            PriorityHTML = "";
            if (priority == 0)
            {
                PriorityHTML += "<option value='0' selected>一般</option>";
                PriorityHTML += "<option value='1' >紧急</option>";
                PriorityHTML += "<option value='2' >加急</option>";
            }
            else if (priority == 1)
            {
                PriorityHTML += "<option value='0' >一般</option>";
                PriorityHTML += "<option value='1' selected>紧急</option>";
                PriorityHTML += "<option value='2' >加急</option>";
            }
            else if (priority == 2)
            {
                PriorityHTML += "<option value='0' >一般</option>";
                PriorityHTML += "<option value='1' selected>紧急</option>";
                PriorityHTML += "<option value='2' >加急</option>";
            }
        }

        public string ProcessId { get; set; }
        public string ProcessName { get; set; }
        public string Description { get; set; }
        public int Priority { get; set; }
        public int Position { get; set; }

        public string EntityObjectId { get; set; }
        public string EntityObjectName { get; set; }

        public string EntityLayoutId { get; set; }
        public string EntityLayoutName { get; set; }
                

        public string StateCodeName { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedByName { get; set; }
        public string FolderName { get; set; }
        public string FolderId { get; set; }
        public string CreatedOn { get; set; }
        public string ModifiedOn { get; set; }
        /// <summary>
        /// 所有用户可见
        /// </summary>
        public string ShareAll { get; set; }
        /// <summary>
        /// 指定用户可见
        /// </summary>
        public string ShareGroups { get; set; }

        public string ShareScriptHTML { get; set; }
        public string PriorityHTML { get; set; }

        public string AvailableSelectOptions { get; set; }

        public string SelectedOptions { get; set; }

        public string RequireAttachHTML { get; set; }
        public string HiddenAttachHTML { get; set; }

        private string ownerName = "";
        public string OwnerName {
            get { return ownerName; }
            set { ownerName = value; }
        }
    }
}