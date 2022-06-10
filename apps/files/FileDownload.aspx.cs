using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.EntityFramework.Entities;
using Supermore.Data;
using Supermore.Files;
using Supermore.IO;
using Supermore.Configuration;
using Youyou.Files;

namespace WebClient.apps.files
{
    public partial class FileDownload : System.Web.UI.Page
    {
        private byte[] buffer = new byte[10240];
        private int length = 0;
        CallContext _caller = null;
        string fileId = "";
        string fileExtension = "";
        string fileType = "1";//1001 附件，2 正文 100100 文件（管理）
        string _organizationId = "";
        string userFullName = "";
        string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            fileId = Request["id"];
            string isAttach = Request["isAttach"];
            _organizationId = Request["OrganizationId"];
            try
            {
                _caller = AppDataSource.GetCallContext();
                if (!string.IsNullOrEmpty(_organizationId))
                {
                    if (_caller.CustomerID.ToLower() != _organizationId.ToLower())
                    {
                        _caller = AppDataSource.GetCallerByCustomerId(new Guid(_organizationId));
                    }
                }
                
                if (_caller == null)
                {
                    //未登录情况下载
                    string orgId = Settings.GetSetting("Organization.ID");
                    _caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
                    WebContext.SetCallContext(_caller, true);
                }
                if (_caller == null)
                {
                    Response.Write("请登录后下载！");
                    return;
                }
               
                userName = _caller.UserName;
                userFullName = _caller.FullName+ userName;
                fileType = Request["filesource"];
                string virtualPath = "";
                string realPath = "";
                string rootPath = "";
                string filePath = "";
                string fileName = "";
                //1 - Attach
                //2 - Body
                //3 - File manager module
                if (isAttach == "1" || fileType == "1001")
                {
                    Entity entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.RelatedAttachment, new Guid(fileId));

                    virtualPath = StringUtil.GetString(entity.Fields["FileLocation"].Value);
                    realPath = virtualPath.Replace("/", "\\");
                    
                    rootPath = FileStorage.GetAttachRootPath(_caller);
                    if(string.IsNullOrEmpty(rootPath))
                        rootPath = IOPaths.AttachFiles;

                    filePath = rootPath + realPath;
                    fileName = StringUtil.GetString(entity.Fields["Name"].Value);
                    fileExtension = StringUtil.GetString(entity.Fields["FileExtension"].Value);

                    //保存下载日志
                    FilelibManager mgr = new FilelibManager();
                    FileLogModel fileLog = new FileLogModel();
                    fileLog.FileId = fileId;
                    fileLog.RegardingObjectTypeCode = 1001;
                    fileLog.IpAddr = Request.UserHostAddress;
                    fileLog.BrowserName = Request.Browser + Request.Browser.Version;
                    fileLog.ModifiedBy = _caller.UserID;
                    fileLog.ModifiedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    fileLog.CreatedBy = _caller.UserID;
                    fileLog.CreatedBy = _caller.UserID;
                    fileLog.CreatedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    fileLog.UserName = _caller.UserName;
                    fileLog.IsDownload = 1;
                    fileLog.OwningUser = _caller.UserID;
                    fileLog.ValueId = Guid.NewGuid().ToString();
                    
                    if (!mgr.ExistsFileLog(_caller, fileLog.FileId, fileLog.CreatedBy))
                    {
                        mgr.AddFileLog(_caller, fileLog);
                    }
                    else
                    {
                        mgr.UpdateDownloadFileLog(_caller, fileLog);
                    }

                }
                else
                {
                    FileEntity file = FileManager.GetFile(_caller, new Guid(fileId));
                    //fileName = StringUtil.GetString(entity.Fields["Name"].Value);
                    fileName = file.Name;
                    virtualPath = file.VirtualPath;
                    realPath = virtualPath.Replace("/", "\\");
                    rootPath = FileStorage.GetFileRootPath(_caller);
                    if (string.IsNullOrEmpty(rootPath))
                        rootPath = IOPaths.Files;

                    filePath = rootPath + realPath;
                    fileExtension = file.FileExtension;
                    //使用记录
                    FileManager.FileHitUse(_caller, new Guid(fileId));
                }

                DownloadFile(filePath, fileName);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        //private void DownloadFileFromFileManager(string file, string fileName)
        //{ 
        
