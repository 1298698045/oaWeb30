using System;
using System.Collections.Generic;
using System.Linq;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;

namespace WebClient.home
{
    public partial class personhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CallContext caller = AppDataSource.GetCallContext();
            this.UserName = caller.UserName;
            this.Md0 = DateTime.Now.Year.ToString();
            this.Md1 = (DateTime.Now.Month - 1).ToString();
            this.Md3 = DateTime.Now.DayOfYear.ToString();
            this.TimeNow = DateTime.Now.ToString("yyyy-MM-dd tthh:mm");
        }
        //星期一 2014年9月15日
        public string TodayDisplay
        {
            get
            {
                //CultureInfo ci = CultureInfo.CurrentCulture;
                //ci.
                string cDateName = DateUtil2.GetWeekNameOfDate(DateTime.Now.DayOfWeek) + "," + DateTime.Now.ToString("yyyy年MM月dd日");
                return cDateName;
            }
            // set; 
        }
        public string Md0 { get; set; }
        public string Md1 { get; set; }
        public string Md3 { get; set; }
        public string UserName { get; set; }
        public string TimeNow { get; set; }
    }
}