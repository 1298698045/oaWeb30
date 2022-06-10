using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework.Templates;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.HR;
using Supermore.Reports;
using OA.Web.UI;


namespace WebClient.apps.wf
{
    public partial class rptPersonStat : System.Web.UI.Page
    {
        private CallContext _caller;
        string strDateMonth = "";
        string break0 = "";//分组
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            break0 = Request["break0"];
            //strDateMonth = Request["yearMonth"];
            //if (string.IsNullOrEmpty(strDateMonth))
            //    strDateMonth = DateTime.Now.ToString("yyyy-MM");
            //AttendanceManager.StatAttendance(_caller, strDateMonth);

            GetRptData();
            //CreateYearMonth();
        }

        public void GetRptData()
        {
            string querySql = @" SELECT   FullName,DeptName,NotStartedWfTasks,NotApproveNews  FROM    UserStatisticBase WHERE OrganizationId='{0}'  ORDER BY NotStartedWfTasks Desc";
            querySql = string.Format(querySql, _caller.CustomerID);
            DataSet ds = DatabaseTool.GetDataSet(_caller.CustomerID, querySql);
            Report report = new Report();
            report.ReportSource = ds;

            //report.Sections.Add(new ReportSection("DeptName", "部门"));

            ReportField rField = null;

            rField = new ReportField("DeptName", "部门");
            report.ReportFields.Add(rField);

            rField = new ReportField("FullName", "姓名");
            report.ReportFields.Add(rField);

            rField = new ReportField("NotStartedWfTasks", "待办事务数");
            report.ReportFields.Add(rField);

            rField = new ReportField("NotApproveNews", "待审信息数");
            report.ReportFields.Add(rField);
            /*
            rField = new ReportField("Absence1", "其中 - 事假");
            report.ReportFields.Add(rField);

            rField = new ReportField("Absence2", "其中 - 病假");
            report.ReportFields.Add(rField);

            rField = new ReportField("Absence3", "其中 - 婚假");
            report.ReportFields.Add(rField);

            rField = new ReportField("Absence4", "其中 - 探亲假");
            report.ReportFields.Add(rField);
            */
            HTMLReportResult = report.GenerateReport();
            //report.ReportFields 
        }
        public string HTMLReportResult { get; set; }
    }
}