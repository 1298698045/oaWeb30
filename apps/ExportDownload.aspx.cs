using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.Data.Query.SqlServer;
using Supermore.DataManager.Export;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Imports;
using Supermore.IO;
using Supermore.Queries;
using Supermore.Tasks;
using Youyou;
using Youyou.HRCore;
using Youyou.HRCore.Attendance;
using Youyou.HRCore.Salary;
using Supermore.Xml;
using Supermore.HR.Attendance;

using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json.Linq;

namespace WebClient.apps
{
    public partial class ExportDownload : System.Web.UI.Page
    {
        private byte[] buffer = new byte[2048];
        private int length = 0;
        CallContext _caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            string cmd = Request["cmd"];
            switch (cmd)
            {
                case "export.attend.monthreport":
                    ExportAttendMonth();
                    break;
                case "savedquery.export": //导出查询
                    ExportQuery();
                    break;
                case "export.attendsummary.list": //导出考勤汇总(列)
                    ExportAttendanceSummaryList();
                    break;
                case "export.attend.yearsummary": //导出年度汇总考勤
                    ExportAttendanceSummary();
                    break;

                case "export.reward.detail"://部门绩效导出明细
                    ExporttRewardDetailExcel();
                    break;
                case "grid.customize.export": //自定义列表导出
                    break;
                //case "employee.export":
                //    ExportEmployeeFile();
                //    break;
                case "grid.custom.export":
                    ExportGridExcel();
                    break;
                default:
                    string filterQuery = Request["filterQuery"];
                    ExportFile();
                    break;
            }

        }

        #region
        void ExporttRewardDetailExcel()
        {
            int year = 0;
            int month = 0;
            if (Request["yNum"] != null)
            {
                year = MainUtil.GetInt(Request["yNum"], DateTime.Now.Year);
            }
            if (Request["mNum"] != null)
            {
                month = MainUtil.GetInt(Request["mNum"], DateTime.Now.Month);
            }
            string fname = string.Format("{0}年{1}月奖金明细{2}.xls", year, month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            string filePath = Supermore.IOPaths.ExportFilePath + string.Format("\\{0}\\{1}\\", DateTime.Now.Year, DateTime.Now.Month) + fname;
            ExportSalaryManager exportSalaryManager = new ExportSalaryManager(filePath);
            exportSalaryManager.Caller = _caller;
            exportSalaryManager.ExportReward(year, month);
            DownloadFile(filePath, fname);
        }
        #endregion

        #region 导出员工
        void ExportEmployeeFile()
        {
            string filterQuery = this.Request["filterQuery"];
            string templateObjectCode = this.Request["objecttypecode"];
            string exportFileName = this.Request["name"];
            string fields = this.Request["fields"];
            string orderField = this.Request["order"];

            Youyou.Export.ExportSetting setting = new Youyou.Export.ExportSetting();
            //setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.csv", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.xls", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));

            int typeCode = MainUtil.GetInt(templateObjectCode, 0);
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, typeCode);
            if (template != null)
            {
                // EntityCollection entities = SavedQueryManager.GetEntityies(_caller, template, extraQueryExpression);
            }

            string[] fieldIds = fields.Split(',');
            string fieldNames = MainUtil2.ArrayToString(fieldIds, ',');
            foreach (string str2 in fieldIds)
            {
                Youyou.Import.MapColumn mapCol = new Youyou.Import.MapColumn();
                mapCol.SourceColumn = str2;
                mapCol.DestinationColumn = template.GetField(str2).Title;
                setting.MapColumns.Add(mapCol);
            }
            QueryExpression extraQueryExpression = new QueryExpression();

            if (!string.IsNullOrEmpty(filterQuery))
            {
                string[] conds = filterQuery.Split('\n');
                foreach (string condLine in conds)
                {
                    if (string.IsNullOrEmpty(condLine)) continue;
                    string[] v = condLine.Split('\t');
                    string fValue = v[2];
                    if (!string.IsNullOrEmpty(fValue))
                    {
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                        string[] values = fValue.Split(',');
                        extraQueryExpression.Criteria.AddCondition(v[0], condOperator, values);
                    }
                }
            }
            string whereSql = SqlServerSqlClauseQueryBuilder.ReadFilter(extraQueryExpression.Criteria);
            if (!string.IsNullOrEmpty(whereSql))
                whereSql = " Where " + whereSql;

            Youyou.Export.NPOISqlExportManager exportManager = new Youyou.Export.NPOISqlExportManager();
            setting.QueryView = " HREmployee ";
            setting.QuerySQL = string.Format("SELECT {0} FROM HREmployee {1}", fieldNames, whereSql);
            setting.CallContext = _caller;
            exportManager.CallContext = _caller;
            exportManager.Export(setting);

            DownloadFile(setting.FileName, exportFileName + ".xls");
        }
        #endregion

