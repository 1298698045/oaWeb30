<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPhoneNumber.aspx.cs" Inherits="WebClient.secur.identity.AddPhoneNumber" %>

<html style="visibility: visible;" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="initial-scale=1.0">
    <title>注册您的手机 | 北京凤凰世纪协同办公系统</title>
    <meta name="format-detection" content="telephone=no">
    <link href="/css/sfdc_198.css" rel="stylesheet" type="text/css">
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

        .errorMsg
        {
            color: #CF4F43;
            margin-top: 8px;
        }

        .button.primary, .button.secondary
        {
            margin-top: 16px;
        }

        .small
        {
            font-size: 12px;
        }

            .small a
            {
                line-height: 25px;
            }
    </style>
</head>
<body onload="this.bodyOnLoad&amp;&amp;bodyOnLoad();" onunload="this.bodyOnUnload&amp;&amp;bodyOnUnload();">
    <div id="wrap">
        <div id="main">
            <div id="wrapper">
                <div class="standard_logo_wrapper mb24" id="logo_wrapper">
                    <h1 style="height: 100%; vertical-align: bottom; display: table-cell;">
                        <img name="logo" class="standard_logo" id="logo" alt="协同办公系统" src="/img/logo190.png" border="0"></h1>
                </div>
                <div class="mb24" id="header">注册您的手机</div>
                <div id="content">
                    <form name="editPage" id="editPage" onsubmit="if (window.ffInAlert) { return false; }" action="/_ui/identity/phone/AddPhoneNumber?d=m&amp;retURL=%2Fhome%2Fhome.aspx" method="post">
                        <input name="_CONFIRMATIONTOKEN" id="_CONFIRMATIONTOKEN" type="hidden" value=""><input name="cancelURL" id="cancelURL" type="hidden" value="/home/home.aspx"><input name="retURL" id="retURL" type="hidden" value="/home/home.aspx"><input name="save_new_url" id="save_new_url" type="hidden" value="/_ui/identity/phone/AddPhoneNumber?d=m&amp;retURL=%2Fhome%2Fhome.aspx"><p class="mb16">在登录 系统 时使身份验证更为容易。我们在任何时候需要验证您的身份时，都会通过短信向您的注册手机发送代码。</p>
                        <!--<label class="label" for="c">国家</label><select name="c" class="mb16 wide mt8 slds-select" id="c" onchange="updateCountryCode(this);"><option title="355" value="Ab">阿尔巴尼亚 (+355)</option>
                            <option title="213" value="Ag">阿尔及利亚 (+213)</option>
                            <option title="684" value="As">美属萨摩亚 (+684)</option>
                            <option title="376" value="Ad">安道尔 (+376)</option>
                            <option title="244" value="An">安哥拉 (+244)</option>
                            <option title="1" value="Al">安圭拉 (+1)</option>
                            <option title="1" value="At">安提瓜和巴布达 (+1)</option>
                            <option title="54" value="Ar">阿根廷 (+54)</option>
                            <option title="374" value="Am">亚美尼亚 (+374)</option>
                            <option title="297" value="Aa">阿鲁巴 (+297)</option>
                            <option title="61" value="Au">‎澳大利亚 (+61)</option>
                            <option title="43" value="Ai">奥地利 (+43)</option>
                            <option title="1" value="Ba">巴哈马 (+1)</option>
                            <option title="973" value="Bh">巴林 (+973)</option>
                            <option title="1" value="Bb">巴巴多斯 (+1)</option>
                            <option title="375" value="Bl">白俄罗斯 (+375)</option>
                            <option title="32" value="Be">比利时 (+32)</option>
                            <option title="501" value="Bz">伯利兹 (+501)</option>
                            <option title="229" value="Bn">贝宁 (+229)</option>
                            <option title="1" value="Bm">百慕大 (+1)</option>
                            <option title="591" value="Bo">玻利维亚 (+591)</option>
                            <option title="387" value="Bg">波斯尼亚和黑塞哥维那 (+387)</option>
                            <option title="55" value="Br">巴西 (+55)</option>
                            <option title="359" value="Bu">保加利亚 (+359)</option>
                            <option title="257" value="Bd">布隆迪 (+257)</option>
                            <option title="855" value="Cm">柬埔寨 (+855)</option>
                            <option title="237" value="Co">喀麦隆 (+237)</option>
                            <option title="1" value="Ca">加拿大 (+1)</option>
                            <option title="238" value="Cv">佛得角群岛 (+238)</option>
                            <option title="1" value="Cs">开曼群岛 (+1)</option>
                            <option title="235" value="Cd">乍得 (+235)</option>
                            <option title="56" value="Ch">智利 (+56)</option>
                            <option title="86" selected="selected" value="Ci">中国 (+86)</option>
                            <option title="57" value="Cl">哥伦比亚 (+57)</option>
                            <option title="269" value="Cr">科摩罗 (+269)</option>
                            <option title="242" value="Cn">刚果 (+242)</option>
                            <option title="506" value="Cc">哥斯达黎加 (+506)</option>
                            <option title="385" value="Ct">克罗地亚 (+385)</option>
                            <option title="53" value="Cb">古巴 (+53)</option>
                            <option title="599" value="Cu">库拉索岛 (+599)</option>
                            <option title="357" value="Cy">塞浦路斯 (+357)</option>
                            <option title="420" value="Cz">捷克共和国 (+420)</option>
                            <option title="45" value="Dn">‎丹麦 (+45)</option>
                            <option title="1" value="Dm">多米尼加 (+1)</option>
                            <option title="1" value="Dr">多米尼加共和国 (+1)</option>
                            <option title="56" value="Ei">复活节岛 (+56)</option>
                            <option title="593" value="Ec">厄瓜多尔 (+593)</option>
                            <option title="20" value="Eg">埃及 (+20)</option>
                            <option title="503" value="El">萨尔瓦多 (+503)</option>
                            <option title="291" value="Er">厄立特里亚 (+291)</option>
                            <option title="372" value="Es">爱沙尼亚 (+372)</option>
                            <option title="251" value="Et">埃塞俄比亚 (+251)</option>
                            <option title="679" value="Fi">斐济群岛 (+679)</option>
                            <option title="358" value="Fn">芬兰 (+358)</option>
                            <option title="33" value="Fr">法国 (+33)</option>
                            <option title="596" value="Fa">法国安的列斯群岛 (+596)</option>
                            <option title="594" value="Fg">法属圭亚那 (+594)</option>
                            <option title="689" value="Fp">法属玻利尼西亚 (+689)</option>
                            <option title="241" value="Gb">加蓬 (+241)</option>
                            <option title="220" value="Gm">冈比亚 (+220)</option>
                            <option title="995" value="Go">乔治亚 (+995)</option>
                            <option title="49" value="Gr">德国 (+49)</option>
                            <option title="233" value="Gh">加纳 (+233)</option>
                            <option title="350" value="Gi">直布罗陀 (+350)</option>
                            <option title="30" value="Ge">希腊 (+30)</option>
                            <option title="299" value="Gn">格陵兰 (+299)</option>
                            <option title="1" value="Ga">格林纳达 (+1)</option>
                            <option title="590" value="Gd">瓜德罗普岛 (+590)</option>
                            <option title="1" value="Gu">关岛 (+1)</option>
                            <option title="502" value="Gl">危地马拉 (+502)</option>
                            <option title="592" value="Gy">‎圭亚那 (+592)</option>
                            <option title="509" value="Ha">海地 (+509)</option>
                            <option title="504" value="Ho">洪都拉斯 (+504)</option>
                            <option title="852" value="Hk">中国香港 (+852)</option>
                            <option title="36" value="Hg">匈牙利 (+36)</option>
                            <option title="354" value="Il">冰岛 (+354)</option>
                            <option title="91" value="Id">印度 (+91)</option>
                            <option title="62" value="In">印度尼西亚 (+62)</option>
                            <option title="98" value="Ir">伊朗 (+98)</option>
                            <option title="964" value="Iq">伊拉克 (+964)</option>
                            <option title="353" value="Ie">爱尔兰 (+353)</option>
                            <option title="972" value="Is">以色列 (+972)</option>
                            <option title="39" value="It">意大利 (+39)</option>
                            <option title="225" value="Ic">科特迪瓦 (+225)</option>
                            <option title="1" value="Ja">牙买加 (+1)</option>
                            <option title="81" value="Jp">日本 (+81)</option>
                            <option title="962" value="Jo">约旦 (+962)</option>
                            <option title="7" value="Ka">哈萨克斯坦 (+7)</option>
                            <option title="254" value="Kn">肯尼亚 (+254)</option>
                            <option title="965" value="Kw">科威特 (+965)</option>
                            <option title="856" value="Lo">老挝 (+856)</option>
                            <option title="371" value="La">拉脱维亚 (+371)</option>
                            <option title="961" value="Lb">黎巴嫩 (+961)</option>
                            <option title="266" value="Ls">莱索托 (+266)</option>
                            <option title="218" value="Ly">利比亚 (+218)</option>
                            <option title="370" value="Li">立陶宛 (+370)</option>
                            <option title="352" value="Lx">卢森堡 (+352)</option>
                            <option title="853" value="Mu">中国澳门 (+853)</option>
                            <option title="389" value="Ms">马其顿 (+389)</option>
                            <option title="261" value="Md">马达加斯加 (+261)</option>
                            <option title="265" value="Ml">马拉维 (+265)</option>
                            <option title="60" value="Ma">马来西亚 (+60)</option>
                            <option title="960" value="Mv">马尔代夫 (+960)</option>
                            <option title="223" value="Mr">马里共和国 (+223)</option>
                            <option title="356" value="Mt">马耳他 (+356)</option>
                            <option title="596" value="Mq">马提尼克 (+596)</option>
                            <option title="52" value="Mx">墨西哥 (+52)</option>
                            <option title="373" value="Mo">摩尔多瓦 (+373)</option>
                            <option title="377" value="Mn">摩纳哥 (+377)</option>
                            <option title="976" value="Mg">蒙古 (+976)</option>
                            <option title="382" value="Me">黑山 (+382)</option>
                            <option title="212" value="Mc">摩洛哥 (+212)</option>
                            <option title="258" value="Mz">莫桑比克 (+258)</option>
                            <option title="95" value="My">缅甸 (+95)</option>
                            <option title="264" value="Nb">纳米比亚 (+264)</option>
                            <option title="977" value="Np">尼泊尔 (+977)</option>
                            <option title="31" value="Ne">荷兰 (+31)</option>
                            <option title="599" value="Na">荷属安的列斯 (+599)</option>
                            <option title="687" value="Nc">新喀里多尼亚 (+687)</option>
                            <option title="64" value="Nz">新西兰 (+64)</option>
                            <option title="505" value="Ni">尼加拉瓜 (+505)</option>
                            <option title="227" value="Ng">尼日尔 (+227)</option>
                            <option title="234" value="Nr">尼日利亚 (+234)</option>
                            <option title="672" value="Nl">诺福克岛 (+672)</option>
                            <option title="47" value="No">挪威 (+47)</option>
                            <option title="968" value="Om">阿曼 (+968)</option>
                            <option title="92" value="Pk">巴基斯坦 (+92)</option>
                            <option title="680" value="Pl">帕劳 (+680)</option>
                            <option title="507" value="Pa">巴拿马 (+507)</option>
                            <option title="595" value="Py">巴拉圭 (+595)</option>
                            <option title="51" value="Pu">秘鲁 (+51)</option>
                            <option title="63" value="Ph">菲律宾 (+63)</option>
                            <option title="48" value="Po">波兰 (+48)</option>
                            <option title="351" value="Pg">葡萄牙 (+351)</option>
                            <option title="1" value="Pr">波多黎各 (+1)</option>
                            <option title="974" value="Qt">卡塔尔 (+974)</option>
                            <option title="40" value="Ro">罗马尼亚 (+40)</option>
                            <option title="7" value="Ru">俄罗斯 (+7)</option>
                            <option title="250" value="Rw">卢旺达 (+250)</option>
                            <option title="290" value="Sh">圣海伦娜 (+290)</option>
                            <option title="1" value="Sc">圣卢西亚 (+1)</option>
                            <option title="378" value="Sm">圣马力诺 (+378)</option>
                            <option title="966" value="Sd">沙特阿拉伯 (+966)</option>
                            <option title="221" value="Sg">塞内加尔 (+221)</option>
                            <option title="381" value="Sr">塞尔维亚 (+381)</option>
                            <option title="248" value="Si">塞舌尔群岛 (+248)</option>
                            <option title="232" value="Sl">塞拉利昂 (+232)</option>
                            <option title="65" value="Sn">新加坡 (+65)</option>
                            <option title="421" value="So">斯洛伐克共和国 (+421)</option>
                            <option title="386" value="Sv">斯洛文尼亚 (+386)</option>
                            <option title="27" value="Sa">南非 (+27)</option>
                            <option title="82" value="Ks">韩国 (+82)</option>
                            <option title="34" value="Sp">西班牙 (+34)</option>
                            <option title="94" value="Sk">斯里兰卡 (+94)</option>
                            <option title="597" value="Su">苏里南 (+597)</option>
                            <option title="268" value="Sz">斯威士兰 (+268)</option>
                            <option title="46" value="Se">瑞典 (+46)</option>
                            <option title="41" value="Sw">瑞士 (+41)</option>
                            <option title="963" value="Sy">叙利亚 (+963)</option>
                            <option title="886" value="Ti">台湾 (+886)</option>
                            <option title="992" value="Tj">塔吉克斯坦 (+992)</option>
                            <option title="255" value="Tz">坦桑尼亚 (+255)</option>
                            <option title="66" value="Th">泰国 (+66)</option>
                            <option title="228" value="Tg">多哥 (+228)</option>
                            <option title="1" value="Tt">特立尼达和多巴哥 (+1)</option>
                            <option title="216" value="Tn">突尼斯 (+216)</option>
                            <option title="90" value="Tk">土耳其 (+90)</option>
                            <option title="993" value="Tm">土库曼斯坦 (+993)</option>
                            <option title="1" value="Uv">美属维尔京群岛 (+1)</option>
                            <option title="256" value="Ug">乌干达 (+256)</option>
                            <option title="380" value="Ur">乌克兰 (+380)</option>
                            <option title="971" value="Ua">阿拉伯联合酋长国 (+971)</option>
                            <option title="44" value="Uk">英国 (+44)</option>
                            <option title="1"  value="Us">美国 (+1)</option>
                            <option title="598" value="Uu">乌拉圭 (+598)</option>
                            <option title="998" value="Uz">乌兹别克斯坦 (+998)</option>
                            <option title="39" value="Vc">梵蒂冈城 (+39)</option>
                            <option title="58" value="Ve">委内瑞拉 (+58)</option>
                            <option title="84" value="Vi">越南 (+84)</option>
                            <option title="808" value="Wa">威克岛 (+808)</option>
                            <option title="685" value="Ws">西萨摩亚 (+685)</option>
                            <option title="967" value="Ye">也门 (+967)</option>
                            <option title="381" value="Yg">南斯拉夫 (+381)</option>
                            <option title="243" value="Za">扎伊尔 (+243)</option>
                            <option title="260" value="Zm">赞比亚 (+260)</option>
                        </select>--><label class="label" for="p">手机号码</label><input name="p" class="loginInputBox input wide focus mt8" id="p" type="tel" size="20" maxlength="50" user-scalable="no"><p></p><label class="label" for="wp">工作电话</label><input name="wp" class="loginInputBox input wide focus mt8" id="wp" type="tel" size="20" maxlength="50" user-scalable="no"><label class="label" for="wx">微信</label><input name="wx" class="loginInputBox input wide focus mt8" id="wx" type="tel" size="20" maxlength="50" user-scalable="no"><label class="label" for="xm">姓名:</label><label class="label" for="xm"><%=FullName%></label><input name="display" id="display" type="hidden" value="page"><input name="save" title="绑定手机号与邮箱地址" class="btn button mb16 primary fiftyfifty wide" type="submit" value=" 绑定 "><!--<p class="small"><a href="/home/home.aspx">以后提醒我</a><br>
                            <a href="/_ui/identity/phone/AddPhoneNumber?retURL=%2Fhome%2Fhome.aspx&amp;d=m&amp;n=true">我不想注册我的手机</a></p>-->
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">© 2017 ,北京凤凰世纪科技有限公司. 保留所有权利。</div>
    <script>var p = document.getElementById('footer').parentNode; while (p.nodeName.toLowerCase() === 'div') { p.style.height = '100%'; p = p.parentNode; }</script>
    <!-- Body events -->
    <script type="text/javascript">function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([1445651100000], false, false, ''); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</body>
</html>
