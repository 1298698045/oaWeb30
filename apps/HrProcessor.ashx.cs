using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Remoting;
using System.IO;
using System.Data;
using System.Text;

using OA.Web.UI.WebControls;

using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;

using Supermore;
using Supermore.Contents;
using Supermore.Configuration;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.Emails;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.IO;
using Supermore.Files;
using Supermore.Security;
using Supermore.Security.Accounts;
using Supermore.Web.UI.WebControls;
using Supermore.HR;
using Supermore.HR.Attendance;
//using OA.Web.Servlets;



using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Youyou;
using Youyou.HRCore;
using Youyou.HRCore.Performance;
using Youyou.HRCore.Attendance;
using Youyou.HRCore.Employees;
using Youyou.HRCore.Actions;
using Youyou.HRCore.Salary;

using Supermore.Mobile;

namespace WebClient.apps
{
    /// <summary>
    /// Summary description for HrProcessor
    /// </summary>
    public class HrProcessor : IHttpHandler
    {
        HttpContext _context = null;
        CallContext _caller = null;
        string id = "";
        string result = "";
        string retURL = "";
        public void ProcessRequest(HttpContext context)
        {
             _context = context;
            //string docId= context.Request["docid"];
            id = context.Request["id"];
            string commandName = context.Request["cmd"];
            _caller = AppDataSource.GetCallContext();
            //string[] arrs = null;
            retURL = context.Request["retURL"];
            //string desc = "";
            DataSet ds = null;
            switch (commandName.ToLower())
            {
                case "entity.getlist":
                    EntityGetList();
                    break;

                #region emp
                case "employee.basic.get"://基本信息
                    EmployeeManager mgr = new EmployeeManager();
                    ds = mgr.GetEmployee(_caller, new Guid(id));
                    result = DataUtil.ToJsonFromDS(ds);
                    break;
                case "edit.self.open":
                    EmployeeManager.OpenSelfEdit(_caller, id);
                    break;
                case "edit.self.close":
                    EmployeeManager.CloseSelfEdit(_caller, id);
                    break;
                case "emp.profile.approve":
                    int approveStatus = MainUtil.GetInt(context.Request["approveStatus"],0);
                    EmployeeManager.ApproveProfile(_caller, id, approveStatus);
                    break;
                //case "emp.simple.search": //列表少数自己个字段
                //    HREmpSimpleSearch empSimpleSearch = new HREmpSimpleSearch();
                //    //empSimpleSearch.c
                //    empSimpleSearch.Caller = _caller;
                //    empSimpleSearch.Execute(this._context);
                //    result = empSimpleSearch.ResponseJson;
                //    break;
                case "empaction": //离职,退休
                    result = EmpAction();
                    break;
                case "searchemps": //查询员工
                    result = SearchEmps();
                    break;
                case "employee.relation.search":
                    result = EmployeeRelationSearch();
                    break;
                case "sortemp"://排序
                    int sortNum = MainUtil.GetInt(_context.Request["seq"], 0);
                    EmployeeManager.SortEmp(_caller, new Guid(id), sortNum);
                    break;
                case "export.emp.attendshift":
                    ExportEmpShift();
                    break;
                #endregion
                    
                case "checkin"://签到
                    //result = CheckIn();
                    result = PreCheckIn();
                    break;
                case "precheckin"://检测签到
                    result = PreCheckIn();
                    break;
                case "checkout"://签退
                    result = CheckOut();
                    break;
                case "getentity"://获取我的薪资
                    result = GetEntity();
                    break;
                case "attend.period.init": //考勤期间初始化
                    InitAttendYear();
                    break;

               

                #region 考评
                //case "evaluation.object.getlist"://获取考评对象
                //    EvaluationObjectGetlist evaluationObjectGetlist = new EvaluationObjectGetlist();
                //    evaluationObjectGetlist.SessionKey = _caller.UserID;
                //    evaluationObjectGetlist.Caller = _caller;
                //    evaluationObjectGetlist.Execute(this._context);
                //    result = evaluationObjectGetlist.ResponseJson;
                //    break;
                //case "evaluation.evaluator.assign"://给考评对象 分配 评价人
                //    EvaluationEvaluatorAssign evaluationEvaluatorAssign = new EvaluationEvaluatorAssign();
                //    evaluationEvaluatorAssign.SessionKey = _caller.UserID;
                //    evaluationEvaluatorAssign.Caller = _caller;
                //    evaluationEvaluatorAssign.Execute(this._context);
                //    result = evaluationEvaluatorAssign.ResponseJson;
                //    break;
                #endregion

                #region 假期
                case "calculateleave": //计算请假天数，计算请假截止日期
                    string leavetype = context.Request["leavetype"];
                    string strleavedays = context.Request["leavedays"];
                    string startTime = context.Request["startTime"];
                    DateTime dt1 = DateUtil2.ParseDateTime(startTime, DateTime.MinValue);
                    if (!string.IsNullOrEmpty(strleavedays))
                    {
                        double leaveDays = MainUtil2.GetDouble(strleavedays);
                        DateTime endTime = AttendanceUtil.CalculateLeaveDays(_caller, leavetype, dt1, leaveDays);
                        result = string.Format("{{\"startTime\":\"{0}\",\"endDay\":\"{1}\",\"endTime\":\"{2}\",\"leaveDays\":\"{3}\"}}", startTime, endTime.ToString("yyyy-MM-dd"), "18:00", leaveDays);
                    }
                    string strEndTime = context.Request["endTime"];
                    if (!string.IsNullOrEmpty(strEndTime))
                    {
                        //double leavedays = MainUtil2.GetDouble(strleavedays);
                        DateTime dt2 = DateUtil2.ParseDateTime(strEndTime, DateTime.MinValue);
                        double leaveDays = AttendanceUtil.CalculateLeaveDays(_caller, leavetype, dt1, dt2);
                        result = string.Format("{{\"startTime\":\"{0}\",\"endTime\":\"{1}\",\"leaveDays\":\"{2}\"}}", startTime, dt2.ToString("yyyy-MM-dd HH:mm:ss"), leaveDays);
                    }
                    break;
                #endregion

                #region 排班操作
                case "hrshifthoverpage":
                    result = LoadHRShiftHoverPage();
                    break;
                case "removeemployeeshift"://删除排班某一个
                    EmpWorkshiftManager workShiftManager = new EmpWorkshiftManager();
                    workShiftManager.RemoveEmployeeShift(_caller, id);
                    result = "{\"status\":1}";
                    break;
                case "uirefreshempdayshifts": //刷新某一天排班
                    result = UIRefreshEmpDayShifts();
                    break;
                case "saveempshiftinfo": //保存周排班其他信息
                    SaveEmpShiftInfo();
                    break;
                case "savedeptshiftinfo"://保存部门排班其他信息
                    SaveDeptShiftInfo();
                    break;
                case "attend.monthshift.emp.save": //保存月排班其他信息
                    SaveMonthEmpShifts();
                    break;
                case "attend.monthshift.dept.save":
                    SaveDeptMonthShifts();
                    break;
                case "upateempshift"://修改排班
                    UpdateEmpShift();
                    break;
                case "setemployeeshift": //设置员工排班
                    result = SetEmployeeShift();
                    break;
                case "delemployeeshift": //删除员工排班
                    result = DeleteEmployeeShift();
                    break; 
                case "clearempshifts": //清除排班
                    ClearDeptEmployeeShifts();
                    break;
                case "clearempweekshifts"://清除排班信息
                    ClearDeptEmployeeShifts();
                    break;

                //case "rptempworkshifts"://护理排班统计查询
                //    RptEmpWorkShifts rptShifts = new RptEmpWorkShifts();
                //    rptShifts.Caller = this._caller;
                //    rptShifts.Execute(this._context);
                //    result = rptShifts.ResponseJson;
                //    break;

                case "hr.attendgroups.getlist"://获取考勤组
                    result = GeAttendGroups();
                    break;
                case "attend.dutyshift.set": //设置值班
                    SetDutyShift();
                    break;
                case "attend.dutyshift.delete": //设置值班
                    DeleteDutyShift();
                    break;

                case "attendshift.export.excel": //排班到处
                   // ExportEmpShift();
                    break;
                #endregion

                #region 排班
                case "fcworkshifts":
                    result = FcCompleteSearchWorkShifts();
                    break;
                case "workshift.businessunit.getlist"://获取我的班次
                    result = GetBusinessUnitWorkShifts();
                    break;
                case "workshift.group.employees.getlist"://组下的所有排班数据
                    result = GetGroupEmployeeShifts();
                    break;
                case "workshift.designer.init":
                    result =UIInitWorkShiftDesinger();
                    break;
                case "workshift.designer.save": //保存排班备注
                    result = SaveWorkShiftDesinger();
                    break;
                case "workshift.designer.clear":
                    result = ClearWorkShiftDesinger();
                    break;
                #endregion

                #region 排班 按组
               
                case "hr.workshift.monthemp.delete": //月排班删除人员
                    result = DeleteEmpMonthWorkshift();
                    break;
                case "hr.workshift.monthemp.add": //月排班添加人员
                    result = TransferInEmpMonthWorkshift();
                    break;
                #endregion

                #region salary dinner  餐费上报
                case "statdinner":
                    StatDinner();
                    break;
                case "mysalaryservlet"://获取我的薪资
                    result = GetMySalary();
                    break;
                case "salary.dinnersend.get": //获取餐费发放状态
                    result = GetDinnerSend();
                    break;
               
                case "salary.dept.getlist": //获取部门薪资
                    result = GetDeptsSalaryDinner();
                    break;
                case "salary.dept.employees.getlist": //获取部门的所有员工
                    result = GetDeptEmpsSalaryDinner();
                    break;
                case "salary.dept.batchupdate"://批量更新部门薪资
                    result = BatchUpdateSalaryDinner();
                    break;
                case "salary.dept.employee.batchupdate"://批量更新部门薪资
                    result = BatchUpdateEmployeeSalaryDinner();
                    break;
                case "salary.deptreport.reset": // 设置重填状态
                    SalaryDeptReportReset();
                    break;
                case "salary.deptdinner.copy": //复制餐费部门人员
                    result = CopyDeptDinner();
                    break;
                case "salary.dinner.employee.add": // 添加餐费上报人员
                    result = AddEmployeeToDinner();
                    break;
                case "salary.dinner.employee.delete": // 添加餐费上报人员
                    result = DeleteEmployeeToDinner();
                    break;
                
                case "salary.dinnerdept.get": //获取部门餐费提交状态
                    result = GetDinnerDeptSend();
                    break;
                case "salary.empdinnerfeeitems.getlist"://夜班餐费 每个员工的详细
                    result = GetEmployeeDinnerfeeItems();
                    break;
                case "salary.employeedinnerfee.add": //夜班餐费项目详细
                    SaveEmployeeDinnerfee();
                    break;
                case "salary.employeedinnerfee.delete":
                    ClearEmployeeDinnerfee();
                    break;
                #endregion

                case "employee.salarylevel.get"://获取职员的标准工资
                    result = GetMealCardSend();
                    break;

                #region 工资账套
                case "salary.mealcard.getlist"://饭卡
                    result = GetMealCardSend();
                    break;
                case "salary.mealallowance.getlist"://伙食补贴
                    result = GetMealCardSend();
                    break;
                #endregion


                #region 工资账套设置
                case "salary.accountfield.updateformula": //更新工资字段公式
                    SetFormulaText();
                    break;
                #endregion


                #region
                case "evaluation.audience.empty": //清空评价人
                    new EvaluationManager().EmptyEvaluationAudience(_caller,new Guid(id));
                    _context.Response.Redirect(retURL);
                    break;
                case "evaluation.object.empty":
                    new EvaluationManager().EmptyEvaluationObject(_caller, new Guid(id));
                    _context.Response.Redirect(retURL);
                    break;                   
                #endregion

                case "getdepartmentemployees": //获取部门用户
                   result = GetDebpartmentEmployees();//
                    break;

                #region 员工考勤上报
                case "attend.employee.workstatus": //报考勤
                    result = ReportEmployeeDayAttend();
                    break;

                #endregion

                #region 考勤
                case "hr.attend.monthshift.submit"://排班提交
                    result = SubmitDeptWorkshift();
                    break;
                case "hr.attend.monthemp.add":
                    AddEmpMonthAttendReportor();
                    break;
                case "hr.attend.monthemp.delete"://删除某人上报考勤
                     DeleteEmpMonthAttendReportor();
                    break;
                case "hr.attend.monthreport.submit": //月考勤报表提交
                    result = SubmitDeptAttend();
                    break;
                case "statmonthattend": //统计月末考勤
                    CalculateAttendStat();
                    break;
                case "hr.attend.monthreport":        //月考勤报表
                   result = QueryAttendMonthReport();
                    break;
                case "notification.attendnotreport.send":
                    result = RemindAttendNotReport1();
                    break;
                #endregion
                #region 
                case "attend.employee.annualleave.calculate": //年假天数
                    AttendanceUtil.CalculateDaysOfAnnualLeave(_caller);
                    break;
                case "attend.employee.annualleaveusedused.calculate": //年假天数
                    AttendanceUtil.CalculateDaysOfAnnualLeaveUsed(_caller);
                    break;
                #endregion

                default:
                    if (this._caller == null)
                    {
                        this._caller = AppDataSource.GetCallContext();
                    }
                    if (this._caller == null)
                    {
                        result = "{\"status\":990,\"msg\":\"caller 获取不到！\"}";
                        context.Response.Write(result);
                        return;
                    }
                    Supermore.WebAPI.WebAPIExecutor executor = new Supermore.WebAPI.WebAPIExecutor(this._context);
                    result = executor.Execute(this._caller, this._caller.UserID); 
                        
                     
                    break;
            }
            context.Response.Write(result);
        }
        void InitAttendYear()
        { 
             int attendYear = MainUtil.GetInt(_context.Request["attendyear"],DateTime.Now.Year);
             AttendanceManager.InitAttendPeriod(_caller, attendYear);
        }
        /// <summary>
        /// 考勤计算
        /// </summary>
        void CalculateAttendStat()
        {
            int attendYear = MainUtil.GetInt(_context.Request["attendyear"], DateTime.Now.Year);
            int attendMonth = MainUtil.GetInt(_context.Request["attendmonth"], DateTime.Now.Month);
            //根据请假单生成考勤日数据
            //AttendanceManager.CalculateRequestLeave(_caller, attendYear, attendMonth);
            //统计
            AttendReportor.StatAttendance(_caller, attendYear, attendMonth);

            //计算公式
            AttendFormulaCalculator calculator = new AttendFormulaCalculator();
            calculator.ExecuteAttendMonthFormula(_caller, attendYear, attendMonth);
        }

