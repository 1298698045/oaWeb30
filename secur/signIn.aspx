<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="secur.signIn" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="description" content="OA,协同办公系统。登录到您的  客户帐户。" />
    <title>OA协同办公系统 - 客户安全登录页面 - 北京凤凰世纪科技有限公司</title>
    <meta name="format-detection" content="telephone=no" />
    <style type="text/css">
        a {
            color: #0b7aae;
        }

        input.primary, .button, .btnPrimary {
            background: #3198d8;
            border: 1px solid #4176ba;
        }

        .button, .button, .btnPrimary, .btnPrimary {
            border: 1px solid, #1c78b1 (0.11,0.471,0.694);
            background: #2e8ec9;
            background: -moz-linear-gradient(bottom, #2789c7 0%, #3f9fd9 100%);
            background: -webkit-gradient(linear, left bottom, left top, color-stop(0%,#2789c7), color-stop(100%,#3f9fd9));
            background: -webkit-linear-gradient(bottom, #2789c7 0%,#3f9fd9 100%);
            background: -o-linear-gradient(bottom, #2789c7 0%,#3f9fd9 100%);
            background: -ms-linear-gradient(bottom, #2789c7 0%,#3f9fd9 100%);
            background: linear-gradient(bottom, #2789c7 0%, #3f9fd9 100%) bottom (0.153,0.537,0.78) to top(0.247,0.624,0.851)filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3f9fd9', endColorstr='#2789c7',GradientType=0 );
        }

            .button:hover, .button:focus, .btnPrimary:hover, .btnPrimary:focus {
                background: #278ac7 ( 0.153, 0.541, 0.78);
            }

        body {
            background-color: #2a94d6;
        }

        #footer, #footer a {
            color: #ffffff;
        }

        #content {
            background-color: #ffffff;
        }

        #content {
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            padding: 10px;
        }

        #left_side {
            float: left;
            width: 320px;
        }

        #right_side {
            text-align: right;
            vertical-align: top;
        }
        #picyzm {
	        width: auto;
	        height: 40px;
	        display: inline-block;
	        margin: 0 0 0 10px;
        }
        #code_input{
            width:190px !important;
            text-indent: 15px !important;
        }
        #verifyCodeDemo {
	        width: 100%;
	        display: flex;
	        justify-content: center;
            margin-bottom:5px;
        }
        #Login{
            margin-top: 20px !important;
        }
        #theloginform{
            padding-top:30px !important;
        }
        #forgot{
            text-align:left;
            padding-left:35px;
            margin-top:7px;
            cursor:pointer;
        }
        #forgot a{
            color:#3969a5 !important;
            font-size:12px;
        }
        #error{
            position: absolute;
            bottom: 79px;
            left: 24px;
        }
        .error1{
            height: 35px !important;
            width: 300px !important;
            text-indent: 0px !important;
            padding-left: 10px !important;
        }
        .errorcontent{
            height:15px;
        }
    </style>
    <script type="text/javascript">       if (self == top) { document.documentElement.style.visibility = 'visible'; } else { document.write = ''; top.location = self.location; /*setTimeout(function () { document.body.innerHTML = ''; }, 1); window.self.onload = function (evt) { document.body.innerHTML = ''; };*/ }</script>
    <script>        var SFDCSessionVars = { "ic": false, "lh": false, "host": "", "le": false, "su": "#p# 已保存用户名", "sum": "#p# 个已保存用户名", "server": "", "im": false, "suo": "1 个已保存用户名" };</script>
    <script src="/jslibrary/SfdcSessionBase191.js"></script>
    <script src="/jslibrary/LoginHint191.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/jsencrypt.min.js"></script>
    <script type="text/javascript" src="/js/gVerify.js"></script>
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

            var errorCode = getQueryString("ec");
            if (errorCode == "1" || errorCode == "2" || errorCode == "3") {
                $('#password').addClass('error')
                document.getElementById("error").style.display = "block";
                $('#error').addClass('error1');
                $('#error').parent().addClass('errorcontent');
                document.getElementById("error").innerText = "用户名或密码错误，密码必须使用至少8个字符并包含字母和数字的组合，5次不正确账号将锁定。";
            }
            if (errorCode == "5") {
                $('#password').addClass('error');
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerText = "用户锁定，请等过30分钟后再登录！";
            }

            document.getElementById("username").value = "";
            return;
            var un = getCookie("SM_USER_NAME");
            //debugger;
            if (un != undefined) {
                document.getElementById("username").value = un;
            }

        }
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
    </script>
    <link href="/secur/oa_signIn.css" rel="stylesheet" />
    <style>
        body {
            background-color: white;
        }
        .validationCodebtn{
            position:absolute;
            right:45px;
            color:#108def;
            cursor:pointer;
            font-size:12px;
            top:0;
            height:42px;
            line-height:42px;
        }
        .loginbox_container{
            position:relative;
        }
        #password.error {
            border: 2px solid #d01124;
        }
        /*.middle{
            position:relative;
        }
        .bgimg1 {
            width: auto;
            height: 69%;
            position: fixed;
            top:13%;
            right: 69%;
        }
        .bgimg2{
            width:auto;
            height:69%;
            position:fixed;
            top:13%;
            right:38%;
        }
        #left_side{
            position:fixed !important;
            right:6%;
            top:22%;
            left:67%;
            height: 50%;
        }*/
    </style>
