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

namespace WebClient.apps.meetings
{
    public partial class mtRooms : System.Web.UI.Page
    {
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
            _caller = AppDataSource.GetCallContext();
            ResourceType = Request["rType"];
            if (Request["md0"] != null)
            {
                this.Md0 = Request["md0"];
            }
            else
            {
                this.Md0 = DateTime.Now.Year.ToString();
            }
            if (ResourceType == "1")
            {
                this.ResourceTypeName = "车辆预约";
            }
            if (ResourceType == "2")
            {
                this.ResourceTypeName = "会议室预约";
            }
            if (Request["md2"] != null)//周
            {
                this.Md2 = Request["md2"];
                GetWeekRangeByWeekNumber(int.Parse(this.Md0), int.Parse(this.Md2));

                _weekCalendar = true;
                this.PreMd2 = (int.Parse(this.Md2) - 1);
                this.NextMd2 = (int.Parse(this.Md2) + 1);

            }
  
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
            }

            if (!_dayCalendar && !_weekCalendar)
            {
                int curWeekNum = DateUtil2.GetCnWeekNumber(DateTime.Now);
                this.Md2 = curWeekNum.ToString();
                GetWeekRangeByWeekNumber(int.Parse(this.Md0), curWeekNum);

                _weekCalendar = true;
                this.PreMd2 = (int.Parse(this.Md2) - 1);
                this.NextMd2 = (int.Parse(this.Md2) + 1);
            }
 
            if (_weekCalendar)
            {
                this.ThisMd2 = DateUtil2.GetCnWeekNumber(DateTime.Now);
                this.Md1 = (DateTime.Now.Month - 1).ToString();
                this.Md3 = DateTime.Now.DayOfYear.ToString();
                _pageTitle = "星期视图";
            }
            if (_dayCalendar)
            {
                Md1 = (dtReq.Month - 1).ToString();
                Md2 = DateUtil2.GetCnWeekNumber(dtReq).ToString();
                this.TodayMd3 = this.Md3;
                this.PreMd3 = int.Parse(this.Md3) - 1;
                this.NextMd3 = int.Parse(this.Md3) + 1;
                _pageTitle = "日视图";
            }
        }
        public void GetWeekRangeByWeekNumber(int year, int weekNum)
        {
            DateTime now = DateTime.Parse(string.Format("{0}-01-01", year));
            int day = now.DayOfYear;
            int wkNum = weekNum - 1;
            int totalNum = (wkNum * 7) - 1;
            DateTime dt = now.AddDays(totalNum);
            //西方
            StartWeekDay = DateUtil2.GetSundayOfWeek(dt).ToString("yyyy-MM-dd");
            EndWeekDay = DateUtil2.GetSaturdayOfWeek(dt).ToString("yyyy-MM-dd");
            //中国
            //StartWeekDay = DateUtil2.GetMondayOfWeek(dt).ToString("yyyy-MM-dd");
            //EndWeekDay = DateUtil2.GetSundayOfWeek(dt).ToString("yyyy-MM-dd");
            //EndWeekDay = DateUtil2.GetMondayOfWeek(dt).AddDays(6).ToString("yyyy-MM-dd");
            WeekRangeDate = StartWeekDay + " - " + EndWeekDay;

        }
        public void GetWeekRangeToday()
        {
            DateTime dt = DateTime.Now;

            StartWeekDay = DateUtil2.GetSundayOfWeek(dt).ToString("yyyy-MM-dd");
            EndWeekDay = DateUtil2.GetSaturdayOfWeek(dt).ToString("yyyy-MM-dd");

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
        /// <summary>
        /// 当前周
        /// </summary>
        public int ThisMd2 { get; set; }
        public string TodayMd3 { get; set; }

        /// <summary>
        /// 上一天
        /// </summary>
        public int PreMd3 { get; set; }
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