        #region 考勤上报
        string ReportEmployeeDayAttend()
        { 
            string employeeId=_context.Request["employeeId"];
            string attendDate=_context.Request["attendDate"];
            string strOldStatus=_context.Request["oldStatus"];
            string strNewStatus=_context.Request["newStatus"];
            string elementId = _context.Request["elementId"];
            string unitId = _context.Request["unitId"];
            string strleaveDays = _context.Request["leaveDays"];
            int objectTypeCode = MainUtil.GetInt(_context.Request["objectTypeCode"],-1);
            int oldStatus = MainUtil.GetInt(strOldStatus,0);
            int newStatus = MainUtil.GetInt(strNewStatus,0);
            double leaveDays = MainUtil.GetDouble(strleaveDays);
            if (leaveDays == 0)
                leaveDays = 1;
            EmployeReportAttendStatus status = EmployeeAttendManager.ReportEmployeeDayAttend(_caller, employeeId, attendDate, oldStatus, newStatus, leaveDays, unitId);
            status.ElementId = elementId;
            string str2 = status.ToJson();
            return str2;
            //if (iRes == 1001) //没有请假单，不能移除
            //{
            //   return string.Format("{{\"status\":true,\"employeeId\":\"{0}\",\"attendDate\":\"{1}\",\"workStatus\":\"{2}\"}}", employeeId, attendDate, strOldStatus);
            //}
            //return string.Format("{{\"status\":true,\"employeeId\":\"{0}\",\"attendDate\":\"{1}\",\"workStatus\":\"{2}\"}}", employeeId, attendDate, newStatus);
        }
        #endregion
        /// <summary>
        /// 导出排班数据
        /// </summary>
        void ExportEmpShift()
        {
            string startDate = _context.Request["startDate"];
            string endDate = _context.Request["endDate"];
            //empName = context.Request["empName"];
            string deptId = _context.Request["deptId"];
           // shiftName = context.Request["shiftName"];
           // shiftType = _context.Request["shiftType"];
           // postId = context.Request["postId"];
            ExportEmpShiftManager exportShift = new ExportEmpShiftManager();
            exportShift.Caller = _caller;
            exportShift.Export(startDate, endDate, deptId);
            DownloadFile(exportShift.ExportFile, exportShift.ExportFileName);
        }

        #region 按部门排班，往部门调入、出排班人员
        string TransferInEmpMonthWorkshift()
        {
            string strEmpIds = _context.Request["employeeId"];
            string deptId = _context.Request["deptId"];
            string strYear = _context.Request["yearNumber"];
            string strMonth = _context.Request["monthNumber"];
            if (string.IsNullOrEmpty(deptId))
            {
                deptId = _caller.BussinessUnitId.ToString();
            }
            int mNum = MainUtil.GetInt(strMonth, 0);
            int yNum = MainUtil.GetInt(strYear, DateTime.Now.Year);
            EmpWorkshiftManager empAttendMgr = new EmpWorkshiftManager();
            if (!string.IsNullOrEmpty(strEmpIds))
            {
                string[] empIds = strEmpIds.Split(',');
                foreach (string employeeId in empIds)
                {
                    if (!string.IsNullOrEmpty(employeeId))
                        empAttendMgr.AddWorkshiftMonthDeptEmployee(_caller, deptId, new Guid(employeeId), yNum, mNum);
                }
            }

            return string.Format("{{\"status\":1,\"YearNumber\":\"{0}\",\"MonthNumber\":\"{1}\",\"BusinessUnitId\":\"{2}\"}}", strYear, strMonth, deptId);
        }
        /// <summary>
        /// 删除员工一个的考勤上报数据
        /// </summary>
        string DeleteEmpMonthWorkshift()
        {
            string strEmpIds = _context.Request["employeeId"];
            string deptId = _context.Request["deptId"];
            string strYear = _context.Request["yearNumber"];
            string strMonth = _context.Request["monthNumber"];
            int mNum = MainUtil.GetInt(strMonth, 0);
            int yNum = MainUtil.GetInt(strYear, DateTime.Now.Year);
            if (string.IsNullOrEmpty(deptId))
            {
                deptId = _caller.BussinessUnitId.ToString();
            }
            EmpWorkshiftManager empAttendMgr = new EmpWorkshiftManager();
            if (!string.IsNullOrEmpty(strEmpIds))
            {
                string[] empIds = strEmpIds.Split(',');
                foreach (string employeeId in empIds)
                    empAttendMgr.RemoveWorkshiftMonthDeptEmployee(_caller, deptId, new Guid(employeeId), yNum, mNum);
            }
            return string.Format("{{\"status\":1,\"YearNumber\":\"{0}\",\"MonthNumber\":\"{1}\",\"BusinessUnitId\":\"{2}\"}}", strYear, strMonth, deptId);
        }
        #endregion

        #region 考勤上报
        /// <summary>
        /// 添加员工到本部门上报
        /// </summary>
        void AddEmpMonthAttendReportor()
        {
            string strEmpIds = _context.Request["employeeId"];
            string deptId = _context.Request["deptId"];
            string strYear = _context.Request["yearNumber"];
            string strMonth = _context.Request["monthNumber"];
            if (string.IsNullOrEmpty(deptId))
            {
                deptId = _caller.BussinessUnitId.ToString();
            }
            int mNum = MainUtil.GetInt(strMonth, 0);
            int yNum = MainUtil.GetInt(strYear, DateTime.Now.Year);
            EmployeeAttendManager empAttendMgr = new EmployeeAttendManager();
            if (!string.IsNullOrEmpty(strEmpIds))
            {
                string[] empIds = strEmpIds.Split(',');
                foreach (string employeeId in empIds)
                {
                    if (!string.IsNullOrEmpty(employeeId))
                        empAttendMgr.AddEmployeeAttenanceData(_caller, deptId, new Guid(employeeId), yNum, mNum);
                }
            }
            result = "{\"status\":1}";
        }
        /// <summary>
        /// 删除员工一个月的考勤上报数据
        /// </summary>
        void DeleteEmpMonthAttendReportor()
        {
            string strEmpIds = _context.Request["employeeId"];
            string deptId = _context.Request["deptId"];
            string strYear = _context.Request["yearNumber"];
            string strMonth = _context.Request["monthNumber"];
            int mNum = MainUtil.GetInt(strMonth, 0);
            int yNum = MainUtil.GetInt(strYear, DateTime.Now.Year);
            if (string.IsNullOrEmpty(deptId))
            {
                deptId = _caller.BussinessUnitId.ToString();
            }
            EmployeeAttendManager empAttendMgr = new EmployeeAttendManager();
            if (!string.IsNullOrEmpty(strEmpIds))
            {
                string[] empIds = strEmpIds.Split(',');
                foreach (string employeeId in empIds)
                {
                    if (string.IsNullOrEmpty(employeeId)) continue;
                    empAttendMgr.DeleteEmployeeAttenanceData(_caller, deptId, new Guid(employeeId), yNum, mNum);
                }
            }
            result = "{\"status\":1}";
        }
        /// <summary>
        /// 月考勤报表
        /// </summary>
        string QueryAttendMonthReport()
        {
            int year = DateTime.Now.Year;
            int startMonth = DateTime.Now.Month;
            int endMonth = startMonth;// DateTime.Now.Month;
            string deptId = "";
            string stat = _context.Request["statreport"];
            bool statreport = MainUtil.GetBool(stat,false);
            string isFullAttend = _context.Request["isFullAttend"];
            if (_context.Request["parent_lkid"] != null)
            {
                deptId = _context.Request["parent_lkid"];
            }
            if (_context.Request["AttendYear"] != null)
            {
                year = MainUtil.GetInt(_context.Request["AttendYear"], DateTime.Now.Year);
            }
            if (_context.Request["startMonth"] != null)
            {
                startMonth = MainUtil.GetInt(_context.Request["startMonth"], DateTime.Now.Month);
            }
            if (_context.Request["endMonth"] != null)
            {
                endMonth = MainUtil.GetInt(_context.Request["endMonth"], DateTime.Now.Month);
            }
            if (_context.Request["isFullAttend"] != null)
            {
                isFullAttend = _context.Request["isFullAttend"];
            }
            AttendMonthReportRender attendMonthReportRender = new AttendMonthReportRender();
            attendMonthReportRender.Caller = _caller;
            attendMonthReportRender.Render(year, startMonth, endMonth, deptId, statreport, isFullAttend);
            return attendMonthReportRender.ResultHTML;
            //this.ResultHTML = attendMonthReportRender.ResultHTML;
        }
        /// <summary>
        /// 提交部门考勤上报
        /// </summary>
        /// <returns></returns>
        string SubmitDeptAttend()
        {
            int attendYear = 0;
            int attendMonth = 0;
            string description = Request["description"];
            description = HttpUtility.UrlDecode(description);
            string leaveMessage = StringUtil.GetString(Request["LeaveMessage"]);
            int status = MainUtil.GetInt(Request["status"], 1);
            if (_context.Request["AttendYear"] != null)
            {
                attendYear = MainUtil.GetInt(_context.Request["AttendYear"], DateTime.Now.Year);
            }
            if (_context.Request["attendMonth"] != null)
            {
                attendMonth = MainUtil.GetInt(_context.Request["AttendMonth"], DateTime.Now.Month);
            }
            EmployeeAttendManager.SubmitDeptAttend(_caller, _caller.BussinessUnitId.ToString(), attendYear, attendMonth, status, description, leaveMessage);
            //EmployeeAttendManager.SubmitDeptMonthAttendance(_caller, unitId, attendYear, attendMonth, status, "");
            return string.Format("{{\"status\":true,\"attendYear\":\"{0}\",\"attendMonth\":\"{1}\",\"deptId\":\"{2}\"}}", attendYear, attendMonth, _caller.BussinessUnitId);
        }
        /// <summary>
        /// 提交部门排班上报
        /// </summary>
        /// <returns></returns>
        string SubmitDeptWorkshift()
        {
            int attendYear = 0;
            int attendMonth = 0;
            int status = MainUtil.GetInt(_context.Request["status"],0);
            string unitId = _context.Request["unitId"];
            if (_context.Request["AttendYear"] != null)
            {
                attendYear = MainUtil.GetInt(_context.Request["AttendYear"], DateTime.Now.Year);
            }
            if (_context.Request["attendMonth"] != null)
            {
                attendMonth = MainUtil.GetInt(_context.Request["AttendMonth"], DateTime.Now.Month);
            }
            unitId = _caller.BussinessUnitId.ToString();
            //WorkShiftManager mgr = new WorkShiftManager();
            EmpWorkshiftManager.SubmitDeptMonthShift(_caller, _caller.BussinessUnitId.ToString(), attendYear, attendMonth, status);
            
            return string.Format("{{\"status\":true,\"attendYear\":\"{0}\",\"attendMonth\":\"{1}\",\"deptId\":\"{2}\"}}", attendYear, attendMonth, _caller.BussinessUnitId);
        }
        /// <summary>
        /// 提醒未上报考勤人员
        /// </summary>
        string RemindAttendNotReport1()
        {
             int attendYear=0;
            int attendMonth=0;
            if (_context.Request["yearNumber"] != null)
            {
                attendYear = MainUtil.GetInt(_context.Request["yearNumber"], DateTime.Now.Year);
            }
            if (_context.Request["monthNumber"] != null)
            {
                attendMonth = MainUtil.GetInt(_context.Request["monthNumber"], DateTime.Now.Month);
            }
            RemindReportAttend reminder = new RemindReportAttend();
            reminder.Remind(this._caller, attendYear, attendMonth);

            return string.Format("{{\"status\":true,\"attendYear\":\"{0}\",\"attendMonth\":\"{1}\"}}", attendYear, attendMonth);
        }
        
