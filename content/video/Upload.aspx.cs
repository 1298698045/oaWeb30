using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.EntityFramework.Entities;
using Supermore.Files;
using Supermore.Data;
using Supermore.IO;
using Supermore.Contents;
using System.IO;

namespace Supermore.content.video
{
    public partial class Upload : System.Web.UI.Page
    {
        private Guid fileId = Guid.Empty;
        private bool isUpload = false;
        private CallContext _caller;
        string parentName = "";
        byte[] mFileBody = null;
        string filePath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            this._caller = AppDataSource.GetCallContext();
            if (Request["Attach"] != null)
            {
                SaveFiles();
            }
            //int entityTypeCode = ObjectTypeCodes.File;
            //EntityCollection entities = ItemTreeManager.GetAllFolders(_caller, entityTypeCode);
          
            //this.folderPicker.Caller = _caller;
            //this.folderPicker.EnableAccess = true;
            //this.folderPicker.DataSource = entities;
            //this.folderPicker.SelectValue = FileIDs.MyFileFolder.ToString();
            //if (!string.IsNullOrEmpty(Request["pid"]))
            //{
            //    this.folderPicker.SelectValue = Request["pid"];
            //}
        }

        void SaveFiles()
        {
            string parentType = Request["type"];
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("pid", Request["pid"]);
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("type", parentType);
            //this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("pid", Request["pid"]);
            //this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("type", parentType);
            if (string.IsNullOrEmpty(parentType))
                parentType = "unkown";

            long fileSize = 0;
            string rootPath = IOPaths.Files + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM");
            // DateTime.Now.ToString("yyyy") + "/" + Datestring virtualPath =Time.Now.ToString("MM") + "/";
            string virtualPath = "";
            string parentId = Request["folderPicker"];
            try
            {
                if (!Directory.Exists(rootPath))
                {
                    Directory.CreateDirectory(rootPath);
                }
                string targetFile = "";
                string fileName = "";
                string extName = "";
                int seqNo = 1;
                foreach (string key in this.Request.Files.Keys)
                {
                    HttpPostedFile file = Request.Files.Get(key);
                    fileSize = file.ContentLength;
                    if (fileSize == 0)
                        continue;

                    fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                    extName = FileUtil2.GetFileExtension(file.FileName).ToLower();

                    if (extName == ".exe" || extName == ".js" || extName == ".asp" || extName == ".aspx" || extName == ".jsp" || extName == ".php"
                        || extName == ".lnk" || extName == ".css" || extName == ".dll" || extName == ".msu" || extName == ".shtml")
                    {
                        continue;
                    }
                    
                    string actualFileName = string.Format("{0}_{1}_{2}{3}", parentType, DateTime.Now.ToString("yyyyMMddHHmmss"), seqNo, extName);
                    targetFile = rootPath + "\\" + actualFileName;

                    virtualPath = string.Format("/{0}/{1}/{2}", DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), actualFileName);
                    file.SaveAs(targetFile);
                    isUpload = true;

                    #region upload
                    if (isUpload)
                    {
                        fileId = Guid.NewGuid();
                        Entity entity = new Entity(fileId, EntityTemplateIDs.File, _caller.OrganizationId);
                        entity.BeginEdit();
                        entity.Fields["Name"].Value = fileName.Replace(".", "_");
                        entity.Fields["FileExtension"].Value = extName.TrimStart('.');
                        entity.Fields["VirtualPath"].Value = virtualPath;// Request["tsk13"];                
                        entity.Fields["FileSize"].Value = fileSize;
                        //entity.Fields["ParentTypeCode"].Value = Request["type"];
                        entity.Fields["FolderId"].Value = parentId;
                        //entity.Fields["ParentName"].Value = parentName;
                        entity.Fields["CreatedBy"].Value = _caller.UserID;
                        entity.Fields["CreatedOn"].Value = DateTime.Now;
                        entity.Fields["ModifiedBy"].Value = _caller.UserID;
                        entity.Fields["ModifiedOn"].Value = DateTime.Now;
                        entity.Fields["OwningUser"].Value = _caller.UserID;
                        entity.Fields["OrganizationId"].Value = _caller.CustomerID;
                        //FileTypeCode
                        entity.EndEdit();                       
                    }
                    #endregion
                    seqNo++;
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
    }
}