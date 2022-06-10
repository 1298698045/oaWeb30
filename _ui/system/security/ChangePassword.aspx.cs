using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;
using Supermore.Security ;


namespace WebClient._ui.system.security
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        CallContext caller = null;
        SystemUser systemUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            caller = AppDataSource.GetCallContext();
            systemUser = SecurityAuth.GetSystemUser(caller, new Guid(caller.UserID));
            if (Request["save"] != null)
            {
                SaveUser();
            }
            this.UserName = caller.UserName;
            this.LastChangePassword = systemUser.LastChangePassword;
            string errorCode = Request["error"];
            if (errorCode == "1")
            {
                this.ErrorMessage  = "新密码与验证密码不一致！";
            }
            if (errorCode == "2")
            {
                this.ErrorMessage = "修改失败！";
            }
            if (errorCode == "3")
            {
                this.ErrorMessage = "旧密码不正确！";
            }
            if (errorCode == "0")
            {
                this.ErrorMessage = "修改成功！";
            }
        }

        void SaveUser()
        {
            string retURL = Request["retURL"];
            string userId = caller.UserID;
            // bool isUpdated = false;
            Guid orgId = new Guid(caller.CustomerID);
                        
            string oldPwd = Request["p4"];
            string newPwd = Request["p5"];
            string newPwd2 = Request["p6"];
            string retURL2 = "";
            if (newPwd != newPwd2)
            {
                retURL2 = "/_ui/system/security/ChangePassword.aspx?error=1&setupid=ChangePassword&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo";
                Response.Redirect(retURL2);
                return;
            }
            try
            {
                bool isUpdate = SecurityAuth.ChangePassword(caller, oldPwd, newPwd, newPwd2);
                if (isUpdate)
                {
                    retURL2 = "/_ui/system/security/ChangePassword.aspx?error=0&setupid=ChangePassword&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo";
                    Entity entity = null;
                    if (string.IsNullOrEmpty(userId))
                    {
                        entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.SystemUser, orgId);
                    }
                    else
                    {
                        entity = EntityManager.GetEntity(caller, EntityTemplateIDs.SystemUser, new Guid(userId));
                     }
                    entity.BeginEdit();
                    entity.Fields["PasswordQ"].Value = Request["p2"];
                    entity.Fields["PasswordA"].Value = Request["p3"];
                    //entity.Fields["PasswordQ"].Value = Request["p2"];
                    //entity.Fields["PasswordA"].Value = Request["p3"];            //, 
                    entity.EndEdit();
                  
                }
                else 
                    retURL2 = "/_ui/system/security/ChangePassword.aspx?error=2&setupid=ChangePassword&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo";
            }
            catch (OldPasswordNotMatch notMatch)
            {
                string str1 = notMatch.Message;
                retURL2 = "/_ui/system/security/ChangePassword.aspx?error=3&setupid=ChangePassword&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo";
            }
            catch(Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }           
            Response.Redirect(retURL2);
        }
        public string UserName { get; set; }
        public string LastChangePassword { get; set; }
        public string ErrorMessage { get; set; }
    }
}