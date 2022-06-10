using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.IO;
using Supermore.Mobile;
using Supermore.Queries;

namespace WebClient.apps.mobile
{
    public partial class SendSmsStage : System.Web.UI.Page
    {
        string preStage = "";
        CallContext caller;
        private string entityType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            preStage = Request["currentStage"];
            entityType = Request["t"];
            if (Request["cancel"] != null)
            {
                Response.Redirect("/a0C/o", true);
            }
            if (Request["save"] != null)
            {
                SaveData(false);
            }
            if (Request["save_new"] != null)
            {
                SaveData(true);
            }
            if (Request["goNext"] != null)
            {
                //isNext = true;                
                    this.CurrentStage = MainUtil.GetInt(preStage, 0) + 1;
            }
            if (Request["goPrevious"] != null)
            {
                this.CurrentStage = MainUtil.GetInt(preStage, 0) - 1;
            }
            LoadStage();
        }
        void SaveData(bool saveNew)
        {

            //string id = Request["id"];
            //bool isUpdated = false;
            //Guid orgId = new Guid(caller.CustomerID);
            //Entity entity = null;
            string retURL = Request["retURL"];
            string name = Request["Name"];
            string content = Request["smsContent"];
            string strSendTime = "";
            string testmobile = Request["testmobile"];
            string receiveIds = Request["p24_lkid"];

            DateTime sendTime = DateTime.Now;
            if (Request["mm_send_now"] == "1")
            {
                //strSendTime = string.Format("{0} {1}:{2}", Request["scheduledate"], Request["hour"], Request["minute"]);
                strSendTime = Request["mm_scheduled_date_time"];
                sendTime = DateTime.Parse(strSendTime);
            }
            
            string queryIds = Request["ids"];
            bool isSaved = SmsMessageManager.CreateCampaignSmsActivity(caller, name, content, sendTime, testmobile, receiveIds, queryIds,"");
           
            if (isSaved)
            {
                Response.Redirect(retURL);
            }
        }
        void goPrev()
        {
            LoadStage();
        }
        void goNext()
        {
            LoadStage();
        }
        public string LoadStage()
        {
            string html = "";
            string vPath = "";
            //string aPath = Server.MapPath(vPath);
            if (this.CurrentStage == 0)
                vPath = string.Format("Step{0}.html", this.CurrentStage);

            string rPath = Server.MapPath("/apps/mobile/");
            html = FileUtil.ReadFromFile(rPath + vPath);

            if (string.IsNullOrEmpty(html))
            {
                vPath = string.Format("Step{0}.html", this.CurrentStage);
                html = FileUtil.ReadFromFile(rPath + vPath);
            }

            StageFormHtml = RenderStageHTML(html);

            return html;
        }
        string RenderStageHTML(string html)
        {
            string html2 = html;
            string pattern = "";
            string hiddens = "";
            foreach (string key in HttpContext.Current.Request.Form.Keys)
            {
                if (string.IsNullOrEmpty(key)) continue;
                if (key == "goNext") continue;
                if (key == "goPrevious") continue;
                if (key == "currentStage") continue;

                string fValue = this.Request[key];
                pattern = "{!" + key + "}";
                if (Regex.IsMatch(html2, pattern))
                {
                    html2 = Regex.Replace(html2, pattern, fValue);
                }
                else
                {

                    hiddens += string.Format("<input type='hidden' name='{0}' id='{0}' value='{1}' />", key, fValue);
                }
            }
            foreach (string key in HttpContext.Current.Request.QueryString.Keys)
            {
                if (string.IsNullOrEmpty(key)) continue;
                if (string.IsNullOrEmpty(key)) continue;

                string fValue = this.Request[key];
                pattern = "{!" + key + "}";
                if (Regex.IsMatch(html2, pattern))
                {
                    html2 = Regex.Replace(html2, pattern, fValue);
                }
                else
                {
                    hiddens += string.Format("<input type='hidden' name='{0}' id='{0}' value='{1}' />", key, fValue);
                }
            }
            if (this.Request[string.Format("visited_{0}", this.CurrentStage)] == null)
                hiddens += string.Format("<input type='hidden' name='visited_{0}' id='visited_{0}' value='{0}' />", this.CurrentStage);

            hiddens += string.Format("<input id=\"currentStage\" type=\"hidden\" value=\"{0}\" name=\"currentStage\"  />", this.CurrentStage);
            html2 = Regex.Replace(html2, "{!hiddens}", hiddens);

            if (Request["smsContent"] != null)
                html2 = Regex.Replace(html2, "{!Message}", Request["smsContent"]);
            
            if (Request["Name"] != null)
                html2 = Regex.Replace(html2, "{!Name}", Request["Name"]);
            if (this.CurrentStage == 1)
            {
                html2 = Regex.Replace(html2, "{!Total}", StatQuantity().ToString());
            }
            if (this.CurrentStage == 0)
                html2 = Regex.Replace(html2, "{!Groups}", GetListQuery());

            if (Request["mm_scheduled_date_time"] != null)
                html2 = Regex.Replace(html2, "{!now}", Request["mm_scheduled_date_time"]);
            else
                html2 = Regex.Replace(html2, "{!now}", DateTime.Now.ToString("yyyy-MM-dd tthh:mm"));

            html2 = Regex.Replace(html2, @"{![^}]*}", "");

            //{!now}

            return html2;
        }

        string GetListQuery()
        {
            StringBuilder sb = new StringBuilder();
            EntityCollection entities = EntityManager.GetEntities(caller, ObjectTypeCodes.SavedQuery, "SELECT * FROM SavedQueryBase WHERE ReturnedTypeCode=20028 And QueryType=0");
            int iRow=0;
            string str1 = Request["ids"];
            string[] ids = null;
            if (!string.IsNullOrEmpty(str1))
                ids = str1.Split(',');
           foreach (Entity entity in entities)
           {
               string isSelected = "";
               if (ids != null)
               {
                   if (Array.IndexOf(ids, entity.ID.ToString()) > -1)
                       isSelected = " checked='checked'";
               }
               sb.Append(RenderStartRow(iRow));
               sb.AppendFormat("<td class=\"actionColumn\"><input type=\"checkbox\" value=\"{0}\" title=\"选择 {1}\" onclick=\"updateToggleAllBox(this.form,'ids', 'allBox');\" name=\"ids\" id=\"ids{2}\" {3} >&nbsp;</td>", entity.ID, entity.Name, iRow, isSelected);
               sb.AppendFormat("<td class=\" dataCell \"><a href='/a0D/filter?fcf={0}' target='_blank'>{1}</a></td>", entity.ID, entity.Name);
               int total = SavedQueryManager.Count(caller, new SavedQuery(entity), null);
               sb.AppendFormat("<td  class=\" dataCell \">{0}</td>", total);
               
               sb.Append("</tr>");
           }
           return sb.ToString();
        }
        int StatQuantity()
        {
            string str1 = Request["ids"];
            string[] ids = str1.Split(',');
            int total = 0;
            foreach (string str2 in ids)
            {
                total += SavedQueryManager.Count(caller, new Guid(str2), null);
            }
            return total;
        }

        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        public string StageFormHtml { get; set; }
        int _currentStage = 0;
        public int CurrentStage
        {
            set { _currentStage = value; }
            get { return _currentStage; }
        }
    }
}