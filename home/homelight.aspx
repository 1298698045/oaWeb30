<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homelight.aspx.cs" Inherits="Supermore.home.homelight" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <style>
        .tab_cont_content_ul_item:nth-child(2n) {
            background-color: #f8f8f8;
        }
    </style>
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
    <link href="/css/dashboard.css" rel="stylesheet" />
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <link href="/home/home.css" rel="stylesheet" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/idangerous.swiper2.7.6.min.js"></script>

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
    <link href="/template/css/layui.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
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
        .layui-laydate {
            border-top:0 !important;
        }
        .calder-content {
            width:100%;
            min-width:270px;
        }
        .index_right {
            position:absolute;
            min-width:270px;
            right:0;
        }
        .index_nav{
            display:none;
        }
        .ct {
            position:relative;
            width:100%;
            padding-left:20px;
            box-sizing:border-box;
            overflow-y:auto;

        }
        .layui-laydate-header {
            margin-top:1px !important;
        }
        .zen-inlineList.zen-tabMenu {
            margin-left:8px !important;
        }
        .record {
            border: 1px solid rgb(102, 204, 0);
        }
        .nodata{
            text-align:center;
            line-height:100px;
            font-size:24px;
            color:#999;
            font-weight:700;
        }
        #quicklink>a{
            float:left;
            width:33.3%;
            height:100px;

        }
        #quicklink .tab_cont_content_ul_item{
            height:100px;
            box-sizing:border-box;
            border-right:1px solid #dedede;
            background-color:white;
            text-align:center;
        }
        #quicklink {
            border-left:1px solid #dedede;
            border-top:1px solid #dedede;
        }
        #quicklink{
            overflow:hidden;
            margin-bottom:20px;
        }
        #quicklink img{
            height:48px;
            width:48px;
            margin-top:15px;
        }
        #quicklink .tab_right_cont_content_ul_item_title{
            padding-left:0;
        }
        #quicklink .tab_right_cont_content_ul_item_title{
            line-height:100px;
        }
        #quicklink .imgtitle{
            line-height:30px;
            margin-top:0;
            display:block;
        }
        .data_cont_content_ul_item{
            position:relative;
        }
        .meetinghandle{
            position:absolute;
            right:10px;
            bottom:10px;
        }
        .meetinghandle>div{
            float:left;
            margin-right:10px;
            color:#018def;
            cursor:pointer;
        }
        .refuse.actives{
            color:red;
        }
        .accept.actives{
            color:rgb(102, 204, 0);
        }
        .tabs_cont_content{
            padding-bottom:15px;
        }
        .nodata{
            position:absolute;
            top:50%;
            margin-top:-50px;
            width:100%;
            text-align:center;
        }
        .data_cont_content_ul{
            position:relative;
        }
        .tab_cont_content_ul{
            position:relative;
            min-height:200px;
        }
        body #iframe {
            position: fixed;
            z-index: 1001;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: none;
            height: 620px;
            border: 0;
        }
        .popup-mask {
            position: fixed;
            background: url(/img/bgOverlayDialogBackground.png) ;
            background-color: transparent ;
            top: 0;
            width:100%;
            height:100%;
            display:none;
            z-index:1000;
            left:0;
        }
        .layui-layer-rim{
            border: 2px solid #1797c0 !important;
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
                                    <img src="/img/images/02.2.ChannelEditing.png" alt="" />
                                </div>
                                <ul class="nav_ul">
                                    <li class="nav_ul_item nav_active">
                                        <a href="/home/homelight.aspx">
                                            <span class="nav_ul_item_img">
                                                <img src="/img/Personal_c.png" alt="Alternate Text" />
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
                                    <li class="nav_ul_item">
                                        <a href="/wfinstance/wfperfdashbaord.aspx"><span class="nav_ul_item_img">
                                            <img src="/img/wfperfdashbaord_a.png" alt="Alternate Text" />
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
                                     <img src="/img/images/02.2.ChannelEditing.png" alt="" />
                                </div>
                                <ul class="nav_ul">
                                    <li class="nav_ul_item nav_active">
                                        <a href="/home/homelight.aspx" class="nav_ul_item_a"><img src="/img/Personal_c.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="/content/contentsrc.aspx" class="nav_ul_item_a"><img src="/img/hospital_a.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="#" class="nav_ul_item_a"><img src="/img/leadership_a.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item">
                                        <a href="/wfinstance/wfperfdashbaord.aspx" class="nav_ul_item_a"><img src="/img/wfperfdashbaord_a.png" alt="Alternate Text" /></a>
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
                                <div class="index_left">
                                    <%--<div class="header_list">
                                        <ul class="header_list_ul">
                                            <li class="header_list_ul_item">
                                                <div class="header_list_ul_item_img">
                                                    <img src="/img/small.png" alt="">
                                                </div>
                                                <p class="header_list_ul_item_num">47.2k</p>
                                                <p class="header_list_ul_item_title">Followers</p>
                                                <p class="header_list_ul_item_number">
                                                    <i class="iconfont icon-jiantou_youshang"></i>
                                                    <span>21.3%</span>
                                                </p>
                                            </li>
                                            <div class="block"></div>
                                            <li class="header_list_ul_item">
                                                <div class="header_list_ul_item_img">
                                                    <img src="/img/small.png" alt="">
                                                </div>
                                                <p class="header_list_ul_item_num">47.2k</p>
                                                <p class="header_list_ul_item_title">Followers</p>
                                                <p class="header_list_ul_item_number">
                                                    <i class="iconfont icon-jiantou_youshang"></i>
                                                    <span>21.3%</span>
                                                </p>
                                            </li>
                                            <div class="block"></div>
                                            <li class="header_list_ul_item">
                                                <div class="header_list_ul_item_img">
                                                    <img src="/img/small.png" alt="">
                                                </div>
                                                <p class="header_list_ul_item_num">47.2k</p>
                                                <p class="header_list_ul_item_title">Followers</p>
                                                <p class="header_list_ul_item_number">
                                                    <i class="iconfont icon-jiantou_youxia"></i>
                                                    <span>21.3%</span>
                                                </p>
                                            </li>
                                            <div class="block"></div>
                                            <li class="header_list_ul_item">
                                                <div class="header_list_ul_item_img">
                                                    <img src="/img/small.png" alt="">
                                                </div>
                                                <p class="header_list_ul_item_num">47.2k</p>
                                                <p class="header_list_ul_item_title">Followers</p>
                                                <p class="header_list_ul_item_number">
                                                    <i class="iconfont icon-jiantou_youxia"></i>
                                                    <span>21.3%</span>
                                                </p>
                                            </li>
                                            <li class="clear"></li>
                                        </ul>
                                    </div>--%>
                                    <div class="taba">
                                        <div class="tab_header">
                                            <div class="tab_header_div">
                                                <ul class="tab_header_ul">
                                                    <li class="tab_header_ul_item tab_item active">
                                                        <span class="tab_header_ul_item_title">待办</span>
                                                        <div class="tab_header_ul_item_num"id="waitingTaskQty">12</div>
                                                    </li>
                                                    <li class="tab_header_ul_item tab_item">
                                                        <span class="tab_header_ul_item_title">退回</span>
                                                        <span class="tab_header_ul_item_num "id="cancelledQty">109</span>
                                                    </li>
                                                    <li class="tab_header_ul_item tab_item">
                                                        <span class="tab_header_ul_item_title">待阅</span>
                                                        <span class="tab_header_ul_item_num "id="unReadQty">12</span>
                                                    </li>
                                                    <li class="tab_header_ul_item tab_item">
                                                        <span class="tab_header_ul_item_title">上会</span>
                                                        <span class="tab_header_ul_item_num "id="requestMeetingQty">12</span>
                                                    </li>
                                                    <li class="tab_header_right">
                                                        <div id="reloadprocess">
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div id="moreprocess">
                                                            <img src="/img/images/8.new_window(16x16).png" alt=""/>
                                                        </div>
                                                    </li>
                                                    <li class="clear"></li>
                                                </ul>

                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="tab_cont">
                                            <div class="tab_cont_content actives">
                                                <ul class="tab_cont_content_ul" id="waitingRecords">
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_red">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first jin_yellow">紧</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">【党政联席会议审批流程】【医务处】医务处管理职责及工作人员职责修订</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first jin_yellow">紧</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">【党政联席会议审批流程】【医务处】医务处管理职责及工作人员职责修订</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_green">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_green">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_green">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="tab_cont_content">
                                                <ul class="tab_cont_content_ul" id="cancellRecords">
                                                </ul>
                                            </div>
                                            <div class="tab_cont_content">
                                                <ul class="tab_cont_content_ul" id="unReadRecords">
                                                </ul>
                                            </div>
                                            <div class="tab_cont_content">
                                                <ul class="tab_cont_content_ul" id="requestMeetingRecords">
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="blocks"></div>
                                    <div class="taba">
                                        <div class="tab_header">
                                            <div class="tab_header_div">
                                                <ul class="tab_header_ul">
                                                    <li class="tab_header_ul_item tab_item active">
                                                        <span class="tab_header_ul_item_title">通知</span>
                                                        <%--<div class="tab_header_ul_item_num "id="contentwaitingtotals">12</div>--%>
                                                    </li>
                                                    <li class="tab_header_right">
                                                        <div id="reloadcontentwaiting">
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div id="morecontentwaiting">
                                                            <img src="/img/images/8.new_window(16x16).png" alt=""/>
                                                        </div>
                                                    </li>
                                                    <li class="clear"></li>
                                                </ul>

                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="tab_cont">
                                            <div class="tab_cont_content actives">
                                                <ul class="tab_cont_content_ul" id="contentwaiting">
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_red">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first jin_yellow">紧</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">【党政联席会议审批流程】【医务处】医务处管理职责及工作人员职责修订</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first jin_yellow">紧</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">【党政联席会议审批流程】【医务处】医务处管理职责及工作人员职责修订</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_green">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                    <li class="tab_cont_content_ul_item">
                                                        <span class="tab_cont_content_ul_item_first te_green">特</span>
                                                        <span class="tab_cont_content_ul_item_title" style="padding-left: 35px;">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                        <span class="tab_cont_content_ul_item_people">张丽萍</span>
                                                        <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="tab_cont_content">
                                                2
                                            </div>
                                            <div class="tab_cont_content">
                                                3
                                            </div>
                                            <div class="tab_cont_content">
                                                4
                                            </div>
                                            <div class="tab_cont_content">
                                                5
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="blocks"></div>
                                    <div class="new">
                                        <div class="new_header">
                                            <div class="new_header_div">
                                                <ul class="new_header_ul">
                                                    <li class="new_header_ul_item onlyOne_active">
                                                        <span class="new_header_ul_item_title new_title tab_header_ul_item_title">新闻中心</span>
                                                    </li>
                                                    <li class="tab_header_right">
                                                        <div>
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div>
                                                            <img src="/img/images/8.new_window(16x16).png" alt=""/>
                                                        </div>
                                                    </li>
                                                    <li class="clear"></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="new_swiper">
                                            <div class="swiper-container"  style="height: 100%;">
                                                <div class="new_swiper_ul swiper-wrapper" style="height: 92%;">
                                                    <div class="new_swiper_ul_item swiper-slide">
                                                        <p class="new_swiper_ul_item_title">以拼搏为美 向行动致敬——我院召开2017年度总结表彰大会</p>
                                                        <p class="new_swiper_ul_item_date ">2019-4-4</p>
                                                        <div class="new_swiper_ul_item_img">
                                                            <img src="/img/news.png" alt="">
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <%--<div class="swiper-pagination"></div>--%>
                                            </div>
                                            <div class="swiper-button-prev" style="top: 98.5%; left: 92%; width: 22px; height: 22px; border: 1px solid rgb(16, 138, 249); background-size: 7px 22px;"></div>
                                            <div class="swiper-button-next" style="top: 98.5%; left: 97%; width: 22px; height: 22px; border: 1px solid rgb(16, 138, 249); background-size: 7px 22px;"></div>
                                            
                                        </div>
                                    </div>
                                    <div class="blocks"></div>
                                    <div class="tab_two">
                                        

                                        <div class="tabs tab_left" style="float: left;">
                                            <div class="tabs_header">
                                                <div class="tabs_header_div">
                                                    <ul class="tabs_header_ul">
                                                        <li class="tabs_header_ul_item onlyOne_active">
                                                            <span class="tab_header_ul_item_title">问卷调查</span>
                                                        </li>
                                                        <li class="tab_header_right">
                                                        <div id="reloadunresponse">
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div id="moreunresponse">
                                                            <img src="/img/images/8.new_window(16x16).png" alt=""/>
                                                        </div>
                                                    </li>
                                                        <li class="clear"></li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <div class="tabs_cont">
                                                <div class="tabs_cont_content actives" style="padding-top:0">
                                                    <ul class="tab_cont_content_ul" id="unresponse">
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="blocks"></div>
                                        </div>
                                        <div class="tabs tab_left" style="float: right;">
                                            <div class="tabs_header">
                                                <div class="tabs_header_div">
                                                    <ul class="tabs_header_ul">
                                                        <li class="tabs_header_ul_item onlyOne_active">
                                                            <span class="tab_header_ul_item_title">绩效考评</span>
                                                        </li>
                                                        <li class="tab_header_right">
                                                        <div id="relodaevaluator">
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div id="moreevaluator">
                                                            <img src="/img/images/8.new_window(16x16).png" alt=""/>
                                                        </div>
                                                    </li>
                                                        <li class="clear"></li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <div class="tabs_cont">
                                                <div class="tabs_cont_content actives" style="padding-top:0">
                                                    <ul class="tab_cont_content_ul" id="evaluator">
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">[投票] 你喜欢一年中的哪个季节？</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="blocks"></div>
                                        </div>
                                        <div class="tabs tab_left">
                                            <div class="tabs_header">
                                                <div class="tabs_header_div">
                                                    <ul class="tabs_header_ul">
                                                        <li class="tabs_header_ul_item tab_item active">
                                                            <span class="tab_header_ul_item_title">最新新闻</span>
                                                        </li>
                                                        <li class="tab_header_right">
                                                        <div id="reloadhotnews">
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div id="morehotnews">
                                                            <img src="/img/images/8.new_window(16x16).png" alt=""/>
                                                        </div>
                                                    </li>
                                                        <li class="clear"></li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <div class="tabs_cont">
                                                <div class="tabs_cont_content tabs_content actives" style="padding-top:0">
                                                    <ul class="tab_cont_content_ul" id="hotnews">
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="blocks"></div>
                                        </div>
                                        <div class="tabs tab_left" style="float:right;">
                                            <div class="tabs_header">
                                                <div class="tabs_header_div">
                                                    <ul class="tabs_header_ul">
                                                        <li class="tabs_header_ul_item tab_item active">
                                                            <span class="tab_header_ul_item_title">领导效能曝光</span>
                                                        </li>
                                                        <li class="tabs_header_ul_item tab_item">
                                                            <span class="tab_header_ul_item_title">中层效能曝光</span>
                                                        </li>
                                                        <li class="tabs_header_ul_item tab_item">
                                                            <span class="tab_header_ul_item_title">全部效能曝光</span>
                                                        </li>
                                                        <li class="tab_header_right">
                                                        <div id="reloadperformance">
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                    </li>
                                                        <li class="clear"></li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <div class="tabs_cont" style="overflow:initial">
                                                <div class="tabs_cont_content actives" style="padding-top: 50px;">
                                                    <div class="tab_headers" style="padding: 0; border: 1px solid #ccc;">
                                                        <span class="tab_headers_item tab_headers_item_header">姓名</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">所属部门</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">逾期</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">待办</span>
                                                    </div>
                                                    <ul id="leaderRecords" class="tab_cont_content_ul table" style="list-style: none; float: left; cursor: pointer; width: 100%; font-size: 14px; border: 1px solid #ccc; border-top:none;">
                                                        <li class="tab_cont_content_ul_item table_item">
                                                            <span class="tab_headers_item">卜力</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">辅助检查部</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">8</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">8</span>
                                                        </li>
                                                    </ul>
                                                    <div class="clear"></div>
                                                </div>
                                                <div class="tabs_cont_content" style="padding-top: 50px;">
                                                    <div class="tab_headers" style="padding: 0; border: 1px solid #ccc;">
                                                        <span class="tab_headers_item tab_headers_item_header">姓名</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">所属部门</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">逾期</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">待办</span>
                                                    </div>
                                                    <ul  id="middleRecords" class="tab_cont_content_ul table" style="list-style: none; float: left; cursor: pointer; width: 100%; font-size: 14px; border: 1px solid #ccc; border-top:none;">
                                                        <li class="tab_cont_content_ul_item table_item">
                                                            <span class="tab_headers_item">卜力</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">辅助检查部</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">8</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">8</span>
                                                        </li>
                                                    </ul>
                                                    <div class="clear"></div>
                                                </div>
                                                <div class="tabs_cont_content" style="padding-top: 50px;">
                                                    <div class="tab_headers" style="padding: 0; border: 1px solid #ccc;">
                                                        <span class="tab_headers_item tab_headers_item_header">姓名</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">所属部门</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">逾期</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: -4px;">待办</span>
                                                    </div>
                                                    <ul  id="allRecords" class="tab_cont_content_ul table" style="list-style: none; float: left; cursor: pointer; width: 100%; font-size: 14px; border: 1px solid #ccc; border-top:none;">
                                                        <li class="tab_cont_content_ul_item table_item">
                                                            <span class="tab_headers_item">卜力</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">辅助检查部</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">8</span>
                                                            <span class="tab_headers_item" style="margin-left: -4px;">8</span>
                                                        </li>
                                                    </ul>
                                                    <div class="clear"></div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="clear"></div>
                                    </div>
                                    <div class="blocks"></div>
                                </div>
                                <div class="index_right" style="padding: 10px 10px 10px  0;">
                                    <div class="optCnt">
                                        <div class="calder-content">
                                            <div class="calder-content-head">
                                                <p>28</p>
                                                <p>星期日</p>
                                            </div>
                                            <div id="time-chook"></div>
                                        </div>
                                       
                                    </div>
                                    <div class="data_tab">
                                        <div class="data_tab_header">
                                            <ul class="data_tab_header_ul">
                                                <li class="data_tab_header_ul_item data_active"typeCode="1">日程</li>
                                                <li class="data_tab_header_ul_item"typeCode="2">会议</li>
                                                <li class="data_tab_header_ul_item"typeCode="3">任务</li>
                                            </ul>
                                        </div>
                                        <div class="data_cont">
                                            <div class="data_cont_content" style="display: block;">
                                                <ul class="data_cont_content_ul">
                                                  
                                                </ul>
                                            </div>
                                            <div class="data_cont_content">
                                                <ul class="data_cont_content_ul">
                                                  
                                                </ul></div>
                                            <div class="data_cont_content">
                                                <ul class="data_cont_content_ul">
                                                  
                                                </ul></div>
                                        </div>
                                    </div>
                                    <%--<div class="button_list" style="padding: 20px; background: #fff;">
                                        <button>添加</button>
                                        <button>查看更多</button>
                                    </div>--%>
                                    <%--<div class="blocks"></div>
                                    <div class="tab_left">
                                            <div class="tabs_header">
                                                <div class="tabs_header_div">
                                                    <ul class="tabs_header_ul">
                                                        <li class="tabs_header_ul_item tab_item active">
                                                            <span class="tab_header_ul_item_title">党工团建设</span>
                                                        </li>
                                                        <li class="tabs_header_ul_item tab_item">
                                                            <span class="tab_header_ul_item_title">时政新闻</span>
                                                        </li>
                                                        <li class="tab_header_right">
                                                            <div>
                                                                <img src="/img/cal/refresh.png" alt="">
                                                            </div>
                                                            <div>
                                                                <img src="/img/images/8.new_window(16x16).png" alt="">
                                                            </div>
                                                        </li>
                                                        <li class="clear"></li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <div class="tab-head-img">
                                                <img src="/img/7702.png" alt="Alternate Text" />
                                            </div>
                                            <div class="tabs_cont">
                                                <div class="tabs_cont_content tabs_content actives paddingdiv">
                                                    <ul class="tab_cont_content_ul">
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="tabs_cont_content tabs_content">
                                                    <ul class="tab_cont_content_ul">
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">绍兴第二医院医共体分院的招标采购事项审批表</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                        <li class="tab_cont_content_ul_item">
                                                            <span class="tab_cont_content_ul_item_title">款项发放确认单</span>
                                                            <span class="tab_cont_content_ul_item_date">2019-4-4</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>--%>
                                    <div class="blocks"></div>
                                    <div class="tab_left">
                                            <div class="tabs_header">
                                                <div class="tabs_header_div">
                                                    <ul class="tabs_header_ul">
                                                        <li class="tabs_header_ul_item onlyOne_active">
                                                            <span class="tab_header_ul_item_title">值班信息</span>
                                                        </li>
                                                        <%--<li class="tabs_header_ul_item tab_item">
                                                            <span class="tab_header_ul_item_title"></span>
                                                        </li>--%>
                                                        <li class="tab_header_right">
                                                            <div id="reloaddutyshift">
                                                                <img src="/img/cal/refresh.png" alt="">
                                                            </div>
                                                            <div>
                                                                <img src="/img/images/8.new_window(16x16).png" alt="">
                                                            </div>
                                                        </li>
                                                        <li class="clear"></li>
                                                    </ul>

                                                </div>
                                            </div>
                                            <div class="tabs_cont">
                                                <div class="tabs_cont_content tabs_content actives paddingdiv">
                                                   <div class="tab_headers" style="padding: 0; border: 1px solid #ccc; margin-top: 12px;">
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: 10px;">姓名</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: 35px;">班次</span>
                                                        <span class="tab_headers_item tab_headers_item_header" style="margin-left: 35px;">日期</span>
                                                    </div>
                                                    <ul id="dutyshift" class="tab_cont_content_ul table" style="list-style: none; float: left; cursor: pointer; width: 100%; font-size: 14px; border: 1px solid #ccc; border-top:none;">
                                                        <li class="tab_cont_content_ul_item table_item">
                                                            <span class="tab_headers_item" style="margin-left: 10px;">王刚</span>
                                                            <span class="tab_headers_item" style="margin-left: 35px;">一</span>
                                                            <span class="tab_headers_item" style="margin-left: 35px;">2021-09-01</span>
                                                        </li>
                                                    </ul>
                                                    <div class="clear"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <div class="blocks"></div>
                                    <div class="tab_right ">
                                        <div class="tabs_header">
                                            <div class="tabs_header_div">
                                                <ul class="tabs_header_ul">
                                                    <li class="tabs_header_ul_item onlyOne_active">
                                                        <span class="tab_header_ul_item_title">常用链接2</span>
                                                    </li>
                                                    <%--<li class="tab_header_right">
                                                        <div>
                                                            <img src="/img/cal/refresh.png" alt="" />
                                                        </div>
                                                        <div>
                                                            <img src="/img/images/8.new_window(16x16).png" alt=" />
                                                        </div>
                                                    </li>--%>
                                                    <li class="clear"></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="tabs_cont">
                                            <div class="tabs_cont_content actives" style="padding-bottom:20px;">
                                                <ul class="tab_cont_content_ul tab_cont_content_ul-line" id="quicklink">
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <script>
                                $('.nav_ul_item').mouseover(function () {
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Personal_c.png');
                                        $(this).children('a').children('.nav_ul_item_title').css('color', '#fff')
                                    } else if ($(this).index() == 1) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/hospital_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/hospital_b.png');
                                    } else if ($(this).index() == 2) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/leadership_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/leadership_b.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/wfperfdashbaord_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/wfperfdashbaord_a.png');
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
                                }).mouseout(function () {
                                    $(this).children('a').children('.nav_ul_item_title').css('color', '#fff');
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Personal_c.png');
                                        $(this).children('a').children('img').attr('src', '/img/Personal_c.png');
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
                                $('.tab_item').click(function () {
                                    $(this).siblings().removeClass('active');
                                    $(this).addClass('active');
                                    $(this).parents('.tabs_header').next().find('.tab_cont_content').hide()
                                    $(this).parents('.tabs_header').next().find('.tab_cont_content').eq($(this).index()).show();
                                })
                                $('.data_tab_header_ul_item ').click(function () {
                                    $('.data_tab_header_ul_item').removeClass('data_active');
                                    $(this).addClass('data_active');
                                    $('.data_cont_content').hide();
                                    $('.data_cont_content').eq($(this).index()).show();
                                })
                                $('.nav_header').click(function () {
                                    $('.index_nav').hide();
                                    $('.index_navs').show();
                                    $('.ct').css({ 'width': '95%' });
                                    widthresize()
                                    //$('.index_left').css({ 'left': '3.85%', 'width': '71%' });
                                    //$('.index_right').css({ 'width': '24%' });
                                })
                                $('.nav_headers').click(function () {
                                    $('.index_nav').show();
                                    $('.index_navs').hide();
                                    $('.ct').css({ 'width': '85%' });
                                    widthresize()

                                    //$('.index_left').css({ 'left': '11.5%', 'width': '67%' });
                                    //$('.index_right').css({ 'width': '20%' });
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
        <%--<cc1:PageFooter ID="SiteFooter1" runat="server" />--%>
        <%--<div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>--%>
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/layui/layui/layui.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <script src="/js/alert.js"></script>
    <script>

        $('.ct').height($(window).height() - 140)
        laydate.render({
            elem: '#time-chook',
            show: true,
            position: 'static',
            showBottom: false,
            ready: function () {
                addlayui()
                getcalendar()
            },
            change: function () {
                addlayui()
                getcalendar()
            }
        });
        function addlayui() {
            var weekdays = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']

            //$('.laydate-set-ym span').addClass('displedclick');
            $('.layui-icon.laydate-prev-m').html(' ');
            $('.layui-icon.laydate-next-m').html(' ');
            $('.layui-icon.laydate-prev-y').html(' ');
            $('.layui-icon.laydate-next-y').html(' ');
            $('.layui-laydate-content').append('<div class="calender-line"></div>');
            var myDate = new Date()
            var year = myDate.getFullYear();
            var mon = myDate.getMonth() + 1;
            var date = myDate.getDate();
            var time = year + '-' + mon + '-' + date;
            $('td[lay-ymd=' + time + ']').addClass('tody');
            widthresize()
            if($('.layui-laydate-content tr').eq(5).find('td').eq(0).hasClass('laydate-day-next')){
                $('.layui-laydate-content tr').eq(5).hide()
            }else{
                $('.layui-laydate-content tr').eq(5).show()
            }
            var nowdate = eval('new Date(' + $('.layui-this').attr('lay-ymd').replace(/\d+(?=-[^-]+$)/, function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
            var weekday = weekdays[nowdate.getDay()]
            $('.calder-content-head').html('<p>' + $('.layui-this').html() + '</p><p>' + weekday + '</p>')
        }
        //日期改变
        
        $(window).resize(function () {
            widthresize()
        })
        function widthresize() {
            var margin = $('.layui-laydate-content').find('tr').width() - 250
            margin = margin / 14
            $('.layui-laydate-content td').each(function () {
                $(this).css('margin-left', margin).css('margin-right', margin)
            })
            $('.layui-laydate-content th').each(function () {
                $(this).css('margin-left', margin).css('margin-right', margin)
            })
        }
        //日程
        function getcalendar() {
            var date = $('.laydate-set-ym span').eq(0).attr('lay-ym')
            ajaxMethodGetData('home.calendar.month', { date: date }, function (data) {
                var date = data.data
                for (var i = 0; i < date.length; i++) {
                    var day = date[i]
                    var day1 = day.split('-')[1]
                    var day2 = day.split('-')[2]
                    if (day1.substr(0, 1) == '0') {
                        day1 = day1.substr(1, 1)
                    }
                    if (day2.substr(0, 1) == '0') {
                        day2 = day2.substr(1, 1)
                    }
                    day = day.split('-')[0] + '-' + day1 + '-' + day2
                    $('td[lay-ymd="' + day + '"]').addClass('record')
                }
            })
        }
        getcaldata()
        function getcaldata() {
            //console.log(1)
            var typeCode = $('.data_tab_header_ul_item.data_active').attr('typeCode')
            ajaxMethodGetData('home.activity.list', { typeCode: typeCode }, function (data) {
                $('.data_cont_content_ul_item').remove()
                var date = data.data
                for (var i = 0; i < date.length; i++) {
                    var row = date[i]
                    if (typeCode == 2) {
                        var html = ''
                        html += '<li class="data_cont_content_ul_item"style="border-left:1px solid #dedede">'
                                                    + '    <a target="" href="' + row.LinkUrl + '"><div class="data_cont_content_ul_item_img">'
                                                    + '        <img src="' + row.ImgSrc + '" alt="">'
                                                    + '    </div>'
                                                    + '    <div class="data_cont_content_ul_item_cont">'
                                                    + '        <p class="data_cont_content_ul_item_date">' + row.ItemDate + '</p>'
                                                    + '        <p class="data_cont_content_ul_item_title">' + row.ItemTitle + '</p>'
                                                    + '        <p class="data_cont_content_ul_item_people">' + row.ItemPeople + '</p>'
                                                    + '    </div></a>'
                                                    + '<div class="meetinghandle">'
                        if (row.StatusCode == 1) {
                            html += '<div class="accept actives">已接受</div><div class="refuse" onclick=acceptrejection("' + row.ItemId + '","2")>拒绝</div>'
                        } else if (row.StatusCode == 2) {
                            html += '<div class="accept" onclick=acceptrejection("' + row.ItemId + '","1")>接受</div><div class="refuse actives">已拒绝</div>'
                        } else {
                            html += '<div class="accept" onclick=acceptrejection("' + row.ItemId + '","1")>接受</div><div class="refuse" onclick=acceptrejection("' + row.ItemId + '","2")>拒绝</div>'
                        }
                                             
                                                    html+='</div>'
                                                    + '</li>'
                        $('.data_cont_content_ul').eq(typeCode - 1).append(html)
                    } else {
                        $('.data_cont_content_ul').eq(typeCode - 1).append('<a target="'+Math.floor(Math.random()*1000)+'" href="' + row.LinkUrl + '"><li class="data_cont_content_ul_item"style="border-left:1px solid #dedede">'
                                                    + '    <div class="data_cont_content_ul_item_img">'
                                                    + '        <img src="' + row.ImgSrc + '" alt="">'
                                                    + '    </div>'
                                                    + '    <div class="data_cont_content_ul_item_cont">'
                                                    + '        <p class="data_cont_content_ul_item_date">' + row.ItemDate + '</p>'
                                                    + '        <p class="data_cont_content_ul_item_title">' + row.ItemTitle + '</p>'
                                                    + '        <p class="data_cont_content_ul_item_people">' + row.ItemPeople + '</p>'
                                                    + '    </div>'
                                                    + '</li></a>')
                    }
                }
                if ($('.data_cont_content_ul').eq(typeCode - 1).find('li').length == 0) {
                    $('.data_cont_content_ul').eq(typeCode - 1).html('<div class="nodata">暂无数据</div>')
                }
            })
        }
        function acceptrejection(id, status) {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/alert/acceptmeeting.html?id=' + id + '&status=' + status).height(480).css('margin-top','-240px')
            //ajaxMethodGetData('meeting.accept.rejection', { id: id, status: status }, function (data) {
            //    if (data.status == 1) {
            //        success2(data.msg)
            //        getcaldata()
            //    }
            //})
        }
        $('.data_tab_header_ul_item').click(function(){
            getcaldata()
        })
        //事务
        $('#reloadprocess').click(function () {
            gethomepageprocesswaiting()
            success2('刷新成功')
        })
        $('#moreprocess').click(function () {
            window.open('/a0M/o')
        })
        gethomepageprocesswaiting()
        function gethomepageprocesswaiting() {
            ajaxMethodGetData('homepage.process.waiting.search', null, function (data) {
                if (data.state == 1) {
                    var data = data.returnValue
                    $('#waitingTaskQty').html(data.waitingTaskQty == 0 ? '' : data.waitingTaskQty)
                    $('#cancelledQty').html(data.cancelledQty == 0 ? '' : data.cancelledQty)
                    $('#unReadQty').html(data.unReadQty == 0 ? '' : data.unReadQty)
                    $('#requestMeetingQty').html(data.requestMeetingQty == 0 ? '' : data.requestMeetingQty)

                    createdhomepageprocesswaiting(data.waitingRecords, 'waitingRecords')
                    createdhomepageprocesswaiting(data.requestMeetingRecords, 'requestMeetingRecords')
                    createdhomepageprocesswaiting(data.cancellRecords, 'cancellRecords')
                    createdhomepageprocesswaiting(data.unReadRecords, 'unReadRecords')
                }
            })
        }
        function createdhomepageprocesswaiting(data, dom) {
            //console.log(data)
            var html = ''
            for (var i = 0; i < data.length; i++) {
                html += '<li class="tab_cont_content_ul_item">'
                if (data[i].priority == 0) {
                    html += '<span class="tab_cont_content_ul_item_first te_green">普</span>'
                }
                if (data[i].priority == 1) {
                    html += '<span class="tab_cont_content_ul_item_first jin_yellow">紧</span>'
                }
                if (data[i].priority == 2) {
                    html += '<span class="tab_cont_content_ul_item_first te_red">特</span>'
                }
                html += '<a target="'+Math.floor(Math.random()*1000)+'" href="/a0M/detail?id=' + data[i].processInstanceId + '&retURL=%2fhome%2fhome.aspx"><span title="' + data[i].name + '" class="tab_cont_content_ul_item_title" style="padding-left: 35px;">' + data[i].name + '</span></a>'
                     + '<span class="tab_cont_content_ul_item_people">' + data[i].createdByName + '</span>'
                     + '<span class="tab_cont_content_ul_item_date">' + data[i].createdOn + '</span>'
                     + '</li>'
            }
            if (html == '') {
                html = '<div class="nodata">暂无数据</div>'
            }
            $('#' + dom).html(html)
        }
        $('.tab_header_ul_item').click(function () {
            $(this).parents('.taba').find('.tab_cont_content').hide()
            $(this).parents('.taba').find('.tab_cont_content').eq($(this).index()).show()
        })
        $('.tabs_header_ul_item').click(function () {
            //console.log($(this).index())
            $(this).parents('.tabs').find('.tabs_cont_content').hide()
            $(this).parents('.tabs').find('.tabs_cont_content').eq($(this).index()).show()
        })
        //通知
        $('#reloadcontentwaiting').click(function () {
            getcontentwaiting()
            success2('刷新成功')
        })
        $('#morecontentwaiting').click(function () {
            window.open('/content/catelist.aspx?t=home&contentTypeCode=2&objectTypeCode=100202')
        })
        getcontentwaiting()
        function getcontentwaiting() {
            ajaxMethodGetData('homepage.content.newnotice.getlist', null, function (data) {
                if (data.state == 1) {
                    var html = ''
                    for (var i = 0; i < data.returnValue.contents.length; i++) {
                        var res = data.returnValue.contents[i]
                        var BusinessUnitName = res.BusinessUnitName
                        if (BusinessUnitName == null) {
                            BusinessUnitName = ''
                        }
                        html +='<li class="tab_cont_content_ul_item">'
                                                    + '<a target="'+Math.floor(Math.random()*1000)+'" href="/Portal/viewArticle.aspx?id=' + res.ContentId + '&refreshParent=1">  <span ReadStatus="' + res.ReadStatus + '" title="' + res.Title + '" class="tab_cont_content_ul_item_title"style="padding-left:5px;">' + res.Title + '</span></a>'
                                                    + ' <span class="tab_cont_content_ul_item_people">' + BusinessUnitName + '</span>'
                                                    + '    <span class="tab_cont_content_ul_item_date">' + res.CreatedOn + '</span>'
                                                    +'</li>'
                    }
                    if (html == '') {
                        html = '<div class="nodata">暂无数据</div>'
                    }
                    $('#contentwaiting').html(html)
                }
            })
        }
        //效能曝光
        $('#reloadperformance').click(function () {
            getperformance()
            success2('刷新成功')
        })
        getperformance()
        function getperformance() {
            ajaxMethodGetData('homepage.performance.employee.toplist', null, function (data) {
                var html = ''
                for (var i = 0; i < data.returnValue.leaderRecords.length; i++) {
                    var res = data.returnValue.leaderRecords[i]
                    html +='<li class="tab_cont_content_ul_item table_item">'
                         +'    <span class="tab_headers_item">'+res.FullName+'</span>'
                         +'    <span class="tab_headers_item" style="margin-left: -4px;">'+res.BusinessUnitName+'</span>'
                         +'    <span class="tab_headers_item" style="margin-left: -4px;">'+res.ExpiredWfTasks+'</span>'
                         +'    <span class="tab_headers_item" style="margin-left: -4px;">'+res.NotStartedWfTasks+'</span>'
                         +'</li>'
                }
                $('#leaderRecords').html(html)
                var html = ''
                for (var i = 0; i < data.returnValue.middleRecords.length; i++) {
                    var res = data.returnValue.middleRecords[i]
                    html += '<li class="tab_cont_content_ul_item table_item">'
                        + '    <span class="tab_headers_item">' + res.FullName + '</span>'
                        + '    <span class="tab_headers_item" style="margin-left: -4px;">' + res.BusinessUnitName + '</span>'
                        + '    <span class="tab_headers_item" style="margin-left: -4px;">' + res.ExpiredWfTasks + '</span>'
                        + '    <span class="tab_headers_item" style="margin-left: -4px;">' + res.NotStartedWfTasks + '</span>'
                        + '</li>'
                }
                $('#middleRecords').html(html)
                var html = ''
                for (var i = 0; i < data.returnValue.allRecords.length; i++) {
                    var res = data.returnValue.allRecords[i]
                    html += '<li class="tab_cont_content_ul_item table_item">'
                        + '    <span class="tab_headers_item">' + res.FullName + '</span>'
                        + '    <span class="tab_headers_item" style="margin-left: -4px;">' + res.BusinessUnitName + '</span>'
                        + '    <span class="tab_headers_item" style="margin-left: -4px;">' + res.ExpiredWfTasks + '</span>'
                        + '    <span class="tab_headers_item" style="margin-left: -4px;">' + res.NotStartedWfTasks + '</span>'
                        + '</li>'
                }
                $('#allRecords').html(html)
            })
        }
        //新闻
        gethotnews()
        $('#reloadhotnews').click(function () {
            gethotnews()
            success2('刷新成功')
        })
        $('#morenews').click(function () {
            window.open('/content/catelist.aspx?parentId=d00b816e-a006-49d1-8387-33919346e731&t=home&contentTypeCode=1&objectTypeCode=100201')
        })
        function gethotnews(){
            ajaxMethodGetData('homepage.content.hotnews.getlist', null, function (data) {
                $('#hotnews').html('')
                
                var html = ''
                for (var i = 0; i < data.returnValue.contents.length; i++) {
                    var res = data.returnValue.contents[i]
                    var CreatedOn = res.CreatedOn
                    if (CreatedOn.indexOf(' ') != '-1') {
                        CreatedOn = CreatedOn.split(' ')[0]
                    }
                    html += '<li class="tab_cont_content_ul_item">'
                                                    + '<a target="'+Math.floor(Math.random()*1000)+'" href="/Portal/viewArticle.aspx?id=' + res.ContentId + '&refreshParent=1">  <span ReadStatus="' + res.ReadStatus + '" title="' + res.Title + '" class="tab_cont_content_ul_item_title"style="padding-left: 5px;">' + res.Title + '</span></a>'
                                                    + '    <span class="tab_cont_content_ul_item_date">' + CreatedOn + '</span>'
                                                    + '</li>'

                }
                if (html == '') {
                    html = '<div class="nodata">暂无数据</div>'
                }
                $('#hotnews').html(html)
            })
        }
        getnews()
        function getnews() {
            ajaxMethodGetData('homepage.news.picture.getlist', null, function (data) {
                $('.new_swiper_ul_item').remove()
                for (var i = 0; i < data.returnValue.contents.length; i++) {
                    var res = data.returnValue.contents[i]
                    $('.new_swiper_ul').append('<div title="' + res.Title + '" class="new_swiper_ul_item swiper-slide"><a target="'+Math.floor(Math.random()*1000)+'" href="/Portal/viewArticle.aspx?id=' + res.ContentId + '&refreshParent=1">'
                                               + '    <p  class="new_swiper_ul_item_title">' + res.Title
                                               + '    <p class="new_swiper_ul_item_date ">' + res.CreatedOn + '</p>'
                                               + '    <div class="new_swiper_ul_item_img">'
                                               + '        <img src="/ShowImageHandler.ashx?id=' + res.ContentId + '" alt="">'
                                               + '    </div>'
                                               + '</a></div>')
                }


                var swiper = new Swiper('.swiper-container', {
                    slidesPerView: 3,
                    loopFillGroupWithBlank: true,
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },
                    autoplay: 5000,
                    loop: true
                });
                $('.swiper-button-next').click(function () {
                    swiper.swipeNext()
                })
                $('.swiper-button-prev').click(function () {
                    swiper.swipePrev()
                })
            })

        }

        //日历
        //getcalendar()
        //function getcalendar() {
        //    ajaxMethodGetData('calendar.getlist', null, function (data) {

        //    })

        //}
        //日程
        getcalendarleader()
        function getcalendarleader() {
            ajaxMethodGetData('homepage.calendar.leader.search', null, function (data) {

            })
        }

        //日程
        getmeeting()
        function getmeeting() {
            ajaxMethodGetData('homepage.my.meeting', null, function (data) {

            })
        }
        //任务
        gettask()
        function gettask() {
            ajaxMethodGetData('activity.task.myweek.search', null, function (data) {


            })

        }
        //值班信息
        $('#reloaddutyshift').click(function () {
            getdutyshift()
            success2('刷新成功')
        })
        getdutyshift()
        function getdutyshift() {
            ajaxMethodGetData('dutyshift.today.getlist', null, function (data) {
                var html = ''
                var res = data.data.Table
                if (res) {
                    for (var i = 0; i < res.length; i++) {
                        html += '<li class="tab_cont_content_ul_item table_item">'
                             + '    <span class="tab_headers_item" style="margin-left: 10px;">' + res[i].EmployeeIdName + '</span>'
                             + '    <span class="tab_headers_item" style="margin-left: 35px;">' + res[i].WorkShiftIdName + '</span>'
                             + '    <span class="tab_headers_item" style="margin-left: 35px;">' + res[i].WorkDay + '</span>'
                             + '</li>'
                    }
                }
                else {
                    html = '<div class="nodata">暂无数据</div>'
                }
                $('#dutyshift').html(html)
            })
        }
        //常用链接
        getquicklink()
        function getquicklink() {
            ajaxMethodGetData('homepage.quicklink.getlist', null, function (data) {
                for (var i = 0; i < data.returnValue.QuickLinkRecords.length; i++) {
                    var res = data.returnValue.QuickLinkRecords[i]
                    if (res.ImageUrl && res.ImageUrl !== '') {
                        $('#quicklink').append('<a target="'+Math.floor(Math.random()*1000)+'" href="' + res.LinkUrl + '">'
                            + '<li class="tab_cont_content_ul_item">'
                            + '<img src="' + res.ImageUrl + '"/>'
                            + '<span class="tab_right_cont_content_ul_item_title imgtitle">' + res.Name + '</span>'
                            + '</li>'
                            + '</a>')
                    } else {
                        $('#quicklink').append('<a target="'+Math.floor(Math.random()*1000)+'" href="' + res.LinkUrl + '">'
                            +'<li class="tab_cont_content_ul_item">'
                            + '<span class="tab_right_cont_content_ul_item_title">' + res.Name + '</span>'
                            + '</li>'
                            + '</a>')
                    }
                    
                }
            })
        }
        //问卷
        getunresponse()
        function getunresponse() {
            ajaxMethodGetData('survey.unresponse.getlist', null, function (data) {
                $('#unresponse').html('')
                var html = ''

                for (var i = 0; i < data.actions[0].returnValue.length; i++) {
                    var res = data.actions[0].returnValue[i]
                    var CreatedOn = res.CreatedOn
                    if (CreatedOn.indexOf(' ') != '-1') {
                        CreatedOn = CreatedOn.split(' ')[0]
                    }
                   html +='<li class="tab_cont_content_ul_item">'
                                                    + '<a target="' + Math.floor(Math.random() * 1000) + '" href="/survey/surveyScore.html?surveyId=' + res.SurveyId + '&readonly=0&mode=1&conid="' + res.ContactId + '>  <span title="' + res.Name + '" class="tab_cont_content_ul_item_title"style="padding-left: 5px;">' + res.Name + '</span></a>'
                                                    + '    <span class="tab_cont_content_ul_item_date">' + CreatedOn + '</span>'
                                                    + '</li>'
                }
                if (html == '') {
                    html = '<div class="nodata">暂无数据</div>'
                }
                $('#unresponse').html(html)
            })
        }
        $('#reloadunresponse').click(function () {
            getunresponse()
            success2('刷新成功')
        })
        $('#moreunresponse').click(function () {
            window.open('/survey/mysvylst.aspx?t=home')
        })
        //考评绩效
        getevaluator()
        function getevaluator() {
            ajaxMethodGetData('evaluation.evaluator.task.getlist', { StatusCode:0}, function (data) {
                $('#evaluator').html('')
                var html = ''
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    var CreatedOn = res.CreatedOn
                    if (CreatedOn.indexOf(' ') != '-1') {
                        CreatedOn = CreatedOn.split(' ')[0]
                    }
                    var Name = '[' + res.DimensionCode + ']'+' - ' + res.EmployeeIdName + '/' + ' - '+res.EvaluationFormIdName+'/'+res.EvaluationIdName
                    var href = '/eval/evalTest.aspx?EvaluationId=' + res.EvaluationId
                        + '&mode=1&StatusCode=0&ObjectTypeCode=3002'
                        + '0&EvaluationFormId=' + res.EvaluationFormId
                        + '&EmployeeId=' + res.EmployeeId
                        + '&EvaluatorId=' + res.EvaluatorId
                        + '&DeptId=' + res.DeptId
                        + '&EvalTypeCode=' + res.EvaluatTypeCode
                        + '&dimensionCode=' + res.DimensionCode
                        + '&EmployeeIdName=' + res.EmployeeIdName 
                        + '&DeptIdName=' + res.DeptIdName
                    html +='<li class="tab_cont_content_ul_item">'
                                                    + '<a target="' + Math.floor(Math.random() * 1000) + '" href="' + href + '">  <span title="' + Name + '" class="tab_cont_content_ul_item_title"style="padding-left: 5px;">' + Name + '</span></a>'
                                                    + '    <span class="tab_cont_content_ul_item_date">' + CreatedOn + '</span>'
                                                    + '</li>'
                }
                if (html == '') {
                    html = '<div class="nodata">暂无数据</div>'
                }
                $('#evaluator').html(html)
            })
        }
        $('#relodaevaluator').click(function () {
            getevaluator()
            success2('刷新成功')
        })
        $('#moreevaluator').click(function () {
            window.open('/eval/evalTestlst.aspx?t=home')
        })
    </script>
    <script>
        window.onload = function () {
            ajaxMethodGetData('calendar.soon.start.getlist', null, function (data) {
                if (data) {
                    var resoon = data.data.Table
                    console.log(resoon)
                    layer.ready(function(){ 
                        layer.open({
                            type: 1,
                            title: '今日日程',
                            skin: 'layui-layer-rim', //加上边框
                            area: ['437px', '300px'], //宽高
                            content: '<div class="tabs_content" style="padding: 15px;"><div class="tab_headers" style="padding: 0; border: 1px solid #ccc; width:100%;cursor: unset;"><span class="tab_headers_item tab_headers_item_header" style="width: 49%;">开始时间</span><span class="tab_headers_item tab_headers_item_header" style="width: 49%;">主题</span></div><ul id="soon" class="table" style="list-style: none;width: 100%; font-size: 14px; border: 1px solid #ccc;border-bottom:0;"></ul><div class="clear"></div></div>',
                            success: function (layero) {
                                var html = ''
                                if (resoon && resoon.length>0) {
                                    for (var i = 0; i < resoon.length; i++) {
                                        html += '<li style="border-bottom:1px solid #ccc">'
                                             + '    <span class="tab_headers_item" style="width: 49%;">' + resoon[i].startTime + '</span>'
                                             + '    <span class="tab_headers_item" style="width: 49%;">' + resoon[i].Subject + '</span>'
                                             + '</li>'
                                    }
                                }
                                else {
                                    html = '<div class="nodata" style="width:95%;">暂无数据</div>'
                                }
                                $('#soon').html(html)
                            }
                        });
                    })
                }
            })
            ajaxMethodGetData('task.remind.my.getlist', null, function (data) {
                if (data&&data.data.length>0) {
                    var url = '/alert/cntrt/contract_remind_notice.html';
                    $('#iframe').show().attr('src', url).height(365).css({ "right": "0px", "bottom": "0px", "background-color": "white", "width": "450px", "position": "fixed", "left": "auto", "top": "auto", "border": "1px solid #ddd", "border-radius": "4px", })
                }
            })
        }
    </script>
    <iframe id="iframe" frameborder="0"></iframe>
    <div class="popup-mask"></div>
</body>
</html>
