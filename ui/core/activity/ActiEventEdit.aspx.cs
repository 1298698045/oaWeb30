using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;

using Supermore.Activities;
using Supermore.Configuration;
using Supermore.Data;
using Supermore.Emails;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;

using Supermore.Mobile;
using Supermore.Messenger;
using Supermore.Security;
using Youyou.HRCore.Attendance;
using Youyou.Calendars;

namespace WebClient.ui.core.activity
{
    public partial class ActiEventEdit : System.Web.UI.Page
    {
        CallContext caller = null;
        string retURL = "";
        string hdnrefr = ""; //0 add invite 1 remove invite
        string hdnaddn = "";
        bool isStartProcess = false;   

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["cancel"] != null)
            {
                retURL = Request["cancelURL"];
                Response.Redirect(retURL);
            }
            retURL = Request["retURL"];
            RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
            if(!string.IsNullOrEmpty(retURL))
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", retURL);
            else
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url",string.Format("/00U/e?retURL={0}", retURL));

            RegisterParamsHiddenFieldsControl1.RemoveHidden("RecurrenceStartDateTime");

            caller = AppDataSource.GetCallContext();

            InviteeHiddenHTML += string.Format("<input type=\"hidden\" id=\"invtee0\"  name=\"invtee\" value=\"000000000000000\" />");
            InviteeHiddenHTML += string.Format("<input type=\"hidden\" id=\"hdnaddn\"  name=\"hdnaddn\" value=\"\" />");
            InviteeHiddenHTML += string.Format("<input type=\"hidden\" id=\"hdnrefr\"  name=\"hdnrefr\" value=\"0\" />");

            hdnrefr = Request["hdnrefr"];//选择的数量,1等于 移除
            hdnaddn = Request["hdnaddn"];//选择的邀请人，获取要移除的人
            if (!string.IsNullOrEmpty(hdnaddn) && hdnrefr!="1")//选择邀请人
            {
                RenderHiddenInvitees(hdnaddn);
                RenderInvitees(hdnaddn);
            }
            else
            {                
                //<input type="hidden" value="0" name="hdnrefr" id="hdnrefr">
                InviteeHiddenHTML += string.Format("<script>ActivityFunction.setInviteePopupCount({0});</script>", iHiddenInvitee);
                 //<input type="hidden" id="invtee0" name="invtee" value="000000000000000" /><input                            
                  //                type="hidden" id="hdnrefr" name="hdnrefr" value="0" /><input type="hidden" id="hdnaddn"
                  //                  name="hdnaddn" value="" /><script>     ActivityFunction.setInviteePopupCount(0);</script>
            }
            string strInvtee = Request["invtee"];
            if (!string.IsNullOrEmpty(strInvtee))
            {
                RestorePre();
                if (hdnrefr == "1")
                {
                   strInvtee= RemoveInite(strInvtee);
                }
                RenderHiddenInvitees(strInvtee);
                RenderInvitees(strInvtee);
            }
                       
