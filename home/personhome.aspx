<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personhome.aspx.cs" Inherits="WebClient.home.personhome" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <cc1:PageTitle ID="PageTitle1" ResourceKey="Home" runat="server" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css">
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
                        <td class=" sidebarCell sidebarCollapsible " id="sidebarCell">
                            <a title="单击打开侧栏 [Alt+S]" id="handlebarContainer" href="javascript:void(0);" class="zen handlebarContainer">
                                <span class="zen-assistiveText">单击以打开侧栏</span><span id="pinIndicator" class="indicator"></span><span
                                    id="pinIndicator2" class="indicator"></span><span id="handle" class="pinBox">&nbsp;</span></a>
                            <div id="sidebarDiv" class="collapsible sidebar">
                                <div class="createNewModule sidebarModule">
                                    <div class="sidebarModuleBody sidebarModuleBodyNoHeader">
                                        <div id="createNew" class="menuButton">
                                            <div id="createNewButton" class="menuButtonButton"><span tabindex="0" id="createNewLabel" class="menuButtonLabel">新建...</span></div><div id="createNewMenu" class="menuButtonMenu"><a class="eventMru firstMenuItem menuButtonMenuLink" href="/00U/e?retURL=/home/home.aspx"><img title="事件" class="mruIcon" alt="事件" src="/s.gif">事件</a><a class="menuButtonMenuLink taskMru"   href="/00T/e?retURL=/home/home.aspx"><img title="任务" class="mruIcon" alt="任务" src="/s.gif">任务</a><a class="campaignMru menuButtonMenuLink"
                                                            href="/apps/wf/applyInstance.aspx?t=122&retURL=/home/home.aspx"><img title="发起流程事务" class="mruIcon" alt="发起流程事务"
                                                                src="/s.gif">发起事务</a><!--<a class="leadMru menuButtonMenuLink" href="/00Q/e?retURL=/home/home.aspx"><img
                                                                    title="潜在客户" class="mruIcon" alt="潜在客户" src="/s.gif">潜在客户</a>--><a class="contactMru menuButtonMenuLink"
                                                                        href="/003/e?retURL=/home/home.aspx"><img title="联系人" class="mruIcon" alt="联系人" src="/s.gif">联系人</a><!--<a
                                                                            class="menuButtonMenuLink accountMru" href="/001/e?retURL=/home/home.aspx"><img title="客户"
                                                                                class="mruIcon" alt="客户" src="/s.gif">客户</a><a class="menuButtonMenuLink reportMru"
                                                                                    href="/reportbuilder/reportType.apexp"><img title="报表" class="mruIcon" alt="报表" src="/s.gif">报表</a><a
                                                                                        class="menuButtonMenuLink contentSearchMru" href="javascript:Sfdc.AccessibleUploadFileDialog.open(null, 'afqHVJa7zxKx5dYya8UsexcibyBfDyj8p4fi5wWoNzazaZIPM9jF4HqrARZjMuxqqqBADMRXNF9iLsV4j9KeLQwfst87PORxmLWHxdhHQD6L20MvkdlPrbKn3GKNd_UNEiVuDWkE33y6S8GnVVx3qWQjFXM=');"><img
                                                                                            title="" class="mruIcon" alt="" src="/s.gif">文件</a>--></div>
                                        </div>
                                        <script>                                            new MenuButton('createNew', false);</script>
                                    </div>
                                </div>
                                <div class="recentItemModule sidebarModule">
                                    <div class="sidebarModuleHeader brandPrimaryBgr">
                                        <h2 class="brandPrimaryFgr">
                                            快捷方式</h2>
                                    </div>
                                    <div class="sidebarModuleBody">
                                        <div class="SidebarShortcut">
                                            <div class="mruItem">
                                                <a class="mruText" href="/msg/inbox.aspx">
                                                    <img title="新邮件" class="datePickerIcon" alt="新邮件" src="/s.gif" />新邮件</a></div>
                                        </div><!--
                                        <div class="SidebarShortcut">
                                            <div class="mruItem">
                                                <a href="/6AA?src=10">
                                                    <img title="" class="unresolvedIcon" alt="" src="/s.gif">无法解析的项目</a></div>
                                        </div>-->
                                    </div>
                                </div>
                                <div class="recentItemModule sidebarModule">
                                    <div class="sidebarModuleHeader brandPrimaryBgr">
                                        <h2 class="brandPrimaryFgr">
                                            最近项目</h2>
                                    </div>
                                    <div class="sidebarModuleBody"><!--
                                        <div id="urlQueryStr" data-urlquerystr="retURL=/home/home.aspx&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1410773133280&amp;hl=00590000003ClcF%3A,00190000013XqWK%3A,005900000038QVZ%3A,00390000017ZfSO%3A,"
                                            class="hidden">
                                        </div>
                                        <div data-hovdata="dir=chatterHover-right" class="mruList individualPalette" data-uidsfdc="82"
                                            id="82">
                                            <div data-hovid="005900000038QVZ" class="userBlock" data-uidsfdc="83" id="hoverItem83">
                                                <div id="mru005900000038QVZ" class="mruItem">
                                                    <a title="[Alt+1]" tabindex="0" accesskey="1" class="userMru" href="/005900000038QVZ">
                                                        <img title="用户: liu jerryliu" class="mruIcon" alt="用户: liu jerryliu" src="/s.gif"><span
                                                            class="mruText">liu jerryliu</span></a></div>
                                            </div>
                                            <div data-hovid="00390000017ZfSO" class="contactBlock" data-uidsfdc="84" id="hoverItem84">
                                                <div id="mru00390000017ZfSO" class="mruItem">
                                                    <a title="[Alt+2]" tabindex="0" accesskey="2" class="contactMru" href="/00390000017ZfSO">
                                                        <img title="联系人: jack liu" class="mruIcon" alt="联系人: jack liu" src="/s.gif"><span
                                                            class="mruText">jack liu</span></a></div>
                                            </div>
                                            <div data-hovid="00190000013XqWK" class="accountBlock" data-uidsfdc="85" id="hoverItem85">
                                                <div id="mru00190000013XqWK" class="mruItem">
                                                    <a title="[Alt+3]" tabindex="0" accesskey="3" class="accountMru" href="/00190000013XqWK">
                                                        <img title="客户: test1" class="mruIcon" alt="客户: test1" src="/s.gif"><span class="mruText">test1</span></a></div>
                                            </div>
                                            <div data-hovid="00590000003ClcF" class="userBlock" data-uidsfdc="86" id="hoverItem86">
                                                <div id="mru00590000003ClcF" class="mruItem">
                                                    <a title="[Alt+4]" tabindex="0" accesskey="4" class="userMru" href="/00590000003ClcF">
                                                        <img title="用户: Chatter Expert" class="mruIcon" alt="用户: Chatter Expert" src="/s.gif"><span
                                                            class="mruText">Chatter Expert</span></a></div>
                                            </div>
                                        </div>
                                        -->
                                    </div>
                                </div>
                                <div class="linksModule sidebarModule">
                                    <div class="sidebarModuleHeader brandPrimaryBgr">
                                        <h2 class="brandPrimaryFgr">
                                            自定义链接</h2>
                                    </div>
                                    <div class="sidebarModuleBody">
                                        <ul>
                                        </ul>
                                    </div>
                                </div>
                                <div class="messageModule sidebarModule">
                                    <div class="sidebarModuleHeader brandPrimaryBgr">
                                        <h2 class="brandPrimaryFgr">
                                            消息和警告</h2>
                                    </div>
                                    <div class="sidebarModuleBody">
                                    </div>
                                </div><!--
                                <div class="recycleBinModule sidebarModule">
                                    <div class="sidebarModuleBody sidebarModuleBodyNoHeader">
                                        <a href="/search/UndeletePage">
                                            <img title="回收站" class="recycleIcon" alt="回收站" src="/s.gif"><span class="recycleText">回收站</span></a></div>
                                </div>-->
                            </div>
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
                                        <div class="links"><input type="button" title="门户首页 （新窗口）" onclick="openPopupFocus('http://files.supermore.com.cn/index.aspx', 'WhatsNew', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" name="whats_new" class="btnImportant" value="门户首页"></div>
                                        <div class="content">
                                            <span class="pageType">
                                                <h1 class="currentStatusUserName">
                                                    <a href="/_ui/core/userprofile/UserProfilePage">
                                                        <%=UserName%></a></h1>
                                            </span><span class="pageDescription"><a href='/cal/daily.aspx?md0=<%=Md0%>&amp;md3=<%=Md3%>'>
                                                <%=TodayDisplay%></a></span></div>
                                    </div>
                                </div>
                                <div id="section_header" class="metadata"  style="display:none">
                                    <div id="feedLinks" class="zen feedLinks">
                                        <ul class="zen-inlineList">
                                            <li>
                                                <div class="chatterShowHideFeed">
                                                    <script>                                                        //chatter.getToolbox().setToken('BMswVBzI_DLr9AhjS4DHnZPwLPF.vAy7uU36Qx3BJgvnOyxwYjcL3JEi9qQ94nOJKZj7ZlEn_emZ4qtIGrwgOdBygP1O9u6LXOKJBVyrdG_F4chfH9oFTeJJCXEjO5cL_8DFDvvlq8SxFnm.KcdsdTeV27s=');</script>
                                                    <span id="hideFeedLink" class="hideFeedLink"><a onclick="chatter.getFeed().toggle('{&quot;subjectId&quot;:&quot;005900000038QVZ&quot;,&quot;feedType&quot;:&quot;NEWS&quot;,&quot;writable&quot;:&quot;ReadWrite&quot;,&quot;numFeedItems&quot;:3,&quot;canSortFeed&quot;:true,&quot;sortByComments&quot;:false,&quot;showFeedTitle&quot;:false,&quot;isDropDownFiltersVisible&quot;:false,&quot;alwaysShowFullText&quot;:false,&quot;isShowMoreOfThis&quot;:true,&quot;feedfilter&quot;:&quot;all&quot;,&quot;keyprefix&quot;:&quot;&quot;}', true);"
                                                        class="innerLink" href="javascript: void(0);">
                                                        <img title="隐藏摘要" alt="隐藏摘要" src="/s.gif"><span class="linkText">隐藏摘要</span></a></span><span
                                                            style="display: none" id="showFeedLink" class="showFeedLink"><a onclick="chatter.getFeed().toggle('{&quot;subjectId&quot;:&quot;005900000038QVZ&quot;,&quot;feedType&quot;:&quot;NEWS&quot;,&quot;writable&quot;:&quot;ReadWrite&quot;,&quot;numFeedItems&quot;:3,&quot;canSortFeed&quot;:true,&quot;sortByComments&quot;:false,&quot;showFeedTitle&quot;:false,&quot;isDropDownFiltersVisible&quot;:false,&quot;alwaysShowFullText&quot;:false,&quot;isShowMoreOfThis&quot;:true,&quot;feedfilter&quot;:&quot;all&quot;,&quot;keyprefix&quot;:&quot;&quot;}', true);"
                                                                class="innerLink" href="javascript: void(0);"><img title="显示摘要" alt="显示摘要" src="/s.gif"><span
                                                                    class="linkText">显示摘要</span></a></span></div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="clearingBox">
                                    </div>
                                </div>
                                <div id="chatterfeedshell" class="chatterfeedshell" style="display:none">
                                    <div id="chatterexpando" class="chatterexpando">
                                        <div class="feedpage zen">
                                            <div class="feedmainandrightbar">
                                                <div class="feedrightbarwider">
                                                    <div data-rectype="ALL" data-hovdata="dir=chatterHover-left" class="recommend" id="recs_widget"
                                                        data-uidsfdc="75">
                                                        <div class="recBoxHeader">
                                                            <h3 class="zen-h6 zen-inlineHeading">
                                                                推荐</h3>
                                                            <a class="blueLink zen-mlm" title="查看更多推荐" href="/_ui/core/chatter/recommend/RecommendationsPage?recType=RECORDS">
                                                                更多 </a>
                                                        </div>
                                                        <ul aria-relevant="additions, text" aria-atomic="false" aria-live="assertive" class="recBox">
                                                            <script type="text/javascript">
                                                                whatToDoNext.accessibilityMode = false;
                                                                whatToDoNext.logClicks = false;

                                                                whatToDoNext.tabNameType = 'CHATTER';
				
                                                            </script>
                                                            <li class="recElement todoElement ">
                                                                <div id="todoItem" class="todoList">
                                                                    <div id="listItem-getSalesforce1">
                                                                        <a onclick="whatToDoNext.getSalesforce1();" href="javascript: void(0);">
                                                                            <img alt="" src="/s.gif" class="recImage salseforce1">
                                                                            获取 应用程序</a>
                                                                        <p>
                                                                            随身携带 从 <a onclick="whatToDoNext.clickS1LinkInDesc('https://itunes.apple.com/app/id404249815');"
                                                                                href="javascript: void(0);">Apple App Store</a> 和<a onclick="whatToDoNext.clickS1LinkInDesc('https://play.google.com/store/apps/details?id=com..chatter');"
                                                                                    href="javascript: void(0);">Google Play</a>上下载 移动应用程序。</p>
                                                                        <div class="dismiss">
                                                                            <a onclick="whatToDoNext.dismissThisItem('getSalesforce1', 'listItem-getSalesforce1');"
                                                                                href="javascript: void(0);">跳过 &gt;</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li tabindex="-1" data-purpose="2" data-recprocname="OwnedProcessor" data-recid="00390000017ZfSO"
                                                                class="recElement"><span class="thumbnail"><a title="jack liu" tabindex="-1" href="/00390000017ZfSO"
                                                                    data-uidsfdc="77">
                                                                    <img title="jack liu" data-hovid="00390000017ZfSO" class="recImage records contact"
                                                                        alt="jack liu" src="/s.gif" data-uidsfdc="76" id="hoverItem76"></a> </span>
                                                                <div class="recInfo">
                                                                    <div class="recNameAndTitle">
                                                                        <span data-hovid="00390000017ZfSO" class="recElementName" data-uidsfdc="78" id="hoverItem78">
                                                                            <a title="jack liu" href="/00390000017ZfSO">jack liu</a></span>
                                                                    </div>
                                                                    <div data-explaintype="21" class="explanation unexpanded">
                                                                        您拥有的
                                                                    </div>
                                                                    <div>
                                                                        <div class="zen">
                                                                            <div onclick="SfdcApp.Chatter.SubscribeButton.onClick(event);" data-sfdc-network-id="000000000000000"
                                                                                data-sfdc-entity-id="00390000017ZfSO" data-chatter-widget="subscribeBtn">
                                                                                <span data-chatter-subscribe="1" class="zen-media zen-mediaExt"><a class="zen-mrs zen-img"
                                                                                    href="javascript:void(0);">
                                                                                    <img width="1" height="1" title="追随此联系人以在您的摘要中接收更新。" class="chatter-iconSmall chatter-followIcon"
                                                                                        alt="追随此联系人以在您的摘要中接收更新。" src="/s.gif"></a><span class="zen-mediaBody"><a title="追随此联系人以在您的摘要中接收更新。"
                                                                                            href="javascript:void(0);">追随</a></span></span><span style="display: none" onmouseover="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                                                onmouseout="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" onfocus="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                                                onblur="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" class="zen-media zen-mediaExt"><img
                                                                                                    width="1" height="1" title="停止追随此联系人以停止在您的摘要中接收更新。" class="chatter-icon zen-mrs chatter-checkedIcon zen-img"
                                                                                                    alt="停止追随此联系人以停止在您的摘要中接收更新。" src="/s.gif"><span class="zen-mediaBody">正在追随<a title="停止追随此联系人以停止在您的摘要中接收更新。"
                                                                                                        data-chatter-subscribe="0" class="zen-mls zen-imgExt" href="javascript:void(0);"><img
                                                                                                            width="1" height="1" title="停止追随此联系人以停止在您的摘要中接收更新。" class="chatter-icon chatter-unfollowIcon"
                                                                                                            alt="停止追随此联系人以停止在您的摘要中接收更新。" src="/s.gif"></a></span></span></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <a class="recDismissLink" title="不再向我显示此推荐" href="javascript:void(0);">
                                                                    <img alt="不再向我显示此推荐" class="recDismissImage" src="/s.gif">
                                                                </a>
                                                                <div class="clearingBox">
                                                                </div>
                                                            </li>
                                                            <li tabindex="-1" data-purpose="2" data-recprocname="OwnedProcessor" data-recid="00190000013XqWK"
                                                                class="recElement"><span class="thumbnail"><a title="test1" tabindex="-1" href="/00190000013XqWK"
                                                                    data-uidsfdc="80">
                                                                    <img title="test1" data-hovid="00190000013XqWK" class="recImage account records"
                                                                        alt="test1" src="/s.gif" data-uidsfdc="79" id="hoverItem79"></a> </span>
                                                                <div class="recInfo">
                                                                    <div class="recNameAndTitle">
                                                                        <span data-hovid="00190000013XqWK" class="recElementName" data-uidsfdc="81" id="hoverItem81">
                                                                            <a title="test1" href="/00190000013XqWK">test1</a></span>
                                                                    </div>
                                                                    <div data-explaintype="21" class="explanation unexpanded">
                                                                        您拥有的
                                                                    </div>
                                                                    <div>
                                                                        <div class="zen">
                                                                            <div onclick="SfdcApp.Chatter.SubscribeButton.onClick(event);" data-sfdc-network-id="000000000000000"
                                                                                data-sfdc-entity-id="00190000013XqWK" data-chatter-widget="subscribeBtn">
                                                                                <span data-chatter-subscribe="1" class="zen-media zen-mediaExt"><a class="zen-mrs zen-img"
                                                                                    href="javascript:void(0);">
                                                                                    <img width="1" height="1" title="追随此客户以在您的摘要中接收更新。" class="chatter-iconSmall chatter-followIcon"
                                                                                        alt="追随此客户以在您的摘要中接收更新。" src="/s.gif"></a><span class="zen-mediaBody"><a title="追随此客户以在您的摘要中接收更新。"
                                                                                            href="javascript:void(0);">追随</a></span></span><span style="display: none" onmouseover="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                                                onmouseout="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" onfocus="SfdcApp.Chatter.SubscribeButton.onHover(event, true)"
                                                                                                onblur="SfdcApp.Chatter.SubscribeButton.onHover(event, false)" class="zen-media zen-mediaExt"><img
                                                                                                    width="1" height="1" title="停止追随此客户以停止在您的摘要中接收更新。" class="chatter-icon zen-mrs chatter-checkedIcon zen-img"
                                                                                                    alt="停止追随此客户以停止在您的摘要中接收更新。" src="/s.gif"><span class="zen-mediaBody">正在追随<a title="停止追随此客户以停止在您的摘要中接收更新。"
                                                                                                        data-chatter-subscribe="0" class="zen-mls zen-imgExt" href="javascript:void(0);"><img
                                                                                                            width="1" height="1" title="停止追随此客户以停止在您的摘要中接收更新。" class="chatter-icon chatter-unfollowIcon"
                                                                                                            alt="停止追随此客户以停止在您的摘要中接收更新。" src="/s.gif"></a></span></span></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <a class="recDismissLink" title="不再向我显示此推荐" href="javascript:void(0);">
                                                                    <img alt="不再向我显示此推荐" class="recDismissImage" src="/s.gif">
                                                                </a>
                                                                <div class="clearingBox">
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="feedmain">
                                                    <script>                                                        // chatter.getToolbox().setToken('');</script>
                                                    <div data-topics="" data-publisher="{&quot;subjectId&quot;:&quot;005900000038QVZ&quot;,&quot;entityType&quot;:&quot;用户&quot;,&quot;useDefaultState&quot;:true,&quot;useEnhancedKeyboardNavigation&quot;:true}"
                                                        class="publishercontainer zen  defaultState  cxchattertextareacontainer chattertextareacontainer">
                                                        <ul class="publisherFeedItemTypeChoices">
                                                            <li label="TextPost" class="publisherFeedItemTypeChoice"><a onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'TextPost', 'TextPost', event);"
                                                                id="publisherAttachTextPost" class="publisherattach publisherattachTextPost   withArrowAttached"
                                                                title="张贴" href="javascript:void(0);">
                                                                <img title="" class="publishericon " alt="" src="/s.gif">
                                                                <span class="publisherattachtext ">张贴</span> <span class="pArrow"></span></a>
                                                            </li>
                                                            <li label="ContentPost" class="publisherFeedItemTypeChoice"><a onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'ContentPost', 'ContentPost', event);"
                                                                id="publisherAttachContentPost" class="publisherattach publisherattachContentPost   "
                                                                title="文件" href="javascript:void(0);">
                                                                <img title="" class="publishericon " alt="" src="/s.gif">
                                                                <span class="publisherattachtext ">文件</span> <span class="pArrow"></span></a>
                                                            </li>
                                                            <li label="CreateRecordEvent" class="publisherFeedItemTypeChoice"><a onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1hb', event);"
                                                                id="publisherAttach09D90000002A1hb" class="publisherattach publisherattach09D90000002A1hb taskMru  truncateLabelWrapper"
                                                                title="Task" href="javascript:void(0);">
                                                                <img title="" class="publishericon mruIcon applygrayscale" alt="" src="/img/icon/tasks16.png">
                                                                <span class="publisherattachtext truncateLabel">新建任务</span> <span class="pArrow">
                                                                </span></a></li>
                                                            <li class="publisherFeedItemTypeChoice">
                                                                <div role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown" class="zen-select publisherattach publisherTypeOverflow"
                                                                    data-uidsfdc="40">
                                                                    <a aria-haspopup="true" title="单击以查看更多选项" href="javascript:void(0);" class="zen-trigger"
                                                                        id="publisherDropdown" data-uidsfdc="38"><span class="triggerText">更多</span> <span
                                                                            class="publisherTypeOverflowSelected hidden"><span class="publisherattachtext truncateLabel">
                                                                            </span></span><span class="publisherArrowContainer"><b class="zen-selectArrow"></b>
                                                                        </span></a><span class="pArrow"></span>
                                                                    <ul aria-labelledby="publisherDropdown" role="menu" class="zen-options" data-uidsfdc="39">
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="29"><a
                                                                            title="Contact" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1hc', event);"
                                                                            id="publisherAttach09D90000002A1hc" class="publisherattach truncateLabelWrapper publisherattach09D90000002A1hc contactMru publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="mruIcon applygrayscale publishericon" alt="" src="/img/icon/contacts16.png"><span
                                                                                    class="truncateLabel publisherattachtext">新建联系人</span></span></a> </li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="30"><a
                                                                            title="Log a Call" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1hd', event);"
                                                                            id="publisherAttach09D90000002A1hd" class="publisherattach publisherattach09D90000002A1hd truncateLabelWrapper taskMru publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="mruIcon applygrayscale publishericon" alt="" src="/img/icon/tasks16.png"><span
                                                                                    class="truncateLabel publisherattachtext">记录电话</span></span></a> </li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="31"><a
                                                                            title="Opportunity" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1he', event);"
                                                                            id="publisherAttach09D90000002A1he" class="publisherattach publisherattach09D90000002A1he opportunityMru truncateLabelWrapper publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="mruIcon applygrayscale publishericon" alt="" src="/img/icon/opportunities16.png"><span
                                                                                    class="truncateLabel publisherattachtext">新建业务机会</span></span></a></li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="32"><a
                                                                            title="Lead" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1hf', event);"
                                                                            id="publisherAttach09D90000002A1hf" class="publisherattach leadMru publisherattach09D90000002A1hf truncateLabelWrapper publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="mruIcon applygrayscale publishericon" alt="" src="/img/icon/leads16.png"><span
                                                                                    class="truncateLabel publisherattachtext">新建潜在客户</span></span></a></li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="33"><a
                                                                            title="Event" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1hg', event);"
                                                                            id="publisherAttach09D90000002A1hg" class="eventMru publisherattach publisherattach09D90000002A1hg truncateLabelWrapper publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="mruIcon applygrayscale publishericon" alt="" src="/img/icon/calendar16.png"><span
                                                                                    class="truncateLabel publisherattachtext">新建事件</span></span></a></li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="34"><a
                                                                            title="Account" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'CreateRecordEvent', '09D90000002A1hh', event);"
                                                                            id="publisherAttach09D90000002A1hh" class="publisherattach publisherattach09D90000002A1hh truncateLabelWrapper publisherFeedItemTypeChoice accountMru"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="mruIcon applygrayscale publishericon" alt="" src="/img/icon/accounts16.png"><span
                                                                                    class="truncateLabel publisherattachtext">新建客户</span></span></a></li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="35"><a
                                                                            title="链接" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'LinkPost', 'LinkPost', event);"
                                                                            id="publisherAttachLinkPost" class="publisherattach publisherattachLinkPost publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="publishericon" alt="" src="/s.gif"><span class="publisherattachtext">链接</span></span></a></li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="36"><a
                                                                            title="投票" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'PollPost', 'PollPost', event);"
                                                                            id="publisherAttachPollPost" class="publisherattach publisherattachPollPost publisherFeedItemTypeChoice"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="publishericon" alt="" src="/s.gif"><span class="publisherattachtext">投票</span></span></a></li>
                                                                        <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" data-uidsfdc="37"><a
                                                                            title="感谢" role="menuitem" onclick="chatter.getPublisher().openTypeSpecificPanel(this, 'RypplePost', 'RypplePost', event);"
                                                                            id="publisherAttachRypplePost" class="publisherattach publisherFeedItemTypeChoice publisherattachRypplePost"
                                                                            href="javascript:void(0);"><span>
                                                                                <img title="" class="publishericon" alt="" src="/s.gif"><span class="publisherattachtext">感谢</span></span></a></li>
                                                                    </ul>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <div class="publisherWrapper" style="visibility: visible;">
                                                            <div lazyinit="" class="TextPost publisherTemplate activeTemplate">
                                                                <div class="publisherTextAreaPlaceholder alignTop">
                                                                    <div id="publisherTextArea" class="publisherTextAreaContainer">
                                                                        <div class="publisherTextAreaInner">
                                                                            <textarea wrap="soft" type="text" title="您正在处理什么？" tabindex="0" role="textbox" name="publishereditablearea"
                                                                                id="publishereditablearea" class="chatterTopicsEnabled  groupAtMentionsEnabled publishertextarea"
                                                                                data-uidsfdc="41">您正在处理什么？</textarea>
                                                                            <input type="hidden" value="您正在处理什么？" name="publisherprompttext" id="publisherprompttext">
                                                                        </div>
                                                                        <div style="display: none;" class="cxchattermessagecontainer chattermessagecontainer"
                                                                            id="publishererrorcontainer">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="publisherBottomBarPlaceholder">
                                                                    <div id="publisherBottomBar" class="bottomBar">
                                                                        <div class="bottomBarLeft">
                                                                            <span class="publisherPostToElementPlaceholder"><span id="publisherPostToElement"><span
                                                                                class="postTo"><span class="postToText">到</span><span class="postToTarget"><span
                                                                                    class="postToTextTarget">我的追随者<img title="" class="nameFadeOut" alt="" src="/s.gif"></span></span></span></span></span>
                                                                            <span class="publisherVisibilityWidgetPlaceholder"><span class="visibilityWidgetParent"
                                                                                id="publisherVisibilityWidget"><a onclick="chatter.getPublisher().getWidget('visibilityWidget').toggleDisplay();"
                                                                                    class="iconParent" href="javascript:void(0);">
                                                                                    <img title="谁可以查看您的帖子？" id="publisherVisibilityIcon" class="visibilityicon " alt="谁可以查看您的帖子？"
                                                                                        src="/s.gif">
                                                                                </a>
                                                                                <script>                                                                                    chatter.getPublisher().addVisibilityWidget("javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);", false, false, false);</script>
                                                                            </span></span>
                                                                        </div>
                                                                        <div class="bottomBarRight">
                                                                            <span class="publisherShareButtonPlaceholder">
                                                                                <input type="button" title="共享" onclick="chatter.getPublisher().submit();" name="publishersharebutton"
                                                                                    class="zen-btn zen-highlightBtn" value="共享" id="publishersharebutton"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="true" class="ContentPost publisherTemplate ">
                                                                <!--<div class="contentPublisherSlideDown customPanel alignTop"><div class="panel hidden" id="chatterFileStageOne"><div class="panelBody clear"><table  class="chatterPublisherActionsContainer" cellpadding="0" cellspacing="0"><tr><td class="chatterPublisherFileActionContainerLeft"><a href="javascript:" id="chatterLinkFileAction" onclick="chatter.getPublisher().getHandler('ContentPost').setMyFilesFilterFlag(true);chatter.getPublisher().getHandler('ContentPost').showLinkFile(this);" title="从 系统 选择一个文件">从 系统 选择一个文件</a></td><td id="chatterUploadFileActionPanel"><a href="javascript:" id="chatterUploadFileAction" onclick="chatter.getPublisher().getHandler('ContentPost').showFileInfo(this, null, false);" title="从您的电脑上载一个文件">从您的电脑上载一个文件</a><input  class="file hidden" id="hiddenFileBtn" name="hiddenFileBtn" onchange="chatter.getPublisher().getHandler('ContentPost').fileNewInfoUpdate(this);" size="20" type="file" /></td></tr>
