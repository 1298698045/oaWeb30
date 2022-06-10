using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using iWebOffice.ocx.c.net;
using Supermore.Data;
using Supermore;

namespace WebClient.apps.files
{
    public partial class DocumentSave : System.Web.UI.Page
    {
        string mRecordID = "";
        string mTemplate = "";
        string mSubject = "";
        string mAuthor = "";
        string mFileDate = "";
        string mFileType = "";
        string mHTMLPath = "";
        string mStatus = "";
        string mError = "";

        private iDBManage2000 DBAobj;
        SqlCommand nCommand;
        string strSelectCmd;
        string strUpdateCmd;
        string strInsertCmd;
        CallContext caller = null;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 在此处放置用户代码以初始化页面
            string orgId = Request["OrganizationId"];
            // 在此处放置用户代码以初始化页面
            caller = AppDataSource.GetCallContext();
            if (caller == null)
            {
                caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
            }

            DBAobj = new iDBManage2000(caller);
            DBAobj.Open();

            if (Request["isTemplate"] == "1")
            {
                SaveTemplate();
            }
            else
                SaveDoc();
            
            DBAobj.Close();
        }
        void SaveDoc()
        {
            mRecordID = Request.Form["RecordID"];
            mTemplate = Request.Form["Template"];
            mSubject = Request.Form["Subject"];
            mAuthor = "";// Request.Form["Author"];
            mFileDate = Request.Form["FileDate"];
            mFileType = Request.Form["FileType"];
            mHTMLPath = Request.Form["HTMLPath"];
            mStatus = "READ";

            //保存表单基本信息
            strSelectCmd = "SELECT RecordID from  Document Where RecordID='" + mRecordID + "'";
            SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            SqlDataReader mReader = mCommand.ExecuteReader();
            if (mReader.Read())
            {
                strUpdateCmd = "UPDATE Document set RecordID=@RecordID,Template=@Template,Subject=@Subject,Author=@Author,FileDate=@FileDate,FileType=@FileType,HtmlPath=@HtmlPath,Status=@Status where RecordID='" + mRecordID + "'";
                nCommand = new SqlCommand(strUpdateCmd, DBAobj.Connection);
            }
            else
            {
                strInsertCmd = "insert into Document (RecordID,Template,Subject,Author,FileDate,FileType,HtmlPath,Status) values (@RecordID,@Template,@Subject,@Author,@FileDate,@FileType,@HtmlPath,@Status)";
                nCommand = new SqlCommand(strInsertCmd, DBAobj.Connection);
            }
            mReader.Close();
            try
            {
                nCommand.Parameters.Add(new SqlParameter("@RecordID", SqlDbType.VarChar, 50));
                nCommand.Parameters["@RecordID"].Value = mRecordID;


                nCommand.Parameters.Add(new SqlParameter("@Template", SqlDbType.VarChar, 16));
                nCommand.Parameters["@Template"].Value = mTemplate;


                nCommand.Parameters.Add(new SqlParameter("@Subject", SqlDbType.VarChar, 32));
                nCommand.Parameters["@Subject"].Value = mSubject;

                nCommand.Parameters.Add(new SqlParameter("@Author", SqlDbType.VarChar, 32));
                nCommand.Parameters["@Author"].Value = mAuthor;

                nCommand.Parameters.Add(new SqlParameter("@FileDate", SqlDbType.DateTime));
                nCommand.Parameters["@FileDate"].Value = mFileDate;

                nCommand.Parameters.Add(new SqlParameter("@FileType", SqlDbType.VarChar, 4));
                nCommand.Parameters["@FileType"].Value = mFileType;

                nCommand.Parameters.Add(new SqlParameter("@HtmlPath", SqlDbType.VarChar, 64));
                nCommand.Parameters["@HtmlPath"].Value = mHTMLPath;

                nCommand.Parameters.Add(new SqlParameter("@Status", SqlDbType.VarChar, 64));
                nCommand.Parameters["@Status"].Value = mStatus;

                int i = nCommand.ExecuteNonQuery();
                // Response.Redirect("DocumentList.aspx");
            }
            catch (SqlException ex)
            {
                mError = ex.ToString();
            }
        }
        void SaveTemplate()
        {
            string mFileName = "";
            string mDescript = "";
            bool mResult = false;
            //DBAobj = (iDBManage2000)Session["DBDemo"];

            mRecordID = Request.Form["RecordID"];
            mFileName = Request.Form["FileName"];
            mDescript = Request.Form["Descript"];
            string IsPublic = Request.Form["IsPublic"];
            if (!string.IsNullOrEmpty(IsPublic))
                IsPublic = "1";
            else
                IsPublic = "0";
            try
            {
                strUpdateCmd = "Update Template_File Set FileName = '" + mFileName + "',Descript = '" + mDescript + "',IsPublic='" + IsPublic + "',ModifiedOn=Getdate() Where RecordID='" + mRecordID + "'";
                int iRes = AppDataSource.ProcessDBUpdate(this.caller, strUpdateCmd);
                if (iRes > 0)
                    mResult = true;
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
                mResult = false;
            }
            string retURL = Request["retURL"];
            if (string.IsNullOrEmpty(retURL))
            {
                retURL = "/wfinstance/DocTemplates.aspx?gridid=wordtemplates&t=a0M";
            }
            Response.Redirect(retURL, false);
        }
    }
}