            if (Request["save"] != null)
            {
                Save(false, "save");
            }
            if (Request["save_new"] != null || Request["savenewtask"] != null || Request["savenewevent"] != null)
            {
                string cmdName = Request["save_new"];

                if (string.IsNullOrEmpty(cmdName))
                    cmdName = Request["savenewtask"];
                if (string.IsNullOrEmpty(cmdName))
                    cmdName = Request["savenewevent"];

                Save(true, cmdName);
            }
            GetData();
            if (Request["hdnrefr"] != null)
            {
                GetPostData();
            }
        }
        void GetData()
        {
            if (Request["aid"] != null)//传过来的姓名
            {
                this.OwningUser = Request["aid"];
                this.OwningUserName = Request["anm"];
                this.OwningUserName = HttpUtility.UrlDecode(this.OwningUserName, System.Text.Encoding.UTF8);
            }
            else
            {
                this.OwningUser = caller.UserID;
                this.OwningUserName = WebContext.UserFullName;
            }

            if (Request["evt4"] != null)//传过来的日期
            {
                this.DateNow = Request["evt4"];
                this.ScheduledStart = this.DateNow;
                this.ScheduledEnd = this.DateNow;
                //this.RecurrenceStartDateTime = this.ScheduledStart;
                //this.RecurrenceEndDateTime = DateTime.Now.AddDays(180).ToString("yyyy-MM-dd");
            }
            else
            {
                this.ScheduledStart = DateTime.Now.ToString("yyyy-MM-dd");
                this.ScheduledEnd = DateTime.Now.ToString("yyyy-MM-dd");
                this.DateNow = DateTime.Now.ToString("yyyy-MM-dd");
            }
            this.RecurrenceStartDateTime = this.ScheduledStart;
            this.RecurrenceEndDateTime = DateTime.Now.AddDays(90).ToString("yyyy-MM-dd");

            if (Request["evt13"] != null) //传过来的事件
            {
                this.ScheduledStartTime = Request["evt13"];
                this.ScheduledEndTime = DateTime.Parse(this.ScheduledStart + " " + this.ScheduledStartTime).AddHours(1).ToString("HH:00");
            }
            else
            {
                this.ScheduledStartTime = DateTime.Now.ToString("HH:00");
                this.ScheduledEndTime = DateTime.Now.AddHours(1).ToString("HH:00");
            }

            this.DateNowTime = DateTime.Now.ToString("HH:mm");
            
            string strId = Request["id"];
            if (string.IsNullOrEmpty(strId)) return;
            Entity entity = null;
            entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Activity, new Guid(strId));
            ActivityEvent act = new ActivityEvent(entity);
            ScheduledEnd = act.ScheduledEnd.ToString("yyyy-MM-dd");
            this.Description = act.Description;
            this.Subject = act.Subject;
            this.OwningUser = act.OwningUser.ToString();
            this.OwningUserName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, act.OwningUser);
            this.ScheduledStart = act.ScheduledStart.ToString("yyyy-MM-dd");
            this.ScheduledEnd = act.ScheduledEnd.ToString("yyyy-MM-dd");

            this.ScheduledStartTime = act.ScheduledStart.ToString("HH:mm");
            this.ScheduledEndTime = act.ScheduledEnd.ToString("HH:mm");
            if (act.IsRecurrence)
            {
                this.RecurrenceStartDateTime = act.RecurrenceStartDateTime.ToString("yyyy-MM-dd");
                this.RecurrenceEndDateTime = act.RecurrenceEndDateTime.ToString("yyyy-MM-dd");
                IsRecurrenceHTML = " checked='checked' ";
            }
            this.Location = act.Location;
            this.IsAllDayEvent = act.IsAllDayEvent;
            //this.PriorityCode = act.PriorityCode;
            if (act.OutOfOffice)
                OutOfOfficeCheckHTML = " checked ";

        }
        void RestorePre()
        {
            this.Subject = Request["evt5"];
            this.ScheduledStart = Request["StartDateTime"];
            this.ScheduledEnd = Request["EndDateTime"];
            this.ScheduledStartTime = Request["StartDateTime_time"];
            this.ScheduledEndTime = Request["EndDateTime_time"];
            this.Description = Request["evt6"];
        }
        void GetPostData()
        {
           var hdnrefr= Request["hdnrefr"];
           if (hdnrefr == "2")
           {
               this.Subject = Request["evt5"];
               this.ScheduledStart = Request["StartDateTime"];
               this.ScheduledEnd = Request["EndDateTime"];
               this.ScheduledStartTime = Request["StartDateTime_time"];
               this.ScheduledEndTime = Request["EndDateTime_time"];
               this.Location = Request["evt12"];
               this.Description = Request["evt6"];
               this.OwningUser = Request["evt1_lkid"];
               if (this.OwningUser == WebContext.UserId)
                   this.OwningUserName = WebContext.UserFullName;
               else
                   this.OwningUserName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, new Guid(this.OwningUser));
           }
        }

        void Save(bool saveNew, string cmdName)
        {
            try
            {
                

                string Id = Request["id"];
                //bool isUpdated = false;
                string subject = Request["evt5"];
                if (string.IsNullOrEmpty(subject))
                    return;

                string owningUser = Request["evt1_lkid"];
                string location = Request["evt12"];
                string descripition =Request["evt6"];

                string StartDateTime = Request["StartDateTime"];
                string EndDateTime = Request["EndDateTime"];
                string StartDateTime_time = Request["StartDateTime_time"];
                string EndDateTime_time = Request["EndDateTime_time"];
                string reminderTime="";
                if(Request["IsReminderSet"]!=null)
                {
                     reminderTime = Request["ReminderDateTime"];
                    // entity.Fields["ReminderTime"].Value = Request["reminder_dt_time"];
                }
                bool IsAllDayEvent = MainUtil.GetBool(Request["evt15"], false);
                string recurrenceType = "";
                string recurrenceStartDateTime = "";
                string recurrenceEndDateTime = "";
                string invtee = Request["invtee"];//邀请
                DateTime dtStart = DateTime.Parse(string.Format("{0} {1}", StartDateTime, StartDateTime_time));
                DateTime dtEnd = DateTime.Parse(string.Format("{0} {1}", EndDateTime, EndDateTime_time));

                recurrenceStartDateTime = StringUtil.GetString(Request["RecurrenceStartDateTime"]);
                recurrenceEndDateTime = StringUtil.GetString(Request["RecurrenceEndDateOnly"]);
                bool isRecurrence = false;
                //string recurrencePattern = "";
                if (Request["IsRecurrence"] != null)
                {
                    isRecurrence = true;
                    StringBuilder sb = new StringBuilder();
                    try
                    {

                        sb.Append(recurrenceStartDateTime);
                        sb.Append("|");
                        sb.Append(recurrenceEndDateTime);
                        sb.Append("|");

                        #region recurrence
                        string rectype = Request["rectype"];

                        sb.Append(rectype);
                        sb.Append("|");
                        #region 日
                        if (rectype == "ftd") //日
                        {
                            string recd = Request["recd"]; //间隔
                            sb.Append(recd);
                            if (recd == "d0") //每个工作日
                            {
                                sb.Append("|");
                                sb.Append(1);
                            }
                            if (recd == "d1") //指定间隔为天
                            {
                                string di = Request["di"]; //
                                sb.Append("|");
                                sb.Append(di);
                            }
                        }
                        #endregion
                        #region 周
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
                                wkNums += "," + "2";
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
                                wkNums += "," + "32";
                            }
                            wN = Request["64"];
                            if (!string.IsNullOrEmpty(wN))
                            {
                                wkNums = wkNums.Trim(',');
                                wkNums += ",64";
                            }
                            if (!string.IsNullOrEmpty(wkNums))
                                wkNums = wkNums.Trim(',');
                            sb.Append(wkNums);
                        }
                        #endregion
                        #region 月
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
                        #endregion
                        #region 年
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

                        #endregion

                        recurrenceType = sb.ToString();

                    }
                    catch (Exception ex)
                    {
                        Supermore.Diagnostics.Trace.LogException(ex);
                    }
                }

                ActivityEvent ae = null;
                if (isRecurrence)
                    ActivityManager.CreateRecurrence(caller, Id, subject, new Guid(owningUser), location, dtStart, dtEnd, descripition, reminderTime, isRecurrence, recurrenceType, recurrenceStartDateTime, recurrenceEndDateTime, IsAllDayEvent, "工作", "忙", invtee);
                else
                    ae = ActivityManager.Create(caller, Id, subject, new Guid(owningUser), location, dtStart, dtEnd, descripition, reminderTime, isRecurrence, recurrenceType, recurrenceStartDateTime, recurrenceEndDateTime, IsAllDayEvent, "工作", "忙", invtee);


                if (ae!=null)
                {
                    #region //通知
                    try
                    {
                        //通知
                        bool notifySms = true;
                        bool notifyEmail = true;
                        bool notifyMessager = true;
                        if (Request["chkSms"] == null)
                            notifySms = false;
                        if (Request["chkEmail"] == null)
                            notifyEmail = false;
                        if (Request["chkMessage"] == null)
                            notifyMessager = false;
                        Guid[] userIds = new Guid[] { };
                        string[] invtees = invtee.Split(',');

                        foreach (string invt in invtees)
                        {
                            if (invtee == "000000000000000")
                                continue;
                            Array.Resize<Guid>(ref userIds, userIds.Length + 1);
                            userIds[userIds.Length - 1] = new Guid(invt);
                        }

                        string msg = string.Format("任务安排：{0} 给您 安排任务，如下：{1}，期限 {2} 至{3}，请速到日程查看处理。", caller.UserName, subject, dtStart.ToString("yyyy-MM-dd HH:mm:ss"), dtEnd.ToString("yyyy-MM-dd HH:mm:ss"));
                        if (notifySms)
                        {
                            SmsMessageManager.PushSmsQueueAndSend(caller, userIds, msg, 2, DateTime.Now, Guid.NewGuid());
                        }
                        /*
                        if (notifyMessager)
                        {
                            foreach (Guid invt in userIds)
                            {
                                SystemMessengerManager.CreateNotificationMessage(caller, new Guid(caller.UserID), invt, subject, msg, entity.ID, 4201, entity.ID);
                            }
                        }
                        */
                        /*
                        if (notifyEmail)
                        {
                            foreach (Guid invt in userIds)
                            {
                                InnerMailManager.CreateHtmlEmail(caller, new Guid(caller.UserID), invt, subject, msg, entity.ID, 1);
                            }
                        }
                        */
                    }
                    catch (Exception ex)
                    {
                        Supermore.Diagnostics.Trace.LogException(ex);
                    }
                    #endregion
                }
                string retURL = "";
                retURL = Request["retURL"];
                if (saveNew)
                {
                    string save_new_url = Request["save_new_url"];
                    string aid = Request["aid"];
                    string anm = Request["anm"];
                    string evt4 = Request["evt4"];
                    //string anm = Request["anm"];
                    if (cmdName == "savenewevent")
                    {
                        if (!string.IsNullOrEmpty(aid))
                            save_new_url = string.Format("/00U/e?aid={0}&anm={1}&evt4={2}retURL={3}", aid, anm, evt4, retURL);
                        else
                            save_new_url = "/00U/e?retURL=%2Fhome%2Fhome.aspx";
                    }
                    
                    Response.Redirect(save_new_url);
                }
                else
                {
                   
                    if (string.IsNullOrEmpty(retURL))
                        retURL = "/00U/c?t=home&cType=1";
                    Response.Redirect(retURL);
                }
            }
            catch (Exception ex)
            { }
        }
        void Save2(bool saveNew, string cmdName)
        {
            try
            {
                string Id = Request["id"];
                bool isUpdated = false;
                string subject = Request["evt5"];
                if (string.IsNullOrEmpty(subject))
                    return;
                Guid orgId = new Guid(caller.CustomerID);
                Entity entity = null;
                Guid activitId = Guid.NewGuid();
                if (string.IsNullOrEmpty(Id))
                {
                    entity = new Entity(activitId, EntityTemplateIDs.Activity, orgId);
                }
                else
                {
                    activitId = new Guid(Id);
                    entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Activity, activitId);
                    isUpdated = true;
                }

                entity.BeginEdit();
                entity.Fields["Subject"].Value = subject;
                entity.Fields["StateCode"].Value = 0;// Request["tsk12"];
                entity.Fields["StatusCode"].Value = 0;// Request["tsk12"];
                entity.Fields["PriorityCode"].Value = 0;// Request["tsk13"];

                string StartDateTime = Request["StartDateTime"];
                string EndDateTime = Request["EndDateTime"];
                string StartDateTime_time = Request["StartDateTime_time"];
                string EndDateTime_time = Request["EndDateTime_time"];

                entity.Fields["ReminderDate"].Value = Request["reminder_dt"];
                entity.Fields["ReminderTime"].Value = Request["reminder_dt_time"];
                if (Request["evt15"] != null)
                    entity.Fields["IsAllDayEvent"].Value = true;

                bool outOfOffice = false;
                entity.Fields["Location"].Value = Request["evt12"];
                if (Request["outOfOffice"] != null)
                    outOfOffice = true;
                entity.Fields["OutOfOffice"].Value = outOfOffice;
                string ownerUserId = "";
                if (string.IsNullOrEmpty(Request["evt1_lkid"]))
                {

                    entity.Fields["OwningUser"].Value = caller.UserID;
                }
                else
                    entity.Fields["OwningUser"].Value = Request["evt1_lkid"];
                ownerUserId = entity.Fields["OwningUser"].Value.ToString();
                entity.Fields["ActivityTypeCode"].Value = 4201;

                string invtee = Request["invtee"];//邀请
                if (!string.IsNullOrEmpty(invtee))
                    entity.Fields["IsGroupActivity"].Value = true;

                //entity.Fields["ScheduledEnd"].Value = Request["tsk4"];
                entity.Fields["Description"].Value = Request["evt6"];
                DateTime dt1 = DateTime.Now;
                DateTime dt2 = DateTime.Now;
                string recurrencePattern = "";
                string startTime = "";
                string endTime = "";
                if (Request["IsRecurrence"] != null)
                {
                    string recStart = StringUtil.GetString(Request["RecurrenceStartDateTime"]);
                    string recEnd = StringUtil.GetString(Request["RecurrenceEndDateOnly"]);

                    StringBuilder sb = new StringBuilder();
                    try
                    {
                        //if (string.IsNullOrEmpty(recStart) || string.IsNullOrEmpty(recEnd))
                        //{
                       //     Supermore.Diagnostics.Trace.LogTest(recStart +":"+ recEnd);
                       // }
                       // Supermore.Diagnostics.Trace.LogTest("log1");
                        entity.Fields["RecurrenceStartDateTime"].Value = recStart;
                      //  Supermore.Diagnostics.Trace.LogTest("log4");
                        entity.Fields["RecurrenceEndDateTime"].Value = recEnd;
                       // Supermore.Diagnostics.Trace.LogTest("log3");
                        entity.Fields["IsRecurrence"].Value = 1;

                        //循环序列Id
                        entity.Fields["RecurrenceId"].Value = activitId;
                      //  Supermore.Diagnostics.Trace.LogTest("log5");
                            
                       
                        sb.Append(recStart);
                        sb.Append("|");
                        sb.Append(recEnd);
                        sb.Append("|");

                        #region recurrence
                        string rectype = Request["rectype"];

                        sb.Append(rectype);
                        sb.Append("|");
                        #region 日
                        if (rectype == "ftd") //日
                        {
                            string recd = Request["recd"]; //间隔
                            sb.Append(recd);
                            if (recd == "d0") //每个工作日
                            {
                                sb.Append("|");
                                sb.Append(1);
                            }
                            if (recd == "d1") //指定间隔为天
                            {
                                string di = Request["di"]; //
                                sb.Append("|");
                                sb.Append(di);
                            }
                        }
                        #endregion
                        #region 周
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
                                wkNums += "," + "2";
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
                                wkNums += "," + "32";
                            }
                            wN = Request["64"];
                            if (!string.IsNullOrEmpty(wN))
                            {
                                wkNums = wkNums.Trim(',');
                                wkNums += ",64";
                            }
                            if (!string.IsNullOrEmpty(wkNums))
                                wkNums = wkNums.Trim(',');
                            sb.Append(wkNums);
                        }
                        #endregion
                        #region 月
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
                        #endregion
                        #region 年
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

                        #endregion

                        recurrencePattern = sb.ToString();
                        //Supermore.Diagnostics.Trace.LogTest(recurrencePattern);
                        entity.Fields["RecurrenceType"].Value = recurrencePattern;
                    }
                    catch (Exception ex)
                    {
                        Supermore.Diagnostics.Trace.LogException(ex);
                    }

                   
                    //entity.Fields["RecurrenceInterval"].Value = 
                }
                else
                {
                    //entity.Fields["ScheduledEnd"].Value = Request["tsk4"];
                    entity.Fields["IsRecurrence"].Value = 0; //Request["IsRecurrence"];
                }

                startTime = StartDateTime + " " + StartDateTime_time;
                endTime = EndDateTime + " " + EndDateTime_time;

                dt1 = DateTime.Parse(startTime);
                dt2 = DateTime.Parse(endTime);

                startTime = dt1.ToString("yyyy-MM-dd HH:mm:ss");
                endTime = dt2.ToString("yyyy-MM-dd HH:mm:ss");

                entity.Fields["ScheduledStart"].Value = startTime;
                entity.Fields["ScheduledEnd"].Value = endTime;

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
                    entity.Fields["ModifiedBy"].Value = caller.UserID;
                    entity.Fields["ModifiedOn"].Value = DateTime.Now;
                }
                //entity.Fields["Password"].Value = Settings.GetSetting("Security.InitPassword");

                //LanguageLocaleKey
                //LocaleSidKey
                //TimeZoneSidKey
                bool isSaved = entity.EndEdit();


                if (isSaved)
                {

                    if (outOfOffice && !isUpdated)
                    {
                        /*
                        DateTime start = DateTime.Parse(dt1.ToString("yyyy-MM-dd"));
                        DateTime end = DateTime.Parse(dt2.ToString("yyyy-MM-dd"));
                        TimeSpan ts = end.Subtract(start);
                        int days = ts.Days;
                        DateTime dt = start;                   
                        string checkTime = Settings.GetSetting("HR.CheckinTime", "08:30");
                        if (string.IsNullOrEmpty(checkTime))
                            checkTime = "08:30";
                        string checkOutTime = Settings.GetSetting("HR.CheckOutTime", "17:30");
                        for (var d = 0; d <= days; d++)
                        {                       
                            Supermore.HR.AttendanceManager.CheckIn(caller, dt.ToString("yyyy-MM-dd"), checkTime, false, true, "日程同步-外出");
                            Supermore.HR.AttendanceManager.CheckOut(caller, dt.ToString("yyyy-MM-dd"), checkOutTime, true, "日程同步-外出");
                            dt = dt.AddDays(1);
                        }
                        */
                        CreateLeave(entity);
                    }
                    //string invtee = Request["invtee"];//邀请
                    if (!string.IsNullOrEmpty(invtee))
                        CreateInvitees(invtee, entity);

                    #region //通知
                    try
                    {
                        //通知
                        bool notifySms = true;
                        bool notifyEmail = true;
                        bool notifyMessager = true;
                        if (Request["chkSms"] == null)
                            notifySms = false;
                        if (Request["chkEmail"] == null)
                            notifyEmail = false;
                        if (Request["chkMessage"] == null)
                            notifyMessager = false;
                        Guid[] userIds = new Guid[] { };
                        string[] invtees = invtee.Split(',');

                        foreach (string invt in invtees)
                        {
                            if (invtee == "000000000000000")
                                continue;
                            Array.Resize<Guid>(ref userIds, userIds.Length + 1);
                            userIds[userIds.Length - 1] = new Guid(invt);
                        }

                        string msg = string.Format("任务安排：{0} 给您 安排任务，如下：{1}，期限 {2} 至{3}，请速到日程查看处理。", caller.UserName, subject, startTime, endTime);
                        if (notifySms)
                        {
                            // if (ownerUserId != caller.UserID)
                            SmsMessageManager.PushSmsQueueAndSend(caller, userIds, msg, 2, DateTime.Now, Guid.NewGuid());
                        }
                        if (notifyMessager)
                        {
                            foreach (Guid invt in userIds)
                            {
                                SystemMessengerManager.CreateNotificationMessage(caller, new Guid(caller.UserID), invt, subject, msg, entity.ID, 4201, entity.ID);
                            }
                        }
                        if (notifyEmail)
                        {
                            foreach (Guid invt in userIds)
                            {
                                InnerMailManager.CreateHtmlEmail(caller, new Guid(caller.UserID), invt, subject, msg, entity.ID, 1);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Supermore.Diagnostics.Trace.LogException(ex);
                    }
                    #endregion
                }
                string retURL = "";
                retURL = Request["retURL"];
                if (saveNew)
                {
                    string save_new_url = Request["save_new_url"];
                    //if (cmdName == "savenewtask")
                    //{
                    //    save_new_url = "/00T/e?retURL=%2Fhome%2Fhome.aspx";
                    //}
                    string aid = Request["aid"];
                    string anm = Request["anm"];
                    string evt4 = Request["evt4"];
                    //string anm = Request["anm"];
                    if (cmdName == "savenewevent")
                    {
                        if (!string.IsNullOrEmpty(aid))
                            save_new_url = string.Format("/00U/e?aid={0}&anm={1}&evt4={2}retURL={3}", aid, anm, evt4, retURL);
                        else
                            save_new_url = "/00U/e?retURL=%2Fhome%2Fhome.aspx";
                    }
                    //if (isStartProcess && !isUpdated)//非更新
                    //{
                    //    save_new_url = string.Format("/apps/wf/ApplyInstFromObject.aspx?objectId={0}&objectName={1}&entityType={2}&t=a0M", entity.ID.ToString(), HttpUtility.UrlEncode(subject), ObjectTypeCodes.HRRequestLeave);
                    //}
                    Response.Redirect(save_new_url);
                }
                else
                {
                    if (outOfOffice && !isUpdated)
                    {
                        retURL = string.Format("/apps/wf/ApplyInstFromObject.aspx?objectId={0}&objectName={1}&entityType={2}&t=a0M", entity.ID.ToString(), HttpUtility.UrlEncode(subject), ObjectTypeCodes.HRRequestLeave);
                    }
                    if (string.IsNullOrEmpty(retURL))
                        retURL = "/00U/c?t=home&cType=1";
                    Response.Redirect(retURL);
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }

        void CreateLeave(Entity evt)
        {
            try
            {
                Entity entity = new Entity(evt.ID, ObjectTypeCodes.HRRequestLeave, caller.OrganizationId);
                entity.BeginEdit();
                
                // entity.Fields["ScheduledStart"].Value = startTime;
                //entity.Fields["ScheduledEnd"].Value = endTime;
                if (entity.Fields["ApplyEmp"] != null)
                    entity.Fields["ApplyEmp"].Value = caller.UserID;

                if (entity.Fields["UserId"] != null)
                    entity.Fields["UserId"].Value = caller.UserID;

                entity.Fields["LeaveType"].Value = 0;//公出
                if (entity.Fields["StartDate"] != null)
                    entity.Fields["StartDate"].Value = evt.Fields["ScheduledStart"].Value;
                if (entity.Fields["EndDate"] != null)
                    entity.Fields["EndDate"].Value = evt.Fields["ScheduledEnd"].Value;
                
                if (entity.Fields["StartTime"] != null)
                    entity.Fields["StartTime"].Value = evt.Fields["ScheduledStart"].Value;
                if (entity.Fields["EndTime"] != null)
                    entity.Fields["EndTime"].Value = evt.Fields["ScheduledEnd"].Value;

                DateTime dt1 = DateTime.Parse(evt.Fields["ScheduledStart"].Value.ToString());
                DateTime dt2 = DateTime.Parse(evt.Fields["ScheduledEnd"].Value.ToString());
                AttendRuleManager attendRuleManager = new AttendRuleManager();
                AttendRule attendRule = attendRuleManager.GetAttendRule(caller, "0");
                double days =  AttendanceManager.CalculateLeaveDays(caller, caller.UserID, attendRule, dt1, dt2);

                if (entity.Fields["StateCode"] != null)
                    entity.Fields["StateCode"].Value = 2;

                if (days > 2) //大于2天，开启公出请假流程
                {
                    isStartProcess = true;
                    entity.Fields["StateCode"].Value = 2;
                }
                else
                {
                    entity.Fields["StateCode"].Value = 3;//默认（已批准）
                }
                entity.Fields["LeaveDays"].Value = days;
                entity.Fields["LeaveReason"].Value = StringUtil.GetString(evt.Fields["Subject"].Value) + StringUtil.GetString(evt.Fields["Description"].Value);
                entity.Fields["BusinessUnitId"].Value = caller.BussinessUnitId;
                entity.Fields["CreatedBy"].Value = caller.UserID;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                bool isSaved = entity.EndEdit();
            }
            catch(Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        void CreateInvitees(string strinvtee, Entity parentEntity)
        {
            string[] invtees = strinvtee.Split(',');
            int iRow = 1;
            foreach (string invtee in invtees)
            {
 
                if (invtee == "000000000000000")
                    continue;
                iRow++;

                Entity entity = null;
                //if (string.IsNullOrEmpty(Id))
                {
                    entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.Activity, caller.OrganizationId);
                }

                entity.BeginEdit();

                foreach (Field field in parentEntity.Fields)
                {
                    if (!field.Name.Equals("ActivityId", StringComparison.InvariantCultureIgnoreCase))
                        entity.Fields[field.Name].Value = field.Value;
                }

                //if (entity.Fields["Approve3"] != null)
                //    entity.Fields["Approve3"].Value = "";
                //if (entity.Fields["Approve5"] != null)
                //    entity.Fields["Approve5"].Value = "";
                //if (entity.Fields["Approve6"] != null)
                //    entity.Fields["Approve6"].Value = "";
                entity.Fields["ParentActivityId"].Value = parentEntity.ID;
                //entity.Fields["AcceptedStatus"].Value = 0;
                entity.Fields["IsGroupActivity"].Value = true;
                entity.Fields["OwningUser"].Value = invtee;
                //entity.Fields[temp.NameField].Value = processName;
                entity.Fields["CreatedBy"].Value = caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedBy"].Value = caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
               bool saved= entity.EndEdit();

            }

             
        }

        string RemoveInite(string strinvtee)
        {
            string restInvitees = "";
            hdnrefr = Request["hdnrefr"];
            string[] invtees = strinvtee.Split(',');
            int c = 0;
            foreach (string invtee in invtees)
            {
                if (invtee == "000000000000000")
                    continue;
                if (invtee == hdnaddn)
                    continue;
                if (c > 0)
                    restInvitees += ",";
                restInvitees += invtee;
                c++;
            }
            return restInvitees;
        }

        int iHiddenInvitee = 1;
        void RenderHiddenInvitees(string strinvtee)
        {
            if (string.IsNullOrEmpty(strinvtee)) return;
            string[] invtees = strinvtee.Split(',');
            StringBuilder sb = new StringBuilder();
            string[] exitsInvitees = new string[] { };
            int iRow = 1;
            foreach (string invtee in invtees)
            {
                if (invtee == "000000000000000")
                    continue;
                if (Array.IndexOf(exitsInvitees, invtee) <= -1)
                {
                    Array.Resize<string>(ref exitsInvitees, exitsInvitees.Length + 1);
                    exitsInvitees[iRow - 1] = invtee;
                    //continue;
                }
                else
                {
                    continue;
                }
                //<input type="hidden" id="invtee0" name="invtee" value="000000000000000" />
                sb.AppendFormat("<input type=\"hidden\" id=\"invtee{1}\" name=\"invtee\" value=\"{0}\" />", invtee, iHiddenInvitee);
                iHiddenInvitee++;
                iRow++;
            }

            InviteeHiddenHTML += sb.ToString();
        }
        string[] exitsInvitees = new string[] { };
        int iRow = 1;

        void RenderInvitees(string strinvtee)
        {
            if (string.IsNullOrEmpty(strinvtee)) return;
            StringBuilder sb = new StringBuilder();

            string[] invtees = strinvtee.Split(',');
                       
            foreach (string invtee in invtees)
            {
                if (invtee == "000000000000000")
                    continue;
                if (Array.IndexOf(exitsInvitees, invtee) <= -1)
                {
                    Array.Resize<string>(ref exitsInvitees, exitsInvitees.Length + 1);
                    exitsInvitees[iRow - 1] = invtee;
                    //continue;
                }
                else
                {
                    continue;
                }
                sb.Append("<tr class=\"even\">");
                // sb.Append("<td class=\"cbCol\"> &nbsp;</td>");
                sb.AppendFormat("<td class=\"cbCol\"><a href=\"javascript:removeInvitee%28%27{0}%27%29%3B\">删除</a></td>", invtee);
                string userName = EntityManager.GetEntityName(caller, EntityTemplateIDs.SystemUser, new Guid(invtee));
                sb.AppendFormat("<td class=\"nameCol\" scope=\"row\"> {0}</td>", userName);
                sb.Append("<td class=\"typeCol\"> 用户</td>");
                sb.Append("<td class=\"mins first\" colspan=\"36\"> &nbsp;</td>");
                sb.Append("</tr>");
                iRow++;
            }
            /*
        <tr class="even">
                                            <td class="cbCol">
                                                &nbsp;
                                            </td>
                                            <th class="nameCol" scope="row">
                                                liu jack
                                            </th>
                                            <td class="typeCol">
                                                用户
                                            </td>
                                            <td class="mins first" colspan="36">
                                                &nbsp;
                                            </td>
                                        </tr>
        */
             InviteeCalendarHTML+= sb.ToString();
             //return InviteeCalendarHTML;
        }
        
        public string DateNow { get; set; }
        public string DateNowTime { get; set; }
        //public string DateNowStartTime { get; set; }
        //public string DateNowEndTime { get; set; }

        public int PriorityCode { get; set; }
        public int StateCode { get; set; }
        public string Location { get; set; }
        public string Description { get; set; }
        public string Subject { get; set; }
        public bool IsAllDayEvent { get; set; }
        public string ScheduledStart { get; set; }
        public string ScheduledStartTime { get; set; }

        public string ScheduledEnd { get; set; }
        public string ScheduledEndTime { get; set; }
        /// <summary>
        /// 重复开始接受日期
        /// </summary>
        public string RecurrenceStartDateTime { get; set; }
        public string RecurrenceEndDateTime { get; set; }

        public string ReminderDate { get; set; }
        public string OwningUser { get; set; }
        public string OwningUserName { get; set; }

        public string OutOfOfficeCheckHTML { get; set; }
        public string IsRecurrenceHTML { get; set; }
        public string InviteeHiddenHTML { get; set; }
        public string InviteeCalendarHTML { get; set; }
    }
}