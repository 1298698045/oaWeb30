using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using WorkReportCore.Model;
using System.IO;
using Supermore.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace WebClient.apps
{




    /// <summary>
    /// uploadFile 的摘要说明
    /// </summary>
    public class uploadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string dataType = context.Request["type"];
            string responseValue = string.Empty;
            switch (dataType.ToLower())
            {
                case "attachment":
                    responseValue = UploadAttachment(context);
                    break;
                case "img":
                    responseValue = UploadImg(context);
                    break;
                case "pollimg":
                    responseValue = PollUploadImg(context);
                    break;
                case "downimg":
                    DownloadImgFile(context, "");
                    break;
                case "downfile":
                    DownloadFile(context, "");

                    break;
                case "downpollimg":
                    DownloadPollImgFile(context, "");
                    break;

                case "headimg":
                    HeadImgUpload(context);
                    break;
            }

            context.Response.Write(responseValue);
        }
        public string HeadImgUpload(HttpContext context)
        {
            //string ext = context.Request["ext"].ToString().Trim();

            var btsdata = Convert.FromBase64String(context.Request["varGuid"].Split(',')[1]);
            try
            {
                string uploadDir = context.Server.MapPath("/Upload/");// + Guid.NewGuid().ToString("D") + ".png");

                string savePath = context.Server.MapPath("/Upload/" + Guid.NewGuid().ToString("D") + ".png");
                if (!Directory.Exists(uploadDir))
                {
                    Directory.CreateDirectory(uploadDir);
                }

                using (Image img = Image.FromStream(new MemoryStream(btsdata)))
                {
                    img.Save(savePath, ImageFormat.Png);
                }
            }
            catch (Exception ex)
            {

            }

            return "";

        }
        public string UploadAttachment(HttpContext context)
        {
            HttpFileCollection files = context.Request.Files;



            var varGuid = context.Request["varGuid"];
            var guid = Guid.NewGuid().ToString();
            if (files.Count > 0)//Form中获取文件对象
            {
                HttpPostedFile file = files[0];
                if (file.ContentLength > 0)//文件大小大于零
                {
                    var ext = Path.GetExtension(file.FileName).ToLower();

                    string filePath = Supermore.IOPaths.TempFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + varGuid + "\\attachment\\";
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    string path = filePath + guid + "_" + file.FileName;

                    file.SaveAs(path);

                    return JsonConvert.SerializeObject(new JsonResult { status = 1, result = string.Format("/apps/uploadFile.ashx?type=downfile&file={0}&varGuid={1}", guid + ext, varGuid) });

                }
            }
            return "";
        }
        public string PollUploadImg(HttpContext context)
        {
            HttpFileCollection files = context.Request.Files;


            var varGuid = context.Request["varGuid"];
            var guid = Guid.NewGuid().ToString();
            if (files.Count > 0)//Form中获取文件对象
            {
                HttpPostedFile file = files[0];
                if (file.ContentLength > 0)//文件大小大于零
                {
                    var ext = Path.GetExtension(file.FileName).ToLower();
                    if (!(ext == ".jpeg" || ext == ".jpg" || ext == ".png" || ext == ".gif"))
                    {
                        return JsonConvert.SerializeObject(new JsonResult { status = -1, message = "请上传正确格式图片" });

                    }
                    else
                    {
                        string filePath = Supermore.IOPaths.TempFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + varGuid + "\\pollimg\\";

                        if (!Directory.Exists(filePath))
                        {
                            Directory.CreateDirectory(filePath);
                        }
                        string path = filePath + guid + ext;

                        file.SaveAs(path);
                        return JsonConvert.SerializeObject(new JsonResult { status = 1, result = string.Format("/apps/uploadFile.ashx?type=downpollimg&imgid={0}&varGuid={1}", guid + ext, varGuid), other = guid + ext });

                    }
                }
            }
            return "";
        }
        public string UploadImg(HttpContext context)
        {
            HttpFileCollection files = context.Request.Files;


            var varGuid = context.Request["varGuid"];
            var guid = Guid.NewGuid().ToString();
            if (files.Count > 0)//Form中获取文件对象
            {
                HttpPostedFile file = files[0];
                if (file.ContentLength > 0)//文件大小大于零
                {
                    var ext = Path.GetExtension(file.FileName).ToLower();
                    if (!(ext == ".jpeg" || ext == ".jpg" || ext == ".png" || ext == ".gif"))
                    {
                        return JsonConvert.SerializeObject(new JsonResult { status = -1, message = "请上传正确格式图片" });

                    }
                    else
                    {
                        string filePath = Supermore.IOPaths.TempFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + varGuid + "\\img\\";

                        if (!Directory.Exists(filePath))
                        {
                            Directory.CreateDirectory(filePath);
                        }
                        string path = filePath + guid + ext;

                        file.SaveAs(path);
                        return JsonConvert.SerializeObject(new JsonResult { status = 1, result = string.Format("/apps/uploadFile.ashx?type=downimg&imgid={0}&varGuid={1}", guid + ext, varGuid) });

                    }
                }
            }
            return "";
        }
        private void DownloadPollImgFile(HttpContext context, string filePath)
        {

            var imgid = context.Request["imgid"];

            var varGuid = context.Request["varGuid"];
            byte[] buffer = new byte[1024];
            int length = 0;
            try
            {
                filePath = Supermore.IOPaths.TempFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + varGuid + "\\pollimg\\" + imgid;

                context.Response.Clear();
                context.Response.ContentType = "image/" + Path.GetExtension(filePath).ToLower(); ;

                string fileName = FileUtil2.GetFileName(filePath);
                //add header
                context.Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Supermore.Diagnostics.Trace.LogTest("Download user avatar" + filePath);
                if (File.Exists(filePath))
                {
                    using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            context.Response.OutputStream.Write(buffer, 0, length);
                            context.Response.Flush();
                        }
                        fs.Close();
                    }
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogError(filePath + " File Read failure.From Mobile");
                    context.Response.Write("文件不存在");
                }

            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                Supermore.Diagnostics.Trace.LogError(filePath + " File Read failure.From Mobile." + ex.Message);
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            //Response.Close();
            context.Response.End();
        }
        private void DownloadImgFile(HttpContext context, string filePath)
        {

            var imgid = context.Request["imgid"];

            var varGuid = context.Request["varGuid"];
            byte[] buffer = new byte[1024];
            int length = 0;
            try
            {
                filePath = Supermore.IOPaths.TempFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + varGuid + "\\img\\" + imgid;

                context.Response.Clear();
                context.Response.ContentType = "image/" + Path.GetExtension(filePath).ToLower(); ;

                string fileName = FileUtil2.GetFileName(filePath);
                //add header
                context.Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Supermore.Diagnostics.Trace.LogTest("Download user avatar" + filePath);
                if (File.Exists(filePath))
                {
                    using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            context.Response.OutputStream.Write(buffer, 0, length);
                            context.Response.Flush();
                        }
                        fs.Close();
                    }
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogError(filePath + " File Read failure.From Mobile");
                    context.Response.Write("文件不存在");
                }

            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                Supermore.Diagnostics.Trace.LogError(filePath + " File Read failure.From Mobile." + ex.Message);
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            //Response.Close();
            context.Response.End();
        }

        private void DownloadFile(HttpContext context, string filePath)
        {

            var fileid = context.Request["fileid"];

            var varGuid = context.Request["varGuid"];
            byte[] buffer = new byte[1024];
            int length = 0;
            try
            {
                filePath = Supermore.IOPaths.TempFiles + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + varGuid + "\\attachment\\" + fileid;

                context.Response.Clear();
                context.Response.ContentType = "application/octet-stream";

                string fileName = FileUtil2.GetFileName(filePath);
                //add header
                context.Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Supermore.Diagnostics.Trace.LogTest("Download user avatar" + filePath);
                if (File.Exists(filePath))
                {
                    using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            context.Response.OutputStream.Write(buffer, 0, length);
                            context.Response.Flush();
                        }
                        fs.Close();
                    }
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogError(filePath + " File Read failure.From Mobile");
                    context.Response.Write("文件不存在");
                }

            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                Supermore.Diagnostics.Trace.LogError(filePath + " File Read failure.From Mobile." + ex.Message);
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            //Response.Close();
            context.Response.End();
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