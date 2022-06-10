using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;

using OA.Web.UI.FieldControls;
using OA.Web.UI.WebControls;

namespace WebClient.apps.scontent
{
    public partial class NoticeView : System.Web.UI.Page
    {
        CallContext caller = null;
        string businessUnitIdControlHtml = "";
        string ownerName = "";
        int typeCode = 100202;
        string hotlist_mode = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                caller = AppDataSource.GetCallContext();
                GetData();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        void GetData()
        {
            string strId = Request["id"];
            if (string.IsNullOrEmpty(strId)) return;
            Entity entity = null;
            //this.PreviewURL = Supermore.Configuration.Settings.GetSetting("Sites.Portal") + "ViewNotice.aspx?id=" + strId;
            this.PreviewURL = "/apps/scontent/PreviewContent.aspx?ispreview=1&id=" + strId;
            entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Notice, new Guid(strId));
            this.EntityId = entity.ID.ToString();
            Title = entity.Fields["Title"].Value.ToString();
            ContentBody = entity.Fields["ContentBody"].Value.ToString();
            this.FolderId = StringUtil.GetString(entity.Fields["FolderId"].Value);
            int status = MainUtil.GetInt(entity.Fields["StateCode"].Value, 0);
            this.ReadCount = MainUtil.GetInt(entity.Fields["ReadCount"].Value, 0);
            this.CommentCount = MainUtil.GetInt(entity.Fields["CommentCount"].Value, 0);
            this.LikeCount = MainUtil.GetInt(entity.Fields["LikeCount"].Value, 0);
            this.DislikeQty = MainUtil.GetInt(entity.Fields["DislikeQty"].Value, 0);

            if (status == 0)
            {
                StatusName = "草稿";
            }
            else if (status == 1)
            {
                StatusName = "审批通过";
            }
            else if (status == 2)
            {
                StatusName = "审批不通过";
            }
            Guid businessUnitId = MainUtil.GetGuid(entity.Fields["BusinessUnitId"].Value);
            this.BusinessUnitId = businessUnitId.ToString();
            BusinessUnit org = OrganizationManager.GetBusinessUnit(caller, businessUnitId);
            if (org != null)
                this.BusinessUnitName = org.Name;
            //this.ParentBusinessUnitId = org.ParentBusinessUnitId;
            this.CreatedByName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
            this.ModifiedByName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, entity.ModifiedBy);
            FolderId =  StringUtil.GetString(entity.Fields["FolderId"].Value);
            if (!string.IsNullOrEmpty(FolderId))
                this.FolderName = EntityManager.GetEntityName(caller, EntityTemplateIDs.ItemTree, new Guid(FolderId));
            this.ModifiedOn = entity.ModifiedOn.ToString("yyyy-MM-dd tthh:mm:ss");
            this.CreatedOn = entity.CreatedOn.ToString("yyyy-MM-dd tthh:mm:ss");
           // this.ReadDetectionFlag = StringUtil.GetString(entity.Fields["ReadDetectionFlag"].Value);
          
            if (!string.IsNullOrEmpty(this.ReadDetectionFlag))
            {
                string[] detectionValues = this.ReadDetectionFlag.Split('\r');
                foreach (string str in detectionValues)
                {
                    string tmp = str.Trim();
                    ReadDetectionOptions += string.Format("<option value='{0}'>{1}</option>", tmp, tmp);
                }
            }

            RenderNoteList(strId, Title);

            GetMembers(strId);
            GetNotReadMembers(strId);
        }
        void RenderNoteList(string objectId,string objectName)
        {
            RelatedAttachmentList noteList = new RelatedAttachmentList();
            noteList.RelatedObjectId = objectId;
            noteList.RelatedObjectName = objectName;
            noteList.EntityTemplateCode = ObjectTypeCodes.Notice;
            noteList.RetURL = this.Request.RawUrl;
            noteList.Caller = caller;
            noteList.Render();
            RelatedAttachmentListData = noteList.ResultHTML;

        }
        
        void GetMembers(string objectId)
        {
            EntityCollection collection = ContentManager.GetContentReaders(caller, new Guid(objectId),1, "", 50, 1);
            int mode = 2;
            //CallContext caller = AppDataSource.GetCallContext();
            //QueryExpression queryExp = new QueryExpression();
            //Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            //EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
            string retURL = HttpUtility.UrlEncode(Request.RawUrl);
            //string objectId = "";
            foreach (Entity entity in collection)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);
               
                tRow += string.Format("<td  class=\" actionColumn  \">{0}</td>", "");
                
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ReaderName"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["CreatedOn"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ModifiedOn"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["CommentOn"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["Comments"].Value));
                tRow += "</tr>";

                tBody += tRow;
                mode++;
            }
        }
        void GetNotReadMembers(string objectId)
        {
            EntityCollection collection = ContentManager.GetContentReaders(caller, new Guid(objectId), 0, "", 100, 1);
            int mode = 2;
            //CallContext caller = AppDataSource.GetCallContext();
            //QueryExpression queryExp = new QueryExpression();
            //Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            //EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
            string retURL = HttpUtility.UrlEncode(Request.RawUrl);
            //string objectId = "";
            foreach (Entity entity in collection)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);

                tRow += string.Format("<td  class=\" actionColumn  \">{0}</td>", "");

                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ReaderName"].Value));
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["CreatedOn"].Value));
               // tRow += string.Format(" <td class=\"dataCell\">{0}</td>", "");
               // tRow += string.Format(" <td class=\"dataCell\">{0}</td>", "");


                tRow += "</tr>";

                NotReadResultHTML += tRow;
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
        string tBody = "";
        public string BodyText
        {
            get { return tBody; }
        }
        public string NotReadResultHTML { get; set; }
        public string OwnerName { get { return ownerName; } set { ownerName = value; } }
        public string EntityId { get; set; }
        public string Title { get; set; }
        public string ContentBody { get; set; }
        public string FolderId { get; set; }
        public string FolderName { get; set; }

        public int ReadCount { get; set; }
        public int CommentCount { get; set; }
        public int LikeCount { get; set; }
        public int DislikeQty { get; set; }

        public string StatusName { get; set; }
        public string ReadDetectionFlag { get; set; }
        
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }

        public string ReadDetectionOptions { get; set; }
        public string BusinessUnitIdControlHtml
        {
            get { return businessUnitIdControlHtml; }
            set { businessUnitIdControlHtml = value; }
        }
        public string RelatedAttachmentListData { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedByName { get; set; }
        public string CreatedOn { get; set; }
        public string ModifiedOn { get; set; }

        public string PreviewURL { get; set; }
    }
}