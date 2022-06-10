<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecDetail.aspx.cs" Inherits="WebClient.apps.RecDetail" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title><%=EntityDisplayName%>: <%=EntityName%></title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/rlHovers.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterCore.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterExtended.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/AssociationQueue.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/SocialCrm.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/SocialKeyCRM.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DataDotComClean.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>     //   var social = {};</script>
    <script>      //  social.socialStateInfo = { "li": { "oauth": false, "access_token": "", "handle": "", "oauthLink": "https://ap1..com/services/socialcrm/oauthForward?providerType\u003dli", "provider": "LINKED_IN", "parentId": "0039000001HgjaT" }, "tw": { "oauth": false, "access_token": "", "handle": "", "oauthLink": "https://ap1..com/services/socialcrm/oauthForward?providerType\u003dtw", "provider": "TWITTER", "parentId": "0039000001HgjaT" }, "fb": { "oauth": false, "access_token": "", "handle": "", "oauthLink": "https://ap1..com/services/socialcrm/oauthForward?providerType\u003dfb", "provider": "FACEBOOK", "parentId": "0039000001HgjaT" }, "yt": { "oauth": false, "access_token": "", "handle": "", "oauthLink": "https://ap1..com/services/socialcrm/oauthForward?providerType\u003dyt", "provider": "YOU_TUBE", "parentId": "0039000001HgjaT" }, "kl": { "showSplashScreen": true, "oauth": false, "access_token": "", "handle": "", "oauthLink": "https://ap1..com/services/socialcrm/oauthForward?providerType\u003dkl", "provider": "KLOUT", "parentId": "0039000001HgjaT" }, "parentId": "0039000001HgjaT", "parentEditable": "true", "defaultSocialProvider": "", "defaultProfilePicURL": "", "_CONFIRMATIONTOKEN": "", "_CONFIRMATIONTOKEN_userOauth": "\u003d", "name": "liu jack", "companyName": "333", "email": "jackliu185@sina.com", "entityType": "Contact", "dataFormat": { "numberFormatGroupingSeparator": "," }, "defaultAvatarUrl": "/img/social/unknown_profile_pic.png?v\u003d2" };</script>
    <script>     //   (function () { var loadSocialCrmJs = function () { setTimeout(function () { var s = document.createElement('script'); s.type = 'text/javascript'; s.src = '/jslibrary/1424969980000/sfdc/SocialCrm.js'; document.getElementsByTagName('head')[0].appendChild(s); }, 1); }; if (window.attachEvent) { window.attachEvent('onload', loadSocialCrmJs); } else { window.addEventListener('load', loadSocialCrmJs, false); } })();</script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/1428000924000/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DataDotComClean.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DedupeJS.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Scheduling.js"></script>
    <script>        window.sfdcPage = new DetailPage("0039000001HgjaT");
        UserContext.initialize({ "networkId": "", "labelLastModified": "1428000924000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Contact';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/AssociationQueue.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/SocialCrm.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/SocialKeyCRM.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DataDotComClean.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428454681000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.172', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F0039000001HgjaT');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif <%=TabCss %>  detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
    <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input
        type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.aspx" /><input
            type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login..com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.aspx&amp;stbdtimeout=1" /><input
                type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden"
                    name="timeoutText" id="timeoutText" value="由于安全原因，您的  会话即将超时。<br><br>您希望作何选择？" /></form>
    <script>        var secondsLeftValue = 7160, secondsPopupValue = 7130, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7160, 7130) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.jsp" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
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
                        <cc1:LeftQuickMenu runat="server" id="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content"><img title="<%=EntityDisplayName%>" class="pageTitleIcon" alt="<%=EntityDisplayName%>" src="/s.gif"><h1 class="pageType"><%=EntityDisplayName%><span class="titleSeparatingColon">:</span></h1><h2 class="pageDescription"><%=EntityName%></h2><div class="blank">&nbsp;</div></div>
                                        <!--
                                        <div class="content"><img title="报销单" class="pageTitleIcon" alt="报销单" src="/s.gif"><h1 class="pageType">报销单<span class="titleSeparatingColon">:</span></h1><h2 class="pageDescription"> 出差报销单</h2><div class="blank">&nbsp;</div></div>-->
                                        <div class="links"><!--
                                            <a href="/setup/ui/uiconfigrelatedlistsedit.aspx?retURL=%2F0039000001HgjaT&amp;id=Contact"
                                                class="configLinks">自定义页面</a> | <a href="/layouteditor/layoutEditor.apexp?type=Contact&amp;lid=00h9000000RbNyf&amp;retURL=%2F0039000001HgjaT"
                                                    class="configLinks">编辑布局</a> | <a href="javascript:printWin(%27/0039000001HgjaT/p?retURL=%2F0039000001HgjaT%27)"
                                                        class="configLinks" title="可打印视图 （新窗口）">可打印视图</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                            title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                                class="helpIcon" /></a>--></div>
                                    </div>
                                    <div class="ptBreadcrumb" style="font-size:16px;">
                                        &nbsp;&#171&nbsp;<a href="<%=FromURL%>">返回列表</a></div>
                                    <!--
                                    <div class="topics metadata" id="section_header"  style="">
                                        <div class="zen feedLinks" id="feedLinks" style="display:none">
                                            <ul class="zen-inlineList">
                                                <li>
                                                    <div class="chatterShowHideFeed">
                                                        <script>                                                            chatter.getToolbox().setToken('cHShmhqsVrEf2QsVVv6gRPIqMUmm_168IKgo_zwIHR1HJJACNqBlzHxIxf6tnI9VPVoE7VDAh5VG3cB_fmJ12ubpR2us9iT25dVaRsU.8phKFwL9P.YENm8CtQ2rU91i3lA9E2nzgVuODAErpXwEIIetobQ=');</script>
                                                        <span class="showFeedLink" id="showFeedLink"><a href="javascript:%20void%280%29%3B"
                                                            class="innerLink" onclick="chatter.getFeed().toggle(&#39;{&quot;subjectId&quot;:&quot;0039000001HgjaT&quot;,&quot;feedType&quot;:&quot;ENTITY&quot;,&quot;writable&quot;:&quot;ReadWrite&quot;,&quot;numFeedItems&quot;:20,&quot;canSortFeed&quot;:true,&quot;sortByComments&quot;:false,&quot;showFeedTitle&quot;:false,&quot;isDropDownFiltersVisible&quot;:true,&quot;alwaysShowFullText&quot;:false,&quot;isShowMoreOfThis&quot;:false,&quot;isCompactFeed&quot;:false,&quot;feedfilter&quot;:&quot;all&quot;,&quot;keyprefix&quot;:&quot;&quot;}&#39;, false);">
                                                            <img src="/s.gif" alt="显示摘要" title="显示摘要" /><span class="linkText">显示摘要</span></a></span><span
                                                                class="hideFeedLink" id="hideFeedLink" style="display: none"><a href="javascript:%20void%280%29%3B"
                                                                    class="innerLink" onclick="chatter.getFeed().toggle(&#39;{&quot;subjectId&quot;:&quot;0039000001HgjaT&quot;,&quot;feedType&quot;:&quot;ENTITY&quot;,&quot;writable&quot;:&quot;ReadWrite&quot;,&quot;numFeedItems&quot;:20,&quot;canSortFeed&quot;:true,&quot;sortByComments&quot;:false,&quot;showFeedTitle&quot;:false,&quot;isDropDownFiltersVisible&quot;:true,&quot;alwaysShowFullText&quot;:false,&quot;isShowMoreOfThis&quot;:false,&quot;isCompactFeed&quot;:false,&quot;feedfilter&quot;:&quot;all&quot;,&quot;keyprefix&quot;:&quot;&quot;}&#39;, false);"><img
                                                                        src="/s.gif" alt="隐藏摘要" title="隐藏摘要" /><span class="linkText">隐藏摘要</span></a></span> </div>
                                               </li>
                                            </ul>
                                        </div>
                                        <script>    chatter.getToolbox().setToken('.n81QyjBnhi0bzzfnfQuEC9m6F0Sqz.JX0QRCYA8Let.fJv4gZBJF2GRmaNe24_RXvMbcc795_JQuKSvqKfEgEWyH2UZpoORoqrjXmRMiBTkf.qU.2HrJR67OWSNEaKvc9xGd4HMcWuwAukybxXdziFkNP0=');</script>
                                        <div class="topicsOnRecordPage" style="">
                                            <div class="topics " id="topicContainer0039000001HgjaT" data-entityid="0039000001HgjaT"
                                                data-referrer="RECORD_PAGE" data-iswidget="true">
                                                <div class="view topic-widgetWithInfoBubble">
                                                    <a href="javascript: void(0);" class="editLink">单击添加主题</a> &nbsp;
                                                    <div class="topic-infoBubbleFixAbs">
                                                        <div class="zen topic-infoBubbleFixRel">
                                                            <div class="topic-infoBubbleWrapper" data-topicwidget="TopicInfoBubble">
                                                                <a href="javascript:void(0);" title="您为什么要添加主题到记录？" class="iconParent">
                                                                    <img class="visibilityicon" src="/s.gif" alt="您为什么要添加主题到记录？" width="1" height="1">
                                                                </a>
                                                                <div class="topic-infoBubble hidden zen-callout zen-arrowLeft zen-sideNorth">
                                                                    <b class="zen-arrow"></b>
                                                                    <div class="zen-inner">
                                                                        <div class="zen-body zen-ptm zen-phm">
                                                                            <p>
                                                                                从主题页面或列表视图中添加主题到快速访问相关记录。尽管每个人都可看到主题名，但记录的可见性仍然不变。
                                                                            </p>
                                                                        </div>
                                                                        <div class="visibilityFooter">
                                                                            <a title="了解更多（新窗口）" href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);">
                                                                                了解更多</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearingBox">
                                        </div>
                                    </div>
                                    <div class="chatterfeedshell" id="chatterfeedshell">
                                    </div>
                                    <script>                                        try { chatter.getFeed().initializeFeedFilterReset(); } catch (e) { }</script>
                                    <div class="ptBreadcrumb">
                                    </div>-->
                                </div>
                        <script type="text/javascript">                            if (window.picklist) { picklist.initAll(); }</script>
                        <script type="text/javascript">
                        </script>
                        <div id="RLPanelShadow" class="RLPanelShadow"><div class="rls_top"><div class="rls_tl"></div><div class="rls_tr"></div></div><div class="rls_l"></div><div class="rls_r"></div><div onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" id="RLPanel" class="RLPanel"><iframe frameborder="0" title="隐藏框架 - 忽略" src="/emptyHtmlDoc.html" name="RLPanelFrame" id="RLPanelFrame"></iframe></div><div class="rls_bottom"><div class="rls_bl"></div><div class="rls_br"></div></div></div><div class="listHoverLinks"><span class="invisibleMinHeight">|</span></div>  <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                        <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em;" /><h2
                                                class="mainTitle">
                                                <%=EntityDisplayName%>详细信息</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow">
                                            <input value=" 保存 " class="btn" title="保存" style="display: none; height:25px;" name="inlineEditSave"
                                                onclick="sfdcPage.save();" type="button" />
                                            <input value=" 取消 " class="btn" title="取消" style="display: none;" name="inlineEditCancel"
                                                onclick="sfdcPage.revert();" type="button" />
                                            <input value=" 编辑 " class="btn" title="编辑" name="edit" style=" height:25px;" onclick="navigateToUrl('<%=EditURL%>','DETAIL','edit');"
                                                type="button" />
                                            <input value=" 删除 " class="btn" title="删除" name="del" style=" height:25px;" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?delID=<%=EntityId%>&amp;type=<%=TypeCode%>&amp;retURL=<%=FromURL%>&amp;_CONFIRMATIONTOKEN=&amp;failRetURL=<%=FromURL%>','DETAIL','del');"
                                                type="button" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">
                                    错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubsection">                                    
                                    <%=FormHTML%>
                                </div><!--
                                <div class="pbSubheader brandTertiaryBrd tertiaryPalette" id="head_1_ep">
                                    <h3>
                                        自定义链接<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">                                 
                                </div>-->
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em;" />&nbsp;
                                        </td>
                                        <td class="pbButtonb" id="bottomButtonRow">
                                            <input value=" 保存 " class="btn" title="保存" style="display: none;" name="inlineEditSave"
                                                onclick="sfdcPage.save();" type="button" />
                                            <input value=" 取消 " class="btn" title="取消" style="display: none;" name="inlineEditCancel"
                                                onclick="sfdcPage.revert();" type="button" />
                                            <input value=" 编辑 " class="btn" title="编辑" name="edit" onclick="navigateToUrl('/<%=EntityCode%>/e?id=<%=EntityId%>&retURL=<%=RetURL%>','DETAIL','edit');"
                                                type="button" />
                                            <input value=" 删除 " class="btn" title="删除" name="del" style=" height:25px;" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?delID=<%=EntityId%>&amp;type=<%=TypeCode%>&amp;retURL=<%=FromURL%>&amp;_CONFIRMATIONTOKEN=&amp;failRetURL=<%=FromURL%>','DETAIL','del');" type="button" />
                                            
                                            <!--
                                            <input value=" 复制 " class="btn" title="复制" name="clone" onclick="navigateToUrl('/0039000001HgjaT/e?clone=1&amp;retURL=%2F0039000001HgjaT','DETAIL','clone');"
                                                type="button" />
                                            <input value=" 请求更新 " class="btn" title="请求更新" name="mm" onclick="navigateToUrl('/cntc/cntcupdate/contactupdate.jsp?who_id=0039000001HgjaT&amp;retURL=%2F0039000001HgjaT','DETAIL','mm');"
                                                type="button" />
                                            <div class="menuButton" id="workWithPortalCopy">
                                                <div class="menuButtonButton" id="workWithPortalCopyButton">
                                                    <span class="menuButtonLabel" id="workWithPortalCopyLabel" tabindex="0">管理外部用户</span></div>
                                                <div class="menuButtonMenu" id="workWithPortalCopyMenu">
                                                    <a href="/005/e?ut=c&amp;retURL=%2F0039000001HgjaT&amp;cntc=0039000001HgjaT&amp;Email=jackliu185%40sina.com&amp;Username=jackliu185%40sina.com&amp;name_firstName=jack&amp;name_lastName=liu&amp;Alias=jliu&amp;CommunityNickname=jackliu185"
                                                        class="firstMenuItem menuButtonMenuLink" name="csp">启用客户用户</a></div>
                                            </div>
                                            <script>                                                new MenuButton('workWithPortalCopy', false);</script>-->
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script src="/static/111213/js/picklist.js"></script>
                        <script>                //            new InlineEditData({ "entityId": "0039000001HgjaT", "sysMod": "14a00dd49b0", "fields": [{ "formatPhone": false, "addDir": false, "maxLength": 40, "fieldType": "PHONE", "initialValue": "", "state": "EDIT", "fieldId": "con14", "required": false }, { "fieldType": "DYNAMICENUM", "picklistId": "00N9000000CFoa6", "initialValue": ["", ""], "state": "EDIT", "fieldId": "00N9000000CFoa6", "required": false }, { "state": "EDIT", "maxLength": 32000, "required": false, "fieldId": "con20", "fieldType": "STRINGPLUSCLOB", "initialValue": "" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["", "000000000000000"], "state": "EDIT", "domain": [["联系人", "003"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "con8", "required": false, "useNewLookups": false }, { "fieldType": "ADDRESS", "labels": ["邮寄地址 - 街道", "邮寄地址 - 城市", "邮寄地址 - 州/省", "邮寄地址 - 邮政编码", "邮寄地址 - 国家/地区", "邮寄纬度", "邮寄经度"], "initialValue": ["", "", "", "", "", ["", ""], ["", ""]], "hasAddressPicklists": false, "state": "EDIT", "fieldId": "con19", "required": false, "addressFormat": [4, 3, 2, 1, 0] }, { "state": "EDIT", "maxLength": 128, "required": false, "fieldId": "con5", "fieldType": "TEXT", "initialValue": "" }, { "formatPhone": false, "addDir": false, "maxLength": 40, "fieldType": "FAX", "initialValue": "", "state": "EDIT", "fieldId": "con11", "required": false }, { "state": "EDIT", "maxLength": 40, "required": false, "fieldId": "con16", "fieldType": "TEXT", "initialValue": "" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["333", "00190000019mlFI"], "state": "EDIT", "domain": [["客户", "001"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "con4", "required": false, "useNewLookups": false }, { "state": "NONE", "fieldId": "con1", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"] }, { "formatPhone": false, "addDir": false, "maxLength": 40, "fieldType": "PHONE", "initialValue": "", "state": "EDIT", "fieldId": "con13", "required": false }, { "state": "EDIT", "required": false, "fieldId": "con7", "hasTime": false, "fieldType": "BIRTHDAY" }, { "hasMiddle": false, "reverse": true, "hasSuffix": false, "picklistId": 8, "fieldType": "PERSONNAME", "labels": ["称谓", "名字", "姓氏", "", "", ""], "initialValue": [["", ""], "jack", "liu", "", "", ""], "hasSalutation": true, "state": "EDIT", "fieldId": "con2", "required": true, "hasInformal": false }, { "formatPhone": false, "addDir": false, "maxLength": 40, "fieldType": "PHONE", "initialValue": "", "state": "EDIT", "fieldId": "con17", "required": false }, { "state": "EDIT", "maxLength": 100, "required": false, "fieldId": "00N9000000CFoa5", "fieldType": "TEXT", "initialValue": "" }, { "fieldType": "ADDRESS", "labels": ["其它街道", "其它城市", "其它州/省", "其它邮政编码", "其它国家/地区", "其他纬度", "其他经度"], "initialValue": ["", "", "", "", "", ["", ""], ["", ""]], "hasAddressPicklists": false, "state": "EDIT", "fieldId": "con18", "required": false, "addressFormat": [4, 3, 2, 1, 0] }, { "state": "EDIT", "maxLength": 80, "required": false, "fieldId": "con15", "fieldType": "EMAIL", "initialValue": "jackliu185@sina.com" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "CreatedBy", "required": true, "useNewLookups": false }, { "formatPhone": false, "addDir": false, "maxLength": 40, "fieldType": "PHONE", "initialValue": "", "state": "EDIT", "fieldId": "con10", "required": false }, { "state": "EDIT", "maxLength": 80, "required": false, "fieldId": "con6", "fieldType": "TEXT", "initialValue": "" }, { "matchBlanks": false, "fieldType": "ENTITYID", "mruAutoComplete": [], "initialValue": ["liu jack", "0059000000390Wh"], "state": "READONLY", "domain": [["用户", "005"]], "mruServletUri": "/_ui/common/data/MRUAutoCompleteServlet", "fieldId": "LastModifiedBy", "required": true, "useNewLookups": false }, { "formatPhone": false, "addDir": false, "maxLength": 40, "fieldType": "PHONE", "initialValue": "", "state": "EDIT", "fieldId": "con12", "required": false }, { "fieldType": "DYNAMICENUM", "picklistId": "9", "initialValue": ["", ""], "state": "EDIT", "fieldId": "con9", "required": false}], "_CONFIRMATIONTOKEN": "", "editable": true, "dynamicData": "/servlet/servlet.picklist?e=Contact&h=Z8mdzBVkXD9UpWYMETcT2V5DM07WgBozoeVuUMlC5G0%3D&v=1412752376000&layout=00h9000000RbNyf&ile=1&mo=READ&esc=HTML&l=zh_CN&pr=1.25&t=0" });</script>
                        
                        <%=RelatedListHTML%>
                        <!-- Begin RelatedListElement -->
                       <%=RelatedNoteListHTML%>
                        <!-- End RelatedListElement -->
                        <div class="fewerMore"><!--
                            <div class="backToTop">
                                <a href="#skiplink" title="返回顶部">
                                    <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                            每一相关列表总是显示 <a href="/0039000001HgjaT?rowsperlist=10">
                                <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a> 项记录--></div>
                        <script>                            window.sfdcPage.appendToOnloadQueue(function () {
                                //  DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Contact&setupid=ContactFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Contact&retURL=%2F0039000001HgjaT&setupid=ContactFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Contact", "newUrl": "/01I/e?retURL=%2F0039000001HgjaT&setupid=Contact", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F0039000001HgjaT&tableEnumOrId=Contact&setupid=ContactValidations", "newUrl": "/03d/e?retURL=%2F0039000001HgjaT&TableEnumOrId=Contact&Active=1&setupid=ContactValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Contact&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Contact&et=QUICK_CREATE&retURL=%2F0039000001HgjaT&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3M/e?retURL=%2F0039000001HgjaT&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=Contact&lid=00h9000000RbNyf&retURL=%2F0039000001HgjaT&setupid=ContactLayouts", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "导入数据", "hoverText": "将数据导入此对象中", "url": "/setup/imp/orgimport_welcome.jsp", "newWindow": true, "newInNewWindow": false, "section": 2}]);
                                //  new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2F0039000001HgjaT");
                            });</script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { SfdcApp.TopicsFeed.setupHandlers('topicContainer0039000001HgjaT'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F0039000001HgjaT&isAjaxRequest=1&renderMode=RETRO&nocache=1428913925593'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "sGd1wpo_50FFv0pmZfdg46VD.K8fLpNFS.I7JBSLVb1CaUooKqXSAsulI7n12DrhoQkp5mk6EYhQHl2wMpsQwyZyjlVSLZOTaLjiWQiNgcO9ZoNctJAnSbRbJg2AXpdWBxcv2oUzO36NnPV0QVl6lJj1A1_jdIS6R0eKs8AkbxKb37PUAebPHBedbr8yknYY8ldTAQ=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
                                        <option value="1">二月</option>
                                        <option value="2">三月</option>
                                        <option value="3">四月</option>
                                        <option value="4">五月</option>
                                        <option value="5">六月</option>
                                        <option value="6">七月</option>
                                        <option value="7">八月</option>
                                        <option value="8">九月</option>
                                        <option value="9">十月</option>
                                        <option value="10">十一月</option>
                                        <option value="11">十二月</option>
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2014">
                                            2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                        </select></div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">
                                            星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">
                                        今天</a></div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script>       // var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1428921085000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
     <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script>     //   var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>     //   var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
