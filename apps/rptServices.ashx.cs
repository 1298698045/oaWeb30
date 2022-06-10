using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Supermore;
using Supermore.Data;
using Supermore.Reports;
using Youyou;

namespace WebClient.apps
{
    /// <summary>
    /// Summary description for rptServices
    /// </summary>
    public class rptServices : IHttpHandler
    {
        string cmd = "";
        CallContext _caller = null;
        string _json = "";
        int rowsPerPage = 15;
        int pageNumber = 1;
        string id = "";
        string _name = "";
        HttpRequest _request = null;
        public void ProcessRequest(HttpContext context)
        {
            _request = context.Request;
             id=Request["id"];
             cmd = Request["method"];
             cmd = cmd.ToLower();
             _caller = AppDataSource.GetCallContext();
             switch (cmd)
             {
                 #region 报表
                 case ActionMethodNames.ReportHisDailyReportGet:
                     string rptDate = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                     _json = ReportManager.GetHisReportJson(_caller, rptDate);
                     break;
                 case "report.hisdaily.mz.get":
                     _json = GetHisMzReport();
                     break;
                 case "report.hisdaily.zy.get":
                     break;
                 case "report.hisdaily.dept.getlist":
                     _json = GetHisDeptZyReport();
                     break;
                 #endregion
                 default:
                     break;
             }
            context.Response.Write(_json);
        }
        #region hisreport
        string GetHisMzReport()
        {
            string rptDate = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
            string str1 = ReportManager.GetHisReportMzJson(_caller, rptDate);
            return str1;
        }
        string GetHisDeptZyReport()
        {
            string rptDate = "";
            if (string.IsNullOrEmpty(Request["reportDate"]))
                rptDate = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
            string str1 = ReportManager.GetHisReportDeptZyJson(_caller, rptDate);
            return str1;
        }
        #endregion

        public HttpRequest Request
        {
            get { return _request; }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}