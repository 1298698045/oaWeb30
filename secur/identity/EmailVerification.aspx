<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailVerification.aspx.cs" Inherits="WebClient.secur.identity.EmailVerification" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="visibility: visible;">
<head>
    <meta name="viewport" content="initial-scale=1.0" />
    <title>验证您的身份 | xit</title>
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" type="text/css" href="/css/sfdc_198.css" />
    <style type="text/css">
        a
        {
            color: #0070d2;
        }

        body
        {
            background-color: #F4F6F9;
        }

        #content, .container
        {
            background-color: #ffffff;
        }

        #header
        {
            color: #16325c;
        }

        .formArea
        {
            text-align: center;
        }

        .errorMsg
        {
            text-align: left;
            color: #CF4F43;
        }
    </style>
</head>
<body onload="this.bodyOnLoad&&bodyOnLoad();" onunload="this.bodyOnUnload&&bodyOnUnload();">
    <div id="wrap">
        <div id="main">
            <div id="wrapper">
                <div id="logo_wrapper" class="standard_logo_wrapper mb24">
                    <h1 style="height: 100%; display: table-cell; vertical-align: bottom;">
                        <img id="logo" class="standard_logo" src="/img/logo198.png" alt="协同办公系统" border="0" name="logo"></h1>
                </div>
                <div id="header" class="mb24">验证您的身份</div>
                <div id="content">
                    <form action="/_ui/identity/verification/method/EmailVerificationFinishUi/e" id="editPage" method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
                        <input type="hidden" name="_CONFIRMATIONTOKEN" id="_CONFIRMATIONTOKEN" value="VmpFPSxNakF4TlMweE1TMHhOVlF3TURvMU1Ub3pOUzQyTURWYSxGRkM5OVhMZ0ZxR0VnN2tpZ2tPSXc3LFpUSXpOR0U0" /><input type="hidden" name="cancelURL" id="cancelURL" value="/secur/frontdoor.jsp?retURL=%2F701%2Fo&amp;cshc=000000390Wh0000000yvHG&amp;apv=1&amp;display=page&amp;ucs=1" /><input type="hidden" name="retURL" id="retURL" value="/secur/frontdoor.jsp?retURL=%2F701%2Fo&amp;cshc=000000390Wh0000000yvHG&amp;apv=1&amp;display=page&amp;ucs=1" /><input type="hidden" name="save_new_url" id="save_new_url" value="/_ui/identity/verification/method/EmailVerificationFinishUi/e?vpol=ic&amp;vflid=%E7%99%BB%E5%BD%95%E5%88%B0+Salesforce&amp;retURL=%2Fsecur%2Ffrontdoor.jsp%3FretURL%3D%252F701%252Fo%26cshc%3D000000390Wh0000000yvHG%26apv%3D1%26display%3Dpage%26ucs%3D1&amp;vcsrf=VoUOpfS_UirEyCcqC4oAPnpVYfJyszTX0x1E8xSojdbzdZsdNIsQyP1VhJj3nLQrbXqOH2eFcyLh3qtxfBPkCxqKOnC4XtDEcHw89LzXhEXnO39uqBAObk6K1YEXxByotqWFMjmJzXSboHjQInLx_YJW08ntvw3fO8CZKMRGrjb_9Mo7mTupSgtPw4nl7b9ZvffDUel7oWZn9gdC0sbPR-8iYpqc7CVtYWt8T7t81NNhhFp-Mm6vZZ0OigqSdz1oun7uWfQF3u_CV8g1aQ8H4MnlSeopi2iTdCw7idqf77_jdcn7-jLCWS994-j1MQgS7FU185zlR-2vl96Led3b-RumPspmBuNc-NJ_Yz9qVEB6wpD4aznhATa_SLMgzHj6JMoWrwgfXPQplzKQ2Cv5-uUiDs2xJjqmoS0FmPp4Quafei9-ukWgbqtIRFNVpSPz7dbEb9413J-2udwaOdUB5rwtQCqJ3GJzY0aGSgrX4HOgO_4QHgXeJfO6z6BW8fBE0KXMGlkYupDBvnj-BnzZ9I6kVpqPEd_3Mlaz024T-FeYzNKhBbx_jD-ZmmsOzhVARQGLbMfLQJMOBuA_-rca6edjA7Ezgsq9KUnfbVs6kpkvn-G0IywMvG1r4XPu_Qp8Dw3D1Fa0FKNGkPa-Sxq3TsycVLC_h313QGIxKPwHGkk%3D" /><input type="hidden" id="vcsrf" name="vcsrf" value="VoUOpfS_UirEyCcqC4oAPnpVYfJyszTX0x1E8xSojdbzdZsdNIsQyP1VhJj3nLQrbXqOH2eFcyLh3qtxfBPkCxqKOnC4XtDEcHw89LzXhEXnO39uqBAObk6K1YEXxByotqWFMjmJzXSboHjQInLx_YJW08ntvw3fO8CZKMRGrjb_9Mo7mTupSgtPw4nl7b9ZvffDUel7oWZn9gdC0sbPR-8iYpqc7CVtYWt8T7t81NNhhFp-Mm6vZZ0OigqSdz1oun7uWfQF3u_CV8g1aQ8H4MnlSeopi2iTdCw7idqf77_jdcn7-jLCWS994-j1MQgS7FU185zlR-2vl96Led3b-RumPspmBuNc-NJ_Yz9qVEB6wpD4aznhATa_SLMgzHj6JMoWrwgfXPQplzKQ2Cv5-uUiDs2xJjqmoS0FmPp4Quafei9-ukWgbqtIRFNVpSPz7dbEb9413J-2udwaOdUB5rwtQCqJ3GJzY0aGSgrX4HOgO_4QHgXeJfO6z6BW8fBE0KXMGlkYupDBvnj-BnzZ9I6kVpqPEd_3Mlaz024T-FeYzNKhBbx_jD-ZmmsOzhVARQGLbMfLQJMOBuA_-rca6edjA7Ezgsq9KUnfbVs6kpkvn-G0IywMvG1r4XPu_Qp8Dw3D1Fa0FKNGkPa-Sxq3TsycVLC_h313QGIxKPwHGkk=" /><input type="hidden" id="vpol" name="vpol" value="ic" /><input type="hidden" id="Hidden1" name="retURL" value="/secur/frontdoor.jsp?retURL=%2F701%2Fo&amp;cshc=000000390Wh0000000yvHG&amp;apv=1&amp;display=page&amp;ucs=1" /><input type="hidden" id="vflid" name="vflid" value="登录到 系统" /><p>您正在尝试 <strong>登录到 </strong>。 要确保您的  帐户安全，我们必须验证您的身份。请输入我们通过电子邮件发送到 ja********@**na.com 的验证码。<br />
                            <br />
                        </p>
                        <label class="label" for="emc">验证码</label><div class="formArea">
                            <input class="input wide mb8 mt8 focus" id="emc" maxlength="6" name="emc" size="20" type="text" user-scalable="no" /><br />
                        </div>
                        <input value=" 验证 " class="button primary wide mt8 mb16" id="save" name="save" title="验证" type="submit" /><a href="/_ui/identity/verification/method/EmailVerificationStartUi/e?vcsrf=phBdkcXnEBFpQkXsaPuwEuJ1qQavioEuQv1AK6XIHLZkxCWvd9X1b0HEH2EKjwnNOpfpSUvdi5rjocMsW1TJNJh-tD2Ws7bH5DBfLogBaX4_Cm0R-inOiw7vU29OsDc0eptiGiBrbYpAHDLa53DVYayVZTi-ofV-LodLxNwQHP_obzs5id6s3x-D0zhWpCvfrnsFSOFx-rIZ2GQU8asTZd1Exr2NL7jlTF0jRMXLtl8tpxrxF4V2Fc09uLqw5f1C8v1g_G2x47a_KswIUKvl6afy2Vh698N9RZQZjdFdEb88TUVWyL0QbOsRe-Cem206HADrsyGTJR1QcdSwt1bn6FcWn5ZDl79zp7fiUgH6HvtyBPlCsKQIJ20OpamkaoNku15mFCayIhQBuCVDZIG1p45zUtb-0AOIVnVs6AWq_PMqFfIujQDhNWPJtXgAQ8EGAUY83Qo_3rRGXub9kLMX2h-PV9AgmdwLEidLyyupZm-v2EerpAKTB1Wwpi4EbcdG7ND-1a-h-bRowxwbaVxDYJLswwwaABsOGz6y8lItwmz5F1xV2eLsZjuMCnhATBHFAPwbfC8OIVN5AhFuOYly1SV4IlHYZEoDkStHHJrgIcmqIiuc4JKfhm7CbwVbWEskDK1irkNlex2W3EZ3OtigqqlQcgn4QJ0UwDS0dkkiM_s%3D&amp;vpol=ic&amp;vflid=%E7%99%BB%E5%BD%95%E5%88%B0+Salesforce&amp;retURL=%2Fsecur%2Ffrontdoor.jsp%3FretURL%3D%252F701%252Fo%26cshc%3D000000390Wh0000000yvHG%26apv%3D1%26display%3Dpage%26ucs%3D1&amp;vir=1" class="small ib">重新发送代码</a><br />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">&copy; 2015- 2017 phxinfo.com.cn, inc. 保留所有权利。</div>
    <script>var p = document.getElementById('footer').parentNode; while (p.nodeName.toLowerCase() === 'div') { p.style.height = '100%'; p = p.parentNode; }</script>


    <!-- Body events -->
    <script type="text/javascript">function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMweE1TMHhOVlF3TURvMU1Ub3pOaTQxT1RCYSxfbU5hc3F6MVdMV2RudlNFN3BUTnBtLFpXTmhaVEU1'); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMweE1TMHhOVlF3TURvMU1Ub3pOaTQyTmpCYSx5c1hONXF0dVpVbGgxM3o0bldhVWYxLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</body>
</html>
