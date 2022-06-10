<%@ Page Language="C#" AutoEventWireup="true" Codebehind="AMLogin.aspx.cs" Inherits="LkPduOA6_AMLogin.AMLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AM登录办公系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/main.css" type="text/css" rel="stylesheet">

    <script language="javascript" src="../script/LKSys_WindowControlScript.js"></script>

    <script src="../script/jquery-1.10.1.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        function loginOA(sUrl) {
            alert(sUrl);
            LKSYS_PubOpenWindow(sUrl, "LKOAMAIN", "", "");
        }
        function doLogin2()
        {
            var sPost, sRet;
            var sLoginName = document.getElementById("iptLoginName").value;
            var sPassWord = document.getElementById("iptPassWord").value;
            var sStyle = document.getElementById("iptStyle").value;
            var sUrl = "http://192.168.200.91/OuterAuth.ashx?userName=";
            sUrl += escape(sLoginName);
            //alert(sUrl);
            window.focus();
            //LKSYS_PubOpenWindow(sUrl, "AMGotoNewOA2015", "", "", null);
            //var windowAttribs = "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,width=800,height=800,top=0,left=0,fullscreen=yes,resizable=yes";
            var objNewWin = window.open(sUrl, 'AMGotoNewOA2015');
            window.opener = null;
            //window.close();
        }
        function doLogin() {
            var sPost, sRet;
            var sLoginName = document.getElementById("iptLoginName").value;
            var sPassWord = document.getElementById("iptPassWord").value;
            var sStyle = document.getElementById("iptStyle").value;
            var sUrl;

            //alert(sLoginName); 
            //alert(sPassWord);

            sPost = "<Qry><Function>WriteAMLoginInfo</Function><LoginName>" + sLoginName + "</LoginName><PassWord>" + sPassWord + "</PassWord></Qry>";
            //sRet = LKSYS_postform("Login_Return_XML.aspx",sPost);
            sRet = "aa";
            //alert(sRet);
            if (sRet != "") {
                //sUrl = "lkmsglogin_index.aspx?ID=" + sRet;
                sUrl = "AMToOA.aspx?loginname=" + escape (sLoginName) + "&sp=" + escape(sPassWord) + "";
                // alert(sUrl);
                if (sStyle == "1")	//点击页签
                {
                    LKSYS_PubOpenWindow(sUrl, "LKOAMAIN", "", "",null);
                    //window.open(sUrl, "xxy", "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=5,height=5,top=0,left=0,fullscreen=0");
                }
                else	//点击菜单
                {
                    //以全屏方式
                    window.focus();
                    LKSYS_PubOpenWindow(sUrl, "AMGotoLKOA6", "", "",null);
                    window.opener = null;
                    window.close();

                    //不以全屏方式
                    //location.href = sUrl;					
                }
            }
            else {
                alert("缺少必要的参数，无法进入到办公系统");
            }
        }
        function kq(type) {
        if(isVpn())
        {
            var sLoginName = document.getElementById("iptLoginName").value;
            var sPassWord = document.getElementById("iptPassWord").value;

            $.ajax({
                type: 'POST',
                url: '../PduOA5_CheckTime/Login_Return_XML.aspx?loginname=' + escape(sLoginName) + '&d=15&type=' + type,
                async: false,
                contentType: 'application/x-www-form-urlencoded',
                data: '',
                success: function(data) {
                    alert(data);
                },
                error: function(err) {
                    sRet = err.responseText;
                    alert(sRet);

                },
                dataType: 'html'

            });
}
        }
          function isVpn()
         {
                 var addIp='addIp'+'<%= Request.ServerVariables.Get("Remote_Addr").ToString() %>';
if(addIp.indexOf("192.168")>0)
return true;
else
{
            alert("不允许通过vpn来签到签退！");
return false;
}
}
        function showDiv()
        {
           var sLoginName = document.getElementById("iptLoginName").value;
            var sPassWord = document.getElementById("iptPassWord").value;

        $.ajax({
                type: 'POST',
                url: '../PduOA5_CheckTime/Login_Return_XML.aspx?loginname=' + escape(sLoginName) + '&d=15&type=',
                async: false,
                contentType: 'application/x-www-form-urlencoded',
                data: '',
                success: function(data) {
                    if(data.indexOf("考勤参数")>0)
                    $("#divid").hide();
                },
                error: function(err) {
                    sRet = err.responseText;
                    alert(sRet);

                },
                dataType: 'html'

            });

        }
        function Login(){
        var sea=location.search.replace("loginname=","username=").replace("sp=","password=")+"&command=login";
        var url="AMSSO.htm"+(sea);
                    LKSYS_PubOpenWindow(url, "AMSSO", "", "",null);
   
}
    </script>

</head>
<body oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <form id="form1" runat="server">
        <div>
            <p align="center" style="margin-top: 5px">
                <a href="javascript:doLogin();">进入办公系统</a>
            </p>
            <p align="center" style="margin-top: 5px">
                <a href="javascript:doLogin2();">进入新办公系统</a>
            </p>
             <p align="center" style="margin-top: 5px">
                <a href="#" onclick="Login();">进入登录统一平台</a>
            </p>
            <div id="divid">
                <p align="center" style="margin-top: 5px">
                    <a href="javascript:kq(0);">签到</a>
                </p>
                <p align="center" style="margin-top: 5px">
                    <a href="javascript:kq(1);">签退</a>
                </p>
            </div>
            <input id="iptLoginName" type="hidden" runat="server" />
            <input id="iptPassWord" type="hidden" runat="server" />
            <input id="iptStyle" type="hidden" runat="server" />
            <input id="logingResult" type="hidden" runat="server" value="" />
        </div>
    </form>

    <script language="javascript">
        window.onload = function() {
            if (document.getElementById("iptStyle").value == "1") {
                 //doLogin();
                              
            }
            if (document.getElementById("iptStyle").value == "2") {
                var sLoginName = document.getElementById("iptLoginName").value;
                var sPassWord = document.getElementById("iptPassWord").value;
                var scrWidth = screen.availWidth;
                var scrHeight = screen.availHeight;
                moveTo(0, 0);
                resizeTo(scrWidth, scrHeight);
                location.href = "AMToOA.aspx?loginname=" +escape(sLoginName) + "&sp=" + sPassWord + "";
            }
            showDiv();
        }
    </script>

</body>
</html>
