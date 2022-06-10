<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contentsrc_result.aspx.cs" Inherits="Supermore.content.contentsrc_result" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="" class="ext-strict">
<head>
    <title>搜索 ~ 凤凰协同办公系统</title>
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
    <link href="/css/contentsrc_result.css" rel="stylesheet" />
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
    <link href="/portal/css/home.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />

    <script src="/content/video/zxf_page.js"></script>
    <style>
        .listItem {
            background: rgba(0, 0, 0, 0) url("/img/skin-dots.gif") no-repeat scroll 0 -137px;
            padding-left: 10px;
        }
        #js_style_css_module_global_WB_outframe
        {
            height: 42px;
        }

        .tab_fix_bottom
        {
            position: absolute;
            bottom: 0px;
            top: auto;
        }

        .tab_fix
        {
            position: fixed;
        }

        .UG_list_b
        {
            height: 30px;
            line-height: 30px;
        }

        .list_title_b
        {
            font-size: 14px;
        }

        .time
        {
            float: right;
        }

        .loadings
        {
            display: none;
            border-radius: 5px;
            text-align: center;
            line-height: 34px;
            margin: 5px;
            background: #F1F1F1;
        }

            .loadings img
            {
                margin-left: 50%;
            }
            html{
                background-color:transparent;
            }
        .a_span {
            max-width:75%;
            display:inline-block;
            overflow:hidden;
            text-overflow:ellipsis;
            float:left;
            margin-right:5px;
            white-space:nowrap;
        }
        .red {
            font-weight:700;
            color:red;
            font-size:12px;
        }
        #plc_main{
            width:70%;
            margin-left:20%;
            margin-top:20px;
        }
        .WB_frame_c{
            width:100%;
        }
        .UG_list_b .list-skin{
            margin-top:10px;
        }
        #contentsearch {
            line-height: 30px;
        }
        .information_header_center{
            margin:5px 0 0 50px;
            text-align:center;
        }
        .information_header_center_input {
            padding: 0 0 0 25px;
            height: 34px;
            color: rgb(153, 153, 153);
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 500px;
        }
        .icon-sousuo1{
            top:auto;
            left:auto;
            margin-top:10px;
            margin-left:10px;
        }
        .left-table {
            border-right: 1px solid #dedede;
            overflow-y: auto;
            width: 10%;
        }
        #plc_main {
            width: 80%;
            margin-left: 15%;
            margin-top: 20px;
        }
        #paging{
            width: 333px;
            margin: 0 auto;
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
                        <%--<td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell" style="padding-left: 0; position: relative;">
                            <span id="LeftQuickMenu1" style="position: absolute; display: block; width: 100%; height: 100%; top: 10px;"><a title="单击关闭侧栏 [Alt+S]" id="handlebarContainer" href="javascript:void(0);" class="zen handlebarContainer">
                                <span class="zen-assistiveText">单击以关闭侧栏</span><span id="pinIndicator"
                                    class="indicator"></span><span id="pinIndicator2" class="indicator"></span><span id="handle" class="pinBox">&nbsp;</span></a>
                                <div id="sidebarDiv" class="collapsible sidebar" style="width: 100%;">
                        
                              
                                </div>
                            </span>
                        </td>--%>
                        <td id="bodyCell" class="oRight" style="background: #fff;">
                            <!-- Start page content table -->
                            <ul class="left-table" style="float:left;">
                            </ul>
                            <div id="plc_main">
                                <div id="plc_unlogin_home_main">
                                    <div class="information_header_center">
                                         <i class="iconfont icon-sousuo1"></i>
                                         <input type="" class="information_header_center_input" value="" id="contentsearch">
                                    </div>
                                    <div class="WB_frame_c">
                                        <div class="top-location">
                                            <div class="top-location-left">行政管理</div>
                                            
                                            <div class="top-location-right">
                                                <img src="/portal/img/12125.png" alt="Alternate Text" />
                                                <span>当前位置：</span>
                                                <span>首页</span>>
                                                <span class="location1name">行政规章制度</span>>
                                                <span class="location2name">行政管理</span>
                                            </div>
                                        </div>
                                        <div id="pl_unlogin_home_feed">
                                            <!--榜单栏位置-->
                                            <div class="UG_slider"></div>
                                            <div class="UG_contents" id="PCD_pictext_i_v5">
                                                <!--feed内容-->
                                                <ul class="pt_ul clearfix" id="div_content">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>



                            <div class="clear"></div>
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
        <%--<div class="bPageFooter noTableFooter">
            本机IP:<%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%>
        </div>--%>
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <script src="/js/CommonUtils.js"></script>

    
       <script type="text/javascript">
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
                       $('.left-table').append('<li title="' + res.Name + '" class="" pageid="' + res.ContentPageId + '">'
                                       + '    <a>'
                                       + '        <span class="">' + res.Name + '</span></a>'
                                       + '</li>')
                   }
                   $('.left-table li').click(function () {
                       $(this).addClass('active')
                       $(this).siblings().removeClass('active')
                       var pageid = $(this).attr('pageid')
                       if (pageid == 'unread') {
                           location.href = '/content/contentsrc_unread.aspx'
                       }
                       else {
                           window.location.href = '/content/contentsrc.aspx?t=PortalHome&pageid=' + pageid
                       }
                   })
                   $('.left-table li').each(function () {
                       if ($(this).find('span').html() == getQueryString('pageName')) {
                           $(this).addClass('active')
                       }
                   })
               })

           }




        var LikesNum = 0;
        var DataPageNumber = 0;
        var LoadDataSuccess = false;

        var folderId = "";
        var finished = 0;
        var parentId = getQueryString("parentid");
        var tokenStr = getQueryString("token");
        if (!tokenStr) { tokenStr = "" }

        LoadInfo = {
            init: function () {
                var _this = this;

            },

            bindClick: function () {
                $('#leftNav a').click(function () {
                    folderId = $(this).attr("valueid");
                    window.data.FolderId = folderId
                    //LikesNum = 0;
                    $("#div_loading").hide();
                    $('#div_content').html("");
                    $('#leftNav a').removeClass('active')
                    $(this).addClass('active')
                    $('.location2name').html($(this).text())
                    LoadInfo.contentList(0);
                })

            },

            contentList: function (pageNumber) {
                if (pageNumber == 0) {
                    DataPageNumber = pageNumber;
                }
                
                window.data.rowsPerPage = 15
                window.data.pageNumber = pageNumber +1
                $.ajax({
                    url: window.url,
                    type: 'get',
                    data: window.data,
                    dataType: 'json',
                    async: true,
                    cache: false,
                    success: function (res) {
                        //Total
                        var search = getQueryString('search')
                        if (search) {
                            var data = {
                                rows: res.rows,
                                listData: res.rows,
                                total: res.total
                            }
                        } else {
                            var data = {
                                rows: res.contents,
                                listData: res.contents,
                                total: res.total
                            }
                        }
                        $('#div_content').html('');

                        if (data.rows != null && data.rows.length > 0) {

                            var totalPages = 0;
                            var pageHtml = '';
                            totalPages = Math.ceil(data.total / 15);

                            for (var i = 0; i < data.listData.length; i++) {
                                var res = data.listData[i]
                                if (res.createdOn) {
                                    var CreatedOn = res.createdOn
                                } else {
                                    var CreatedOn = res.CreatedOn
                                }
                                CreatedOn = CreatedOn.split(' ')[0]
                                var ReadStatus = res.ReadStatus

                                if (res.title) {
                                    var Title = res.title
                                } else {
                                    var Title = res.Title
                                }
                                if (res.contentId) {
                                    var ContentId = res.contentId
                                } else {
                                    var ContentId = res.ContentId
                                }
                                var location1name = $('.location1name').html()
                                var location2name = $('.location2name').html()
                                if (ReadStatus != 1) {
                                    $('#div_content').append('<li title="' + res.Title + '" class="UG_list_b">'
                                    + '<p class="list_title_b">'
                                    + '<i></i>'
                                    + '<div class="list-skin"></div>'
                                    + '<a class="S_txt1" href="/portal/viewArticle.aspx?id=' + ContentId + '&location1name=' + location1name + '&location2name=' + location2name + '"target="_blank"><span class="a_span">' +Title+ '</span></a>'

                                    + '<span class="time">' + CreatedOn + '</span>'
                                    + '</p>'
                                + '</li>');
                                } else {
                                    $('#div_content').append('<li title="' + res.Title + '" class="UG_list_b">'
                                    + '<p class="list_title_b">'
                                    + '<i></i>'
                                    + '<div class="list-skin"></div>'
                                    + '<a class="S_txt1 is-read" href="/portal/viewArticle.aspx?id=' + ContentId + '&location1name=' + location1name + '&location2name=' + location2name + '"target="_blank"><span class="a_span">' + Title + '</span></a>'
                                    + '<span class="time">' + CreatedOn + '</span>'
                                    + '</p>'
                                + '</li>');
                                }
                            }
                            finished = 0;
                            $("#div_loading").hide();
                            LoadDataSuccess = true;
                            pageHtml = "<div id='paging' style='text-align:right;font-size:16px;'>";
                            pageHtml += "<a style='cursor:pointer;'><span onclick='LoadPrePageData();'>上一页</span></a>";
                            pageHtml += "<a style='cursor:pointer'><span style='margin:6px;' onclick='LoadNextPageData();'>下一页</span></a>";
                            pageHtml += "<span id='CurrentPageNumber'><span></span><input id='pageto'autocomplete='off' type='text'></span>";
                            pageHtml += "<span id='TotalPageNumber'></span>";
                            pageHtml += "</div>";
                            $('#div_content').append(pageHtml);

                            $('#pageto').keyup(function (e) {
                                if (e.keyCode == '13') {
                                    var page = $(this).val()
                                    LoadInfo.contentList(Number(page) - 1);
                                }
                            })

                            $('#CurrentPageNumber span').text("当前页：");
                            $('#CurrentPageNumber input').val(Number(Number(pageNumber) + 1));
                            $('#TotalPageNumber').text(" 总页数:" + totalPages);
                        } else {
                            LoadDataSuccess = false;
                        }
                    }
                });
            },

        };

        function LoadNextPageData() {
            if (DataPageNumber+1 < $('#TotalPageNumber').html().split(':')[1]) {
                DataPageNumber = DataPageNumber + 1;
                LoadInfo.contentList(DataPageNumber);
            }
            
            
        }

        function LoadPrePageData() {

            if (DataPageNumber - 1 >= 0)
                LoadInfo.contentList(DataPageNumber - 1);

            if (LoadDataSuccess && (DataPageNumber - 1) >= 0)
                DataPageNumber = DataPageNumber - 1;
        }
        var url = ''
        var data = {}
        $(document).ready(function () {
            var search = getQueryString('search')
            var blockId = getQueryString('blockId')
            var blockName = getQueryString('blockName')
            var pageName = getQueryString('pageName')
            if (search) {
                url = '/apps/CommandProcessor.ashx?cmd=content.search'
                window.data = {
                    search: search,
                }
                $('.top-location-left').html('信息搜索')
            } else {
                url = '/apps/CommandProcessor.ashx?cmd=page.block.content.getlist'
                window.data = {
                    blockId: blockId,
                }
                $('.top-location-left').html(blockName)
                $('.location1name').html(pageName)
                $('.location2name').html(blockName)
            }
            LoadInfo.contentList(0);
        });
        $('#contentsearch').change(function () {
            var search = $(this).val()
            window.data.search = search
            LoadInfo.contentList(0);
        })
    </script>
</body>
</html>