</table></div></div><div class="panel hidden" id="chatterFileStageTwo"><div class="clearContentPanelButtonContainer"><a href="javascript: void(0);" class="clearContentPanelButton" onclick="chatter.getPublisher().getHandler('ContentPost').clearPanelState();" title="关闭发行人">&nbsp;</a></div><div class="panelBody clear"><form action="" id="chatterFileForm" method="POST" name="chatterFileForm"><div class="requiredLegendContainer" id="requiredLegend"><span class="requiredLegend"><span class="requiredExampleOuter"><span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span  class="requiredText"> = 必填信息</span></span>&nbsp;</div><table  class="postInput" border="0" cellpadding="0" cellspacing="0"><tr id="chatterFileRow"><td colspan="2"><label for="chatterFile" style="display:none;">&nbsp;</label><div><div class="requiredInput"><div class="requiredBlock"></div><input  class="file" id="chatterFile" name="chatterFile" onchange="chatter.getPublisher().getHandler('ContentPost').fileInfoUpdate(this);" size="24" title="选择文件" type="file" /><div class="errorMsg hidden"></div></div><div class="uploadFileSizeLimit"><span  class="fileSize">最大文件大小为 2&nbsp;GB</span></div></div></td></tr>
<tr class="hidden" id="fileNameRow"><TH scope="row"><label for="fileName"><span class="requiredMark">*</span>名称</label></TH><td><div class="requiredInput"><div class="requiredBlock"></div><input  class="fileFormInputElement" id="fileName" maxlength="260" name="fileName" size="20" title="名称" type="text" value="" /><div class="errorMsg hidden"></div></div></td></tr>
<tr id="descRow"><TH scope="row"><label for="desc">描述</label></TH><td><div><textarea  class="fileFormInputElement" cols="60" id="desc" maxlength="1005" name="desc" rows="4" title="描述" type="text" wrap="soft"></textarea><div class="errorMsg hidden"></div></div></td></tr>
</table><input type="hidden"  id="hiddenFileName" name="hiddenFileName" value="" /><div class="sharedWithOptionPanel hidden" id="sharedWithOptionPanel"><label>您想使用该文件做什么？</label><ul><li class="sharedWithStatusBar"><a href="javascript:void(0);" class="lockItemIcon" id="shareOptionStatus" onclick="Sfdc.AccessibleUploadFileDialog.showShareOptionDropdown(this, {pubLinkEnabled:true});return false;"><span>专用上载</span><img src="/s.gif" alt="" width="1" height="1" class="tinyDownArrowIcon" title="" /></a></li></ul>
</div><input type="hidden"  id="shareOption" name="shareOption" value="pvt" /></form></div></div><div class="panel hidden" id="chatterFileNewStageTwo"><div class="clearContentPanelButtonContainer"><a href="javascript: void(0);" class="clearContentPanelButton" onclick="chatter.getPublisher().getHandler('ContentPost').clearPanelState();" title="关闭发行人">&nbsp;</a></div><div class="panelBody clear"><div id="chatterSelectedFileInfo"><div class="selectedFileDetailsContainer"><div class="imgBlock fileType32x32Icon"><img src="/s.gif" alt="" width="32" height="32" id="chatterSelectedFileTypeIcon" title="" /></div><div class="fileDetails"><div class="title"><span  id="chatterSelectedFileName"></span>&nbsp;<span  class="size" id="chatterSelectedFileSize"></span></div></div></div></div></div></div><div class="panel hidden" id="chatterFileContent"><div class="clearContentPanelButtonContainer"><a href="javascript: void(0);" class="clearContentPanelButton" onclick="chatter.getPublisher().getHandler('ContentPost').clearPanelState();" title="关闭发行人">&nbsp;</a></div><div class="panelBody clear"><div id="chatterExistContentInfo"></div></div></div></div><div class="publisherTextAreaPlaceholder alignCenter"></div><div class="publisherBottomBarPlaceholder"></div>-->
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1hb publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1hb" class="panelBody clear">
                                                                            <script type="text/javascript"></script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1hb"
                                                                            method="POST" id="editPage__09D90000002A1hb" action="/home/home.aspx">
                                                                            <input type="hidden" value="0" id="show_pref" name="show_pref"><input type="hidden"
                                                                                value="000000000000000" id="who_id" name="who_id"><div id="ep____09D90000002A1hb"
                                                                                    class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                    <div class="pbHeader">
                                                                                        <table cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td class="pbTitle">
                                                                                                        <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif" /><h2 class="mainTitle">
                                                                                                        </h2>
                                                                                                    </td>
                                                                                                    <td id="topButtonRow____09D90000002A1hb" class="pbButton">
                                                                                                        &nbsp;
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <div class="pbBody">
                                                                                        <div style="display: none" id="errorDiv_ep____09D90000002A1hb" class="pbError">
                                                                                            错误：无效数据。<br />
                                                                                            请查看下列所有错误消息以纠正数据。</div>
                                                                                        <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk5__09D90000002A1hb">
                                                                                                                主题</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <script type="text/javascript">
                                                                                                                            var cb_tsk5__09D90000002A1hb = new Array();
                                                                                                                            cb_tsk5__09D90000002A1hb[0] = 'Call';
                                                                                                                            cb_tsk5__09D90000002A1hb[1] = 'Send Letter';
                                                                                                                            cb_tsk5__09D90000002A1hb[2] = 'Send Quote';
                                                                                                                            cb_tsk5__09D90000002A1hb[3] = 'Other';
                                                                                                                        </script>
                                                                                                                        <input type="text" size="20" name="tsk5__09D90000002A1hb" maxlength="255" id="tsk5__09D90000002A1hb"><a
                                                                                                                            title="组合框 （新窗口）" size="20" onclick="setLastMousePosition(event)" href="javascript:openPopupFocus('/widg/combobox.aspx?form=editPage__09D90000002A1hb%26field=tsk5__09D90000002A1hb%26display=1%26cnt=4', '_blank', 270, 200, 'width=270,height=200,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=no,directories=no,location=no,dependant=yes', true, true);"><img
                                                                                                                                title="主题 组合框 （新窗口）" onmouseover="this.className = 'comboboxIconOn';this.className = 'comboboxIconOn';"
                                                                                                                                onmouseout="this.className = 'comboboxIcon';this.className = 'comboboxIcon';"
                                                                                                                                onfocus="this.className = 'comboboxIconOn';" onblur="this.className = 'comboboxIcon';"
                                                                                                                                class="comboboxIcon" alt="主题 组合框 （新窗口）" src="/s.gif"></a></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk1__09D90000002A1hb">
                                                                                                                <span class="requiredMark">*</span>被分配人</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="005900000038QVZ" id="tsk1__09D90000002A1hb_lkid" name="tsk1__09D90000002A1hb_lkid"><input
                                                                                                                            type="hidden" value="liu jerryliu" id="tsk1__09D90000002A1hb_lkold" name="tsk1__09D90000002A1hb_lkold"><input
                                                                                                                                type="hidden" value="StandardUserLookup" id="tsk1__09D90000002A1hb_lktp" name="tsk1__09D90000002A1hb_lktp"><input
                                                                                                                                    type="hidden" value="null" id="tsk1__09D90000002A1hb_lkurogid" name="tsk1__09D90000002A1hb_lkurogid"><input
                                                                                                                                        type="hidden" value="0" id="tsk1__09D90000002A1hb_lspf" name="tsk1__09D90000002A1hb_lspf"><input
                                                                                                                                            type="hidden" value="0" id="tsk1__09D90000002A1hb_lspfsub" name="tsk1__09D90000002A1hb_lspfsub"><input
                                                                                                                                                type="hidden" value="0" id="tsk1__09D90000002A1hb_mod" name="tsk1__09D90000002A1hb_mod"><input
                                                                                                                                                    type="hidden" value="if (window.sfdcPage.onChangeOwnerDisplay) {window.sfdcPage.onChangeOwnerDisplay('tsk1__09D90000002A1hb', 'tsk1__09D90000002A1hb_tmuDspGrp', 'tsk1__09D90000002A1hb_lkwgt', 'null', 200, 'IsRecurrence__09D90000002A1hb');}"
                                                                                                                                                    name="tsk1__09D90000002A1hb_onpk" id="tsk1__09D90000002A1hb_onpk"><span class="lookupInput"><input
                                                                                                                                                        type="text" value="liu jerryliu" size="20" onchange="getElementByIdCS('tsk1__09D90000002A1hb_lkid').value='';getElementByIdCS('tsk1__09D90000002A1hb_mod').value='1';"
                                                                                                                                                        name="tsk1__09D90000002A1hb" maxlength="2147483647" id="tsk1__09D90000002A1hb"><a
                                                                                                                                                            title="被分配人 查找（新窗口）" onclick="setLastMousePosition(event)" id="tsk1__09D90000002A1hb_lkwgt"
                                                                                                                                                            href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hb%26lknm=tsk1__09D90000002A1hb%26tabbedTmuLookup=1%26lktp=' %2B getElementByIdCS('tsk1__09D90000002A1hb_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('tsk1__09D90000002A1hb').value.substring(0, 80)))"><img
                                                                                                                                                                title="被分配人 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                                onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                                onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="被分配人 查找（新窗口）"
                                                                                                                                                                src="/s.gif"></a><a onclick="setLastMousePosition(event)" style="display: none" title="被分配人 查找（新窗口）"
                                                                                                                                                                    id="tsk1__09D90000002A1hb_lkwgtm" class="readOnly" href="javascript: openLookup('/ui/core/activity/TaskOwnerUROGLookup/e?lknm=tsk1__09D90000002A1hb%26lknm=tsk1__09D90000002A1hb%26lkfm=editPage__09D90000002A1hb%26tabbedTmuLookup=1%26lktp=' %2B getElementByIdCS('tsk1__09D90000002A1hb_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('tsk1__09D90000002A1hb').value.substring(0, 80)))"><img
                                                                                                                                                                        title="被分配人 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                                        onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                                                                                                                        onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';"
                                                                                                                                                                        class="lookupIcon" alt="被分配人 查找（新窗口）" src="/s.gif"></a><span style="display: none"
                                                                                                                                                                            id="tsk1__09D90000002A1hb_tmuDspGrp"><span id="tsk1__09D90000002A1hb_dsp" class="readOnly">liu
                                                                                                                                                                                jerryliu</span><span id="tsk1__09D90000002A1hb_sum" class="totalSummary">总计 0 任务</span></span></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk4__09D90000002A1hb">
                                                                                                                到期日期</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <span class="dateInput dateOnlyInput">
                                                                                                                            <input type="text" size="12" onfocus="DatePicker.pickDate(true, 'tsk4__09D90000002A1hb', false);"
                                                                                                                                onchange="ActivityFunction.updateDates('tsk4__09D90000002A1hb', [&quot;RecurrenceStartDateOnly__09D90000002A1hb&quot;,&quot;reminder_dt__09D90000002A1hb&quot;], false);"
                                                                                                                                name="tsk4__09D90000002A1hb" id="tsk4__09D90000002A1hb"><span class="dateFormat">[&nbsp;<a
                                                                                                                                    href="javascript:DatePicker.insertDate('2014-9-15', 'tsk4__09D90000002A1hb', true);">2014-9-15</a>&nbsp;]</span></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk2__09D90000002A1hb_top">
                                                                                                                名称</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div name="tsk2__09D90000002A1hb_top" id="tsk2__09D90000002A1hb_top" class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <select title="搜索范围" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('tsk2__09D90000002A1hb',false);ActivityFunction.adjwht('tsk2__09D90000002A1hb_mlktp');"
                                                                                                                            name="tsk2__09D90000002A1hb_mlktp" id="tsk2__09D90000002A1hb_mlktp">
                                                                                                                            <option selected="selected" value="003">联系人</option>
                                                                                                                            <option value="00Q">潜在客户</option>
                                                                                                                        </select></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="000000000000000" id="tsk2__09D90000002A1hb_lkid" name="tsk2__09D90000002A1hb_lkid"><input
                                                                                                                            type="hidden" value="null" id="tsk2__09D90000002A1hb_lkold" name="tsk2__09D90000002A1hb_lkold"><input
                                                                                                                                type="hidden" value="003" id="tsk2__09D90000002A1hb_lktp" name="tsk2__09D90000002A1hb_lktp"><input
                                                                                                                                    type="hidden" value="0" id="tsk2__09D90000002A1hb_lspf" name="tsk2__09D90000002A1hb_lspf"><input
                                                                                                                                        type="hidden" value="0" id="tsk2__09D90000002A1hb_lspfsub" name="tsk2__09D90000002A1hb_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="tsk2__09D90000002A1hb_mod" name="tsk2__09D90000002A1hb_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" title="名称" size="20" onchange="getElementByIdCS('tsk2__09D90000002A1hb_lkid').value='';getElementByIdCS('tsk2__09D90000002A1hb_mod').value='1';Sfdc.Activity.ManyWhoFunction.clearManyWhoHtmlFields()"
                                                                                                                                                    name="tsk2__09D90000002A1hb" maxlength="255" id="tsk2__09D90000002A1hb"><a title="名称 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="whobtn" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hb%26lknm=tsk2__09D90000002A1hb%26lktp=' %2B getElementByIdCS('tsk2__09D90000002A1hb_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('tsk2__09D90000002A1hb').value.substring(0, 80)))"><img
                                                                                                                                                            title="名称 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="名称 查找（新窗口）" src="/s.gif"></a></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk3__09D90000002A1hb_top">
                                                                                                                相关项</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div name="tsk3__09D90000002A1hb_top" id="tsk3__09D90000002A1hb_top" class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <select title="搜索范围" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('tsk3__09D90000002A1hb',false);"
                                                                                                                            name="tsk3__09D90000002A1hb_mlktp" id="tsk3__09D90000002A1hb_mlktp">
                                                                                                                            <option value="0Q0">报价</option>
                                                                                                                            <option value="01t">产品</option>
                                                                                                                            <option value="801">订单</option>
                                                                                                                            <option value="500">个案</option>
                                                                                                                            <option value="800">合同</option>
                                                                                                                            <option value="501">解决方案</option>
                                                                                                                            <option value="001">客户</option>
                                                                                                                            <option value="701">市场活动</option>
                                                                                                                            <option selected="selected" value="006">业务机会</option>
                                                                                                                            <option value="02i">资产</option>
                                                                                                                        </select></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="000000000000000" id="tsk3__09D90000002A1hb_lkid" name="tsk3__09D90000002A1hb_lkid"><input
                                                                                                                            type="hidden" value="null" id="tsk3__09D90000002A1hb_lkold" name="tsk3__09D90000002A1hb_lkold"><input
                                                                                                                                type="hidden" value="006" id="tsk3__09D90000002A1hb_lktp" name="tsk3__09D90000002A1hb_lktp"><input
                                                                                                                                    type="hidden" value="0" id="tsk3__09D90000002A1hb_lspf" name="tsk3__09D90000002A1hb_lspf"><input
                                                                                                                                        type="hidden" value="0" id="tsk3__09D90000002A1hb_lspfsub" name="tsk3__09D90000002A1hb_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="tsk3__09D90000002A1hb_mod" name="tsk3__09D90000002A1hb_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" title="相关项" size="20" onchange="getElementByIdCS('tsk3__09D90000002A1hb_lkid').value='';getElementByIdCS('tsk3__09D90000002A1hb_mod').value='1';"
                                                                                                                                                    name="tsk3__09D90000002A1hb" maxlength="255" id="tsk3__09D90000002A1hb"><a title="相关项 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="whtbtn" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hb%26lknm=tsk3__09D90000002A1hb%26sn=1%26lktp=' %2B getElementByIdCS('tsk3__09D90000002A1hb_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('tsk3__09D90000002A1hb').value.substring(0, 80)))"><img
                                                                                                                                                            title="相关项 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="相关项 查找（新窗口）"
                                                                                                                                                            src="/s.gif"></a></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="pbFooter secondaryPalette">
                                                                                        <div class="bg">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1hb', 'editPage__09D90000002A1hb', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1hc publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1hc" class="panelBody clear">
                                                                            <script type="text/javascript">
                                                                            </script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1hc"
                                                                            method="POST" id="editPage__09D90000002A1hc" action="/home/home.aspx">
                                                                            <div id="ep____09D90000002A1hc" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                <div class="pbHeader">
                                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td class="pbTitle">
                                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td id="topButtonRow____09D90000002A1hc" class="pbButton">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="pbBody">
                                                                                    <div style="display: none" id="errorDiv_ep____09D90000002A1hc" class="pbError">
                                                                                        错误：无效数据。<br />
                                                                                        请查看下列所有错误消息以纠正数据。</div>
                                                                                    <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_lastcon2__09D90000002A1hc">
                                                                                                            <span class="requiredMark">*</span>姓氏</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="name_lastcon2__09D90000002A1hc" maxlength="80"
                                                                                                                        id="name_lastcon2__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="con15__09D90000002A1hc">
                                                                                                            电子邮件</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="con15__09D90000002A1hc" maxlength="80" id="con15__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_firstcon2__09D90000002A1hc">
                                                                                                            名字</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="name_firstcon2__09D90000002A1hc" maxlength="40"
                                                                                                                        id="name_firstcon2__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <select title="称谓" name="name_salutationcon2__09D90000002A1hc" id="name_salutationcon2__09D90000002A1hc">
                                                                                                                        <option value="">--无--</option>
                                                                                                                        <option value="Mr.">Mr.</option>
                                                                                                                        <option value="Ms.">Ms.</option>
                                                                                                                        <option value="Mrs.">Mrs.</option>
                                                                                                                        <option value="Dr.">Dr.</option>
                                                                                                                        <option value="Prof.">Prof.</option>
                                                                                                                    </select></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="con4__09D90000002A1hc">
                                                                                                            客户名</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="hidden" value="000000000000000" id="con4__09D90000002A1hc_lkid" name="con4__09D90000002A1hc_lkid"><input
                                                                                                                        type="hidden" value="null" id="con4__09D90000002A1hc_lkold" name="con4__09D90000002A1hc_lkold"><input
                                                                                                                            type="hidden" value="001" id="con4__09D90000002A1hc_lktp" name="con4__09D90000002A1hc_lktp"><input
                                                                                                                                type="hidden" value="0" id="con4__09D90000002A1hc_lspf" name="con4__09D90000002A1hc_lspf"><input
                                                                                                                                    type="hidden" value="0" id="con4__09D90000002A1hc_lspfsub" name="con4__09D90000002A1hc_lspfsub"><input
                                                                                                                                        type="hidden" value="0" id="con4__09D90000002A1hc_mod" name="con4__09D90000002A1hc_mod"><span
                                                                                                                                            class="lookupInput"><input type="text" size="20" onchange="getElementByIdCS('con4__09D90000002A1hc_lkid').value='';getElementByIdCS('con4__09D90000002A1hc_mod').value='1';"
                                                                                                                                                name="con4__09D90000002A1hc" maxlength="255" id="con4__09D90000002A1hc"><a title="客户名 查找（新窗口）"
                                                                                                                                                    onclick="setLastMousePosition(event)" id="con4__09D90000002A1hc_lkwgt" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hc%26lknm=con4__09D90000002A1hc%26lkrf=%26lktp=' %2B getElementByIdCS('con4__09D90000002A1hc_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('con4__09D90000002A1hc').value.substring(0, 80)))"><img
                                                                                                                                                        title="客户名 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                        onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                        onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="客户名 查找（新窗口）"
                                                                                                                                                        src="/s.gif"></a></span></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_middlecon2__09D90000002A1hc">
                                                                                                            中间名</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="name_middlecon2__09D90000002A1hc" maxlength="40"
                                                                                                                        id="name_middlecon2__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_suffixcon2__09D90000002A1hc">
                                                                                                            称谓</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="10" name="name_suffixcon2__09D90000002A1hc" maxlength="40"
                                                                                                                        id="name_suffixcon2__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="con10__09D90000002A1hc">
                                                                                                            电话</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="con10__09D90000002A1hc" maxlength="40" id="con10__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="con5__09D90000002A1hc">
                                                                                                            职务</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="con5__09D90000002A1hc" maxlength="128" id="con5__09D90000002A1hc"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="pbFooter secondaryPalette">
                                                                                    <div class="bg">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1hc', 'editPage__09D90000002A1hc', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1hd publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1hd" class="panelBody clear">
                                                                            <script type="text/javascript">
                                                                            </script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1hd"
                                                                            method="POST" id="editPage__09D90000002A1hd" action="/home/home.aspx">
                                                                            <input type="hidden" value="0" id="show_pref" name="show_pref"><input type="hidden"
                                                                                value="000000000000000" id="who_id" name="who_id"><div id="ep____09D90000002A1hd"
                                                                                    class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                    <div class="pbHeader">
                                                                                        <table cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td class="pbTitle">
                                                                                                        <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                                        </h2>
                                                                                                    </td>
                                                                                                    <td id="topButtonRow____09D90000002A1hd" class="pbButton">
                                                                                                        &nbsp;
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <div class="pbBody">
                                                                                        <div style="display: none" id="errorDiv_ep____09D90000002A1hd" class="pbError">
                                                                                            错误：无效数据。<br>
                                                                                            请查看下列所有错误消息以纠正数据。</div>
                                                                                        <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk5__09D90000002A1hd">
                                                                                                                主题</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <script type="text/javascript">
                                                                                                                            var cb_tsk5__09D90000002A1hd = new Array();
                                                                                                                            cb_tsk5__09D90000002A1hd[0] = 'Call';
                                                                                                                            cb_tsk5__09D90000002A1hd[1] = 'Send Letter';
                                                                                                                            cb_tsk5__09D90000002A1hd[2] = 'Send Quote';
                                                                                                                            cb_tsk5__09D90000002A1hd[3] = 'Other';
                                                                                                                        </script>
                                                                                                                        <input type="text" value="Call" size="20" name="tsk5__09D90000002A1hd" maxlength="255"
                                                                                                                            id="tsk5__09D90000002A1hd"><a value="Call" title="组合框 （新窗口）" size="20" onclick="setLastMousePosition(event)"
                                                                                                                                href="javascript:openPopupFocus('/widg/combobox.jsp?form=editPage__09D90000002A1hd%26field=tsk5__09D90000002A1hd%26display=1%26cnt=4', '_blank', 270, 200, 'width=270,height=200,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=no,directories=no,location=no,dependant=yes', true, true);"><img
                                                                                                                                    title="主题 组合框 （新窗口）" onmouseover="this.className = 'comboboxIconOn';this.className = 'comboboxIconOn';"
                                                                                                                                    onmouseout="this.className = 'comboboxIcon';this.className = 'comboboxIcon';"
                                                                                                                                    onfocus="this.className = 'comboboxIconOn';" onblur="this.className = 'comboboxIcon';"
                                                                                                                                    class="comboboxIcon" alt="主题 组合框 （新窗口）" src="/s.gif"></a></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk6__09D90000002A1hd">
                                                                                                                留言</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <textarea wrap="soft" type="text" onmousedown="handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');"
                                                                                                                            onkeyup="handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');"
                                                                                                                            onkeydown="handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');"
                                                                                                                            onclick="handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');"
                                                                                                                            onchange="handleTextAreaElementChangeWithByteCheck('tsk6__09D90000002A1hd', 32000, 0, '剩余', '超出极限');"
                                                                                                                            name="tsk6__09D90000002A1hd" maxlength="32000" id="tsk6__09D90000002A1hd"></textarea></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk2__09D90000002A1hd_top">
                                                                                                                名称</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div name="tsk2__09D90000002A1hd_top" id="tsk2__09D90000002A1hd_top" class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <select title="搜索范围" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('tsk2__09D90000002A1hd',false);ActivityFunction.adjwht('tsk2__09D90000002A1hd_mlktp');"
                                                                                                                            name="tsk2__09D90000002A1hd_mlktp" id="tsk2__09D90000002A1hd_mlktp">
                                                                                                                            <option selected="selected" value="003">联系人</option>
                                                                                                                            <option value="00Q">潜在客户</option>
                                                                                                                        </select></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="000000000000000" id="tsk2__09D90000002A1hd_lkid" name="tsk2__09D90000002A1hd_lkid"><input
                                                                                                                            type="hidden" value="null" id="tsk2__09D90000002A1hd_lkold" name="tsk2__09D90000002A1hd_lkold"><input
                                                                                                                                type="hidden" value="003" id="tsk2__09D90000002A1hd_lktp" name="tsk2__09D90000002A1hd_lktp"><input
                                                                                                                                    type="hidden" value="0" id="tsk2__09D90000002A1hd_lspf" name="tsk2__09D90000002A1hd_lspf"><input
                                                                                                                                        type="hidden" value="0" id="tsk2__09D90000002A1hd_lspfsub" name="tsk2__09D90000002A1hd_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="tsk2__09D90000002A1hd_mod" name="tsk2__09D90000002A1hd_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" title="名称" size="20" onchange="getElementByIdCS('tsk2__09D90000002A1hd_lkid').value='';getElementByIdCS('tsk2__09D90000002A1hd_mod').value='1';Sfdc.Activity.ManyWhoFunction.clearManyWhoHtmlFields()"
                                                                                                                                                    name="tsk2__09D90000002A1hd" maxlength="255" id="tsk2__09D90000002A1hd"><a title="名称 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="whobtn" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hd%26lknm=tsk2__09D90000002A1hd%26lktp=' %2B getElementByIdCS('tsk2__09D90000002A1hd_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('tsk2__09D90000002A1hd').value.substring(0, 80)))"><img
                                                                                                                                                            title="名称 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="名称 查找（新窗口）" src="/s.gif"></a></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="tsk3__09D90000002A1hd_top">
                                                                                                                相关项</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div name="tsk3__09D90000002A1hd_top" id="tsk3__09D90000002A1hd_top" class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <select title="搜索范围" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('tsk3__09D90000002A1hd',false);"
                                                                                                                            name="tsk3__09D90000002A1hd_mlktp" id="tsk3__09D90000002A1hd_mlktp">
                                                                                                                            <option value="0Q0">报价</option>
                                                                                                                            <option value="01t">产品</option>
                                                                                                                            <option value="801">订单</option>
                                                                                                                            <option value="500">个案</option>
                                                                                                                            <option value="800">合同</option>
                                                                                                                            <option value="501">解决方案</option>
                                                                                                                            <option value="001">客户</option>
                                                                                                                            <option value="701">市场活动</option>
                                                                                                                            <option selected="selected" value="006">业务机会</option>
                                                                                                                            <option value="02i">资产</option>
                                                                                                                        </select></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="000000000000000" id="tsk3__09D90000002A1hd_lkid" name="tsk3__09D90000002A1hd_lkid"><input
                                                                                                                            type="hidden" value="null" id="tsk3__09D90000002A1hd_lkold" name="tsk3__09D90000002A1hd_lkold"><input
                                                                                                                                type="hidden" value="006" id="tsk3__09D90000002A1hd_lktp" name="tsk3__09D90000002A1hd_lktp"><input
                                                                                                                                    type="hidden" value="0" id="tsk3__09D90000002A1hd_lspf" name="tsk3__09D90000002A1hd_lspf"><input
                                                                                                                                        type="hidden" value="0" id="tsk3__09D90000002A1hd_lspfsub" name="tsk3__09D90000002A1hd_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="tsk3__09D90000002A1hd_mod" name="tsk3__09D90000002A1hd_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" title="相关项" size="20" onchange="getElementByIdCS('tsk3__09D90000002A1hd_lkid').value='';getElementByIdCS('tsk3__09D90000002A1hd_mod').value='1';"
                                                                                                                                                    name="tsk3__09D90000002A1hd" maxlength="255" id="tsk3__09D90000002A1hd"><a title="相关项 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="whtbtn" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hd%26lknm=tsk3__09D90000002A1hd%26sn=1%26lktp=' %2B getElementByIdCS('tsk3__09D90000002A1hd_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('tsk3__09D90000002A1hd').value.substring(0, 80)))"><img
                                                                                                                                                            title="相关项 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="相关项 查找（新窗口）"
                                                                                                                                                            src="/s.gif"></a></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="pbFooter secondaryPalette">
                                                                                        <div class="bg">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1hd', 'editPage__09D90000002A1hd', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1he publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1he" class="panelBody clear">
                                                                            <script type="text/javascript">
                                                                                Sfdc.Dom.onload(function () { Sfdc.Resource.addJavaScript('/jslibrary/Opportunity.js'); });
                                                                                window.Sfdc = window.Sfdc || {};

                                                                                window.Sfdc.Sales = window.Sfdc.Sales || {};
                                                                                window.Sfdc.Sales.Opportunity = window.Sfdc.Sales.Opportunity || {};
                                                                                Sfdc.Sales.Opportunity.oppo = Sfdc.Sales.Opportunity.oppo || {};
                                                                                Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'] = { '__09D90000002A1he': {} };
                                                                                Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].pct = { '': '0', 'Prospecting': '10', 'Qualification': '10', 'Needs Analysis': '20', 'Value Proposition': '50', 'Id. Decision Makers': '60', 'Perception Analysis': '70', 'Proposal/Price Quote': '75', 'Negotiation/Review': '90', 'Closed Won': '100', 'Closed Lost': '0' };
                                                                                Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].fctCat = { '': 'Pipeline', 'Prospecting': 'Pipeline', 'Qualification': 'Pipeline', 'Needs Analysis': 'Pipeline', 'Value Proposition': 'Pipeline', 'Id. Decision Makers': 'Pipeline', 'Perception Analysis': 'Pipeline', 'Proposal/Price Quote': 'Pipeline', 'Negotiation/Review': 'Pipeline', 'Closed Won': 'Closed', 'Closed Lost': 'Omitted' };
                                                                                Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].fctClosedWon = { '': '0', 'Prospecting': '0', 'Qualification': '0', 'Needs Analysis': '0', 'Value Proposition': '0', 'Id. Decision Makers': '0', 'Perception Analysis': '0', 'Proposal/Price Quote': '0', 'Negotiation/Review': '0', 'Closed Won': '2', 'Closed Lost': '1' };
                                                                                Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].allOptions = { '0': [new Option('Omitted', 'Omitted'), new Option('Pipeline', 'Pipeline'), new Option('Best Case', 'Best Case'), new Option('Commit', 'Commit')], '1': [new Option('Omitted', 'Omitted')], '2': [new Option('Omitted', 'Omitted'), new Option('Closed', 'Closed')] };
                                                                                Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].allOptionsReference = { '0': Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].allOptions['0'], '1': Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].allOptions['1'], '2': Sfdc.Sales.Opportunity.oppo['__09D90000002A1he'].allOptions['2'] };

                                                                                function setForecastCategory__09D90000002A1he() {
                                                                                    Sfdc.Sales.Opportunity.setForecastCategory('ForecastCategoryName__09D90000002A1he', 'opp11__09D90000002A1he', '__09D90000002A1he');
                                                                                }

                                                                                function modifyForecastCategorySelect__09D90000002A1he() {
                                                                                    Sfdc.Sales.Opportunity.modifyForecastCategorySelect('ForecastCategoryName__09D90000002A1he', 'opp11__09D90000002A1he', '__09D90000002A1he');
                                                                                }
                                                                            </script>
                                                                            <script src="/static/js/picklist.js"></script>
                                                                            <script src="/servlet/servlet.picklist?e=Opportunity&amp;h=U1%2BjDX4l3YpJ8VNneXNOyChhCNEV2lBF1387QYXY95A=&amp;v=1410689799000&amp;layout=0EH90000001QzPZ&amp;mo=EDITLOAD&amp;esc=HTML&amp;l=zh_CN&amp;pr=1.25&amp;t=0"></script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1he"
                                                                            method="POST" id="editPage__09D90000002A1he" action="/home/home.jsp">
                                                                            <div id="ep____09D90000002A1he" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                <div class="pbHeader">
                                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td class="pbTitle">
                                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td id="topButtonRow____09D90000002A1he" class="pbButton">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="pbBody">
                                                                                    <div style="display: none" id="errorDiv_ep____09D90000002A1he" class="pbError">
                                                                                        错误：无效数据。<br />
                                                                                        请查看下列所有错误消息以纠正数据。</div>
                                                                                    <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="opp3__09D90000002A1he">
                                                                                                            <span class="requiredMark">*</span>业务机会名称</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="opp3__09D90000002A1he" maxlength="120" id="opp3__09D90000002A1he"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="opp4__09D90000002A1he">
                                                                                                            客户名</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="hidden" value="000000000000000" id="opp4__09D90000002A1he_lkid" name="opp4__09D90000002A1he_lkid"><input
                                                                                                                        type="hidden" value="null" id="opp4__09D90000002A1he_lkold" name="opp4__09D90000002A1he_lkold"><input
                                                                                                                            type="hidden" value="001" id="opp4__09D90000002A1he_lktp" name="opp4__09D90000002A1he_lktp"><input
                                                                                                                                type="hidden" value="0" id="opp4__09D90000002A1he_lspf" name="opp4__09D90000002A1he_lspf"><input
                                                                                                                                    type="hidden" value="0" id="opp4__09D90000002A1he_lspfsub" name="opp4__09D90000002A1he_lspfsub"><input
                                                                                                                                        type="hidden" value="0" id="opp4__09D90000002A1he_mod" name="opp4__09D90000002A1he_mod"><span
                                                                                                                                            class="lookupInput"><input type="text" size="20" onchange="getElementByIdCS('opp4__09D90000002A1he_lkid').value='';getElementByIdCS('opp4__09D90000002A1he_mod').value='1';"
                                                                                                                                                name="opp4__09D90000002A1he" maxlength="255" id="opp4__09D90000002A1he"><a title="客户名 查找（新窗口）"
                                                                                                                                                    onclick="setLastMousePosition(event)" id="opp4__09D90000002A1he_lkwgt" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1he%26lknm=opp4__09D90000002A1he%26lktp=' %2B getElementByIdCS('opp4__09D90000002A1he_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('opp4__09D90000002A1he').value.substring(0, 80)))"><img
                                                                                                                                                        title="客户名 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                        onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                        onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="客户名 查找（新窗口）"
                                                                                                                                                        src="/s.gif"></a></span></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="opp7__09D90000002A1he">
                                                                                                            金额</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="opp7__09D90000002A1he" id="opp7__09D90000002A1he"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="opp9__09D90000002A1he">
                                                                                                            <span class="requiredMark">*</span>结束日期</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <span class="dateInput dateOnlyInput">
                                                                                                                        <input type="text" value="2014-10-15" size="12" onfocus="DatePicker.pickDate(false, 'opp9__09D90000002A1he', false);"
                                                                                                                            name="opp9__09D90000002A1he" id="opp9__09D90000002A1he"><span class="dateFormat">[&nbsp;<a
                                                                                                                                href="javascript:DatePicker.insertDate('2014-9-15', 'opp9__09D90000002A1he', true);">2014-9-15</a>&nbsp;]</span></span></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="opp11__09D90000002A1he">
                                                                                                            <span class="requiredMark">*</span>阶段</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <span>
                                                                                                                        <select name="opp11__09D90000002A1he" id="opp11__09D90000002A1he">
                                                                                                                            <option value="">--无--</option>
                                                                                                                            <option value="Prospecting">Prospecting</option>
                                                                                                                            <option value="Qualification">Qualification</option>
                                                                                                                            <option value="Needs Analysis">Needs Analysis</option>
                                                                                                                            <option value="Value Proposition">Value Proposition</option>
                                                                                                                            <option value="Id. Decision Makers">Id. Decision Makers</option>
                                                                                                                            <option value="Perception Analysis">Perception Analysis</option>
                                                                                                                            <option value="Proposal/Price Quote">Proposal/Price Quote</option>
                                                                                                                            <option value="Negotiation/Review">Negotiation/Review</option>
                                                                                                                            <option value="Closed Won">Closed Won</option>
                                                                                                                            <option value="Closed Lost">Closed Lost</option>
                                                                                                                        </select></span><script>                                                                                                                                            new picklist('opp11__09D90000002A1he', '23', null, ['', ''], ' id=\"opp11__09D90000002A1he\" name=\"opp11__09D90000002A1he\"', false, true);</script>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="pbFooter secondaryPalette">
                                                                                    <div class="bg">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1he', 'editPage__09D90000002A1he', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1hf publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1hf" class="panelBody clear">
                                                                            <script type="text/javascript">
                                                                            </script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1hf"
                                                                            method="POST" id="editPage__09D90000002A1hf" action="/home/home.aspx">
                                                                            <div id="ep____09D90000002A1hf" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                <div class="pbHeader">
                                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td class="pbTitle">
                                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td id="topButtonRow____09D90000002A1hf" class="pbButton">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="pbBody">
                                                                                    <div style="display: none" id="errorDiv_ep____09D90000002A1hf" class="pbError">
                                                                                        错误：无效数据。<br>
                                                                                        请查看下列所有错误消息以纠正数据。</div>
                                                                                    <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_lastlea2__09D90000002A1hf">
                                                                                                            <span class="requiredMark">*</span>姓</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="27" name="name_lastlea2__09D90000002A1hf" maxlength="80"
                                                                                                                        id="name_lastlea2__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="lea11__09D90000002A1hf">
                                                                                                            电子邮件</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="lea11__09D90000002A1hf" maxlength="80" id="lea11__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_firstlea2__09D90000002A1hf">
                                                                                                            名</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="name_firstlea2__09D90000002A1hf" maxlength="40"
                                                                                                                        id="name_firstlea2__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <select title="称谓" name="name_salutationlea2__09D90000002A1hf" id="name_salutationlea2__09D90000002A1hf">
                                                                                                                        <option value="">--无--</option>
                                                                                                                        <option value="Mr.">Mr.</option>
                                                                                                                        <option value="Ms.">Ms.</option>
                                                                                                                        <option value="Mrs.">Mrs.</option>
                                                                                                                        <option value="Dr.">Dr.</option>
                                                                                                                        <option value="Prof.">Prof.</option>
                                                                                                                    </select></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="lea8__09D90000002A1hf">
                                                                                                            电话</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="lea8__09D90000002A1hf" maxlength="40" id="lea8__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of2 zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_middlelea2__09D90000002A1hf">
                                                                                                            中间名</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="name_middlelea2__09D90000002A1hf" maxlength="40"
                                                                                                                        id="name_middlelea2__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="lea4__09D90000002A1hf">
                                                                                                            职务</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="lea4__09D90000002A1hf" maxlength="128" id="lea4__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="name_suffixlea2__09D90000002A1hf">
                                                                                                            称谓</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="10" name="name_suffixlea2__09D90000002A1hf" maxlength="40"
                                                                                                                        id="name_suffixlea2__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="lea3__09D90000002A1hf">
                                                                                                            <span class="requiredMark">*</span>公司</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="27" name="lea3__09D90000002A1hf" maxlength="255" id="lea3__09D90000002A1hf"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="pbFooter secondaryPalette">
                                                                                    <div class="bg">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1hf', 'editPage__09D90000002A1hf', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1hg publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1hg" class="panelBody clear">
                                                                            <script type="text/javascript">
                                                                                function updateOpener(addnl, mode) {
                                                                                    document.editPage__09D90000002A1hg.hdnaddn.value = addnl;
                                                                                    document.editPage__09D90000002A1hg.hdnrefr.value = mode;
                                                                                    document.editPage__09D90000002A1hg.submit();
                                                                                }
                                                                                function removeInvitee(id) {
                                                                                    updateOpener(id, '1', []);
                                                                                }
                                                                                function ivwh(elemId, otherElemId) {
                                                                                    var id = document.getElementById(elemId).value; if (otherElemId != null && (id == '' || id == '000000000000000')) { id = document.getElementById(otherElemId).value; } if (id != null && id != '' && id != '000000000000000') {
                                                                                        updateOpener(id, '0', []);
                                                                                    }
                                                                                };</script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1hg"
                                                                            method="POST" id="editPage__09D90000002A1hg" action="/home/home.aspx">
                                                                            <input type="hidden" value="" id="focusThisFieldOnLoad" name="focusThisFieldOnLoad"><input
                                                                                type="hidden" value="000000000000000" id="who_id" name="who_id"><div id="ep____09D90000002A1hg"
                                                                                    class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                    <div class="pbHeader">
                                                                                        <table cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td class="pbTitle">
                                                                                                        <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                                        </h2>
                                                                                                    </td>
                                                                                                    <td id="topButtonRow____09D90000002A1hg" class="pbButton">
                                                                                                        &nbsp;
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <div class="pbBody">
                                                                                        <div style="display: none" id="errorDiv_ep____09D90000002A1hg" class="pbError">
                                                                                            错误：无效数据。<br>
                                                                                            请查看下列所有错误消息以纠正数据。</div>
                                                                                        <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="evt5__09D90000002A1hg">
                                                                                                                主题</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <script type="text/javascript">
                                                                                                                            var cb_evt5__09D90000002A1hg = new Array();
                                                                                                                            cb_evt5__09D90000002A1hg[0] = 'Call';
                                                                                                                            cb_evt5__09D90000002A1hg[1] = 'Email';
                                                                                                                            cb_evt5__09D90000002A1hg[2] = 'Meeting';
                                                                                                                            cb_evt5__09D90000002A1hg[3] = 'Send Letter/Quote';
                                                                                                                            cb_evt5__09D90000002A1hg[4] = 'Other';
                                                                                                                        </script>
                                                                                                                        <input type="text" size="20" name="evt5__09D90000002A1hg" maxlength="255" id="evt5__09D90000002A1hg"><a
                                                                                                                            title="组合框 （新窗口）" size="20" onclick="setLastMousePosition(event)" href="javascript:openPopupFocus('/widg/combobox.jsp?form=editPage__09D90000002A1hg%26field=evt5__09D90000002A1hg%26display=1%26cnt=5', '_blank', 270, 200, 'width=270,height=200,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=no,directories=no,location=no,dependant=yes', true, true);"><img
                                                                                                                                title="主题 组合框 （新窗口）" onmouseover="this.className = 'comboboxIconOn';this.className = 'comboboxIconOn';"
                                                                                                                                onmouseout="this.className = 'comboboxIcon';this.className = 'comboboxIcon';"
                                                                                                                                onfocus="this.className = 'comboboxIconOn';" onblur="this.className = 'comboboxIcon';"
                                                                                                                                class="comboboxIcon" alt="主题 组合框 （新窗口）" src="/s.gif"></a></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="evt2__09D90000002A1hg_top">
                                                                                                                名称</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div name="evt2__09D90000002A1hg_top" id="evt2__09D90000002A1hg_top" class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <select title="搜索范围" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('evt2__09D90000002A1hg',false);ActivityFunction.adjwht('evt2__09D90000002A1hg_mlktp');"
                                                                                                                            name="evt2__09D90000002A1hg_mlktp" id="evt2__09D90000002A1hg_mlktp">
                                                                                                                            <option selected="selected" value="003">联系人</option>
                                                                                                                            <option value="00Q">潜在客户</option>
                                                                                                                        </select></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="000000000000000" id="evt2__09D90000002A1hg_lkid" name="evt2__09D90000002A1hg_lkid"><input
                                                                                                                            type="hidden" value="null" id="evt2__09D90000002A1hg_lkold" name="evt2__09D90000002A1hg_lkold"><input
                                                                                                                                type="hidden" value="003" id="evt2__09D90000002A1hg_lktp" name="evt2__09D90000002A1hg_lktp"><input
                                                                                                                                    type="hidden" value="0" id="evt2__09D90000002A1hg_lspf" name="evt2__09D90000002A1hg_lspf"><input
                                                                                                                                        type="hidden" value="0" id="evt2__09D90000002A1hg_lspfsub" name="evt2__09D90000002A1hg_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="evt2__09D90000002A1hg_mod" name="evt2__09D90000002A1hg_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" title="名称" size="20" onchange="getElementByIdCS('evt2__09D90000002A1hg_lkid').value='';getElementByIdCS('evt2__09D90000002A1hg_mod').value='1';Sfdc.Activity.ManyWhoFunction.clearManyWhoHtmlFields()"
                                                                                                                                                    name="evt2__09D90000002A1hg" maxlength="255" id="evt2__09D90000002A1hg"><a title="名称 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="whobtn" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hg%26lknm=evt2__09D90000002A1hg%26lktp=' %2B getElementByIdCS('evt2__09D90000002A1hg_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('evt2__09D90000002A1hg').value.substring(0, 80)))"><img
                                                                                                                                                            title="名称 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="名称 查找（新窗口）" src="/s.gif"></a></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="evt12__09D90000002A1hg">
                                                                                                                位置</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="text" size="20" name="evt12__09D90000002A1hg" maxlength="255" id="evt12__09D90000002A1hg"></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="evt3__09D90000002A1hg_top">
                                                                                                                相关项</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div name="evt3__09D90000002A1hg_top" id="evt3__09D90000002A1hg_top" class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <select title="搜索范围" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('evt3__09D90000002A1hg',false);"
                                                                                                                            name="evt3__09D90000002A1hg_mlktp" id="evt3__09D90000002A1hg_mlktp">
                                                                                                                            <option value="0Q0">报价</option>
                                                                                                                            <option value="01t">产品</option>
                                                                                                                            <option value="801">订单</option>
                                                                                                                            <option value="500">个案</option>
                                                                                                                            <option value="800">合同</option>
                                                                                                                            <option value="501">解决方案</option>
                                                                                                                            <option value="001">客户</option>
                                                                                                                            <option value="701">市场活动</option>
                                                                                                                            <option selected="selected" value="006">业务机会</option>
                                                                                                                            <option value="02i">资产</option>
                                                                                                                        </select></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="000000000000000" id="evt3__09D90000002A1hg_lkid" name="evt3__09D90000002A1hg_lkid"><input
                                                                                                                            type="hidden" value="null" id="evt3__09D90000002A1hg_lkold" name="evt3__09D90000002A1hg_lkold"><input
                                                                                                                                type="hidden" value="006" id="evt3__09D90000002A1hg_lktp" name="evt3__09D90000002A1hg_lktp"><input
                                                                                                                                    type="hidden" value="0" id="evt3__09D90000002A1hg_lspf" name="evt3__09D90000002A1hg_lspf"><input
                                                                                                                                        type="hidden" value="0" id="evt3__09D90000002A1hg_lspfsub" name="evt3__09D90000002A1hg_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="evt3__09D90000002A1hg_mod" name="evt3__09D90000002A1hg_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" title="相关项" size="20" onchange="getElementByIdCS('evt3__09D90000002A1hg_lkid').value='';getElementByIdCS('evt3__09D90000002A1hg_mod').value='1';"
                                                                                                                                                    name="evt3__09D90000002A1hg" maxlength="255" id="evt3__09D90000002A1hg"><a title="相关项 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="whtbtn" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hg%26lknm=evt3__09D90000002A1hg%26lkrf=pip%26sn=1%26lktp=' %2B getElementByIdCS('evt3__09D90000002A1hg_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('evt3__09D90000002A1hg').value.substring(0, 80)))"><img
                                                                                                                                                            title="相关项 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="相关项 查找（新窗口）"
                                                                                                                                                            src="/s.gif"></a><span style="display: none" id="addInvId"><span class="bodySmall">[
                                                                                                                                                            </span><a class="bodySmall" href="javascript:document.editPage__09D90000002A1hg.focusThisFieldOnLoad.value='evt3__09D90000002A1hg';ivwh('evt3__09D90000002A1hg_lkid', null);">
                                                                                                                                                                添加到被邀请人</a><span class="bodySmall"> ]</span><input type="hidden" value="" name="pip"
                                                                                                                                                                    id="pip"></span></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="StartDateTime__09D90000002A1hg">
                                                                                                                <span class="requiredMark">*</span>开始</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <span class="dateInput dateOnlyInput">
                                                                                                                            <input type="text" value="2014-9-15" size="10" onfocus="DatePicker.pickDate(true, 'StartDateTime__09D90000002A1hg', false);"
                                                                                                                                onchange="ActivityFunction.updateDates('StartDateTime__09D90000002A1hg', [&quot;reminder_dt__09D90000002A1hg&quot;,&quot;RecurrenceStartDateTime__09D90000002A1hg&quot;,&quot;EndDateTime__09D90000002A1hg&quot;], true);ActivityFunction.updateCalendar([&quot;evt1__09D90000002A1hg&quot;,&quot;evt1__09D90000002A1hg_lkid&quot;,&quot;StartDateTime__09D90000002A1hg&quot;,&quot;EndDateTime__09D90000002A1hg&quot;,&quot;hh&quot;,&quot;mi&quot;,&quot;IsRecurrence__09D90000002A1hg&quot;,&quot;RecurrenceStartDateTime__09D90000002A1hg&quot;,&quot;RecurrenceEndDateOnly__09D90000002A1hg&quot;,&quot;rectype&quot;,&quot;recd&quot;,&quot;recm&quot;,&quot;recy&quot;,&quot;invtee&quot;]);ActivityFunction.saveStartTime('StartDateTime__09D90000002A1hg','StartDateTime__09D90000002A1hg_time');ActivityFunction.checkDuration('IsRecurrence__09D90000002A1hg','evt15__09D90000002A1hg','StartDateTime__09D90000002A1hg','StartDateTime__09D90000002A1hg_time','EndDateTime__09D90000002A1hg','EndDateTime__09D90000002A1hg_time');"
                                                                                                                                name="StartDateTime__09D90000002A1hg" id="StartDateTime__09D90000002A1hg"></span></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <span class="dateInput dateOnlyInput"><span class="timeInput">
                                                                                                                            <input type="text" value="下午6:00" size="5" onfocus="SimpleTimePicker.pickTime('StartDateTime__09D90000002A1hg_time');"
                                                                                                                                onchange="ActivityFunction.updateEndTime('StartDateTime__09D90000002A1hg','StartDateTime__09D90000002A1hg_time', 'EndDateTime__09D90000002A1hg', 'EndDateTime__09D90000002A1hg_time');ActivityFunction.checkDuration('IsRecurrence__09D90000002A1hg','evt15__09D90000002A1hg','StartDateTime__09D90000002A1hg','StartDateTime__09D90000002A1hg_time','EndDateTime__09D90000002A1hg','EndDateTime__09D90000002A1hg_time');"
                                                                                                                                name="StartDateTime__09D90000002A1hg_time" id="StartDateTime__09D90000002A1hg_time"
                                                                                                                                autocomplete="off">
                                                                                                                            <span class="dateFormat">[&nbsp;<a onclick="var inputField = getElementByIdCS('StartDateTime__09D90000002A1hg_time');if (inputField && !inputField.disabled && inputField.value != '下午5:25') { inputField.value = '下午5:25'; if (inputField.onchange) {inputField.onchange();}}return false;"
                                                                                                                                href="#">下午5:25</a>&nbsp;]</span></span></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="EndDateTime__09D90000002A1hg">
                                                                                                                <span class="requiredMark">*</span>结束</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of2 zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <span class="dateInput dateOnlyInput">
                                                                                                                            <input type="text" value="2014-9-15" size="10" onfocus="DatePicker.pickDate(true, 'EndDateTime__09D90000002A1hg', false);"
                                                                                                                                onchange="ActivityFunction.checkDuration('IsRecurrence__09D90000002A1hg','evt15__09D90000002A1hg','StartDateTime__09D90000002A1hg','StartDateTime__09D90000002A1hg_time','EndDateTime__09D90000002A1hg','EndDateTime__09D90000002A1hg_time');"
                                                                                                                                name="EndDateTime__09D90000002A1hg" id="EndDateTime__09D90000002A1hg"></span></div>
                                                                                                                </div>
                                                                                                                <div class="zen-size1of2 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <span class="dateInput dateOnlyInput"><span class="timeInput">
                                                                                                                            <input type="text" value="下午7:00" size="5" onfocus="SimpleTimePicker.pickTime('EndDateTime__09D90000002A1hg_time');"
                                                                                                                                onchange="ActivityFunction.checkDuration('IsRecurrence__09D90000002A1hg','evt15__09D90000002A1hg','StartDateTime__09D90000002A1hg','StartDateTime__09D90000002A1hg_time','EndDateTime__09D90000002A1hg','EndDateTime__09D90000002A1hg_time');"
                                                                                                                                name="EndDateTime__09D90000002A1hg_time" id="EndDateTime__09D90000002A1hg_time"
                                                                                                                                autocomplete="off">
                                                                                                                            <span class="dateFormat">[&nbsp;<a onclick="var inputField = getElementByIdCS('EndDateTime__09D90000002A1hg_time');if (inputField && !inputField.disabled && inputField.value != '下午5:25') { inputField.value = '下午5:25'; if (inputField.onchange) {inputField.onchange();}}return false;"
                                                                                                                                href="#">下午5:25</a>&nbsp;]</span></span></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="zen-line">
                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                    <div class="quickActionField">
                                                                                                        <div class="quickActionFieldLabel">
                                                                                                            <label for="evt1__09D90000002A1hg">
                                                                                                                <span class="requiredMark">*</span>被分配人</label></div>
                                                                                                        <div class="quickActionFieldElements">
                                                                                                            <div class="zen-line">
                                                                                                                <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                    <div class="quickActionFieldElement">
                                                                                                                        <input type="hidden" value="005900000038QVZ" id="evt1__09D90000002A1hg_lkid" name="evt1__09D90000002A1hg_lkid"><input
                                                                                                                            type="hidden" value="liu jerryliu" id="evt1__09D90000002A1hg_lkold" name="evt1__09D90000002A1hg_lkold"><input
                                                                                                                                type="hidden" value="StandardUserLookup" id="evt1__09D90000002A1hg_lktp" name="evt1__09D90000002A1hg_lktp"><input
                                                                                                                                    type="hidden" value="0" id="evt1__09D90000002A1hg_lspf" name="evt1__09D90000002A1hg_lspf"><input
                                                                                                                                        type="hidden" value="0" id="evt1__09D90000002A1hg_lspfsub" name="evt1__09D90000002A1hg_lspfsub"><input
                                                                                                                                            type="hidden" value="0" id="evt1__09D90000002A1hg_mod" name="evt1__09D90000002A1hg_mod"><span
                                                                                                                                                class="lookupInput"><input type="text" value="liu jerryliu" size="20" onchange="getElementByIdCS('evt1__09D90000002A1hg_lkid').value='';getElementByIdCS('evt1__09D90000002A1hg_mod').value='1';"
                                                                                                                                                    name="evt1__09D90000002A1hg" maxlength="255" id="evt1__09D90000002A1hg"><a title="被分配人 查找（新窗口）"
                                                                                                                                                        onclick="setLastMousePosition(event)" id="evt1__09D90000002A1hg_lkwgt" href="javascript: openLookup('/_ui/common/data/LookupPage?lkfm=editPage__09D90000002A1hg%26lknm=evt1__09D90000002A1hg%26lktp=' %2B getElementByIdCS('evt1__09D90000002A1hg_lktp').value,670,'1','%26lksrch=' %2B escapeUTF(getElementByIdCS('evt1__09D90000002A1hg').value.substring(0, 80)))"><img
                                                                                                                                                            title="被分配人 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="被分配人 查找（新窗口）"
                                                                                                                                                            src="/s.gif"></a></span></div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="pbFooter secondaryPalette">
                                                                                        <div class="bg">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1hg', 'editPage__09D90000002A1hg', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="" class="09D90000002A1hh publisherTemplate ">
                                                                <div class="customPanel alignTop">
                                                                    <div class="quickActionPanel">
                                                                        <div id="panelBody__09D90000002A1hh" class="panelBody clear">
                                                                            <script type="text/javascript">
                                                                            </script>
                                                                            <form onsubmit="if (window.ffInAlert) { return false; }" name="editPage__09D90000002A1hh"
                                                                            method="POST" id="editPage__09D90000002A1hh" action="/home/home.aspx">
                                                                            <div id="ep____09D90000002A1hh" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
                                                                                <div class="pbHeader">
                                                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td class="pbTitle">
                                                                                                    <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td id="topButtonRow____09D90000002A1hh" class="pbButton">
                                                                                                    &nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="pbBody">
                                                                                    <div style="display: none" id="errorDiv_ep____09D90000002A1hh" class="pbError">
                                                                                        错误：无效数据。<br>
                                                                                        请查看下列所有错误消息以纠正数据。</div>
                                                                                    <div class="quickActionForm zen-form zen-skinnyForm">
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="acc2__09D90000002A1hh">
                                                                                                            <span class="requiredMark">*</span>客户名</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="acc2__09D90000002A1hh" maxlength="255" id="acc2__09D90000002A1hh"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="acc20__09D90000002A1hh">
                                                                                                            描述</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <textarea wrap="soft" type="text" onmousedown="handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');"
                                                                                                                        onkeyup="handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');"
                                                                                                                        onkeydown="handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');"
                                                                                                                        onclick="handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');"
                                                                                                                        onchange="handleTextAreaElementChangeWithByteCheck('acc20__09D90000002A1hh', 32000, 0, '剩余', '超出极限');"
                                                                                                                        name="acc20__09D90000002A1hh" maxlength="32000" id="acc20__09D90000002A1hh"></textarea></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="zen-line">
                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                <div class="quickActionField">
                                                                                                    <div class="quickActionFieldLabel">
                                                                                                        <label for="acc12__09D90000002A1hh">
                                                                                                            网址</label></div>
                                                                                                    <div class="quickActionFieldElements">
                                                                                                        <div class="zen-line">
                                                                                                            <div class="zen-size1of1 zen-lastUnit zen-unit">
                                                                                                                <div class="quickActionFieldElement">
                                                                                                                    <input type="text" size="20" name="acc12__09D90000002A1hh" maxlength="255" id="acc12__09D90000002A1hh"></div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="pbFooter secondaryPalette">
                                                                                    <div class="bg">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <script>                                                                                if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons([]); }</script>
                                                                            </form>
                                                                            <script>                                                                                createRecordHandler.registerFeedItemTypeHandler('09D90000002A1hh', 'editPage__09D90000002A1hh', '创建');</script>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="bottomBar">
                                                                    <div class="bottomBarRight">
                                                                        <span class="publisherShareButtonPlaceholder"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div lazyinit="true" class="LinkPost publisherTemplate ">
                                                                <!--<div class="contentPublisherSlideDown customPanel alignTop"><div class="panel"><div class="panelBody clear"><table  class="postInput"><tr><TH scope="row"><label for="url"><span class="requiredMark">*</span>链接 URL</label></TH><td><div class="requiredInput"><div class="requiredBlock"></div><input  class="fileFormInputElement" id="url" maxlength="1005" name="url" size="20" title="链接 URL" type="text" value="http://" /><div class="errorMsg hidden"></div></div></td></tr>
