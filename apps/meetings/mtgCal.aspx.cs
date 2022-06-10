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
    public partial class mtgCal : System.Web.UI.Page
    {
        private CallContext _caller;

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dtReq = DateTime.Now;
            _caller = AppDataSource.GetCallContext();

            Md0 = Request["md0"]; //year
            this.Md1 = Request["md1"];//月份
            this.Md2 = Request["md2"];//周
            this.Md3 = Request["md3"];//日
            string dtfd = Request["dtfd"];
           
            if (!string.IsNullOrEmpty(dtfd))
            {
                DateTime selectDT = DateTime.Parse(dtfd);
                Md0 = selectDT.Year.ToString();
                this.Md1 = (selectDT.Month - 1).ToString();
            }

            this.CurYear = dtReq.Year.ToString();
            this.CurMonth = (dtReq.Month - 1).ToString();

            if (Request["md2"] == null) //如果不是周，就是月
            {
                if (Request["md1"] == null)
                    this.Md1 = (DateTime.Now.Month - 1).ToString();
            }

            int currentWeekNum = DateUtil2.GetWeekNumberOfYear(DateTime.Now);
            int currentDayNum = DateUtil2.GetDayNumberOfYear(DateTime.Now);
            int currentMonthNum = DateTime.Now.Month;
            string queryDate = "";
            string nextMonth = "";
            string nextYear = "";
            string prevMonth = "";
            string prevYear = "";

            if (!string.IsNullOrEmpty(this.Md1))
            {
                int mValue = int.Parse(this.Md1);
                int intMonth = mValue + 1;

                if (string.IsNullOrEmpty(Md0))
                    Md0 = DateTime.Now.Year.ToString();

                if (currentMonthNum == intMonth) //参数月份和系统月份一致
                {
                    this.Md2 = currentWeekNum.ToString();
                    this.Md3 = currentDayNum.ToString();
                }
                else
                {
                    queryDate = string.Format("{0}-{1}-01", Md0, intMonth);
                    this.Md2 = DateUtil2.GetWeekNumberOfYear(DateTime.Parse(queryDate)).ToString();
                    this.Md3 = DateUtil2.GetDayNumberOfYear(DateTime.Parse(queryDate)).ToString();
                }
                this.DateText = string.Format("{0}年{1}月", Md0, CnMonth(mValue));
                this.StartDate = string.Format("{0}-{1}-01", Md0, intMonth);
                this.EndDate = string.Format("{0}-{1}-{2}", Md0, intMonth, DateUtil2.GetMonthDays(int.Parse(Md0), intMonth));

                GetNextYearMonth(Md0, this.Md1, out nextMonth, out nextYear);
                GetPreYearMonth(Md0, this.Md1, out prevMonth, out prevYear);

                this.NextMd1 = nextMonth;
                this.NextMd0 = nextYear;
                this.PreMd0 = prevYear;
                this.PreMd1 = prevMonth;
            }
            else
            {
                if (string.IsNullOrEmpty(this.Md0))
                    Md0 = DateTime.Now.Year.ToString();

                if (string.IsNullOrEmpty(this.Md1))
                {
                    int mValue = DateTime.Now.Month - 1;
                    this.Md1 = mValue.ToString();
                }

                if (string.IsNullOrEmpty(this.Md2))
                    this.Md2 = currentWeekNum.ToString();

                if (string.IsNullOrEmpty(this.Md3))
                    this.Md3 = currentDayNum.ToString();
                //this.StartDate = string.Format("{0}-{1}-01", Md0, DateTime.Now.Month);
                //this.EndDate = string.Format("{0}-{1}-{2}", Md0, DateTime.Now.Month, DateUtil2.GetMonthDays(int.Parse(Md0), DateTime.Now.Month));
                if (!string.IsNullOrEmpty(this.Md2))
                {
                    GetWeekRangeByWeekNumber(int.Parse(this.Md0), int.Parse(this.Md2));
                }
                else
                {
                    GetWeekRangeToday();
                }
                //this.DateText = WeekRangeDate;// string.Format("{0}年{1}周", Md0, this.Md2);
            }

            this.UserName = WebContext.UserName;
            
            //if (!string.IsNullOrEmpty(Request["cal"]))
            //{
            //    this.CalendarName = Request["cal"];
            //}
            //if (Request["cal_lkid"] != null)
            //{
            //    this.CalendarId = Request["cal_lkid"];
            //    if (string.IsNullOrEmpty(this.CalendarName))
            //    {
            //        this.CalendarName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, new Guid(this.CalendarId));
            //    }
            //}

            //if (string.IsNullOrEmpty(this.CalendarId))
            //    this.CalendarId = WebContext.UserId;

            if (string.IsNullOrEmpty(this.CalendarName))
                this.CalendarName = WebContext.UserFullName;

            GetMeetings();
            MeetingMonthCalendar monthCalendar = new MeetingMonthCalendar();
            monthCalendar.Md0 = this.Md0;
            monthCalendar.Md1 = this.Md1;
            if (Request["md2"] != null)
                monthCalendar.Md2 = this.Md2;
            monthCalendar.Render();
            this.CalendarHTML = monthCalendar.RenderHTML;
        }
        void GetMeetings()
        {
            MeetingManager meetingManager = new MeetingManager();
            //List<Meeting> events = meetingManager.GetMeetings(_caller, new Guid(_caller.UserID), this.StartDate, this.EndDate);
            List<Meeting> events = meetingManager.GetMeetings(_caller, Guid.Empty, this.StartDate, this.EndDate);
            MeetingHoverPagePreRender eventHoverPagePreRender = new MeetingHoverPagePreRender();
            eventHoverPagePreRender.RetURL = Request["retURL"];
            eventHoverPagePreRender.Meetings = events;
            eventHoverPagePreRender.Render();
            EventHoverPage = eventHoverPagePreRender.HTMLResult;
            
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

        public void GetWeekRangeToday()
        {
            DateTime first = DateTime.Now;
            DateTime last = DateTime.Now;
            int weekNumber = 0;
            int year = 0;
            DateTime today = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd"));
            DateUtil2.GetWeekNumberOfWest(today, out first, out last, out year, out weekNumber);

            this.Md0 = year.ToString();              //年
            this.Md2 = weekNumber.ToString();        //周
            this.Md1 = (today.Month - 1).ToString(); //月

            this.StartDate = first.ToString("yyyy-MM-dd");
            this.EndDate = last.ToString("yyyy-MM-dd");

            DateText = StartDate + " - " + EndDate;

            //获取时间年，周
            this.ThisMd0 = this.Md0;
            this.ThisMd2 = this.Md2;

            GetNextWeek(first, last, year, weekNumber);
        }

        public void GetWeekRangeByWeekNumber(int year, int weekNumber)
        {
            DateTime first = DateTime.MinValue;
            DateTime last = DateTime.MinValue;

            DateUtil2.GetDayRangeOfWeek(year, weekNumber, out first, out last);

            this.Md0 = year.ToString();
            this.Md2 = weekNumber.ToString();
            this.Md1 = (first.Month - 1).ToString(); //月

            this.StartDate = first.ToString("yyyy-MM-dd");
            this.EndDate = last.ToString("yyyy-MM-dd");

            this.DateText = StartDate + " - " + EndDate;
            //获取时间年，周
            int curWeek = DateUtil2.GetWeekNumber(DateTime.Now);
            this.ThisMd0 = DateTime.Now.Year.ToString();
            this.ThisMd2 = curWeek.ToString();

            GetNextWeek(first, last, year, weekNumber);
        }
        
        void GetNextWeek(DateTime startDate, DateTime endDate, int year, int curWeek)
        {
            int preWeek = 0;
            int nextWeek = 1;

            DateTime startTime = startDate;
            DateTime endTime = endDate;
            if (curWeek == 1)
            {
                this.NextMd0 = year.ToString();
                this.NextMd2 = (curWeek + 1).ToString();

               // this.NextYear = year.ToString();
                //this.NextMonth

                DateTime tmpD = startTime.AddDays(-1);
                int t = DateUtil2.GetWeekNumber(tmpD);
                this.PreMd2 = t.ToString();
                this.PreMd0 = tmpD.Year.ToString();

               // this.PrevYear = tmpD.Year.ToString();
                //this.p

            }
            else
            {
                if (curWeek == 1)
                {
                    this.PreMd0 = (startTime.Year - 1).ToString();
                    preWeek = 53;

                    //同一年
                    this.NextMd0 = startTime.Year.ToString();
                    nextWeek = (curWeek + 1);
                }
                else
                {
                    // DateUtil2.GetDateTime
                    preWeek = (curWeek - 1);
                    this.PreMd0 = startTime.Year.ToString();

                    DateTime nextWeekStart = DateTime.Parse(this.StartDate).AddDays(1);

                    DateTime nextWeekEnd = DateUtil2.GetWeekLastDaySunday(nextWeekStart);
                    if (nextWeekEnd.Year > startTime.Year)
                    {
                        this.NextMd0 = nextWeekEnd.Year.ToString();
                        nextWeek = 1;
                    }
                    else
                    {
                        //同一年
                        this.NextMd0 = startTime.Year.ToString();
                        nextWeek = (curWeek + 1);
                    }

                }
                this.PreMd2 = preWeek.ToString();
                this.NextMd2 = nextWeek.ToString();
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

        //public string WeekRangeDate { get; set; }
        //public string StartWeekDay { get; set; }
        //public string EndWeekDay { get; set; }
        
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

        /// <summary>
        /// 当前周
        /// </summary>
        public string ThisMd2 { get; set; }
        public string ThisMd0 { get; set; }

        public string DateText { get; set; }
        public string UserName { get; set; }
        public string CalendarId { get; set; }
        public string CalendarName { get; set; }
        public string EncodeCalendarName { get; set; }
        //public string NextYear { get; set; }
        //public string NextMonth { get; set; }
        //public string PrevYear { get; set; }
        //public string PrevMonth { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string PreMd0 { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string PreMd1 { get; set; }
        /// <summary>
        /// 上一周
        /// </summary>
        public string PreMd2 { get; set; }

        /// <summary>
        /// 下一年
        /// </summary>
        public string NextMd0 { get; set; }
        /// <summary>
        /// 下一月
        /// </summary>
        public string NextMd1 { get; set; }
        /// <summary>
        /// 下一周
        /// </summary>
        public string NextMd2 { get; set; }


        public string EventHoverPage { get; set; }

        public string CalendarHTML { get; set; }
    }
}