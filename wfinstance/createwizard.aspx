<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createwizard.aspx.cs" Inherits="Supermore.wfinstance.createwizard" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>新建流程 ~ 凤凰协同办公系统</title>
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
    <link href="/css/createwizard.css" rel="stylesheet" />
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/swiper.min.js"></script>

    <!-- <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DashboardViewTableHome.js"></script>
    <script src="/jslibrary/sfdc/HomeCalendar.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>-->
    <%--  <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410364524000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=TimeNow%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": false }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": false }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>--%>
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
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/jq.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/DashboardViewHome.js"></script>
    <link href="/content/video/zxf_page.css" rel="stylesheet" />
    <script src="/content/video/zxf_page.js"></script>
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
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
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="" style="background: #F4F7FC;">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell" style="padding-left: 0; position: relative;">
                            <span id="LeftQuickMenu1" style="position: absolute; display: block; width: 100%; height: 100%; top: 10px;"><a title="单击关闭侧栏 [Alt+S]" id="handlebarContainer" href="javascript:void(0);" class="zen handlebarContainer">
                                <span class="zen-assistiveText">单击以关闭侧栏</span><span id="pinIndicator"
                                    class="indicator"></span><span id="pinIndicator2" class="indicator"></span><span id="handle" class="pinBox">&nbsp;</span></a>
                                <div id="sidebarDiv" class="collapsible sidebar" style="width: 100%;">
                                    <ul>
                                        <li class="sidebar_item sidebar_active">
                                            <span><i class="iconfont icon-geren"></i></span>
                                            <span class="sidebar_title">个人门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-yiliaohangyedeICON-"></i></span>
                                            <span class="sidebar_title">医院门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">领导门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">部门门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">科室门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">医生门户</span>
                                        </li>
                                        <li class="sidebar_item">
                                            <span><i class="iconfont icon-renyuanxiaozu"></i></span>
                                            <span class="sidebar_title">护士门户</span>
                                        </li>
                                    </ul>
                                </div>
                            </span>
                        </td>
                        <td id="bodyCell" class="oRight" style="background: #fff;">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <script type="text/javascript">
                                function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent onLoadSelector see Bug W-1599971 */ }
                            </script>


                            <%--content start--%>
                            <div class="createwizard_left">
                                <div class="createwizard_left_header">
                                    <span class="createwizard_left_headerImg" style="width: 30px; float: left;">
                                        <img src="/img/phone_talk.png" alt="Alternate Text" class="createwizard_left_header_img">
                                    </span>
                                    <span class="createwizard_left_header_text">我的事务
                                    </span>
                                    <div class="clear"></div>
                                </div>
                                <div class="createwizard_left_cont">
                                    <h2 class="createwizard_left_h2">流程分类</h2>
                                    <ul class="createwizard_left_ul">
                                        <li class="createwizard_left_ul_item">
                                            <a href="#" class="createwizard_left_ul_item_a ">
                                                <span class="createwizard_left_ul_item_a_span">全部流程</span>
                                            </a>
                                            <ul class="createwizard_left_ul_item_ul">
                                                <li class="createwizard_left_ul_item_ul_item active">最近使用</li>
                                                <li class="createwizard_left_ul_item_ul_item">院办</li>
                                                <li class="createwizard_left_ul_item_ul_item">审计处</li>
                                                <li class="createwizard_left_ul_item_ul_item">医学工程处</li>
                                                <li class="createwizard_left_ul_item_ul_item">规划建设处</li>
                                                <li class="createwizard_left_ul_item_ul_item">质管办</li>
                                                <li class="createwizard_left_ul_item_ul_item">工作报表</li>
                                                <li class="createwizard_left_ul_item_ul_item">纪检监察办</li>
                                                <li class="createwizard_left_ul_item_ul_item">信息中心</li>
                                                <li class="createwizard_left_ul_item_ul_item">人事处</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="createwizard_right">
                                <div>
                                    <div class="createwizard_right_header">
                                        <ul class="createwizard_right_header_ul">
                                            <li class="createwizard_right_header_ul_item item_active">新建流程
                                                <span class="createwizard_right_header_ul_item_num">12</span>
                                            </li>
                                            <li class="createwizard_right_header_ul_item">草稿
                                                <span class="createwizard_right_header_ul_item_num">109</span>
                                            </li>
                                            <li class="createwizard_right_header_ul_item">待办事务
                                                <span class="createwizard_right_header_ul_item_num">12</span>
                                            </li>
                                            <li class="createwizard_right_header_ul_item">已办事务
                                                <span class="createwizard_right_header_ul_item_num">109</span>
                                            </li>
                                            <li class="createwizard_right_header_ul_item">传阅件
                                                <span class="createwizard_right_header_ul_item_num">12</span>
                                            </li>
                                            <li class="createwizard_right_header_ul_item">我的请求
                                                <span class="createwizard_right_header_ul_item_num">109</span>
                                            </li>
                                            <div class="clear"></div>
                                        </ul>
                                    </div>
                                    <div class="createwizard_right_cont">
                                        <div class="createwizard_right_cont_first">
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">最近使用</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(1条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">09 院长办公会决议实施登记表</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">院办</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(8条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 请示报告</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">02. 用章申请</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">03. 工作餐申请</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">04. 上级来文办理</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">05. 上级通知转办</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">06. 医院上行文</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">07. 院内下发文</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">08. 政务信息</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">09. 院长办公会决议实施登记表</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">审计处</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(4条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 科研合同（协议）审批</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">02. 经济类合同审批</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">03. 心协、精保所合同审批</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">04. 政府采购合同审批</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="createwizard_right_cont_first">
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">医学工程处</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(2条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 物品采购申请</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">02. 资产报废申请</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">规划建设处</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(2条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 住宿申请审批（学生、进修）</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">02. 住宿申请审批（外包人员）</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">质管办</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(1条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 行政管理质量问题报告</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="createwizard_right_cont_first">
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">工作报表</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(6条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 京医通</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">02. 统计日报流程</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">03. 统计分析</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">04. 医务处下属科室工作月报表</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">05. 工娱科医疗月报</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">06. 功能检查科月报表</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">纪检监察办</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(3条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 纪检文件制定</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">02. 纪检文件传阅</span>
                                                    </li>
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">03. 03 纪检工作办理</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">信息中心</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(0条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                </ul>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="createwizard_right_cont_first">
                                            <div class="createwizard_right_cont_first_left">
                                                <h2 class="createwizard_right_cont_first_left_h2">
                                                    <span class="createwizard_right_cont_first_left_h2_title">人事处</span>
                                                    <span class="createwizard_right_cont_first_left_h2_num">(1条)</span>
                                                </h2>
                                                <ul class="createwizard_right_cont_first_left_ul">
                                                    <li class="createwizard_right_cont_first_left_ul_item">
                                                        <span class="createwizard_right_cont_first_left_ul_item_circle"></span>
                                                        <span class="createwizard_right_cont_first_left_ul_item_title">01. 年度(聘期)考核</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <%--content end--%>

                            <script type="text/javascript">
                                $('.createwizard_left_ul_item_a').click(function () {
                                    $(this).toggleClass('left_downs');
                                    $(this).siblings('ul').toggle();
                                })
                                $('.createwizard_right_header_ul_item').click(function () {
                                    $('.createwizard_right_header_ul_item').removeClass('item_active')
                                    $(this).addClass('item_active');
                                })
                                //翻页
                                $(".zxf_pagediv").createPage({
                                    pageNum: 3,
                                    current: 1,
                                    backfun: function (e) {
                                        //console.log(e);//回调
                                    }
                                });

                            </script>

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
        <div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
