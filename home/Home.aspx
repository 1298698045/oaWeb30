<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebClient.home.Home" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <cc1:PageTitle ID="PageTitle1" ResourceKey="Home" runat="server" />
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/homeCalendar.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/dashboard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/dashboardViewCommon.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/ChatterFiles.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/OnboardingSplash.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/WalkthroughCoreUI.css">
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/themes/lightning/iconfont.css" />
    <link rel="stylesheet" href="/css/themes/lightning/alerts.css" />
    <link href="/template/css/alert.css" rel="stylesheet" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>

    <!-- <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DashboardViewTableHome.js"></script>
    <script src="/jslibrary/sfdc/HomeCalendar.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>-->
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410364524000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=TimeNow%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": false }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": false }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>
        /*try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
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
        try { DynamicCss.doneLoading() } catch (e) { }
        */
    </script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/jq.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/DashboardViewHome.js"></script>
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
        .selted table {
            table-layout: fixed;
        }
        .selted .listItem {
            width:80%;
        }
        .selted .listItem a{
            width:100%;
            display:inline-block;
            overflow:hidden;
            text-overflow:ellipsis;
        }
        .popup-mask {
            position: fixed;
            left: -10px;
            width: 110%;
            top: 0;
            z-index: 100;
            background-color: #000;
            opacity: 0.4;
            height: 100%;
            width: 100%;
            display: none;
        }
        #iframe {
            display:none;
            height: 620px;
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            height: 620px;
            border: 0;
        }
    </style>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.198', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=/home/home.jsp');</script>

    
