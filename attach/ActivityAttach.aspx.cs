using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Supermore;
using Supermore.EntityFramework.Entities;
using Supermore.Files;
using Supermore.Data;
using Supermore.IO;

namespace WebClient.attach
{
    public partial class ActivityAttach : System.Web.UI.Page
    {
        private Guid fileId = Guid.Empty;
        private bool isUpload = false;
        private CallContext _caller;
        string parentName = "";
        byte[] mFileBody = null;
        string filePath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Attach"] != null)
            {
                this._caller = AppDataSource.GetCallContext();
                SaveFiles();
            }
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
            string rootPath = IOPaths.AttachFiles + "\\" + parentType + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM")+"\\" + DateTime.Now.ToString("dd");
            // DateTime.Now.ToString("yyyy") + "/" + Datestring virtualPath =Time.Now.ToString("MM") + "/";
            string virtualPath = "";
            if (!Directory.Exists(rootPath))
            {
                Directory.CreateDirectory(rootPath);
            }
            try
            {
                string targetFile = "";
                string fileName = "";
                string extName = "";
                int seqNo = 1;
                string parentId = Request["pid"];
                string CategoryName = Request["CategoryName"];
                int AccessRight = MainUtil.GetInt(Request["AccessRight"], 0);
                //foreach (string key in this.Request.Files.Keys)
                for (int c = 0; c < this.Request.Files.Count; c++)
                {
                    //HttpPostedFile file = Request.Files.Get(key);
                    HttpPostedFile file = Request.Files[c];
                    fileSize = file.ContentLength;
                    if (fileSize == 0)
                    {
                       // Supermore.Diagnostics.Trace.LogError("Upload File attach size 0.");
                        continue;
                    }
                    //fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                    fileName = FileUtil2.GetFileName(file.FileName);
                    extName = FileUtil2.GetFileExtension(file.FileName).ToLower();

                    if (extName == ".exe" || extName == ".js" || extName == ".asp" || extName == ".aspx" || extName == ".jsp" || extName == ".php"
                        || extName == ".lnk" || extName == ".css" || extName == ".dll" || extName == ".msu" || extName == ".shtml")
                    {
                        continue;
                    }
                    //if (string.Compare(extName, ".zip", true)==0)//相等
                    //{
                    //    //UnzipFiles(file);
                    //    //return;
                    //}
                    fileId = Guid.NewGuid();

                    //string actualFileName = string.Format("{0}_{1}_{2}{3}", parentType, DateTime.Now.ToString("yyyyMMddHHmmss"), seqNo, extName);
                    string actualFileName = string.Format("{0}{1}", fileId.ToString().ToUpper(), extName);
                    targetFile = rootPath + "\\" + actualFileName;
                    //virtualPath += actualFileName;
                    virtualPath = string.Format("/{0}/{1}/{2}/{3}/{4}", parentType, DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"), actualFileName);

                    file.SaveAs(targetFile);
                    isUpload = true;
                    /*
                    if (extName.Equals(".doc", StringComparison.InvariantCultureIgnoreCase) || extName.Equals(".docx", StringComparison.InvariantCultureIgnoreCase)
                        || extName.Equals(".xls", StringComparison.InvariantCultureIgnoreCase)
                        || extName.Equals(".xlsx", StringComparison.InvariantCultureIgnoreCase))
                    {
                        mFileBody = new byte[file.ContentLength];
                        Stream objStream = file.InputStream;
                        objStream.Read(mFileBody, 0, file.ContentLength);
                    }
                    */
                    #region upload
                    if (isUpload)
                    {
                        AttachFileManager.CreateAttachFileInfo(_caller, fileId, fileName, fileSize, parentType, parentId, parentName, virtualPath, CategoryName, AccessRight);
                        /*
                        Entity entity = new Entity(fileId, EntityTemplateIDs.RelatedAttachment, new Guid(_caller.CustomerID));
                        entity.BeginEdit();
                        entity.Fields["Name"].Value = fileName;
                        entity.Fields["FileExtension"].Value = extName.TrimStart('.');    
                        entity.Fields["FileLocation"].Value = virtualPath;// Request["tsk13"];                
                        entity.Fields["FileSize"].Value = fileSize;
                        entity.Fields["ParentTypeCode"].Value = parentType;
                        entity.Fields["ParentId"].Value = parentId;
                        entity.Fields["ParentName"].Value = parentName;
                        entity.Fields["CreatedBy"].Value = _caller.UserID;
                        entity.Fields["CreatedOn"].Value = DateTime.Now;
                        entity.Fields["ModifiedBy"].Value = _caller.UserID;
                        entity.Fields["ModifiedOn"].Value = DateTime.Now;
                        entity.Fields["OwningUser"].Value = _caller.UserID;
                        entity.Fields["OrganizationId"].Value = _caller.CustomerID;

                        if (entity.Fields["CategoryName"] != null)
                        {
                            if (!string.IsNullOrEmpty(CategoryName))
                                entity.Fields["CategoryName"].Value = CategoryName;
                        }
                        //FileTypeCode
                        entity.EndEdit();
                        */
                        /*可以直接读目录文件了*/
                        /*
                        if (extName.Equals(".doc", StringComparison.InvariantCultureIgnoreCase) || extName.Equals(".docx", StringComparison.InvariantCultureIgnoreCase)
                            || extName.Equals(".xls", StringComparison.InvariantCultureIgnoreCase)
                            || extName.Equals(".xlsx", StringComparison.InvariantCultureIgnoreCase))
                        {
                            string fileDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            AttachFileManager.SaveFileInfo(this._caller, fileId.ToString(), fileName, extName, "", _caller.UserName, fileDate, "", "draft");
                            AttachFileManager.SaveFile(this._caller, fileId.ToString(), fileName, extName, fileSize, fileDate, _caller.UserName, filePath, "", mFileBody);
                        }
                        */
                    }
                    #endregion
                    seqNo++;
                }
                Response.Write("<script>if(window.opener.entityFile){window.opener.entityFile.load();}if(window.opener.entityAttachmentList){window.opener.entityAttachmentList.load();}window.close();</script>");}
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
           
        }
        void UnzipFiles(HttpPostedFile file,string parentId,string parentType)
        {
            try
            {
                string tempFiles = IOPaths.TempFiles;
                string myTempFolder = string.Format("{0}\\{1}", tempFiles, _caller.UserName);
                if (Directory.Exists(myTempFolder))
                {
                    //string[] files = Directory.GetFiles(myTempFolder);// FileUtil2.GetFiles(myTempFiles, "*.*", SearchOption.TopDirectoryOnly);
                    FileUtil2.DeleteDirectoryFiles(myTempFolder);
                }
                else
                {
                    Directory.CreateDirectory(myTempFolder);
                }
                string actualFileName = FileUtil2.GetFileName(file.FileName);
                string sourceZipFile = myTempFolder + "\\" + actualFileName;
                string uzipFolder = myTempFolder + "\\unzip";
                file.SaveAs(sourceZipFile);
                Unzipper unzipper = new Unzipper();
                string fileName = FileUtil2.GetFileName(file.FileName);
                unzipper.Unzip(sourceZipFile, uzipFolder);
                 
                AttachFileManager.CreateAttachFileInfos(_caller, uzipFolder, parentType, parentId, "");

                FileUtil2.DeleteDirectoryFiles(uzipFolder);
            }
            catch
            { 
            
            }
        }
    }
}