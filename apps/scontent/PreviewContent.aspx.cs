using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;

using OA.Web.UI.FieldControls;


namespace WebClient.apps.scontent
{
    public partial class PreviewContent : System.Web.UI.Page
    {
        CallContext caller = null; 
        string ownerName = "";
        int contentTypeCode = 1;
        EntityCollection col = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            GetData();
        }
        void GetData()
        {
            string strId = Request["id"];
            if (string.IsNullOrEmpty(strId)) return;
            
            Entity entity = null;
            EntityId = strId;
            entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Content, new Guid(strId));
            if (entity == null) return;
            string isPreview = StringUtil.GetString(Request["ispreview"]);

            if (isPreview != "1")
                ContentManager.SetRead(caller, new Guid(strId), new Guid(caller.UserID));

            CTitle = entity.Fields["Title"].Value.ToString();
            Contents = entity.Fields["ContentBody"].Value.ToString();
            this.FolderId = StringUtil.GetString(entity.Fields["FolderId"].Value);
            if (!string.IsNullOrEmpty(this.FolderId))
            {
                this.FolderName = EntityManager.GetEntityName(caller, EntityTemplateIDs.ItemTree, new Guid(FolderId));
            }
            Guid businessUnitId = MainUtil.GetGuid(entity.Fields["BusinessUnitId"].Value);
            this.BusinessUnitId = businessUnitId.ToString();
            contentTypeCode = MainUtil.GetInt(entity.Fields["contentTypeCode"].Value, 1);
            this.KeyWords = StringUtil.GetString(entity.Fields["KeyWords"].Value);
            BusinessUnit org = OrganizationManager.GetBusinessUnit(caller, businessUnitId);
            if (org != null)
                this.BusinessUnitName = org.Name;
            this.ReadCount = MainUtil.GetInt(entity.Fields["ReadCount"].Value, 0);
            this.LikeCount = MainUtil.GetInt(entity.Fields["LikeCount"].Value, 0);
            //this.ParentBusinessUnitId = org.ParentBusinessUnitId;
            this.CreateOn = entity.CreatedOn.ToString("yyyy-MM-dd tthh:mm:ss");
            int status = MainUtil.GetInt(entity.Fields["StatusCode"].Value, 0);
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
            if (entity.Fields["AttachRightCode"] != null)
            {
                this.AttachRightCode = MainUtil.GetInt(entity.Fields["AttachRightCode"].Value, 0);
            }
            GetAttachments(strId);

            //GetRelatedList(new Guid(this.FolderId));
            