</head>
<!--hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr
        hasMotif homeTab homepage ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr
        -->
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr"
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
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <script type="text/javascript">
                                function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent onLoadSelector see Bug W-1599971 */ }
                            </script>
                            <div class="bPageTitle" style="margin-bottom: 0px; padding-bottom: 0px;">
                                <div class="ptBody">
                                    <a href="/_ui/core/userprofile/UserProfilePage"><span title='<%=UserName%>' id="userThumbnailPhoto"
                                        class="chatter-avatar thumbnail_visible chatter-avatarRegular">
                                        <img width="45" height="45" title='<%=UserName%>' class="chatter-photo" alt='<%=UserName%>'
                                            src="/img/t.png"><img title="" class="chatter-avatarStyle" alt="" src="/s.gif"></span></a>
                                    <div class="greeting">
                                        <div class="content">
                                            <span class="pageType">
                                                <h1 class="currentStatusUserName">
                                                    <a href="/_ui/core/userprofile/UserProfilePage">
                                                        <%=UserName%></a></h1>
                                            </span><span class="pageDescription"><a href='/cal/daily.aspx?t=home&md0=<%=Md0%>&amp;md3=<%=Md3%>'>
                                                <%=TodayDisplay%></a>
                                        </div>
                                    </div>
                                    <div class="attend-clock">
                                        <div>
                                            <span class="clockstatus1"style="line-height:40px;">今日考勤记录</span>
                                        </div>
                                        <div class="attendData">
                                            <%--<div class="attendontime">
                                                <div class="clockstatus2">上班：<span>09:00</span>&nbsp&nbsp<span class="clockstatus2"> |</span>
                                                </div>
                                                <div class="clockstatus2">下班：<span>18:00</span>&nbsp&nbsp<span class="clockstatus2"> |</span></div>
                                            </div>
                                            <div>
                                                <div id="attendstarttime" class="clockstatus3 nowtime"><span>17:12:11</span></div>
                                                <div id="attendendtime" class="clockstatus2"><span>未打卡</span></div>
                                            </div>--%>
                                        </div>

                                        <div class="attendclockbtn">
                                            <div>打卡</div>
                                            <span class="nowtime">00:00:00</span>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="links" style="margin-top:0px">
                                        <iframe src="/clock.htm"  scrolling="no" frameborder="0" width="140" height="65"></iframe>
                                    </div>-->
                                </div>
                                <!--
                                <div class="ptBreadcrumb">
                                </div>-->
                            </div>
                            <!--                                      
                                        <div class="layout_location" id="nowLocation">
                                            <span class="nowLocation_ico">
                                                <img src="/img/nav-personal.png"></span><span class="nowLocation_content"><a style="color: rgb(136, 136, 136);">个人主页</a></span></div>
                                        <div class="blank">
                                            &nbsp;</div>-->
                            <!--
                            <div class="clearingBox">
                                &nbsp;</div>-->
                            <link href="/css/newsHome.css" rel="stylesheet" type="text/css" />
                            <table style="width: 100%; margin-top: 0px; padding-top: 0px;">
                                <tr>
                                    <td width="100%">
                                        <div class="main CntWarp" style="width: 98%; margin-right: 10px;">
                                            <%=LeftBlockHTML%>
                                        </div>
                                    </td>
                                    <td style="width: 320px;">
                                        <div role="complementary" class="local-discovery column" style="margin-top: 20px;">
                                            <div class="discovery-block">
                                                <div class="developerforce">
                                                    <span id="content_wrap:devForce">
                                                        <iframe width="100%" height="265" frameborder="0" class="contentFrame" scrolling="no" src="/apps/scontent/HomeHotNews.aspx"></iframe>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>






                                        <div style="width: 320px; float: right; margin-left: 10px;">
                                            <div class="main CntWarp" style="width: 100%">
                                                <div class="hBlock even" style="width: 100%">
                                                    <div class="hBCnt">
                                                        <div class="option">
                                                            <div class="optRight">
                                                                <a class="bLink" target="_blank" href="/00U/c?cType=1">更多</a>
                                                            </div>
                                                            <div class="optT">
                                                                <ul>
                                                                    <li class="cur" onclick="window.location='/00U/c?cType=1'">我的日程</li>
                                                                    <li class="" onclick="window.location='/00U/m?cType=2&fcf=79183c45-0e58-4860-8354-bce2d7a475c9'">领导日程</li>
                                                                    <li class="last" onclick="window.location='/00U/m?cType=2&fcf=04D6056D-EBE7-45B8-9913-067CC3D7EFBD'">部门日程</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="optCnt" style="height: 210px;">
                                                            <ul>
                                                                <li class="selted" style="overflow: hidden;">
                                                                    <div class="mCalendar" style="margin-bottom: 0px;">
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
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <style>
                                                    .eventHomeEventItems {
                                                        /* border: 1px solid #ddd;
                                                        border-radius: 5px;
                                                        padding: 5px;
                                                       margin:0px;
                                                       padding:0px;*/
                                                    }

                                                    .eventHomeEventItem {
                                                        margin-left: 5px;
                                                        padding: 0;
                                                        white-space: nowrap;
                                                        word-break: keep-all;
                                                        display: inline-flex;
                                                        border-color: #f3f2f2;
                                                        border-style: solid;
                                                        border-width: 0 0 1px;
                                                        float: left;
                                                        height: 30px;
                                                        line-height: 30px;
                                                        width: 300px;
                                                        /*
                                                        border-right:1px solid #f3f2f2;
                                                        border: 1px solid #f3f2f2;
                                                         */
                                                    }

                                                    eventHomeEventItems .evtLine {
                                                        background: #b1365f;
                                                        background-color: rgb(0, 112, 210);
                                                        width: 5px;
                                                        display: inline-block;
                                                    }

                                                    .eventHomeEventItem .evtTime {
                                                        background: #f5f5f5 none repeat scroll 0 0;
                                                        width: 70px;
                                                        display: inline-block;
                                                        /*margin-left:5px;*/
                                                        padding-left: 5px;
                                                        padding-right: 5px;
                                                        margin-right: 5px;
                                                        overflow: hidden;
                                                        vertical-align: middle;
                                                        text-overflow: ellipsis;
                                                    }

                                                    .eventHomeEventItem .evtSubject {
                                                        line-height: 30px;
                                                        display: inline-block;
                                                        cursor: pointer;
                                                        vertical-align: middle;
                                                        padding-left: 5px;
                                                        padding-right: 5px;
                                                        margin-right: 5px;
                                                        font-size: 14px;
                                                        font-weight: bold;
                                                        /*margin-left:5px;*/
                                                        color: #8d9ea7;
                                                        /*
                                                        background-color: #f9f2f4;
                                                        width:245px;
                                                        border-radius: 4px;
                                                        color: #c7254e;*/
                                                    }

                                                    .eventHomeEventItem.div {
                                                    }

                                                    .list-text {
                                                        width: 300px;
                                                        overflow: hidden;
                                                        text-overflow: ellipsis;
                                                        display: inline-block;
                                                        margin-top: 0;
                                                        height:auto;
    
                                                    }
                                                </style>
                                                <!--START个人日程-->
                                                <!--<div class="eventHomeEventItems" style="width:100%;">
                                                   <div><h3 class="box-title" style="margin-left:5px;line-height:1.42857;font-weight:bold;">今日日程</h3></div>
                                                    <hr style="border:1px solid #10a2f8;" />
                                                    <div class="option"><div class="optRight"> </div><div class="optT"> <ul><li class="cur last">今日日程</li> </ul></div></div>
                                                </div>-->

                                                <div class="hBlock even" style="width: 100%">
                                                    <div class="hBCnt">
                                                        <div class="option">
                                                            <div class="optRight"></div>
                                                            <div class="optT">
                                                                <ul>
                                                                    <li class="cur last">今日日程</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="optCnt1">
                                                            <ul>
                                                                <li class="selted">
                                                                    <div style="height: 10px;"></div>
                                                                    <%=EventsHTML%>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="hBlock odd" style="width: 100%">
                                                    <div class="hBCnt">
                                                        <div class="option">
                                                            <div class="optRight"></div>
                                                            <div class="optT">
                                                                <ul>
                                                                    <li class="cur last">我的会议</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="optCnt1">
                                                            <ul id="myMeetings">
                                                                <script>loadMyMeetings();</script>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="hBlock odd" style="width: 100%">
                                                    <div class="hBCnt">
                                                        <div class="option">
                                                            <div class="optRight"></div>
                                                            <div class="optT">
                                                                <ul>
                                                                    <li class="cur last">今日值班</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="optCnt1">
                                                            <ul id="mustEditObjects">
                                                                <script>loadEditObjects();</script>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--start党工团-->

                                                <div class="political" style="display:none;">
                                                    <div class="hBlock even" style="width: 100%;">
                                                        <div class="hBCnt">
                                                            <div class="option">
                                                                <div class="optRight">
                                                                    <a href="/a0M/o" target="_blank" class="bLink">更多</a>
                                                                </div>
                                                                <div class="optT">
                                                                    <ul>
                                                                        <li class="cur">院务公开<span class="noB"></span></li>
                                                                      <%--  <li class="">时政新闻<span class="noB" style=""></span></li>--%>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="">
                                                                <ul>
                                                                    <li class="selted">
                                                                        <img src="/img/7702.png" style="width: 100%; margin-top: 5px;">
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="eventHomeEventItems">
                                                                <div class="eventHomeEventItem">
                                                                    <div style="height: 30px;">
                                                                        <a href="#" class="bLink list-text"></a>
                                                                        <%-- <span>2019-04-04</span>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="eventHomeEventItem">
                                                                    <div style="height: 30px;">
                                                                        <a href="#" class="bLink list-text"></a>
                                                                        <%-- <span>2019-04-04</span>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="eventHomeEventItem">
                                                                    <div style="height: 30px;">
                                                                        <a href="#" class="bLink list-text"></a>
                                                                        

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end党工团-->

                                                <!--END个人日程-->
                                                <!--START待填数据-->
                                                <!--
                                                <div class="hBlock odd" style="width: 100%">
                                                    <div class="hBCnt">
                                                        <div class="option">
                                                            <div class="optRight"></div>
                                                            <div class="optT">
                                                                <ul>
                                                                    <li class="cur last">待填数据</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="">
                                                            <ul id="mustEditObjects">
                                                                <script>loadEditObjects();</script>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>-->
                                              
                                                <!--START待填数据-->
                                                <%=QuickLinkBlockHTML%>
                                                <!--Start-->
                                                <!--
                                                <div role="complementary" class="local-discovery column">
    <div class="discovery-block">
        <div class="developerforce"><span id="content_wrap:devForce">
            <iframe width="100%" height="430" frameborder="0" class="contentFrame" scrolling="no" src="/apps/scontent/HomeHotNews.aspx"></iframe>
        </span></div>
    </div>
