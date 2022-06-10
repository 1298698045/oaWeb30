<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contentdetail.aspx.cs" Inherits="Supermore.content.contentdetail" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>详情 ~ 凤凰协同办公系统</title>
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
    <link href="/css/contentview.css" rel="stylesheet" />
    <link href="/css/dashboard_icon.css" rel="stylesheet" />
    <link href="/css/new/swiper.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/new/all.css">
    <link rel="stylesheet" href="/css/new/header.css">
    <link rel="stylesheet" href="/css/new/iconfont.css">
    <link rel="stylesheet" href="/css/new/content_header.css">
    <link rel="stylesheet" href="/css/contentdetail.css">

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/swiper.min.js"></script>

    <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DashboardViewTableHome.js"></script>
    <script src="/jslibrary/sfdc/HomeCalendar.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410364524000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": false }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": false }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
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
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/jq.js"></script>
    <script src="/js/Business.js"></script>
    <script src="/js/DashboardViewHome.js"></script>
    <link href="/content/video/zxf_page.css" rel="stylesheet" />
    <script src="/content/video/zxf_page.js"></script>
    <style>
        body {
            margin: 0!important;
        }

        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
    </style>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.198', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=/home/home.jsp');</script>
    <script src="/survey/js/tools.js"></script>
    <script src="/content/contentview.js"></script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif homeTab homepage ext-ie ext-ie8 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload=""
    onpageshow="event.persisted && (function(){var allInstances = CKEDITOR.instances, editor, doc;for ( var i in allInstances ){	editor = allInstances[ i ];	doc = editor.document;	if ( doc )	{		doc.$.designMode = &quot;off&quot;;		doc.$.designMode = &quot;on&quot;;	}}})();">
    <!-- Main Body Starts Here -->
    <script type="text/javascript">
        var secondsLeftValue = 7196, secondsPopupValue = 7166, lastPageActivityTime = (new Date).getTime(), forceLogout = false;
        function startSessionTimer() { schedulePopup(7166) }
        function schedulePopup(a) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); timeoutUniqueId = setTimeout(alertTimeout, 1E3 * a) }
        function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null;
        function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } }
        function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() }
        function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.aspx?sfdc.setJsDomain=1", "", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus }
        function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&amp;startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) }
        function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }
    </script>
    <a class="navSkipLink zen-skipLink zen-assistiveText" href="#skiplink">跳到主内容</a>
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" style="background-color: rgb(244, 246, 248);">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content table -->
                        <a name="skiplink">
                            <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a>

                        <div class="row region-header" id="wrap">
                            <div class="flexipageComponent">
                                <header class="forceHighlightsPanel">
                                    <div class="slds-page-header slds-page-header_record-home s1FixedTop forceHighlightsStencilDesktop forceRecordLayout">
                                        <div class="primaryFieldRow" style="transform: translate3d(0px, 0px, 0px);">
                                            <div class="slds-col slds-has-flexi-truncate slds-media--center" style="float: left;">
                                                <div class="profilePicWrapper slds-media slds-no-space" style="transform: scale3d(1, 1, 1) translate3d(0px, 0px, 0px);float: left;">
                                                    <div class="slds-media__figure slds-icon forceEntityIcon" style="background-color: #B7A752">
                                                        <span class="uiImage">
                                                            <img src="/img/header.png" alt="任务" title="任务">
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="slds-media__body" style="float: right;">
                                                    <span class="entityNameTitle" style="opacity: 1; visibility: visible;">
                                                        <ol class="slds-breadcrumb slds-line-height_reset">
                                                            <li class="slds-breadcrumb__item">
                                                                <span>信息管理</span>
                                                            </li>
                                                        </ol>
                                                    </span>
                                                    <h1 class="slds-page-header__title slds-m-right--small slds-truncate slds-align-middle" title="软件产品需求">
                                                        <span class="uiOutputText">我院援疆医生李颖在“不忘初心 牢记使命—我心中的北京援疆精神”演讲比赛中荣获一等奖</span>
                                                    </h1>
                                                </div>
                                            </div>
                                            <div class="allBtn" style="float: right;">
                                                <ul class="allBtn_ul" style="float: left;">
                                                    <li class="allBtn_ul_li">
                                                        <button type="button" class="btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="border-right: 0; border-radius: .25rem 0 0 .25rem;">
                                                            编辑</button>
                                                    </li>
                                                    <li class="allBtn_ul_li" id="Photo">
                                                        <button type="button" class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate" style="border-right: 0; border-radius: 0;">
                                                            删除</button>
                                                    </li>
                                                    <li class="allBtn_ul_li" onclick="showMenuItem('/emp/chgfrm/DeptChange.aspx?1=1','EmpDeptChange','部门变动',680,460);return false;">
                                                        <button type="button" class="btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="border-right: 0; border-radius: 0;">
                                                            预览</button>
                                                    </li>
                                                    <li class="allBtn_ul_li" onclick="showMenuItem('/emp/chgfrm/ProfessionTitleChange.aspx?1=1','ProfessionTitleChange','职称晋升',680,460);return false;">
                                                        <button type="button" class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate" style="border-right: 0; border-radius: 0;">
                                                            审批</button>
                                                    </li>
                                                    <li class="allBtn_ul_li" style="margin-top: 1px">
                                                        <button id="list" type="button" class="btns btn-default Btn btns  slds-button slds-button--neutral slds-truncate" style="background: #fff; border-radius: 0 .25rem .25rem 0; color: #ccc; padding: 0px 10px; font-size: 13px; margin: 0; font-weight: inherit;"><i class="iconfont icon-xiajiantou" style="font-size: 12px;"></i></button>
                                                    </li>
                                                </ul>
                                                <div style="float: right;">
                                                    <button type="button" class="btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate">
                                                            邀请查看人员</button>
                                                    <button type="button" class="btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate">
                                                            消息提醒</button>
                                                </div>
                                            </div>
                                            <ul class="remarkList" id="List" style="display: none;">
                                                <li id="menu_salaryset"><a>审批</a></li>
                                                <li id="menu_deptchage"><a>审批</a></li>
                                                <li id="menu_quit"><a>审批</a></li>
                                                <li id="menu_retire"><a>审批</a></li>
                                                <li id="menu_transferout"><a>审批</a></li>
                                                <li id="menu_endprobation"><a>审批</a></li>
                                            </ul>
                                            
                                        </div>
                                    </div>
                                </header>
                            </div>
                        </div>
                        <div class="Content">
                            <div class="content_left content">
                                <div class="content_header">
                                    <ul class="content_header_ul">
                                        <li class="content_header_ul_item content_header_ul_item_active">
                                            <a href="#" class="content_header_ul_item_a">正文</a>
                                        </li>
                                        <li class="content_header_ul_item">
                                            <a href="#" class="content_header_ul_item_a">详细信息</a>
                                        </li>
                                        <li class="content_header_ul_item">
                                            <a href="#" class="content_header_ul_item_a">评论(12)</a>
                                        </li>
                                        <li class="content_header_ul_item">
                                            <a href="#" class="content_header_ul_item_a">人员</a>
                                        </li>
                                        <li class="clear"></li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="Content_cont" style="display: block;">
                                        <div class="Content_cont_detail">
                                            <p class="Content_cont_detail_p">
                                                5月10日，宣武医院举办了“以拼搏为美，向行动致敬”主题宣讲暨表彰大会。院党委书记张国君、副院长吴英锋、院党委副书记李嘉、张维等出席大会。会议由张维主持。
                                                <br />
                                                <br />
                                                近年来，宣医人在医疗、护理、教学、科研、管理、后勤等方面兢兢业业、开拓创新，取得了优异的成绩，涌现出众多先进典型。首都劳动奖章获得者、“全国十大最美医生”华扬主任；“北京榜样”、急诊科“天使在身边”志愿者代表陶雪莹和梁琦爽；52岁援藏专家、拉萨市“2017年度卫生援藏先进工作者”马淑；科研创新代表、北京市三八红旗奖章获得者王蓉；我院“十佳青年”、癫痫患儿的知心姐姐霍光研等人作为典型代表，成为此次主题宣讲大会的宣讲对象。
                                            </p>
                                            <img src="/img/picture.png" class="Content_cont_detail_img" alt="Alternate Text" />
                                            <p class="Content_cont_detail_p">
                                                5月10日，宣武医院举办了“以拼搏为美，向行动致敬”主题宣讲暨表彰大会。院党委书记张国君、副院长吴英锋、院党委副书记李嘉、张维等出席大会。会议由张维主持。
                                                <br />
                                                <br />
                                                近年来，宣医人在医疗、护理、教学、科研、管理、后勤等方面兢兢业业、开拓创新，取得了优异的成绩，涌现出众多先进典型。首都劳动奖章获得者、“全国十大最美医生”华扬主任；“北京榜样”、急诊科“天使在身边”志愿者代表陶雪莹和梁琦爽；52岁援藏专家、拉萨市“2017年度卫生援藏先进工作者”马淑；科研创新代表、北京市三八红旗奖章获得者王蓉；我院“十佳青年”、癫痫患儿的知心姐姐霍光研等人作为典型代表，成为此次主题宣讲大会的宣讲对象。
                                            </p>
                                        </div>
                                    </div>
                                    <div class="Content_cont">
                                        <div>
                                            <div class="slds-gutters_small">
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem xinxi_left">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>标题</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">我院援疆医生李颖在“不忘初心 牢记使命—我心中的北京援疆精神”演讲比赛中荣获一等奖
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                            <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem  xinxi_right">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>发布人</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="photoContainer">
                                                                    <span>
                                                                        <img src="/img/Avatar.png" style="width: 1.5rem; height: 1.5rem;" alt="">
                                                                    </span>
                                                                </span>
                                                                <span class="forceOutputLookup">张丽萍
                                                                </span>
                                                                <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                                    <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="slds-gutters_small">
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem  xinxi_left">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>所属栏目</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">院刊专栏
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                            <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem  xinxi_right">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>发布部门</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">信息中心
                                                                </span>
                                                                <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                                    <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="slds-gutters_small">
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem  xinxi_left">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>置顶信息</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">
                                                                    <input type="checkbox" name="name" value=" " />
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                            <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem  xinxi_right">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>置顶信息</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">
                                                                    <input type="checkbox" name="name" value=" " />
                                                                </span>
                                                                <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                                    <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="slds-gutters_small">
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem xinxi_left">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>状态</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">
                                                                   审核通过
                                                                </span>
                                                            </span>
                                                        </span>
                                                        <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                            <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem xinxi_right">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>置顶截止</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="">
                                                                    2019-05-09
                                                                </span>
                                                                <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                                    <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <div class="xinxi_title">
                                            系统信息
                                        </div>
                                        <div>
                                            <div class="slds-gutters_small">
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem xinxi_left">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>发布人</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="photoContainer">
                                                                    <span>
                                                                        <img src="/img/Avatar.png" style="width: 1.5rem; height: 1.5rem;" alt="">
                                                                    </span>
                                                                </span>
                                                                <span class="forceOutputLookup">张丽萍
                                                                </span>
                                                                <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                                    <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="slds-col slds-has-flexi-truncate forcePageBlockItem  xinxi_right">
                                                    <div class="slds-form-element">
                                                        <span class="slds-form-element__label">
                                                            <span>发布人</span>
                                                        </span>
                                                        <span class="slds-form-element__control">
                                                            <span class="slds-form-element__static slds-truncate">
                                                                <span class="photoContainer">
                                                                    <span>
                                                                        <img src="/img/Avatar.png" style="width: 1.5rem; height: 1.5rem;" alt="">
                                                                    </span>
                                                                </span>
                                                                <span class="forceOutputLookup">张丽萍
                                                                </span>
                                                                <button class="xinxi_button btns btn-default Btn hove peoples  slds-button slds-button--neutral slds-truncate" style="padding: 6px;float: right;">
                                                                    <i class="iconfont icon-iconfontqianbipencil82"></i>
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="Content_cont">
                                        <ul class="Content_cont_ul">
                                            <li class="comment_list_cont_ul_item">
                                                <div class="comment_list_cont_ul_item_img">
                                                    <img src="/img/Avatar.png" alt="Alternate Text">
                                                </div>
                                                <div class="comment_list_cont_ul_item_text">
                                                    <p class="comment_list_cont_ul_item_text_title">
                                                        <span class="comment_list_cont_ul_item_text_title_people">卫辉</span>
                                                        <div class="comment_list_cont_ul_item_text_title_div">
                                                            <span class="delete">删除</span>
                                                            &nbsp;&nbsp;|&nbsp;&nbsp;
                                                            <span class="comment_list_cont_ul_item_text_cancel_zan">
                                                                <span class="comment_list_cont_ul_item_text_cancel_zan_num">320</span>
                                                                <i class="iconfont likeComment icon-zan"></i>
                                                            </span>
                                                        </div>
                                                    </p>
                                                    <p class="comment_list_cont_ul_item_text_test">院党委书记张国君、副院长吴英锋、院党委副书记李嘉、张维等出席大会。会议由张维主持。</p>
                                                    <p class="comment_list_cont_ul_item_text_cancel">
                                                        <span class="comment_list_cont_ul_item_text_cancel_txt">信息中心</span>
                                                        <span class="comment_list_cont_ul_item_text_title_date">2018-06-04</span>
                                                        <span class="clear"></span>
                                                    </p>
                                                </div>
                                                <div class="clear"></div>
                                            </li>

                                        </ul>
                                    </div>
                                    <div class="Content_cont">
                                        <div class="uiTabBar">
                                            <ul class="tabs__nav">
                                                <li class="tabs__item active uiTabItem">
                                                    <a class="tabHeader">
                                                        <span class="title">邀请人(23)</span>
                                                    </a>
                                                </li>
                                                <li class="tabs__item uiTabItem">
                                                    <a class="tabHeader">
                                                        <span class="title">已完成(18)</span>
                                                    </a>
                                                </li>
                                                <li class="tabs__item uiTabItem">
                                                    <a class="tabHeader">
                                                        <span class="title">未完成(5)</span>
                                                    </a>
                                                </li>
                                                <li class="tabs__item uiTabItem">
                                                    <a class="tabHeader">
                                                        <span class="title">已查看(20)</span>
                                                    </a>
                                                </li>
                                                <li class="tabs__item uiTabItem">
                                                    <a class="tabHeader">
                                                        <span class="title">未查看(3)</span>
                                                    </a>
                                                </li>
                                                <li class="clear"></li>
                                            </ul>
                                        </div>
                                        <div>
                                            <div class="people_cont" style="display: block;">
                                                <div class="search">
                                                    <input type="type" value="搜索邀请人" />
                                                </div>
                                                <ul style="padding: 9px 20px;">
                                                    <li class="comment_list_cont_ul_item">
                                                        <div class="comment_list_cont_ul_item_img">
                                                            <img src="/img/Avatar.png" alt="Alternate Text">
                                                        </div>
                                                        <div class="comment_list_cont_ul_item_text">
                                                            <p class="comment_list_cont_ul_item_text_title">
                                                                <span class="comment_list_cont_ul_item_text_title_people">卫辉</span>
                                                            </p>
                                                            <p class="comment_list_cont_ul_item_text_cancel">
                                                                <span class="comment_list_cont_ul_item_text_cancel_txt">信息中心</span>
                                                                <span class="clear"></span>
                                                            </p>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="people_cont">
                                                <div class="search">
                                                    <input type="type" value="搜索已完成" />
                                                </div>
                                            </div>
                                            <div class="people_cont">
                                                <div class="search">
                                                    <input type="type" value="搜索未完成" />
                                                </div>
                                            </div>
                                            <div class="people_cont">
                                                <div class="search">
                                                    <input type="type" value="搜索已查看" />
                                                </div>
                                            </div>
                                            <div class="people_cont">
                                                <div class="search">
                                                    <input type="type" value="搜索未查看" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content_right content">
                                <div class="content_right_top">
                                    <div class="content_right_top_title">
                                        <div class="slds-media__figure" style="margin-top: 5px;">
                                            <div class="extraSmall forceEntityIcon" style="background-color: #A55647; width: 24px; height: 24px;">
                                                <span class="uiImage">
                                                    <img src="/img/annex.png" class="" alt="文件" title="文件">
                                                </span>
                                            </div>
                                        </div>
                                        <h2 class="right_top_title">附件(4)</h2>
                                    </div>
                                    <button class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate more">MORE</button>
                                    <div class="clear"></div>
                                </div>
                                <div class="content_right_cont">
                                    <div class="content_right_cont_div">
                                        <ul class="content_right_cont_ul">
                                            <li class="content_right_cont_ul_item">
                                                <div class="content_right_cont_ul_item_div">
                                                    <div class="content_right_cont_ul_item_Imgdiv">
                                                        <img class="content_right_cont_ul_item_img" src="/img/Pdf.png" alt="Alternate Text" />
                                                    </div>
                                                    <div class="content_right_cont_ul_item_cont">
                                                        <p class="content_right_cont_ul_item_cont_title">以拼搏为美，向行动致敬.pdf</p>
                                                        <p class="content_right_cont_ul_item_cont_p">
                                                            <span>13</span>
                                                            <span>查看  ·</span>
                                                            <span>45</span>
                                                            <span>下载  ·</span>
                                                            <span>2019-04-24   </span>
                                                            <span>232K</span>
                                                        </p>
                                                    </div>
                                                    <div class="content_right_cont_ul_item_button">
                                                        <button class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate more">x</button>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>

                                            </li>
                                            <li class="content_right_cont_ul_item">
                                                <div class="content_right_cont_ul_item_div">
                                                    <div class="content_right_cont_ul_item_Imgdiv">
                                                        <img class="content_right_cont_ul_item_img" src="/img/Pdf.png" alt="Alternate Text" />
                                                    </div>
                                                    <div class="content_right_cont_ul_item_cont">
                                                        <p class="content_right_cont_ul_item_cont_title">以拼搏为美，向行动致敬.pdf</p>
                                                        <p class="content_right_cont_ul_item_cont_p">
                                                            <span>13</span>
                                                            <span>查看  ·</span>
                                                            <span>45</span>
                                                            <span>下载  ·</span>
                                                            <span>2019-04-24   </span>
                                                            <span>232K</span>
                                                        </p>
                                                    </div>
                                                    <div class="content_right_cont_ul_item_button">
                                                        <button class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate more">x</button>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>

                                            </li>
                                            <li class="content_right_cont_ul_item">
                                                <div class="content_right_cont_ul_item_div">
                                                    <div class="content_right_cont_ul_item_Imgdiv">
                                                        <img class="content_right_cont_ul_item_img" src="/img/Pdf.png" alt="Alternate Text" />
                                                    </div>
                                                    <div class="content_right_cont_ul_item_cont">
                                                        <p class="content_right_cont_ul_item_cont_title">以拼搏为美，向行动致敬.pdf</p>
                                                        <p class="content_right_cont_ul_item_cont_p">
                                                            <span>13</span>
                                                            <span>查看  ·</span>
                                                            <span>45</span>
                                                            <span>下载  ·</span>
                                                            <span>2019-04-24   </span>
                                                            <span>232K</span>
                                                        </p>
                                                    </div>
                                                    <div class="content_right_cont_ul_item_button">
                                                        <button class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate more">x</button>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>

                                            </li>
                                            <li class="content_right_cont_ul_item">
                                                <div class="content_right_cont_ul_item_div">
                                                    <div class="content_right_cont_ul_item_Imgdiv">
                                                        <img class="content_right_cont_ul_item_img" src="/img/Pdf.png" alt="Alternate Text" />
                                                    </div>
                                                    <div class="content_right_cont_ul_item_cont">
                                                        <p class="content_right_cont_ul_item_cont_title">以拼搏为美，向行动致敬.pdf</p>
                                                        <p class="content_right_cont_ul_item_cont_p">
                                                            <span>13</span>
                                                            <span>查看  ·</span>
                                                            <span>45</span>
                                                            <span>下载  ·</span>
                                                            <span>2019-04-24   </span>
                                                            <span>232K</span>
                                                        </p>
                                                    </div>
                                                    <div class="content_right_cont_ul_item_button">
                                                        <button class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate more">x</button>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="content_right_cont_button">
                                            <button class="btns btn-default Btn hove  slds-button slds-button--neutral slds-truncate">上载文件</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <script>
                            $('.content_header_ul_item').click(function () {
                                $('.content_header_ul_item').removeClass('content_header_ul_item_active');
                                $(this).addClass('content_header_ul_item_active');
                                $('.Content_cont').hide();
                                $('.Content_cont').eq($(this).index()).show();
                            })
                            $('.tabs__item').click(function () {
                                $('.tabs__item').removeClass('active');
                                $(this).addClass('active');
                                $('.people_cont').hide();
                                $('.people_cont').eq($(this).index()).show();
                            })
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">
                            function bodyOnLoad() {

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

                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); }
                            function bodyOnUnload() { }

                        </script>
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