            GetNewList();
            GetHotList();
            GetRecommentList();
        }
        /// <summary>
        /// 相关的
        /// </summary>
        /// <param name="folderId"></param>
        void GetRelatedList(Guid folderId)
        {
            StringBuilder sb = new StringBuilder();
            
            if (contentTypeCode == 1)
                col = ContentManager.GetRelatedNews(caller, folderId, 10);
            else
                col = ContentManager.GetRelatedNotices(caller, folderId, 10);

            foreach (Entity e in col)
            {
                string title = e.Name;
                string shortTitle = title;
                if (title.Length > 18)
                    shortTitle = title.Substring(0, 18);
                //sb.AppendFormat(" <li><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1}'>{2} 【{3}】</a></li>", e.ID, e.Name, shortTitle,e.CreatedOn.ToString("yyyy-MM-dd"));
                sb.AppendFormat(" <li style='font-size:13px'><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1} {3}' style='color:#0065ce;font-size: 13px '>{2}</a></li>", e.ID, e.Name, shortTitle, e.CreatedOn.ToString("yyyy-MM-dd"));
            }
            this.RelatedHTML = sb.ToString();
        }
        void GetNewList()
        {
            StringBuilder sb = new StringBuilder();
            //string topNew = "SELECT TOP 5 * FROM ContentBase WHERE ContentTypeCode={0} And StateCode=1 ORDER BY CreatedOn DESC";
            //topNew = string.Format(topNew, contentTypeCode);
            //col = EntityManager.GetEntities(caller, EntityTemplateIDs.Content, topNew);
            if (contentTypeCode == 1)
                col = ContentManager.GetLatestNews(caller, 5);
            else
                col = ContentManager.GetLatestNotices(caller, 5);
            foreach (Entity e in col)
            {
                string title = e.Name;
                string shortTitle = title;
                if (title.Length > 18)
                    shortTitle = title.Substring(0, 18);
                //sb.AppendFormat(" <li><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1}'>{2} 【{3}】</a></li>", e.ID, e.Name, shortTitle,e.CreatedOn.ToString("yyyy-MM-dd"));
                sb.AppendFormat(" <li><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1} {3}'>{2}</a></li>", e.ID, e.Name, shortTitle, e.CreatedOn.ToString("yyyy-MM-dd"));
            }
            this.LatestHTML = sb.ToString();
        }
        void GetHotList()
        {
            StringBuilder sb = new StringBuilder();
            //string topNew = "SELECT TOP 10 * FROM ContentBase WHERE ContentTypeCode={0} And StateCode=1 ORDER BY ReadCount DESC";
            //topNew = string.Format(topNew, contentTypeCode);
            //EntityCollection col = EntityManager.GetEntities(caller, EntityTemplateIDs.Content, topNew);
            //<li class="top clearfix"><i>1</i><a title="老艾侃股：清淡中存三大亮点 下周有望" target="_blank" href="://finance.sina.com.cn/zl/stock/20150911/154623223671.shtml">老艾侃股：清淡中存三大亮点 下周有望</a></li>
            if (contentTypeCode == 1)
                col = ContentManager.GetHotNews(caller, 10);
            else
                col = ContentManager.GetHotNotices(caller, 10);
            int iRow = 1;
            foreach (Entity e in col)
            {
                string title = e.Name;
                string shortTitle = title;
                if (title.Length > 18)
                    shortTitle = title.Substring(0, 18);
                //sb.AppendFormat(" <li><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1}'>{2} 【{3}】</a></li>", e.ID, e.Name, shortTitle,e.CreatedOn.ToString("yyyy-MM-dd"));
                if (iRow>3)
                    sb.AppendFormat(" <li class='clearfix'><i>{4}</i><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1} {3}'>{2}</a></li>", e.ID, e.Name, shortTitle, e.CreatedOn.ToString("yyyy-MM-dd"), iRow);
                else
                    sb.AppendFormat(" <li class='top clearfix'><i>{4}</i><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1} {3}'>{2}</a></li>", e.ID, e.Name, shortTitle, e.CreatedOn.ToString("yyyy-MM-dd"),iRow);
                
                iRow++;
            }
            this.HotListHTML = sb.ToString();
        }

        void GetRecommentList()
        {
            StringBuilder sb = new StringBuilder();
            //string topNew = "SELECT TOP 10 * FROM ContentBase WHERE ContentTypeCode={0} And StateCode=1 ORDER BY CreatedOn DESC";
            //topNew = string.Format(topNew, contentTypeCode);
            //EntityCollection col = EntityManager.GetEntities(caller, EntityTemplateIDs.Content, topNew);
            //<li><a target="_blank" href="http:///zl/china/20150903/090723154387.shtml">大阅兵后股市上行拐点将出现</a></li>
            int iRow = 1;
            EntityCollection col = ContentManager.GetRecommentNotices(caller, contentTypeCode, 10);
            foreach (Entity e in col)
            {
                string title = e.Name;
                string shortTitle = title;
                if (title.Length > 20)
                    shortTitle = title.Substring(0, 20);
              
                 sb.AppendFormat(" <li><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\" title='{1} {3}'>{2}</a></li>", e.ID, e.Name, shortTitle, e.CreatedOn.ToString("yyyy-MM-dd"), iRow);

                iRow++;
            }
            this.RecommentListHTML = sb.ToString();
        }
        
        void RenderGrid(List<Entity> entities)
        {
            int mode = 2;

            StringBuilder sb = new StringBuilder();

            sb.Append("<ul>");
            string custId = caller.CustomerID;
            HttpContext context = HttpContext.Current;
            string retURL = context.Request["retURL"];
            retURL = HttpUtility.UrlEncode(retURL);
            int iRow = 1;
            bool canDownload = Settings.GetBoolSetting("Content.Attachmentt.Download", true);
            foreach (Entity entity in entities)
            {
                sb.Append("<li>");
                string fileExtension = StringUtil.GetString(entity.Fields["FileExtension"].Value);
                
                switch (fileExtension.ToLower())
                {
                    case ".doc":
                    case ".docx":
                    case "doc":
                    case "docx":
                    case ".xls":
                    case ".xlsx":
                    case "xls":
                    case "xlsx":
                        sb.AppendFormat(" <a href=\"/apps/files/DocEditor.aspx?id={0}&EditType=0,0&readonly=1&isAttach=1\" target=\"_blank\" title='{1}'>{1}</a>", entity.ID, StringUtil.GetString(entity.Fields["Name"].Value));
                        sb.AppendFormat(" | <a  target=\"_blank\" class=\"actionLink\" href=\"/apps/files/DocEditor.aspx?id={0}&EditType=0,0&readonly=1&OrganizationId=" + custId + "\">查看</a>", entity.ID);
                        break;
                    default:
                        sb.AppendFormat(" <a href=\"/apps/files/FileViewer.aspx?id={0}\" target=\"_blank\">{1}</a>", entity.ID, StringUtil.GetString(entity.Fields["Name"].Value));
                        sb.AppendFormat(" | <a title=\"查看 - 记录 {0} - 附件\" target=\"_blank\" class=\"actionLink\" href=\"/apps/files/FileViewer.aspx?id={1}&isAttach=1\">在线查看</a>", iRow, entity.ID);
                        break;
                }
                if (canDownload || this.AttachRightCode == 8 || this.AttachRightCode == 0)
                    sb.AppendFormat(" | <a  target=\"_blank\" class=\"actionLink\" href=\"/apps/files/FileDownload.aspx?id={0}&isAttach=1\">下载查看</a>", entity.ID);
                sb.Append("</li>");               

                mode++;
                iRow++;
            }
            sb.Append("</ul>");
            AttachHTML = sb.ToString();
        }
        void GetAttachments(string objectId)
        {

            QueryExpression queryExp = new QueryExpression();
            ConditionExpression cond = new ConditionExpression();
            cond.AttributeName = "ParentId";
            cond.Values = new object[] { objectId };
            cond.Operator = ConditionOperator.Equal;
            queryExp.Criteria.Add(cond);

            OrderExpression orderExp = new OrderExpression();
            orderExp.AttributeName = "CreatedOn";
            orderExp.OrderType = OrderType.Ascending;
            queryExp.Orders.Add(orderExp);

            EntityCollection  entities = EntityManager.GetEntities(caller, EntityTemplateIDs.RelatedAttachment, queryExp);
            //this.TotalRows = _entities.Count;

            RenderGrid(entities);
        }
        
        public string CreateByName { get; set; }
        public string CreateOn { get; set; }
        public string EntityId { get; set; }
        public string OwnerName { get { return ownerName; } set { ownerName = value; } }
        public string CTitle { get; set; }
        public int ReadCount { get; set; }
        public int LikeCount { get; set; }
        public string Contents { get; set; }
        public string FolderId { get; set; }
        public string FolderName { get; set; }
        public string StatusName { get; set; }
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public string Readers { get; set; }
        /// <summary>
        /// 附件权限
        /// </summary>
        public int AttachRightCode { get; set; }
        public string KeyWords { get; set; }

        public string AttachHTML { get; set; }
        public string RelatedHTML { get; set; }
        public string LatestHTML { get; set; }
        public string HotListHTML { get; set; }
        public string RecommentListHTML { get; set; }
    }
}