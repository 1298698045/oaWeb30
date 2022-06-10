using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OA.Web.Meetings;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.Meetings;

namespace WebClient.apps.meetings
{
    public partial class meetingCalendar : System.Web.UI.Page
    {
        private CallContext _caller;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dtReq = DateTime.Now;
           _caller = AppDataSource.GetCallContext();

           string queryMonth = Request["md1"];//月份
           string queryWeek = Request["md2"];//周
           string queryDay = Request["md3"];//日
           string dtfd = Request["dtfd"];
           Md0 = Request["md0"]; //year

           if (!string.IsNullOrEmpty(dtfd))
           { 
                DateTime selectDT = DateTime.Parse(dtfd);
                Md0 = selectDT.Year.ToString();
                this.Md1 = (selectDT.Month - 1).ToString();
                queryMonth = this.Md1;
           }

           this.CurYear = dtReq.Year.ToString();
           this.CurMonth = (dtReq.Month-1).ToString();

           int currentWeekNum = GetWeekNumberOfYear(DateTime.Now);
           int currentDayNum = GetDayNumberOfYear(DateTime.Now);
           int currentMonthNum = DateTime.Now.Month;
           string queryDate = "";
           if (!string.IsNullOrEmpty(queryMonth))
           {
               this.Md1 = queryMonth;
               int mValue = int.Parse(queryMonth);
               int intMonth = mValue + 1;

               if (currentMonthNum == intMonth) //参数月份和系统月份一致
               {
                   this.Md1 = queryMonth.ToString();
                   this.Md2 = currentWeekNum.ToString();
                   this.Md3 = currentDayNum.ToString();
               }
               else
               {
                   queryDate = string.Format("{0}-{1}-01", Md0, intMonth);
                   this.Md2 = GetWeekNumberOfYear(DateTime.Parse(queryDate)).ToString();
                   this.Md3 = GetDayNumberOfYear(DateTime.Parse(queryDate)).ToString();
               }
               this.DateText = string.Format("{0}年{1}月", Md0, CnMonth(mValue));
               this.StartDate = string.Format("{0}-{1}-01", Md0, intMonth);
               this.EndDate =  string.Format("{0}-{1}-{2}", Md0, intMonth,DateUtil2.GetMonthDays(int.Parse(Md0), intMonth));
           }
           else
           {
               this.Md2 = currentWeekNum.ToString();
               this.Md3 = currentDayNum.ToString();

               Md0 = DateTime.Now.Year.ToString();
               int mValue = DateTime.Now.Month - 1;
               this.Md1 = mValue.ToString();
               queryMonth = this.Md1;
               this.DateText = string.Format("{0}年{1}月", Md0, CnMonth(mValue));
               this.StartDate = string.Format("{0}-{1}-01", Md0, DateTime.Now.Month);
               this.EndDate = string.Format("{0}-{1}-{2}", Md0, DateTime.Now.Month, DateUtil2.GetMonthDays(int.Parse(Md0), DateTime.Now.Month));
           }

           string nextMonth = "";
           string nextYear = "";
           string prevMonth = "";
           string prevYear = "";

           GetNextYearMonth(Md0, queryMonth, out nextMonth, out nextYear);
           GetPreYearMonth(Md0, queryMonth, out prevMonth, out prevYear);

           this.NextMonth = nextMonth;
           this.NextYear = nextYear;
           this.PrevYear = prevYear;
           this.PrevMonth = prevMonth;

           if (!string.IsNullOrEmpty(queryWeek))
           {
           
           }

           if (!string.IsNullOrEmpty(queryDay))
           {
           
           }

           this.UserName = WebContext.UserName;

            //Md1 = dtReq.Month.ToString();
            //DateTime.UtcNow.
            //Md2 = dtReq.d
           //Md3 = dtReq.DayOfYear.ToString();
           if (!string.IsNullOrEmpty(Request["cal"]))
           {
               this.CalendarName = Request["cal"];
           }

           if (Request["cal_lkid"] != null)
           {
               this.CalendarId = Request["cal_lkid"];

               if (string.IsNullOrEmpty(this.CalendarName))
               {
                   this.CalendarName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, new Guid(this.CalendarId));
               }
           }

           if (string.IsNullOrEmpty(this.CalendarId))
               this.CalendarId = WebContext.UserId;

           if (string.IsNullOrEmpty(this.CalendarName))
               this.CalendarName = WebContext.UserFullName;

