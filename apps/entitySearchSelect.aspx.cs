using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Contents;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Data;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.Data.Query;
using System.Text;
using System.Data;

namespace WebClient.apps
{
    public partial class entitySearchSelect : System.Web.UI.Page
    {
        private string entityTypeCategoriesJson = "";
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            GetItemTrees();
        }

        public void GetItemTrees()
        {
            int mode = 2;
            int dataCategory = MainUtil.GetInt(Request["dataCategory"], 100000);
            string setupid = Request["setupid"];
            string retURL = Request["retURL"];
            retURL = string.Format("%2Fcategory%2FdatacategoryList.aspx%3Fsetupid%3D{0}&amp;dataCategory%3D{1}", setupid, dataCategory);
            EntityCollection entities = ItemTreeManager.GetFolders(caller, ObjectTypeCodes.Entity);
            StringBuilder sb = new StringBuilder();
            sb.Append("{ \"children\": [");
            int i = 0;
            foreach (Entity entity in entities)
            {
                if (i>0)
                    sb.Append(",");

                sb.Append("{");

                sb.AppendFormat("\"apiValue\": \"{0}\",",entity.ID);

                sb.Append("\"children\": [");

                //chi
                sb.Append(RenderTemplates(entity.ID.ToString()));

                sb.Append("],");

                sb.AppendFormat("\"text\": \"{0}\",", entity.Name);
                sb.Append("\"cls\": \"folder\",");
                sb.AppendFormat("\"id\": \"categories\\/{0}\",", entity.Name);
                sb.Append("\"leaf\": false");

                sb.Append("}");
                /*
                 {
            "apiValue": "accounts",
            "children": [
                {
                    "isDeployed": "true",
                    "text": "包括合作伙伴的客户",
                    "cls": "file",
                    "leaf": true,
                    "value": "ReportAccountPartner",
                    "rtImg": "/img/rptacctpart.gif",
                    "isHidden": "false"
                }
            ],
            "text": "客户和联系人",
            "cls": "folder",
            "id": "categories\\/客户和联系人",
            "leaf": false
        },
                 */
                i++;
                mode++;
            }
            sb.Append("]}");
            this.entityTypeCategoriesJson = sb.ToString();
        }
        string RenderTemplates(string folderId)
        {
            StringBuilder sb = new StringBuilder();
            string sql = string.Format("SELECT * From Entity where ParentFolderId='{0}' And IsCustomEntity=1 And IsChildEntity=0 ANd IsWorkflowEntity=1", folderId);
            DataSet ds = DatabaseTool.GetDataSet(caller.CustomerID, sql);
            int i = 0;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (i > 0)
                    sb.Append(",");
                /*
                    "isDeployed": "true",
                    "text": "包括合作伙伴的客户",
                    "cls": "file",
                    "leaf": true,
                    "value": "ReportAccountPartner",
                    "rtImg": "/img/rptacctpart.gif",
                    "isHidden": "false"
                */
                sb.Append("{");
                sb.AppendFormat("\"text\": \"{0}\",", dr["DisplayName"].ToString());
                sb.Append("\"cls\": \"file\",");
                sb.Append("\"leaf\": true,");
                sb.AppendFormat("\"value\": \"{0}\",", dr["EntityId"].ToString());
                sb.Append("\"rtImg\":\"/img/rptacctpart.gif\",");
                sb.Append("\"isHidden\": \"false\"");
                sb.Append("}");
                i++;
            }

            return sb.ToString();
        }
        public string EntityTypeCategoriesJson
        {
            get { return entityTypeCategoriesJson; }
        }
    
    }
}