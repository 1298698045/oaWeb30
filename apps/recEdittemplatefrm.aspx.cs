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
using Supermore.EntityFramework.Templates;
using Supermore.Meetings;
using Supermore.IO;

using OA.Web.UI.WebControls;
using System.Xml;
using Supermore.Xml;
using Supermore.ScriptEngine;

namespace WebClient.apps
{
    public partial class recEdittemplatefrm : System.Web.UI.Page
    {
        private CallContext _caller = null;
        private string t = "";
        private string _pageTitle = "";
        private string _entityTitle = "";
        private string _tabCss = "";
        private string _wrappHTML = "";
        private string _resultHTML = "";
        private Template _template;
        private Entity insEntity = null;
        private string entityType = "";
        private int _typeCode = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            string strId = Request["id"];
            t = Request["t"];
            entityType = Request["t"];
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                cancelURL = HttpUtility.UrlDecode(cancelURL);
                Response.Redirect(cancelURL);
            }
            if (Request["save"] != null)
            {
                SaveData();
            }
            GetEntityTemplate();
            Entity entity = null;
            if (!string.IsNullOrEmpty(strId))
            {
                entity = EntityManager.GetEntity(_caller, _template.ID, new Guid(strId));
            }
            string temPath = GetPageTemplatePath();
            EditFormFromPageTemplate formRender = new EditFormFromPageTemplate();
            formRender.PageTemplateVirtualPath = "~/App_Data/PageTemplates/" + temPath;
            formRender.Caller = _caller;
            formRender.Entity = entity;
            if (entity != null)
                formRender.Template = entity.Template;
            else
                formRender.Template = _template;

            formRender.Render();
            EditFormBody = formRender.ResultHTML;

            string retURL = Request["retURL"];
            if (!string.IsNullOrEmpty(retURL))
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);

            RegisterParamsHiddenFieldsControl1.AddHiddenValue("_CONFIRMATIONTOKEN", _caller.UserID);
        }

        string GetPageTemplatePath()
        {
            string file = Server.MapPath("/App_Data/PageTemplates/pagetemplate.xml");
            XmlDocument xmlDoc = XmlUtil.LoadXmlFile(file);
            XmlElement root = xmlDoc.DocumentElement;
            XmlNodeList lst = root.ChildNodes;
            foreach (XmlNode node in lst)
            {
                string name = XmlUtil.GetAttribute("name", node);
                string pagetemplate = XmlUtil.GetAttribute("pagetemplate", node);
                if (name == entityType)
                    return pagetemplate;
                //style=\"background: #e8e8e9 url('/img/alohaSkin/btn_sprite.png') repeat-x scroll right top;height:25px;\"
                //sb.AppendFormat("<input type='button' id='btnWorkShift_{0}' name='btnWorkShift' value='{1}' class=\"btnShift\"  onclick=\"selectAttendType(this,'{0}');\" title='{1}' />&nbsp;&nbsp;", id, label);
            }
            return string.Empty;
        }
        public void GetEntityTemplate()
        {
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

            string strId = Request["id"];
            GetEntityTemplate();
           // _template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.Meeting);
            bool isCreated = false;
            string retURL = Request["retURL"];
            Guid newEntityId = Guid.NewGuid();
            try
            {
                if (!string.IsNullOrEmpty(strId))
                {
                    newEntityId = new Guid(strId);
                    insEntity = EntityManager.GetEntity(_caller, _template, newEntityId);
                }
                if (insEntity == null)
                {
                    insEntity = new Entity(newEntityId, _template.ID, _caller.OrganizationId);
                    isCreated = true;
                }

                #region form
                insEntity.BeginEdit();

                foreach (Supermore.EntityFramework.Templates.TemplateField tfield in this._template.Fields)
                {
                    string fName = tfield.Name;
                    string val = null;
                    if (tfield.FieldType == null || tfield.FieldType.DType == "UUId")
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
                            //if (val == null) continue;  //bug，如何不选，就不能修改了
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
                        case FieldTypeCodes.Numeric:
                            val = Request[fName];
                            //如果Request 不到，说明表单上没有
                            if (val == null) continue;
                            break;
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
                #endregion

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
                    //邀请人
                }
                else
                {
                    insEntity.Fields["ModifiedBy"].Value = _caller.UserID;
                    insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
                }

               
                bool isSaved = insEntity.EndEdit();
                if (isSaved)
                {
                    //计算公式
                    insEntity = EntityManager.GetEntity(_caller, _template, newEntityId);
                    EntityScriptEvaluator.CalculateFormulaFields(_caller, _template, insEntity);
                    Response.Redirect(retURL, true);
                }
            }
            catch (Exception ex)
            {                
                Response.Redirect(retURL, true);
            }
        }
        public string TabCss
        {
            get { return _tabCss; }
        }
        public string EntityCode
        {
            get { return entityType; }
        }
        public string PageTitle
        {
            get { return _pageTitle; }
        }
        public int TypeCode { set { _typeCode = value; } get { return _typeCode; } }
        

        public string EditFormBody { set; get; }
    }
}