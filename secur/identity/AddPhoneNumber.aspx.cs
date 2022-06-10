using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Security;

namespace WebClient.secur.identity
{
    public partial class AddPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CallContext caller = AppDataSource.GetCallContext();
            this.FullName = caller.FullName + caller.UserName;
            if (Request["save"] != null)
            {
                string mobile = Request["p"];
                //SystemUser user = SecurityAuth.GetSystemUser(new Guid(caller.UserID));
                //this.FullName = user.FullName + user.UserName;
                string wEmail = Request["wEmail"];
                string workPhone = Request["wp"];
                string weChat = Request["wx"];
                if (!string.IsNullOrEmpty(workPhone))
                {
                    Supermore.Contacts.AddressListManager.UpdateWorkPhone(caller,caller.UserID,workPhone);
                }
                if (!string.IsNullOrEmpty(weChat))
                {
                    Supermore.Contacts.AddressListManager.UpdateWechat(caller, caller.UserID, weChat);
                }
                if (MainUtil2.IsMobile(mobile))
                {
                    SecurityAuth.UpdateUserMobile(caller, mobile);
                    //Response.Redirect("/home/home.aspx?t=home", true);
                    Response.Redirect("/secur/signIn.aspx",true);
                }
                else
                {
                    Response.Redirect("/_ui/identity/phone/AddPhoneNumber?d=m&amp;retURL=%2Fhome%2Fhome.aspx?t=home", true);
                }
            }
        }
        public string FullName { get; set; }
    }
}