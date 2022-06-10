<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterListPage.aspx.cs"
    Inherits="WebClient.apps.FilterListPage" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <title><%=PageTitle%> ~  - Developer Edition</title>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/ajax4jsf.js"  type="text/javascript"></script>
    <script src="/jslibrary/sfdc/SfdcCore.js" type="text/javascript"></script>
    <script src="/EXT/ext-3.2.2/ext.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main_source.js" type="text/javascript"></script>
    <!--<script src="/jslibrary/sfdc/Chatter.js" type="text/javascript"></script>-->
    <script src="/static/111213/js/picklist.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/VFState.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/Activity.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/Calendar.js" type="text/javascript"></script>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link class="user" href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
     <link class="user" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/EXT/ext-3.2.2/resources/css/ext-all.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "2015-1-23 下午5:25", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Contact';</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>      //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '118.186.239.73', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F003%3Ffcf%3D00B90000008ViCg');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif <%=TabCss%>  listPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
    <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input
        type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.aspx" /><input
            type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login..com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.aspx&amp;stbdtimeout=1" /><input
                type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden"
                    name="timeoutText" id="timeoutText" value="由于安全原因，您的  会话即将超时。<br><br>您希望作何选择？" /></form>
    <script>        var secondsLeftValue = 7200, secondsPopupValue = 7170, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7200, 7170) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1__com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a href="#skiplink" class="navSkipLink zen-skipLink zen-assistiveText">跳到主内容</a><div
        id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <cc1:EntityQueryListBlock runat="server" TypeCode="2" ID="EntityQueryListBlock1" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="bPageFooter noTableFooter">
           <!-- <div>
                <span class="brandQuaternaryFgr">Copyright © 2016 北京凤凰世纪科技有限公司版权所有。保留所有权利。</span>&nbsp;|&nbsp;<a
                    href="http://www..com/company/privacy.aspx" class="brandQuaternaryFgr" target="_blank"
                    title="隐私声明 （新窗口）">隐私声明</a>&nbsp;|&nbsp;<a href="http://www..com/company/security.aspx"
                        class="brandQuaternaryFgr" target="_blank" title="安全声明 （新窗口）">安全声明</a>&nbsp;|&nbsp;<a
                            href="http://www..com/company/msa.aspx" class="brandQuaternaryFgr" target="_blank"
                            title="使用条款 （新窗口）">使用条款</a>&nbsp;|&nbsp;<a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                class="brandQuaternaryFgr" title="508 符合性 （新窗口）">508 符合性</a></div>-->
        </div>
        <div>
        </div>
    </div>
    <!--<script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1414132750000, "host": "", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>-->
    <!--<script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>-->
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <!--<script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
<!-- page generation time: 150ms -->
