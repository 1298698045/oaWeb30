using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;


using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using OA.Web.UI.FieldControls;
using Supermore.IO;
using Supermore.Files;
using Supermore.Configuration;
using Youyou.Files;

namespace WebClient.apps.files
{
    public partial class FileViewer : System.Web.UI.Page
    {
        private Entity entity;
        private CallContext _caller = null;
        private string id = "";
        private string _renderResult = "";
        private int length = 0;
        private byte[] buffer = new byte[1024];
        private string fileExtension = "";
        private string fileSource = "";
        private string contentType = "";
        private string virtualPath = "";
        private string rootPath = "";
        private string filePath = "";
        private string fileName = "";
        private string realPath = "";
        private string _organizationId = "";
        string userFullName = "";
        string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["id"];
            _organizationId = Request["OrganizationId"];

            _caller = AppDataSource.GetCallContext();
            if (!string.IsNullOrEmpty(_organizationId))
            {
                if (_caller.CustomerID.ToLower() != _organizationId.ToLower())
                {
                    _caller = AppDataSource.GetCallerByCustomerId(new Guid(_organizationId));
                }
            }
            else
            {
                _organizationId = _caller.CustomerID;
            }
            if (_caller == null)
            {
                //未登录情况下载
                string orgId = Settings.GetSetting("Organization.ID");
                _caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
                WebContext.SetCallContext(_caller, true);
            }
            userName = _caller.UserName;
            userFullName = _caller.FullName + userName;
            fileSource = Request["filesource"];
            if (Request["filesource"] == ObjectTypeCodes.File.ToString())
            {
                GetEntityFile();
            }
            else if (Request["filesource"] == ObjectTypeCodes.MailAttach.ToString())
            {
                GetEmailAttachEntity();
            }
            else
            {
                fileSource = ObjectTypeCodes.RelatedAttachment.ToString();
                GetAttachEntity();
            }
           
            switch (fileExtension.ToLower())
            {
                //case "doc":
                //    contentType = "application/x-doc";
                //    RenderPdf(fileExtension);
                //    break;
                //case "docx":
                //    contentType = "application/x-docx";
                //    RenderPdf(fileExtension);
                //    break;
                case "doc":
                case "docx":
                    WordToPdfPreview();
                    break;
                case "xls":
                case "xlsx":
                    contentType = "application/x-xls";
                    RenderPdf(fileExtension);
                    break;
                case "jpg":
                case "jpeg":
                case "png":
                case "gif":
                case "bmp":
                    contentType = "application/" + fileExtension;
                    RenderImage();
                    break;
                case ".pdf":
                case "pdf":
                    contentType = "application/pdf";
                    RenderPdf(fileExtension);
                    break;
                case ".html":
                case "html":
                case ".txt":
                case "txt":
                    contentType = "text/plain";
                    RenderFile(fileExtension);
                    break;
                default:
                    contentType = "application/octet-stream";
                   // contentType = "application/" + fileExtension;
                    RenderOther(fileExtension);
                    break;
            }
        }