        void ExportAttendMonth()
        {
            int year = 0;
            int startMonth = 0;
            if (Request["AttendYear"] != null)
            {
                year = MainUtil.GetInt(Request["AttendYear"], DateTime.Now.Year);
            }
            if (Request["startMonth"] != null)
            {
                startMonth = MainUtil.GetInt(Request["startMonth"], DateTime.Now.Month);
            }
            string fileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\attend_{2}.csv", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            ExportAttendManager exportAttendManager = new ExportAttendManager(fileName);
            exportAttendManager.Caller = _caller;
            exportAttendManager.Export(year, startMonth);
            DownloadFile(fileName, string.Format("attend_{0}_{1}.csv", year, startMonth));
        }
        /// <summary>
        /// 按列格式
        /// </summary>
        void ExportAttendanceSummaryList()
        {
            int year = 0;
            int startMonth = 0;
            int endMonth = 0;
            if (Request["AttendYear"] != null)
            {
                year = MainUtil.GetInt(Request["AttendYear"], DateTime.Now.Year);
            }
            if (Request["startMonth"] != null)
            {
                startMonth = MainUtil.GetInt(Request["startMonth"], DateTime.Now.Month);
            }
            if (Request["endMonth"] != null)
            {
                endMonth = MainUtil.GetInt(Request["endMonth"], DateTime.Now.Month);
            }
            string deptId = this.Request["deptId"];
            string IsFullAttend = this.Request["IsFullAttend"];
            AttendMonthSummaryReportExportor exportor = new AttendMonthSummaryReportExportor(year, startMonth, endMonth, deptId, IsFullAttend);
            exportor.ExportListExcel(_caller);
            exportor.Dispose();
            DownloadFile(exportor.FilePath, exportor.FileName);
        }
        /// <summary>
        /// 导出考勤汇总(汇总一列)
        /// </summary>
        void ExportAttendanceSummary()
        {
            string exportFileName = this.Request["name"];
            int year = 0;
            int startMonth = 0;
            int endMonth = 0;
            if (Request["AttendYear"] != null)
            {
                year = MainUtil.GetInt(Request["AttendYear"], DateTime.Now.Year);
            }
            if (Request["startMonth"] != null)
            {
                startMonth = MainUtil.GetInt(Request["startMonth"], DateTime.Now.Month);
            }
            if (Request["endMonth"] != null)
            {
                endMonth = MainUtil.GetInt(Request["endMonth"], DateTime.Now.Month);
            }

            string isFullAttend =StringUtil.GetString(this.Request["IsFullAttend"]);
            string format = Request["format"];
            //string filePath = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\attend{2}.xls", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            //绍兴格式
            string configXml = "";
            configXml = string.Format("<config><Name>考勤汇总数据</Name><DataFormat>{3}</DataFormat><YearNumber>{0}</YearNumber><StartMonth>{1}</StartMonth><EndMonth>{2}</EndMonth><IsFullAttend>{4}</IsFullAttend></config>", year, startMonth, endMonth, 3, isFullAttend);
            TaskDbManager.CreateTask(_caller, "导出考勤汇总数据", "export.attend.yearsummary", "", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), configXml);
            Response.Write("系统正在后台导出，请稍后在 文件管理 > 我的文件 下查看！");
            return;