        #endregion

        private byte[] buffer = new byte[1024];
        private int length = 0;
        private void DownloadFile(string file, string fileName)
        {
            string mineType = "application/octet-stream";
            this._context.Response.Clear();
            this._context.Response.ContentType = mineType;

            string fName = HttpUtility.UrlEncode(fileName, System.Text.UTF8Encoding.UTF8);
            string dowloadFile = "";
            dowloadFile = fName + ".csv";
            //add header
            this._context.Response.AddHeader("Content-Disposition", "attachment;filename=" + dowloadFile);
            //download
            try
            {
                if (File.Exists(file))
                {
                    using (FileStream fs = new FileStream(file, FileMode.Open))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            this._context.Response.OutputStream.Write(buffer, 0, length);
                            this._context.Response.Flush();
                        }
                    }
                }
                else
                {
                    this._context.Response.Write("文件不存在");
                }
            }
            catch (Exception ex)
            {
                this._context.Response.Write(ex.Message);

                Supermore.Diagnostics.Trace.LogException(ex);
            }

            this._context.Response.End();
        }
        string _json = "";

        /// <summary>
        /// 搜索用户
        /// </summary>
        string SearchEmps()
        {

            //string strSql="SELECT * FROM SystemUserBase ";
            QueryExpression extraQueryExpression = new QueryExpression();
            extraQueryExpression.IsPaged = false;
            //extraQueryExpression.PageInfo.PageSize = rowsPerPage;
            // extraQueryExpression.PageInfo.PageNumber = pageNumber;
            string srch = HttpUtility.UrlDecode(this._context.Request["search"]);
            /*
            if (!string.IsNullOrEmpty(srch))
            {
                //ConditionOperator condOperator = ConditionOperator.Contains;
                //extraQueryExpression.Criteria.AddCondition("FullName", condOperator, srch);
                ConditionExpression cond = new ConditionExpression();
                cond.AttributeName = "FullName";
                cond.Operator = ConditionOperator.Contains;
                cond.Values = new object[] { srch };
                cond.LogicalOperator = LogicalOperator.Or;
                extraQueryExpression.Criteria.Add(cond);

                cond = new ConditionExpression();
                cond.AttributeName = "EmployeeNo";
                cond.Operator = ConditionOperator.Contains;
                cond.Values = new object[] { srch };
                cond.LogicalOperator = LogicalOperator.Or;
                extraQueryExpression.Criteria.Add(cond);

                cond = new ConditionExpression();
                cond.AttributeName = "LoginName";
                cond.Operator = ConditionOperator.Contains;
                cond.Values = new object[] { srch };
                cond.LogicalOperator = LogicalOperator.Or;
                extraQueryExpression.Criteria.Add(cond);

                //And IsDisabled=0

            }
            extraQueryExpression.AddOrder("FullName", OrderType.Ascending);
            */
            string sql = "SELECT EmployeeId,EmployeeNo,FullName,DeptId,DeptIdName From HREmployee Where StateCode<=1 ";
            if (!string.IsNullOrEmpty(srch))
            {
                //
                string temp = string.Format(" AND (FullName like '%{0}%' OR EmployeeNo like '%{0}%' OR LoginName like '%{0}%')", srch);
                sql += temp;
            }


            _json = "[";
            //EntityCollection entities = EntityManager.GetEntities(this._caller, ObjectTypeCodes.HREmployee, extraQueryExpression);
            DataSet ds = AppDataSource.GetDataSet(this._caller, sql);
            int i = 0;
            //foreach (Entity a in entities)
            foreach(DataRow dr in ds.Tables[0].Rows)
            {
                //Employee emp = new Employee(a);
                //if (systemUser.IsDisabled)
                //    continue;
                if (i > 0)
                    _json += ",";
                string fullName = string.Format("{0} / {1}", StringUtil.GetString(dr["FullName"]), StringUtil.GetString(dr["DeptIdName"]));// emp.FullName;
                //_json += string.Format("{{\"type\":\"B\",\"name\":\"{0} 【{2}】\", \"id\":\"{1}\"}}", fullName, emp.ID, emp.EmployeeNo);

                _json += string.Format("{{\"type\":\"B\",\"name\":\"{0} 【{2}】\", \"id\":\"{1}\"}}", fullName, StringUtil.GetString(dr["EmployeeId"]), StringUtil.GetString(dr["EmployeeNo"]));
                i++;
            }
            _json += "]";
            return _json;
        }
        /// <summary>
        /// 活动事件邀请人搜索 srtp=005&go=1&srch=
        /// </summary>
        /// <returns></returns>
        string EmployeeRelationSearch()
        {
            /*
            go	=1
            srch=
            srtp=005
             */
            /*
             while(1);
{"reachMaxRows":"0","contacts":[{"owner":"","name":"liu jack","company":"","id":"0059000000390Wh"},{"owner"
:"","name":"liu lan","company":"","id":"005900000039oIN"},{"owner":"","name":"璞","company":"","id":"00590000003y68m"
}]}
             */
           
            string srtp = this._context.Request["srtp"];//搜索类型(all,myunit(本部门),005(用户),00Q(潜在客户),003(联系人),023(资源),a0V(人员)
            string srch = this._context.Request["srch"];
            string querySql = @"SELECT e.FullName,EmployeeId,e.EmployeeNo,b.Name As BusinessUnitIdName FROM HREmployeeBase e LEFT Join BusinessUnitBase b ON e.DeptId = b.BusinessUnitId  
                                    Where e.FullName like '%{0}%' OR e.EmployeeNo like '%{0}%' OR b.Name like '%{0}%'  ORDER BY e.FullName";
            querySql = string.Format(querySql, srch);

            string _json = "{\"reachMaxRows\":\"0\",\"contacts\":[";
            DataSet ds = AppDataSource.GetDataSet(_caller, querySql, null);
            int i = 0;
            foreach (DataRow a in ds.Tables[0].Rows)
            {
               
                if (i > 0)
                    _json += ",";
                string fullName = StringUtil.GetString(a["FullName"]);
                string empId = StringUtil.GetString(a["EmployeeId"]);
                string employeeNo = StringUtil.GetString(a["EmployeeNo"]);
                string businessUnitIdName = StringUtil.GetString(a["BusinessUnitIdName"]);

                _json += string.Format("{{\"owner\":\"\",\"name\":\"{1}({2})\",\"company\":\"{3}\", \"id\":\"{0}\"}}", empId, fullName, employeeNo, businessUnitIdName);
                //{"owner":"","name":"liu jack","company":"","id":"0059000000390Wh"}
                i++;
            }
            _json += "]}";
            _json = "while(1);\n" + _json;
            return _json;
        }

        #region 值班
        void SetDutyShift()
        {
            /*/apps/HrProcessor.ashx?cmd=attend.dutyshift.set&date=2017-11-17&userid=91ea5109-89ea-4fb9-b389-f46aea5e6293&categoryid=E0F78DD2-B846-4FD1-A6C6-24C01CB268FF&name=%E5%BE%90%E5%B9%B3
            /apps/HrProcessor.ashx?cmd=attend.dutyshift.set&date=2017-11-17&userid=f475c692-aa3f-471a-8ce6-6c0cc5181e64&shifttype=1&categoryid=E0F78DD2-B846-4FD1-A6C6-24C01CB268FF&name=%E7%8E%8B%E8%8F%8A%E8%90%8D
             */
            string categoryId = this._context.Request["categoryid"];
            int type = MainUtil.GetInt(this._context.Request["shifttype"], 1);
            DutyshiftManager.SaveEmpDutyShift(_caller, this._context.Request["userid"], this._context.Request["date"], categoryId, type);
        }
        void DeleteDutyShift()
        {
            //DutyshiftManager.SaveEmpDutyShift(_caller, this._context.Request["userid"], this._context.Request["date"]);
            DutyshiftManager.DeleteEmpDutyShift(_caller, this._context.Request["userid"], this._context.Request["date"]);
        }
        void ClearDutyShift()
        {
            //DutyshiftManager.SaveEmpDutyShift(_caller, this._context.Request["userid"], this._context.Request["date"]);
        }
        #endregion
        string FcCompleteSearchWorkShifts()
        {
            string tag = _context.Request["tag"];
            string sql = "SELECT * FROM HRAttendWorkShiftBase Where (Name like '%{0}%'  ) ORDER BY Name";
            sql = string.Format(sql, tag);
            //sql = string.Format(sql, addressTypeCode);
            DataSet ds = DatabaseTool.GetDataSet(_caller.CustomerID, sql);
            string json = "[";
            int i = 0;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (i > 0)
                    json += ",";
                //{"key": "hello world", "value": "hello world"},
                string id = StringUtil.GetString(dr["WorkShiftId"]);
               // string userName = StringUtil.GetString(dr["UserName"]);
                string name = StringUtil.GetString(dr["Name"]);
                //string deptName = StringUtil.GetString(dr["DeptName"]);
                string startTime1 = StringUtil.GetString(dr["StartTime1"]);
                string endTime1 = StringUtil.GetString(dr["EndTime1"]);
                
                //fullName = "apples";
                //json += string.Format("{{\"key\":\"{0}\",\"value\":\"{1}\"}}", fullName, fullName);
                json += string.Format("{{\"key\":\"{0}\",\"value\":\"{1}\"}}", id, string.Format("{0}【{1}-{2}】", name, startTime1, endTime1));
                //{"key": "hello world", "value": "hello world"}
                i++;
            }
            json += "]";
            //Response(json);
            return json;
        }

        string EmpAction()
        {
            string id = _context.Request["id"];
            string empaction = _context.Request["action"];
            string date = _context.Request["date"];
            string desc = _context.Request["description"];
            string SubReasonCode = _context.Request["SubReasonCode"];
            EmployeeManager empManager = new EmployeeManager();
            int iRes = 0;
            if (empaction == "3")
            {
                iRes = empManager.Dismiss(_caller, new Guid(id), date, desc, SubReasonCode);
            }
            if (empaction == "4")
            {
                iRes = empManager.Retire(_caller, new Guid(id), date, SubReasonCode, desc);
            }
            if (iRes > 0)
            {
                return string.Format("{{\"status\":true,\"id\":\"{0}\",\"msg\":\"{1}\"}}", id, "");
            }
            return string.Format("{{\"status\":false,\"id\":\"{0}\",\"msg\":\"{1}\"}}", id, "处理失败");
        }

        #region 排班
        /// <summary>
        /// 设置排班
        /// </summary>
        /// <returns></returns>
        string SetEmployeeShift()
        {
            string day = _context.Request["day"];
            string empId = _context.Request["empid"];
            string shiftId = _context.Request["shiftId"];
            string description = _context.Request["description"];
            string unitId = _context.Request["unitId"];
            string objectCode = _context.Request["objectTypeCode"];
            string deptId = _context.Request["deptId"];
            int objectTypeCode = MainUtil.GetInt(objectCode, 10);
            EmpWorkshiftManager workShiftManager = new EmpWorkshiftManager();

            int iRes = workShiftManager.ArrangeEmployeeShift(_caller, day, new Guid(shiftId), empId, description, objectTypeCode, unitId, deptId);

            return string.Format("{{\"status\":true,\"empid\":\"{0}\",\"day\":\"{1}\"}}", empId, day);
        }
        /// <summary>
        /// 从单元格中删除排班
        /// </summary>
        /// <returns></returns>
        string DeleteEmployeeShift()
        {

            string id = _context.Request["id"];
            EmpWorkshiftManager workShiftManager = new EmpWorkshiftManager();
            int iRes = workShiftManager.RemoveEmployeeShift(_caller, id);

            //return string.Empty;
            return string.Format("{{\"status\":true,\"empId\":\"{0}\",\"day\":\"{1}\"}}", "","");
        }
        /// <summary>
        /// 保存周排班，保存排序，备注等信息
        /// </summary>
        void SaveEmpShiftInfo()
        {
            //保存排班信息
            string employeeId = _context.Request["EmployeeId"];
            string workDay = _context.Request["WorkDay"];

            string description = _context.Request["description"];
            string student = _context.Request["student"];
            string memo = _context.Request["Memo"];
            string strYearNum = _context.Request["YearNum"];
            string strWeekNum = _context.Request["WeekNum"];

            string startDate = _context.Request["startDate"];
            string endDate = _context.Request["endDate"];

            string strSortNumber = _context.Request["sortNumber"];
            int yearNum = MainUtil.GetInt(strYearNum, DateTime.Now.Year);
            int weekNum = MainUtil.GetInt(strWeekNum, 0);
            int sortNumber = MainUtil.GetInt(strSortNumber, 0);
            WorkShiftManager workShiftManager = new WorkShiftManager();
            //if (employeeId.ToUpper() == "36224A54-2065-4DD8-9C00-A919770BC412" || employeeId.ToUpper() == "E169F231-A3D3-42B9-9198-D17A36FADBC2")
            //{
            //    Console.Write(employeeId);
            //}
            workShiftManager.SaveEmpShiftInfo(_caller, employeeId, yearNum, weekNum, startDate, endDate, description, memo, student, sortNumber);
        }
        /// <summary>
        /// 保存部门排班信息
        /// </summary>
        void SaveDeptShiftInfo()
        {
            int yearNum = MainUtil.GetInt(_context.Request["YearNum"], 0);
            int weekNum = MainUtil.GetInt(_context.Request["WeekNum"], 0);
            string endDate = _context.Request["endDate"];
            string startDate = _context.Request["startDate"];
            string description = HttpUtility.UrlDecode(_context.Request["description"]);
            string updateMemo = HttpUtility.UrlDecode(_context.Request["updateMemo"]);
            string nurseMessage = HttpUtility.UrlDecode(_context.Request["nurseMessage"]);
            WorkShiftManager workShiftManager = new WorkShiftManager();
            workShiftManager.SaveDeptShiftInfo(_caller, _caller.BussinessUnitId.ToString(), yearNum, weekNum, startDate, endDate, updateMemo, nurseMessage, description);
        }

        /// <summary>
        /// 保存月排班的顺序
        /// </summary>
        void SaveMonthEmpShifts()
        {
            //保存排班信息
            string employeeId = _context.Request["EmployeeId"];
            string description = _context.Request["description"];
            //string student = _context.Request["student"];
            //string memo = _context.Request["Memo"];
            string strYearNum = _context.Request["YearNumber"];
            string strMonthNum = _context.Request["MonthNumber"];
            string startDate = _context.Request["startDate"];
            string endDate = _context.Request["endDate"];
            string strSortNumber = _context.Request["sortNumber"];
            int yearNum = MainUtil.GetInt(strYearNum, DateTime.Now.Year);
            int monthNum = MainUtil.GetInt(strMonthNum, 0);
            int sortNumber = MainUtil.GetInt(strSortNumber, 0);
            WorkShiftManager workShiftManager = new WorkShiftManager();
            workShiftManager.SaveMonthEmpShift(_caller, employeeId, yearNum, monthNum, startDate, endDate, sortNumber, description);
        }
        void SaveDeptMonthShifts()
        {
            //保存排班信息
            // string employeeId = _context.Request["EmployeeId"];
            string description = _context.Request["description"];
            string leaveMessage = _context.Request["leaveMessage"];
            string UpdateMemo = _context.Request["UpdateMemo"];
            string strYearNum = _context.Request["YearNumber"];
            string strMonthNum = _context.Request["MonthNumber"];
            string startDate = _context.Request["startDate"];
            string endDate = _context.Request["endDate"];
            //string strSortNumber = _context.Request["sortNumber"];
            int yearNum = MainUtil.GetInt(strYearNum, DateTime.Now.Year);
            int monthNum = MainUtil.GetInt(strMonthNum, 0);
            //int sortNumber = MainUtil.GetInt(strSortNumber, 0);
            WorkShiftManager workShiftManager = new WorkShiftManager();
            workShiftManager.SubmitDeptMonthShift(_caller, yearNum, monthNum, startDate, endDate, UpdateMemo, leaveMessage, description);
        }
        void UpdateEmpShift()
        {
            string id = _context.Request["id"];
            string fieldName = _context.Request["fieldName"];
            string fieldValue = _context.Request["fieldValue"];
            WorkShiftManager workShiftManager = new WorkShiftManager();
            workShiftManager.UpdateEmpShift(_caller, id, fieldName, fieldValue);
        }
        void ClearDeptEmployeeShifts()
        {
            //清除排班信息
            string deptId = _context.Request["deptId"];
            string startDate = _context.Request["startDate"];
            string endDate = _context.Request["endDate"];
            if (string.IsNullOrEmpty(deptId))
                deptId = _caller.BussinessUnitId.ToString();
            WorkShiftManager workShiftManager = new WorkShiftManager();
            workShiftManager.ClearEmployeeShifts(_caller, deptId, startDate, endDate);
        }
        void ClearGroupEmployeeShifts()
        {
            //清除排班信息
            string groupIds = _context.Request["groupIds"];
            string startDate = _context.Request["startDate"];
            string endDate = _context.Request["endDate"];
            EmpWorkshiftManager workShiftManager = new EmpWorkshiftManager();
            workShiftManager.ClearGroupEmployeeWorkshifts(_caller,groupIds, startDate, endDate);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        string ClearWorkShiftDesinger()
        {
            string startDate = this._context.Request["startDate"];
            string endDate = this._context.Request["endDate"];
            string groupIds = this._context.Request["groupIds"];
            EmpWorkshiftManager empShiftMgr = new EmpWorkshiftManager();
            empShiftMgr.ClearGroupEmployeeWorkshifts(_caller, groupIds, startDate, endDate);
            return "{\"status\":1}";
        }
        /// <summary>
        /// 刷新排班日程 上 某一个职员 某一天的排班
        /// </summary>
        /// <returns></returns>
        string UIRefreshEmpDayShifts()
        {
            WorkShiftManager workShiftManager = new WorkShiftManager();
            Dictionary<Guid, AttendanceWorkShift> _cacheWorkShifts = new Dictionary<Guid, AttendanceWorkShift>();
            //List<AttendanceEmployeeWorkShift> _workShifts = new List<AttendanceEmployeeWorkShift>();
            List<AttendanceWorkShift> workShifts = workShiftManager.GetMyUnitWorkShifts(_caller);
            foreach (AttendanceWorkShift workShift in workShifts)
            {
                _cacheWorkShifts.Add(workShift.ID, workShift);
            }

            string strEmpId = _context.Request["empid"];
            string workDay = _context.Request["day"];

            List<AttendanceEmployeeWorkShift> shifts = workShiftManager.GetEmployeeDailyWorkShift(_caller, new Guid(strEmpId), workDay);
            //string uniteId = shifts[0].ID.ToString().Replace("-", "").ToUpper();
            //_workShifts.Add(shifts[0]);
            string str2 = "";
           
            foreach (AttendanceEmployeeWorkShift shift in shifts)
            {
                AttendanceWorkShift attendWorkShift = null;
                if (_cacheWorkShifts.ContainsKey(shift.WorkShiftId))
                {
                    attendWorkShift = _cacheWorkShifts[shift.WorkShiftId];
                    //eventBusy
                    //if (isWeekend)
                    //{
                    //str2 += string.Format("<a onclick=\"delEmpShift('{0}','c_{1}_{2}')\"><img src='/img/dismiss.gif' border='0' style=\"display:inline-block;cursor:pointer;\" /></a>", shift.ID, empId, d1);
                    string title = string.Format("{0}[{1}-{2}]/{3}", attendWorkShift.Name, attendWorkShift.StartTime1, attendWorkShift.EndTime1, shift.Description);
                    str2 += string.Format("<div onclick=\"delEmpShift('{0}','c_{1}_{2}')\" ", shift.ID, strEmpId, workDay);
                    str2 += string.Format(" class=\"\" style='white-space:nowrap;word-break:keep-all;display:block;text-align:center;height:25px;'><a  class=\"inner\" title='{1}' style=\"display:inline-block;vertical-align:middle;cursor:pointer;text-align:center;margin:0px;padding:0px;height:100%; {2}\">{0} <label style='font-weight:bold;'>{3}</label></a> ",
                        attendWorkShift.Name, title, attendWorkShift.Color, shift.Description);
                    str2 += "</div>";
                    //}
                    //else
                    //{
                    //    str2 += string.Format("<div class=\"\" style='white-space:nowrap;word-break:keep-all;display:inline;text-align:center;height:25px;'><a  class=\"inner\" title='{0} {1}-{2}' href='#' style=\"display:inline-block;cursor:pointer;width:90%;font-size:12px; {3}\">{0}</a> ", attendWorkShift.Name, attendWorkShift.StartTime1, attendWorkShift.EndTime1, attendWorkShift.Color);
                    //    str2 += "</div>";
                    //}
                    //str2 += string.Format("<a onclick=\"delEmpShift('{0}','c_{1}_{2}')\"><img src='/img/dismiss.gif' border='0' style=\"display:inline-block;cursor:pointer;\" /></a></div>", shift.ID, strEmpId, workDay);
                }
                else str2 += string.Format("<div class=\"\" title=\"{0}\" style='white-space:nowrap;word-break:keep-all;display:inline;text-align:center;height:25px;'>{0}</div>", shift.Description, shift.ID, strEmpId, workDay);
                //<a onclick=\"delEmpShift('{1}','c_{2}_{3}')\" ><img src='/img/dismiss.gif' border='0' style=\"display:inline-block;cursor:pointer;\"/></a>
                //str2 +="<div onmouseover=\"ActivityHover.getHover('EventHoverPage_00U90000018I1pg').showHover(event, '/ui/core/activity/EventHoverPage?retURL=%2F00U%2Fc%3FcType%3D1%26md0%3D2016%26md1%3D2&amp;id=00U90000018I1pg&amp;isHvr=1&amp;nocache=1458718120496&amp;%E4%B8%BB%E9%A2%98=%E4%B8%80%E7%97%85%E5%8C%BA&amp;%E6%97%B6%E9%97%B4=%E4%B8%8B%E5%8D%884%3A00+-+%E4%B8%8B%E5%8D%885%3A00&amp;%E6%97%B6%E9%97%B4%E6%98%BE%E7%A4%BA%E4%B8%BA=%E7%B9%81%E5%BF%99&amp;%E5%BC%80%E5%A7%8B=2016-3-24+%E4%B8%8B%E5%8D%884%3A00&amp;%E7%BB%93%E6%9D%9F=2016-3-24+%E4%B8%8B%E5%8D%885%3A00&amp;shBus=true')\" onmouseout=\"ActivityHover.getHover('EventHoverPage_00U90000018I1pg').hideHover()\" onmousemove=\"ActivityHover.getHover('EventHoverPage_00U90000018I1pg').setPosition(event)\"><span class=\"event\">下午4:00 - 下午5:00</span><a href=\"/00U90000018I1pg?retURL=%2F00U%2Fc%3FcType%3D1%26md0%3D2016%26md1%3D2\">一病区</a></div>";
            }
            return str2;
        }
        /// <summary>
        /// 查询排班
        /// </summary>
        /// <returns></returns>
        string UIInitSearchEmployeWorkShifts()
        {
            string startDate = this._context.Request["startDate"];
            string endDate = this._context.Request["endDate"];
            string md2 = this._context.Request["md2"];
            string md1 = this._context.Request["md1"];
            string md0 = this._context.Request["md0"];
            string calendar = this._context.Request["calendar"]; // 1 month 2 week
            StringBuilder sb = new StringBuilder();
            int i = 0;
            sb.Append("{");

            DateTime first = DateTime.Now;
            DateTime last = DateTime.Now;
            int weekNumber = 0;
            int monthNumber = DateTime.Now.Month;
            int year = 0;
            year = MainUtil.GetInt(md0, 0);
            if (year == 0)
                year = DateTime.Now.Year;

            if (calendar == "1") //周排班
            {
                //月
                if (string.IsNullOrEmpty(md1))
                {
                    startDate = DateTime.Now.ToString("yyyy-MM-01");
                    int days = DateUtil2.GetMonthDays(DateTime.Now.Year, DateTime.Now.Month);
                    endDate = string.Format("{0}-{1}-{2}", DateTime.Now.Year, DateTime.Now.Month, days);
                }
                else
                {
                    monthNumber = int.Parse(md1);
                    if (monthNumber == 0)
                        monthNumber = DateTime.Now.Month;

                    startDate = string.Format("{0}-{1}-{2}", year, monthNumber, "01");
                    int days = DateUtil2.GetMonthDays(year, monthNumber);
                    endDate = string.Format("{0}-{1}-{2}", year, monthNumber, days);

                }
                first = DateTime.Parse(startDate);
                last = DateTime.Parse(endDate);
            }
            else
            {
                weekNumber = MainUtil.GetInt(md2, 0);

                if (weekNumber == 0)
                {
                    DateUtil2.GetWeekNumberOfChina(DateTime.Now, out first, out last, out year, out weekNumber);
                    // startDate = first.ToString("yyyy-MM-dd");
                    // endDate = last.ToString("yyyy-MM-dd");
                }
                else
                {
                    DateUtil2.GetDayRangeOfCNWeeks(year, weekNumber, out first, out last);
                }
                startDate = first.ToString("yyyy-MM-dd");
                endDate = last.ToString("yyyy-MM-dd");
            }


            sb.AppendFormat("\"Year\":\"{0}\"", year);
            sb.AppendFormat(",\"WeekNumber\":\"{0}\"", weekNumber);
            sb.AppendFormat(",\"MonthNumber\":\"{0}\"", monthNumber);
            sb.AppendFormat(",\"StartDate\":\"{0}\"", startDate);
            sb.AppendFormat(",\"EndDate\":\"{0}\"", endDate);
            sb.AppendFormat(",\"BussinessUnitName\":\"{0}\"", _caller.BussinessUnitName);
            string str2 = "";
            sb.Append(",\"Days\":[");
            int d = 0;
            DateTime dStart = first;
            while (dStart <= last)
            {
                if (d > 0)
                    str2 += ",";
                str2 += string.Format("{{\"Date\":\"{0}\",\"DayofWeek\":\"{1}\",\"Name\":\"{2}\"}}", dStart.ToString("yyyy-MM-dd"), Convert.ToInt32(dStart.DayOfWeek), dStart.ToString("M/d"));
                d++;
                dStart = dStart.AddDays(1);
            }
            str2 += "]";
            sb.Append(str2);

            #region 备注
            string sql = "";
            string updateMemo = "";
            string nurseMessage = "";
            string shiftDescription = "";

            try
            {
                sql = "SELECT * FROM HRAttendGroupWorkShift WHERE BusinessUnitId='{0}' And StartDate='{1}' And EndDate='{2}'";
                sql = string.Format(sql, _caller.BussinessUnitId, startDate, endDate);
                DataSet ds = AppDataSource.GetDataSet(_caller, sql, null);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    updateMemo = StringUtil.GetString(dr["UpdateMemo"]);
                    nurseMessage = StringUtil.GetString(dr["NurseMessage"]);
                    shiftDescription = StringUtil.GetString(dr["Description"]);
                }
            }
            catch (Exception ex)
            {

            }

            sb.AppendFormat(",\"UpdateMemo\":\"{0}\"", DataUtil.ToJsonString(updateMemo));
            sb.AppendFormat(",\"NurseMessage\":\"{0}\"", DataUtil.ToJsonString(nurseMessage));
            sb.AppendFormat(",\"Description\":\"{0}\"", DataUtil.ToJsonString(shiftDescription));
            #endregion
            string unitId = this.Request["unitId"];
            #region 排班班组
            AttendGroupManager agMgr = new AttendGroupManager();
            string str1 = "[";
            str1 += "]";
            sb.Append(",\"Groups\":");
            sb.Append(str1);

            #endregion

            #region 排班数据
            WorkShiftManager workShiftManager = new WorkShiftManager();
            sb.Append(",\"Shifts\":[");
            List<AttendanceWorkShift> entities = workShiftManager.GetBusinessUnitWorkShifts(_caller, _caller.BussinessUnitId.ToString());
            i = 0;
            foreach (AttendanceWorkShift a in entities)
            {
                if (i > 0)
                    _json += ",";
                string color = "";
                if (!string.IsNullOrEmpty(a.Color))
                    color = DataUtil.ToJsonString(a.Color);
                _json += string.Format("{{\"WorkShiftId\":\"{0}\",\"Name\":\"{1}\",\"ShiftMethodCode\":\"{2}\",\"ShiftTypeCode\":\"{3}\",\"Color\":\"{4}\"}}", a.ID, DataUtil.ToJsonString(a.Name), a.ShiftMethodCode, a.ShiftTypeCode, color);
                i++;
            }
            sb.Append(_json);
            sb.Append("]");
            #endregion

            #region 员工排班数据
            string deptId = Request["DeptId"];
            string name = Request["name"];
            sb.Append(",\"EmpShiftData\":");

            Youyou.Workshifts.Actions.GetGroupEmployeeShifts getGroupEmployeeShifts = new Youyou.Workshifts.Actions.GetGroupEmployeeShifts(_caller, startDate, endDate, unitId);
            _json = getGroupEmployeeShifts.SearchEmployeeWorkShift(deptId, name);

            sb.Append(_json);
            #endregion

            sb.Append("}");

            return sb.ToString();
        }
        /// <summary>
        /// 加载排班设计器数据
        /// </summary>
        /// <returns></returns>
        string UIInitWorkShiftDesinger()
        {
            string startDate = this._context.Request["startDate"];
            string endDate = this._context.Request["endDate"];
            string md2 = this._context.Request["md2"];
            string md1 = this._context.Request["md1"];
            string md0 = this._context.Request["md0"];
            string calendar = this._context.Request["calendar"]; // 1 month 2 week
            string searchMode = this._context.Request["searchMode"];

            //if(searchMode=="1") //查询
            //    return UIInitSearchEmployeWorkShifts();

            StringBuilder sb = new StringBuilder();

            sb.Append("{");

            DateTime first = DateTime.Now;
            DateTime last = DateTime.Now;
            int weekNumber = 0;
            int monthNumber = DateTime.Now.Month;
            int year = 0;
            year = MainUtil.GetInt(md0, 0);
            if (year == 0)
                year = DateTime.Now.Year;

            try
            {
                #region time
                if (calendar == "1") //月排班
                {
                    //月
                    if (string.IsNullOrEmpty(md1))
                    {
                        startDate = DateTime.Now.ToString("yyyy-MM-01");
                        int days = DateUtil2.GetMonthDays(DateTime.Now.Year, DateTime.Now.Month);
                        endDate = string.Format("{0}-{1}-{2}", DateTime.Now.Year, DateTime.Now.Month, days);
                    }
                    else
                    {
                        monthNumber = int.Parse(md1);
                        if (monthNumber == 0)
                            monthNumber = DateTime.Now.Month;

                        startDate = string.Format("{0}-{1}-{2}", year, monthNumber, "01");
                        int days = DateUtil2.GetMonthDays(year, monthNumber);
                        endDate = string.Format("{0}-{1}-{2}", year, monthNumber, days);

                    }
                    first = DateTime.Parse(startDate);
                    last = DateTime.Parse(endDate);
                }
                else
                {
                    weekNumber = MainUtil.GetInt(md2, 0);
                    if (weekNumber == 0)
                    {
                        DateUtil2.GetWeekNumberOfChina(DateTime.Now, out first, out last, out year, out weekNumber);
                    }
                    else
                    {
                        first = DateUtil2.FirstDateOfWeekISO8601(year, weekNumber);
                        last = first.AddDays(6);
                        monthNumber = first.Month;
                    }
                    startDate = first.ToString("yyyy-MM-dd");
                    endDate = last.ToString("yyyy-MM-dd");
                }
                #endregion

                string unitName = "";// DataUtil.ToJsonString(_caller.BussinessUnitName);
                string businessName = DataUtil.ToJsonString(_caller.BussinessUnitName);
                sb.AppendFormat("\"Year\":\"{0}\"", year);                
                sb.AppendFormat(",\"MonthNumber\":\"{0}\"", monthNumber);
                sb.AppendFormat(",\"WeekNumber\":\"{0}\"", weekNumber);
                sb.AppendFormat(",\"StartDate\":\"{0}\"", startDate);
                sb.AppendFormat(",\"EndDate\":\"{0}\"", endDate);
                sb.AppendFormat(",\"BussinessUnitName\":\"{0}\"", businessName);
                sb.AppendFormat(",\"CalendarType\":\"{0}\"", calendar);

                //加载系统假期
                HolidayList holidayList = new HolidayList();
                holidayList.LoadHolidayList(_caller, year);

                string str2 = "";
                sb.Append(",\"Days\":[");
                int d = 0;
                DateTime dStart = first;
                while (dStart <= last)
                {
                    if (d > 0)
                        str2 += ",";
                    string workDay = dStart.ToString("yyyy-MM-dd");
                    string isHoliday = "false";
                    string isWorkDay = "false";
                    if (holidayList.IsHoliday(workDay)) // 如果是假期，并且假期班次不为空
                    {
                        isHoliday = "true";
                    }
                    if (holidayList.IsWorkDay(workDay))
                    {
                        isWorkDay = "true";
                    }
                    str2 += "{";
                    str2 += string.Format("\"Date\":\"{0}\",\"DayofWeek\":\"{1}\",\"Name\":\"{2}\",\"isHoliday\":{3},\"isWorkDay\":{4}", workDay, Convert.ToInt32(dStart.DayOfWeek), dStart.ToString("M-d"), isHoliday, isWorkDay);
                    str2 += "}";
                    d++;
                    dStart = dStart.AddDays(1);
                }
                str2 += "]";
                sb.Append(str2);
                string unitType = this.Request["unitType"];
                string unitId = this.Request["unitId"];
                if (string.IsNullOrEmpty(unitId))
                    unitId = "";
                int i = 0;
                #region 排班班组
                if (unitType == "10")
                {
                    sb.Append(",\"Groups\":[]");
                }
                else
                {
                    AttendGroupManager agMgr = new AttendGroupManager();
                    string str1 = "[";


                    EntityCollection groups = agMgr.GetMyAdminGroups(_caller);
                    foreach (Entity a in groups)
                    {
                        if (string.IsNullOrEmpty(unitId) && i == 0)
                        {
                            unitId = a.ID.ToString().ToUpper();
                            unitName = DataUtil.ToJsonString(a.Name);
                        }
                        else
                        {
                            if (string.Compare(a.ID.ToString(), unitId, true) == 0)
                                unitName = DataUtil.ToJsonString(a.Name);
                        }
                        if (i > 0)
                            str1 += ",";

                        string str3 = DataUtil.ToJsonString(a.Name);
                        string deptId = StringUtil.GetString(a.Fields["OwningBusinessUnit"].Value);
                        str1 += string.Format("{{\"id\":\"{0}\",\"name\":\"{1}\",\"deptId\":\"{2}\"}}", a.ID.ToString().ToUpper(), str3, deptId);
                        i++;
                    }
                    //组里没有数据
                    if (!string.IsNullOrEmpty(unitId) && string.IsNullOrEmpty(unitName))
                    {
                        Entity groupEntity = agMgr.GetGroupEntity(_caller, new Guid(unitId));
                        if (groupEntity != null)
                        {
                            if (i > 0)
                                str1 += ",";
                            unitName = groupEntity.Name;
                            string deptId = StringUtil.GetString(groupEntity.Fields["OwningBusinessUnit"].Value);
                            str1 += string.Format("{{\"id\":\"{0}\",\"name\":\"{1}\",\"deptId\":\"{2}\"}}", groupEntity.ID.ToString().ToUpper(), unitName, deptId);
                            //i = 1;
                        }
                    }


                    str1 += "]";

                    sb.Append(",\"Groups\":");
                    sb.Append(str1);
                }

                #endregion
                sb.AppendFormat(",\"UnitId\":\"{0}\"", unitId.ToUpper());
                sb.AppendFormat(",\"UnitName\":\"{0}\"", unitName);
                string shiftStatusName = "未提交";
                string shiftStatusCode = "0";
                string groupLeaveMsg = "";
                string groupDesc = "";
                if (!string.IsNullOrEmpty(unitId))
                {
                    EmpWorkshiftManager empWorkshiftMgr = new EmpWorkshiftManager();
                    AttendGroupShiftInfo groupShiftInfo = null;
                    if (weekNumber > 0)
                    {
                        groupShiftInfo = empWorkshiftMgr.GetGroupWeekWorkshiftInfo(_caller, unitId, year, monthNumber, weekNumber);
                        if (groupShiftInfo != null)
                        {
                            groupDesc = DataUtil.ToJsonString(groupShiftInfo.Description);
                            groupLeaveMsg = DataUtil.ToJsonString(groupShiftInfo.LeaveMessage);
                        }
                    }
                    else
                    {
                        //AttendanceDept attdDept = EmpWorkshiftManager.GetGroupMonthWorkShiftInfo(_caller, unitId, year, monthNumber);
                        groupShiftInfo = empWorkshiftMgr.GetGroupMonthWorkshiftInfo(_caller, unitId, year, monthNumber);
                        if (groupShiftInfo != null)                      
                        {
                            if (groupShiftInfo.ShiftStatus == 1)
                            {
                                shiftStatusName = "已提交";
                                shiftStatusCode = "1";
                            }
                            else
                            {
                                AttendancePeopleManager attendPeopleMgr = new AttendancePeopleManager();
                                //初始当前月的数据                               
                                attendPeopleMgr.InitAttenanceGroupMonthEmployees(_caller, unitId, year, monthNumber);
                            }
                            groupDesc = DataUtil.ToJsonString(groupShiftInfo.Description);
                            groupLeaveMsg = DataUtil.ToJsonString(groupShiftInfo.LeaveMessage);
                        }
                        
                    }
                }
                sb.Append(",\"Group\":{");
                sb.AppendFormat("\"ShiftStatusCode\":{0}", shiftStatusCode);
                sb.AppendFormat(",\"ShiftStatusName\":\"{0}\"", shiftStatusName);
                sb.AppendFormat(",\"Description\":\"{0}\"", groupDesc);
                sb.AppendFormat(",\"LeaveMessage\":\"{0}\"", groupLeaveMsg);
                sb.Append("}");
                //EmpWorkshiftManager.get

                #region 排备注
                /*
            EmpWorkshiftManager empShiftMgr = new EmpWorkshiftManager();
            List<AttendGroupShiftInfo> groupShiftInfos = empShiftMgr.GetAttendGroupWorkShift(_caller, _caller.UserID, year, monthNumber);
            str1 = JsonConvert.SerializeObject(groupShiftInfos);
            sb.Append(",\"GroupMemos\":");
            sb.Append(str1);
            */
                #endregion

                #region 排班数据

                bool isClosed = false;
                AttendancePeriod attendancePeriod = EmployeeAttendManager.GetAttendPeriod(_caller, year, monthNumber);
                if (attendancePeriod != null)
                {
                    if (attendancePeriod.StatusCode == 1)
                    {
                        //this.StatusName = "已封存";
                        sb.Append(",\"closePeriod\":true");
                        isClosed = true;
                    }
                    else
                        sb.Append(",\"closePeriod\":false");
                }

                Youyou.Workshifts.Actions.GetGroupEmployeeShifts getGroupEmployeeShifts = new Youyou.Workshifts.Actions.GetGroupEmployeeShifts(_caller, startDate, endDate, unitId);

                WorkShiftManager workShiftManager = new WorkShiftManager();
                sb.Append(",\"Shifts\":[");
                if (!isClosed)
                { }
                List<AttendanceWorkShift> entities = workShiftManager.GetMyUnitWorkShifts(_caller);
                //List<AttendanceWorkShift> entities = workShiftManager.GetMyUnitWorkShifts(_caller, _caller.BussinessUnitId.ToString());
                i = 0;
                foreach (AttendanceWorkShift a in entities)
                {
                    if (i > 0)
                        _json += ",";
                    string color = "";
                    if (!string.IsNullOrEmpty(a.Color))
                        color = DataUtil.ToJsonString(a.Color);
                    _json += string.Format("{{\"WorkShiftId\":\"{0}\",\"Name\":\"{1}\",\"ShiftMethodCode\":\"{2}\",\"ShiftTypeCode\":\"{3}\",\"Color\":\"{4}\"}}", a.ID, DataUtil.ToJsonString(a.Name), a.ShiftMethodCode, a.ShiftTypeCode, color);
                    i++;
                    getGroupEmployeeShifts.AddCacheAttendanceWorkShift(a.ID, a);
                }

                sb.Append(_json);
                sb.Append("]");
                #endregion


                #region 员工排班数据
                sb.Append(",\"EmpShiftData\":");


                _json = getGroupEmployeeShifts.GetGroupJson(year, monthNumber, weekNumber);
                if (string.IsNullOrEmpty(_json))
                {
                    sb.Append("[]");
                }
                else
                    sb.Append(_json);
                #endregion

                sb.Append("}");

                return sb.ToString();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                return string.Empty;
                
            }
        }
        
        /// <summary>
        /// 保存员工排班备注
        /// </summary>
        /// <returns></returns>
        string SaveWorkShiftDesinger()
        {
            EmpWorkshiftManager empShiftMgr = new EmpWorkshiftManager();
            string data = this._context.Request["Data"];
           List<AttendEmpWorkShift> empShifts = JsonConvert.DeserializeObject<List<AttendEmpWorkShift>>(data);
           foreach (AttendEmpWorkShift empShift in empShifts)
           {
               if (!string.IsNullOrEmpty(empShift.EmpWorkShiftId))
               {
                   empShiftMgr.UpdateMemo(_caller, empShift.EmpWorkShiftId, empShift.Description);
               }
               else
               {
                   empShiftMgr.UpdateMemo(_caller, empShift.EmployeeId,empShift.WorkDay, empShift.Description);
               }
           }
            return "{\"status\":1}";
        }
        /// <summary>
        /// 获取部门班次
        /// </summary>
        /// <returns></returns>
        string GetBusinessUnitWorkShifts()
        {
            WorkShiftManager workShiftManager = new WorkShiftManager();
            _json = "[";
            List<AttendanceWorkShift> entities = workShiftManager.GetBusinessUnitWorkShifts(_caller, _caller.BussinessUnitId.ToString());
            int i = 0;
            foreach (AttendanceWorkShift a in entities)
            {
                if (i > 0)
                    _json += ",";
                _json += string.Format("{{\"WorkShiftId\":\"{0}\",\"Name\":\"{1}\",\"ShiftMethodCode\":\"{2}\",\"ShiftTypeCode\":\"{3}\"}}", a.ID, a.Name, a.ShiftMethodCode, a.ShiftTypeCode);
                i++;
            }
            _json += "]";           
            return _json;

            //HRAttendBusinessUnitWorkShiftsGetList

        }
        /// <summary>
        /// 获取组员工的排班数据
        /// </summary>
        /// <returns></returns>
        string GetGroupEmployeeShifts()
        {
            string startDate = this._context.Request["startDate"];
            string endDate = this._context.Request["endDate"];

            DateTime first = DateTime.Now;
            DateTime last = DateTime.Now;
            int weekNumber = 0;
            int year = 0;
            //DateTime today = DateTime.Now;
            if (string.IsNullOrEmpty(startDate))
            {
                DateUtil2.GetWeekNumberOfChina(DateTime.Now, out first, out last, out year, out weekNumber);
                startDate = first.ToString("yyyy-MM-dd");
                endDate = last.ToString("yyyy-MM-dd");
            }
           

            //Youyou.HRCore.Actions.GetGroupEmployeeShifts getGroupEmployeeShifts = new Youyou.HRCore.Actions.GetGroupEmployeeShifts(_caller, startDate,endDate);
            //_json = getGroupEmployeeShifts.GetJson();
            
            return _json;
           
        }
        #endregion
        /// <summary>
        /// 获取部门用户
        /// </summary>
        string GetDebpartmentEmployees()
        {
            _json = "[";
            List<Employee> entities = EmployeeManager.GetDeptEmployees(_caller, id);
            int i = 0;
            foreach (Employee a in entities)
            {
                if (i > 0)
                    _json += ",";
                _json += string.Format("{{\"type\":\"B\",\"name\":\"{0}【{1}】\", \"id\":\"{2}\"}}", a.FullName, a.EmployeeNo, a.ID);
                i++;
            }
            _json += "]";
            // Response(_json);
            return _json;
        }
        /// <summary>
        /// 获取考勤组
        /// </summary>
        /// <returns></returns>
        string GeAttendGroups()
        {
            AttendRuleManager attendRuleManager = new AttendRuleManager();
            _json = "[";
            EntityCollection entities = attendRuleManager.GetMyAttendGroups(_caller);
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _json += ",";
                _json += string.Format("{{\"id\":\"{0}\",\"name\":\"{1}\"}}", a.ID, a.Name);
                i++;
            }
            _json += "]";
            // Response(_json);
            return _json;
        }
        public string GetMySalary()
        {
            string html = "";
            try
            {
                string querySalaryAccount = " SELECT Name,AccountNumber FROM HRSalaryAccountBase";
                DataSet ds = AppDataSource.GetDataSet(_caller, querySalaryAccount, null);
                int s = 0;
                html = "[";

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    int objectNumber = MainUtil.GetInt(dr["AccountNumber"], 0);
                    string accountName = StringUtil.GetString(dr["Name"]);

                    Template template = TemplateManager.GetTemplate(_caller.OrganizationId, objectNumber);
                    if (template == null) continue;
                    QueryExpression queryCondition = new QueryExpression();

                    #region time
                    ConditionExpression state = new ConditionExpression();
                    state.AttributeName = "YearNumber";
                    state.Values = new object[] { _context.Request["startYear"] };
                    state.Operator = ConditionOperator.Equal;
                    state.DataType = AttributeDataType.Number;
                    queryCondition.Criteria.AddCondition(state);

                    state = new ConditionExpression();
                    state.AttributeName = "MonthNumber";
                    state.Values = new object[] { _context.Request["startMonth"] };
                    state.Operator = ConditionOperator.GreaterEqual;
                    state.DataType = AttributeDataType.Number;
                    queryCondition.Criteria.AddCondition(state);

                    //state = new ConditionExpression();
                    //state.AttributeName = "SalaryYear";
                    //state.Values = new object[] { _context.Request["endYear"] };
                    //state.Operator = ConditionOperator.LessEqual;
                    //state.DataType = AttributeDataType.Number;
                    //queryCondition.Criteria.AddCondition(state);

                    state = new ConditionExpression();
                    state.AttributeName = "MonthNumber";
                    state.Values = new object[] { _context.Request["endMonth"] };
                    state.Operator = ConditionOperator.LessEqual;
                    state.DataType = AttributeDataType.Number;
                    queryCondition.Criteria.AddCondition(state);
                    #endregion

                    state = new ConditionExpression();
                    state.AttributeName = "SystemUserId";
                    state.Values = new object[] { _caller.UserID };
                    state.Operator = ConditionOperator.Equal;
                    //state.DataType = AttributeDataType.Number;
                    queryCondition.Criteria.AddCondition(state);

                    OrderExpression order = new OrderExpression();
                    order.AttributeName = "MonthNumber";
                    order.OrderType = OrderType.Descending;
                    queryCondition.Orders.Add(order);

                    EntityCollection entities = EntityManager.GetEntities(_caller, template, queryCondition);
                    if (entities.Count == 0)
                    {
                        continue;
                    }

                    if (s > 0)
                        html += ",";

                    int iRow = 0;
                                      
                                       
                    foreach (Entity item in entities)
                    {
                        //Entity item = entities[0];
                        if (iRow > 0)
                            html += ",";
                        //html += "{";
                        html += "[";
                        html += string.Format("{{\"field\":\"{0}\",\"value\":\"{1}\"}}", "薪资类别", accountName);

                        int ic = 1;
                        #region fields
                        foreach (TemplateField tfield in template.GetFields())
                        {
                            string fieldName = tfield.Name;
                            if (fieldName == "DeptId" || fieldName.Equals("SystemUserId",StringComparison.OrdinalIgnoreCase)
                                || fieldName.Equals("UserId", StringComparison.OrdinalIgnoreCase))
                                continue;
                            if (fieldName.Equals("EmployeeId", StringComparison.OrdinalIgnoreCase) || fieldName == "EmpNo" || fieldName == "EmployeeNo")
                                continue;
                            if (tfield.IsCustomField || tfield.IsNameField)
                            {
                                //string str1 = StringUtil.GetString(item.Fields[tfield.Name].Value);
                                //if (string.IsNullOrEmpty(str1) || str1 == "0.0000" || str1 == "0" || str1 == "0.00")
                                //    continue;
                                //if (tfield.Type == Supermore.EntityFramework.FieldTypeNames.Numeric)
                                //{
                                //    double sal1 = MainUtil.GetDouble(item.Fields[tfield.Name].Value);
                                //    if (sal1 == 0)
                                //        continue;
                                //}
                                //if (ic > 0)
                                //    html += ",";
                                //html += string.Format("{{\"field\":\"{0}\",\"value\":\"{1}\"}}", tfield.Title, str1);
                                //ic++;
                                string salary = StringUtil.GetString(item.Fields[tfield.Name].Value);
                               
                                if (ic > 0)
                                    html += ",";

                                if (tfield.Type == Supermore.EntityFramework.FieldTypeNames.Numeric)
                                {
                                    double sal1 = MainUtil.GetDouble(item.Fields[tfield.Name].Value);
                                    if (sal1 > 0)
                                    {
                                        html += string.Format("{{\"field\":\"{0}\",\"value\":\"{1}\"}}", tfield.Title, sal1);
                                        //continue;
                                    }
                                    else if (sal1 < 0)
                                        html += string.Format("{{\"field\":\"{0}\",\"value\":\"{1}\"}}", tfield.Title, "");
                                }
                                else
                                {
                                    if (!string.IsNullOrEmpty(salary))
                                    {
                                        html += string.Format("{{\"field\":\"{0}\",\"value\":\"{1}\"}}", tfield.Title, salary);
                                       // continue;
                                    }
                                    else
                                    {
                                        html += string.Format("{{\"field\":\"{0}\",\"value\":\"{1}\"}}", tfield.Title, "");
                                       // continue;
                                    }
                                }
                                ic++;
                            }
                        }
                        #endregion
                        //html += "}";
                        html += "]";
                        iRow++;
                    }
                    

                    s++;
                }
                html += "]";
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
           
            return html;
        }
        public string GetEntity()
        {
            int objectype = MainUtil.GetInt(_context.Request["objectype"], 0);
            Entity entity = EntityManager.GetEntity(_caller, objectype, new Guid(id));
            string json = EntityHelper.ToJsonFromEntity(entity);
            return json;
        }
        #region 工资账套
        //设置公式
        void SetFormulaText()
        {
            SalaryAccountManager salaryAccountManager = new SalaryAccountManager();
            string salaryAccoutId = _context.Request["salaryAccoutId"];
            string fieldId = _context.Request["fieldId"];
            string formulaText = _context.Request["CalculatedFormula"];
            salaryAccountManager.SetFormulaText(_caller,new Guid(salaryAccoutId), new Guid(fieldId), formulaText);
        }
        #endregion

        #region precheck in
        string PreCheckIn()
        {
            string time = DateTime.Now.ToString("HH:mm");
            string checkReason = "";
            bool isLate = false;
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            int iRes = -1;
            if (AttendanceManager.IsCheckIn(_caller, date))
            {
                return "{\"status\":\"success\",\"action\":\"9998\",\"msg\":\"你已签到，无需再次操作。\"}";
            }
            string checkTime = Settings.GetSetting("HR.CheckinTime", "08:30");
            string ipAddr = _context.Request.ServerVariables["REMOTE_ADDR"];
            if (_context.Request["confirm"] == "1") //如果是第二次签到，直接记录
            {
                iRes = AttendanceManager.CheckIn(_caller, date, time, true, false, checkReason, checkTime, ipAddr);
                return "{\"status\":\"success\",\"action\":\"1\",\"msg\":\"签到成功！\"}";
            }

            //string checkTime = Settings.GetSetting("HR.CheckinTime");
            DateTime oTime = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + checkTime);
            TimeSpan ts = DateTime.Now.Subtract(oTime);
            if (DateTime.Now > oTime)
            {
                long tm = MainUtil.GetLong(ts.TotalMinutes, 1);
                return string.Format("{{\"status\":\"failure\",\"action\":\"9999\",\"msg\":\"您已迟到{0}分钟，是否确认签到？\"}}", tm);
            }

            iRes = AttendanceManager.CheckIn(_caller, date, time, isLate, false, checkReason, checkTime, ipAddr);
            if (iRes == -1)
            {
                return "{\"status\":\"success\",\"action\":\"9998\",\"msg\":\"你已签到，无需再次操作。\"}";
            }
            return "{\"status\":\"success\",\"action\":\"1\",\"msg\":\"签到成功！\"}";
           
        }
        string CheckIn()
        {
            string ipAddr = _context.Request.ServerVariables["REMOTE_ADDR"];
            string checkTime = Settings.GetSetting("HR.CheckinTime", "08:30"); 
            string time = DateTime.Now.ToString("HH:mm");
            string checkReason = "";
            // string fixDate = "";
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            TimeSpan tsStart = new TimeSpan(6, 0, 0);
            TimeSpan tsEnd = new TimeSpan(9, 45, 0);
            TimeSpan tsNow = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, 0);
            bool isLate = false;
            if (tsNow >= tsStart && tsNow <= tsEnd)
            {
                TimeSpan tsTemp = new TimeSpan(8, 30, 0);
                if (tsNow.Ticks > tsTemp.Ticks)
                    isLate = true;
                /*                  
                TimeSpan tsStart1 = new TimeSpan(8, 30, 0);
                TimeSpan tsEnd1 = new TimeSpan(8, 45, 0);
                if (tsNow >= tsStart1 && tsNow <= tsEnd1)
                    time = "08:29";
                */
                time = DateTime.Now.AddMinutes(-15).ToString("HH:mm");

                int iRes = AttendanceManager.CheckIn(_caller, date, time, isLate, false, checkReason, checkTime, ipAddr);
                if (iRes == -1)
                {
                    return "{\"status\":\"failure\",\"action\":\"1\",\"msg\":\"你已签到，无需再次操作。\"}";
                }
                return "{\"status\":\"success\",\"action\":\"1\",\"msg\":\"签到成功！\"}";
            }
            else
            {
                return "{\"status\":\"failure\",\"action\":\"1\",\"msg\":\"签到失败，不在签到时间范围内！\"}";
            }
        }

        string PreCheckOut()
        {
            string time = DateTime.Now.ToString("HH:mm");
            string checkReason = "";
            bool isLate = false;
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            int iRes = -1;
            string ipAddr = _context.Request.ServerVariables["REMOTE_ADDR"];
            string checkTime = Settings.GetSetting("HR.CheckOutTime", "17:30");
            if (_context.Request["confirm"] == "1") //如果是第二次签到，直接记录
            {
                iRes = AttendanceManager.CheckOut(_caller, date, time, false, checkReason, checkTime, ipAddr);
                return "{\"status\":\"success\",\"action\":\"1\",\"msg\":\"签退成功！\"}";
            }

            
            DateTime oTime = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + checkTime);
            TimeSpan ts = oTime.Subtract(DateTime.Now);
            if ( oTime>DateTime.Now)
            {
                long tm = MainUtil.GetLong(ts.TotalMinutes, 1);
                return string.Format("{{\"status\":\"failure\",\"action\":\"9999\",\"msg\":\"您已早退{0}分钟，是否确认签退？\"}}", tm);
            }

            iRes = AttendanceManager.CheckIn(_caller, date, time, isLate, false, checkReason, checkTime, ipAddr);
            if (iRes == -1)
            {
                return "{\"status\":\"success\",\"action\":\"9998\",\"msg\":\"你已签退，无需再次操作。\"}";
            }
            return "{\"status\":\"success\",\"action\":\"1\",\"msg\":\"签退成功！\"}";

        }
        
        string CheckOut()
        {
            string ipAddr = _context.Request.ServerVariables["REMOTE_ADDR"];
            string time = DateTime.Now.ToString("HH:mm");
            string checkReason = "";
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string checkTime = Settings.GetSetting("HR.CheckOutTime", "17:30");
            TimeSpan tsStart = new TimeSpan(17, 15, 0);
            TimeSpan tsEnd = new TimeSpan(19, 0, 0);
            TimeSpan tsNow = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, 0);
            if (tsNow >= tsStart && tsNow <= tsEnd)
            {
                time = DateTime.Now.AddMinutes(15).ToString("HH:mm");
                int iRes = AttendanceManager.CheckOut(_caller, date, time, false, checkReason, checkTime, ipAddr);
                if (iRes == -1)
                {
                    return "{\"status\":\"failure\",\"action\":\"2\",\"msg\":\"你已签退，无需再次操作。\"}";
                }
                return "{\"status\":\"success\",\"action\":\"2\",\"msg\":\"签退成功！\"}";
            }
            else
            {
                return "{\"status\":\"failure\",\"action\":\"2\",\"msg\":\"签退失败，不在签退时间范围内！\"}";
            }
        }

        #endregion

        void StatDinner()
        {
            string peo = this._context.Request["peo"];
            string type = this._context.Request["type"]; //2早餐，1中餐
            
            if (type == "1")
            {
                string update1 = "UPDATE HRAttendanceBase SET LunchCount={0} WHERE UserId='{1}' AND AttendDate='{2}'";
                update1 = string.Format(update1, peo, this._caller.UserID, DateTime.Now.ToString("yyyy-MM-dd"));
                DatabaseTool.ExecuteNonQuery(this._caller, update1);
           }
            else
            {
                string update2 = "UPDATE HRAttendanceBase SET BreakfastCount={0} WHERE UserId='{1}' AND AttendDate='{2}'";
                update2 = string.Format(update2, peo, this._caller.UserID, DateTime.Now.ToString("yyyy-MM-dd"));
                DatabaseTool.ExecuteNonQuery(this._caller, update2);
            }

        }

        string LoadHRShiftHoverPage()
        {
            string path = this._context.Server.MapPath("/_ui/_pageBlockTemplate/HRShiftHover.htm");
            string result = FileUtil.ReadFromFile(path);
           
            string employeeid = _context.Request["employeeid"];
            string day = _context.Request["day"];
            string isReadonly = _context.Request["readonly"];

            HREditShiftBlock render = new HREditShiftBlock();
            render.Caller = this._caller;
            string retURL = HttpUtility.UrlEncode(_context.Request["retURL"]);
            render.RetURL = retURL;
            render.IsReadOnly = (isReadonly == "true" ? true : false);
            render.ContainId = _context.Request["containid"];
            WorkShiftManager workShiftManager = new WorkShiftManager();
            List<AttendanceEmployeeWorkShift> shifts = workShiftManager.GetEmployeeDailyWorkShift(_caller, new Guid(employeeid), day);
            render.EmployeeWorkShifts = shifts;
            render.Render(result);
            return render.HTMLResult;
            
            //return result;
        }
        #region salary dinner
        string GetDinnerSend()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            DataSet ds = salaryMgr.GetDinnerSend(_caller, yNum, mNum);
            string listData = DataUtil.ToJsonFromDS(ds);

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            //sb.AppendFormat(",");
            sb.AppendFormat("\"listData\":{0}", listData);
            sb.Append("}");
            return sb.ToString();
        }
        string GetDinnerDeptSend()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            string strDeptId = _context.Request["DeptId"];
            DataSet ds = salaryMgr.GetDinnerDept(_caller, yNum, mNum,new Guid(strDeptId));
            string listData = DataUtil.ToJsonFromDS(ds);

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            //sb.AppendFormat(",");
            sb.AppendFormat("\"listData\":{0}", listData);
            sb.Append("}");
            return sb.ToString();
        }
        /// <summary>
        /// 获取部门上报餐费状态
        /// </summary>
        /// <returns></returns>
        string GetDeptsSalaryDinner()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y,DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m,DateTime.Now.Month);
            DataSet ds = salaryMgr.GetDeptDinnerFee(_caller, yNum, mNum);
            string listData= DataUtil.ToJsonFromDS(ds);

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            //sb.AppendFormat(",");
            sb.AppendFormat("\"listData\":{0}", listData);
            sb.Append("}");
            return sb.ToString();
        }
        /// <summary>
        /// 获取餐卡
        /// </summary>
        /// <returns></returns>
        string GetMealCardSend()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            //string strDeptId = _context.Request["DeptId"];
            DataSet ds = salaryMgr.GetMealCard(_caller, yNum, mNum);
            string listData = DataUtil.ToJsonFromDS(ds);

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            //sb.AppendFormat(",");
            sb.AppendFormat("\"listData\":{0}", listData);
            sb.Append("}");
            return sb.ToString();

        }
        /// <summary>
        /// 获取部门员工餐费
        /// </summary>
        /// <returns></returns>
        string GetDeptEmpsSalaryDinner()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            string strDeptId = _context.Request["DeptId"];
            DataSet ds = salaryMgr.GetDeptEmployeeDinnerFee(_caller, yNum, mNum,new Guid(strDeptId));
            string listData = DataUtil.ToJsonFromDS(ds);

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            sb.AppendFormat("\"listData\":{0}", listData);
            sb.Append("}");
            return sb.ToString();
        }
        /// <summary>
        /// 重置报表
        /// </summary>
        void SalaryDeptReportReset()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();

             string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            string strDeptId = _context.Request["DeptId"];
            salaryMgr.UpdateDeptDinnerStatus(_caller, yNum, mNum, new Guid(strDeptId),1);
        }
        string BatchUpdateSalaryDinner()
        { 
            string str1= _context.Request["data"];
            try
            {
                string status = _context.Request["status"];
                int statusCode = MainUtil.GetInt(status, 1);
                DinnerFeeManager salMgr = new DinnerFeeManager();

                List<DeptAssignAmount> list = JsonConvert.DeserializeObject<List<DeptAssignAmount>>(str1);
                if (list.Count > 0)
                    Supermore.Diagnostics.Trace.LogTest(str1);
                foreach (DeptAssignAmount d in list)
                {
                    salMgr.UpdateDeptDinnerFee(_caller, d, statusCode);
                }

            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                return "{\"status\":999}";
            }
           return "{\"status\":1}";
        }
        /// <summary>
        /// 批量更新部门员工餐费
        /// </summary>
        /// <returns></returns>
        string BatchUpdateEmployeeSalaryDinner()
        {
            string str1 = _context.Request["data"];
            try
            {
                string status = _context.Request["status"];
                int statusCode = MainUtil.GetInt(status, 1);
                int yNum = MainUtil.GetInt(_context.Request["YearNumber"], 0);
                int mNum = MainUtil.GetInt(_context.Request["MonthNumber"], 0);
                string deptId = _context.Request["deptId"];
                DinnerFeeManager salMgr = new DinnerFeeManager();
                //List<EmployeeAssignAmount> list = JsonConvert.DeserializeObject<List<EmployeeAssignAmount>>(str1);
                //foreach (EmployeeAssignAmount d in list)
                //{
                //    salMgr.UpdateEmployeeDinnerFee(_caller, d);
                //}
                if (statusCode == 2)
                    salMgr.UpdateDeptDinnerStatus(_caller, yNum, mNum, new Guid(deptId), statusCode);
                //int yNum = MainUtil.GetInt(_context.Request["YearNumber"], 0);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return string.Empty;
        }

        /// <summary>
        /// 批量更新部门员工餐费 提交参数
        /// </summary>
        /// <returns></returns>
        string ResetDeptSalaryReport()
        {
            string str1 = _context.Request["id"];
            try
            {
                string status = _context.Request["status"];
                int statusCode = MainUtil.GetInt(status, 1);
                int yNum = MainUtil.GetInt(_context.Request["YearNumber"], 0);
                int mNum = MainUtil.GetInt(_context.Request["MonthNumber"], 0);
                string deptId = _context.Request["deptId"];
                DinnerFeeManager salMgr = new DinnerFeeManager();
                //List<EmployeeAssignAmount> list = JsonConvert.DeserializeObject<List<EmployeeAssignAmount>>(str1);
                //foreach (EmployeeAssignAmount d in list)
                //{
                   
                //}
                salMgr.UpdateDeptDinnerStatus(_caller, yNum, mNum, new Guid(deptId), statusCode);
                //if (statusCode == 2)
                //    salMgr.UpdateDeptDinnerStatus(_caller, yNum, mNum, new Guid(deptId), statusCode);
                //int yNum = MainUtil.GetInt(_context.Request["YearNumber"], 0);
                string upd2 = "";

                //同步工号
                upd2 = string.Format(@"UPDATE HRSalaryDinnerFeeBase SET EmployeeNo = b.EmployeeNo 
                                        From HRSalaryDinnerFeeBase a JOIN HREmployeeBase b on a.EmpId = b.EmployeeId
                                        WHERE a.EmployeeNo Is Null and (b.EmployeeNo Is Not Null)");
                AppDataSource.ProcessDBUpdate(_caller, upd2);

                //汇总部门
                upd2 = string.Format(@"UPDATE HRSalaryDinnerDeptBase SET Amount = b.Amount 
                                        From HRSalaryDinnerDeptBase a JOIN 
                                        (SELECT DeptId,Sum(IsNull(Amount,0)) As Amount FROM HRSalaryDinnerFeeBase WHERE YearNumber={0} AND MonthNumber={1} GROUP BY DeptId) b
                                        on a.DeptId = b.DeptId
                                        WHERE a.YearNumber ={0} AND a.MonthNumber={1} and b.Amount Is Not null");
                upd2 = string.Format(upd2, yNum, mNum);
                AppDataSource.ProcessDBUpdate(_caller, upd2);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return string.Empty;
        }
        #endregion

        #region 上报员工
        string CopyDeptDinner()
        {
            DinnerFeeManager dinnerMgr = new DinnerFeeManager();
            dinnerMgr.CopyLastMonthDept(_caller);

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            sb.AppendFormat("\"status\":{0}", 1);
            sb.AppendFormat("\"msg\":{0}", "复制成功！");
            sb.Append("}");
            return sb.ToString();
        }
        /// <summary>
        /// 获取部门员工餐费
        /// </summary>
        /// <returns></returns>
        string AddEmployeeToDinner()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            string strDeptId = _context.Request["DeptId"];
            string strEmpIds = _context.Request["empIds"];
            Guid[] empIds = MainUtil2.ToGuidArray(strEmpIds,',');
            foreach (Guid emp in empIds)
            {
                salaryMgr.AddEmployeeToDinner(_caller, yNum, mNum, new Guid(strDeptId), emp);
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            sb.AppendFormat("\"status\":{0}", 1);
            sb.AppendFormat("\"msg\":{0}", "添加成功");
            sb.Append("}");
            return sb.ToString();
        }
        string DeleteEmployeeToDinner()
        {
            DinnerFeeManager salaryMgr = new DinnerFeeManager();
            string y = _context.Request["yearNumber"];
            string m = _context.Request["monthNumber"];
            int yNum = MainUtil.GetInt(y, DateTime.Now.Year);
            int mNum = MainUtil.GetInt(m, DateTime.Now.Month);
            string strDeptId = _context.Request["DeptId"];
            string strEmpIds = _context.Request["empIds"];
            Guid[] empIds = MainUtil2.ToGuidArray(strEmpIds, ',');
            foreach (Guid emp in empIds)
            {
                salaryMgr.DeleteEmployeeToDinner(_caller, yNum, mNum, new Guid(strDeptId), emp);
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            sb.AppendFormat("\"status\":{0}", 1);
            sb.AppendFormat("\"msg\":{0}", "添加成功");
            sb.Append("}");
            return sb.ToString();
        }
        #endregion

        string EntityGetList()
        {
            int objectTypeCode = MainUtil.GetInt(this._context.Request["objectTypeCode"], 0);
            Template entityTemplate = TemplateManager.GetTemplate(_caller, objectTypeCode);
            string tableName = "";
            if (entityTemplate != null)
               tableName = entityTemplate.BaseTableName;
            string sql =string.Format( "SELECT * FROM  {0}",tableName);
            DataSet ds = AppDataSource.GetDataSet(_caller, sql, null);
            _json = "{\"status\":1,";
            _json += "\"listData\":";
            _json += DataUtil.ToJsonFromDS(ds);
            _json += "}";

            Response(_json);

            return _json;
        }

        #region 夜班餐费详细
        /// <summary>
        /// 保存夜班餐费详细项目
        /// </summary>
        void SaveEmployeeDinnerfee()
        {
            string EmpBillId = _context.Request["EmpBillId"];
            string ItemId = _context.Request["ItemId"];
            string Amount = _context.Request["Amount"];
            string quantity = _context.Request["quantity"];

            if (!string.IsNullOrEmpty(quantity))
            {
                Entity entity = new Entity(Guid.NewGuid(), HObjectTypeCodes.SalaryDinnerEmpDetail, _caller.OrganizationId);
                entity.BeginEdit();
                entity.Fields["EmpBillId"].Value = EmpBillId;
                entity.Fields["ItemId"].Value = ItemId;
               // entity.Fields["Amount"].Value = Amount;
                entity.Fields["Quantity"].Value = quantity;
                entity.Fields["CreatedBy"].Value = _caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
               bool isSaved = entity.EndEdit();
               string upd1 = string.Format(@"UPDATE HRSalaryDinnerEmpDetailBase SET Unit = b.Standards,Name = b.Name FROM HRSalaryDinnerEmpDetailBase a JOIN HRSalaryDinnerFeeItemBase b
                                                ON a.ItemId = b.ValueId
                                            WHERE a.ValueId='{0}'", entity.ID);
               AppDataSource.ProcessDBUpdate(_caller, upd1);
                //计算单项上报
               string upd2 = string.Format("UPDATE HRSalaryDinnerEmpDetailBase SET Amount = Quantity * Unit WHERE ValueId='{0}'",entity.ID);
               AppDataSource.ProcessDBUpdate(_caller, upd2);
                //汇总个人总金额
               upd2 = string.Format(@"UPDATE HRSalaryDinnerFeeBase SET Amount = (SELECT SUM(IsNull(Amount,0)) FROM HRSalaryDinnerEmpDetailBase WHERE EmpBillId='{0}'),
                                        Quantity = (SELECT SUM(IsNull(Quantity,0)) FROM HRSalaryDinnerEmpDetailBase WHERE EmpBillId='{0}'),
                                        ModifiedBy='{1}',ModifiedOn=GETDATE()
                                        WHERE ValueId='{0}'", EmpBillId,_caller.UserID);
               AppDataSource.ProcessDBUpdate(_caller, upd2);
               
            }
        }
        /// <summary>
        /// 清空上报数据
        /// </summary>
        void ClearEmployeeDinnerfee()
        {
            string EmpBillId = _context.Request["EmpBillId"];
            string upd1 = string.Format(@"DELETE HRSalaryDinnerEmpDetailBase  WHERE EmpBillId='{0}'", EmpBillId);
            AppDataSource.ProcessDBUpdate(_caller, upd1);
            //计算单项上报
            //string upd2 = string.Format("UPDATE HRSalaryDinnerEmpDetailBase SET Amount = Quantity * Unit WHERE ValueId='{0}'", entity.ID);
            //AppDataSource.ProcessDBUpdate(_caller, upd2);
            //汇总
            //upd1 = string.Format(@"UPDATE HRSalaryDinnerFeeBase SET Amount = 0 WHERE ValueId='{0}'", EmpBillId);
            upd1 = string.Format(@"DELETE HRSalaryDinnerFeeBase  WHERE ValueId='{0}'", EmpBillId);
            AppDataSource.ProcessDBUpdate(_caller, upd1);
        }

        string GetEmployeeDinnerfeeItems()
        {
            string str1 = _context.Request["id"];
            string sql = string.Format("SELECT a.*,b.Name As ItemIdName FROM  HRSalaryDinnerEmpDetailBase a JOIN  HRSalaryDinnerFeeItemBase b ON a.ItemId= b.ValueId Where EmpBillId='{0}'", str1);
            DataSet ds = AppDataSource.GetDataSet(_caller, sql, null);
              _json = "{\"status\":1,";
            _json += "\"listData\":";
            _json += DataUtil.ToJsonFromDS(ds);
            _json += "}";
           // Response(_json);
            return _json;
        }
        #endregion

        void Response(string msg)
        {
            this._context.Response.Write(msg);
        }
        public HttpRequest Request
        {
           get { return this._context.Request;}
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