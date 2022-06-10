<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Entityqlist.aspx.cs" Inherits="WebClient.apps.Entityqlist" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>查询列表: 主页 ~  - Developer Edition</title>
      <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/DataDotComClean.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DataDotComClean.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/Scheduling.js"></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-M-d", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "ap1.lightning.force.com", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1472152528000", "today": "2016-8-31 下午3:08", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Account';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/DataDotComClean.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1471979298000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1471979298000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>//ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '111.199.110.234', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F001%2Fo');</script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif accountTab  overviewPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
        <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.jsp?sfdc.setJsDomain=1" /><input type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login.salesforce.com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.jsp%3Fsfdc.setJsDomain%3D1&amp;stbdtimeout=1" /><input type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden" name="timeoutText" id="timeoutText" value="由于安全原因，您的 Salesforce 会话即将超时。<br><br>您希望作何选择？" /></form>
    <script>var secondsLeftValue = 7170, secondsPopupValue = 7140, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7170, 7140) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.jsp" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp?sfdc.setJsDomain=1", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    <a href="#skiplink" class="navSkipLink zen-skipLink zen-assistiveText">跳到主内容</a><div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:topright id="TopRight1" runat="server" />
            <uc1:mainnav id="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed">
                          <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img src="/s.gif" alt="客户" class="pageTitleIcon" title="客户" /><h1 class="pageType">客户<span class="titleSeparatingColon">:</span></h1>
                                        <h2 class="pageDescription">主页</h2>
                                        <div class="blank">&nbsp;</div>
                                    </div>
                                    <div class="links"></div>
                                </div>
                                <div class="ptBreadcrumb"></div>
                            </div>
                        <div class="filterOverview">
                            <form action="/001" id="filter_element" method="GET" name="filter_element" onsubmit="if (window.ffInAlert) { return false; }">
                                <div class="bFilterView">
                                    <span class="bFilter">
                                        <label for="fcf" style="text-align: left; font-weight: bold; padding-right: .69em;"><span class="assistiveText">*</span>视图：</label><span class="fBody"><select id="fcf" name="fcf" onchange="javascript:this.form.submit();" title="视图：">
                                            <%=Fcfs%>
                                        </select>
                                            <input value=" 转至！ " class="btn" name="go" onclick="javascript: this.form.submit();" title="转至！" type="button" /></span><span class="fFooter"><a href="/ui/list/FilterEditPage?id=00B90000008ViCQ&amp;retURL=%2F001&amp;cancelURL=%2F001%2Fo">编辑</a> | <a href="/ui/list/FilterEditPage?ftype=a&amp;retURL=%2F001&amp;cancelURL=%2F001%2Fo">新建视图</a></span></span>
                                </div>
                            </form>
                        </div>
                        <!-- Begin RelatedListElement -->
                        <div class="bRelatedList">
                            <!-- Begin ListElement -->

                            <!-- motif: Account -->

                            <!-- WrappingClass -->
                            <div class="hotListElement">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <form action="/001/o" id="hotlist" method="GET" name="hotlist" onsubmit="if (window.ffInAlert) { return false; }">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="12" height="1" class="minWidth" style="margin-right: 0.25em;" title="" />&nbsp;<h3>最近</h3>
                                                    </td>
                                                    <td class="pbButton">
                                                        <input value=" 新建 " class="btn" name="new" onclick="navigateToUrl('/001/e?retURL=%2F001%2Fo', null, 'new');" title="新建" style="height:25px;" type="button" /></td>
                                                    <td class="pbHelp">
                                                        <select id="hotlist_mode" name="hotlist_mode" onchange="submit();" title="显示所选内容">
                                                            <option value="2">最近创建</option>
                                                            <option value="1" selected="selected">最近修改</option>
                                                            <option value="3">最近查看</option>
                                                        </select></td>
                                                </tr>
                                            </table>
                                        </form>
                                    </div>
                                    <div class="pbBody">
                                         <%=BodyText %>
                                        <!--
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class=" zen-deemphasize">客户名</th>
                                                <th scope="col" class=" zen-deemphasize">开单城市</th>
                                                <th scope="col" class="PhoneNumberElement zen-deemphasize">电话</th>
                                            </tr>
                                         
                                            <tr class=" dataRow even first" onblur="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onmouseover="if (window.hiOn){hiOn(this);}">
                                                <th scope="row" class=" dataCell  "><a href="/00190000019mlFI">333</a></th>
                                                <td class=" dataCell  ">&nbsp;</td>
                                                <td class=" dataCell  PhoneNumberElement">&nbsp;</td>
                                            </tr>
                                         
                                            <tr class=" dataRow even last" onblur="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onmouseover="if (window.hiOn){hiOn(this);}">
                                                <th scope="row" class=" dataCell  "><a href="/00190000015a7IB">sForce</a></th>
                                                <td class=" dataCell  ">San Francisco</td>
                                                <td class=" dataCell  PhoneNumberElement">(415) 901-7000</td>
                                            </tr>
                                        </table>
                                        <div class="pShowMore"><a href="/setup/set_preference.jsp?retURL=%2F001%2Fo&amp;preference.value=10&amp;_CONFIRMATIONTOKEN=VmpFPSxNakF4Tmkwd09TMHdNMVF3Tnpvd09Eb3pOQzQ1T1RsYSxPLUk2OEF6X1hRQlhYSTZLSVNoUjFtLFlUSmtPVGt6" shouldstayinownframe="true">显示 10 项</a></div>
                                        -->
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <!-- End ListElement -->
                        </div>
                        <!-- End RelatedListElement -->
                                       <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F001%2Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1472627315046'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd09TMHdNMVF3Tnpvd09Eb3pOUzR3TlRGYSxaazJhcmtvdUltT3RxbVYtWnl1NmZHLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
         <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "https://login..com/login/sessionserver202.html", "act": "u", "host": "login..com", "oid": "00D90000000yvHG", "exp": 1472634485000 };</script>
    
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1466812160000/sfdc/SfdcSessionBase202.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1466812160000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
</body>
</html>
<!-- page generation time: 88ms -->