<tr><TH scope="row"><label for="urlName">链接名称</label></TH><td><div class="urlName"><input  class="fileFormInputElement" id="urlName" maxlength="260" name="urlName" size="20" title="链接" type="text" value="" /><div class="errorMsg hidden"></div></div></td></tr>
</table></div></div></div><div class="publisherTextAreaPlaceholder alignCenter"></div><div class="publisherBottomBarPlaceholder"></div>-->
                                                            </div>
                                                            <div lazyinit="true" class="PollPost publisherTemplate ">
                                                                <!--<div class="publisherTextAreaPlaceholder alignTop"></div>
<div class="customPanel alignCenter">
	<div class="publisherpollchoices">
					<div class="publisherpollchoice">
					<label class="publisherpollchoicelabel" for="choiceinput1">选项 1</label>
					<input id="choiceinput1" title="选项 1" type="text" class="publisherpollchoiceinput" />		
					<div class="errorMsg hidden"></div>
			</div>
			<div class="publisherpollchoice">
					<label class="publisherpollchoicelabel" for="choiceinput2">选项 2</label>
					<input id="choiceinput2" title="选项 2" type="text" class="publisherpollchoiceinput" />		
					<div class="errorMsg hidden"></div>
			</div>
	</div>
	<div class="publisherpolladdchoice">