        //}
        private void DownloadFile(string file,string fileName)
        {
            string mineType = "application/octet-stream";
            Response.Clear();
            Response.ContentType = mineType;          
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Charset = "UTF-8";
            string fName = "";

            string browserVersion = GetBrowser();

            if (HttpContext.Current.Request.Browser.Browser.IndexOf("Firefox") > -1)
                fName = fileName;
            else
                fName = HttpUtility.UrlEncode(fileName, System.Text.UTF8Encoding.UTF8);

            string dowloadFile = fName;
            string checkFileExt = "";
            checkFileExt = FileUtil2.GetFileExtensionWithoutDot(fileName);
            //dddd.txt - .txt
           bool hasExtName = true;
           if (string.IsNullOrEmpty(checkFileExt))
           {
               checkFileExt = fileExtension;
               hasExtName = false;
           }
           if (!hasExtName)
           {
               if (string.Compare(checkFileExt, fileExtension, false) > -1 || string.Compare(checkFileExt, "." + fileExtension, false) > -1)
               {
                   //Supermore.Diagnostics.Trace.LogToFile(fileExtension, "filedown.txt");
                   //Supermore.Diagnostics.Trace.LogToFile(fName, "filedown.txt");
                   if (fileExtension.Substring(0, 1) == ".")
                       dowloadFile = fName + fileExtension;
                   else
                       dowloadFile = fName + "." + fileExtension;
                   //Supermore.Diagnostics.Trace.LogToFile(dowloadFile, "filedown.txt");
               }
           }
            //add header
            Response.AddHeader("Content-Disposition", "attachment;filename=" + dowloadFile);
            //download
            try
            {
                if (File.Exists(file))
                {
                    if (fileExtension == "pdf")
                    {
                        bool enablePdfStamper = Supermore.Configuration.Settings.GetBoolSetting("File.PdfStamper.Download", false);
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

                            string outPutPath = IOPaths.UserTempFiles + "\\" + userName;
                            string stampPdfFile = Youyou.Pdf.Stamper.PdfWaterMaker.SetWatermark(file, outPutPath, stampText);
                            if (!string.IsNullOrEmpty(stampPdfFile))
                                file = stampPdfFile;
                        }
                    }
                    using (FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.Read))
                    {
                        long size = fs.Length;
                        long d1 = 1;
                        double fileMB = CalculateFileMB(size);
                        Response.AddHeader("Content-Length", fs.Length.ToString());
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            //if (fileMB >= 2 && (d1 % 5) == 0) //文件大于两M的
                            //{
                            //    System.Threading.Thread.Sleep(100);
                            //}
                            Response.OutputStream.Write(buffer, 0, length);
                            //向客户端发送当前所有缓冲的输出
                            Response.Flush();
                            d1 ++;
                        }
                    }
                                      
                    //将当前所有缓冲的输出关闭
                    Response.Close();
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogError(file + " file donload failure.fileid:" + fileId);
                    Response.Write("文件不存在");
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                Supermore.Diagnostics.Trace.LogError(file + " file donload failure.fileid:" + fileId);
                Supermore.Diagnostics.Trace.LogException(ex);
            }

            Response.End();
        }
        private static double CalculateFileMB(long fileS)
        {
            try
            {
                double fileSizeLong = 0;
                fileSizeLong = fileS / 1048576;
                return fileSizeLong;
            }
            catch (Exception ex)
            {
                return 0;
            }
            /*
            DecimalFormat df = new DecimalFormat("#.00");
           
            switch (sizeType)
            {
                case SIZETYPE_B:
                    fileSizeLong = Double.valueOf(df.format((double)fileS));
                    break;
                case SIZETYPE_KB:
                    fileSizeLong = Double.valueOf(df.format((double)fileS / 1024));
                    break;
                case SIZETYPE_MB:
                    fileSizeLong = Double.valueOf(df.format((double)fileS / 1048576));
                    break;
                case SIZETYPE_GB:
                    fileSizeLong = Double.valueOf(df.format((double)fileS / 1073741824));
                    break;
                default:
                    break;
            }
            return fileSizeLong;
            */
        }
 
 
        public static string GetBrowser()
        {
            HttpBrowserCapabilities bc = HttpContext.Current.Request.Browser;
            string browserName = bc.Browser + bc.Version;
            return browserName;
        }  
        private string GetFileName(string filepath)
        {
            //filepath:
            string[] parts = filepath.Split('\\');
            return parts[parts.Length - 1];
        }
    }
}