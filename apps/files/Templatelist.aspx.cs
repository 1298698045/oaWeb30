using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using System.Text;


namespace WebClient.apps.files
{
    public partial class Templatelist : System.Web.UI.Page
    {
        Supermore.CallContext caller;

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            LoadTemplateOptions();
        }
        public void LoadTemplateOptions()
        {
            int mode = 2;
            string strSelectCmd = "Select ValueId,RecordID,FileName,FileType,UserName,FileDate From Template_File";
            DataSet ds=  DatabaseTool.GetDataSet(caller.CustomerID, strSelectCmd);
            StringBuilder sb = new StringBuilder();
            string retURL = System.Web.HttpUtility.UrlEncode(this.Request.RawUrl);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {            
                string id = dr["ValueId"].ToString();
                string recordID = dr["RecordID"].ToString();
                string fileName = dr["FileName"].ToString();

                string tRow = "";
                tRow += RenderStartRow(mode);
                tRow += string.Format("<td class='actionColumn'>");

                tRow += string.Format("<a title=\"删除 - 记录 \"  onclick=\"return confirmDelete();\" class=\"actionLink\"  href=\"/setup/own/deleteRedirect.aspx?type=063&delID={0}&retURL={1}\">删除</a>", id, retURL);

                tRow += string.Format("&nbsp;|&nbsp;<a title=\"编辑 - 记录 \" class=\"actionLink\"  target='_blank' href=\"/apps/files/DocTemplateEdit.aspx?RecordID={0}&id={1}\">编辑</a></td>",id, recordID);

                tRow += string.Format("<td class=\" dataCell  \"><a href='/apps/files/DocTemplateEdit.aspx?RecordID={0}' target='_blank'>{1}</a></td>", recordID, fileName);
                tRow += string.Format("<td class=\" dataCell  \">{0}</td>", StringUtil.GetString(dr["FileType"]));//
                tRow += string.Format("<td class=\" dataCell  \">{0}</td>", StringUtil.GetString(dr["UserName"]));
                tRow += string.Format("<td class=\" dataCell  \">{0}</td>", StringUtil.GetString(dr["FileDate"]));
                sb.Append(tRow);
                mode++;
                
            }
            BodyText = sb.ToString();
        }
        public string BodyText
        {
            get;
            set;
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
    }
}