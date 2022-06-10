using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;

using Supermore;
using Supermore.Data;

namespace WebClient.apps.files
{
    public partial class TemplateForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTemplateOptions();
        }
        public void LoadTemplateOptions()
        {
            CallContext caller = AppDataSource.GetCallContext();
            
            string strSelectCmd = "Select RecordID,FileName From Template_File";
            //SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            //SqlDataReader mReader = mCommand.ExecuteReader();
            DataSet ds = AppDataSource.GetDataSet(caller, strSelectCmd,null);
            //while (mReader.Read())
            foreach (DataRow mReader in ds.Tables[0].Rows)
            {
                string recordID = mReader["RecordID"].ToString();
                string fileName = mReader["FileName"].ToString();
                this.TemplateOptions += string.Format("<option value='{0}'>{1}</option>", recordID, fileName);
            }
            //mReader.Close();
        }
        public string TemplateOptions { set; get; }
    }
}