using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Activities;
using Supermore.Configuration;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using System.Text;
using Youyou.Calendars;
using Youyou.Calendars.Models;

namespace WebClient.ui.core.activity
{
    public partial class ActiTaskEdit : System.Web.UI.Page
    {
        CallContext caller = null;
        string retURL = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Subject = "新建任务";
            if (Request["cancel"] != null)
            {
                retURL = Request["cancelURL"];
                Response.Redirect(retURL);
            }
            retURL = Request["retURL"];
            RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
            //RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", string.Format("/00T/e?retURL={0}", retURL));

            caller = AppDataSource.GetCallContext();
            if (Request["save"] != null)
            {
                Save(false,"save");
            }
            if (Request["save_new"] != null || Request["savenewtask"] != null || Request["savenewevent"] != null)
            {
                string cmdName = Request["save_new"];
                
                if (string.IsNullOrEmpty(cmdName))
                    cmdName = Request["savenewtask"];
                if (string.IsNullOrEmpty(cmdName))
                    cmdName = Request["savenewevent"];

                Save(true,cmdName);
            }
            
            GetData();
        }
        void GetData()
        {
            this.OwningUser = caller.UserID;
            this.OwningUserName = WebContext.UserFullName;
            this.DateNow = DateTime.Now.ToString("yyyy-MM-dd");
            string strId = Request["id"];
            if (string.IsNullOrEmpty(strId)) return;
            string close = Request["close"];
            if (close == "1")
            {
                ActivityTaskManager msgr = new ActivityTaskManager();
                msgr.CloseTask(caller, new Guid(strId));
                Response.Redirect(retURL);
            }
            Entity entity = null;

            entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Activity, new Guid(strId));

            ActivityTask act = new ActivityTask(entity);
            ScheduledEnd = act.ScheduledEnd.ToString("yyyy-MM-dd");
            this.Description = act.Description;
            this.Subject = act.Subject;
            this.OwningUser = act.OwningUser.ToString();
            this.PriorityCode = act.PriorityCode;

