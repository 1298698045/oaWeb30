<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs"
    Inherits="WebClient._ui.system.security.ChangePassword" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>更改我的密码 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1423008149000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/setupV2.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Setup.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-2-9 下午5:34", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1423008149000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif setupTab  ChangePassword sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div id="bodyDiv_setup" class="bodyDiv brdPalette brandPrimaryBrd">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="outer setupV2">
                <tbody>
                    <tr>
                        <td class="oLeft">
                            <cc1:SetupNavTree2 ID="SetupNavTree1" Version="2" runat="server" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                                        <div class="ptBody">
                                            <div class="content">
                                                <img title="" class="pageTitleIcon" alt="" src="/s.gif"><h1 class="pageType noSecondHeader">
                                                    更改我的密码</h1>
                                                <div class="blank">
                                                    &nbsp;</div>
                                            </div>
                                            <div class="links"><!--
                                                <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                                    <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a>--></div>
                                        </div>
                                        <div class="ptBreadcrumb">
                                        </div>
                                    </div>
                            <form onsubmit="if (window.ffInAlert) { return false; } if(!validatePwd()) {return false;}" name="editPage" method="post"
                            id="editPage" autocomplete="off" action1="/_ui/system/security/ChangePassword?setupid=ChangePassword">
                            <input type="hidden" value="/ui/setup/Setup?setupid=PersonalInfo" id="cancelURL"
                                name="cancelURL">
                            <input type="hidden" value="/ui/setup/Setup?setupid=PersonalInfo" id="retURL" name="retURL">
                            <input type="hidden" value="/_ui/system/security/ChangePassword?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo&amp;setupid=ChangePassword"
                                id="save_new_url" name="save_new_url">
                            <input type="hidden" value="ChangePassword" id="setupid" name="setupid">
                            <div class="setup">
                                <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                            alt="" src="/s.gif"><h2 class="mainTitle">
                                                                更改我的密码</h2>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbBody">
                                        <div id="" class="message infoM4">
                                            <table cellspacing="0" cellpadding="0" border="0" class="messageTable">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <img title="信息" class="msgIcon" alt="信息" src="/s.gif">
                                                        </td>
                                                        <td class="messageCell">
                                                            <div class="messageText">
                                                                您的密码上次更改或重置于 <%=LastChangePassword%></div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <script>                                            if (window.sfdcPage) sfdcPage.registerMessage('');</script>
                                        <script>

                                        </script>
                                        <div style="display:block" id="errorDiv_ep" class="pbError"><%=ErrorMessage%>
                                            <!--错误：无效数据。<br />
                                            请查看下列所有错误消息以纠正数据。--></div>
                                        <div id="head_1_ep" class="pbSubheader brandTertiaryBgr first tertiaryPalette">
                                            <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                                <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                    class="requiredText"> = 必填信息</span></span></span><h3>
                                                        密码信息<span class="titleSeparatingColon">:</span></h3>
                                        </div>
                                        <div class="pbSubsection">
                                            <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                                <tbody>
                                                    <tr>
                                                        <td class="labelCol">
                                                            用户名
                                                        </td>
                                                        <td colspan="3" class="data2Col">
                                                            <div class="usernameText">
                                                                <%=UserName%></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="labelCol requiredInput">
                                                            <label for="p4">
                                                                <span class="requiredMark">*</span>旧密码</label>
                                                        </td>
                                                        <td colspan="3" class="data2Col">
                                                            <div class="requiredInput">
                                                                <div class="requiredBlock">
                                                                </div>
                                                               <input type="password" size="20" name="p4" id="p4"></div>
                                                            <div class="errorMsg" id="errorMsg4" style="display: none;">
                                                                <strong>错误:</strong> 必须输入一个值</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="labelCol">
                                                            <label for="p5">
                                                                新密码</label>
                                                        </td>
                                                        <td colspan="3" class="data2Col">
                                                            <input type="password" size="20" name="p5" id="p5"><span id="strengthImage" aria-role="alert"
                                                                aria-live="assertive"><img alt="密码强度指示器" src="/img/passwordStrength/neutral.gif"></span>
                                                            <span id="passStrength" aria-role="alert" aria-live="assertive" class="pscNoEntry"
                                                                classname="pscNoEntry"></span>
                                                            <div tabindex="0" onmouseover="addMouseOver(this)" onfocus="addMouseOver(this)" id="passwordInfo"
                                                                class="mouseOverInfoOuter">
                                                                <img title="" class="infoIcon" alt="" src="/s.gif"><div style="display: none; left: 19px;
                                                                    opacity: -0.2;" id="passwordInfo_inner" class="mouseOverInfo">
                                                                    <span>使用至少 8 个字符并包含字母和数字的组合。</span></div>
                                                            </div>
                                                            <div class="errorMsg" id="errorMsg5" style="display: none;">
                                                                <strong>错误:</strong> 必须输入一个值</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="labelCol">
                                                            <label for="p6">
                                                                验证新密码</label>
                                                        </td>
                                                        <td colspan="3" class="data2Col">
                                                            <input type="password" size="20" name="p6" id="p6"><span id="passVerify" aria-role="alert"
                                                                aria-live="assertive"><img alt="" src="/img/s.gif"></span>
                                                            <div class="errorMsg" id="errorMsg6" style="display: none;">
                                                                <strong>错误:</strong> 两次密码必须相同。</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="labelCol">
                                                            <label for="p2">
                                                                问题</label>
                                                        </td>
                                                        <td colspan="3" class="data2Col">
                                                            <select name="p2" id="p2">
                                                                <option value="">--无--</option>
                                                                <option value="3">您宠物的名字？</option>
                                                                <option value="2">您母亲的未婚姓氏？</option>
                                                                <option value="1">您出生于哪个城市？</option>
                                                                <option value="7">您第一份工作在哪个城市？</option>
                                                                <option value="6">您小时候喜欢的朋友名字是什么？</option>
                                                                <option value="5">您在哪个城市遇到您的配偶/另一半？</option>
                                                                <option value="4">您小时候的绰号是什么？</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="labelCol last">
                                                            答案
                                                        </td>
                                                        <td colspan="3" class="data2Col last">
                                                            <input type="text" size="20" name="p3" maxlength="80" id="p3"><div tabindex="0" onmouseover="addMouseOver(this)"
                                                                onfocus="addMouseOver(this)" class="mouseOverInfoOuter">
                                                                <img title="" class="infoIcon" alt="" src="/s.gif"><div style="display: none;" class="mouseOverInfo">
                                                                    如果忘记了密码，我们将要求您回答此问题。</div>
                                                            </div>
                                                            <span id="answerVerify">
                                                                <img alt="" src="/img/s.gif"></span><span id="answerContainsPassword"></span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="pbBottomButtons">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="12" height="1" style="margin-right: 0.25em;" title="" class="minWidth"
                                                            alt="" src="/s.gif">&nbsp;
                                                    </td>
                                                    <td id="bottomButtonRow" class="pbButtonb">
                                                        <input type="submit" name="save" title="保存" class="primary btn" value=" 保存 " onclick="return checkPass()">
                                                        <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 ">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg">
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "cancel"]); }
                                </script>
                                <script type="text/javascript">
                                    new ChangePassword(8, true, false, false, false, '使用至少 8 个字符并包含字母和数字的组合。', true, false)
                                    function checkPass() {
                                        return true;
                                    }
                                    function validatePwd()
                                    {
                                        var newPwd = document.getElementById("p5").value;
                                        var confirmPwd = document.getElementById("p6").value;
                                        if (newPwd == "") {
                                            alert("“新密码”不能为空！");
                                            return false;
                                        }
                                        if (confirmPwd == "")
                                        {
                                            alert("“验证新密码”不能为空！");
                                            return false;
                                        }
                                        if (newPwd != confirmPwd)
                                        {
                                            alert("“验证新密码”与“新密码”不一致！");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                            </div>
                            </form>
                            <!-- Body events -->
<script type="text/javascript">    function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "7dAGLNo7xy_Y44Q7avKa.Myi5ZHyfCsDfiuT4DoWpsDxKvdJkhUWFaB1R2FYKCnafgExnIdkkXPkfBMxwptBfsMZCZ_Bcpbrk6BqIr3nnWBkkoRPRxo.6m0uba_OCtqaL6Hv9_MzNTP_.Dqkf_95qFS2S7xp.INDQt3lzz92UNWPL4UacMWB2zWOP3Rl5qiA5rgxtg=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
<!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
</body>
</html>
