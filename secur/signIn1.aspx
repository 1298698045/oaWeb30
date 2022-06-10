<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="secur.signIn" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="description" content=" 协同办公系统,OA,北京凤凰世纪科技有限公司。登录到您的帐户。" />
    <title>协同办公系统 - 客户安全登录页面</title>
    <!--<meta name="format-detection" content="telephone=no" />-->
    <link rel="stylesheet" type="text/css" href="/css/sfdc190_global.css" />
    <link rel="stylesheet" type="text/css" href="/css/sfdc192_page.css" />
  <style type="text/css">a{color: #0b7aae;}input.primary, .button, .btnPrimary{background: #3198d8;border: 1px solid #4176ba;}.button, .button, .btnPrimary, .btnPrimary {border: 1px solid, #1c78b1 (0.11,0.471,0.694);background: #2e8ec9;background: -moz-linear-gradient(bottom,  #2789c7 0%, #3f9fd9 100%);background: -webkit-gradient(linear, left bottom, left top, color-stop(0%,#2789c7), color-stop(100%,#3f9fd9));background: -webkit-linear-gradient(bottom,  #2789c7 0%,#3f9fd9 100%);background: -o-linear-gradient(bottom,  #2789c7 0%,#3f9fd9 100%);background: -ms-linear-gradient(bottom,  #2789c7 0%,#3f9fd9 100%);background: linear-gradient(bottom, #2789c7 0%, #3f9fd9 100%) bottom (0.153,0.537,0.78) to top(0.247,0.624,0.851)filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3f9fd9', endColorstr='#2789c7',GradientType=0 );} .button:hover, .button:focus, .btnPrimary:hover, .btnPrimary:focus {background: #278ac7 ( 0.153, 0.541, 0.78)}body{background-color:#2a94d6;}#footer, #footer a{color:#ffffff;}#content{background-color:#ffffff;}#content{border:1px solid #CCCCCC; border-radius: 3px;-moz-border-radius: 3px;-webkit-border-radius: 3px; padding:10px;}#left_side { float:left; width: 320px;}#right_side{text-align:right;vertical-align:top;}</style>
    <script type="text/javascript">       if (self == top) { document.documentElement.style.visibility = 'visible'; } else { document.write = ''; top.location = self.location; /*setTimeout(function () { document.body.innerHTML = ''; }, 1); window.self.onload = function (evt) { document.body.innerHTML = ''; };*/ }</script>
    <script>        var SFDCSessionVars = { "ic": false, "lh": false, "host": "", "le": false, "su": "#p# 已保存用户名", "sum": "#p# 个已保存用户名", "server": "", "im": false, "suo": "1 个已保存用户名" };</script>
    <script src="/jslibrary/SfdcSessionBase191.js"></script>
     <script src="/jslibrary/LoginHint191.js"></script>
    <!-- <script>        LoginHint.hideLoginForm();</script>  
  onload="lazyload();"
    -->
   <script type="text/javascript">
         function getCookie(c_name) {
             //debugger;
             var i, x, y, ARRcookies = document.cookie.split(";");
             for (i = 0; i < ARRcookies.length; i++) {
                 x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
                 y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
                 x = x.replace(/^\s+|\s+$/g, "");
                 if (x == c_name) {
                     //return unescape(y);
                     return decodeURIComponent(y);
                 }
             }
         }
       
   	    function loadUser() {
             var un = getCookie("SM_USER_NAME");
             //debugger;
             if (un != undefined) {
                 document.getElementById("username").value = un;
             }
             var errorCode = getQueryString("ec");
             if (errorCode == "1" || errorCode == "2" || errorCode == "3")
             {
                 document.getElementById("error").style.display = "block";
                 document.getElementById("error").innerText = "用户名或者密码错！";
             }
         }
         function getQueryString(name) {
             var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
             var r = location.search.substr(1).match(reg);
             if (r != null) return unescape(decodeURI(r[2])); return null;
         }
    </script>
</head>
<body onload="loadUser()">
    <table border="0" cellpadding="0" cellspacing="0" class="tablewrapper">
        <tr valign="middle">
            <td>
                <div id="login">
                    <div id="login_wrapper">
                        <div id="left_side">
                            <div id="login_component">
                                <div id="logo_wrapper">
                                    <a href="#">
                                        <img id="logo" class="logo_" src="/img/logo190.png" alt="OA" border="0" /></a></div>
                                <div id="loginwidget">
                                    <div id="manageheader" class="loginbox_container">
                                        <div id="backFromEdit">
                                            <a href="javascript:void(0);" onclick="LoginHint.dismissEdit();" id="hint_back_edit">
                                                返回</a></div>
                                        <br/>
                                        <div id="managetitle">
                                            管理用户名：</div>
                                        <div id="editscale">
                                            <div id="editlist">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="loginformarea">
                                        <div id="idscale" class="loginbox_container">
                                            <div id="hinttop">
                                                <div id="notMydomain" style="display: none;">
                                                    <a href="javascript:void(0);" onclick="DomainSwitcher.dismissCustomDomain();" id="hint_back_domain">
                                                        返回</a></div>
                                                <div id="hints" style="display: none;">
                                                    <a href="javascript:void(0);" onclick="LoginHint.showChooser();" id="hint_back_chooser">
                                                        返回</a></div>
                                                <div id="loginwith" style="display: none;">
                                                    选择用户名：</div>
                                                <div id="edit" style="display: none;">
                                                    <a href="javascript:void(0);" onclick="LoginHint.showEdit();">编辑</a></div>
                                            </div>
                                            <div id="chooser" style="display: none;">
                                                <div id="idlist">
                                                </div>
                                                <div id="another" style="display: none;">
                                                    <a href="javascript:void(0);" onclick="LoginHint.useNewIdentity();">使用其他用户名登录</a></div>
                                            </div>
                                            <div id="mydomainContainer" style="display: none;">
                                                <div class="loginbox_container">
                                                    <div onclick="document.getElementById('mydomain').value = ''; this.style.display='none'; document.getElementById('mydomain').focus();"
                                                        id="clrDomain" class="clrField" style="display: none;">
                                                        &nbsp;</div>
                                                    <form onsubmit="DomainSwitcher.handleMyDomain();return false;">
                                                    <div class="identity first">
                                                        <label for="mydomain" class="zen-assistiveText">
                                                            自定义域前缀</label><input type="text" placeholder="输入您的自定义域" value="" class="input identityinput"
                                                                name="mydomain" id="mydomain" onkeyup="DomainSwitcher.updateMyDomain(this, event);"></div>
                                                    </form>
                                                    <div id="mydomain_preview" class="loginbox_container">
                                                        https://DOMAIN.my..com</div>
                                                    <div class="loginbox_container">
                                                        <input type="hidden" id="mydomain_suffix" value=".my..com" /><input type="hidden"
                                                            id="community_suffix" value=".na1..com" />
                                                        <button class="button" id="mydomainContinue" name="Continue" onclick="DomainSwitcher.handleMyDomain();">
                                                                <span class="label">继续</span></button></div>
                                                    <div class="loginbox_container" id="mydomain_help">
                                                        示例：如果您的域是 https://company.my..com 请输入“company”。</div>
                                                </div>
                                            </div>
                                            <div id="theloginform">
                                                <form name="login" method="post" onsubmit="handleLogin();" action="/processing_login.aspx"   target="_top" novalidate="novalidate">
                                                <input type="hidden" id="pqs" name="pqs" value="?locale=cn" /><fieldset style="display: none">
                                                    <input type="hidden" name="sourcetype" value="0" />
                                                    <input type="hidden" name="un" value="" />
                                                    <input type="hidden" name="width" value="" />
                                                    <input type="hidden" name="height" value="" />
                                                    <input type="hidden" name="hasRememberUn" value="true" />
                                                    <input type="hidden" id="login_startUrl" name="startURL" value="" />
                                                    <input type="hidden" name="loginURL" value="" />
                                                    <input type="hidden" name="loginType" value="" />
                                                    <input type="hidden" name="useSecure" value="true" />
                                                    <input type="hidden" name="local" value="" />
                                                    <input type="hidden" name="lt" value="standard" />
                                                    <input type="hidden" name="qs" value="" />
                                                    <input type="hidden" name="locale" value="cn" />
                                                    <input type="hidden" name="oauth_token" value="" />
                                                    <input type="hidden" name="oauth_callback" value="" />
                                                    <input type="hidden" name="login" value="" />
                                                    <input type="hidden" name="serverid" value="" />
                                                    <input type="hidden" name="display" value="page" /></fieldset>
						                        <div id="error" class="loginError" style="display: none;">要访问此页面，您必须登录 。</div>
                                                <div class="loginbox_container" onclick="document.login.username.focus();">
                                                    <div onclick="LoginHint.clearUsr();" id="clrUsr" class="clrField" style="display: none;">
                                                        &nbsp;</div>
                                                    <div class="identity first">
                                                        <label for="username" class="zen-assistiveText">
                                                            用户名</label><span class="t"><img id="loginthumb" src="/img/user188.png" alt="用户名"
                                                                width="28" height="28" class="thumbnail" title="用户名" /></span><input type="email"
                                                                    placeholder="用户名" value="" class="input identityinput" name="username"
                                                                    id="username" /></div>
                                                </div>
                                                <div class="loginbox_container" onclick="document.login.password.focus();" style="">
                                                    <div onclick="document.getElementById('password').value = '';this.style.display='none';document.login.pw.focus();"
                                                        id="clrPw" class="clrField">
                                                        &nbsp;</div>
                                                    <div class="identity last">
                                                        <label for="password" class="zen-assistiveText">
                                                            密码</label><span class="t"><img src="/img/lock188.png" alt="密码" width="28" height="28"
                                                                class="thumbnail" title="密码" /></span><input type="password" placeholder="密码" class="input identityinput"
                                                                    id="password" name="pw" onblur="validatePwd()" /></div>
                                                    <!--
							onkeyup="if(this.value != ''){document.getElementById('clrUsr').style.display='block';}else{document.getElementById('clrUsr').style.display='none';}" 
                                                        onkeypress="checkCaps(event)" autocomplete="off" onkeyup="if(this.value != ''){document.getElementById('clrPw').style.display='block';}else{document.getElementById('clrPw').style.display='none';}"
                                                        -->
                                                </div>
                                                <div id="pwcaps" class="loginbox_container" style="display: none">
                                                    <img id="pwcapsicon" alt="打开了 Caps Lock！" width="16" height="16" />
                                                    打开了 Caps Lock！</div>
                                                <div class="loginbox_container">
                                                    <input type="submit" class="button" id="Login"  name="Login" value="登录到 OA" />
                                                        <!--<span class="label">登录到 OA</span></input>--></div>
                                                <div class="loginbox_container">
                                                    <div id="rem" class="wrapper_remember">
                                                        <input type="checkbox" id="rememberUn" name="rememberUn" checked="checked" />
                                                        &nbsp;<label for="rememberUn">记住用户名</label></div>
                                                </div>
                                                <div class="loginbox_container" id="forgot">
                                                    <span><a href="/secur/forgotpassword.aspx?locale=cn">忘记了密码？</a></span><!-- &nbsp;|&nbsp;
                                                    <span class="wrapper_signup"><a id="signup_link" href="#">
                                                        免费注册。</a></span><span id="mydomainLink"><a href="javascript:void(0);" onclick="DomainSwitcher.enterCustomDomain();">登录到自定义域。</a></span>--></div>
                                                </form>
                                                <script>   //LoginHint.getSavedIdentities(false);</script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="right_side">
                            <!--<iframe src="/s.gif" id="marketingPanel"  name="marketingPanel" scrolling="no" title="Marketing" src="http://www..com.cn/"></iframe>-->
                            <iframe title="Marketing" scrolling="no" name="marketing" id="marketing" src="messages.aspx"></iframe>
                        </div>
                    </div>
                    <div id="footer">
<span style='font-size:14px;'><a href='/appsdown.htm' target='_blank'>移动客户端下载</a>&nbsp;|&nbsp;<a href='/AmClient645.exe' target='_blank'>新版本AM</a>&nbsp;|&nbsp;<a href='/firefox40.exe' target='_blank'>火狐下载</a><br/>
                        Copyright &copy; 2015-2016 .com, inc. 公司版权所有。保留所有权利。</div>
                </div>
                <script src="/jslibrary/baselogin.js"></script>
                <script>                 
                    function handleLogin() {  document.login.un.value = document.login.username.value; document.login.width.value = screen.width; document.login.height.value = screen.height; }
                    function lazyload() {
                        document.getElementById("pwcapsicon").src = "/img/icon/warning16.png";
                       // document.getElementById("marketing").src = "https://c..com/login-messages/cn/messages.html?noroundedcorner";
                        document.getElementById("marketing").src = "http://www..com.cn/";
                    }
                    loader();
                    function validatePwd()
                    {
                        var pwd = document.getElementById("password").value;
                        if (pwd != "")
                        {
                            if (pwd.length > 18)
                            {
                                document.getElementById("password").value = "";
                                document.getElementById("error").style.display = "block";
                                document.getElementById("error").innerText = "密码太长！";
                            }
                        }
                    }
                  </script>
            </td>
        </tr>
    </table>
</body>
</html>