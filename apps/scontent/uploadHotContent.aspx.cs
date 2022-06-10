using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Configuration;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.IO;
using Supermore.Media;

namespace WebClient.apps.scontent
{
    public partial class uploadHotContent : System.Web.UI.Page
    {
        string _id = "";
        CallContext _caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = Request["id"];
            _caller = AppDataSource.GetCallContext();
            if (Request["Attach"]!=null)
            {
                SaveData();
            }
            GetData();
        }
        Entity entity = null;
        void GetData()
        {
            if (string.IsNullOrEmpty(_id)) return;
            entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.ContentHot, new Guid(_id));
            this.Description = StringUtil.GetString(entity.Fields["Description"].Value);
            this.Img = StringUtil.GetString(entity.Fields["Img"].Value);

            ImgUrl = string.Format("<img src='{0}' border='0' />", this.Img);
        }
        void SaveData()
        {
           // int imgHeight = 0;
           // int imgWidth = 0;
            string imgSrc = "";

            string rootPath = IOPaths.CustomerMediaCodePath + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + DateTime.Now.ToString("dd");
            string virtualPath = string.Format("/{0}/{1}/{2}/", DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"));
            if (!Directory.Exists(rootPath))
            {
                Directory.CreateDirectory(rootPath);
            }
            string imgURL = "";
            //imgURL = Settings.GetSetting("MediaWebSite");
            //if (imgURL.Substring(imgURL.Length - 1, 1) != "/")
            //{
            //    imgURL = imgURL + "/" + _caller.CustomerCode + "/";
            //}
            string targetFile = "";
            string fileName = "";
            string extName = "";
            string thumbnailImg = "";
            bool isUpload = false;
            Guid newid = Guid.NewGuid();
            int fileSize = 0;
            foreach (string key in this.Request.Files.Keys)
            {
                HttpPostedFile file = Request.Files.Get(key);
                fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                extName = FileUtil2.GetFileExtension(file.FileName);
                fileSize = file.ContentLength;
                string actualFileName = newid.ToString().ToUpper().Replace("-", "") + extName;
                targetFile = rootPath + "\\" + actualFileName;

                virtualPath += actualFileName;
                
                file.SaveAs(targetFile);

                thumbnailImg = MediaUtil.CropImage(newid, targetFile, rootPath, extName, 120, 120);

                isUpload = true;
            }
            //Size size = MediaUtil.GetSize(targetFile);
            //imgHeight = size.Height;
            //imgWidth = size.Width;
            imgURL += virtualPath;
            if (isUpload)
            {
               
                if (string.IsNullOrEmpty(_id))
                    entity = new Entity(newid, EntityTemplateIDs.ContentHot, new Guid(_caller.CustomerID));
                else
                    entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.ContentHot, new Guid(_id));
                entity.BeginEdit();
                entity.Fields["Name"].Value = Request["title"];
                entity.Fields["Description"].Value = Request["description"];
                entity.Fields["Img"].Value = imgURL;
                entity.Fields["ThumbnailImg"].Value = thumbnailImg;
                //entity.Fields["Width"].Value = virtualPath;
                //entity.Fields["Height"].Value = virtualPath;
                // OrganizationId
                entity.Fields["FileExtension"].Value = extName.TrimStart('.');
                entity.Fields["FileSize"].Value = fileSize;
                entity.Fields["CreatedBy"].Value = _caller.UserID;
                entity.Fields["ModifiedBy"].Value = _caller.UserID;
                //entity.Fields["OwningUser"].Value = _caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
               // entity.Fields["OrganizationId"].Value = _caller.CustomerID;
                //FileTypeCode
                entity.EndEdit();

                //FileManager.CreateVersion(_caller, newid, virtualPath, 0, 1, "");
            }
            Response.Redirect("/092/o");
         
        }

        public string Description { get; set; }
        public string Img { get; set; }
        public string ImgUrl { get; set; }
    }
}