        void RenderPdf(string fileExtension)
        {
            try
            {
                string file = filePath;
                //string fName = "";
                //if (HttpContext.Current.Request.Browser.Browser.IndexOf("Firefox") > -1)
                //    fName = fileName;
                //else
                //    fName = HttpUtility.UrlEncode(fileName, System.Text.UTF8Encoding.UTF8);
                bool enablePdfStamper = Supermore.Configuration.Settings.GetBoolSetting("File.PdfStamper.Enable", false);
                if (enablePdfStamper) //启用
                {
                    string stampText = userName;                  
                    string stampTextType = MainUtil2.DocumentStampTextType();
                    if (stampTextType == "NameEmployeeNo")
                    {
                        stampText = userFullName;
                    }
                    else if (stampTextType == "Name")
                    {
                        stampText = _caller.FullName;
                    }
                    else
                    {                       
                        stampText = userName;
                    }

                    string outPutPath = IOPaths.UserTempFiles+"\\"+ userName;
                    string stampPdfFile = Youyou.Pdf.Stamper.PdfWaterMaker.SetWatermark(file, outPutPath, stampText);
                    if (!string.IsNullOrEmpty(stampPdfFile))
                        file = stampPdfFile;
                }


                Response.Clear();
                Response.ContentType = contentType;
                //Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Response.AddHeader("ContentType", contentType);
               
               // Supermore.Diagnostics.Trace.LogToFile(file, "file.txt");
                if (File.Exists(file))
                {
                    using (FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.Read))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            Response.OutputStream.Write(buffer, 0, length);
                            //Response.Flush();
                        }
                    }
                   
                }
                else
                {
                    Response.Write("文件不存在");
                    Supermore.Diagnostics.Trace.LogToFile(file + ",不存在", "file.txt");
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            
            Response.End();

        }
        void RenderOther(string fileExtension)
        {
            try
            {
                string fName = "";
                if (HttpContext.Current.Request.Browser.Browser.IndexOf("Firefox") > -1)
                    fName = fileName;
                else
                    fName = HttpUtility.UrlEncode(fileName, System.Text.UTF8Encoding.UTF8);

                Response.Clear();
                Response.ContentType = contentType;
                Response.AddHeader("Content-Disposition", "attachment;filename=" + fName);
                //Response.ContentType = "application/" + fileExtension;
                Response.AddHeader("ContentType", contentType);
                string file = filePath;
                if (File.Exists(file))
                {
                    using (FileStream fs = new FileStream(file, FileMode.Open))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            Response.OutputStream.Write(buffer, 0, length);
                            Response.Flush();
                        }
                    }
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogToFile(file + ",不存在", "file.txt");
                    Response.Write("文件不存在");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

                Supermore.Diagnostics.Trace.LogException(ex);
            }
                        
            Response.End();
            
        }
        void RenderFile(string fileExtension)
        {
            try
            {
                //string fName = "";
                //if (HttpContext.Current.Request.Browser.Browser.IndexOf("Firefox") > -1)
                //    fName = fileName;
                //else
                //    fName = HttpUtility.UrlEncode(fileName, System.Text.UTF8Encoding.UTF8);
                Response.Clear();
                Response.ContentType = contentType;
                //Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Response.AddHeader("ContentType", contentType);
                string file = filePath;
                // Supermore.Diagnostics.Trace.LogToFile(file, "file.txt");
                if (File.Exists(file))
                {
                    using (FileStream fs = new FileStream(file, FileMode.Open, FileAccess.ReadWrite, FileShare.ReadWrite))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            Response.OutputStream.Write(buffer, 0, length);
                            //Response.Flush();
                        }
                    }

                }
                else
                {
                    Supermore.Diagnostics.Trace.LogToFile(file + ",不存在", "file.txt");
                    Response.Write("文件不存在");
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                Supermore.Diagnostics.Trace.LogException(ex);
            }

            Response.End();

        }

        void WordToPdfPreview()
        {
            if (File.Exists(filePath))
            {
                string fileTempPath = IOPaths.Files;
                string targetPath = fileTempPath + @"\temp\";
                //检查 目标目录是否存在,不存在创建
                if (!Directory.Exists(targetPath))
                {
                    Directory.CreateDirectory(targetPath);
                }

                targetPath += Guid.NewGuid().ToString() + ".pdf";
                //OfficeToPdf.WordConvertPDF(filePath, targetPath);
                filePath = targetPath;
                contentType = "application/pdf";
                RenderFile("pdf");
            }
            else
            {
                Supermore.Diagnostics.Trace.LogToFile(filePath + ",不存在", "file.txt");
                Response.Write("文件不存在");
            }
        }


        void ExcelToPdfPreview()
        {

            if (File.Exists(filePath))
            {
                string fileTempPath = IOPaths.Files;
                string targetPath = fileTempPath + @"\temp\";
                //检查 目标目录是否存在,不存在创建
                if (!Directory.Exists(targetPath))
                {
                    Directory.CreateDirectory(targetPath);
                }

                targetPath += Guid.NewGuid().ToString() + ".pdf";
                //OfficeToPdf.ExcelConvertPDF(filePath, targetPath);
                filePath = targetPath;
                contentType = "application/pdf";
                RenderFile("pdf");
            }
            else
            {
                Response.Write("文件不存在");
            }
        }

      
        void RenderImage()
        {
            string img = string.Format("<html><body><center><img src='/ImageHandler.ashx?id={0}&filesource={1}&OrganizationId={2}' style='max-width:1024px;' /></center></body></html>", id, fileSource,_organizationId);
            this.Response.Write(img);
        }
        void GetAttachEntity()
        {
            try
            {
                entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.RelatedAttachment, new Guid(id));
                if (entity == null)
                {
                    Supermore.Diagnostics.Trace.LogError(string.Format("{0},不存在",id));
                    return;
                }
                virtualPath = StringUtil.GetString(entity.Fields["FileLocation"].Value);
                realPath = virtualPath.Replace("/", "\\");
                //rootPath = IOPaths.AttachFiles;
                rootPath = FileStorage.GetAttachRootPath(_caller);
                if (string.IsNullOrEmpty(rootPath))
                    rootPath = IOPaths.AttachFiles;
                filePath = rootPath + realPath;
                fileName = StringUtil.GetString(entity.Fields["Name"].Value);
                //contentType = FileUtil2.GetFileExtensionWithoutDot(filePath);

                fileExtension = StringUtil.GetString(entity.Fields["FileExtension"].Value);
                fileExtension = fileExtension.TrimStart('.');

                //使用记录
                FileManager.FileHitUse(this._caller, new Guid(id));

                //保存下载日志
                FilelibManager mgr = new FilelibManager();
                FileLogModel fileLog = new FileLogModel();
                fileLog.FileId = id;
                fileLog.RegardingObjectTypeCode = 1001;
                fileLog.IpAddr = Request.UserHostAddress;
                fileLog.BrowserName = Request.Browser + Request.Browser.Version;
                fileLog.ModifiedBy = _caller.UserID;
                fileLog.ModifiedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                fileLog.CreatedBy = _caller.UserID;
                fileLog.CreatedBy = _caller.UserID;
                fileLog.CreatedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                fileLog.UserName = _caller.UserName;
                fileLog.IsDownload = 0;
                fileLog.OwningUser = _caller.UserID;
                fileLog.ValueId = Guid.NewGuid().ToString();


                if (!mgr.ExistsFileLog(_caller, fileLog.FileId, fileLog.CreatedBy))
                {
                    mgr.AddFileLog(_caller, fileLog);
                }
                else
                {
                    mgr.UpdateReadFileLog(_caller, fileLog);
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        /// <summary>
        /// 文件来源是 文件管理
        /// </summary>
        void GetEntityFile()
        {

            FileEntity fileEntity = FileManager.GetFile(this._caller, new Guid(id));
             if (fileEntity != null)
            {
                fileName = fileEntity.Name;
                virtualPath = fileEntity.VirtualPath;
                realPath = virtualPath.Replace("/", "\\");
                //rootPath = IOPaths.Files;
                rootPath = FileStorage.GetFileRootPath(_caller);
                if (string.IsNullOrEmpty(rootPath))
                    rootPath = IOPaths.Files;
                
                filePath = rootPath + realPath;
                fileExtension = fileEntity.FileExtension;
                fileExtension = fileExtension.TrimStart('.');

                //使用记录
                FileManager.FileHitUse(this._caller, new Guid(id));
            }
        }

        void GetEmailAttachEntity()
        {
            try
            {
                //邮件附件
                entity = EntityManager.GetEntity(_caller, ObjectTypeCodes.MailAttach, new Guid(id));
                if (entity == null)
                {
                    Supermore.Diagnostics.Trace.LogError(string.Format("{0},不存在", id));
                    return;
                }
                virtualPath = StringUtil.GetString(entity.Fields["FileLocation"].Value);
                realPath = virtualPath.Replace("/", "\\");
                rootPath = IOPaths.EmailAttachFiles;
                filePath = rootPath + realPath;
                fileName = StringUtil.GetString(entity.Fields["Name"].Value);

                fileExtension = StringUtil.GetString(entity.Fields["FileExtension"].Value);
                fileExtension = fileExtension.TrimStart('.');


            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        public void GetAttachEntity1()
        {
         
        }
        public string RenderResult
        {
            get { return _renderResult; }
        }


        private System.Drawing.Image GetImage(int id)
        {
            // Not sure how you are building your MemoryStream
            // Once you have it, you just use the Image class to 
            // create the image from the stream.
            MemoryStream stream = new MemoryStream();
            return System.Drawing.Image.FromStream(stream);
        }
    }
}