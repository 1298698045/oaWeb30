using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Data;
using Supermore.Contents;

namespace WebClient.workspaces
{
    public partial class filelib : System.Web.UI.Page
    {
        CallContext _caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            GetFilelib();
        }
        void GetFilelib()
        {
            int mode = 2;
            EntityCollection entities = ItemTreeManager.GetAccessFolders(_caller, ObjectTypeCodes.File);
            string retURL = HttpUtility.UrlEncode(Request.RawUrl);
            //string objectId = "";
            foreach (Entity entity in entities)
            {
                string tRow = "<tr class=\" row dataRow \" >";
                //tRow += RenderStartRow(mode);

                tRow += string.Format("<td  class=\" col sub  \">{0}</td>", "");

                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ReaderName"].Value));
                tRow += string.Format("  <td valign=\"top\" class=\"col actions actionColumn\">{0}</td>", "浏览");
                tRow += string.Format(" <td valign=\"top\" class=\"col title\">{0} <br/><div class=\"desc\"></div></td>", StringUtil.GetString(entity.Fields["Name"].Value));
               // tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["Comments"].Value));


                tRow += "</tr>";

                tBody += tRow;
                mode++;
            }
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" row dataRow " + css + "\" >";

            return tRow;
        }
        string tBody = "";
        public string FilelibHTML
        {
            get { return tBody; }
        }
    }
}