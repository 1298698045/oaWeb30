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

namespace WebClient.apps.usign
{
    public partial class uploadUsign : System.Web.UI.Page
    {
        private Guid fileId = Guid.Empty;
        private bool isUpload = false;
        private CallContext _caller;
        string parentName = "";
        byte[] mFileBody = null;
        string filePath = "";
        string _userName = "";
        string userId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this._caller = AppDataSource.GetCallContext();
            if (Request["Attach"] != null)
            {
                SaveFiles();
            }
            userId = Request["id"];
            if (userId != null)
            {
                _userName = EntityManager.GetEntityName(this._caller, EntityTemplateIDs.SystemUser, new Guid(userId));
            }
        }


        void SaveFiles()
        {
            //string parentType = Request["type"];
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("pid", Request["pid"]);
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("type", parentType);
            //this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("pid", Request["pid"]);
            //this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("type", parentType);
            //if (string.IsNullOrEmpty(parentType))
            //    parentType = "unkown";
            string userId = "";
            string userName = "";
            userId = Request["suser_lkid"];
            userName = Request["suser"];
            try
            {
                long fileSize = 0;
                string rootPath = "";// IOPaths.AttachFiles + "\\" + parentType + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM");
                // DateTime.Now.ToString("yyyy") + "/" + Datestring virtualPath =Time.Now.ToString("MM") + "/";
                //rootPath = Server.MapPath("/SysFiles/UserSignature");
                rootPath = IOPaths.UserSignatureImgs;
                // string virtualPath = "";
                if (!Directory.Exists(rootPath))
                {
                    Directory.CreateDirectory(rootPath);
                }
                string targetFile = "";
                // string fileName = "";
                string extName = "";
                // int seqNo = 1;
                foreach (string key in this.Request.Files.Keys)
                {
                    HttpPostedFile file = Request.Files.Get(key);
                    fileSize = file.ContentLength;
                    if (fileSize == 0)
                        continue;
                    //fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                    extName = FileUtil2.GetFileExtension(file.FileName).ToLower();

                    if (extName == ".png" || extName == ".jpg" || extName == ".jpeg" || extName == ".gif" || extName == ".bmp")
                    {
                    }
                    else
                        return;

                    string actualFileName = string.Format("{0}{1}", userId, extName);
                    targetFile = rootPath + "\\" + actualFileName;
                    //virtualPath += actualFileName;
                    // virtualPath = string.Format("/{0}/{1}/{2}/{3}", parentType, DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), actualFileName);
                    if (System.IO.File.Exists(targetFile))
                    {
                        System.IO.File.Delete(targetFile);
                    }
                    file.SaveAs(targetFile);
                    isUpload = true;

                    mFileBody = new byte[file.ContentLength];
                    Stream objStream = file.InputStream;
                    objStream.Read(mFileBody, 0, file.ContentLength);

                    #region upload
                    if (isUpload)
                    {
                        //fileId = Guid.NewGuid();
                        //Entity entity = new Entity(fileId, EntityTemplateIDs.RelatedAttachment, new Guid(_caller.CustomerID));
                        //entity.BeginEdit();
                        //entity.Fields["Name"].Value = fileName;
                        //entity.Fields["FileExtension"].Value = extName.TrimStart('.');
                        //entity.Fields["FileLocation"].Value = virtualPath;// Request["tsk13"];                
                        //entity.Fields["FileSize"].Value = fileSize;
                        //entity.Fields["ParentTypeCode"].Value = Request["type"];
                        //entity.Fields["ParentId"].Value = Request["pid"];
                        //entity.Fields["ParentName"].Value = parentName;
                        //entity.Fields["CreatedBy"].Value = _caller.UserID;
                        //entity.Fields["CreatedOn"].Value = DateTime.Now;
                        //entity.Fields["ModifiedBy"].Value = _caller.UserID;
                        //entity.Fields["ModifiedOn"].Value = DateTime.Now;
                        //entity.Fields["OwningUser"].Value = _caller.UserID;
                        //entity.Fields["OrganizationId"].Value = _caller.CustomerID;
                        ////FileTypeCode
                        //entity.EndEdit();                    
                        AttachFileManager.SaveUserSign(this._caller, userId, userName, extName, fileSize, mFileBody);
                    }
                    #endregion
                    //seqNo++;
                }
                Response.Redirect("/apps/wf/UserSignatureList.aspx?t=126");
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }

        public string UserName { get { return _userName; } set { _userName = value; } }
    }
}