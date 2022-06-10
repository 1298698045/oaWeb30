using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using OptimaJet.Workflow;
using Supermore;
using Supermore.Data;
using OptimaJet.Workflow.Core.Model;

namespace WebClient.apps.wf
{
    public partial class NotifyMem : System.Web.UI.Page
    {
        Guid instanceId = Guid.Empty;
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string msg = Request["aboutMe"];
            bool notifySms = true;
            bool notifyEmail = true;
            bool notifyMessager = true;
            //string[] members = null;
            caller = AppDataSource.GetCallContext();
            instanceId = new Guid(Request["InstanceId"]);
            GetTemp();
            string title = "流程催办";
            // WfInstanceManager.NotifyRelatedMembers(instanceId, "", 1,members, msg, notifySms, notifyEmail);
            if (!string.IsNullOrEmpty(msg))
            {
                if (Request["chkSms"] == null)                    
                    notifySms = false;
                if (Request["chkEmail"] == null)                    
                    notifyEmail = false;
                if (Request["chkMessage"] == null)
                    notifyMessager = false;
                //notifySms = MainUtil.GetBool(Request["chkSms"], true);
                //notifyEmail = MainUtil.GetBool(Request["chkEmail"], true);

                WfInstanceManager.RemindParticipantor(caller, instanceId, title, msg, notifyEmail, notifySms, notifyMessager);

                RegisterParamsHiddenFieldsControl1.AddHiddenValue("InstanceId", Request["InstanceId"]);
            }
        }
        void GetTemp()
        {
            string msgTemp = "流程事务催办：你好，[ {0} ] 事务需要您办理，请登录OA或者手机速办理！";
            ProcessInstance instance = WfInstanceManager.GetProcessInstance(instanceId);
            this.MsgTemplate = string.Format(msgTemp, instance.Name);
        }
        public string MsgTemplate { get; set; }
    }
}