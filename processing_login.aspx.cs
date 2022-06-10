using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore.Web;
using System.Threading;

using System.Net;

using Supermore.Security;
using Supermore.Security.Accounts;
using Supermore.Data;
using Supermore.Configuration;

using Newtonsoft.Json.Linq;

namespace Supermore
{
    public partial class processing_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sourcetype = Request["sourcetype"];
            LoginUserResult loginResult = null;
            string urlLogin = Supermore.Configuration.Settings.GetSetting("Page.login");
            string url1 = "";
            string retURL = Request["retURL"];
            if (sourcetype == "0") //website
            {
                string usrName = Request["username"];
                string pwd = Request["pw"];
                usrName = usrName.Trim();
                pwd = pwd.Trim().Replace(" ", "");
                usrName = usrName.Replace("'", "");
                if (string.IsNullOrEmpty(usrName) || string.IsNullOrEmpty(pwd))
                {
                    url1 = string.Format("{0}?ec={1}", urlLogin, 2);
                    //Supermore.Diagnostics.Trace.LogToFile(url1, "login.txt");
                    Response.Redirect(url1, false);
                    return;
                }

                string checkLicenseStr = string.Empty;
                loginResult = LoginHelper.LoginSystem(usrName, pwd);
                if (loginResult == null)
                {
                    url1 = string.Format("/secur/signIn.aspx?ec={0}", 3);
                    Response.Redirect(url1, false);
                }
                if (loginResult.Status == LoginValidateStatus.Success)
                {
                    string remoteIp = this.Request.ServerVariables["REMOTE_ADDR"];
                    string browser = this.Request.Browser.Browser + this.Request.Browser.Version;
                    UserManager.RecordLoginPassword(usrName, remoteIp, browser);
                    CallContext caller = AppDataSource.GetCallContext();
                    SecurityAuth.LoginHistory(caller, caller.UserID, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), remoteIp, "应用程序", "成功", browser, this.Request.UserHostAddress);

                    string orgId = loginResult.User.OrganizationId.ToString();
                    WebUtil.SetSessionValue("SM_CUSTOMER_ID", caller.CustomerID);
                    if (!string.IsNullOrEmpty(orgId))
                        Supermore.WebContext.OrganizationId = orgId;
                    WebUtil.SetCookieValue("Sys_EmployeeId", loginResult.User.EmployeeId);
                    Supermore.WebContext.SetCallContext(caller, true);

                    bool addPhoneNumber = Settings.GetBoolSetting("AddPhoneNumber.Enabled", true);
                    var token = DateTime.Now.ToString("yyyyMMddHHmmss");
                    url1 = string.Format("/home/home.aspx?t=home&customerid={0}&token={1}&pageName=oa", caller.OrganizationId.ToString(), token);
                    //url1 = string.Format("/home/home.aspx?t=home&token={0}&pageName=oa", token);
                    if (addPhoneNumber && !MainUtil2.IsMobile(loginResult.User.MobilePhone))
                    {
                        // if ()
                        url1 = "/_ui/identity/phone/AddPhoneNumber?d=m&amp;retURL=%2Fhome%2Fhome.aspx?t=home";
                    }
                    else
                    {
                        bool strongPolicy = Settings.GetBoolSetting("Security.Password.StrongPolicy", true);
                        if (strongPolicy && IsWeakPassword(pwd))
                        {
                            url1 = "/secur/identity/ChangePwd.aspx";
                        }
                        else
                        {
                            string routePage = Settings.GetSetting("Page.Login.RouteUrl");
                            if (!string.IsNullOrEmpty(routePage))
                            {
                                url1 = routePage;
                                url1 += "?token=" + DateTime.Now.ToString("yyyyMMddHHmmss");
                            }
                        }
                    }
                    Response.Redirect(url1, false);
                }
                else
                {
                    int errCode = MainUtil.GetInt(loginResult.Status, 1);
                    if (loginResult.Status == LoginValidateStatus.Locked)
                    {
                        errCode = 5;
                    }
                    //url1 = string.Format("/secur/signIn.aspx?ec={1}", urlLogin, errCode);
                    url1 = string.Format("/secur/signIn.aspx?ec={0}", errCode);
                    //Response.Redirect(url1, false);
                }
                //  Supermore.Diagnostics.Trace.LogToFile(url1, "login.txt");
                Response.Redirect(url1, false);
            }
            //else if (sourcetype == "101")
            //{
            //    string appId = Request["appId"];
            //    string token = Request["token"];
            //    Supermore.Diagnostics.Trace.LogToFile(appId, "test1111.txt");
            //    string url = "http://111.111.3.152:8085/api/userByPortal";
            //    SortedList<string, string> haderList = new SortedList<string, string>();
            //    haderList.Add("appId", appId);
            //    haderList.Add("token", token);
            //    PostData _PostData = new PostData();
            //    string Json = JsonConvert.SerializeObject(_PostData);
            //    string value = MyHttpWebRquest.HttpPost(url, haderList, Json);
            //    //string value = "{\"status\":\"0\",\"staffCode\":\"xxx\",\"userInfo\":{\"account\":\"jackliu\",\"userName\":\"jackliu\",\"staffCode\":\"xxx\",\"position\":\"xxx\",\"phoneNumber\":\"xxx\",\"sex\":\"xxx\"}}";
            //    if (value != null && value != "")
            //    {
            //        JObject jsonObj = ExtractObj(JObject.Parse(value));
            //        if (jsonObj["status"].ToString() == "0")
            //        {
            //            string remoteIp = this.Request.ServerVariables["REMOTE_ADDR"];
            //            string browser = this.Request.Browser.Browser + this.Request.Browser.Version;
            //            string userCode = jsonObj["userInfo"]["account"].ToString();
            //            string userName = jsonObj["userInfo"]["userName"].ToString();
            //            Supermore.Diagnostics.Trace.LogToFile("jackliu", "test1111.txt");
            //            UserManager.RecordLoginPassword(userName, remoteIp, browser);
            //            loginResult = LoginHelper.LoginSystemFromOwner(userCode);
            //            if (loginResult.Status == LoginValidateStatus.Success)
            //            {
            //                CallContext caller = AppDataSource.GetCallContext();
            //                SecurityAuth.LoginHistory(caller, caller.UserID, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), remoteIp, "应用程序", "成功", browser, this.Request.UserHostAddress);
            //                string orgId = loginResult.User.OrganizationId.ToString();
            //                WebUtil.SetSessionValue("SM_CUSTOMER_ID", caller.CustomerID);
            //                if (!string.IsNullOrEmpty(orgId))
            //                    Supermore.WebContext.OrganizationId = orgId;
            //                WebUtil.SetCookieValue("Sys_EmployeeId", loginResult.User.EmployeeId);
            //                Supermore.WebContext.SetCallContext(caller, true);
            //                bool addPhoneNumber = Settings.GetBoolSetting("AddPhoneNumber.Enabled", true);
            //                url1 = string.Format("/home/home.aspx?t=home&token={0}", token);
            //                if (addPhoneNumber && !MainUtil2.IsMobile(loginResult.User.MobilePhone))
            //                {
            //                    url1 = "/_ui/identity/phone/AddPhoneNumber?d=m&amp;retURL=%2Fhome%2Fhome.aspx?t=home";
            //                }
            //                else
            //                {
            //                    bool strongPolicy = Settings.GetBoolSetting("Security.Password.StrongPolicy", true);
            //                    string routePage = Settings.GetSetting("Page.Login.RouteUrl");
            //                    if (!string.IsNullOrEmpty(routePage))
            //                    {
            //                        url1 = routePage;
            //                        //url1 += "?token=" + DateTime.Now.ToString("yyyyMMddHHmmss");
            //                    }
            //                }
            //                Response.Redirect(url1, false);
            //            }
            //            //string userName = jsonObj["userInfo"]["userName"].ToString();
            //            //string staffCode= jsonObj["userInfo"]["staffCode"].ToString();
            //        }
            //    }
            //    //return value;
            //}
            else if (sourcetype == "100") //从AM登录
            {
                string loginname = Request["loginname"];
                string pwd = Request["sp"];
                string checkLicenseStr = string.Empty;
                loginResult = LoginHelper.LoginSystem(loginname, pwd);
                if (loginResult.Status == LoginValidateStatus.Success)
                {
                    string remoteIp = this.Request.ServerVariables["REMOTE_ADDR"];
                    string browser = this.Request.Browser.Browser + this.Request.Browser.Version;
                    UserManager.RecordLoginPassword(loginname, remoteIp, browser);
                    //WebUtil.SetCookieValue("SM_USER_TYPE", "系统用户");
                    CallContext caller = AppDataSource.GetCallContext();
                    SecurityAuth.LoginHistory(caller, caller.UserID, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), remoteIp, "AM", "成功", browser, this.Request.UserHostAddress);
                    Response.Redirect("/home/home.aspx?tab=home&t=home");
                }
            }
            //else if (sourcetype == "1") //sina
            //{
            //    //string code = Request["code"];
            //    //SinaWeiboConnector.GetAccessTokenByAuthorizationCode(code);
            //    //WebUtil.SetCookieValue("SM_USER_TYPE", "新浪微博");

            //}
            //else if (sourcetype == "2") //qq
            //{
            //    WebUtil.SetCookieValue("SM_USER_TYPE", "腾讯微博");
            //}
            //else if (sourcetype == "3") //renren
            //{
            //    WebUtil.SetCookieValue("SM_USER_TYPE", "人人网");
            //}
            else if (sourcetype == "8") //taobao
            {
                string uid = Request["uid"];
                string token = Request["token"];
                //loginResult = LoginHelper.LoginTaobao(uid, token);
                //if (loginResult.Status == Security.Accounts.LoginStatus.Success)
                //{
                //    string remoteIp = this.Request.ServerVariables["REMOTE_ADDR"];
                //    string browser = this.Request.Browser.Browser + this.Request.Browser.Version;
                //    WebUtil.SetCookieValue("SM_USER_TYPE", "淘宝");
                //    UserManager.RecordLoginPassword(uid, remoteIp, browser);
                //    Response.Redirect("/home/home.aspx?activepage=home&sourcetype=8");
                //}
                //else
                //{
                //    Response.Redirect("/secu/signIn.aspx?error=" + loginResult.Status.ToString());
                //}
            }
            else
            {
                Response.Redirect(string.Format("{0}?ec={1}", urlLogin, 2), false);
                //Response.Redirect("/secur/signIn.aspx?ec=2");
            }
        }

        public static JObject ExtractObj(JObject job)
        {
            foreach (var item in job)
            {
                try
                {
                    //得到键当前值
                    string itemStr = item.Value.ToString();
                    //尝试转化为对象(可能失败)
                    JObject itemJObj = JObject.Parse(itemStr);
                    //递归调用
                    JObject robj = ExtractObj(itemJObj);
                    //为当前键更新为对象值
                    job[item.Key] = robj;

                }
                catch
                {
                }
            }
            return job;
        }

        bool IsWeakPassword(string pwd)
        {
            if (MainUtil2.IsNumericString(pwd))
            {
                return true;
            }
            if (pwd == "666666" || pwd == "801206" || pwd == "000000" || pwd == "aaaaaa")
                return true;
            return false;
        }
    }
}