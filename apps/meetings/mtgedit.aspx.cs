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
using Youyou.Meetings;

namespace WebClient.apps.meetings
{
    public partial class mtgedit : System.Web.UI.Page
    {
        CallContext _caller = null;
        string t = "";
        string _wrappHTML = "";
        string _resultHTML = "";
        Template _template;
        Entity insEntity = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            string strId = Request["id"];
            t = Request["t"];
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

            Entity entity = null;
            if (!string.IsNullOrEmpty(strId))
                entity = EntityManager.GetEntity(_caller, ObjectTypeCodes.Meeting, new Guid(strId));

            EditFormFromPageTemplate formRender = new EditFormFromPageTemplate();
            formRender.PageTemplateVirtualPath = "~/App_Data/PageTemplates/meeting/mtgedit.htm";
            formRender.Caller = _caller;
            formRender.QueryString = this.Request.QueryString;
            //formRender.q
            formRender.Entity = entity;
            if (entity != null)
                formRender.Template = entity.Template;
            else
                formRender.Template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.Meeting);
            formRender.Render();
            EditFormBody = formRender.ResultHTML;

            string retURL = Request["retURL"];
            RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
        }
        void SaveData()
        {
           
            string strId = Request["id"];
            string startTime = string.Format("{0} {1}", Request["ScheduledStart"], Request["ScheduledStart_time"]);
            string endTime = string.Format("{0} {1}", Request["ScheduledEnd"], Request["ScheduledEnd_time"]);
            string roomId = Request["RoomId_lkid"];

            Supermore.OrgResource.ResourceAppointmentInfo resInfo = RoomManager.CheckRoomFree(_caller, startTime, endTime, roomId, strId);
            if (resInfo != null)
            {
                if (!resInfo.IsFree)
                {
                    //会议室占用
                    return;
                }
            }
            _template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.Meeting);
            bool isCreated = false;
            Guid newEntityId = Guid.NewGuid();

            if (!string.IsNullOrEmpty(strId))
                insEntity = EntityManager.GetEntity(_caller, _template, new Guid(strId));
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
                string val = "";
                if (tfield.FieldType == null || tfield.FieldType.DType == "UUId")
                    continue;

                switch (tfield.FieldType.DType)
                {
                    case FieldTypeCodes.Lookup:
                    case FieldTypeCodes.MasterDetail:
                    case FieldTypeCodes.User:
                    case FieldTypeCodes.BusinessUnit:
                        val = Request[fName + "_lkid"];
                        if (val == null) continue;     
                        break;
                    case FieldTypeCodes.CheckBox:
                        //val = "True";
                        if (Request[fName] != null) //bug,如果权限控制不显示该字段，默认也修改了。糟糕
                            insEntity.Fields[fName].Value = true;
                        else
                            insEntity.Fields[fName].Value = false;
                        break;
                    case FieldTypeCodes.DateTime:
                        string date = Request[fName];
                        if (date == null) continue;
                        string time = Request[fName + "_time"];
                        if (string.IsNullOrEmpty(time))
                        {
                            time = "00:00";
                        }
                        if (!string.IsNullOrEmpty(date))
                        {
                            val = string.Format("{0} {1}", date, time);
                        }
                        insEntity.Fields[fName].Value = val;
                        break;
                    default:
                        val = Request[fName];
                        if (val == null) continue;
                        if (!string.IsNullOrEmpty(val))
                        {
                            val = val.Trim();
                        }
                        break;
                }
                if (!string.IsNullOrEmpty(val))
                {
                    Field field = insEntity.Fields[fName];
                    if (field != null)
                    {
                        field.Value = val;
                    }
                }
            }
            #endregion

            if (insEntity.Fields["OwningBusinessUnit"] != null)
            {
                string owUnit = StringUtil.GetString(Request["OwningBusinessUnit_lkid"]);
                if (Request["OwningBusinessUnit_lkid"] != null)
                {
                    if (!string.IsNullOrEmpty(owUnit))
                    {
                        insEntity.Fields["OwningBusinessUnit"].Value = owUnit;
                    }
                    else
                        insEntity.Fields["OwningBusinessUnit"].Value = _caller.BussinessUnitId;
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
                //邀请人
            }
            else
            {
                insEntity.Fields["ModifiedBy"].Value = _caller.UserID;
                insEntity.Fields["ModifiedOn"].Value = DateTime.Now;
            }

            string retURL = Request["retURL"];
            bool isSaved = insEntity.EndEdit();
            if (isSaved)
            {
                RoomManager.AppointRoom(_caller, new MeetingEntity(insEntity));

                Response.Redirect(retURL, true);
            }
        }

        public string EditFormBody { set; get; }
    }
}