using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Configuration;
using Supermore.Data;

namespace WebClient.apps.scontent
{
    public partial class HomeHotNews : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            StringBuilder sb = new StringBuilder();
            int top = Settings.GetIntSetting("home.newsimages.top", 5);
            //string sql=string.Format("Select Top 50 * from ContentPassHot Where CreatedOn>'{0}'  ORDER BY CreatedOn desc",DateTime.Now.AddDays(-60));
            string sql = string.Format("Select Top {0} * from ContentPassHot ORDER BY CreatedOn desc",top);
            DataSet ds = DatabaseTool.GetDataSet(caller.CustomerID,sql );
            this.TotalRec = ds.Tables[0].Rows.Count;
            bool shortcutTitle = Settings.GetBoolSetting("Content.HotNews.ShortTitle", true);
            string rootImg = Settings.GetSetting("MediaWebSite");
            //rootImg += string.Format("/{0}", caller.CustomerCode);
            if (ds.Tables[0].Rows.Count == 0)
            {
                sql = string.Format("Select Top 5 * from ContentPassHot ORDER BY CreatedOn desc");
                ds = DatabaseTool.GetDataSet(caller.CustomerID, sql);
                this.TotalRec = 5;
            }

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string valId = StringUtil.GetString(dr["ValueId"]);
                string desc = StringUtil.GetString(dr["Description"]);
                string img = StringUtil.GetString(dr["Img"]);
                sb.Append("<li style=\"float: left; list-style: outside none none; position: relative; width: 320px;\" class=\"bx-clone\">");
                sb.Append("<div class=\"slider-box\">");
                
                sb.Append("<div class=\"slider-img\">");
                string linkImg = rootImg + img;

                if (shortcutTitle)
                {
                    sb.AppendFormat(" <a target='_blank' title=\"{2}\" href=\"/apps/scontent/PreviewContent.aspx?id={0}\"><img alt=\"{2}\" src=\"{1}\" class=\"img\" style=\"width:100%;min-height:238px;\"></a>", valId, linkImg, desc);
                }
                else
                {
                    sb.AppendFormat(" <a target='_blank' title=\"{2}\" href=\"/apps/scontent/PreviewContent.aspx?id={0}\"><img alt=\"{2}\" src=\"{1}\" class=\"img\" style=\"width:100%;\"></a>", valId, linkImg, desc);
                }
                sb.Append("</div>");

                sb.Append("<div class=\"slider-header\">");
                string title = desc;
                if (shortcutTitle)
                {
                    if (title.Length > 25)
                    {
                        title = title.Substring(0, 25);
                    }
                }
                sb.AppendFormat("<h4 style='font-size:14px;color:#015ba7;'><a style=\"text-decoration:none;color:#015ba7;\" target='_blank' title=\"{1}\" href=\"/apps/scontent/PreviewContent.aspx?id={0}\">{1}</a></h4>", valId, title);
                sb.Append("</div>");

                sb.Append("</div>");
                sb.Append("</li>");
            }
            this.HotListHTML= sb.ToString();
        }

        public string HotListHTML { get; set; }
        public int TotalRec { get; set; }
    }
}