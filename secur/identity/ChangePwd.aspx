<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="WebClient.secur.identity.ChangePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="visibility: visible;">
<head>
    <meta name="viewport" content="initial-scale=1.0" />
    <title>更改您的密码 | 协同办公系统</title>
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" type="text/css" href="/css/sfdc_204.css" />
    <style type="text/css">
        a {
            color: #0070d2;
        }

        body {
            background-color: #F4F6F9;
        }

        #content, .container {
            background-color: #ffffff;
        }

        #header {
            color: #16325c;
        }

        .detailRow .message {
            width: 100%;
        }

        .requiredInput {
            width: auto;
        }

        div#content .labelCol, div#content .data2Col {
            min-height: 30px;
            padding-top: 0px;
            padding-bottom: 15px;
            vertical-align: top;
        }

        body .bEditBlock .pbBottomButtons {
            border-top: 0px;
            padding-top: 0px;
            margin-top: 0px;
        }

        .pbSubheader, .mainTitle {
            display: none;
        }

        div.bDescription, div#content .data2Col {
            font-size: 95%;
        }

        .pageTitle {
            font-weight: bold;
        }

        p {
            text-align: initial;
            text-align: start;
        }

        body .btn {
            color: #fff;
        }

        input.primary {
            width: auto;
            padding: 5px;
            height: auto;
        }

        input {
            border: 1px solid #cccccc;
            border-radius: 3px;
            height: 20px;
            width: 200px;
            font-size: 14px;
        }

        #password-button.active {
            background-color: #0070d2;
        }

        .password-wrapper.success input {
            border: 1px solid #008000;
        }

        .password-wrapper.error input {
            border: 1px solid #c23934;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="main">
            <div id="wrapper">
                <!-- <div id="logo_wrapper" class="standard_logo_wrapper mb24">
                    <h1 style="height: 100%; display: table-cell; vertical-align: bottom;">
                       <img id="logo" class="standard_logo" src="/img/logo198.png" alt="协同办公系统" border="0" name="logo"></h1>
                </div>-->
                <div id="header" class="mb24">更改您的密码</div>
                <div id="content">
                    <form action="/secur/identity/ChangePwd.aspx"   id="editPage" method="post" name="editPage">
                        <input type="hidden" name="_CONFIRMATIONTOKEN" id="_CONFIRMATIONTOKEN" value="" />
                        <input type="hidden" name="cancelURL" id="cancelURL" value="/701/o" />
                        <input type="hidden" name="retURL" id="retURL" value="/701/o" />
                        <input id="save" name="save" type="hidden" value="1" />
                        <input type="hidden" name="save_new_url" id="save_new_url" value="/_ui/system/security/ChangePassword?fromFrontdoor=1&amp;retURL=%2F701%2Fo&amp;display=page&amp;setupid=ChangePassword" /><input type="hidden" name="setupid" id="setupid" value="ChangePassword" />
                        <div class="setup change-password">
                            <p class="mb16">
                                请为 <span class="important"></span>输入新密码。<span> </span>
                                您的密码必须包含至少：
                            </p>
                            <ul class="passwordul mb16">
                                <li class="mb8">
                                    <img src="/img/iconCheckDisabled.png" class="passwordicon" alt="未满足要求" id="charcounticon">
                                    <span id="charcount">8 个字符</span>
                                </li>
                                <li class="mb8">
                                    <img src="/img/iconCheckDisabled.png" class="passwordicon" alt="未满足要求" id="lettersicon">
                                    <span id="letters">1 个字母</span>
                                </li>
                                <li class="mb8">
                                    <img src="/img/iconCheckDisabled.png" class="passwordicon" alt="未满足要求" id="numbersicon">
                                    <span id="numbers">1 个数字</span>
                                </li>
                            </ul>

                            <label for="newpassword" class="altLabel"><span class="required">*</span>&nbsp;新密码</label>
                            <div class="password-wrapper">
                                <input class="password-input input wide mt8 mb16 password" type="password" name="newpassword" id="newpassword" autofocus>
                                <span id="newpassword-message" aria-live="polite" class="password-message"></span>
                            </div>
                            <label for="confirmpassword" class="altLabel"><span class="required">*</span>&nbsp;确认新密码</label>
                            <div class="password-wrapper">
                                <input class="password-input input wide mt8 mb16 password" type="password" name="confirmpassword" id="confirmpassword">
                                <span id="confirmpassword-message" aria-live="polite" class="password-message"></span>
                            </div>

                            <input name="fromFrontdoor" id="fromFrontdoor" type="hidden" value="1" /><div class="wide">
                               <!-- [if IE 7]>--><!--
        <button id="password-button" class="button wide mb16" name="save" type="submit">
            更改密码</button>-->
<!--<![endif]>-->
                                <![if !(IE 7)|!IE]>
        <input  id="password-button" class="button wide mb16" name="save" value="更改密码" type="submit" />
            <!---->
                                <!--<![endif]>-->
                            </div>
                            <p class="small">
                                <!--密码上次已在 2017-4-19 下午9:39 时进行更改。-->
                            </p>
                        </div>
                        <div id="pwcaps" class="mb16" style="display: none" aria-live="assertive">
                            <img id="pwcapsicon" alt="打开了 Caps Lock。" width="12" src="/img/icon/capslock_blue.png" />
                            打开了 Caps Lock。
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">&copy; 协同办公系统。</div>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>

    <script type="text/javascript">

        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                return false;
            }
        })
        $('#password-button').click(function () {
            if ($(this).hasClass('active')) {

            } else {
                return false;

            }
        })
        $('#newpassword').keyup(function () {
            var value = $(this).val()
            if (value.length >= 8) {
                $('.mb8').eq(0).addClass('active')
                $('.mb8').eq(0).find('img').attr('src', '/img/images/checked.png')
            } else {
                $('.mb8').eq(0).removeClass('active')
                $('.mb8').eq(0).find('img').attr('src', '/img/images/check.png')
            }
            var p1 = /[0-9]/;
            var p2 = /[a-zA]/;
            if (p2.test(value)) {
                $('.mb8').eq(1).addClass('active')
                $('.mb8').eq(1).find('img').attr('src', '/img/images/checked.png')
            } else {
                $('.mb8').eq(1).removeClass('active')
                $('.mb8').eq(1).find('img').attr('src', '/img/images/check.png')
            }
            if (p1.test(value)) {
                $('.mb8').eq(2).addClass('active')
                $('.mb8').eq(2).find('img').attr('src', '/img/images/checked.png')
            } else {
                $('.mb8').eq(2).removeClass('active')
                $('.mb8').eq(2).find('img').attr('src', '/img/images/check.png')
            }
        })
        $('#newpassword').blur(function () {
            if ($('.mb8.active').length == 3) {
                $(this).parent().addClass('success')
                $(this).parent().removeClass('error')
                $(this).parent().find('.text').html('好的')
            } else {
                $(this).parent().addClass('error')
                $(this).parent().removeClass('success')
                $(this).parent().find('.text').html('密码过于简单')
            }
            if ($(this).val() == $('#confirmpassword').val()) {
                $('#confirmpassword').parent().addClass('success')
                $('#confirmpassword').parent().removeClass('error')
                $('#confirmpassword').parent().find('.text').html('好的')
            } else {
                $('#confirmpassword').parent().addClass('error')
                $('#confirmpassword').parent().removeClass('success')
                $('#confirmpassword').parent().find('.text').html('密码不匹配')
            }
        })
        $('#confirmpassword').keyup(function () {
            if ($(this).val() == $('#newpassword').val()) {
                $('#confirmpassword').parent().addClass('success')
                $('#confirmpassword').parent().removeClass('error')
                $('#confirmpassword').parent().find('.text').html('好的')
            } else {
                $('#confirmpassword').parent().addClass('error')
                $('#confirmpassword').parent().removeClass('success')
                $('#confirmpassword').parent().find('.text').html('密码不匹配')
            }
        })
        $('#confirmpassword').blur(function () {
            if ($(this).val() == $('#newpassword').val()) {
                $(this).parent().addClass('success')
                $(this).parent().removeClass('error')
                $(this).parent().find('.text').html('好的')
            } else {
                $(this).parent().addClass('error')
                $(this).parent().removeClass('success')
                $(this).parent().find('.text').html('密码不匹配')
            }
        })
        $('input').keyup(function () {
            if ($('.success').length == 2) {
                $('#password-button').addClass('active')
            } else {
                $('#password-button').removeClass('active')
            }
        })
    </script>
</body>
</html>
