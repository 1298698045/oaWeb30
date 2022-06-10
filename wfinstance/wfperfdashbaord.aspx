<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfperfdashbaord.aspx.cs" Inherits="Supermore.wfinstance.wfperfdashbaord" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>流程绩效 ~ 凤凰协同办公系统</title>
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
    <link href="/css/wfperfdashbaord.css" rel="stylesheet" />
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
    <script src="/js/echarts.js"></script>
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }

        a {
            text-decoration: none;
        }

            a:hover {
                text-decoration: none!important;
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
                        <td id="bodyCell" class="oRight">
                            <!-- Start page content table -->
                            <a name="skiplink">
                                <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <script type="text/javascript">
                                function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent onLoadSelector see Bug W-1599971 */ }
                            </script>
                            <div class="index_nav">
                                <div class="nav_header">
                                    <i class="iconfont icon-gantanhao" style="color: #fff;"></i>
                                </div>
                                <ul class="nav_ul">
                                    <li class="nav_ul_item">
                                        <a href="/home/homelight.aspx">
                                            <span class="nav_ul_item_img">
                                                <img src="/img/Personal_a.png" alt="Alternate Text" />
                                            </span>
                                            <span class="nav_ul_item_title">个人工作台</span></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="/content/contentsrc.aspx">
                                            <span class="nav_ul_item_img">
                                                <img src="/img/hospital_a.png" alt="Alternate Text" />
                                            </span>
                                            <span class="nav_ul_item_title">医院门户</span></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#"><span class="nav_ul_item_img">
                                            <img src="/img/leadership_a.png" alt="Alternate Text" />
                                        </span>
                                            <span class="nav_ul_item_title">领导门户</span></a>
                                    </li>
                                    <li class="nav_ul_item nav_active">
                                        <a href="/wfinstance/wfperfdashbaord.aspx"><span class="nav_ul_item_img">
                                            <img src="/img/wfperfdashbaord_c.png" alt="Alternate Text" />
                                        </span>
                                            <span class="nav_ul_item_title">流程绩效</span></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#"><span class="nav_ul_item_img">
                                            <img src="/img/Department_a.png" alt="Alternate Text" />
                                        </span>
                                            <span class="nav_ul_item_title">科室门户</span></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#"><span class="nav_ul_item_img">
                                            <img src="/img/nurse_a.png" alt="Alternate Text" />
                                        </span>
                                            <span class="nav_ul_item_title">护士之家</span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="index_navs">
                                <div class="nav_headers">
                                    <i class="iconfont icon-gantanhao" style="color: #fff;"></i>
                                </div>
                                <ul class="nav_ul">
                                    <li class="nav_ul_item">
                                        <a href="/home/homelight.aspx" class="nav_ul_item_a"><img src="/img/Personal_a.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="/content/contentsrc.aspx" class="nav_ul_item_a"><img src="/img/hospital_a.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#" class="nav_ul_item_a"><img src="/img/leadership_a.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item nav_active">
                                        <a href="/wfinstance/wfperfdashbaord.aspx" class="nav_ul_item_a"><img src="/img/wfperfdashbaord_c.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#" class="nav_ul_item_a"><img src="/img/Department_a.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#" class="nav_ul_item_a"><img src="/img/nurse_a.png" alt="Alternate Text" /></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="ct">
                                <div id="content-header-wrapper" style="height: auto;">
                                    <div id="content-header" class="content-header" style="width: auto; left: 0px;">

                                        <div class="title-bar clearfix">
                                            <%--<div id="tool-bar" class="tool-bar r">
                                                <a href="javascript:void(0);" id="pin-btn" class="pin-btn open recordable r" ><span class="icon icon-font"></span></a>
                                                <a href="javascript:void(0);" id="download-report" class="download-report trackable r" >下载</a>
                                                <a href="javascript:void(0);" id="common-report" class="common-report r "><span class="icon icon-font"></span>常用报告</a>
                                            </div>--%>
                                            <div class="setting-bar r">
                                            </div>
                                            <h5 class="l">搜索词
                                            </h5>
                                            <div id="date" class="date l">(2019/04/22)</div>
                                            <a title="点击可查看报告详细帮助" id="report-tip-icon" class="report-help close l" href="javascript:void(0);">&nbsp;</a>
                                            <div class="clear"></div>
                                        </div>


                                        <div class="report-tip" id="report-tip" style="display: none;">
                                            <div class="tip-arrow" style="left: 131.406px;"></div>
                                            <div class="report-tip-content">
                                                <table class="report-tip-table">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70%" valign="top">
                                                                <div class="left-content">
                                                                    <div>本报告助您分析：</div>
                                                                    <p>网民在各类搜索引擎上通过哪些搜索词找到并访问了您网站。助您及时了解网民的关注点，以及哪些搜索词给您网站带来了更多有效访客，从而优化搜索推广提词方案。</p>
                                                                </div>
                                                            </td>
                                                            <td width="30%" valign="middle" class="report-tip-search-container">
                                                                <div class="right-content">
                                                                    <div class="questions">
                                                                        <div>常见问题：<a href="#" target="_blank">搜索词报告能告诉我哪些信息？</a></div>
                                                                    </div>
                                                                    <div class="report-tip-search">
                                                                        <div class="report-tip-search-input">
                                                                            <span class="report-tip-search-btn">&nbsp;</span>
                                                                            <input type="text" name="keyword" placeholder="更多问题请在这里查询..." id="ReportHelp">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>


                                        <div id="filters" class="filters">
                                            <div class="control-bar-wrapper clearfix" id="control-bar-wrapper">
                                                <div class="control-bar bg-iframe l" id="control-bar">
                                                    <span class="l label">时间：</span>
                                                    <div class="l date-select-bar" id="date-select-bar">
                                                        <a href="#00" class="trackable date-bar-single-day cur">今天</a>
                                                        <span class="seprator"></span>
                                                        <a href="#-1" class="trackable date-bar-single-day">昨天</a>
                                                        <span class="seprator"></span>
                                                        <a href="#-6" class="trackable">最近7天</a>
                                                        <span class="seprator"></span>
                                                        <a href="#-29" class="trackable">最近30天</a>
                                                    </div>
                                                    <div class="l time-select-bar" id="custom-date-select">
                                                        <div class="select-bar-item l">
                                                            <input readonly="readonly" class="text trackable" id="date-select" value="2019/04/22">
                                                            <a class="dropdown"></a>
                                                        </div>
                                                        <div class="select-bar-item l">
                                                            <label for="compare-date">
                                                                <%--<span class="checkbox compare-date-checkbox"></span>--%>
                                                                <input type="checkbox" id="compare-date" class="compare-date">
                                                                <span id="date-compare-title">对比时间段</span>
                                                            </label>
                                                            <span id="compare-date-container" class="compare-date-container hide">
                                                                <input readonly="readonly" class="text trackable" id="compare-date-select" value="时间段对比">
                                                                <a class="dropdown"></a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a id="event-monitor-advanced-filter" class="advanced-filter up" href="javascript:void(0)">收起筛选</a>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="filter-content-wrapper drop-down-parent clearfix" style="display: block;">
                                                <div id="ClientDevices" class="filter">
                                                    <label class="label">设备：</label><ul class="group">
                                                        <li id="jquery-customRadio--HM__4-all" title="全部" class="cur first">全部</li>
                                                        <li id="jquery-customRadio--HM__4-pc" title="计算机" class="">计算机</li>
                                                        <li id="jquery-customRadio--HM__4-mobile" title="移动设备" class=" last">移动设备</li>
                                                    </ul>
                                                </div>
                                                <div id="Engines" class="filter drop-down-container">
                                                    <span class="drop-down-label">搜索引擎：</span><div class="drop-down-header"><span class="drop-down-text ellipsis" title="全部">全部</span><span class="btn-arrow">&nbsp;</span></div>
                                                    <div class="drop-down-list hm-scroll drop-down-level1" style="display: none; width: 150px; left: 65px;">
                                                        <ul>
                                                            <li class="drop-down-query-li"><span class="drop-down-search-btn">&nbsp;</span><input type="text" class="drop-down-query" placeholder="请输入关键词..." style="width: 72px;"></li>
                                                            <li class="drop-down-li drop-down-clickable"><span class="drop-down-arrow-style  " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="全部">全部</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="百度">百度</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="Google">Google</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="搜狗">搜狗</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="Yahoo">Yahoo</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="中国雅虎">中国雅虎</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="搜搜">搜搜</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="有道">有道</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="狗狗搜索">狗狗搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="Bing">Bing</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="360搜索">360搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="即刻搜索">即刻搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="奇虎搜索">奇虎搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="一淘搜索">一淘搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="搜酷">搜酷</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="宜搜">宜搜</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="UC搜索">UC搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="好搜">好搜</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="神马搜索">神马搜索</span></li>
                                                            <li class="drop-down-li "><span class="drop-down-arrow-style drop-down-arrow " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="中国搜索">中国搜索</span></li>
                                                            <li class="drop-down-shortcut"><span class="drop-down-arrow-style" style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content">快捷操作</span></li>
                                                            <li class="drop-down-li drop-down-clickable shortcut-li"><span class="drop-down-arrow-style  " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="百度">百度</span></li>
                                                            <li class="drop-down-li drop-down-clickable shortcut-li"><span class="drop-down-arrow-style  " style="float: right; width: 6px;">&nbsp;</span><span class="drop-down-li-content" title="Google">Google</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div id="Visitors" class="filter">
                                                    <label class="label">访客：</label><ul class="group">
                                                        <li id="jquery-customRadio--HM__3-all" title="全部" class="cur first">全部</li>
                                                        <li id="jquery-customRadio--HM__3-new" title="新访客" class="">新访客</li>
                                                        <li id="jquery-customRadio--HM__3-old" title="老访客" class=" last">老访客</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="main-content">
                                        <div class="rpt-filter">
                                            <div id="ViewType" class="view-type l">
                                                <div class="tabs">
                                                    <ul class="clearfix">
                                                        <li class="selected tabs_li">
                                                            <a href="#">按指标分类</a>
                                                        </li>
                                                        <li class="tabs_li">
                                                            <a href="#">按搜索引擎</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div id="SourceType" class="download-words-container">
                                                <a href="javascript:void(0)" id="SubscribeWords" class="subscribe-words">预订全部搜索词</a>
                                                <a id="DownloadWords" href="javascript:void(0)" class="download-words">下载全部搜索词数据包（至<span id="EndSubscribe">2019-05-12</span>）</a>

                                                <div id="FileList" class="download-list layer" style="display: none;">
                                                    <ul>
                                                        <li><a href="javascript:page.downloadWords(-1)">2019-04-21.zip</a></li>
                                                        <li><a href="javascript:page.downloadWords(-2)">2019-04-20.zip</a></li>
                                                        <li><a href="javascript:page.downloadWords(-4)">2019-04-18.zip</a></li>
                                                        <li><a href="javascript:page.downloadWords(-5)">2019-04-17.zip</a></li>
                                                    </ul>
                                                    <span id="SubscribeTip" class="download-list-tip" style="display: none;">数据包将从<span id="StartSubscribe">2019-04-14</span> 8:00开始生成。</span>
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div id="summary" class="section ">
                                            <table class="summary" style="display: block;">
                                                <tbody style="display: table; table-layout: fixed; width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <span class="text">浏览量(PV)
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="9,661">9,661</div>

                                                        </td>
                                                        <td>
                                                            <span class="text">访客数(UV)
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="1,581">1,581</div>
                                                        </td>
                                                        <td>
                                                            <span class="text">IP数
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="1,629">1,629</div>
                                                        </td>
                                                        <td>
                                                            <span class="text">跳出率
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="30.57%">30.57%</div>
                                                        </td>
                                                        <td class="last">
                                                            <span class="text">平均访问时长
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="00:10:43">00:10:43</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <table class="summary">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <span class="text">浏总搜索次数
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="9,661">9,661</div>

                                                        </td>
                                                        <td>
                                                            <span class="text">百度
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="1,581">1,581</div>
                                                        </td>
                                                        <td>
                                                            <span class="text">Google
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="1,629">1,629</div>
                                                        </td>
                                                        <td>
                                                            <span class="text">搜狗
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="30.57%">30.57%</div>
                                                        </td>
                                                        <td>
                                                            <span class="text">其他
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="00:10:43">00:10:43</div>
                                                        </td>
                                                        <td class="last">
                                                            <span class="text">占比
                                                                <a href="javascript:void(0);" class="help">&nbsp;</a>
                                                            </span>
                                                            <div class="value summary-ellipsis" title="00:10:43">100%</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="echarts">
                                            <div id="main"></div>
                                        </div>
                                        <div class="table-filter">
                                            <div id="search-word-container" class="search-container">
                                                <span class="search-btn">&nbsp;</span>
                                                <span class="search-close" style="display: none;">&nbsp;</span>
                                                <input type="text" class="search-input" placeholder="关键词/搜索词...">
                                            </div>
                                        </div>
                                        <div id="table">
                                            <table class="table table-layout-03">
                                                <thead>
                                                    <tr class="group-title" id="">
                                                        <td class="number-col" id="Td1" colspan="1" rowspan="2">
                                                            <div class="td-content">&nbsp;</div>
                                                        </td>
                                                        <td class="table-index" id="simple_searchword_title" colspan="1" rowspan="2">
                                                            <div class="td-content">搜索词</div>

                                                        </td>
                                                        <td class="no-operate-col" id="Td2" colspan="" rowspan="2">
                                                            <div class="td-content">&nbsp;</div>
                                                        </td>
                                                        <td class="group-name3 group" id="3" colspan="6" rowspan="">
                                                            <div class="td-content">流量质量指标</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="group-item" id="Tr1">
                                                        <td class="number sortable desc group" id="total_search_count" colspan="" rowspan="">
                                                            <div class="td-content">总搜索次数</div>
                                                        </td>
                                                        <td class="ratio sortable" id="search_engine_baidu" colspan="" rowspan="">
                                                            <div class="td-content">百度</div>
                                                        </td>
                                                        <td class="ratio sortable" id="search_engine_g" colspan="" rowspan="">
                                                            <div class="td-content">Google</div>
                                                        </td>
                                                        <td class="ratio sortable" id="search_engine_sogou" colspan="" rowspan="">
                                                            <div class="td-content">搜狗</div>
                                                        </td>
                                                        <td class="ratio" id="search_engine_other" colspan="" rowspan="">
                                                            <div class="td-content">其他</div>
                                                        </td>
                                                        <td class="ratio" id="search_ratio" colspan="" rowspan="">
                                                            <div class="td-content">占比</div>
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="line" id="table-tr_0">
                                                        <td class="number-col" id="Td3" colspan="">
                                                            <div class="td-content" title="1">1</div>

                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td4" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="wta即时排名" target="_blank">wta即时排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td5">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td6" colspan="">
                                                            <div class="td-content" title="">386</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td7" colspan="">
                                                            <div class="td-content" title="">63.99%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td8" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td9" colspan="">
                                                            <div class="td-content" title="">11.14%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td10" colspan="">
                                                            <div class="td-content" title="">24.87%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td11" colspan="">
                                                            <div class="td-content" title="">21.65%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_1">
                                                        <td class="number-col" id="Td12" colspan="">
                                                            <div class="td-content" title="2">2</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td13" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘的网球" target="_blank">丘的网球</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td14">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td15" colspan="">
                                                            <div class="td-content" title="">215</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td16" colspan="">
                                                            <div class="td-content" title="">78.6%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td17" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td18" colspan="">
                                                            <div class="td-content" title="">2.79%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td19" colspan="">
                                                            <div class="td-content" title="">18.6%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td20" colspan="">
                                                            <div class="td-content" title="">12.06%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_2">
                                                        <td class="number-col" id="Td21" colspan="">
                                                            <div class="td-content" title="3">3</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td22" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘里奇网球即时排名" target="_blank">丘里奇网球即时排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td23">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td24" colspan="">
                                                            <div class="td-content" title="">81</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td25" colspan="">
                                                            <div class="td-content" title="">74.07%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td26" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td27" colspan="">
                                                            <div class="td-content" title="">2.47%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td28" colspan="">
                                                            <div class="td-content" title="">23.46%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td29" colspan="">
                                                            <div class="td-content" title="">4.54%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_3">
                                                        <td class="number-col" id="Td30" colspan="">
                                                            <div class="td-content" title="4">4</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td31" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="wta即时排名&nbsp;coric.top" target="_blank">wta即时排名&nbsp;coric.top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td32">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td33" colspan="">
                                                            <div class="td-content" title="">51</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td34" colspan="">
                                                            <div class="td-content" title="">92.16%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td35" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td36" colspan="">
                                                            <div class="td-content" title="">5.88%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td37" colspan="">
                                                            <div class="td-content" title="">1.96%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td38" colspan="">
                                                            <div class="td-content" title="">2.86%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_4">
                                                        <td class="number-col" id="Td39" colspan="">
                                                            <div class="td-content" title="5">5</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td40" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="coric&nbsp;top" target="_blank">coric&nbsp;top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td41">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td42" colspan="">
                                                            <div class="td-content" title="">40</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td43" colspan="">
                                                            <div class="td-content" title="">47.5%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td44" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td45" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td46" colspan="">
                                                            <div class="td-content" title="">52.5%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td47" colspan="">
                                                            <div class="td-content" title="">2.24%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_5">
                                                        <td class="number-col" id="Td48" colspan="">
                                                            <div class="td-content" title="6">6</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td49" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="wta排名即时最新排名" target="_blank">wta排名即时最新排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td50">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td51" colspan="">
                                                            <div class="td-content" title="">27</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td52" colspan="">
                                                            <div class="td-content" title="">100%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td53" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td54" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td55" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td56" colspan="">
                                                            <div class="td-content" title="">1.51%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_6">
                                                        <td class="number-col" id="Td57" colspan="">
                                                            <div class="td-content" title="7">7</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td58" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="wta即时排名&nbsp;丘" target="_blank">wta即时排名&nbsp;丘</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td59">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td60" colspan="">
                                                            <div class="td-content" title="">25</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td61" colspan="">
                                                            <div class="td-content" title="">100%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td62" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td63" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td64" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td65" colspan="">
                                                            <div class="td-content" title="">1.4%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_7">
                                                        <td class="number-col" id="Td66" colspan="">
                                                            <div class="td-content" title="8">8</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td67" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="网球即时排名" target="_blank">网球即时排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td68">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td69" colspan="">
                                                            <div class="td-content" title="">25</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td70" colspan="">
                                                            <div class="td-content" title="">68%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td71" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td72" colspan="">
                                                            <div class="td-content" title="">24%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td73" colspan="">
                                                            <div class="td-content" title="">8%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td74" colspan="">
                                                            <div class="td-content" title="">1.4%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_8">
                                                        <td class="number-col" id="Td75" colspan="">
                                                            <div class="td-content" title="9">9</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td76" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="atp排名" target="_blank">atp排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td77">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td78" colspan="">
                                                            <div class="td-content" title="">22</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td79" colspan="">
                                                            <div class="td-content" title="">77.27%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td80" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td81" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td82" colspan="">
                                                            <div class="td-content" title="">22.73%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td83" colspan="">
                                                            <div class="td-content" title="">1.23%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_9">
                                                        <td class="number-col" id="Td84" colspan="">
                                                            <div class="td-content" title="10">10</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td85" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘的网球&nbsp;coric.top" target="_blank">丘的网球&nbsp;coric.top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td86">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td87" colspan="">
                                                            <div class="td-content" title="">22</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td88" colspan="">
                                                            <div class="td-content" title="">72.73%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td89" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td90" colspan="">
                                                            <div class="td-content" title="">27.27%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td91" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td92" colspan="">
                                                            <div class="td-content" title="">1.23%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_10">
                                                        <td class="number-col" id="Td93" colspan="">
                                                            <div class="td-content" title="11">11</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td94" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘里奇网球即时排名&nbsp;coric.top" target="_blank">丘里奇网球即时排名&nbsp;coric.top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td95">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td96" colspan="">
                                                            <div class="td-content" title="">19</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td97" colspan="">
                                                            <div class="td-content" title="">100%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td98" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td99" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td100" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td101" colspan="">
                                                            <div class="td-content" title="">1.07%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_11">
                                                        <td class="number-col" id="Td102" colspan="">
                                                            <div class="td-content" title="12">12</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td103" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="atp即时排名" target="_blank">atp即时排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td104">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td105" colspan="">
                                                            <div class="td-content" title="">17</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td106" colspan="">
                                                            <div class="td-content" title="">94.12%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td107" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td108" colspan="">
                                                            <div class="td-content" title="">5.88%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td109" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td110" colspan="">
                                                            <div class="td-content" title="">0.95%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_12">
                                                        <td class="number-col" id="Td111" colspan="">
                                                            <div class="td-content" title="13">13</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td112" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="coric" target="_blank">coric</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td113">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td114" colspan="">
                                                            <div class="td-content" title="">14</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td115" colspan="">
                                                            <div class="td-content" title="">71.43%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td116" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td117" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td118" colspan="">
                                                            <div class="td-content" title="">28.57%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td119" colspan="">
                                                            <div class="td-content" title="">0.79%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_13">
                                                        <td class="number-col" id="Td120" colspan="">
                                                            <div class="td-content" title="14">14</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td121" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="coric.top" target="_blank">coric.top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td122">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td123" colspan="">
                                                            <div class="td-content" title="">14</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td124" colspan="">
                                                            <div class="td-content" title="">85.71%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td125" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td126" colspan="">
                                                            <div class="td-content" title="">14.29%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td127" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td128" colspan="">
                                                            <div class="td-content" title="">0.79%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_14">
                                                        <td class="number-col" id="Td129" colspan="">
                                                            <div class="td-content" title="15">15</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td130" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘里奇" target="_blank">丘里奇</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td131">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td132" colspan="">
                                                            <div class="td-content" title="">11</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td133" colspan="">
                                                            <div class="td-content" title="">100%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td134" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td135" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td136" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td137" colspan="">
                                                            <div class="td-content" title="">0.62%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_15">
                                                        <td class="number-col" id="Td138" colspan="">
                                                            <div class="td-content" title="16">16</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td139" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="即时排名" target="_blank">即时排名</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td140">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td141" colspan="">
                                                            <div class="td-content" title="">9</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td142" colspan="">
                                                            <div class="td-content" title="">77.78%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td143" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td144" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td145" colspan="">
                                                            <div class="td-content" title="">22.22%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td146" colspan="">
                                                            <div class="td-content" title="">0.5%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_16">
                                                        <td class="number-col" id="Td147" colspan="">
                                                            <div class="td-content" title="17">17</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td148" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘受网球" target="_blank">丘受网球</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td149">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td150" colspan="">
                                                            <div class="td-content" title="">9</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td151" colspan="">
                                                            <div class="td-content" title="">88.89%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td152" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td153" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td154" colspan="">
                                                            <div class="td-content" title="">11.11%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td155" colspan="">
                                                            <div class="td-content" title="">0.5%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_17">
                                                        <td class="number-col" data="" id="Td156" colspan="">
                                                            <div class="td-content" title="18">18</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td157" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="wta即时排名coric.top" target="_blank">wta即时排名coric.top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td158">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td159" colspan="">
                                                            <div class="td-content" title="">8</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td160" colspan="">
                                                            <div class="td-content" title="">100%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td161" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td162" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td163" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td164" colspan="">
                                                            <div class="td-content" title="">0.45%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_18">
                                                        <td class="number-col" id="Td165" colspan="">
                                                            <div class="td-content" title="19">19</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td166" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="丘里奇网球" target="_blank">丘里奇网球</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td167">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td168" colspan="">
                                                            <div class="td-content" title="">8</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td169" colspan="">
                                                            <div class="td-content" title="">87.5%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td170" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td171" colspan="">
                                                            <div class="td-content" title="">12.5%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td172" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td173" colspan="">
                                                            <div class="td-content" title="">0.45%</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="line" id="table-tr_19">
                                                        <td class="number-col" id="Td174" colspan="">
                                                            <div class="td-content" title="20">20</div>
                                                        </td>
                                                        <td class="table-index simple_searchword_title" id="Td175" colspan="">
                                                            <div class="td-content" title=""><a href="#" title="网球即时排名coric.top" target="_blank">网球即时排名coric.top</a></div>
                                                        </td>
                                                        <td colspan="" class="operate-col" id="Td176">
                                                            <div class="td-content" title="">&nbsp;</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td177" colspan="">
                                                            <div class="td-content" title="">7</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td178" colspan="">
                                                            <div class="td-content" title="">100%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td179" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td180" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td181" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td182" colspan="">
                                                            <div class="td-content" title="">0.39%</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr class="" id="Tr2">
                                                        <td class="number-col" id="Td183" colspan="">
                                                            <div class="td-content" title="&nbsp;">&nbsp;</div>
                                                        </td>
                                                        <td class="simple_searchword_title" id="Td184" colspan="2">
                                                            <div class="td-content" title="">当前汇总</div>
                                                        </td>
                                                        <td class="number group total_search_count" id="Td185" colspan="">
                                                            <div class="td-content" title="">1,010</div>
                                                        </td>
                                                        <td class="ratio search_engine_baidu" id="Td186" colspan="">
                                                            <div class="td-content" title="">74.16%</div>
                                                        </td>
                                                        <td class="ratio search_engine_g" id="Td187" colspan="">
                                                            <div class="td-content" title="">0%</div>
                                                        </td>
                                                        <td class="ratio search_engine_sogou" id="Td188" colspan="">
                                                            <div class="td-content" title="">6.93%</div>
                                                        </td>
                                                        <td class="ratio search_engine_other" id="Td189" colspan="">
                                                            <div class="td-content" title="">18.91%</div>
                                                        </td>
                                                        <td class="ratio search_ratio" id="Td190" colspan="">
                                                            <div class="td-content" title="">56.65%</div>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="clear"></div>
                            <script type="text/javascript">
                                $('.nav_ul_item').mouseover(function () {
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Personal_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/Personal_b.png');
                                    } else if ($(this).index() == 1) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/hospital_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/hospital_b.png');
                                    } else if ($(this).index() == 2) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/leadership_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/leadership_b.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/wfperfdashbaord_c.png');
                                        $(this).children('a').children('.nav_ul_item_title').css('color', '#fff')
                                    }
                                    else if ($(this).index() == 4) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Department_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/Department_b.png');
                                    }
                                    else if ($(this).index() == 5) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/nurse_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/nurse_b.png');
                                    }
                                    $(this).children('a').children('.nav_ul_item_title').css('color', 'rgb(16, 138, 249)')
                                }).mouseout(function (){
                                    $(this).children('a').children('.nav_ul_item_title').css('color', '#fff');
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Personal_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/Personal_a.png');
                                    } else if ($(this).index() == 1) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/hospital_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/hospital_a.png');
                                    } else if ($(this).index() == 2) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/leadership_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/leadership_a.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/wfperfdashbaord_c.png');
                                        $(this).children('a').children('img').attr('src', '/img/wfperfdashbaord_c.png');
                                    }
                                    else if ($(this).index() == 4) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Department_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/Department_a.png');
                                    }
                                    else if ($(this).index() == 5) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/nurse_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/nurse_a.png');
                                    }
                                })
                                $('.tabs_li').click(function () {
                                    $('.tabs_li').removeClass('selected');
                                    $(this).addClass('selected');
                                    $('.summary').hide();
                                    $('.summary').eq($(this).index()).show();
                                })
                                $('.nav_header').click(function () {
                                    $('.index_nav').hide();
                                    $('.index_navs').show();
                                    $('.ct').css({ 'width': '95%' });
                                })
                                $('.nav_headers').click(function () {
                                    $('.index_nav').show();
                                    $('.index_navs').hide();
                                    $('.ct').css({ 'width': '89%' });
                                })
                                function change() {
                                    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
                                    var isOpera = userAgent.indexOf("Opera") > -1;
                                    //判断是否Opera浏览器
                                    if (isOpera) {
                                        return "Opera"
                                    };
                                    //判断是否Firefox浏览器
                                    if (userAgent.indexOf("Firefox") > -1) {
                                        $('.left_right').css('height', '43px');
                                        $('.new_right').css('height', '41px');
                                        $('.right_right').css('height', '41px');
                                        $('.lefts_right').css('height', '41px');
                                        $('.date_right').css('height', '41px');
                                        return "FF";
                                    }
                                    //判断是否chorme浏览器
                                    if (userAgent.indexOf("Chrome") > -1) {
                                        return "Chrome";
                                    }
                                    //判断是否Safari浏览器
                                    if (userAgent.indexOf("Safari") > -1) {
                                        return "Safari";
                                    }
                                    //判断是否IE浏览器
                                    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
                                        $('.finally').css('height', '36px');
                                        //$('.tab_header_ul').css('height', '42px');
                                        //$('.new_header_ul').css('height', '42px');
                                        //$('.tabs_header_ul').css('height', '42px');
                                        return "IE";
                                    }
                                    //判断是否Edge浏览器
                                    if (userAgent.indexOf("Trident") > -1) {
                                        $('.finally').css('height', '36px');
                                        //$('.new_header_ul').css('height', '42px');
                                        //$('.tabs_header_ul').css('height', '42px');
                                        //$('.new_swiper').css('top', '53px');
                                        //$('.new_header_div .new_header_right').css('height', '43px!important');
                                        return "Edge";
                                    };
                                }
                                change();
                                var myChart = echarts.init(document.getElementById('main'));

                                var option = {
                                    color: ['#3398DB'],
                                    tooltip: {
                                        trigger: 'axis',
                                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                        }
                                    },
                                    grid: {
                                        left: '3%',
                                        right: '4%',
                                        bottom: '3%',
                                        containLabel: true
                                    },
                                    xAxis: [
                                        {
                                            type: 'category',
                                            data: ['浏览量(PV) ', '访客数(UV) ', 'IP数', '跳出率', '平均访问时长'],
                                            axisTick: {
                                                alignWithLabel: true
                                            }
                                        }
                                    ],
                                    yAxis: [
                                        {
                                            type: 'value'
                                        }
                                    ],
                                    series: [
                                        {
                                            name: '直接访问',
                                            type: 'bar',
                                            barWidth: '60%',
                                            data: [200, 52, 400, 334, 90]
                                        }
                                    ]
                                };


                                myChart.setOption(option);

                                $('#event-monitor-advanced-filter').click(function () {
                                    $(this).toggleClass('up');
                                    $('.drop-down-parent').toggle();
                                    console.log($(this).is('.up'))
                                    if ($(this).is('.up') == true) {
                                        $(this).html('收起筛选')
                                    } else {
                                        $(this).html('高级筛选')
                                    }
                                })




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
