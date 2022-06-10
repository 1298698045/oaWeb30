using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.UIManager;
using Supermore.GridBuilder;
using Supermore.Queries;
using Supermore.IO;

namespace WebClient.apps.resm
{
    public partial class ResScheduleview : System.Web.UI.Page
    {
        //private EntityCollection _entities = null;
        //private Template _template = null;
        //private GridColumnCollection _columns;
        //private string _tableHTML = "";
        //private string _tableDataHTML = "";
        //private string entityID = "";
        //private string entityType = "FB7EB197-5E8C-4F05-9298-A8107F957B1B";
        private CallContext _caller;
        //private int tasklist_mode = 0;
        //private string _wrappHTML = "";
        //private string _resultHTML = "";
        //private HttpContext _httpContext;
        private string _pageTitle = "";
        private bool _weekCalendar = false;
        private bool _dayCalendar = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.ModuleType = Request["t"];
            if (this.ModuleType == "ClassRoom")
            {
                this.ModuleType = "025";
            }
           
            ResourceType = Request["rType"];
            if (Request["md0"] != null)
            {
                this.Md0 = Request["md0"];

                this.PreMd0 = int.Parse(this.Md0);
                this.NextMd0 = this.PreMd0;
            }
            else
            {
                this.Md0 = DateTime.Now.Year.ToString();

                this.PreMd0 = DateTime.Now.Year;
                this.NextMd0 = DateTime.Now.Year;
            }
            if (ResourceType == "1")
            {
                this.ResourceTypeName = "车辆预约";
            }
            if (ResourceType == "2")
            {
                this.ResourceTypeName = "会议室预约";
            }
            if (ResourceType == "3")
            {
                this.ResourceTypeName = "教室预约";
            }
            this.Md2 = Request["md2"];

            _caller = AppDataSource.GetCallContext();
            if (!string.IsNullOrEmpty(this.Md2))//周
            {
                GetWeekRangeByWeekNumber(int.Parse(this.Md0), int.Parse(this.Md2));
                _weekCalendar = true;
            }
            //else
            //{
            //    this.Md2 = DateUtil2.GetWeekNumberOfYear(DateTime.Now).ToString();
            //    GetWeekRangeToday();
            //}
            DateTime dtReq = DateTime.Now;
           

            if (Request["md3"] != null)//日视图
            {
                this.Md3 = Request["md3"];

                _dayCalendar = true;

                dtReq = DateTime.Parse(string.Format("{0}-01-01", this.Md0));
                int mDays = MainUtil.GetInt(this.Md3, 1);
                dtReq = dtReq.AddDays(mDays - 1);

                this.CNRequestDate = dtReq.ToString("yyyy年MM月dd日");
                this.RequestDate = dtReq.ToString("yyyy-MM-dd");
                WeekName = DateUtil2.GetWeekCNNameOfDate(dtReq.DayOfWeek.ToString());

                WeekRangeDate = WeekName + ", " + this.CNRequestDate;

                if (dtReq.Month == 12 && dtReq.Day == 31)
                {
                    this.NextMd0 = dtReq.Year + 1;
                    this.PreMd0 = dtReq.Year;
                }
                else if (dtReq.Month == 1 && dtReq.Day == 1)
                {
                    this.NextMd0 = dtReq.Year;
                    this.PreMd0 = dtReq.Year - 1;
                }
                else
                { 
                
                }
                //GetNextDay();
            }

            if (!_dayCalendar && !_weekCalendar)
            {
                int curWeekNum = DateUtil2.GetWeekNumber(DateTime.Now);
                this.Md2 = curWeekNum.ToString();
                GetWeekRangeByWeekNumber(int.Parse(this.Md0), curWeekNum);
                _weekCalendar = true;
            }
            //if (Request["cal"] != null)
            //{
            //    this.CalendarName = Request["cal"];
            //}
            //else
            //    this.CalendarName = WebContext.UserName;

            //if (Request["cal_lkid"] != null)
            //{
            //    this.CalendarId = Request["cal_lkid"];
            //}
            //else
            //    this.CalendarId = WebContext.UserId;

