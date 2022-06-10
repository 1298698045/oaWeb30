using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.Files;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;

namespace WebClient._ui.core.chatter.files
{
    public partial class detail : System.Web.UI.Page
    {
        CallContext caller; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                string id = Request["id"];
                caller = AppDataSource.doGetCallContext();
                FileEntity file = FileManager.GetFile(caller, new Guid(id));
                this.FileName = file.Name;
                this.FileId = file.ID.ToString();
                this.Desc = file.Description;
                this.OwningUser = file.OwningUser.ToString();
                this.ModifiedOn = file.InnerEntity.ModifiedOn.ToString("yyyy-MM-dd HH:mm:ss");
                this.OwningUserName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, file.OwningUser);
                string fileExt = file.FileExtension;
                if (fileExt.Equals("jpg", StringComparison.InvariantCultureIgnoreCase) ||
                    fileExt.Equals("jepg", StringComparison.InvariantCultureIgnoreCase) ||
                    fileExt.Equals("gif", StringComparison.InvariantCultureIgnoreCase) ||
                    fileExt.Equals("png", StringComparison.InvariantCultureIgnoreCase))
                {
                    //<img height=\"303\" width=\"538\" title=\"同学照片1\" onload=\"sizeImagePreview('imageRendition', '538', '338', 'invisible')\" class=\"fileImgRendition\" alt=\"同学照片1\" src="&amp;versionId=068900000018zXv&amp;operationContext=CHATTER&amp;contentId=05T90000003aTcI\" id=\"imageRendition\" style=\"margin-top: 15.75px;\">
                }
            }
        }

        public string FileName { get; set; }
        public string FileId { get; set; }
        public string Desc { get; set; }
        public string OwningUserName { get; set; }
        public string OwningUser { get; set; }
        public string ModifiedOn { get; set; }
    }
}