<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contentsrc.aspx.cs" Inherits="Supermore.content.contentsrc" %>


<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>首页 ~ 凤凰协同办公系统</title>
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
    <link href="/css/information.css" rel="stylesheet" />
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <%--<link href="/css/new/swiper.min.css" rel="stylesheet" />--%>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <%--<script src="/js/swiper.min.js"></script>--%>

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
    <%--<link rel="stylesheet" type="text/css" href="/css/normalize.css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="/css/htmleaf-demo.css">--%>
    <%-- <link rel="stylesheet" href="/css/pageSwitch.min.css">
    <script src="/js/pageSwitch.min.js"></script>--%>
    <%--<script src="/js/jquery.mCustomScrollbar.concat.min.js"></script>--%>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <script src="/js/unslider.min.js"></script>
    <link href="/template/css/header.css" rel="stylesheet" />

    <style>
        #contentsearch{
            line-height:30px;
        }
        body{
            overflow:hidden;
        }
        .information_cont{
            padding:0;
        }
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
        .information_cont-item{
            float:left;
            margin:1%;
            background-color:white;
            padding:0;
            box-sizing:border-box;
            border:1px solid #dedede;
        }
        .information-body{
            height:330px;
            overflow:hidden;
        }
        .information-header{
            height:45px;
            line-height:45px;
            color: rgb(16, 138, 249);
            border-bottom:1px solid #dedede;
            padding:0 10px;
            background-color:#e8f4fc;
        }
        .information_second_left_header_right span:hover{
            color:#108def;
        }
        .information-header>span {
            font-size:16px;
            font-weight:700;
        }
        .ct{
            width:88%;
            margin-left:1%;
            overflow-y:auto;
            background-color:white;
        }
        .information-body li{
            height:40px;
            line-height:40px;
            font-size:16px;
            padding:0 10px;
            cursor:pointer;
        }
        .information-body li:hover{
            color: rgb(16, 138, 249);
            background-color:rgb(231, 243, 255);
            
        }
        .item-name{
            width:70%;
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
            display:inline-block;
            color:#333;
            text-decoration:none;

        }
        .item-time{
            overflow:hidden;
            display:inline-block;
            float:right;
        }
        .information_second_left_header_right i,.information_second_left_header_right span{
            margin-left:5px;
            cursor:pointer;
        }
        .icon-bianji{
            padding-right:0;
        }
        .left-table{
            border-right:1px solid #dedede;
            overflow-y:auto;
            width:10%;
        }
        .left-table li.active{
            background-color: #e1f1fe;
            border-left: 4px solid #108af9;
            border-bottom:0;
        }
        .information_header{
            padding-left:20px;
        }
        .information_header_center{
            width:100%;
            text-align:center;
        }
        .information_header_center_input{
            width:500px;
        }
        .icon-sousuo1{
            left:auto;
            margin-left:10px;
        }
        #edit{
            padding:5px 10px;
            float:right;
            border:1px solid #dedede;
            border-radius:4px;
            color:#333;
            cursor:pointer;
            font-size:14px;

        }
        #edit:hover{
            background-color:#f2f2f2;
        }
        .editbtns{
            float:right;
            display:none;
        }
        .editbtns>div{
            padding:5px 10px;
            float:left;
            border:1px solid #dedede;
            border-radius:4px;
            color:#333;
            cursor:pointer;
            margin-left:10px;
            font-size:14px;
        }
        .editbtns>div:hover{
            background-color:#f2f2f2;
        }
        .popup-mask {
            background:url(/img/bgOverlayDialogBackground.png);
            background-color:transparent;
            width:100%;
            height:100%;
            position:fixed;
            top:0;
            left:0;
            z-index:999;
            display:none;
        }
        #iframe {
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: none;
            height:620px;
            border:0;
            z-index:9999;

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
                                <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-
skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <script type="text/javascript">
                                function onLoadSelector() { /* CustomReportSelector.java injects a call to nonexistent 
onLoadSelector see Bug W-1599971 */ }
                            </script>
                             <div class="">
                                <%--<div class="nav_header">
                                    <i class="iconfont icon-gantanhao" style="color: #fff;"></i>
                                </div>--%>
                                <ul class="left-table">
                                    <li class="nav_ul_item">
                                        <a href="/home/homelight.aspx">
                                            <span class="nav_ul_item_img">
                                                <img src="/img/Personal_a.png" alt="Alternate Text" />
                                            </span>
                                            <span class="nav_ul_item_title">个人工作台</span></a>
                                    </li>
                                    <li class="nav_ul_item nav_active">
                                        <a href="/content/contentsrc.aspx">
                                            <span class="nav_ul_item_img">
                                                <img src="/img/hospital_c.png" alt="Alternate Text" />
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
                                    <i class="iconfont icon-gantanhao" style="color: #fff;"></i>
                                </div>
                                <ul class="nav_ul">
                                    <li class="nav_ul_item">
                                        <a href="/home/homelight.aspx" class="nav_ul_item_a"><img src="/img/Personal_c.png" alt="Alternate Text" /></a>
                                    </li>
                                    <li class="nav_ul_item nav_active">
                                        <a href="/content/contentsrc.aspx" class="nav_ul_item_a"><img src="/img/hospital_c.png" alt="Alternate Text" /></a>
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

                            <%--content start--%>
                            <div class="ct">
                                <div class="information_header">
                                    <%--<div class="information_header_left">
                                        <span class="information_header_left_next">信息浏览</span>
                                    </div>--%>
                                    <div class="information_header_center">
                                        <i class="iconfont icon-sousuo1"></i>
                                        <input type="type" class="information_header_center_input" value="" id="contentsearch" />
                                        <div class="editbtns">
                                            <div class="quiteedit">返回</div>
                                            <div class="newblock">新建</div>
                                            <div class="sortblock">排序</div>
                                        </div>
                                        <div id="edit">编辑页面</div>

                                    </div>
                                    <%--<div class="information_header_right">
                                        <i class="iconfont icon-buju"></i>
                                        <span class="information_header_right_text">编辑布局</span>
                                    </div>--%>
                                    <div class="clear"></div>
                                </div>
                               <div class="information_cont"></div>


                            <script>
                                $('.information_second_right_header_ul_item').click(function () {
                                    $('.information_second_right_header_ul_item').removeClass('active');
                                    $(this).addClass('active');
                                    $('.information_second_right_cont_content').hide();
                                    $('.information_second_right_cont_content').eq($(this).index()).show();
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
                                $(document).ready(function (e) {

                                    $('#b03').unslider({

                                        dots: true

                                    });

                                });                                $('.nav_ul_item').mouseover(function () {
                                    if ($(this).index() == 0) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Personal_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/Personal_b.png');
                                    } else if ($(this).index() == 1) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/hospital_c.png');
                                        $(this).children('a').children('.nav_ul_item_title').css('color', '#fff')
                                    } else if ($(this).index() == 2) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/leadership_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/leadership_b.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/wfperfdashbaord_b.png');
                                        $(this).children('a').children('img').attr('src', '/img/wfperfdashbaord_b.png');
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
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/Personal_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/Personal_a.png');
                                    } else if ($(this).index() == 1) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/hospital_c.png');
                                        $(this).children('a').children('img').attr('src', '/img/hospital_c.png');
                                    } else if ($(this).index() == 2) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/leadership_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/leadership_a.png');
                                    }
                                    else if ($(this).index() == 3) {
                                        $(this).children('a').children('.nav_ul_item_img').children('img').attr('src', '/img/wfperfdashbaord_a.png');
                                        $(this).children('a').children('img').attr('src', '/img/wfperfdashbaord_a.png');
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
                                //$("#container").PageSwitch({
                                //    direction: 'horizontal',
                                //    easing: 'ease-in',
                                //    duration: 1000,
                                //    autoPlay: true,
                                //    loop: 'false'
                                //});
                                //var swiper = new Swiper('.swiper-container', {
                                //    slidesPerView: 1,
                                //    spaceBetween: 30,
                                //    //loop: true,
                                //    pagination: {
                                //        el: '.swiper-pagination',
                                //        clickable: true,
                                //    },

                                //});


                                //$(window).load(function () {
                                //    $(".information_second_right_header_ul").mCustomScrollbar({
                                //        scrollButtons: {
                                //            enable: false,//是否添加 滚动条两端按钮支持 值:true,false
                                //            scrollType: "continuous",//滚动按钮滚动类型 值:”continuous”(当你点击滚动控制按钮时断断续续滚动) “pixels”(根据每次点击的像素数来滚动) 
                                //            scrollSpeed: 50,//设置点击滚动按钮时候的滚动速度(默认 20)
                                //            scrollAmount: 60//设置点击滚动按钮时候每次滚动的数值 像素单位 默认 40像素
                                //        },
                                //        horizontalScroll: false,//是否创建一个水平滚动条 默认是垂直滚动条
                                //        set_width: false,//：设置你内容的宽度 值可以是像素或者百分比
                                //        set_height: false,//：设置你内容的高度 值可以是像素或者百分比
                                //        mouseWheel: true,//鼠标滚动的支持 值为:true.false
                                //        //mouseWheelPixels:10,//：鼠标滚动中滚动的像素数目(step) 值为以像素为单位的数值
                                //        callbacks: {
                                //            onScrollStart: function () {//使用自定义的回调函数在滚动时间开始的时候执行

                                //            },
                                //            onScroll: function () {//自定义回调函数在滚动中执行 

                                //            },
                                //            onTotalScroll: function () {//当滚动到底部的时候调用这个自定义回调函数

                                //            },
                                //            onTotalScrollBack: function () {//当滚动到顶部的时候调用这个自定义回调函数

                                //            },
                                //            onTotalScrollOffset: 10,//设置到达顶部或者底部的偏移量 像素单位                     

                                //            whileScrolling: function () {//当用户正在滚动的时候执行这个自定义回调函数

                                //            },
                                //            whileScrollingInterval: 10,//设置调用 whileScrolling 回调函数的时间间隔 毫秒单位
                                //        }
                                //    });
                                //});
                            </script>


                            <%--content end--%>



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
        <%--<cc1:PageFooter ID="SiteFooter1" runat="server" />
        <div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>--%>
    </div>
    <iframe frameborder="0" src="" id="iframe"></iframe>
    <div class="popup-mask"></div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script src="/js/CommonUtils.js"></script>
    <script src="/js/alert.js"></script>
    <script>
        var type = getQueryString('type')
        if(type==1){
            $('#edit').show()
        } else {
            $('#edit').hide()
        }
        $('.ct').height($(window).height() - 120)
        $('.left-table').height($(window).height() - 120)
        getpage()
        function getpage() {
            ajaxMethodGetData('page.getlist', null, function (data) {
                $('.left-table li').remove()
                $('.left-table').append('<li class="" pageid="unread" id="unread">'
                                   + '    <a>'
                                   + '        <span class="">未读通知</span></a>'
                                   + '</li>')
                for (var i = 0; i < data.rows.length; i++) {
                    var res = data.rows[i]
                    $('.left-table').append('<li class="" pageid="' + res.ContentPageId + '">'
                                    +'    <a>'
                                    + '        <span class="">' + res.Name + '</span></a>'
                                    +'</li>')
                }
                var pageid = getQueryString('pageId')
                if (pageid) {
                    $('.left-table li').each(function () {
                        if ($(this).attr('pageid') == pageid) {
                            $(this).addClass('active')
                        }
                    })
                    getblock(pageid)
                } else {
                    $('.left-table li').eq(0).addClass('active')
                    getblock($('.left-table li').eq(0).attr('pageid'))
                }
                

                $('.left-table li').click(function () {
                    $(this).addClass('active')
                    $(this).siblings().removeClass('active')
                    var id = $(this).attr('pageid')
                    getblock(id)
                })
            })
        }
        $('#unread').click(function () {
            ajaxMethodGetData('', {}, function (data) {

            })
        })
        function getblock(id) {
            if (id == 'unread') {
                location.href = '/content/contentsrc_unread.aspx'
            }
            else{
                ajaxMethodGetData('page.block.getlist', { pageId: id }, function (data) {
                    $('.information_cont-item').remove()
                    for (var i = 0; i < data.blocks.length; i++) {
                        var res = data.blocks[i]
                        $('.information_cont').append('<div blocknumber="' + i + '" blockid="' + res.id + '" class="information_cont-item nodata" style="width:48%;">'
                            + '<div class ="information-header"><span>'
                            + res.name
                            + '</span><li class="information_second_left_header_right">'
                            + '    <i class="iconfont icon-shuaxin" style="padding-right: 5px;"></i>'
                            + '    <span blockid="' + res.id + '" blockname="' + res.name + '" class="morelist">更多</span>'
                            + '    <span blockid="' + res.id + '" blockname="' + res.name + '" class="editblock">编辑</span>'
                            + '    <span blockid="' + res.id + '" blockname="' + res.name + '" class="deleteblock">删除</span>'
                            + '</li>'
                            + '</div>'
                            + '<div class ="information-body">'
                            + '<ul></ul>'
                            + '</div>'
                            + '</div>')
                    }
                    $('.morelist').click(function () {
                        var blockname = $(this).attr('blockname')
                        var blockid = $(this).attr('blockid')
                        var pageName = $('.left-table li.active span').html()
                        window.location.href = '/content/contentsrc_result.aspx?t=PortalHome&blockname=' + blockname + '&blockid=' + blockid + '&pageName=' + pageName
                    })
                    $('.editblock').click(function () {
                        var blockid = $(this).attr('blockid')
                        $('#iframe').attr('src', '/alert/content/newblock.html?id=' + blockid).height(640).css('margin-top', '-330px').show()
                        $('.popup-mask').show()
                    })
                    $('.deleteblock').click(function () {
                        var blockid = $(this).attr('blockid')
                        if (confirm('确定要删除吗？')) {
                            ajaxMethodGetData('entity.delete', { id: blockid, ObjTypeCode: 100212 }, function (data) {
                                getblock(id)
                            })
                        }
                    })
                    if ($('.editbtns').css('display') == 'block') {
                        $('.editblock').show()
                        $('.deleteblock').show()
                    } else {
                        $('.editblock').hide()
                        $('.deleteblock').hide()
                    }
                    blockcontentgetlist()
                })
            }

        }
        
        function blockcontentgetlist() {
            $('.nodata').each(function (index) {
                if (index < 4) {
                    var that = $(this)
                    getlist(that)
                }
            })
            $(document).off()
            $('.ct').scroll(function () {
                console.log(1)
                $('.nodata').each(function () {
                    if ($(this).hasClass('nodata')) {
                        var that = this
                        if ($('.ct').scrollTop() + 400 > $(this).offset().top) {
                            getlist(that)
                        }
                    }
                    
                })
            })
        }
        function getlist(that) {
            $(that).removeClass('nodata')
            var blockId = $(that).attr('blockid')
            ajaxMethodGetData('page.block.content.getlist', { blockId: blockId }, function (data) {
                for (var i = 0; i < data.contents.length; i++) {
                    var res = data.contents[i]
                    $(that).find('ul').append('<li><a target="' + res.Title + '" href="/Portal/viewArticle.aspx?id=' + res.ContentId + '" class="item-name">' + res.Title + '</a><span class="item-time">' + res.CreatedOn.split('T')[0] + '</span></li>')
                }
            })
        }
        $('.icon-shuaxin').click(function () {
            var that = $(this).parents('.information_cont-item')

            var blockId = $(this).parents('.information_cont-item').attr('blockid')
            $(this).parents('.information_cont-item').find('.information-body li').remove()
            ajaxMethodGetData('page.block.content.getlist', { blockId: blockId }, function (data) {
                for (var i = 0; i < data.contents.length; i++) {
                    var res = data.contents[i]
                    $(that).find('ul').append('<li><a title="' + res.Title + '" target="' + res.Title + '" href="/Portal/viewArticle.aspx?id=' + res.ContentId + '" class="item-name">' + res.Title + '</a><span class="item-time">' + res.CreatedOn.split('T')[0] + '</span></li>')
                }
            })
        })
        $('#contentsearch').change(function () {
            var search = $('#contentsearch').val()
            window.open('/content/contentsrc_result.aspx?search=' + search)
            
        })
        $('#edit').click(function () {
            $(this).hide()
            $('.editblock').show()
            $('.editbtns').show()
            $('.deleteblock').show()

        })
        $('.quiteedit').click(function () {
            $('#edit').show()
            $('.editbtns').hide()
            $('.editblock').hide()
            $('.deleteblock').hide()

        })
        $('.newblock').click(function () {
            $('#iframe').attr('src', '/alert/content/newblock.html').height(640).css('margin-top', '-330px').show()
            $('.popup-mask').show()
        })
        $('.sortblock').click(function () {
            $('#iframe').attr('src', '/alert/content/sort.html').height(460).css('margin-top','-230px').show()
            $('.popup-mask').show()
        })
    </script>
</body>
</html>