</div>-->

                                                <!--End-->
                                            </div>
                                        </div>
                                    </td>
                                </tr>
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
                                    Sfdc.Cookie.deleteCookie('setupopen'); Sfdc.Cookie.deleteCookie('roleopen');;

                                    if (this.loadChatFrameJs) loadChatFrameJs();
                                    SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                    new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    SfdcApp.MruHovers.global_data.url = 'retURL=/home/home.aspx&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1410773133280';

                                    if (document.getElementById('sidebarDiv')) {
                                        Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                    };

                                    getUnreadEmailQty(updateUnreadEmailQty)
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
                                function bodyOnUnload() { }
                                function updateUnreadEmailQty(data) {
                                    jQuery("#unreadMails").html("（" + data.unread + "）");
                                }
                            </script>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
        <!--<div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>-->
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <link href="/css/attendClock.css" rel="stylesheet" />
    <script src="/js/CommonUtils.js"></script>
    <script src="/js/attendClock.js"></script>
    <div class="popup-mask"></div>
    <iframe id="iframe" frameborder="0"></iframe>
    <script>
        $(document).ready(function () {
            $('.hBlock').find('.optRight a').attr('target', '_blank')
            $('.hBlock').find('.optT ul li a').attr('href', '#')
            $('.hBlock').find('.optT ul li a').css({ 'color': '#838383', 'text-decoration': 'none' })
            //$('.hBlock').eq(1).find('.optRight a').attr('href', '/a0M/o')
            //$(document).ready(function () {
            //    if (getQueryString('content') == '1') {
            //        $('.left-table li').eq(1).trigger('click');
            //    }
            //})
            
        $('.hBlock .optT li').click(function () {
            var tabname = $('.hBlock').find('.optT li.cur').text()
            if (tabname.indexOf('待办') != -1) {
                $('.hBlock').find('.optRight a').attr('href', '/a0M/o')
            }
            if (tabname.indexOf('待阅') != -1) {
                $('.hBlock').find('.optRight a').attr('href', '/a0M/o?tab=1')
            }
            if (tabname.indexOf('退件') != -1) {
                $('.hBlock').find('.optRight a').attr('href', '/a0M/o?tab=2')
            }
            if (tabname.indexOf('待审') != -1) {
                $('.hBlock').find('.optRight a').attr('href', '/091/o?pending=1')
            }
            if (tabname.indexOf('待阅通知') != -1) {
                $('.hBlock').find('.optRight a').attr('href', '/content/contentsrc_unread.aspx')
            }
        })
        })
    </script>
</body>
</html>
