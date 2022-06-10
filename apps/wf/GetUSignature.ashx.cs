using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.IO;
using Supermore;
using Supermore.Data;
using Youyou.Files;
using Supermore.Security;
using Supermore.Web;

namespace WebClient.apps.wf
{
    /// <summary>
    /// Summary description for GetUSignature
    /// </summary>
    public class GetUSignature : IHttpHandler
    {
        string id = "";
        HttpResponse Response;
        CallContext _caller = null;
        byte[] imageData = null;
        HttpContext _context;
        string extName = ".png";
        string organizationid = "";
        public void ProcessRequest(HttpContext context)
        {
            _context = context;
            _caller = AppDataSource.GetCallContext();
            Response = context.Response;
            id = context.Request["id"];
            organizationid = context.Request["organizationid"];
            //GetImageData();
            RenderImage();
        }
        void RenderImage()
        {
            try
            {
                // _context.Server.MapPath("/SysFiles/UserSignature");
                string rootPath = "";
                if (SiteUtil.IsMultipleCustomer)
                {
                   string orgId = SecurityAuth.GetUserOrganizationIdFromCenter(new Guid(id));
                   if (_caller.CustomerID != orgId)
                   {
                       _caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
                       rootPath = FileStorage.GetUserSignutureRootPath(_caller);
                   }
                   //Supermore.Diagnostics.Trace.LogError(string.Format("userid:{0},orgid:{1},path:{2}", id, orgId, rootPath));
                   if (string.IsNullOrEmpty(rootPath))
                   {
                       rootPath = IOPaths.UserSignatureImgs;
                   }
                }
                else
                {
                    //SecurityAuth.GetUserInfoFromCenter(id);
                    //FileStoreag
                    rootPath = IOPaths.UserSignatureImgs;
                }
                string filePath = rootPath + "\\" + id + extName;
                if (!Directory.Exists(rootPath))
                {
                    Directory.CreateDirectory(rootPath);
                }

                if (!File.Exists(filePath))
                {
                    Supermore.Diagnostics.Trace.LogError("签名路径不存在:" + filePath);
                    filePath = rootPath + "\\" + id + ".jpg";
                    if (File.Exists(filePath))
                    {
                        extName = ".jpg";
                        goto FileExistLabel;
                    }
                    else
                    {
                        Supermore.Diagnostics.Trace.LogError("UserSignatureImgs do not exists." + filePath);
                    }
                    extName = DatabaseTool.GetFirstCellStr(_caller, string.Format("SELECT SignExtName FROM WFUserSignature WHERE SignatureId='{0}' OR SystemUserID='{0}'", id), ".bmp");
                    if (string.IsNullOrEmpty(extName))
                    {
                        Response.End();
                        return;
                    }
                    imageData = DatabaseTool.GetByteData(_caller.CustomerID, string.Format("SELECT SignContent FROM WFUserSignature WHERE SignatureId='{0}' OR SystemUserID='{0}'", id), false);
                    if (imageData == null)
                    {
                        Response.End();
                        return;
                    }
                    File.WriteAllBytes(filePath, imageData);
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogError("签名路径:" + filePath);
                }
                //System.IO.Stream fs = null;
                //MemoryStream memoryStream = null;
                //string fileLocation = StringUtil.GetString(entity.Fields["FileLocation"].Value);
                //fileLocation = "/AttachFiles/" + fileLocation;
                // string filename = "";
            FileExistLabel:
                Console.Write("ok");

                string fileExtension = extName.TrimStart('.');
                string imgExt = fileExtension;
                Response.ContentType = "image/" + fileExtension;
                int length = 0;
                byte[] buffer = new byte[1024];
                using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                    {
                        Response.OutputStream.Write(buffer, 0, length);
                        //Response.Flush();
                    }
                }

                /*
                int W = 100;
                int H = 100;
                System.Drawing.Image img = System.Drawing.Image.FromFile(filePath);
                W = img.Width;
                H = img.Height;

                System.Drawing.Image _img = new Bitmap(W, H);
                Graphics g = Graphics.FromImage(_img);
                g.DrawImage(img, 0, 0, W, H);
                g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                g.Dispose();
                img.Dispose();
                MemoryStream memoryStream = new MemoryStream();
                _img = _img.GetThumbnailImage(W, H, null, IntPtr.Zero);

                switch (imgExt)
                {
                    case "jpg":
                        _img.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                        break;
                    case "png":
                        _img.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
                        break;
                    case "gif":
                        _img.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Gif);
                        break;
                    case "bmp":
                        _img.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Bmp);
                        break;
                    case "tiff":
                        _img.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Tiff);
                        break;
                    default:
                        break;
                }

                _img.Dispose();
                memoryStream.WriteTo(Response.OutputStream);
                memoryStream.Close();
                memoryStream.Dispose();
                */
               
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            Response.End();
        }
        void RenderImage1()
        {

            //System.IO.Stream fs = null;
            //MemoryStream memoryStream = null;
            //string fileLocation = StringUtil.GetString(entity.Fields["FileLocation"].Value);
            //fileLocation = "/AttachFiles/" + fileLocation;
            // string filename = "";          
            string contentType = "bmp";
            int W = 100;
            int H = 100;
            MemoryStream str = new MemoryStream(imageData);
            System.Drawing.Image img = System.Drawing.Image.FromStream(str);
            W = img.Width;
            H = img.Height;

            System.Drawing.Image _img = new Bitmap(W, H);
            Graphics g = Graphics.FromImage(_img);
            g.DrawImage(img, 0, 0, W, H);
            g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
            g.Dispose();
            img.Dispose();            
            _img = _img.GetThumbnailImage(W, H, null, IntPtr.Zero);
            string imgExt = contentType.ToLower();
            switch (imgExt)
            {
                case "jpg":
                    _img.Save(str, System.Drawing.Imaging.ImageFormat.Jpeg);
                    break;
                case "png":
                    _img.Save(str, System.Drawing.Imaging.ImageFormat.Png);
                    break;
                case "gif":
                    _img.Save(str, System.Drawing.Imaging.ImageFormat.Gif);
                    break;
                case "bmp":
                    _img.Save(str, System.Drawing.Imaging.ImageFormat.Bmp);
                    break;
                case "tiff":
                    _img.Save(str, System.Drawing.Imaging.ImageFormat.Tiff);
                    break;
                default:
                    break;
            }

            _img.Dispose();
            str.WriteTo(Response.OutputStream);
            str.Dispose();
            str.Close();
            Response.ContentType = "image/" + imgExt;
            Response.End();
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}