</head>
<body onload="loadUser()">
    <div class="header">
        <img style="vertical-align: middle;height: 38px;" src="/secur/loginImg/loginImg.png" alt="" />
        <span style="margin-left: 10px;">协同办公系统</span>
        <%--<div style="font-size:30px;">OA协同办公系统</div>
        <div style="font-size:12px;">OA COLLABORATIVE OFFICE SVSTEM</div>--%>
    </div>
    <div border="0" cellpadding="0" cellspacing="0" class="tablewrapper body">
        <div class="middle-content">
            <div valign="middle" class="middle">
                <img class="bgimg" src="/secur/oa_signIn.png" />
                <div class="po-content">
                    <div id="login">
                        <div id="login_wrapper">
                             <%--<img class="bgimg1" src="/secur/loginImg/fighting1.jpg" />
                             <img class="bgimg2" src="/secur/loginImg/fighting2.jpg" />--%>
                            <div id="left_side">
                                <div id="login_component">
                                    <div id="logo_wrapper">
                                        <div id="loginwidget">
                                            <div id="loginformarea">
                                                <div id="idscales" class="loginbox_container">
                                                    <div class="idscales-head">
                                                        <div class="login-title active">账号登录</div>
                                                        <!--<div class="login-title">扫码登录</div>
                                                        -->
                                                <div style="clear: both;"></div>
                                                    </div>
                                                    <div class="login-scan">
                                                        <img style="width: 210px; height: 210px;" src="/secur/loginImg/loginscan.png" alt="" />
                                                        <div style="margin-top: 20px;">
                                                            <span style="font-size: 14px; color: #333;">请使用扫描二维码登录</span>
                                                            <span style="font-size: 14px; color: #2977c9; cursor: pointer;">
                                                                <img style="width: 16px; height: 16px; vertical-align: middle; margin-left: 5px;" src="/secur/loginImg/shuaxin.png" alt="" />
                                                                刷新
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div id="theloginform">
                                                        <form name="login" method="post" onsubmit="handleLogin();" action="/processing_login.aspx" target="_top" novalidate="novalidate">
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
                                                                <input type="hidden" name="display" value="page" />
                                                            </fieldset>
                                                            <div class="loginbox_container" onclick="document.login.username.focus();">
                                                                <div onclick="LoginHint.clearUsr();" id="clrUsr" class="clrField" style="display: none;">
                                                                    &nbsp;
                                                                </div>
                                                                <div class="identity first">
                                                                    <span class="t">
                                                                        <img id="loginthumb" style="width: 20px; height: 20px;" src="/secur/loginImg/user.png" alt="用户名"
                                                                            class="thumbnail" title="用户名" /></span><input type="email"
                                                                                placeholder="用户名" value="" class="input identityinput" name="username"
                                                                                id="username" onkeyup="if(this.value != ''){}else{document.getElementById('clrUsr').style.display='none';}" />
                                                                </div>
                                                            </div>
                                                            <div class="loginbox_container">
                                                                <div class="wrapper_remember" style="color: blue;">
                                                                    <label for="UserFullName" id="UserFullName"></label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-top: 22px;" class="loginbox_container" onclick="document.login.password.focus();" style="">
                                                                <div onclick="document.getElementById('password').value = '';this.style.display='none';document.login.pw.focus();"
                                                                    id="clrPw" class="clrField">
                                                                    &nbsp;
                                                                </div>
                                                                <div class="identity last">
                                                                    <span class="t">
                                                                        <img style="width: 20px; height: 20px;" src="/secur/loginImg/password.png" alt="密码"
                                                                            class="thumbnail" title="密码" /></span><input type="password" placeholder="密码" class="input identityinput"
                                                                                id="password" name="pw" onblur="validatePwd()" onkeypress="checkCaps(event)" autocomplete="off" onkeyup="if(this.value != ''){document.getElementById('clrPw').style.display='block'}else{document.getElementById('clrPw').style.display='none';}" />
                                                                </div>
                                                                <!--
                                                        
                                                        -->
                                                            </div>
                                                                <div id="error2" class="loginError" style="display: none;">要访问此页面，您必须登录 。</div>

                                                            <div style="margin-top: 22px;" class="loginbox_container" style="">
                                                                <%--<div
                                                                    id="" class="clrField">
                                                                    &nbsp;
                                                                </div>--%>
                                                                <div class="identity last">
                                                                    <span class="t">
                                                                        <%--<img style="width: 20px; height: 20px;" src="/secur/loginImg/password.png" alt="验证码"
                                                                            class="thumbnail" title="验证码" />--%>

                                                                    </span>
                                                                    <%--<input id="validationCode" style="text-indent:10px;" type="text" placeholder="短信验证码" class="input identityinput"
                                                                              name="pw" autocomplete="off"  />
                                                                    <div class="validationCodebtn">获取验证码</div>--%>
                                                                    <div id="verifyCodeDemo">
		                                                            <input type="text" id="code_input" placeholder="请输入验证码" class="input identityinput" autocomplete="off">
		                                                            <p id="picyzm"></p>
	                                                            </div>
                                                                </div>
                                                                <!--
                                                        
                                                        -->
                                                            </div>
                                                            <div style="padding: 0 32px;">
                                                                <div id="error" class="loginError" style="display: none;">要访问此页面，您必须登录 。</div>
                                                            </div>

                                                            <div class="loginbox_container">
                                                                <div style="display:inline-block;" class="button" id="Login" name="Login">
                                                                    <span class="label">登录到 OA</span></div>
                                                            </div>

                                                            <div class="loginbox_container" style="display: none;">
                                                                <div id="rem" class="wrapper_remember">
                                                                    <input type="checkbox" id="rememberUn" name="rememberUn" checked="checked" />
                                                                    &nbsp;<label for="rememberUn">记住用户名</label>
                                                                </div>
                                                            </div>
                                                            <div class="loginbox_container" id="forgot">
                                                                <a href="/secur/forgotpassword.aspx">忘记密码</a>
                                                            </div>
                                                        </form>
                                                        <script>//LoginHint.getSavedIdentities(false);</script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <script src="/jslibrary/baselogin.js"></script>
                        <script>
                            function handleLogin() { document.login.un.value = document.login.username.value; document.login.width.value = screen.width; document.login.height.value = screen.height; }
                            function lazyload() {
                                document.getElementById("pwcapsicon").src = "/img/icon/warning16.png";
                                // document.getElementById("marketing").src = "https://c..com/login-messages/cn/messages.html?noroundedcorner";
                                document.getElementById("marketing").src = "http://www..com.cn/";
                            }
                            function validatePwd() {
                                var pwd = document.getElementById("password").value;
                                if (pwd != "") {
                                    if (pwd.length > 18) {
                                        document.getElementById("password").value = "";
                                        document.getElementById("error").style.display = "block";
                                        document.getElementById("error").innerText = "密码太长！";
                                    }
                                }
                            }

                            var verifyCode = new GVerify({
                                id: "picyzm",
                                type: "blend"
                            });
                            loader();
                            $(document).ready(function () {
                                $(document).off();

                                $("#username").off();
                                $("#username").blur(function () {
                                    var username = $("#username").val();
                                    if (username == "") return;
                                    var data = { username: username }
                                    //ajaxMethodPOSTData('user.fullname.get', data, function (data) {
                                        //console.log(data);
                                       // $('.wrapper_remember').show()
                                       // if (data != null && data.status == 1) {
                                      //      $("#UserFullName").text(data.msg);
                                     //   }
                                    //})
                                });

                                $("#username").keydown(function (event) {
                                    var username = $("#username").val();
                                    if (event.keyCode == 13) {
                                        if (username == "") {
                                            document.getElementById("error").innerText = "用户名不能为空！";
                                            $("#error").show()
                                        } else {
                                            document.getElementById('password').focus();
                                        }
                                        return false
                                    }
                                });
                                $('#password').keydown(function (event) {
                                    if (event.keyCode == 13) {
                                        if ($(this).val() == "") {
                                            document.getElementById("error").innerText = "密码不能为空！";
                                            $("#error").show()
                                            return false
                                        }
                                        if ($("#username").val() == '') {
                                            document.getElementById("error").innerText = "用户名不能为空！";
                                            $("#error").show()
                                            document.getElementById('username').focus();
                                            return false;
                                        }
                                    }
                                })
                                $('#code_input').keydown(function (event) {
                                    var code = document.getElementById("code_input");
                                    var res = verifyCode.validate(code.value);
                                    if (event.keyCode == 13) {
                                        if (res) {
                                            document.getElementById("error").innerText = "";
                                            $("#error").show()
                                            return
                                        } else {
                                            document.getElementById("error").innerText = "验证码不匹配！";
                                            $("#error").show()
                                            return false
                                        }
                                    }
                                })
                            });

                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer" id="footer" style="font-size: 13px">
        <div class="footer-top">
            <div><a href='/download/appsdown.htm' target='_blank'>苹果客户端</a></div>
            <div class="footer-top-mi">|</div>
            <div><a href='/download/appsdown.htm' target='_blank'>安卓客户端</a></div>
            <div class="footer-top-mi">|</div>
            <div><a href='/download/appsdown.docx' target='_blank'>App下载安装说明</a></div>         
        </div>
        <div class="footer-bottom">
            <div>北京凤凰世纪科技有限公司技术支持</div>
        </div>
    </div>
    <script src="../js/md5.js"></script>
    <script>
        var validationCodebtntime = 60
        $('.validationCodebtn').click(function () {
            if (validationCodebtntime == 60) {
                var userName = $('#username').val()
                if (userName == "")
                {
                    alert("账号不能为空!");
                    return;
                }
                ajaxMethodGetData('send.validation.sms', { userName: userName }, function (data) {
                    $('.validationCodebtn').html(validationCodebtntime+' 秒后重新获取')
                    var Interval = setInterval(function () {
                        validationCodebtntime--
                        $('.validationCodebtn').html(validationCodebtntime + ' 秒后重新获取')
                        if (validationCodebtntime == 0) {
                            clearInterval(Interval)
                            $('.validationCodebtn').html('获取验证码')
                            validationCodebtntime = 60
                        }
                    }, 1000)
                    if (data.state == 0) {
                        alert(data.message);
                        window.location.href = data.url;
                    }
                })
            }
        })
        $(document).ready(function () {
            $('#Login').click(function () {
                var userName = $('#username').val()
                var pwd = $('#password').val()
                var validationCode = $('#code_input').val()
                var code = document.getElementById("code_input");
                var res = verifyCode.validate(code.value);
                if (userName == "" || pwd == "" || validationCode=="")
                {
                    alert("账号、密码或者验证码不能为空!");
                    return;
                }
                else if(!res){
                    alert("验证码不正确!");
                    return;
                }
                var data1 = {
                    userName: userName,
                    pwd: pwd,
                    validationCode: validationCode,
                    md5Data: md5(userName + pwd + validationCode)
                }
                //var data2 = JSON.stringify(data1);
                //var encrypt = new JSEncrypt();
                //var rsaKey = ''
                //var that=this
                //ajaxMethodPOSTData('/api/Account/GetPublicKey', null, function (data) {
                //    if (data.status == 1) {
                //        that.rsaKey = data.data.ras_Key;
                //    } else {
                        
                //    }
                //})
                //encrypt.setPublicKey(that.rsaKey);
                //var data3 = encrypt.encrypt(data2);

                ajaxMethodPostData('user.login.check',
                    data1,
                    function (data) {
                        //console.log(data)
                        if (data.state == 1) {
                            window.location.href = data.url;
                        }
                        else {
                            alert(data.message);
                            window.location.href = data.url;
                        }
                    })
            })

        })
        
        $('.login-title').eq(0).click(function () {
            $('.login-scan').hide()
            $('#theloginform').show()
            $(this).addClass('active')
            $('.login-title').eq(1).removeClass('active')
            return false;
        })
        $('.login-title').eq(1).click(function () {
            $('.login-scan').show()
            $('#theloginform').hide()
            $(this).addClass('active')
            $('.login-title').eq(0).removeClass('active')
            return false;
        })

        detectIE()
        function detectIE() {
            var ua = window.navigator.userAgent;
            var edge = ua.indexOf('Edge/');
            var msie = ua.indexOf('MSIE ');
            if (msie > 0) {
                $('.bgimg').show()
                $('.middle').css('background', 'none')
            }
            var trident = ua.indexOf('Trident/');
            if (trident > 0) {
                $('.bgimg').show()
                $('.middle').css('background', 'none')
            }
            var edge = ua.indexOf('Edge/');
            if (edge > 0) {
                $('.bgimg').show()
                $('.middle').css('background', 'none')
            }
        }
    </script>
</body>
</html>
