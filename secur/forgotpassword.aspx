<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="secur.signIn" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="description" content="OA,协同办公系统 - 忘记密码。" />
    <title>OA协同办公系统 - 忘记密码</title>
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" href="/css/themes/lightning/alerts.css" />
    <link rel="stylesheet" href="/css/themes/lightning/iconfont.css" />
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
            position: relative !important;
            right: 0 !important;
            top: 0 !important;
            width: 320px;
            height:330px !important;
            background:#fff !important;
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
        #Cancel{
            width: 140px;
            margin-right:10px;
            height: 40px;
            line-height: 40px;
            background: none;
            background-color: #fff;
            border-color:#ddd;
            color: #0070d2;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top:35px !important;
        }
        #Cancel:hover {
            background-color: #F4F6F9;
        }
        #Login{
            width: 140px !important;
            height: 40px !important;
            line-height: 40px !important;
            background: none;
            background-color: #0070d2 !important;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top:35px !important;
        }
        #Login:hover {
            background-color: #005fb2 !important;
        }
        #theloginform{
            padding-top:50px !important;
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
            bottom: 50px;
            left: 24px;
        }
        .middle{
            background:none !important;
        }
    </style>
    <script type="text/javascript">
        if (self == top) { document.documentElement.style.visibility = 'visible'; } else { document.write = ''; top.location = self.location; /*setTimeout(function () { document.body.innerHTML = ''; }, 1); window.self.onload = function (evt) { document.body.innerHTML = ''; };*/ }
    </script>
    <script>
        var SFDCSessionVars = { "ic": false, "lh": false, "host": "", "le": false, "su": "#p# 已保存用户名", "sum": "#p# 个已保存用户名", "server": "", "im": false, "suo": "1 个已保存用户名" };
    </script>
    <script src="/jslibrary/SfdcSessionBase191.js"></script>
    <script src="/jslibrary/LoginHint191.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/jsencrypt.min.js"></script>
    <script type="text/javascript" src="/js/gVerify.js"></script>
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
        .po-content,#login{
            height:100%;
        }
        #login_wrapper{
            height:100%;
            display:flex;
            flex-direction: column;
            justify-content:center;
            align-items:center;
        }
        .login-title{
            font-size:26px;
            font-weight:500;
            color:#16325c;
        }
    </style>
