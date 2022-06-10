using Newtonsoft.Json;
using Supermore.Data;
using Supermore.Mobile;
using Supermore.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Youyou.Actions;
using Youyou.Security.Actions;

namespace Supermore.secur
{
    /// <summary>
    /// Summary description for VerifySms
    /// </summary>
    public class VerifySms : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string method = context.Request["method"];
            switch (method)
            {
                case "sendsmscode": //发送验证码
                    string userName = context.Request["userName"];
                    string mobilePhone = context.Request["mobilePhone"];
                    FindPasswordSendVerifyCode fcode = new FindPasswordSendVerifyCode(userName, mobilePhone);
                   
                    context.Response.Write(fcode.ProcessAction());
                    break;
                case "verifysmscode": //验证验证码
                    string code = context.Request["code"];
                    string phone = context.Request["mobilePhone"];
                    FindPasswordConfirmVerifyCode ycode = new FindPasswordConfirmVerifyCode(code, phone);
                    context.Response.Write(ycode.ProcessAction());
                    break;
                case "retrievepwd": //重置密码
                    string newPwd = context.Request["newPwd"];
                    string confirmPwd = context.Request["confirmPwd"];
                    string username = context.Request["username"];
                    string xphone = context.Request["phone"];
                    SysOARetrievePwd rpwd = new SysOARetrievePwd(username, xphone);
                    context.Response.Write(rpwd.ProcessAction());
                    break;
            }
            
        }
        public void Send(HttpRequest Request)
        {
            string userName = Request["userName"];
            string mobilePhone = Request["mobilePhone"];
            if (string.IsNullOrEmpty(mobilePhone))
            {

            }

            string msg = "您的验证码是：{0}，验证码10分钟有效,请注意保管。";
            LoginUserResult result = SecurityAuth.GetUser(userName);
            if (result.User != null)
            {
                if (mobilePhone == result.User.MobilePhone)
                {
                   

                    CallContext caller = AppDataSource.GetCallContext(result.User);

                    //往SmsVerificationBase 表插入记录

                    //电话号码存在
                    Guid sendBatchId = Guid.NewGuid();
                    Guid[] userids = new Guid[] { result.User.ID };
                    //发送验证码
                    SmsMessageManager.PushSmsQueueAndSend(caller, userids, msg, 2, DateTime.Now, sendBatchId);
                }
            }

        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}