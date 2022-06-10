using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.GridBuilder;
using OA.Web.UI;
using OA.Web.UI.WebControls;
using Supermore.EntityFramework;
using System.Collections;
using Supermore.Configuration;

namespace WebClient.apps
{
    public partial class RecUpdate : System.Web.UI.Page
    {
        private string entityType = "";
        private string tBody = "";
        private string _filterOptionHTML = "";
        private string _pageTitle = "";
        private string _tabCss = "";
        private CallContext _caller;
        private int _typeCode = 2;
        //private int _pageSize = 10;
        Template _template;
        Entity insEntity = null;
        //Template fTemplate = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            entityType = Request["t"];
            this.DateNow = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                //cancelURL = HttpUtility.UrlDecode(cancelURL);
                Response.Redirect(cancelURL);
            }
            if (Request["save"] != null)
            {
                SaveData();
            }
            if (Request["save_new"] != null)
            {
                SaveData();
            }

            string strId = Request["id"];
            SystemAppTab tab = SystemAppTabs.GetTab(entityType);
            if (tab != null)
            {
                if (tab.TemplateId != Guid.Empty)
                {
                    _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), tab.TemplateId);
                }
                this._tabCss = tab.TabCss + "Tab";
            }
            else
            {
                this._tabCss = "accountTab";
            }
            if (_template == null)
            {
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), entityType);
            }
            if (_template != null)
            {
                _typeCode = _template.ObjectTypeCode;
                _pageTitle = _template.Title;
                this._entityTitle = _template.Title;
                EntityEditForm entityForm = new EntityEditForm();
                entityForm.Template = _template;
                entityForm.Caller = this._caller;
                entityForm.QueryString = this.Request.QueryString;
                if (!string.IsNullOrEmpty(strId))
                {
                    Entity insEntity = EntityManager.GetEntity(_caller, _template, new Guid(strId));
                    if (insEntity != null)
                    {
                        entityForm.Entity = insEntity;
                        this._pageTitle = "编辑" + _pageTitle;
                    }
                }
                else
                    _pageTitle = "新建" + _pageTitle;

                entityForm.Render();
                this.ResultHTML = entityForm.ResultHTML;
            }
            string retURL = Request["retURL"];
            RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);

            var myCol = this.Request.QueryString;
             IEnumerator myEnumerator = this.Request.QueryString.GetEnumerator();
            if (_template != null)
            {
                foreach (String sField in myCol.AllKeys)
                {
                    Supermore.EntityFramework.Templates.TemplateField tField = _template.GetField(sField);
                    if (tField != null)
                    {
                        RegisterParamsHiddenFieldsControl1.RemoveHidden(sField + "_lkid");//EmployeeId_lkid
                        RegisterParamsHiddenFieldsControl1.RemoveHidden(sField);
                    }
                }
            }
        }

        public void GetEntityTemplate()
        {
            SystemAppTab tab = SystemAppTabs.GetTab(entityType);
            if (tab != null)
            {
                if (tab.TemplateId != Guid.Empty)
                {
                    _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), tab.TemplateId);
                }
                this._tabCss = tab.TabCss + "Tab";
            }
            if (_template == null)
            {
                _template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), entityType);
            }
            if (_template != null)
            {
                _typeCode = _template.ObjectTypeCode;
                _pageTitle = _template.Title;
                this._entityTitle = _template.Title;
            }
        }

        void SaveData()
        {
            GetEntityTemplate();

            string strId = Request["id"];
            //fTemplate = TemplateManager.GetTemplate(procInstance.OrganizationId, procInstance.ProcessScheme.EntityObjectId);
            bool isCreated = false;
            Guid newEntityId = Guid.NewGuid();
            bool isSaved = false;
            try
            {
                if (!string.IsNullOrEmpty(strId))
                {
                    newEntityId = new Guid(strId);
                    insEntity = EntityManager.GetEntity(_caller, _template, newEntityId);
                }
                if (insEntity == null)
                {
                    insEntity = new Entity(newEntityId, _template.ID, new Guid(_caller.CustomerID));
                    isCreated = true;
                }

                insEntity.BeginEdit();

                foreach (Supermore.EntityFramework.Templates.TemplateField tfield in this._template.Fields)
                {
                    string fName = tfield.Name;
                    string val = null;
                    if (tfield.FieldType == null || tfield.FieldType.DType == "UUId" || tfield.IsLogical)
                        continue;

                    //bool isGuid = false;
                    //bool isEmptyToNull = false;//如果是空字符串,到数据库转换成Null
                    switch (tfield.FieldType.DType)
                    {
                        case FieldTypeCodes.Lookup:
                        case FieldTypeCodes.MasterDetail:
                        case FieldTypeCodes.User:
                        case FieldTypeCodes.BusinessUnit:
                            val = Request[fName + "_lkid"];
                            //如果Request 不到，说明表单上没有
                            if (val == null) continue;
                            break;
                        case FieldTypeCodes.CheckBox:
                            if (Request[fName] != null) //bug,如果权限控制不显示该字段，默认也修改了。糟糕
                                insEntity.Fields[fName].Value = true;
                            else
                                insEntity.Fields[fName].Value = false;
                            break;
                        case FieldTypeCodes.DateTime:
                            string date = Request[fName];
                            string time = Request[fName + "_time"];
                            if (date == null) continue;//如果Request 不到，说明表单上没有
                            if (string.IsNullOrEmpty(time))
                            {
                                time = "00:00";
                            }
                            if (!string.IsNullOrEmpty(date))
                            {
                                val = string.Format("{0} {1}", date, time);
                                insEntity.Fields[fName].Value = val;
                            }

                            break;
                        case FieldTypeCodes.Time:
                            string time1 = Request[fName];
                            if (time1 == null) continue;//如果Request 不到，说明表单上没有
                            if (!string.IsNullOrEmpty(time1))
                            {
                                val = time1.Replace("：", ":");
                                insEntity.Fields[fName].Value = val;
                            }
                            break;
                        //case FieldTypeCodes.Numeric:
                        //    break;
                        //case FieldTypeCodes.Date:
                        //    val = Request[fName];
                        //    //如果Request 不到，说明表单上没有
                        //    if (val == null) continue;
                        //    if(string.IsNullOrEmpty(val))
                        //        val = null;
                        //    //@@TODO 需要比对，如何使和系统中原来不一样，就要清空
                        //    break;
                        default:
                            val = Request[fName];
                            //如果Request 不到，说明表单上没有
                            if (val == null) continue;
                            if (!string.IsNullOrEmpty(val))
                            {
                                val = val.Trim();
                            }
                            break;
                    }
                    if (val != null)
                    {
                        Field field = insEntity.Fields[fName];
                        if (field != null)
                        {
                            //@@比对字段值是否一致，如果一致，不修改
                            if (isCreated) //创建模式
                            {
                                if (!string.IsNullOrEmpty(val))
                                    field.Value = val;
                            }
                            else
                            {
                                string oValue = StringUtil.GetString(field.Value);
                                if (oValue != val)
                                    field.Value = val;
                            }
                        }
                    }
                }

                if (isCreated)
                {
                    insEntity.Fields["CreatedOn"].Value = DateTime.Now;
                    insEntity.Fields["CreatedBy"].Value = _caller.UserID;
                    if (insEntity.Fields["OwningUser"] != null)
                        insEntity.Fields["OwningUser"].Value = _caller.UserID;
                    insEntity.Fields["ModifiedBy"].Value = _caller.UserID;
                    insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                    if (insEntity.Fields["OrganizationId"] != null)
                        insEntity.Fields["OrganizationId"].Value = _caller.OrganizationId;

                    if (isCreated) //同步用户
                    {
                        if (_template.ObjectTypeCode == ObjectTypeCodes.HREmployee) //人力资源更新
                        {
                            try
                            {
                                string employeeNo = Request["EmployeeNo"];
                                string userName = employeeNo;
                                string fullName = Request["FullName"];
                                string businessUnitId = Request["DeptId_lkid"];
                                string MobileNumber = Request["MobileNumber"];
                                int ruleNum = Settings.GetIntSetting("User.UserName", 1);
                                if (!string.IsNullOrEmpty(fullName))
                                {
                                    string pinyin = Youyou.HRCore.Employees.EmployeeManager.GetPinyin(_caller, fullName);
                                    if (ruleNum == 2)
                                    {
                                        userName = pinyin + userName;
                                    }
                                    //else
                                    //    userName = employeeNo;
                                    if (!string.IsNullOrEmpty(userName))
                                    {
                                        Youyou.HRCore.Employees.EmployeeManager.CreateUser(_caller, insEntity.ID, userName, fullName, employeeNo, businessUnitId, MobileNumber, pinyin);
                                        Supermore.Security.SystemUser systemUser = new Supermore.Security.SystemUser(insEntity);
                                        Supermore.Contacts.AddressListManager.CreateFromUser(_caller, systemUser);
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Supermore.Diagnostics.Trace.LogException(ex);
                            }
                        }
                    }
                    else
                    {
                        if (_template.ObjectTypeCode == ObjectTypeCodes.HREmployee) //人力资源更新
                        {
                            Youyou.HRCore.Employees.EmployeeManager.CloseSelfEdit(_caller, strId);
                            string mobilePhone = Request["MobileNumber"];
                            if (!string.IsNullOrEmpty(mobilePhone))
                            {
                                Supermore.Contacts.AddressListManager.UpdateAddressMobile(_caller, strId, mobilePhone);
                                Supermore.Security.SecurityAuth.UpdateMobile(_caller, strId, mobilePhone);
                            }
                        }
                    }
                }
                else
                {
                    insEntity.Fields["ModifiedBy"].Value = _caller.UserID;
                    insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                    //DeptId_lkid
                    if (_template.ObjectTypeCode == ObjectTypeCodes.HREmployee) //人力资源更新
                    {
                        string loginName = StringUtil.GetString(insEntity.Fields["LoginName"].Value);
                        string deptId = Request["DeptId_lkid"];
                        if (!string.IsNullOrEmpty(deptId))
                            Youyou.HRCore.Employees.EmployeeManager.UpdateDeptToUser(_caller, newEntityId, loginName, deptId);
                    }
                }
                isSaved = insEntity.EndEdit();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            string retURL = Request["retURL"];
            if (isSaved)
            {
                if (string.IsNullOrEmpty(retURL))
                { 
                    
                }
                //retURL = HttpUtility.UrlDecode(retURL);
                Response.Redirect(retURL, true);
            }
            else
            {
                Response.Redirect(retURL, true);
            }
        }

        string _entityTitle = "";
        string _resultHTML = "";

        public string BodyText
        {
            get { return tBody; }
        }
        public string PageTitle
        {
            get { return _pageTitle; }
        }
        
        public string EntityDisplayName
        {
            get { return _entityTitle; }
        }
                
        public string ResultHTML
        {
            get { return _resultHTML; }
            set { _resultHTML = value; }
        }
        public string TabCss
        {
            get { return _tabCss; }
        }
        public string EntityCode
        {
            get { return entityType; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }

        public string DateNow
        {
            get;
            set;
        }
    }
}