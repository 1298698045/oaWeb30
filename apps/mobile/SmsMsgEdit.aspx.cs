using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;

using OA.Web.UI.FieldControls;
using Supermore.Mobile;
using System.Data;
using Supermore.Security;
using System.Text;

namespace WebClient.apps.mobile
{
    public partial class SmsMsgEdit : System.Web.UI.Page
    {
        CallContext caller = null;
        //string businessUnitIdControlHtml = "";
        string ownerName = "";
        //int typeCode = 1;
        //string parentId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            //Postfix = this.caller.BussinessUnitName;
            this.ownerName = caller.UserName;
            string clone = Request["clone"];
            GetGroups();
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
            this.SmsName = "复制 " + entity.Name;
            string sql = "SELECT ContactId,FullName FROM SmsMessageLogBase_{0} WHERE SendId='{1}'";
            sql = string.Format(sql, caller.CustomerCode, cloneId);
            DataSet ds = DatabaseTool.GetDataSet(caller.CustomerID, sql);
            int c = 0;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (c > 0)
                {
                    this.ReceiverIds += ",";
                    this.ReceiverNames += ",";
                }
                //Entity addr = EntityManager.GetEntity(caller, ObjectTypeCodes.AddressList, sql);
                string name = StringUtil.GetString(dr["FullName"]);
                string userId = StringUtil.GetString(dr["ContactId"]);
                //Guid userId = MainUtil.GetGuid(dr["ContactId"]);
                //string mobile = StringUtil.GetString(dr["Mobile"]);
                this.ReceiverIds += userId;
                this.ReceiverNames += name;
                c++;
            }
          
        }
        
        void GetGroups()
        {
            EntityCollection cols = GroupManager.GetPublicGroups(caller);
           StringBuilder sb = new StringBuilder();
           foreach (Entity entity in cols)
           {
               Supermore.Organization.Group group = new Supermore.Organization.Group(entity);
               sb.AppendFormat("<div><input type='checkbox' name='pGroup' value='{0}' />{1}({2})</div>", entity.ID, entity.Name,group.Quantity);
           }
          GroupHTML= sb.ToString();
          sb = new StringBuilder();

          cols = GroupManager.GetPersonalGroups(caller);
          foreach (Entity entity in cols)
          {
              Supermore.Organization.Group group = new Supermore.Organization.Group(entity);
              sb.AppendFormat("<div><input type='checkbox' name='pGroup' value='{0}' />{1}({2})</div>", entity.ID, entity.Name, group.Quantity);
          }
          PersonGroupHTML = sb.ToString();
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
            //string receiveIds = Request["p24_lktp"];
            string mobile = Request["manualNums"];
            string strGroup = Request["pGroup"];
            if (string.IsNullOrEmpty(name))
            {
                name ="短信发送"+ DateTime.Now.ToString("yyyy-MM-dd");
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
            if (string.IsNullOrEmpty(receiveIds) && string.IsNullOrEmpty(strGroup))
            {
                return;
            }
            string ownContactIds = Request["p25_lktp"];
            string postFix = Request["postFix"];
            string userSign = Settings.GetSetting("Sms.Signature", "");
            string smsMsg = userSign + content + " " + postFix;
            //bool isSaved = SmsMessageManager.CreateCampaignSmsActivity(caller, name, smsMsg, sendTime, testmobile, receiveIds, "", strGroup);
            bool isSaved = Supermore.Mobile.SmsManager.CreateCampaignSmsActivity(caller, name, smsMsg, sendTime, testmobile, receiveIds, "", strGroup, ownContactIds);
            string retURL = Request["retURL"];
            if (isSaved)
            {
                Response.Redirect(retURL);
            }
        }
        //string SaveManulMobile()
        //{
        //    string saveFile = "";
        //    string mobiles = Request["mobiles"];
        //    if (!string.IsNullOrEmpty(mobiles))
        //    {
        //        saveFile = IOPaths.SmsUplodFiles + "\\uploadmanul_" + DateTime.Now.ToString("yyyyMMddhhmmss") + ".txt";
        //        if (FileManager.FileExists(saveFile))
        //        {
        //            saveFile = IOPaths.SmsUplodFiles + "\\uploadmanul2_" + DateTime.Now.ToString("yyyyMMddhhmmss") + ".txt";
        //        }
        //        Supermore.IO.FileUtil.AppendToFile(saveFile, mobiles);
        //        return saveFile;
        //    }
        //    return string.Empty;
        //}


        public string GroupHTML { get; set; }

        public string PersonGroupHTML { get; set; }

        public string OwnerName { get { return ownerName; } set { ownerName = value; } }

        public string SmsName { get; set; }
        public string Message { get; set; }        
        public string TestMobile { get; set; }

        public string ReceiverIds { get; set; }
        public string ReceiverNames { get; set; }

        public string Postfix { get; set; }
    }
}