            //startdate|enddate|recurrence type(day,week,month,year)|
            /*
             day (1 every day;2 interval day)
             week 1)(interval week) week num....
             month 1)(interval month) month day ;2) (interval month) week num,week day
             year: 1) interval month ,day) interval month,week num of month ,week day
             */
        }
        void Save(bool saveNew,string cmdName)
        {
            //string retURL = Request["retURL"];
            string Id = Request["id"];
            bool isUpdated = false;
            Guid orgId = new Guid(caller.CustomerID);
            Entity entity = null;
            if (string.IsNullOrEmpty(Id))
            {
                entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.Activity, orgId);
            }
            else
            {
                entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Activity, new Guid(Id));
                isUpdated = true;
            }

            entity.BeginEdit();
            entity.Fields["Subject"].Value = Request["tsk5"];
            entity.Fields["StateCode"].Value = Request["tsk12"];
            entity.Fields["StatusCode"].Value = Request["tsk12"];
            entity.Fields["PriorityCode"].Value = Request["tsk13"];
            entity.Fields["ReminderDate"].Value = Request["reminder_dt"];
            entity.Fields["ReminderTime"].Value = Request["reminder_dt_time"];
            
            if (string.IsNullOrEmpty(Request["tsk1_lkid"]))
            {
                entity.Fields["OwningUser"].Value = caller.UserID;
            }
            else
                entity.Fields["OwningUser"].Value = Request["tsk1_lkid"];

            entity.Fields["ActivityTypeCode"].Value = 4212;//任务
            entity.Fields["Description"].Value = Request["tsk4"];

            string recurrencePattern = "";
            if (Request["IsRecurrence"] != null)
            {
                entity.Fields["ScheduledStart"].Value = Request["RecurrenceStartDateOnly"];
                entity.Fields["ScheduledEnd"].Value = Request["RecurrenceEndDateOnly"];
                entity.Fields["IsRecurrence"].Value = 1;

                StringBuilder sb = new StringBuilder();
                sb.Append(Request["RecurrenceStartDateOnly"]);
                sb.Append("|");
                sb.Append(Request["RecurrenceEndDateOnly"]);
                sb.Append("|");

                #region recurrence
                string rectype = Request["rectype"];

                sb.Append(rectype);
                sb.Append("|");

                if (rectype == "ftd") //日
                {                    
                    string recd = Request["recd"]; //间隔
                    sb.Append(recd);

                    if (recd == "d0") //每天
                    {
                    }
                    if (recd == "d1") //指定间隔为天
                    {
                        string di = Request["di"]; //

                        sb.Append("|");
                        sb.Append(di);
                    }
                }
                if (rectype == "ftw") //周
                {
                    string wi = Request["wi"];//指定间隔为周
                    string wkNums = "";
                    sb.Append(wi);
                    sb.Append("|");

                    //1,2,4,8,16,32,64
                    string wN = Request["1"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums += "1";
                    }
                    wN = Request["2"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums = wkNums.Trim(',');
                        wkNums += ","+"2";
                    }
                    wN = Request["4"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums = wkNums.Trim(',');
                        wkNums += "," + "4";
                    }
                    wN = Request["8"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums = wkNums.Trim(',');
                        wkNums += "," + "8";
                    }
                    wN = Request["16"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums = wkNums.Trim(',');
                        wkNums += "," + "16";
                    }
                    wN = Request["32"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums = wkNums.Trim(',');
                        wkNums += "," + wN;
                    }
                    wN = Request["64"];
                    if (!string.IsNullOrEmpty(wN))
                    {
                        wkNums = wkNums.Trim(',');
                        wkNums += ",64" ;
                    }
                    wkNums =  wkNums.Trim(',');
                    sb.Append(wkNums);
                }
                if (rectype == "ftm") //月
                {
                    string recm = Request["recm"];
                    sb.Append(recm);
                    sb.Append("|");
                    if (recm == "m0")
                    {
                        string mint = Request["mint"];   //mint 指定间隔为月

                        string mdom = Request["mdom"];  //mdom 选择月份中的一天


                        sb.Append(mint);
                        sb.Append("|");
                        sb.Append(mdom);
                    }


                    //指定天数为月和每月间隔

                    //指定哪个星期的哪天和每月间隔
                    if (recm == "m1")
                    {
                        string mnint = Request["mnint"];   //mint 指定间隔为月

                        string mnins = Request["mnins"];  //mdom 选择月份的某周

                        string mndow = Request["mndow"]; //选择周的一天

                        sb.Append(mnint);
                        sb.Append("|");
                        sb.Append(mnins);
                        sb.Append("|");
                        sb.Append(mndow);
                    }
                }
                if (rectype == "fty") //年
                {

                    string recy = Request["recy"]; //指定月和日
                    sb.Append(recy);
                    sb.Append("|");
                    if (recy == "y0")
                    {
                        //ymoy 选择月
                        string ynmoy = Request["ymoy"];
                        //ydom 选择月份中的一天
                        string ydom = Request["ydom"];

                        sb.Append(ynmoy);
                        sb.Append("|");
                        sb.Append(ydom);
                    }

                    //指定特定月份的特定周中的一天
                    if (recy == "y1")
                    {
                        //ynmoy 选择月
                        string ynmoy = Request["ynmoy"];
                        //ynins 选择月份中的一天
                        string ynins = Request["ynins"];

                        sb.Append(ynmoy);
                        sb.Append("|");
                        sb.Append(ynins);
                    }
                }
                
                #endregion

                recurrencePattern = sb.ToString();
                entity.Fields["RecurrenceType"].Value = recurrencePattern;
                //entity.Fields["RecurrenceInterval"].Value = 
            }
            else
            {
                entity.Fields["ScheduledStart"].Value = DateTime.Now;
                entity.Fields["ScheduledEnd"].Value = Request["tsk4"];
                entity.Fields["IsRecurrence"].Value = 0; //Request["IsRecurrence"];
            }

            if (!isUpdated)
            {
                //entity.Fields["DeletionStateCode"].Value = 0;
                //entity.Fields["BusinessUnitId"].Value = orgId;    //部门
                entity.Fields["OrganizationId"].Value = orgId;
                //entity.Fields["IsPublic"].Value = 0;
                entity.Fields["CreatedBy"].Value = caller.UserID;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
              
            }
            else
            {
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
            }
            //entity.Fields["Password"].Value = Settings.GetSetting("Security.InitPassword");

            //LanguageLocaleKey
            //LocaleSidKey
            //TimeZoneSidKey
            bool isAdded = entity.EndEdit();
              
            if (saveNew)
            {
                string save_new_url = Request["save_new_url"];
                retURL = Request["retURL"];
                retURL=HttpUtility.UrlEncode(retURL);
                if  (cmdName =="savenewtask")
                {
                    save_new_url = "/00T/e?retURL=" + retURL;
                }
                if (cmdName == "savenewevent")
                {
                    save_new_url = "/00U/e?retURL=" + retURL;
                }
                
                Response.Redirect(save_new_url);
            }
            else
            {
                //string retURL = Request["retURL"];
                Response.Redirect(retURL);
            }
        }
        public string DateNow { get; set; }

        public int PriorityCode { get; set; }
        public int StateCode { get; set; }

        public string Description { get; set; }
        public string Subject { get; set; }
        public string ScheduledStart { get; set; }
        public string ScheduledEnd { get; set; }
        public string ReminderDate { get; set; }
        public string OwningUser { get; set; }
        public string OwningUserName { get; set; }
    }
}