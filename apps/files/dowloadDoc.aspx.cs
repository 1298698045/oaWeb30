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
using System.Data.SqlClient;
using iWebOffice.ocx.c.net;

namespace Supermore.apps.files
{
    public partial class dowloadDoc : System.Web.UI.Page
    {
        private CallContext _caller = null;
        private string fileId = "";
        private string fileName = "";
        private string fileExtension = "";
        private string fileType = "1";//1001 附件，2 正文 100100 文件（管理）

        protected void Page_Load(object sender, EventArgs e)
        {
            fileId = Request["id"];
            fileType = Request["filesource"];
            try
            {
                _caller = AppDataSource.GetCallContext();
                if (_caller == null)
                {
                    //未登录情况下载
                    string orgId = Settings.GetSetting("Organization.ID");
                    _caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
                    WebContext.SetCallContext(_caller, true);
                }

                byte[] mFileBody = null;
                bool mResult = false;
                if (fileType == "2") //正文文件下载
                {
                    SqlConnection sqlCon = DatabaseTool.GetSqlConnection(_caller.CustomerID);
                    sqlCon.Open();

                    string strSelectCmd = "SELECT FileBody,FileType FROM Document_File WHERE RecordID='" + fileId + "'";
                    SqlCommand mCommand = new SqlCommand(strSelectCmd, sqlCon);
                    SqlDataReader mReader = mCommand.ExecuteReader();
                    if (mReader.Read())
                    {
                        mFileBody = mReader.GetSqlBinary(0).Value;
                        fileExtension = mReader[1].ToString();
                        mResult = true;
                    }
                    mReader.Close();
                    sqlCon.Close();

                    Entity entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.OfficialDocumentOut, new Guid(fileId));
                    fileName = StringUtil.GetString(entity.Fields["Name"].Value) + fileExtension;
                    fileName = HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8);
                    if (mResult && mFileBody != null)
                    {
                        this.Response.Clear();
                        this.Response.Buffer = true;
                        this.Response.Charset = "GB2312";
                        this.Response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName + "");
                        this.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
                        this.Response.ContentType = "application/octet-stream;charset=GB2312";
                        this.Response.BinaryWrite(mFileBody);
                        this.Response.Flush();
                        this.Response.End();
                    }
                    else
                    {
                        Supermore.Diagnostics.Trace.LogToFile(string.Format("fileId:{0}", fileId), "file.txt");
                        Response.Write("文件不存在");
                    }
                }


            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            finally
            {
                Response.Close();
            }
        }
        public static Stream BytesToStream(byte[] bytes)
        {
            Stream stream = new MemoryStream(bytes);
            return stream;
        }
    }
}