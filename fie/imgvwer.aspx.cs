using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;

namespace WebClient.fie
{
    public partial class imgvwer : System.Web.UI.Page
    {
        string parentId = "";
        string objectId = "";
        CallContext _caller = null;
        protected EntityCollection _entities = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            parentId = Request["parentId"];
            //附件包括自己 以及父亲实例的
            string queryAttachSql = "select * from RelatedAttachmentBase Where ParentId='{0}' and (FileExtension  like '%jpg%' OR FileExtension like '%png%' OR  FileExtension like '%gif%') Order by CreatedOn";
            queryAttachSql = string.Format(queryAttachSql, parentId);
             StringBuilder sb = new StringBuilder();
            _entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.RelatedAttachment, queryAttachSql);
            if (_entities != null)
            {
                foreach (Entity entity in _entities)
                {
                    sb.AppendFormat("<li><img data-original=\"/ImageHandler.ashx?id={0}&filesource={1}\" src=\"/ImageHandler.ashx?id={0}&filesource={1}\" alt=\"{2}\" title=\"{2}\"></li>", entity.ID, ObjectTypeCodes.RelatedAttachment, entity.Name);
                }
            }
            this.AttachmentListHTML = sb.ToString();
        }
        public string AttachmentListHTML { get; set; }
    }
}