            if (_weekCalendar)
            {
                this.ThisMd2 = DateUtil2.GetWeekNumber(DateTime.Now).ToString();
                this.Md1 = (DateTime.Now.Month - 1).ToString();
                this.Md3 = DateTime.Now.DayOfYear.ToString();
                _pageTitle = "星期视图";
            }
            if (_dayCalendar)
            {
                Md1 = (dtReq.Month - 1).ToString();
                Md2 = DateUtil2.GetWeekNumber(dtReq).ToString();
                this.TodayMd3 = this.Md3;
                this.PreMd3 = int.Parse(this.Md3) - 1;
                this.NextMd3 = int.Parse(this.Md3) + 1;
                _pageTitle = "日视图";
            }
             
        }
        public void GetWeekRangeByWeekNumber(int year, int weekNumber)
        {
            DateTime first = DateTime.MinValue;
            DateTime last = DateTime.MinValue;

            DateUtil2.GetDayRangeOfWeek(year, weekNumber, out first, out last);

            this.Md0 = year.ToString();
            this.Md2 = weekNumber.ToString();
            this.Md1 = (first.Month - 1).ToString(); //月

            this.StartWeekDay = first.ToString("yyyy-MM-dd");
            this.EndWeekDay = last.ToString("yyyy-MM-dd");

            WeekRangeDate = StartWeekDay + " - " + EndWeekDay;
            //获取时间年，周
            int curWeek = DateUtil2.GetWeekNumber(DateTime.Now);
            this.ThisMd0 = DateTime.Now.Year.ToString();
            this.ThisMd2 = curWeek.ToString();

            GetNextWeek(first, last, year, weekNumber);

        }
        public void GetWeekRangeToday()
        {
            DateTime dt = DateTime.Now;

            StartWeekDay = DateUtil2.GetSundayOfWeek(dt).ToString("yyyy-MM-dd");
            EndWeekDay = DateUtil2.GetSaturdayOfWeek(dt).ToString("yyyy-MM-dd");

        }
        //public void GetNextDay()
        //{
        //    this.PreMd0 = Md0;
        //    this.NextMd0 = Md0;
        //}
        void GetNextWeek(DateTime startDate, DateTime endDate, int year, int curWeek)
        {
            int preWeek = 0;
            int nextWeek = 1;

            DateTime startTime = startDate;
            DateTime endTime = endDate;
            if (curWeek == 1)
            {
                this.NextMd0 = year;
                this.NextMd2 = curWeek + 1;

                DateTime tmpD = startTime.AddDays(-1);
                int t = DateUtil2.GetWeekNumber(tmpD);
                this.PreMd2 = t;
                this.PreMd0 = tmpD.Year;
            }
            else
            {
                if (curWeek == 1)
                {
                    this.PreMd0 = startTime.Year - 1;
                    preWeek = 53;

                    //同一年
                    this.NextMd0 = startTime.Year;
                    nextWeek = (curWeek + 1);
                }
                else
                {
                    // DateUtil2.GetDateTime
                    preWeek = (curWeek - 1);
                    this.PreMd0 = startTime.Year;

                    DateTime nextWeekStart = DateTime.Parse(this.StartWeekDay).AddDays(1);

                    DateTime nextWeekEnd = DateUtil2.GetWeekLastDaySunday(nextWeekStart);
                    if (nextWeekEnd.Year > startTime.Year)
                    {
                        this.NextMd0 = nextWeekEnd.Year;
                        nextWeek = 1;
                    }
                    else
                    {
                        //同一年
                        this.NextMd0 = startTime.Year;
                        nextWeek = (curWeek + 1);
                    }

                }
                this.PreMd2 = preWeek;
                this.NextMd2 = nextWeek;
            }
        }
        public string ModuleType { get; set; }
        public string WeekRangeDate { get; set; }
        public string StartWeekDay { get; set; }
        public string EndWeekDay { get; set; }
        /// <summary>
        /// 第X年
        /// </summary>
        public string Md0 { get; set; }
        /// <summary>
        /// 第X月(从0开始)
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
        /// <summary>
        /// 上一周
        /// </summary>
        public int PreMd2 { get; set; }
        /// <summary>
        /// 下一周
        /// </summary>
        public int NextMd2 { get; set; }

        public string ThisMd0 { get; set; }
        /// <summary>
        /// 当前周
        /// </summary>
        public string ThisMd2 { get; set; }
        public string TodayMd3 { get; set; }

        public int PreMd0 { get; set; }
        /// <summary>
        /// 上一天
        /// </summary>
        public int PreMd3 { get; set; }

        public int NextMd0 { get; set; }
        /// <summary>
        /// 下一天
        /// </summary>
        public int NextMd3 { get; set; }


        public string CalendarId { get; set; }
        public string CalendarName { get; set; }
        public string WeekName { get; set; }
        public string RequestDate { get; set; }
        public string CNRequestDate { get; set; }
        public string ResourceType { get; set; }
        public string ResourceTypeName { get; set; }
        public string PageTitle { get { return _pageTitle; } }
        public bool IsDayCalendar { get { return _dayCalendar; } }
        public bool IsWeeekCalendar { get { return _weekCalendar; } }
    }
}