           GetMeetings();
           MeetingMonthCalendar monthCalendar = new MeetingMonthCalendar();
           monthCalendar.Md0 = this.Md0;
           monthCalendar.Md1 = this.Md1;
           monthCalendar.Render();
           this.CalendarHTML = monthCalendar.RenderHTML;
        }
        void GetMeetings()
        {
            MeetingManager meetingManager = new MeetingManager();
            //List<Meeting> events = meetingManager.GetMeetings(_caller, new Guid(_caller.UserID), this.StartDate, this.EndDate);
            List<Meeting> events = meetingManager.GetMeetings(_caller, Guid.Empty, this.StartDate, this.EndDate);
            MeetingHoverPagePreRender eventHoverPagePreRender = new MeetingHoverPagePreRender();
            eventHoverPagePreRender.Meetings = events;
            eventHoverPagePreRender.Render();
            EventHoverPage = eventHoverPagePreRender.HTMLResult;
            /*
            List<ActivityTask> tasks = ActivityManager.GetTasks(_caller, this.RequestDate);
            eventHoverPagePreRender = new EventHoverPagePreRender();
            eventHoverPagePreRender.Tasks = tasks;
            eventHoverPagePreRender.Render();
            EventHoverPage = eventHoverPagePreRender.HTMLResult;
            */
        }
        public static int GetWeekNumberOfYear(DateTime now)
        {
            CultureInfo ci = CultureInfo.CurrentCulture;
            int weekNumber = ci.Calendar.GetWeekOfYear(now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            return weekNumber;
        }
        public static int GetDayNumberOfYear(DateTime now)
        {
            CultureInfo ci = CultureInfo.CurrentCulture;
            int weekNumber = ci.Calendar.GetDayOfYear(now);
            return weekNumber;
        }
        void GetPreYearMonth(string curYear, string curMonth, out string preMonth, out string preYear)
        {
            if (curMonth == "0" || curMonth == "00")
            {
                preYear = (Convert.ToInt32(curYear) - 1).ToString();
                preMonth = "11";
            }
            else
            {
                preYear = curYear;
                preMonth = (Convert.ToInt32(curMonth) - 1).ToString();
                if (preMonth.Length == 1)
                    preMonth = "0" + preMonth;
            }

        }
        void GetNextYearMonth(string curYear, string curMonth, out string nextMonth, out string nextYear)
        {
            if (curMonth == "11")
            {
                nextYear = (Convert.ToInt32(curYear) + 1).ToString();
                nextMonth = "0";
            }
            else
            {
                nextYear = curYear;
                nextMonth = (Convert.ToInt32(curMonth) + 1).ToString();
                if (nextMonth.Length == 1)
                    nextMonth = "0" + nextMonth;
            }
        }
        string CnMonth(int month)
        {
            string cnmonth = "1";// "一月";
            switch (month)
            {
                case 0:
                    cnmonth = "1";//"一月";
                    break;
                case 1:
                    cnmonth = "2";//"二月";
                    break;
                case 2:
                    cnmonth = "3";//"三月";
                    break;
                case 3:
                    cnmonth = "4";//"四月";
                    break;
                case 4:
                    cnmonth = "5";//"五月";
                    break;
                case 5:
                    cnmonth = "6";//"六月";
                    break;
                case 6:
                    cnmonth = "7";//"七月";
                    break;
                case 7:
                    cnmonth = "8";//"八月";
                    break;
                case 8:
                    cnmonth = "9";//"九月";
                    break;
                case 9:
                    cnmonth = "10";//"十月";
                    break;
                case 10:
                    cnmonth = "11";//"十一月";
                    break;
                case 11:
                    cnmonth = "12";//"十二月";
                    break;
                //case 0:
                //	cnmonth = "十二月";
                //	break;
                default:
                    break;
            }
            return cnmonth;
        }
        /// <summary>
        /// 第X年
        /// </summary>
        public string Md0 { get; set; }
        /// <summary>
        /// 第X月 从0开始
        /// </summary>
        public string Md1 { get; set; }
        /// <summary>
        /// 第X周
        /// </summary>
        public string Md2 { get; set; }
        /// <summary>
        /// 第X日
        /// </summary>
        public string Md3 { get; set; }

        public string StartDate { get; set; }
        public string EndDate { get; set; }

        public string CurYear { get; set; }
        public string CurMonth { get; set; }

        public string DateText { get; set; }
        public string UserName { get; set; }
        public string CalendarId { get; set; }
        public string CalendarName { get; set; }
        public string NextYear { get; set; }
        public string NextMonth { get; set; }
        public string PrevYear { get; set; }
        public string PrevMonth { get; set; }

        public string EventHoverPage { get; set; }

        public string CalendarHTML { get; set; }
    }
}