            //ExportAttendMonthSummaryReport exportReport = new ExportAttendMonthSummaryReport(_caller, year, filePath);
            //if (format == "3") //绍兴格式
            //{
            //    exportReport.ExportShaoxinExcel();
            //    exportReport.Dispose();
            //}
            //DownloadFile(filePath, exportFileName + ".xls");
            /**/
            //ExportSetting setting = new ExportSetting();
            //setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.csv", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            //setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.xls", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            /*
            string fields = "";
            string[] fieldIds = fields.Split(',');
            foreach (string str2 in fieldIds)
            {
                MapColumn mapCol = new MapColumn();
                mapCol.SourceColumn = str2;
                //mapCol.DestinationColumn = template.GetField(str2).Title;
                setting.MapColumns.Add(mapCol);
            }
            */
            //MapColumn mapCol = new MapColumn();


        }
        void ExportQuery()
        {

        }
        void ExportFile()
        {
            string filterQuery = this.Request["filterQuery"];
            string templateObjectCode = this.Request["objecttypecode"];
            string exportFileName = this.Request["name"];
            string fields = this.Request["fields"];
            string orderField = this.Request["order"];

           
            int objectTypeCode = MainUtil.GetInt(templateObjectCode, 0);
            if (ObjectTypeCodes.HRAttendanceDetail == objectTypeCode)
            {
                //if (filterQuery.IndexOf("AbnormalCode") == -1)
                {
                    string configXml = "";
                    configXml = string.Format("<config><name>打卡数据</name><objecttypecode>{0}</objecttypecode><fields>{1}</fields><filterquery><![CDATA[{2}]]></filterquery></config>", templateObjectCode, fields, filterQuery);
                    TaskDbManager.CreateTask(_caller, "导出考勤打卡数据", "export.attenddetail", "", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), configXml);
                    Response.Write("系统正在后台导出，请稍后在 文件管理 > 我的文件 下查看！");
                    return;
                }
            }

            try
            {
                QueryExpression extraQueryExpression = new QueryExpression();

                //extraQueryExpression.AddOrder("FullName", OrderType.Ascending);

                if (!string.IsNullOrEmpty(filterQuery))
                {
                    string[] conds = filterQuery.Split('\n');
                    foreach (string condLine in conds)
                    {
                        if (string.IsNullOrEmpty(condLine)) continue;
                        string[] v = condLine.Split('\t');
                        string fValue = v[2];
                        if (!string.IsNullOrEmpty(fValue))
                        {
                            ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                            //if (condOperator == ConditionOperator.In)
                            //{
                            //    ConditionExpression con = new ConditionExpression();
                            //    object[] objVals = fValue.Split(',');
                            //    extraQueryExpression.Criteria.AddCondition(v[0], condOperator, objVals);
                            //}
                            //else
                            string[] values = fValue.Split(',');
                            extraQueryExpression.Criteria.AddCondition(v[0], condOperator, values);
                        }
                    }

                }

                if (HObjectTypeCodes.SalaryDinnerFee == objectTypeCode)
                {
                    string fileName = string.Format("{0}\\{1}\\ybcf{2}.xls", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
                    //夜餐费导出
                    string filePath = Supermore.IOPaths.ExportFilePath + "\\" + fileName;
                    Youyou.DataImpExport.ExportDinner exportDinner = new Youyou.DataImpExport.ExportDinner(filePath);
                    string whereClause = "";
                    whereClause = SqlServerSqlClauseQueryBuilder.ReadFilter(extraQueryExpression.Criteria);
                    //where1 = QueryUtil.convertFilterExpression(extraQueryExpression.Criteria);
                    exportDinner.Export(whereClause);
                    DownloadFile(filePath, fileName);
                    return;
                }

                if (string.IsNullOrEmpty(orderField))
                {
                    extraQueryExpression.AddOrder("CreatedOn", OrderType.Ascending);
                }
                else
                {
                    extraQueryExpression.AddOrder(orderField, OrderType.Ascending);
                }

                int typeCode = MainUtil.GetInt(templateObjectCode, 0);
                Template template = TemplateManager.GetTemplate(_caller.OrganizationId, typeCode);
                if (template != null)
                {
                    // EntityCollection entities = SavedQueryManager.GetEntityies(_caller, template, extraQueryExpression);
                }

                ExportSetting setting = new ExportSetting();
                //setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.csv", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
                setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.xls", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));

                string[] fieldIds = fields.Split(',');
                foreach (string str2 in fieldIds)
                {
                    MapColumn mapCol = new MapColumn();
                    mapCol.SourceColumn = str2;
                    Supermore.EntityFramework.Templates.TemplateField tf = template.GetField(str2);
                    if (tf != null)
                    {
                        mapCol.DestinationColumn = tf.Title;
                    }
                    else
                        mapCol.DestinationColumn = str2;

                    setting.MapColumns.Add(mapCol);
                }

                //mapCol = new MapColumn();
                //mapCol.SourceColumn = "GenderCode";
                //mapCol.DestinationColumn = "性别";
                //setting.MapColumns.Add(mapCol);
                NPOIExportManager exportManager = new NPOIExportManager();
                //ExportManager exportManager = new ExportManager();
                setting.Template = template;
                setting.CallContext = _caller;

                exportManager.Template = template;
                exportManager.CallContext = _caller;
                exportManager.QueryExpression = extraQueryExpression;
                exportManager.Export(setting);

                //DownloadFile(setting.FileName, exportFileName + ".csv");
                DownloadFile(setting.FileName, exportFileName + ".xls");

            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }

        #region  视图导出
        void ExportGridExcel()
        {
            //string filterQuery = this.Request["filterQuery"];
            //string templateObjectCode = this.Request["objecttypecode"];
            //string exportFileName = this.Request["name"];
            //string fields = this.Request["fields"];
            //string orderField = this.Request["order"];
            //string queryView = this.Request["queryView"];
            string exportFileName = "attendmonth_" + DateTime.Now.ToString("yyyyMMddHHmmss");
            Youyou.Export.ExportSetting setting = new Youyou.Export.ExportSetting();
            //setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.csv", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));
            setting.FileName = Supermore.IOPaths.ExportFilePath + "\\" + string.Format("{0}\\{1}\\{2}.xls", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.ToString("yyyyMMddHHmmss"));

            //int typeCode = MainUtil.GetInt(templateObjectCode, 0);
            //Template template = TemplateManager.GetTemplate(_caller.OrganizationId, typeCode);
            //if (template != null)
            //{
            //    // EntityCollection entities = SavedQueryManager.GetEntityies(_caller, template, extraQueryExpression);
            //}
            string msg = Request["message"];
            JObject jObj = (JObject)JsonConvert.DeserializeObject(msg);
            string queryView = (string)jObj["queryView"];
            //string filterQuery = (string)jObj["filterQuery"];
            JArray filterQuery = (JArray)jObj["filterQuery"];
            JArray fieldIds = (JArray)jObj["fields"];

            //string fieldNames = MainUtil2.ArrayToString(fieldIds, ',');
            string fieldNames = "";
            int i=0;
            foreach (JObject f in fieldIds)
            {
                if (i > 0)
                    fieldNames += ",";

               string fieldName =(string)f["name"];
               string fieldTitle = (string)f["title"];
               fieldNames += fieldName;
                Youyou.Import.MapColumn mapCol = new Youyou.Import.MapColumn();
                mapCol.SourceColumn = fieldName;
                mapCol.DestinationColumn = fieldTitle;//template.GetField(str2).Title;
                setting.MapColumns.Add(mapCol);
                i++;
            }
            QueryExpression extraQueryExpression = new QueryExpression();
            if (filterQuery != null)
            {
                foreach (JObject f in filterQuery)
                {
                    string name = (string)f["name"];
                    string oper = (string)f["operator"];
                    JArray vals = (JArray)f["value"];
                    ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(oper);
                    OperatorType operatorType = QueryUtil.GetOperatorType(condOperator);
                    if (operatorType == OperatorType.NoValue)
                    {
                        extraQueryExpression.Criteria.AddCondition(name, condOperator);
                    }
                    else
                    {
                        int len = vals.Count;
                        string[] values = new string[] { };
                        int j = 0;
                        foreach (string val in vals)
                        {
                            Array.Resize<string>(ref values, j + 1);
                            values[j] = val;
                            j++;
                        }
                        extraQueryExpression.Criteria.AddCondition(name, condOperator, values);
                    }
                }
            
            }
            //if (!string.IsNullOrEmpty(filterQuery))
            //{
            //    string[] conds = filterQuery.Split('\n');
            //    foreach (string condLine in conds)
            //    {
            //        if (string.IsNullOrEmpty(condLine)) continue;
            //        string[] v = condLine.Split('\t');
            //        string fValue = v[2];
            //        if (!string.IsNullOrEmpty(fValue))
            //        {
            //            ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
            //            string[] values = fValue.Split(',');
            //            extraQueryExpression.Criteria.AddCondition(v[0], condOperator, values);
            //        }
            //    }
            //}
            string whereSql = SqlServerSqlClauseQueryBuilder.ReadFilter(extraQueryExpression.Criteria);
            if (!string.IsNullOrEmpty(whereSql))
                whereSql = " Where " + whereSql;

            Youyou.Export.NPOISqlExportManager exportManager = new Youyou.Export.NPOISqlExportManager();
            setting.QueryView = queryView;
            setting.QuerySQL = string.Format("SELECT {0} FROM {1} {2} ", fieldNames,queryView, whereSql);
            setting.CallContext = _caller;
            exportManager.CallContext = _caller;
            exportManager.Export(setting);

            DownloadFile(setting.FileName, exportFileName + ".xls");
        }
        #endregion

        private void DownloadFile(string file, string fileName)
        {
            string mineType = "application/octet-stream";
            Response.Clear();
            Response.ContentType = mineType;

            string fName = HttpUtility.UrlEncode(fileName, System.Text.UTF8Encoding.UTF8);
            string dowloadFile = "";
            dowloadFile = fName;
            //add header
            Response.AddHeader("Content-Disposition", "attachment;filename=" + dowloadFile);
            //download
            try
            {
                if (File.Exists(file))
                {
                    using (FileStream fs = new FileStream(file, FileMode.Open))
                    {
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            Response.OutputStream.Write(buffer, 0, length);
                            Response.Flush();
                        }
                    }
                }
                else
                {
                    Response.Write("文件不存在");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

                Supermore.Diagnostics.Trace.LogException(ex);
            }

            Response.End();
        }
    }
}