<a href="javascript: void(0);" title="添加更多选项" id="polladdchoice" onclick="chatter.getPublisher().getHandler('PollPost').addPollChoiceInputElement(this);">			添加更多选项
</a>	</div>
</div>
<div class="publisherBottomBarPlaceholder"></div>-->
                                                            </div>
                                                            <div lazyinit="" class="RypplePost publisherTemplate ">
                                                                <div id="showingrypplethanks" class="customPanel alignTop">
                                                                    <div class="publisherThanksContainer">
                                                                        <div>
                                                                            <div id="thanksRecipientContainer" title="您要感谢谁？" class="thanksInput">
                                                                                <div id="thanksRecipient">
                                                                                    <span>
                                                                                        <input type="text" size="25" id="thanksRecipientInputBox"></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="thanksContainer">
                                                                        <div class="badgeContainer">
                                                                            <div data-fullurl="/img/rypple/Thanks.png" data-smallurl="/img/rypple/Thanks.png"
                                                                                data-description="Thank you for going above and beyond to contribute to our success!"
                                                                                data-externalid="0W190000000fGRx" data-name="Thanks" id="badgeInfo" class="badgeInfo">
                                                                                <a href="javascript:chatter.getPublisher().getHandler('RypplePost').showRyppleDialog()">
                                                                                    <img title="Thank you for going above and beyond to contribute to our success!" class="publisherBadge"
                                                                                        alt="Thank you for going above and beyond to contribute to our success!" src="/s.gif"></a>
                                                                            </div>
                                                                            <div class="changeBadge">
                                                                                <a href="javascript:chatter.getPublisher().getHandler('RypplePost').showRyppleDialog()">
                                                                                    更改徽章</a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="publisherTextAreaPlaceholder alignTop">
                                                                        </div>
                                                                        <div class="clearingBox">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="publisherBottomBarPlaceholder">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="externalGroupWarning">
                                                            与客户共享</div>
                                                        <div class="clear">
                                                        </div>
                                                        <script>                                                            Sfdc.Dom.onReady(function () { chatter.getPublisher().wire('TextPost', 'TextPost'); });</script>
                                                    </div>
                                                    <script>                                                        //     chatter.getToolbox().setToken('');</script>
                                                    <div id="feedwrapper" class="cxfeedinnerwrapper">
                                                        <div data-feed="{&quot;subjectId&quot;:&quot;005900000038QVZ&quot;,&quot;feedType&quot;:&quot;NEWS&quot;,&quot;writable&quot;:&quot;ReadWrite&quot;,&quot;numFeedItems&quot;:3,&quot;canSortFeed&quot;:true,&quot;sortByComments&quot;:false,&quot;showFeedTitle&quot;:false,&quot;isDropDownFiltersVisible&quot;:false,&quot;alwaysShowFullText&quot;:false,&quot;isShowMoreOfThis&quot;:true,&quot;feedfilter&quot;:&quot;all&quot;,&quot;keyprefix&quot;:&quot;&quot;}"
                                                            class="feedcontainer cxfeedcontainer zen actionsOnHoverEnabled">
                                                            <span class="feedDropDown">
                                                                <div data-sfdc-widget="SfdcCmp.chatter.ComboMenu" class="comboMenu zen-line feedsupermenu "
                                                                    data-uidsfdc="27">
                                                                    <div data-sfdc-widget="SfdcCmp.Ui.SearchBox" class="zen-searchBox comboSearchMax feedSearch"
                                                                        data-uidsfdc="26">
                                                                        <form onsubmit="chatter.getFeed().runSearch(event);" class="feedSearchForm">
                                                                        <label class="zen-assistiveText" for="searchInput">
                                                                            搜索此摘要</label>
                                                                        <input type="text" alt="搜索此摘要" title="搜索此摘要..." aria-haspopup="true" aria-expanded="false"
                                                                            placeholder="搜索此摘要..." maxlength="100" id="searchInput" class="feedSearchTerm"
                                                                            data-uidsfdc="22">
                                                                        <a title="清除搜索" onclick="chatter.getFeed().clearSearch()" href="#" class="zen-clearInput"
                                                                            data-uidsfdc="23"></a><a class="feedSearchClear" title="清除搜索" onclick="chatter.getFeed().clearSearch()"
                                                                                href="javascript:void(0);">
                                                                                <img alt="清除搜索" class="feedSearchClearIcon" src="/s.gif">
                                                                            </a>
                                                                        </form>
                                                                        <div class="feedSearchClosedButton">
                                                                            <a title="搜索此摘要" onclick="chatter.getFeed().expandSearchAndHideMenu()" href="javascript:void(0);">
                                                                                <img alt="搜索此摘要" class="feedSearchIcon" src="/s.gif">
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="zen-smlineSep">
                                                                        |</div>
                                                                    <div data-autocollapse="true" data-autofocus="true" data-isselect="true" data-expandmode="click"
                                                                        role="application" data-sfdc-widget="SfdcCmp.Ui.Dropdown" class="zen-select "
                                                                        data-uidsfdc="21">
                                                                        <a aria-haspopup="true" title="" href="javascript:void(0);" onclick="" class="zen-trigger "
                                                                            id="feedFilterDropDownElement" data-uidsfdc="19"><span class="triggerTitleText">排序标准<span
                                                                                id="sortDisplay">张贴日期</span><b class="zen-selectArrow"></b></span> </a>
                                                                        <div aria-labelledby="feedFilterDropDownElement" role="menu" class="zen-options "
                                                                            data-uidsfdc="20">
                                                                            <span class="facet facetheader ">
                                                                                <h4>
                                                                                    排序标准</h4>
                                                                            </span><span role="radiogroup" data-sfdc-widget="SfdcCmp.Ui.OptGroup" class="zen-optgroup combomenu-filter"
                                                                                data-uidsfdc="16">
                                                                                <ul class="feedsortby">
                                                                                    <li role="presentation" data-sfdc-widget="SfdcCmp.Ui.Option" class="zen-checked"
                                                                                        data-uidsfdc="17"><span class="zen-visualization"></span><a title="张贴日期" role="menuitemradio"
                                                                                            onclick="chatter.getFeed().toggleSort(this, false, event);" data-value="张贴日期"
                                                                                            aria-checked="true" href="javascript:;">张贴日期</a></li><li data-sfdc-widget="SfdcCmp.Ui.Option"
                                                                                                data-uidsfdc="18"><span class="zen-visualization"></span><a title="最新活动" role="menuitemradio"
                                                                                                    onclick="chatter.getFeed().toggleSort(this, true, event);" data-value="最新活动"
                                                                                                    href="javascript:;">最新活动</a></li></ul>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </span>
                                                            <div class="clearingBox">
                                                            </div>
                                                            <div style="display: none" class="nonFeedSuccess zen-message zen-confirm">
                                                                <img class="leftImage" src="/img/msg_icons/confirm24.png">
                                                                <div class="nonFeedSuccessContent">
                                                                    <div class="nonFeedSuccessTitle">
                                                                        成功！</div>
                                                                    <div class="nonFeedSuccessMessage">
                                                                    </div>
                                                                </div>
                                                                <div class="clearingBox">
                                                                </div>
                                                            </div>
                                                            <div class="emptyfeed">
                                                                没有更新。</div>
                                                        </div>
                                                        <script type="text/javascript">
                                                            chatter.getFeed().wire();
                                                            chatter.getFeed().setItemTypeFilter(null);
            
                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="feedclearfloat">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bMyDashboard">
                                <div class="bPageBlock brandSecondaryBrd">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <h2>
                                                            个人工作台</h2>
                                                    </td>
                                                    <td class="pbButton"><!--
                                                        <input type="button" title="刷新 仪表板" onclick="window.open('/01Z90000000o3GJ?poll=1&amp;m=HOMEPAGE&amp;nr=1&amp;refresh=1', 'db_refresh_frame');"
                                                            name="refresh" id="db_ref_btn" class="btn" value=" 刷新 " />-->
                                                    </td>
                                                    <td class="pbHelp">
                                                        <!--<a href="/setup/ui/customizeyourhomepage.aspx?retURL=/home/home.aspx">自定义页面</a>-->
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbBody">
                                        <div id="db_refresh_time" class="componentDate">
                                            </div>
                                        <span id="db_refresh_comment" class="importantWarning"></span>&nbsp;<iframe title="隐藏框架 - 忽略"
                                            style="display: none;" src="/s.gif" name="db_refresh_frame" id="db_refresh_frame"></iframe>
                                        <table cellspacing="0" cellpadding="0" border="0" class="componentTable" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td width="260" class="dashMed col1">
                                                        <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                                            <div class="pbHeader">
                                                                <table cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="pbTitle1">
                                                                                <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><img title=""
                                                                                    class="relatedListIcon" alt="" src="/s.gif"><h3 id="PendingProcessWorkitemsList_title">
                                                                                        待办事务</h3>
                                                                            </td>
                                                                            <td class="pbButton">
                                                                                
                                                                            </td>
                                                                            <td class="pbHelp">
                                                                               <a title="更多待办事务" id="mtqLink" href="/apps/wf/MyApplyList.aspx?t=122&src=2">更多&nbsp;>>&nbsp;</a>                                                                                
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div id="PendingProcessWorkitemsList_body" class="pbBody">
                                                                <!--
                                                                <table cellspacing="0" cellpadding="0" border="0" class="list">
                                                                    <tbody>
                                                                        <tr class="headerRow">
                                                                            <th class="noRowsHeader" scope="col">
                                                                                没有可显示的记录
                                                                            </th>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>-->
                                                                <table cellspacing="0" cellpadding="0" border="0" class="list">                                                                   
                                                                        <tr class="headerRow">
                                                                            <th scope="col" class="actionColumn"> </th>
                                                                            <th class=" zen-deemphasize" scope="col">
                                                                                事务名称
                                                                            </th>
                                                                            <th class=" zen-deemphasize" scope="col">分配人
                                                                            </th>
                                                                           <th class="DateElement zen-deemphasize" scope="col" style="width:80px;">日期
                                                                            </th>
                                                                        </tr>
                                                                       <tbody id="PendingProcessWorkitemsList_gridbody">
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
                                                            <script type="text/javascript">
                                                                //widgetWFWaitingTask
                                                                jQuery(document).ready(function () {
                                                                    widgetWFWaitingTask(fillWFWaitingTaskGrid);
                                                                    widgetTopNewsTask(fillNewsGrid);
                                                                });
                                                                function fillWFWaitingTaskGrid(data) {
                                                                    var html = "";

                                                                    if (data == null || data.length == 0) {
                                                                        html = '<table cellspacing="0" cellpadding="0" border="0" class="list"><tbody><tr class="headerRow"><th scope="col" class="noRowsHeader">没有可显示的记录</th></tr>  </tbody></table>';
                                                                        jQuery("#PendingProcessWorkitemsList_body").html(html);
                                                                        return;
                                                                    }
                                                                    //html = " <tbody>";
                                                                    for (var i = 0; i < data.length; i++) {
                                                                        var item = data[i];
                                                                        html += '<tr>'
                                                                        html += '<td></td>'
                                                                        html += '<td class="dataCell">';
                                                                        html += '<a title="" class="actionLink" href="/apps/wf/InstanceDetail.aspx?t=122&source=l&id=' + item.id + '&retURL=/122/o?src=2">';
                                                                        html += item.name + '</a>'
                                                                        html += '   </td>'
                                                                        html += '<td class="dataCell">' + item.createdBy + '</td>'
                                                                        html += '<td class="dataCell">' + item.date + '</td>'
                                                                        html += '</tr>'
                                                                    }
                                                                    //html += " </tbody>";
                                                                    jQuery("#PendingProcessWorkitemsList_gridbody").html(html);
                                                                }
                                                            </script>
                                                            <div class="pbFooter secondaryPalette">
                                                                <div class="bg">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                   
                                                    <td width="250" class="dashMed col2">
                                                        <div class="mComponent containsAChart">                                                           
                                                            <div class="cHeader brandSecondaryBrd">
                                                                <table cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="title">
                                                                                <h2 class="moduleTitle">
                                                                                    最新消息</h2>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div id="dashboard_1_0"><!--
                                                                <div class="shadow">
                                                                    <div class="cContent">
                                                                        <a href="/00O90000007oTQs">
                                                                            <img title="Open Activities by Day - 单击以转到完整报表。" style="width: 250px;" id="01a90000003AFO5Img"
                                                                                class="chart" alt="Open Activities by Day - 单击以转到完整报表。" src=""></a></div>
                                                                </div>-->
                                                                   <table cellspacing="0" cellpadding="0" border="0" class="list">                                                                   
                                                                        <tr class="headerRow">
                                                                            <!--<th scope="col" class="actionColumn"> </th>-->
                                                                            <th class=" zen-deemphasize" scope="col"  style="width:80px;">
                                                                                分类
                                                                            </th>
                                                                            <th class=" zen-deemphasize" scope="col">标题
                                                                            </th>
                                                                            <th class="zen-deemphasize" scope="col" style="width:80px;">创建人
                                                                            </th>
                                                                           <th class="DateElement zen-deemphasize" scope="col" style="width:80px;">日期
                                                                            </th>
                                                                        </tr>
                                                                         <tbody id="newsgrid_body">
                                                                         </tbody>
                                                                    </table>
                                                            </div>
                                                            <span class="cFooter"><a title="更多新闻" id="A1" href="/090/o">更多>></a></span></div>
                                                    </td> <!--
                                                    <td width="250" class="dashMed col3">
                                                        <div class="mComponent containsAChart">
                                                            
                                                            <div class="cHeader brandSecondaryBrd">
                                                                <table cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="title">
                                                                                <h2 class="moduleTitle">
                                                                                    Closed Sales</h2>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div id="dashboard_2_0">
                                                                <div class="shadow">
                                                                    <div class="cContent">
                                                                        <a href="/00O90000007ZNM4">
                                                                            <img title="Actuals vs Quota - 单击以转到完整报表。" style="width: 250px;" id="01a90000003AFO8Img"
                                                                                class="chart" alt="Actuals vs Quota - 单击以转到完整报表。" src=""></a></div>
                                                                </div>
                                                            </div>
                                                            <span class="cFooter">Actuals vs Quota - Current Month</span></div>
                                                    </td>
                                                    -->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg">
                                        </div>
                                    </div>
                                    <script>                                        function onLoadSelector() { };</script>
                                </div>
                            </div>
                            <cc1:HomeTaskListBlock runat="server" ID="HomeTaskListBlock1" />
                            <div id="homeCalendarSection" class="bMyCalendar">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <h3>
                                                            日历</h3>
                                                    </td>
                                                    <td class="pbButton">
                                                        <input type="button" title="新建事件" onclick="navigateToUrl('/00U/e?retURL=/home/home.aspx',null,'newEvent');"
                                                            name="newEvent" class="btn" value=" 新建事件 " />
                                                        <input type="button" title="新建会议请求" onclick="navigateToUrl('javascript:void(SchedulingProposeMeeting.openAskForMeetingDialog(%27/scheduling/createMeeting.aspx?onHome=true%27, false, 877));',null,'newproposemeeting');"
                                                            name="newproposemeeting" class="btn" value="新建会议请求" /><!--
                                                        <input type="button" title="新建会议请求" onclick="void(newMeetings())"
                                                            name="newproposemeeting1" class="btn" value="新建会议请求" />-->
                                                        <script type="text/javascript">
                                                            function newMeetings() {
                                                                // alert("ok");
                                                                SchedulingProposeMeeting.openAskForMeetingDialog('/scheduling/createMeeting.aspx?onHome=true', false, 877);
                                                            }
                                                        </script>
                                                    </td>
                                                    <td class="pbHelp">
                                                        <a title="无法解析事件" id="eqLink" href="/6AB?src=9">无法解析事件</a><span title="日历帮助（新窗口）"
                                                            class="help"><a class="linkCol" href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);"><span
                                                                class="linkSpan">日历帮助</span>
                                                                <img title="日历帮助（新窗口）" class="helpIcon" alt="日历帮助（新窗口）" src="/s.gif"></a></span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbBody">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td width="100%">
                                                        <div class="miniTab secondaryPalette">
                                                            <ul class="miniTabList">
                                                                <li class="currentTab"><a onclick="HomeCalendar.getRegularEvents(); return false;"
                                                                    title="已计划会议 子选项卡 - 已选取" id="homeCalRegEventTab" href="/home/home.aspx">已计划会议</a></li><li
                                                                        class="secondaryPalette"><a onclick="HomeCalendar.getProposedEvents(); return false;"
                                                                            title="已请求会议 子选项卡" id="homeCalProposedEventTab" href="/home/home.aspx?pe=1">已请求会议</a></li></ul>
                                                        </div>
                                                        <div>
                                                            <cc1:HomeThisWeekEventList runat="server" ID="HomeThisWeekEventList" />
                                                            <script>                                                                if (window.Hover) { setTimeout(Hover.disableHovers, 7195000) }</script>
                                                        </div>
                                                    </td>
                                                    <td align="right">
                                                        <div class="mCalendar">
                                                            <div class="topLeft">
                                                                <div class="topRight">
                                                                </div>
                                                            </div>
                                                            <div class="body">
                                                                <cc1:SmallCalendar runat="server" ID="SmallCalendar1" />
                                                                <!--
                                                                <table cellspacing="0" cellpadding="2" border="0">
                                                                    <tbody>
                                                                        <tr class="header">
                                                                            <td>
                                                                                <a title="上月" href="/home/home.aspx?mo=-1">
                                                                                    <img title="上月" class="prevCalArrow" alt="上月" src="/s.gif"></a>
                                                                            </td>
                                                                            <td colspan="5">
                                                                                2014 九月
                                                                            </td>
                                                                            <td>
                                                                                <a title="下月" href="/home/home.aspx?mo=1">
                                                                                    <img title="下月" class="nextCalArrow" alt="下月" src="/s.gif"></a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="col" class="calDays">
                                                                                星期日
                                                                            </th>
                                                                            <th scope="col" class="calDays">
                                                                                星期一
                                                                            </th>
                                                                            <th scope="col" class="calDays">
                                                                                星期二
                                                                            </th>
                                                                            <th scope="col" class="calDays">
                                                                                星期三
                                                                            </th>
                                                                            <th scope="col" class="calDays">
                                                                                星期四
                                                                            </th>
                                                                            <th scope="col" class="calDays">
                                                                                星期五
                                                                            </th>
                                                                            <th scope="col" class="calDays">
                                                                                星期六
                                                                            </th>
                                                                        </tr>
                                                                        <tr class="days">
                                                                            <td>
                                                                                <a title="八月 31" class="calInactive" href="/00U/c?md0=2014&amp;md3=243">31</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 01" class="calActive" href="/00U/c?md0=2014&amp;md3=244">01</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 02" class="calActive" href="/00U/c?md0=2014&amp;md3=245">02</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 03" class="calActive" href="/00U/c?md0=2014&amp;md3=246">03</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 04" class="calActive" href="/00U/c?md0=2014&amp;md3=247">04</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 05" class="calActive" href="/00U/c?md0=2014&amp;md3=248">05</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 06" class="calActive" href="/00U/c?md0=2014&amp;md3=249">06</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="days">
                                                                            <td>
                                                                                <a title="九月 07" class="calActive" href="/00U/c?md0=2014&amp;md3=250">07</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 08" class="calActive" href="/00U/c?md0=2014&amp;md3=251">08</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 09" class="calActive" href="/00U/c?md0=2014&amp;md3=252">09</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 10" class="calActive" href="/00U/c?md0=2014&amp;md3=253">10</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 11" class="calActive" href="/00U/c?md0=2014&amp;md3=254">11</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 12" class="calActive" href="/00U/c?md0=2014&amp;md3=255">12</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 13" class="calActive" href="/00U/c?md0=2014&amp;md3=256">13</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="highlight">
                                                                            <td>
                                                                                <a title="九月 14" class="calActive" href="/00U/c?md0=2014&amp;md3=257">14</a>
                                                                            </td>
                                                                            <td class="calToday">
                                                                                <a title="九月 15 (今天)" href="/00U/c?md0=2014&amp;md3=258">15</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 16" class="calActive" href="/00U/c?md0=2014&amp;md3=259">16</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 17" class="calActive" href="/00U/c?md0=2014&amp;md3=260">17</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 18" class="calActive" href="/00U/c?md0=2014&amp;md3=261">18</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 19" class="calActive" href="/00U/c?md0=2014&amp;md3=262">19</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 20" class="calActive" href="/00U/c?md0=2014&amp;md3=263">20</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="days">
                                                                            <td>
                                                                                <a title="九月 21" class="calActive" href="/00U/c?md0=2014&amp;md3=264">21</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 22" class="calActive" href="/00U/c?md0=2014&amp;md3=265">22</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 23" class="calActive" href="/00U/c?md0=2014&amp;md3=266">23</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 24" class="calActive" href="/00U/c?md0=2014&amp;md3=267">24</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 25" class="calActive" href="/00U/c?md0=2014&amp;md3=268">25</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 26" class="calActive" href="/00U/c?md0=2014&amp;md3=269">26</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 27" class="calActive" href="/00U/c?md0=2014&amp;md3=270">27</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="days">
                                                                            <td>
                                                                                <a title="九月 28" class="calActive" href="/00U/c?md0=2014&amp;md3=271">28</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 29" class="calActive" href="/00U/c?md0=2014&amp;md3=272">29</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="九月 30" class="calActive" href="/00U/c?md0=2014&amp;md3=273">30</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="十月 01" class="calInactive" href="/00U/c?md0=2014&amp;md3=274">01</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="十月 02" class="calInactive" href="/00U/c?md0=2014&amp;md3=275">02</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="十月 03" class="calInactive" href="/00U/c?md0=2014&amp;md3=276">03</a>
                                                                            </td>
                                                                            <td>
                                                                                <a title="十月 04" class="calInactive" href="/00U/c?md0=2014&amp;md3=277">04</a>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                -->
                                                            </div>
                                                            <div class="bottomLeft">
                                                                <div class="bottomRight">
                                                                </div>
                                                            </div>
                                                            <cc1:CalendarQuickButtons runat="server" ID="CalendarQuickButtons1" />
                                                            <!--
                                                            <div class="calendarHeader">
                                                                <span class="userIcons"><a title="单用户视图 - 已选" href="/00U/c?cType=1">
                                                                    <img title="单用户视图 - 已选" class="singleUserViewIconOn" alt="单用户视图 - 已选" src="/s.gif"></a><a
                                                                        title="多用户视图" href="/00U/c?cType=2"><img title="多用户视图" onmouseover="this.className = 'multiUserViewIconOn';this.className = 'multiUserViewIconOn';"
                                                                            onmouseout="this.className = 'multiUserViewIcon';this.className = 'multiUserViewIcon';"
                                                                            onfocus="this.className = 'multiUserViewIconOn';" onblur="this.className = 'multiUserViewIcon';"
                                                                            class="multiUserViewIcon" alt="多用户视图" src="/s.gif"></a><a title="活动列表视图" href="/007"><img
                                                                                title="活动列表视图" onmouseover="this.className = 'listViewIconOn';this.className = 'listViewIconOn';"
                                                                                onmouseout="this.className = 'listViewIcon';this.className = 'listViewIcon';"
                                                                                onfocus="this.className = 'listViewIconOn';" onblur="this.className = 'listViewIcon';"
                                                                                class="listViewIcon" alt="活动列表视图" src="/s.gif"></a></span><span class="dwmIcons"><a
                                                                                    title="日视图" href="/00U/c?md0=2014&amp;md3=258&amp;cType=1"><img title="日视图" onmouseover="this.className = 'dayViewIconOn';this.className = 'dayViewIconOn';"
                                                                                        onmouseout="this.className = 'dayViewIcon';this.className = 'dayViewIcon';" onfocus="this.className = 'dayViewIconOn';"
                                                                                        onblur="this.className = 'dayViewIcon';" class="dayViewIcon" alt="日视图" src="/s.gif"></a><a
                                                                                            title="星期视图" href="/00U/c?md2=38&amp;md0=2014&amp;cType=1"><img title="星期视图" onmouseover="this.className = 'weekViewIconOn';this.className = 'weekViewIconOn';"
                                                                                                onmouseout="this.className = 'weekViewIcon';this.className = 'weekViewIcon';"
                                                                                                onfocus="this.className = 'weekViewIconOn';" onblur="this.className = 'weekViewIcon';"
                                                                                                class="weekViewIcon" alt="星期视图" src="/s.gif"></a><a title="月视图" href="/00U/c?md0=2014&amp;md1=8&amp;cType=1"><img
                                                                                                    title="月视图" onmouseover="this.className = 'monthViewIconOn';this.className = 'monthViewIconOn';"
                                                                                                    onmouseout="this.className = 'monthViewIcon';this.className = 'monthViewIcon';"
                                                                                                    onfocus="this.className = 'monthViewIconOn';" onblur="this.className = 'monthViewIcon';"
                                                                                                    class="monthViewIcon" alt="月视图" src="/s.gif"></a></span></div>
                                                                                                    -->
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg">
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                    /*
                                    if (this.loadChatFrameJs) loadChatFrameJs();
                                    SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                    new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); 
                                    new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                    SfdcApp.MruHovers.global_data.url = 'retURL=/home/home.aspx&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1410773133280';
                                    */
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