</head>
<body>
    <%--<div class="header">
        <img style="vertical-align: middle;height: 38px;" src="/secur/loginImg/loginImg.png" alt="" />
        <span style="margin-left: 10px;">协同办公系统</span>
    </div>--%>
    <div border="0" cellpadding="0" cellspacing="0" class="tablewrapper body">
        <div class="middle-content">
            <div valign="middle" class="middle">
                <div class="po-content">
                    <div id="login">
                        <div id="login_wrapper">
                            <div class="login-title">忘记了密码</div>
                            <div id="left_side">
                                <div id="login_component">
                                    <div id="logo_wrapper">
                                        <div id="loginwidget">
                                            <div id="loginformarea">
                                                <div id="idscales" class="loginbox_container">
                                                    <div id="theloginform">
                                                        <form name="login" method="post" onsubmit="handleLogin();" action="/processing_login.aspx" target="_top" novalidate="novalidate">
                                                            <input type="hidden" id="pqs" name="pqs" value="?locale=cn" />
                                                            <div class="loginbox_container" onclick="document.login.username.focus();">
                                                                <div class="identity first">
                                                                    <span class="t">
                                                                        <img id="loginthumb" style="width: 20px; height: 20px;" src="/secur/loginImg/user.png" alt="用户名" 
                                                                            class="thumbnail" title="用户名" /></span><input type="email" placeholder="用户名" value="" class="input identityinput" 
                                                                                name="username" id="username" onkeyup="if(this.value != ''){}else{document.getElementById('clrUsr').style.display='none';}" />
                                                                </div>
                                                            </div>
                                                            <div style="margin-top: 15px;" class="loginbox_container" onclick="document.login.phone.focus();" style="">
                                                                <div onclick="document.getElementById('phone').value = '';this.style.display='none';document.login.phone.focus();"id="clrphone" class="clrField">&nbsp;</div>
                                                                <div class="identity last">
                                                                    <span class="t" style="left:40px;top:-4px;">
                                                                        <img style="width: 30px; height: 30px;" src="/secur/loginImg/phone1.png" alt="手机号"
                                                                            class="thumbnail" title="手机号" /></span><input type="email" placeholder="手机号" class="input identityinput"
                                                                                id="phone" name="phone" onblur="validatephone()" onkeypress="checkCaps(event)" autocomplete="off" onkeyup="if(this.value){document.getElementById('clrphone').style.display='block'}else{document.getElementById('clrphone').style.display='none';}" />
                                                                </div>
                                                            </div>
                                                           <%-- <div style="margin-top: 15px;" class="loginbox_container" onclick="document.login.password.focus();" style="">
                                                                <div onclick="document.getElementById('password').value = '';this.style.display='none';document.login.pw.focus();"id="clrPw" class="clrField">&nbsp;</div>
                                                                <div class="identity last">
                                                                    <span class="t">
                                                                        <img style="width: 20px; height: 20px;" src="/secur/loginImg/password.png" alt="新密码"
                                                                            class="thumbnail" title="新密码" /></span><input type="password" placeholder="新密码" class="input identityinput"
                                                                                id="password" name="pw" onblur="validatePwd()" onkeypress="checkCaps(event)" autocomplete="off" onkeyup="if(this.value){document.getElementById('clrPw').style.display='block'}else{document.getElementById('clrPw').style.display='none';}" />
                                                                </div>
                                                            </div>
                                                            <div style="margin-top: 15px;" class="loginbox_container" onclick="document.login.password1.focus();" style="">
                                                                <div onclick="document.getElementById('password1').value = '';this.style.display='none';document.login.pw1.focus();"id="clrPw1" class="clrField">&nbsp;</div>
                                                                <div class="identity last">
                                                                    <span class="t">
                                                                        <img style="width: 20px; height: 20px;" src="/secur/loginImg/password.png" alt="确认密码"
                                                                            class="thumbnail" title="确认密码" /></span><input type="password" placeholder="确认密码" class="input identityinput"
                                                                                id="password1" name="pw1" onblur="validatePwd1()" onkeypress="checkCaps(event)" autocomplete="off" onkeyup="if(this.value){document.getElementById('clrPw1').style.display='block'}else{document.getElementById('clrPw1').style.display='none';}" />
                                                                </div>
                                                            </div>--%>
                                                            <div style="margin-top: 15px;" class="loginbox_container" style="">
                                                                
                                                                <div class="identity last">
                                                                    <input id="validationCode" style="text-indent:15px;" type="text" placeholder="短信验证码" class="input identityinput"
                                                                              name="pw" autocomplete="off"  />
                                                                    <div class="validationCodebtn">获取验证码</div>
                                                                </div>
                                                         
                                                            </div>
                                                            <div style="padding: 0 32px;">
                                                                <div id="error" class="loginError" style="display: none;">要访问此页面，您必须登录 。</div>
                                                            </div>

                                                            <div class="loginbox_container">
                                                                <div style="display:inline-block;" class="button" id="Cancel" name="Cancel">
                                                                    <span class="label">取消</span></div>
                                                                <div style="display:inline-block;" class="button" id="Login" name="Login">
                                                                    <span class="label">下一步</span></div>
                                                            </div>

                                                        </form>
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
                            function validatePwd1() {
                                var pwd = document.getElementById("password").value;
                                var pwd1 = document.getElementById("password1").value;
                                if (pwd1 != "") {
                                    if (pwd.length > 18) {
                                        document.getElementById("error").style.display = "block";
                                        document.getElementById("error").innerText = "密码太长！";
                                    }
                                    else if(pwd1!= pwd){
                                        document.getElementById("error").style.display = "block";
                                        document.getElementById("error").innerText = "两次输入的密码不相同！";
                                    }
                                    else {
                                        document.getElementById("error").innerText = "";
                                    }
                                }
                            }
                            function validatephone() {
                                var phone = document.getElementById("phone").value;
                                if (phone != "") {
                                    if (!(/^1[3|4|5|8][0-9]\d{8}$/.test(phone))) {
                                        document.getElementById("error").style.display = "block";
                                        document.getElementById("error").innerText = "请输入正确的手机号！";
                                    }
                                    else {
                                        document.getElementById("error").innerText = "";
                                    }
                                }
                            }
                            //var verifyCode = new GVerify({
                            //    id: "picyzm",
                            //    type: "blend"
                            //});
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
                                            document.getElementById("error").innerText = "";
                                            document.getElementById('phone').focus();
                                        }
                                        return false
                                    }
                                });
                                $("#phone").keydown(function (event) {
                                    var phone = $("#phone").val();
                                    if (event.keyCode == 13) {
                                        if (phone == "") {
                                            document.getElementById("error").innerText = "手机号不能为空！";
                                            $("#error").show()
                                        }
                                        else if (!(/^1[3|4|5|8][0-9]\d{8}$/.test(phone))) {
                                            document.getElementById("error").innerText = "请输入正确的手机号！";
                                        }
                                        else {
                                            document.getElementById("error").innerText = "";
                                            document.getElementById('password').focus();
                                        }
                                        return false
                                    }
                                });
                                //$('#password').keydown(function (event) {
                                //    if (event.keyCode == 13) {
                                //        if ($(this).val() == "") {
                                //            document.getElementById("error").innerText = "新密码不能为空！";
                                //            $("#error").show()
                                //        } else {
                                //            document.getElementById("error").innerText = "";
                                //            document.getElementById('password1').focus();
                                //        }
                                //        return false
                                       
                                //    }
                                //})
                                //$('#password1').keydown(function (event) {
                                //    if (event.keyCode == 13) {
                                //        if ($(this).val() == "") {
                                //            document.getElementById("error").innerText = "确认密码不能为空！";
                                //            $("#error").show()
                                //        } else {
                                //            document.getElementById("error").innerText = "";
                                //            document.getElementById('validationCode').focus();
                                //        }
                                //        return false

                                //    }
                                //})
                                $('#validationCode').keydown(function (event) {
                                    if (event.keyCode == 13) {
                                        if ($(this).val() == "") {
                                            document.getElementById("error").innerText = "验证码不能为空！";
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
        </div>
        <div class="footer-bottom">
            <div>北京凤凰世纪科技有限公司技术支持</div>
        </div>
    </div>
    <script src="../js/md5.js"></script>
    <script type="text/javascript" src="/js/alert.js"></script>
    <script>
        var validationCodebtntime = 120
        $('.validationCodebtn').click(function () {
            if (validationCodebtntime == 120) {
                var userName = $('#username').val()
                var phone = $('#phone').val()
                if (userName==""||phone == "")
                {
                    error3("用户名或手机号不能为空！");
                    return;
                }
                $.ajax({
                    type: "GET",
                    url: "/secur/VerifySms.ashx?method=sendsmscode&userName=" + userName + "&mobilePhone=" + phone,
                    data: {},
                    dataType: "json",
                    success: function (data) {
                        $('.validationCodebtn').html(validationCodebtntime + ' 秒后重新获取')
                        var Interval = setInterval(function () {
                            validationCodebtntime--
                            $('.validationCodebtn').html(validationCodebtntime + ' 秒后重新获取')
                            if (validationCodebtntime == 0) {
                                clearInterval(Interval)
                                $('.validationCodebtn').html('获取验证码')
                                validationCodebtntime = 120
                            }
                        }, 1000)
                        if (data&&data.status == 0) {
                            error3('获取验证码失败！');
                            setTimeout(function () {
                                clearInterval(Interval);
                                $('.validationCodebtn').html('获取验证码')
                                validationCodebtntime = 120
                                //window.location.href = '/secur/forgotpassword.aspx';
                            }, 1000)
                        }
                    }
                });
                //ajaxMethodGetData('send.validation.sms', { userName: phone }, function (data) {
                //    $('.validationCodebtn').html(validationCodebtntime+' 秒后重新获取')
                //    var Interval = setInterval(function () {
                //        validationCodebtntime--
                //        $('.validationCodebtn').html(validationCodebtntime + ' 秒后重新获取')
                //        if (validationCodebtntime == 0) {
                //            clearInterval(Interval)
                //            $('.validationCodebtn').html('获取验证码')
                //            validationCodebtntime = 120
                //        }
                //    }, 1000)
                //    if (data.state == 0) {
                //        error3(data.message);
                //        window.location.href = data.url;
                //    }
                //})
            }
        })
        $(document).ready(function () {
            $('#Cancel').click(function () {
                location.href = '/secur/signIn.aspx';
            })
            $('#Login').click(function () {
                var userName = $('#username').val()
                var phone = $('#phone').val()
                var pwd = $('#password').val()
                var validationCode = $('#validationCode').val()
                
                if (userName == "" || validationCode==""||phone=="")
                {
                    error3("用户名、手机号或者验证码不能为空！");
                    return;
                }
                
                //var data1 = {
                //    userName: userName,
                //    pwd: pwd,
                //    validationCode: validationCode,
                //    phone:phone,
                //    md5Data: md5(userName + pwd + validationCode)
                //}
                //location.href = '/secur/resetpassword.aspx';
                $.ajax({
                    type: "GET",
                    url: "/secur/VerifySms.ashx?method=verifysmscode&code=" + validationCode + "&mobilePhone=" + phone,
                    data: {},
                    dataType: "json",
                    success: function (data) {
                        if (data && data.status == 1) {
                            $.ajax({
                                type: "GET",
                                url: "/secur/VerifySms.ashx?method=retrievepwd&username=" + userName + "&phone=" + phone,
                                data: {},
                                dataType: "json",
                                success: function (data1) {
                                    //console.log(data)
                                    if (data1.status == 1) {
                                        success3('重置成功，请用初始密码登录！');
                                        setTimeout(function () {
                                            window.location.href = "/secur/signIn.aspx";
                                        },3000)
                                    }
                                    else {
                                        error3('重置密码失败！');
                                    }
                                }
                            });
                            //location.href = '/secur/resetpassword.aspx?userName=' + userName + '&phone=' + phone;
                        }
                        else {
                            error3('验证失败！');
                        }
                    }
                });
                
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

                //ajaxMethodPostData('user.login.check',
                //    data1,
                //    function (data) {
                //        //console.log(data)
                //        if (data.state == 1) {
                //            window.location.href = data.url;
                //        }
                //        else {
                //            error3(data.message);
                //            window.location.href = data.url;
                //        }
                //    })
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
        function error3(name) {
            $("body").append('<div class="success red" style="min-width: max-content;left:48%;">'
            + '    <span class="success_icon" style="background:transparent;border: 1px solid #fff;">'
            + '    <i class="iconfont icon-cuohao" style="top: -7px;position: relative;left: 4px;"></i>'
            + '    </span>'
            + '    <div class="toastContent slds-notify__content" style="flex: 1;">'
            + '    <div class="slds-align-middle slds-hyphenate" style="font-size: 16px;">'
            + '    <span class="toastMessage slds-text-heading--small forceActionsText">' + name + '</span>'
            + '</div>'
            + '</div>'
            + '</div>')
            setTimeout(function () {
                $(".success").remove()
            }, 1000)
        }
        function success3(name) {
            $("body").append('<div class="success green" style="left:48%;width:auto;">'
            + '    <span class="success_icon">'
            + '    <i class="iconfont icon-duihao"></i>'
            + '    </span>'
            + '    <div class="toastContent slds-notify__content" style="flex: 1;">'
            + '    <div class="slds-align-middle slds-hyphenate" style="font-size: 16px;">'
            + '    <span class ="toastMessage slds-text-heading--small forceActionsText">' + name + '</span>'
            + '</div>'
            + '</div>'
            + '<button class="button">'
            + '<i class="iconfont icon-cuohao"></i>'
            + '</button>'
            + '</div>')
            setTimeout(function () {
                $(".success").remove();
            }, 3000)
        }
    </script>
</body>
</html>
