using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;

namespace WebClient.apps.wf
{
    public partial class InstanceNotifyRead : System.Web.UI.Page
    {
        string _procInstanceId = "";
        string _ruleLogId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CallContext caller = AppDataSource.GetCallContext();
            _procInstanceId = Request["InstanceId"];
            string sql = "";
            if (string.IsNullOrEmpty(_procInstanceId))
            {
                _ruleLogId = Request["RuleLogId"];
                
                sql = string.Format("SELECT ProcessInstanceId FROM WFRuleLog WHERE WFRuleLogId='{0}'", _ruleLogId);
                _procInstanceId = DatabaseTool.GetFirstCellStr(caller.CustomerID, sql, "");
               
            }
            sql = string.Format("SELECT Name FROM WFProcessInstance WHERE ProcessInstanceId='{0}'", _procInstanceId);
            string processInstName = DatabaseTool.GetFirstCellStr(caller.CustomerID, sql, "");

            this.NotifyReadMessage = string.Format("文件传阅: {0} 传阅 [ {1} ] 文件给您，请到OA首页或者APP待阅事务中查看。", caller.FullName, processInstName);
        }

        public string ProcessId { get; set; }
        public string ProcessName { get; set; }
        /// <summary>
        /// 流程实例ID
        /// </summary>
        public string ProcessInstanceId { get { return _procInstanceId; } set { _procInstanceId = value; } }
        /// <summary>
        /// 默认通知消息
        /// </summary>
        public string NotifyMessage { get; set; }
        /// <summary>
        /// 默认传阅与知会消息
        /// </summary>
        public string NotifyReadMessage { get; set; }
    }
}