using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;
using Supermore.Contents;
using Supermore.Security;
using Supermore.Security.SecurityControl;
using System.Text;

namespace WebClient.apps.scontent
{
    public partial class FolderEdit : System.Web.UI.Page
    {
        CallContext caller = null;
        //string businessUnitIdControlHtml = "";
        string ownerName = "";
        int entityTypeCode = 100201;
        string oType = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.FolderName = "新建文件夹";
            caller = AppDataSource.GetCallContext();
            this.ownerName = caller.UserName;
            oType = Request["oType"];
            this.SortNumber = 1000;
            string strType = Request["t"];

            if (Request["save"] != null)
            {
                SaveData(false);
            }
            if (Request["save_new"] != null)
            {
                SaveData(true);
            }
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                Response.Redirect(cancelURL);
            }
            
            if (!Page.IsPostBack)
            { 
                string retURL = Request["retURL"];
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", string.Format("/00l/e?t={0}&retURL={1}", strType,retURL));
            }
           
            GetData();
            //LoadRoles();
            //GetAllPublicGroups();
           
            entityTypeCode = MainUtil.GetInt(oType, 100201);
            EntityCollection entities = ItemTreeManager.GetAllFolders(caller, entityTypeCode);
            this.folderPicker.Caller = caller;
            this.folderPicker.EnableAccess = false;
            this.folderPicker.DataSource = entities;
            this.folderPicker.SelectValue = this.ParentFolderId;
            
        }
        string _retURL = "";
        string strId = "";
        void GetData()
        {
            this.NeedCensorHTML = "  ";
            this.AllowCommentHTML = "   ";

            strId = Request["id"];
            if (string.IsNullOrEmpty(strId)) return;
            Entity entity = null;
            this.FolderId = strId;
            entity = ItemTreeManager.GetFolder(caller,new Guid(strId));
            this.FolderName = entity.Name;
            bool isPublic = MainUtil.GetBool(entity.Fields["IsPublic"].Value,false);
            this.ParentFolderId = StringUtil.GetString(entity.Fields["ParentId"].Value);
            this.SortNumber = MainUtil.GetInt(entity.Fields["SortNumber"].Value, 1000);
            this.objectTypeCodeId = MainUtil.GetInt(entity.Fields["objectTypeCode"].Value, entityTypeCode);
            bool needCensor = MainUtil.GetBool(entity.Fields["NeedCensor"].Value, false);
            if (needCensor)
                this.NeedCensorHTML = " checked='checked' ";
            bool allowComment = MainUtil.GetBool(entity.Fields["AllowComment"].Value, false);
            if (allowComment)
                this.AllowCommentHTML = " checked='checked' ";
            GetAccessControl();
            AccessRuleCollection rules = AuthorizationManager.GetAccessRules(new Guid(caller.CustomerID), entity.ID);

            foreach (AccessRule rule in rules)
            {
                if (rule.AccessRight.Equals(AccessRight.EntityCreate))
                {

                    if (rule.Account.AccountType == SecurityAccountType.Role)
                    {
                        this.AllowCreatedIds += "A:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowCreatedNames += "角色：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.PublicGroup)
                    {
                        this.AllowCreatedIds += "R:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowCreatedNames += "公用小组：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.Group)
                    {
                        this.AllowCreatedIds += "P:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowCreatedNames += "个人小组：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.User)
                    {
                        this.AllowCreatedIds += "U:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowCreatedNames += "用户：" + rule.Account.Name.ToString() + ",";
                    }
                }
                if (rule.AccessRight.Equals( AccessRight.EntityApprove ))
                {
                    //this.AllowApprovedIds += rule.Account.AccountId.ToString() + ",";
                    if (rule.Account.AccountType == SecurityAccountType.Role)
                    {
                        this.AllowApprovedIds += "A:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowApprovedNames += "角色：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.PublicGroup)
                    {
                        this.AllowApprovedIds += "R:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowApprovedNames += "公用小组：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.Group)
                    {
                        this.AllowApprovedIds += "P:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowApprovedNames += "个人小组：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.User)
                    {
                        this.AllowApprovedIds += "U:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowApprovedNames += "用户：" + rule.Account.Name.ToString() + ",";
                    }
                }
                if (rule.AccessRight.Equals( AccessRight.EntityRead))
                {
                    if (isPublic) continue;
                   // this.AllowReadIds += rule.Account.AccountId.ToString() + ",";
                    if (rule.Account.AccountType == SecurityAccountType.Role)
                    {
                        this.AllowReadIds += "A:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowReadNames += "角色：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.PublicGroup)
                    {
                        this.AllowReadIds += "R:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowReadNames += "公用小组：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.Group)
                    {
                        this.AllowReadIds += "P:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowReadNames += "个人小组：" + rule.Account.Name.ToString() + ",";
                    }
                    else if (rule.Account.AccountType == SecurityAccountType.User)
                    {
                        this.AllowReadIds += "U:" + rule.Account.AccountId.ToString() + ",";
                        this.AllowReadNames += "用户：" + rule.Account.Name.ToString() + ",";
                    }
                }
            }
            if (!string.IsNullOrEmpty(this.AllowApprovedNames))
                this.AllowApprovedNames = this.AllowApprovedNames.TrimEnd(',');
            if (!string.IsNullOrEmpty(this.AllowCreatedNames))
                this.AllowCreatedNames = this.AllowCreatedNames.TrimEnd(',');
            if (!string.IsNullOrEmpty(this.AllowReadNames))
                this.AllowReadNames = this.AllowReadNames.TrimEnd(',');

            if (!string.IsNullOrEmpty(this.AllowReadIds))
                this.AllowReadIds = this.AllowReadIds.TrimEnd(',');
            if (!string.IsNullOrEmpty(this.AllowCreatedIds))
                this.AllowCreatedIds = this.AllowCreatedIds.TrimEnd(',');
            if (!string.IsNullOrEmpty(this.AllowApprovedIds))
                this.AllowApprovedIds = this.AllowApprovedIds.TrimEnd(',');
                                    
        }
        void GetAccessControl()
        {
            int mode = 1;
            List<ContentAccessItem> rules = ContentAccessControl.GetContentAccessControl(caller, new Guid(strId));
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
                string deleteURL = string.Format("/setup/own/deleteredirect.aspx?delID={0}&type={1}&retURL={2}", aItem.Id, ObjectTypeCodes.ContentAccessControl, this._retURL);
                if (aItem.Right == ContentRight.Owner || aItem.IsEveryone || aItem.IsMyBusinessUnit)
                {
                    sb.Append("<td  class=\" actionColumn  \"></td>");
                }
                else
                    sb.AppendFormat("<td  class=\" actionColumn  \"><a title=\"编辑\" class=\"actionLink\" href=\"javascript:editQuestion('{0}')\">编辑</a> | <a title=\"删除\" class=\"actionLink\" onclick=\"return confirmDelete();\" href=\"{2}\">删除</a></td>", aItem.Id, sortNumber, deleteURL);
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
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        string createRights(ContentAccessItem aItem)
        {
            ContentRight rightCode = aItem.Right;
            StringBuilder sb = new StringBuilder();
            if (aItem.Right == ContentRight.Owner)
            {
                sb.Append("所有人");
                //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='3' onchange=\"changeRight('{0}','{1}',this.value)\" {2} />所有人", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Owner) ? "checked" : "");
            }
            else
            {
                sb.AppendFormat("<input type='radio' name='item_right_{1}' value='0' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />没有查看权限", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.None) ? " checked " : "");
                sb.AppendFormat("<input type='radio' name='item_right_{1}' value='2' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />查看权限", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Read) ? "checked" : "");
                sb.AppendFormat("<input type='radio' name='item_right_{1}' value='4' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />查看/上传", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Collaborator) ? "checked" : "");
                //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='2' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />协作者", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Collaborator) ? "checked" : "");
                sb.AppendFormat("<input type='radio' name='item_right_{1}' value='32' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />管理", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Manage) ? "checked" : "");
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
        string CreateFolderTypes(int type)
        {

            StringBuilder sb = new StringBuilder();

            //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='0' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />没有查看权限", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.None) ? " checked " : "");
            //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='2' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />查看权限", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Read) ? "checked" : "");
            //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='4' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />查看/上传", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Collaborator) ? "checked" : "");
            //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='2' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />协作者", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Collaborator) ? "checked" : "");
            //sb.AppendFormat("<input type='radio' name='item_right_{1}' value='32' onchange=\"addContentAccess('{0}','{1}',this.value)\" {2} />管理", aItem.EntityId, aItem.ObjectId, (rightCode == ContentRight.Manage) ? "checked" : "");

            return sb.ToString();
        }
        void SaveData(bool saveNew)
        {
            string id = Request["id"];
           // bool isUpdated = false;
            bool isSaved = false;
            Guid orgId = new Guid(caller.CustomerID);
            Entity entity = null;
            string lable = Request["Name"];
            string isPublic = Request["isPublic"];
            string allowComment1 = Request["allowComment"];
            string needCensor1 = Request["needCensor"];
            bool allowComment = MainUtil.GetBool(allowComment1, false);
            bool needCensor = MainUtil.GetBool(needCensor1, false);

            string parentFolderId = Request["folderPicker"];
            string objectTypeCode = Request["objectTypeCode"];
            Guid parentId = Guid.Empty;
            this.SortNumber = MainUtil.GetInt(Request["sortNumber"], 1000);
            if (string.IsNullOrEmpty(id))
            {
                int type = MainUtil.GetInt(objectTypeCode, 100201);
                //int type = MainUtil.GetInt(oType, 100201);
                if (!string.IsNullOrEmpty(parentFolderId))
                    parentId = new Guid(parentFolderId);
                entity = ItemTreeManager.CreateFolder(caller, type, parentId, lable,this.SortNumber, MainUtil.GetInt(isPublic, 0), allowComment, needCensor);
            }
            else
            {
                entity = EntityManager.GetEntity(caller, ObjectTypeCodes.ItemTree, new Guid(id));
               
                entity.BeginEdit();
                entity.Fields["Name"].Value = lable;
                entity.Fields["Description"].Value =  Request["description"];
                entity.Fields["AllowComment"].Value = allowComment ? 1:0;
                entity.Fields["NeedCensor"].Value = needCensor ? 1 : 0;
                if (isPublic == "1")
                    entity.Fields["IsPublic"].Value = 1;
                else
                    entity.Fields["IsPublic"].Value = 0;

                entity.Fields["SortNumber"].Value = this.SortNumber;

                if (!string.IsNullOrEmpty(parentFolderId))
                    entity.Fields["ParentId"].Value = parentFolderId;
                else
                    ItemTreeManager.EmptyParentId(caller, new Guid(id));
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                //entity.Fields["ModifiedOn"].Value = DateTime.Now;
                isSaved = entity.EndEdit();
            }
            string pulishBy = Request["pulishBy_lkid"];
            string approveBy =Request["approveBy_lkid"];
            string readerRange =Request["readerRange_lkid"];
            if (isPublic == "1")
                readerRange = "";
            AccessRuleCollection rules = new AccessRuleCollection();
            GetRules(pulishBy, ref rules,1);
            GetRules(approveBy, ref rules,2);
            if (isPublic != "1")
                GetRules(readerRange, ref rules, 3);
            /*
            string[] strSelect = pulishBy.Split(',');
            for (int i = 0; i < strSelect.Length; i++)
            {
                string item = strSelect[i];
                AccessRule rule = null; 
                SecurityAccount securityAccount = null;
                
                string[] v = strSelect[i].Split(':');
                string type = v[0];
                string value = v[1];
                if (type == "A")//角色
                {
                  securityAccount =  SecurityRole.FromId(new Guid(value));
                }
                if (type == "R")//公用组
                {
                     securityAccount =  PublicGroup.FromId(new Guid(value));
                }
                if (type == "U")//用户
                { securityAccount =  SecurityUser.FromId(new Guid(value));

                }
                if (type == "P")//个人组
                {
                    securityAccount = PersonalGroup.FromId(new Guid(value));
                }
                rule = AccessRule.Create(securityAccount, AccessRight.EntityRead, SecurityPermission.AllowAccess);                
                rule = AccessRule.Create(securityAccount, AccessRight.EntityUpdate, SecurityPermission.AllowAccess);
                rule = AccessRule.Create(securityAccount, AccessRight.EntityDelete, SecurityPermission.AllowAccess);
                rules.Add(rule);               
            }
            */
            //EntityAccessControl.SetAccessControl(caller, entity.ID, rights);
            /*
            string duel_sharedto1 = Request["duel_sharedto1"];
            if (!string.IsNullOrEmpty(duel_sharedto1))
            {
                string rights = "";
                string[] strSelect = duel_sharedto1.Split(',');
                for (int i = 0; i < strSelect.Length; i++)
                {
                    string item = strSelect[i];

                    if (i > 0)
                        rights += ",";
                    //string[] v = strSelect[i].Split(':');
                    //string type = v[0];
                    //string value = v[1];
                    rights += item + "|16";
                }
                EntityAccessControl.SetAccessControl(caller, entity.ID, rights);
            }
            */
            EntityAccessControl.SetFolderAccessControl(caller, entity.ID, rules);
            string retURL = Request["retURL"];           
            if (saveNew)
            {
                string save_new_url = Request["save_new_url"];
                if (string.IsNullOrEmpty(save_new_url))
                {
                    oType = Request["oType"];
                    save_new_url = string.Format("/00l/e?oType={0}&retURL=%2F090%2Fo", oType);
                }
                Response.Redirect(save_new_url);
            }
            else
            {
                Response.Redirect(retURL);
            }
        }
        void GetRules(string accounts, ref AccessRuleCollection rules,int m)
        {
            if (string.IsNullOrEmpty(accounts)) return ;
           // AccessRuleCollection rules = new AccessRuleCollection();
            string[] strSelect = accounts.Split(',');
            for (int i = 0; i < strSelect.Length; i++)
            {
                string item = strSelect[i];
                AccessRule rule = null;// new AccessRule(Se
                SecurityAccount securityAccount = null;
                //if (i > 0)
                //    rights += ",";
                string[] v = strSelect[i].Split(':');
                string type = v[0];
                string value = v[1];
                if (type == "A")//角色
                {
                    securityAccount = SecurityRole.FromId(new Guid(value));
                }
                if (type == "R")//公用组
                {
                    securityAccount = PublicGroup.FromId(new Guid(value));
                }
                if (type == "U")//用户
                {
                    securityAccount = SecurityUser.FromId(new Guid(value));

                }
                if (type == "P")//个人组
                {
                    securityAccount = PersonalGroup.FromId(new Guid(value));
                }
                if (m == 3) //读
                {
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityRead, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                }
                if (m == 2)//审核
                {
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityRead, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityUpdate, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityApprove, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                }
                if (m == 1) //创建
                {
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityRead, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityCreate, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityUpdate, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                    rule = AccessRule.Create(securityAccount, AccessRight.EntityDelete, SecurityPermission.AllowAccess);
                    rules.Add(rule);
                }
              
            }
        }
        void LoadRoles()
        {
            List<Role> users = SecurityAuth.GetSystemRoles(caller);
            int i = 0;
            foreach (Role a in users)
            {
                if (i > 0)
                    _availableOptions += ",";
                _availableOptions += string.Format("['A', '角色:{0}', 'A:{1}', '{0}', existingSelduel_sharedto_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        public void GetAllPublicGroups()
        {
            
            //_json = "[";
            EntityCollection entities = GroupManager.GetPublicGroups(caller);
            int i = 0;

            if (!string.IsNullOrEmpty(_availableOptions) && entities.Count>0)
                _availableOptions += ",";

            foreach (Entity a in entities)
            {               
                //_json += string.Format("{{\"type\":\"R\",\"name\":\"{0}\", \"id\":\"{1}\"}}", a.Name, a.ID);
                _availableOptions += string.Format("['R', '公用小组:{0}', 'R:{1}', '{0}', existingSelduel_sharedto_select_0, '']", a.Name, a.ID);
                i++;
            }
            //_json += "]";
           // Response(_json);
        }
        string _selectOptions = "";
        string _availableOptions = "";
        public string AvailableOptions { get { return _availableOptions; } }
        public string SelectOptions { get { return _selectOptions; } }

        public int SortNumber { get; set; }
        public string FolderId { get; set; }
        public string FolderName { get; set; }
        public string ParentFolderId { get; set; }

        public string AllowCreatedIds { get; set; }
        public string AllowCreatedNames { get; set; }

        public string AllowApprovedIds { get; set; }
        public string AllowApprovedNames { get; set; }


        public string AllowReadIds { get; set; }
        public string AllowReadNames { get; set; }
        //
        //entity.Fields["AllowComment"].Value = allowComment ? 1:0;
        //entity.Fields["NeedCensor"].Value = needCensor ? 1 : 0;
        public string NeedCensorHTML { get; set; }
        public string AllowCommentHTML { get; set; }
        public int objectTypeCodeId { get; set; }
        public string MembersHTML { get; set; }
    }
}