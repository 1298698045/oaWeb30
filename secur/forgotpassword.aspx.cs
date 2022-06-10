using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Mobile;
using Supermore.Security;

namespace WebClient.secur
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["continue"] != null)
            {
                //reset pwd
                // 
                string userName = Request["un"];
                SystemUser systemUser = null;
                CallContext caller = null;
                string newPwd = SecurityAuth.ResetPassword(userName, ref systemUser, ref caller);
                //if (systemUser != null)
                //{
                //    if (!string.IsNullOrEmpty(systemUser.MobilePhone))
                //    {
                //        string msg = string.Format("新密码是：{0},您可以登录后在“我的设置”中修改密码。", newPwd);
                //        bool beenSent = SmsMessageManager.PushSmsQueue(caller, systemUser.ID, systemUser.FullName + userName, systemUser.MobilePhone, msg, 1, DateTime.Now, "", "");
                //    }
                //}
                Response.Redirect("signIn.aspx");
            }
        }
    }
}