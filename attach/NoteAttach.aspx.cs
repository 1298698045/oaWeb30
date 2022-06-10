using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.IO;
using Supermore.Files;

namespace WebClient.attach
{
    public partial class NoteAttach : System.Web.UI.Page
    {
        CallContext caller = null;
        string upfileName = "";
        string parentName = "";
        string parentId = "";
        long fileSize = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            parentName = Request["parentname"];
            parentId = Request["pid"];

            if (Request["Attach"]!=null)
            {
                SaveData();
            }
        }
        void SaveData()
        {
            SaveUploadfile();

            Guid orgId = new Guid(caller.CustomerID);
            Entity entity = null;
            Guid fileId = Guid.NewGuid();
            entity = new Entity(fileId, EntityTemplateIDs.RelatedAttachment, orgId);

            entity.BeginEdit();
            entity.Fields["Name"].Value = upfileName;
            //entity.Fields["StateCode"].Value = 0;// Request["tsk12"];            
            entity.Fields["FileLocation"].Value = virtualLocation;// Request["tsk13"];
            entity.Fields["ParentTypeCode"].Value = 0;// Request["tsk12"];
            entity.Fields["ParentName"].Value = parentName;
            entity.Fields["ParentId"].Value = parentId;
            entity.Fields["FileSize"].Value = fileSize;
            entity.Fields["OrganizationId"].Value = orgId;
            entity.Fields["OwningUser"].Value = caller.UserID;
            entity.Fields["CreatedBy"].Value = caller.UserID;            
            entity.Fields["CreatedOn"].Value = DateTime.Now;
            entity.Fields["ModifiedBy"].Value = caller.UserID;
            entity.Fields["ModifiedOn"].Value = DateTime.Now;
            bool isSaved = entity.EndEdit();
            string fileDate =DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string retUrl = Request["retURL"];
            if (isSaved)
            {
                AttachFileManager.SaveFileInfo(caller, fileId.ToString(), upfileName, fileExtension, "", caller.UserName, fileDate , "", "draft");

                AttachFileManager.SaveFile(caller, fileId.ToString(), upfileName, fileExtension, fileSize, fileDate, caller.UserName, filePath, "", mFileBody);
                Response.Redirect(retUrl + "&id=" + parentId);
            }

        }
        string saveFile = "";
        string virtualLocation = "";
        string fileExtension = "";
        byte[] mFileBody = null;
        string filePath = "";
        bool SaveUploadfile()
        {
            
            try
            {
                string folder = IOPaths.RelateAttachFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\";
                
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                HttpPostedFile file = Request.Files.Get("file");
                fileSize = file.ContentLength;
                if (fileSize > 0)
                {
                    fileExtension = Supermore.IO.FileUtil2.GetFileExtension(file.FileName);
                    upfileName = Supermore.IO.FileUtil2.GetFileNameWithoutExtension(file.FileName);
                    string fileName = "atta_" + DateTime.Now.ToString("yyyyMMddHHmmss") + fileExtension;
                    saveFile = folder + fileName;
                    //read mFile body
                    //mFileBody = new byte[file.ContentLength];
                    //Stream objStream = file.InputStream;
                    //objStream.Read(mFileBody, 0, file.ContentLength);

                    virtualLocation = string.Format("/{0}/{1}/{2}", DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), fileName);
                    //if (FileUtil.FileExists(saveFile))
                    //{
                    //    saveFile = IOPaths.SmsUplodFiles + "\\" + DateTime.Now.ToString("yyyyMMddhhmmss") + "_" + file.FileName;
                    //}

                    file.SaveAs(saveFile);
                }
                return true;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex, saveFile);
                return false;
            }
        }
    }
}