<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultListPage.aspx.cs" Inherits="WebClient.apps.DefaultListPage"  %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title><%=PageTitle%>: 主页 ~ .com - Developer Edition</title>
  <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/chatterCore.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/AssociationQueue.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/DataDotComClean.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    
    <!--<link href="/sCSS/32.0/sprites/1420068168000/Theme3/dCustom0.css" rel="stylesheet" type="text/css" />-->
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DataDotComClean.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1413507464000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-24 上午9:56", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Contact';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/AssociationQueue.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/DataDotComClean.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1413771514000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="http://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //     ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '117.79.232.233', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F003%2Fo');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif <%=TabCss%>  overviewPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
    <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input
        type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.aspx?sfdc.setJsDomain=1" /><input
            type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login..com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.aspx%3Fsfdc.setJsDomain%3D1&amp;stbdtimeout=1" /><input
                type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden"
                    name="timeoutText" id="timeoutText" value="由于安全原因，您的 Salesforce 会话即将超时。<br><br>您希望作何选择？" /></form>
    <script>        var secondsLeftValue = 7200, secondsPopupValue = 7170, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7200, 7170) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp?sfdc.setJsDomain=1", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a href="#skiplink" class="navSkipLink zen-skipLink zen-assistiveText">跳到主内容</a>
    <div  id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:topright id="TopRight1" runat="server" />
            <uc1:mainnav id="MainNav1" runat="server" />
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
                                        <div class="content">
                                            <img src="/s.gif" alt="<%=PageTitle%>" class="pageTitleIcon" title="<%=PageTitle%>" /><h1 class="pageType">
                                                <%=PageTitle%><span class="titleSeparatingColon">:</span></h1>
                                            <h2 class="pageDescription">
                                                主页</h2>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links"><!--
                                            <a href="javascript:openPopupFocusEscapePounds('', %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                class="configLinks zen-deemphasize" title="了解详细信息！ （新窗口）">了解详细信息！</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                    title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                        class="helpIcon" /></a>--></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="filterOverview">
                            <form action="/<%=EntityCode%>/filter" id="filter_element" method="GET" name="filter_element" onsubmit="if (window.ffInAlert) { return false; }">
                            <div class="bFilterView">
                                <span class="bFilter">
                                    <label for="fcf" style="text-align: left; font-weight: bold; padding-right: .69em;">
                                        <span class="requiredMark">*</span>视图：</label><span class="fBody"><select id="fcf"
                                            name="fcf" onchange="javascript:this.form.submit();" title="视图："><!--<option value="00B90000008ViBi"> New Last Week</option>                                                
                                            <option value="00B90000008ViBu">本月份生日</option>
                                            <option value="00B90000008ViCR">全部联系人</option>
                                            <option value="00B90000008ViCg" selected="selected">我的联系人</option>
                                            <option value="00B90000008ViBs">新建本周</option>
                                            <option value="00B90000008ViCU">最近已查看联系人</option>-->
                                            <%=Fcfs%>
                                        </select>
                                            <input value=" 转至！ " class="btn" name="go" onclick="javascript:this.form.submit();"
                                                title="转至！" type="button" /></span><span class="fFooter"><a href="/ui/list/FilterEditPage?id=<%=DefaultFilterId%>&amp;retURL=%2F<%=EntityCode%>%2Fo&amp;cancelURL=%2F<%=EntityCode%>%2Fo">编辑</a>
                                                    | <a href="/ui/list/FilterEditPage?ftype=<%=FType%>&amp;retURL=%2F<%=EntityCode%>%2Fo&amp;cancelURL=%2F<%=EntityCode%>%2Fo">
                                                        新建视图</a></span></span></div>
                            </form>
                        </div>
                        <!-- Begin RelatedListElement -->
                        <div class="bRelatedList">
                            <!-- Begin ListElement -->
                            <!-- motif: Contact -->
                            <!-- WrappingClass -->
                            <div class="hotListElement">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <form action="/<%=EntityCode%>/o" id="hotlist" method="GET" name="hotlist" onsubmit="if (window.ffInAlert) { return false; }">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="pbTitle">
                                                    <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;<h3>
                                                        最近<%=PageTitle%></h3>
                                                </td>
                                                <td class="pbButton">
                                                    <input value=" 新建 " class="btn" name="new" style="height:25px;" onclick="navigateToUrl('/<%=EntityCode%>/e?retURL=%2F<%=EntityCode%>%2Fo',null,'new');"
                                                        title="新建" type="button" />
                                                </td>
                                                <td class="pbHelp">
                                                    <select id="hotlist_mode" name="hotlist_mode" onchange="submit();" title="显示所选内容">
                                                        <option value="2"  selected="selected">最近创建</option>
                                                        <option value="1">最近修改</option>
                                                        <!--<option value="3">最近查看</option>-->
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                        </form>
                                    </div>
                                    <div class="pbBody">
                                        <%=BodyText%>
                                        <!--
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class="noRowsHeader">
                                                    无最近记录。单击“转至”或从下拉列表中选择视图来显示记录。
                                                </th>
                                            </tr>
                                        </table>-->
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav">
                            </div>
                            <!-- End ListElement -->
                        </div>
                        <!-- End RelatedListElement -->
                        <%=FootBlock%>
                        <table class="toolsContent" id="toolsContent" style="display:none">
                            <tr>
                                <td>
                                    <div class="toolsContentLeft">
                                        <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                            <h3 class="lbHeader">
                                                报表</h3>
                                            <div class="lbBody">
                                                <ul>
                                                    <li><a href="/00O?rt=11&amp;retURL=%2F003%2Fo&amp;interval_q=last7&amp;break0=EMAILTEMPLATENAME&amp;sort=OPENED&amp;sortdir=down&amp;details=yes&amp;format=t">
                                                        HTML 电子邮件状态报表</a></li><li><a href="/00O?rt=45&amp;retURL=%2F003%2Fo&amp;edit=yes&amp;scope=user&amp;sort=ACCOUNT.NAME&amp;c=AO&amp;c=AN&amp;c=TY&amp;c=P_AN&amp;c=P_RO&amp;details=yes">
                                                            合作伙伴客户</a></li><li><a href="/00O?rt=2&amp;retURL=%2F003%2Fo&amp;edit=yes&amp;scope=my&amp;sort=ACCOUNT.NAME&amp;colDt_c=CREATED_DATE&amp;colDt_s=2014-10-17&amp;c=SL&amp;c=FN&amp;c=LN&amp;c=TI&amp;c=AN&amp;c=A2ST&amp;c=A2CI&amp;c=A2SA&amp;c=A2ZI&amp;c=A2CO&amp;c=P1&amp;c=P2&amp;c=P3&amp;c=EM&amp;c=AO&amp;details=yes">
                                                                邮寄列表</a></li><li><a href="/00O?rt=110&amp;retURL=%2F003%2Fo&amp;sortdir=down&amp;sort=CD&amp;sdate=2014-10-24&amp;edate=2014-10-24&amp;break0=CI&amp;c=FN&amp;c=LN&amp;c=OW&amp;c=CR&amp;c=FD&amp;c=OV&amp;c=NV&amp;c=CD&amp;details=yes&amp;format=t">
                                                                    联系人历史报表</a></li><li><a href="/00O?rt=2&amp;retURL=%2F003%2Fo&amp;pc0=EMAIL_BOUNCED_REASON&amp;pn0=ne&amp;pv0=&amp;sort=EM&amp;c=FN&amp;c=LN&amp;c=CO&amp;c=EM&amp;c=EMAIL_BOUNCED_REASON&amp;c=EMAIL_BOUNCED_DATE&amp;details=yes">
                                                                        已退回的联系人</a></li></ul>
                                            </div>
                                            <div class="lbBody">
                                                <div class="mainLink">
                                                    <a href="/00O/o?entityType=00O">转至报表</a>&nbsp;&#187;</div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="toolsContentRight">
                                        <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                            <h3 class="lbHeader">
                                                工具</h3>
                                            <div class="lbBody">
                                                <ul>
                                                    <li><span><a href="/setup/imp/myimport_welcome.jsp">导入我的客户 &amp; 联系人</a></span></li><li>
                                                        <span><a href="/setup/crmforoutlook/crmforoutlooksetup.apexp">同步到 Outlook</a></span></li><li>
                                                            <span><a href="/setup/imp/orgimport_welcome.jsp">导入我的组织的客户 &amp; 联系人</a></span></li><li>
                                                                <span><a href="/setup/own/massdelete.jsp?ftype=c&amp;retURL=%2F003%2Fo">批量删除联系人</a></span></li><li>
                                                                    <span><a href="/ui/massmail/MassMailStageManager?setupid=MassMailFilter&amp;ftype=C&amp;wizardRetUrl=%2F003%2Fo">
                                                                        批量发送电子邮件联系人</a></span></li><li><span><a href="/email/mass/massupdatefilter.jsp?ftype=Q&amp;retURL=%2F003%2Fo">
                                                                            批量保持联系</a></span></li><li><span><a href="/ui/campaign/MassAddCampaignMembersWizard?macmw_type=Contact&amp;macmw_mode=Add&amp;wizardRetUrl=%2F003%2Fo">
                                                                                批量添加联系人到市场活动</a></span></li></ul>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <script type="text/javascript">
                            window.sfdcPage.appendToOnloadQueue(function () {
                                //DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Contact&setupid=ContactFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Contact&retURL=%2F003%2Fo&setupid=ContactFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Contact", "newUrl": "/01I/e?retURL=%2F003%2Fo&setupid=Contact", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看记录类型", "hoverText": "查看和管理此对象的记录类型", "newLinkHover": "为此对象添加记录类型", "url": "/ui/setup/rectype/RecordTypes?type=Contact&setupid=ContactRecords", "newUrl": "/setup/ui/recordTypeWizard.jsp?type=Contact&retURL=%2F003%2Fo&setupid=ContactRecords", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F003%2Fo&tableEnumOrId=Contact&setupid=ContactValidations", "newUrl": "/03d/e?retURL=%2F003%2Fo&TableEnumOrId=Contact&Active=1&setupid=ContactValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=Contact&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=Contact&et=QUICK_CREATE&retURL=%2F003%2Fo&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3L/e?retURL=%2F003%2Fo&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑列", "hoverText": "自定义此列表中的列", "url": "/p/setup/layout/ListLayoutEdit?LayoutEntity=Contact&retURL=%2F003%2Fo&LayoutType=KeyList&setupid=ContactSearchLayouts", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "导入数据", "hoverText": "将数据导入此对象中", "url": "/setup/imp/orgimport_welcome.aspx", "newWindow": true, "newInNewWindow": false, "section": 2}]);
                                //new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds('', %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.aspx?setupid=ForceCom&retURL=%2F003%2Fo");
                            });
                        </script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F003%2Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1414115818481'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'),true,false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "HuOSPurfCPkAugRZLcPLRywsoCmg4F9BOkcRjLFvyNm.b5coN2rXPvHnNtvOaaFDhgsXt4ARXHwUD_hATsiPuvNwKxQWcms.4xiSRriKOKG7Yjk0X4vJjkOmPbo49i7uGSp8gx5zlGwYj4qZ._rb3PuRoyD9PZVK3FylR9MJ88FKTArAbAwwj2PWlJKc4kiztvk0gw=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
       <div class="bPageFooter noTableFooter">
    <div>
        <span class="brandQuaternaryFgr">Copyright &copy; 2021 inc. 公司版权所有，保留所有权利。</span>&nbsp;|&nbsp;<a
            title="邮编 （新窗口）" target="_blank" class="brandQuaternaryFgr" href="/postcode/map.htm">邮编</a>&nbsp;|&nbsp;<a
                title="电话区号 （新窗口）" target="_blank" class="brandQuaternaryFgr" href="/telecode/index.htm">电话区号</a>&nbsp;|&nbsp;<a
                    title="万年日 （新窗口）" target="_blank" class="brandQuaternaryFgr" href="/Calendar.htm">万年日</a>&nbsp;|&nbsp;<a
                    title="说明书 （新窗口）" target="_blank" class="brandQuaternaryFgr" href="/oaguide.doc">说明书</a>&nbsp;|&nbsp;<a
                    title="工作流说明视频 （新窗口）" target="_blank" class="brandQuaternaryFgr" href="/oahelp.avi">工作流说明视频</a>&nbsp;|&nbsp;<a
                    title="安卓客户端 （新窗口）" target="_blank" class="brandQuaternaryFgr" href="/Clfd.apk">安卓客户端</a><!--&nbsp;|&nbsp;<a
                        title="508 符合性 （新窗口）" class="brandQuaternaryFgr" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">508
                        符合性</a>--></div>
</div>
<div>
</div>
    </div>
    <!--<script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1414123018000, "host": "", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>-->
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <!--<script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
<!-- page generation time: 78ms -->