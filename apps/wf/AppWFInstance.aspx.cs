using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OptimaJet.Workflow;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;

namespace WebClient.apps.wf
{
    public partial class AppWFInstance : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller=AppDataSource.GetCallContext();

            RenderAllCategoryProcess();
        }
        int iRow = 100;
        int col = 1;
        void RenderAllCategoryProcess()
        {
            sb.Append("<table width='100%'>");
            //get latest
            GetLatestUsed();

            _allprocess = WfSchemeManager.GetAccessProcess(caller);
            EntityCollection entities = ItemTreeManager.GetFolders(caller, ObjectTypeCodes.WFProcess);
            foreach (Entity entity in entities)
            {
                if (col % 4==0)
                {
                    sb.Append("</tr>");
                    sb.Append("<tr style=\"vertical-align:top\">");
                }
                
                sb.Append("<td style=\"width:25%\" >");
                RenderCategoryProcess(entity);
                sb.Append("</td>");

                col++;
            }

            sb.Append("</table>");
            this.ProcessHTML= sb.ToString();
        }
        EntityCollection _allprocess = null;
        StringBuilder sb = new StringBuilder();

        void RenderCategoryProcess(Entity entity)
        {
            sb.Append(" <div class=\"listBlock\">");
            sb.Append("<div class=\"recentFilesPanel profileSection\" id=\"recentFilesPanel\">");
            
            sb.Append(" <div class=\"vfButtonBar\">");
            sb.AppendFormat(" <div style=\"font-size:14px;\"><h3>{0}</h3></div>", entity.Name);
            //border-bottom: 2px solid #166ca5;
            sb.Append("</div>");

            sb.Append(" <div class=\"content\">");
            sb.Append("<table class=\"recentFilesTable\" >");
            string folderId = entity.ID.ToString();
            EntityCollection selRecs = _allprocess.Select("FolderId", folderId);

            this.UserFullName = WebContext.UserFullName;
            this.InstanceName = this.UserFullName;

            foreach (Entity entity2 in selRecs)
            {
                //render table
                sb.Append("<tr>");

                sb.Append("<td>");
                string id = entity2.ID.ToString();
                string name = entity2.Name;

                sb.AppendFormat("<div class=\"itemImg\"><a class=\"fileTypeIcon\" onclick=\"showPopupDialog('/apps/wf/createInstancePop.aspx?t=a0M&processId={0}&name={3}','createInstancePop','发起事务',300,500);\" ><img width=\"16\" height=\"16\" data-hovid=\"{0}\" class=\"sprite-doctype_excel_16\" alt=\"{1}\" src=\"/s.gif\" data-uidsfdc=\"{2}\" id=\"hoverItem{2}\"></a></div>", id, name, iRow, InstanceName);

                sb.Append("</td>");

                sb.Append("<td>");

                this.InstanceName = HttpUtility.UrlEncode(name);// + " " + this.UserFullName);
                //
                //sb.AppendFormat(" <span class=\"recentFilesItem\" id=\"RecentFileItem_1411948602\" data-uidsfdc=\"{2}\" ><a title='{1}' href='#' onclick=\"showCreateInstanceDialog('{0}','{3}');\" data-uidsfdc=\"{2}\">{1}</a></span>", id, name, iRow, InstanceName);
                sb.AppendFormat(" <div class=\"recentFilesItem\" id=\"RecentFileItem_1411948602\" data-uidsfdc=\"{2}\" ><a title='{1}' href='#' onclick=\"showPopupDialog('/apps/wf/createInstancePop.aspx?t=a0M&processId={0}&name={3}','createInstancePop','发起事务',300,500);\" data-uidsfdc=\"{2}\">{1}</a></div>", id, name, iRow, InstanceName);
                sb.Append("</td>");

                sb.Append("</tr>");
                
            }
            sb.Append(" </tbody>              </table>");              
            sb.Append("</div>"); //end content
            
            sb.Append("</div>");//end 

            sb.Append("</div>");//end listBlock
        }

        void GetLatestUsed()
        {
            sb.Append("<tr style=\"vertical-align:top\">");
            sb.Append("<td style=\"width:25%\" >");

            sb.Append(" <div class=\"listBlock\">");
            sb.Append("<div class=\"recentFilesPanel profileSection\" id=\"recentFilesPanel\">");

            sb.Append(" <div class=\"vfButtonBar\">");
            sb.AppendFormat(" <div style=\"font-size:13px;\"><h3>{0}</h3></div>", "最近常用");

            sb.Append("</div>");

            sb.Append(" <div class=\"content\">");
            sb.Append("<table class=\"recentFilesTable\" >");


            DataSet ds = WfSchemeManager.GetMyLatestUsedProcess(caller);
            
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                sb.Append("<tr>");

                sb.Append("<td>");
                string id = StringUtil.GetString(dr["ProcessId"]);
                string name = StringUtil.GetString(dr["Name"]);

                sb.AppendFormat("<a class=\"fileTypeIcon\" href=\"/javascript:\" ><img width=\"16\" height=\"16\" data-hovid=\"{0}\" class=\"sprite-doctype_excel_16\" alt=\"{1}\" src=\"/s.gif\" data-uidsfdc=\"{2}\" id=\"hoverItem{2}\"></a>",id ,name,iRow);

                sb.Append("</td>");

                sb.Append("<td>");
                this.InstanceName = HttpUtility.UrlEncode(name);// + " " + this.UserFullName);
                sb.AppendFormat(" <div class=\"recentFilesItem\" id=\"RecentFileItem_1411948602\" data-uidsfdc=\"{2}\"><a href='#' onclick=\"javascript:showPopupDialog('/apps/wf/createInstancePop.aspx?processId={0}&name={3}','createInstancePop','发起事务',300,480);\" data-uidsfdc=\"{2}\">{1}</a></div>", id, name, iRow, this.InstanceName);
                sb.Append("</td>");

                sb.Append("</tr>");

                iRow++;
            }

            sb.Append(" </tbody>              </table>");
            sb.Append("</div>"); //end content

            sb.Append("</div>");//end 

            sb.Append("</div>");//end listBlock


            sb.Append("</td>");
        }

        public string UserFullName { get; set; }

        public string InstanceName { get; set; }

        public string ProcessHTML = "";

    }
}