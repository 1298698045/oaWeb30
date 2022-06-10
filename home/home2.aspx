<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home2.aspx.cs" Inherits="WebClient.home.home2" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <cc1:PageTitle ID="PageTitle1" ResourceKey="Home" runat="server" />
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/common.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/homeCalendar.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/dashboard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/dashboardViewCommon.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/OnboardingSplash.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DashboardViewTableHome.js"></script>
    <script src="/jslibrary/sfdc/HomeCalendar.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410364524000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=TimeNow%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": false }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": false }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/homeCalendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/dashboard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/dashboardViewCommon.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/OnboardingSplash.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/Business.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.198', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=/home/home.jsp');</script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab homepage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <script type="text/javascript">
        var secondsLeftValue = 7196, secondsPopupValue = 7166, lastPageActivityTime = (new Date).getTime(), forceLogout = false;
        function startSessionTimer() { schedulePopup(7166) }
        function schedulePopup(a) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); timeoutUniqueId = setTimeout(alertTimeout, 1E3 * a) }
        function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null;
        function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } }
        function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() }
        function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.aspx?sfdc.setJsDomain=1", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus }
        function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&amp;startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) }
        function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }
    </script>
    <a class="navSkipLink zen-skipLink zen-assistiveText" href="#skiplink">跳到主内容</a>
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="outer">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                            <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <!-- Start page content -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <div class="bPageTitle">
                                <div id="ptBody" class="ptBody secondaryPalette">
                                    <a href="/_ui/core/userprofile/UserProfilePage"><span title='<%=UserName%>' id="userThumbnailPhoto"
                                        class="chatter-avatar thumbnail_visible chatter-avatarRegular">
                                        <img width="45" height="45" title='<%=UserName%>' class="chatter-photo" alt='<%=UserName%>'
                                            src="/img/t.png"><img title="" class="chatter-avatarStyle" alt="" src="/s.gif"></span></a>
                                    <div class="greeting">
                                        <div class="links">
                                            <!--
                                            <input type="button" title="信息浏览 （新窗口）" onclick="openPopupFocus('/apps/scontent/overviewContents.aspx', '信息浏览', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"
                                                name="whats_new" class="btnImportant" value="信息浏览">-->
                                            <input type="button" title="查看信息，公告等" onclick="window.location='/apps/scontent/overviewContents.aspx?t=home&pageId=4dce3406-9173-490b-8a5d-a28332ab4bb1'"
                                                name="whats_new" class="btnImportant" value="单位信息" />
                                        </div>
                                        <div class="content">
                                            <span class="pageType">
                                                <h1 class="currentStatusUserName">
                                                    <a href="/_ui/core/userprofile/UserProfilePage">
                                                        <%=UserName%></a></h1>
                                            </span><span class="pageDescription"><a href='/cal/daily.aspx?t=home&md0=<%=Md0%>&amp;md3=<%=Md3%>'>
                                                <%=TodayDisplay%></a> | <a class="clockInInfoLaunch" href="javascript:showAttendaceRec()">
                                                    签到与签退</a></span></div>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    function showAttendaceRec() {
                                        var dialog = new SearchAccessibleDialog('clockInInfo', '签到与签退', '/apps/hr/CheckInout.aspx', 400, 600);
                                        dialog.display();
                                        //                                        var dialog = new IFrameDialog('clockInInfo', '签到与签退', '/apps/wf/NotifyMem.aspx', 400, 600);
                                        //                                        dialog.getContent = function () {
                                        //                                            return '\x3ciframe frameborder\x3d"no" scrolling\x3d"no" id\x3d"' + clockInInfo + '" style\x3d"overflow:hidden; border:0;height:' + 400 + 'px;width: 100%;" src\x3d"' + '/apps/wf/NotifyMem.aspx' + '"\x3e\x3c/iframe\x3e'
                                        //                                        };
                                        //                                        dialog.register();
                                        //                                        dialog.display();
                                    }
                                    Sfdc.onload(function () {
                                        //debugger;
                                        //SfdcApp.ChatterProfileSection.init('clockInInfo', '.clockInInfoLaunch', "签到与签退", "/apps/wf/NotifyMem.aspx", 400, 600);
                                    });
                                </script>
                            </div>
                            <table cellspacing="0" cellpadding="0" border="0" class="componentTable" width="100%">
                                <tbody>
                                    <tr>
                                        <td>
                                            <script type="text/javascript">
                                                //widgetWFWaitingTask
                                                jQuery(document).ready(function () {
                                                    //widgetWFWaitingTask(fillWFWaitingTaskGrid, "");
                                                    //widgetWFWaitingTask(fillWFWaitingTaskGrid);
                                                    widgetTopNewsTask(fillNewsGrid, "read", "notice", "notice_gridblock");  //通知公告
                                                    widgetTopNewsTask(fillNewsGrid, "read", "news", "news_gridblock1", "", true);    //重要信息 
                                                    widgetTopNewsTask(fillNewsGrid, "read", "news", "news_gridblock2", "da679931-a570-4e9f-8120-c582b74b62e8");    //财务管理 
                                                    widgetTopNewsTask(fillNewsGrid, "read", "news", "news_gridblock3", "d12382b7-f220-4f30-bde3-8936d432af69");    //政策法规 
                                                    widgetTopNewsTask(fillNewsGrid, "read", "news", "news_gridblock4", "ad839b7b-183b-488f-9040-4d48ce59167e");    //信息简报 
                                                    widgetTopWaitingWfTask(fillTopUserWfTasksGrid, "read", "userstatistic", "userstatistic_gridblock1");
                                                });
                                          
                                            </script>
                                            <table cellspacing="0" cellpadding="0" border="0" class="componentTable" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td width="50%" class="dashMed col1">
                                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="height: 200px;">
                                                                <div class="pbHeader">
                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="pbTitle1">
                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                        class="relatedListIcon" alt="" src="/s.gif"><h3 id="PendingProcessWorkitemsList_title">
                                                                                            通知公告</h3>
                                                                                </td>
                                                                                <td class="pbButton">
                                                                                </td>
                                                                                <td class="pbHelp">
                                                                                    <!--
                                                                                    <a href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'');">流程</a>&nbsp;|&nbsp;<a
                                                                                        href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'inform');">知会</a>&nbsp;|&nbsp;<a
                                                                                            href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'share');">传阅</a>&nbsp;|&nbsp;<a
                                                                                                href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'remind');">催办</a>-->
                                                                                    <a title="更多通知公告" id="mtqLink" href="/apps/scontent/contentListMore.aspx?t=home&folderId=&contenttype=2"
                                                                                        target="_blank">更多&nbsp;>></a>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="PendingProcessWorkitemsList_body" class="pbBody">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                                        <tbody id="notice_gridblock">
                                                                            <!-- ListRow -->
                                                                            <tr onmouseover="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}"
                                                                                onfocus="if (window.hiOn){hiOn(this);}" onblur="if (window.hiOff){hiOff(this);}"
                                                                                class="dataRow even last first">
                                                                                <td class="dataCell">
                                                                                    <a title="标记 拜访客户 完成" class="actionLink" href="/00T90000018FhOy/e?close=1&amp;retURL=%2Fhome%2Fhome.jsp%3Ftsid%3D02u900000017n3K">
                                                                                    </a>
                                                                                </td>
                                                                                <th class=" dataCell" scope="row">
                                                                                    &nbsp;
                                                                                </th>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="pbFooter secondaryPalette">
                                                                    <div class="bg">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td width="50%" class="dashMed col2">
                                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="height: 200px;">
                                                                <div class="pbHeader">
                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="pbTitle1">
                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                        class="relatedListIcon" alt="" src="/s.gif"><a href="/apps/scontent/contentListMore.aspx?t=home&contenttype=1&isimportant=1"
                                                                                            target="_blank" style="text-decoration: none"><h3 id="H3">
                                                                                                重要信息</h3>
                                                                                        </a>
                                                                                </td>
                                                                                <td class="pbButton">
                                                                                </td>
                                                                                <td class="pbHelp">
                                                                                    <a title="更多重要信息" id="mtqLink" href="/apps/scontent/contentListMore.aspx?t=home&contenttype=1&isimportant=1"
                                                                                        target="_blank">更多&nbsp;>></a>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="Div3" class="pbBody">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="list" width="100%">
                                                                        <tbody id="news_gridblock1">
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="pbFooter secondaryPalette">
                                                                    <div class="bg">
                                                                        更多>>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="260" class="dashMed col1">
                                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="height: 200px;">
                                                                <div class="pbHeader">
                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="pbTitle1">
                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                        class="relatedListIcon" alt="" src="/s.gif"><h3 id="H2">
                                                                                            即办监督</h3>
                                                                                </td>
                                                                                <td class="pbButton">
                                                                                </td>
                                                                                <td class="pbHelp">
                                                                                    <a title="更多即办监督" id="mtqLink" href="/apps/scontent/contentListMore.aspx?t=home&folderId="
                                                                                        target="_blank">更多&nbsp;>>&nbsp;</a>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="Div2" class="pbBody">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                                        <tbody id="userstatistic_gridblock1">
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td width="250" class="dashMed col2">
                                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="height: 200px;">
                                                                <div class="pbHeader">
                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="pbTitle1">
                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                        class="relatedListIcon" alt="" src="/s.gif"><h3 id="H1">
                                                                                            待办事务</h3>
                                                                                </td>
                                                                                <td class="pbButton">
                                                                                </td>
                                                                                <td class="pbHelp">
                                                                                    <a href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'');">流程</a>&nbsp;|&nbsp;<a
                                                                                        href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'inform');">知会</a>&nbsp;|&nbsp;<a
                                                                                            href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'share');">传阅</a>&nbsp;|&nbsp;<a
                                                                                                href="javascript:widgetWFWaitingTask(fillWFWaitingTaskGrid,'remind');">催办</a>
                                                                                    <!--<a title="更多待办事务" id="mtqLink" href="/apps/wf/MyApplyList.aspx?t=122&src=2">更多&nbsp;>>&nbsp;</a>-->
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="Div1" class="pbBody">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                                        <tbody id="PendingProcessWorkitemsList_gridbody">
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    //widgetWFWaitingTask
                                                                    jQuery(document).ready(function () {
                                                                        widgetWFWaitingTask(fillWFWaitingTaskGrid, "");                                                                       
                                                                    });
                                          
                                                                </script>
                                                                <div class="pbFooter secondaryPalette">
                                                                    <div class="bg">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="260" class="dashMed col1">
                                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="height: 200px;">
                                                                <div class="pbHeader">
                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="pbTitle1">
                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                        class="relatedListIcon" alt="" src="/s.gif"><h3 id="H4">
                                                                                            政策法规</h3>
                                                                                </td>
                                                                                <td class="pbButton">
                                                                                </td>
                                                                                <td class="pbHelp">
                                                                                    <a title="更多政策法规" id="mtqLink" href="/apps/scontent/contentListMore.aspx?t=home&folderId=d12382b7-f220-4f30-bde3-8936d432af69"
                                                                                        target="_blank">更多&nbsp;>>&nbsp;</a>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="Div4" class="pbBody">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                                        <tbody id="news_gridblock3">
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td width="250" class="dashMed col2">
                                                            <div class="bPageBlock brandSecondaryBrd secondaryPalette" style="height: 200px;">
                                                                <div class="pbHeader">
                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="pbTitle1">
                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                        class="relatedListIcon" alt="" src="/s.gif"><h3 id="H5">
                                                                                            信息简报</h3>
                                                                                </td>
                                                                                <td class="pbButton">
                                                                                </td>
                                                                                <td class="pbHelp">
                                                                                    <a title="更多信息简报" id="mtqLink" href="/apps/scontent/contentListMore.aspx?t=home&folderId=ad839b7b-183b-488f-9040-4d48ce59167e"
                                                                                        target="_blank">更多&nbsp;>>&nbsp;</a>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div id="Div5" class="pbBody">
                                                                    <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                                        <tbody id="news_gridblock4">
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow odd">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="dataRow even">
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="dataCell">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td align="right" style="width: 295px">
                                            <div class="mCalendar" style="width: 295px">
                                                <div class="topLeft">
                                                    <div class="topRight">
                                                    </div>
                                                </div>
                                                <div class="body">
                                                    <cc1:SmallCalendar runat="server" ID="SmallCalendar1" />
                                                </div>
                                                <div class="bottomLeft">
                                                    <div class="bottomRight">
                                                    </div>
                                                </div>
                                                <cc1:CalendarQuickButtons runat="server" ID="CalendarQuickButtons1" />
                                            </div>
                                            <style>
                                                .fileTypeIcon
                                                {
                                                    position: relative;
                                                }
                                                .fileTypeIcon .sprite-doctype_excel_16
                                                {
                                                    background-position: 0 -130px;
                                                }
                                                .fileTypeIcon img
                                                {
                                                    background: transparent url("/sfc/images/docicons/doctype_16_sprite.png?v=188-1") no-repeat scroll 0 0;
                                                    height: 16px;
                                                    width: 16px;
                                                }
                                                
                                                .blockOwnedDiv
                                                {
                                                    float: left;
                                                    width: 295px;
                                                    font-size: 12px;
                                                }
                                                .blockSection
                                                {
                                                    margin-bottom: 28px;
                                                    color: #999;
                                                    font-size: 1.1em;
                                                    letter-spacing: -0.01em;
                                                    position: relative;
                                                }
                                                .vfButtonBar
                                                {
                                                    background-color: transparent;
                                                    border-bottom: 1px solid #d7dbde;
                                                    line-height: 20px;
                                                    margin: 0 0 7px;
                                                    position: relative;
                                                    line-height: 20px;
                                                    list-style: outside none none;
                                                }
                                                .vfButtonBar a
                                                {
                                                    color: #015ba7;
                                                    float: right;
                                                    font-size: 0.9em;
                                                    text-decoration: none;
                                                    word-wrap: break-word;
                                                }
                                                .vfButtonBar h3
                                                {
                                                    margin: 0;
                                                    color: #333435;
                                                    font-size: 1em;
                                                    padding-bottom: 0;
                                                    font-weight: bold;
                                                    display: block; /*float: left;*/
                                                    letter-spacing: -0.01em;
                                                    position: relative;
                                                    list-style: outside none none;
                                                }
                                                .recentFilesItem
                                                {
                                                    display: inline-block;
                                                    overflow: hidden;
                                                    text-overflow: ellipsis;
                                                    white-space: nowrap;
                                                    width: 215px;
                                                    text-align: left;
                                                }
                                                .recentFilesPanel a, .recentFilesPanel a
                                                {
                                                    color: #015ba7;
                                                    text-decoration: none;
                                                    font-size: 12px;
                                                }
                                                .recentFilesTable
                                                {
                                                    width: 100%;
                                                }
                                                .recentFilesPanel .entityId
                                                {
                                                    display: none;
                                                }
                                            </style>
                                            <div class="blockOwnedDiv">
                                                <div class="recentFilesPanel blockSection" id="recentFilesPanel">
                                                    <div class="entityId">
                                                    </div>
                                                    <div class="vfButtonBar">
                                                        <div class="showAllLink">
                                                            <a title="显示全部" href="#">显示全部</a>
                                                        </div>
                                                        <div>
                                                            <h3>
                                                                常用链接1</h3>
                                                        </div>
                                                    </div>
                                                    <div class="content">
                                                        <table class="recentFilesTable">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <a class="fileTypeIcon" href="/068900000028E0q" data-uidsfdc="141">
                                                                            <img width="16" height="16" title="Excel 2007" data-hovid="06990000002BD4c" class="sprite-doctype_excel_16"
                                                                                alt="Excel 2007" src="/s.gif" data-uidsfdc="140" id="hoverItem140"></a>
                                                                    </td>
                                                                    <td class="">
                                                                        <span class="recentFilesItem"><a href="/068900000028E0q" target="_blank">局门户网站</a>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--
                                            <style>
                                                .setupS1SetupHomePage
                                                {
                                                    background-color: #f0f1f2;
                                                    font-family: "ProximaNovaSoft-Regular";
                                                    font-size: 120%;
                                                    line-height: 140%;
                                                    min-height: 430px; /*overflow: auto;*/
                                                    overflow: hidden;
                                                }
                                                .setupS1SetupSection.section
                                                {
                                                    background-color: #ffffff;
                                                    border-radius: 5px;
                                                    margin: 10px;
                                                    padding: 20px;
                                                    /*width: 295px; float: left;*/
                                                    text-align: left;
                                                }
                                                .setupS1SetupSection.section .section-content .section-title
                                                {
                                                    font-size: 17px;
                                                    font-weight: bold;
                                                }
                                                .setupS1SetupSection.section .section-content .section-body
                                                {
                                                    color: #78787d;
                                                    margin-top: 10px;
                                                }
                                                .setupS1SetupSection ul
                                                {
                                                    margin-top: 0;
                                                    padding-left: 0;
                                                    padding-top: 0;
                                                    font-size: 14px;
                                                }
                                                .setupS1SetupSection li
                                                {
                                                    line-height: 100%;
                                                    margin-left: 20px;
                                                    margin-top: 5px;
                                                    padding-left: 0.3em;
                                                }
                                                .setupS1SetupHomePage .section-item.block
                                                {
                                                    display: block;
                                                }
                                                .setupS1SetupSectionItem.section-item
                                                {
                                                    color: black;
                                                    display: inline-block;
                                                    margin-bottom: -10px;
                                                    padding-bottom: 10px;
                                                    position: relative;
                                                }
                                                .setupS1SetupSectionItem.section-item img
                                                {
                                                    height: 12px;
                                                    margin-right: 3px;
                                                    width: 12px;
                                                }
                                                .setupS1SetupSectionItem.section-item:hover .help-hover
                                                {
                                                    display: block !important;
                                                }
                                                .setupS1SetupSectionItem .help-hover
                                                {
                                                    background: #ffffff none repeat scroll 0 0;
                                                    border: 2px solid #d7d7d7;
                                                    border-radius: 5px;
                                                    display: none;
                                                    font-size: 100%;
                                                    line-height: 120%;
                                                    padding: 15px;
                                                    position: absolute;
                                                    right: -270px;
                                                    top: -25px;
                                                    width: 220px;
                                                    z-index: 10;
                                                }
                                                .setupS1SetupSectionItem .help-hover::after, .setupS1SetupSectionItem .help-hover::before
                                                {
                                                    border: medium solid transparent;
                                                    content: " ";
                                                    height: 0;
                                                    pointer-events: none;
                                                    position: absolute;
                                                    right: 100%;
                                                    top: 30px;
                                                    width: 0;
                                                }
                                                .setupS1SetupSectionItem .help-hover::after
                                                {
                                                    border-right-color: #ffffff;
                                                    border-width: 10px;
                                                    margin-top: -10px;
                                                }
                                                .setupS1SetupSectionItem .help-hover::before
                                                {
                                                    border-right-color: #d7d7d7;
                                                    border-width: 13px;
                                                    margin-top: -13px;
                                                }
                                                .setupS1SetupHomePage a
                                                {
                                                    color: #006eb3;
                                                    text-decoration: none;
                                                }
                                            </style>
                                            <div class="s1Setup setupS1SetupHomePage" style="width:295px">
                                                <div class="section setupS1SetupSection" data-aura-rendered-by="222:2;a">
                                                    <div class="section-content" data-aura-rendered-by="223:2;a">
                                                        <span class="section-title uiOutputText" dir="ltr" data-aura-rendered-by="226:2;a">快捷链接</span><div
                                                            class="section-body" data-aura-rendered-by="227:2;a">
                                                            <span class="section-information uiOutputText" dir="ltr" data-aura-rendered-by="230:2;a">
                                                            </span><span class="link-information uiOutputText" dir="ltr" data-aura-rendered-by="233:2;a">
                                                                单点登录</span><ul data-aura-rendered-by="234:2;a">
                                                                    <li data-aura-rendered-by="236:2;a">
                                                                        <div class="section-item setupS1SetupSectionItem" data-aura-rendered-by="196:2;a">
                                                                            <a target="_self" class="uiOutputURL" href="/mobile/mobileadmin/settingsMovedToConnectedApps.apexp"
                                                                                title="" dir="ltr" data-aura-rendered-by="199:2;a">移动浏览器选项</a><div class="help-hover"
                                                                                    data-aura-rendered-by="201:2;a">
                                                                                    所有用户都可以从移动浏览器访问 Salesforce1。</div>
                                                                        </div>
                                                                    </li>
                                                                    <li data-aura-rendered-by="238:2;a">
                                                                        <div class="section-item setupS1SetupSectionItem" data-aura-rendered-by="205:2;a">
                                                                            <a target="_self" class="uiOutputURL" href="/notifications/notificationsSetup.apexp"
                                                                                title="" dir="ltr" data-aura-rendered-by="208:2;a">通知选项</a><div class="help-hover"
                                                                                    data-aura-rendered-by="210:2;a">
                                                                                    用户可以在应用程序中接收通知</div>
                                                                        </div>
                                                                    </li>
                                                                    <li data-aura-rendered-by="240:2;a">
                                                                        <div class="section-item setupS1SetupSectionItem" data-aura-rendered-by="214:2;a">
                                                                            <a target="_self" class="uiOutputURL" href="/mobile/mobileadmin/offlineStorageSettings.apexp"
                                                                                title="" dir="ltr" data-aura-rendered-by="217:2;a">离线缓存</a><div class="help-hover"
                                                                                    data-aura-rendered-by="219:2;a">
                                                                                    用户可以在设备离线时查看已缓存的数据</div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            <span class="link-information uiOutputText" dir="ltr" data-aura-rendered-by="182:2;a">
                                                                常用链接</span><ul data-aura-rendered-by="183:2;a">
                                                                    <li data-aura-rendered-by="184:2;a">
                                                                        <div class="section-item setupS1SetupSectionItem" data-aura-rendered-by="187:2;a">
                                                                            <a target="_blank" class="uiOutputURL" href="https://help.salesforce.com/HTViewHelpDoc?id=customize_sf1_downloadable_app_settings.htm"
                                                                                title="" dir="ltr" data-aura-rendered-by="190:2;a">应用程序安全控制</a><div class="help-hover"
                                                                                    data-aura-rendered-by="192:2;a">
                                                                                    使用连接的应用程序设置来设置安全措施和控制哪些用户可以访问应用程序</div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            -->
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- Body events -->
                            <script type="text/javascript">
                                function bodyOnLoad() {
                                    /*
                                    new ForeignKeyInputElement("evt1__09D90000002A1hg", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "005" });
                                    new ForeignKeyInputElement("evt3__09D90000002A1hg", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                    new ForeignKeyInputElement("evt2__09D90000002A1hg", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                    new ForeignKeyInputElement("opp4__09D90000002A1he", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "001" });
                                    new ForeignKeyInputElement("tsk3__09D90000002A1hd", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                    new ForeignKeyInputElement("tsk2__09D90000002A1hd", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                    new ForeignKeyInputElement("con4__09D90000002A1hc", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "001" });
                                    new ForeignKeyInputElement("tsk3__09D90000002A1hb", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" });
                                    new ForeignKeyInputElement("tsk2__09D90000002A1hb", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" });
                                    new ForeignKeyInputElement("tsk1__09D90000002A1hb", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "005" });
                                    */
                                    if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                    if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                                    if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };
                                    Sfdc.Cookie.deleteCookie('setupopen'); Sfdc.Cookie.deleteCookie('roleopen'); ;

                                    if (this.loadChatFrameJs) loadChatFrameJs();
                                    SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    SfdcApp.MruHovers.global_data.url = 'retURL=/home/home.aspx&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1410773133280';

                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };
                                    /*
                                    SfdcApp.Recommend.create({ id: 'recs_widget', ctor: 'RecommendationGrid' });                                    
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk2__09D90000002A1hb", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk3__09D90000002A1hb", {});
                                    handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk2__09D90000002A1hd", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("tsk3__09D90000002A1hd", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("evt2__09D90000002A1hg", {});
                                    LookupAutoCompleteInputElement.registerSupportedEntities("evt3__09D90000002A1hg", {});
                                    handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');
                                    if (window.PreferenceBits)
                                    { window.PreferenceBits.prototype.csrfToken = ""; };
                                    */
                                }
                                function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                                function bodyOnFocus() { closePopupOnBodyFocus(); }
                                function bodyOnUnload() { }</script>
                            <div id="datePicker" class="datePicker">
                                <div class="dateBar">
                                    <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                        onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();"
                                        onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select
                                            title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
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
                                        </select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';"
                                            onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();"
                                            onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select
                                                title="年" name="calYearPicker" id="calYearPicker"><option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                            </select></div>
                                <div class="calBody">
                                    <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                                        <tbody>
                                            <tr>
                                                <th scope="col" class="dayOfWeek">
                                                    星期日
                                                </th>
                                                <th scope="col" class="dayOfWeek">
                                                    星期一
                                                </th>
                                                <th scope="col" class="dayOfWeek">
                                                    星期二
                                                </th>
                                                <th scope="col" class="dayOfWeek">
                                                    星期三
                                                </th>
                                                <th scope="col" class="dayOfWeek">
                                                    星期四
                                                </th>
                                                <th scope="col" class="dayOfWeek">
                                                    星期五
                                                </th>
                                                <th scope="col" class="dayOfWeek">
                                                    星期六
                                                </th>
                                            </tr>
                                            <tr id="calRow1" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow2" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow3" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow4" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow5" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr id="calRow6" class="calRow">
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                                    onblur="hiOff(this);">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="buttonBar">
                                        <a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday"
                                            href="javascript: void(0);">今天</a></div>
                                </div>
                            </div>
                            <!-- End page content -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
