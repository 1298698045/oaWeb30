using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore.Resources;
using Supermore.Security.Accounts;
using Supermore.Web;


namespace secur
{
    public partial class oa_signIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string lang = ""; //WebUtil.GetCookieValue("SM_CLIENT_LANGUAGE");

            if (!Page.IsPostBack)
            {
                lang = Request["hl"];
                //this.LoginAccount1.Language = lang;
                //<cc1:LoginAccount ID="LoginAccount1" runat="server" />
                string error =  WebUtil.GetQueryString("ec");
                if (!string.IsNullOrEmpty(error))
                {

                    Supermore.Security.Accounts.LoginStatus loginStatus = (Supermore.Security.Accounts.LoginStatus)Enum.Parse(typeof(Supermore.Security.Accounts.LoginStatus), error);
                    switch (loginStatus)
                    {
                        case Supermore.Security.Accounts.LoginStatus.PasswordWrong:
                            //this.errormsg_Passwd.Text = AppResourceManager.Default.GetString("security_login_passwordiswrong");
                            break;
                        case Supermore.Security.Accounts.LoginStatus.UserNotExist:
                            //this.errormsg_UserName.Text = AppResourceManager.Default.GetString("security_login_usernotexist");
                            break;
                        case Supermore.Security.Accounts.LoginStatus.NotActive:
                            //this.errormsg_UserName.Text = AppResourceManager.Default.GetString("security_login_usernotactive");
                            break;
                    }
                }
                
            }
        }
    }
}