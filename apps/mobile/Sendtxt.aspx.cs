using Supermore.Configuration;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.Mobile;
using Supermore.Security.Accounts;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Supermore.apps.mobile
{
    /// <summary>
    /// 发送短信
    /// </summary>
    public partial class Sendtxt : System.Web.UI.Page
    {
        CallContext caller = null;
        string ownerName = "";

      

        public string GroupHTML { get; set; }

        public string PersonGroupHTML { get; set; }

        public string OwnerName { get { return ownerName; } set { ownerName = value; } }

        public string Name { get; set; }
        public string Message { get; set; }
        public string TestMobile { get; set; }

        public string ReceiverIds { get; set; }
        public string ReceiverNames { get; set; }

        public string Postfix { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            Postfix = this.caller.BussinessUnitName;
            this.ownerName = caller.UserName;
            
            string clone = Request["clone"];

           
            if (clone == "1")
            {
                GetData();
                //this.ReceiverNames=this.ReceiverNames.tr
            }
            else if (Request["id"] != null)
            {
                GetData();
            }
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                Response.Redirect(cancelURL);
            }
            if (Request["save"] != null)
            {
                SaveData(false, false);
            }
            if (Request["save_send"] != null)
            {
                SaveData(true, false);
            }
            if (Request["save_approve"] != null)
            {
                SaveData(true, true);
            }

        }
       

        void GetData()
        {
            string cloneId = Request["id"];
            CampaignSmsEntity entity = SmsMessageManager.GetCampaignSms(caller, new Guid(cloneId));
            this.Message = entity.Message;
            this.Name = entity.Name;
            this.TestMobile = entity.TestMobile;   
            

        }


        void SaveData(bool saveNew, bool submitApprove)
        {

            //string id = Request["id"];
            //bool isUpdated = false;
            //Guid orgId = new Guid(caller.CustomerID);
            //Entity entity = null;

            string name = Request["Name"];
            string content = Request["smsContent"];
            string strSendTime = "";
            string testmobile = Request["testmobile"];
            string receiveIds = Request["p24_lkid"];
            string mobile = Request["manualNums"];
            //string strGroup = Request["pGroup"];
            if (string.IsNullOrEmpty(name))
            {
                name = "短信发送" + DateTime.Now.ToString("yyyy-MM-dd");
            }
            if (!string.IsNullOrEmpty(mobile))
            {
                string[] nums = mobile.Split('\r');
                string strNums = MainUtil2.ArrayToString(nums, ',');
                if (!string.IsNullOrEmpty(testmobile))
                    testmobile += "," + strNums;
                else
                    testmobile = strNums;

                testmobile = testmobile.TrimStart(',');
            }
            DateTime sendTime = DateTime.Now;
            if (Request["radiotime"] == "2")
            {
                strSendTime = string.Format("{0} {1}:{2}", Request["scheduledate"], Request["hour"], Request["minute"]);
                sendTime = DateTime.Parse(strSendTime);
            }
          
            string postFix = Request["postFix"];
            string userSign = Settings.GetSetting("Sms.Signature", "");
            string smsMsg = userSign + content + " " + postFix;
       
            bool isSaved = SmsMessageManager.CreateCampaignSmsActivity(caller, name, smsMsg, sendTime, testmobile, mobile, "", "");


            string retURL = Request["retURL"];
            if (isSaved)
            {
                Response.Redirect(retURL);
            }
        }

         

      

    }


}
