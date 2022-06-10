<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docLib.aspx.cs" Inherits="WebClient.workspaces.docLib" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title></title>
    <link rel="shortcut icon" href="/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <cc1:StyleAdapter runat="server" id="StyleAdapter" />
   <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css">
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" type="text/css" rel="stylesheet">
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" type="text/css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/contentStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterCore.css">
    <script src="/static/111213/sfc/javascript/lib/firebug/firebug.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/GuidedTour.css">
    <script type="text/javascript" src="/static/111213/sfc/javascript/lib/prototype.js"></script>
    <script type="text/javascript" src="/EXT/ext-3.3.3/ext.js"></script>

    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script src="/jslibrary/sfdc/ShepherdBootstrap.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script>window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3",  "dateFormat": "yyyy-M-d", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1448430528000", "today": "2015-12-7 下午3:40", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false }, { "index": 368, "name": "LightningExperiencePreferred", "value": true }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'ContentSearch';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1448407022000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1449043158000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>


    <script type="text/javascript" src="/static/111213/sfc/javascript/lib/scriptaculous/scriptaculous.js"></script>
    <script type="text/javascript" src="/static/111213/js/picklist.js"></script>


    <script>
        Sfdc.onReady(function () {
            Shepherd.setIsRunningTests(false);
            Shepherd.Transport.initTransport({
                contentBaseUrl: '/sfc',
                shepherdServletPath: '/sfc/servlet.shepherd',
                contentStaticResourcesBase: '/static/111213/sfc',
                contentDomainUrl: 'https://c.ap1..force.com'
            });
            Shepherd.run('view', 'init', { isAlohaSkin: true });
            /*
             *  See W-1239606
             */
            if (Ext.isIE6) {
                Sfdc.History.init = Ext.emptyFn;
            }
        });
    </script>
    
    <!-- Body events -->
    <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMweE1pMHhNRlF3TnpvME1Eb3hNQzQwTnpSYSw0S1loS2VnWmw4V19TSEFvY1hwYlN2LFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMweE1pMHhNRlF3TnpvME1Eb3hNQzQwT1ROYSxXSWYzZDNVNldZZzJiSzc3eEJsckc3LFpXTmhaVEU1'); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'VmpFPSxNakF4TlMweE1pMHhNRlF3TnpvME1Eb3hNQzQxTURkYSxXdkFYS0FGeVpnTFNjRThGZWctQ3RBLFpXTmhaVEU1'); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMweE1pMHhNRlF3TnpvME1Eb3hNQzQxTVRKYSxRUmhrNTA0N3luclFOenl3OGJHZkIzLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</head>

<body id="ext-gen3" class="workspaceTab sfdcBody brandQuaternaryBgr workspaces" style="">

    <form id="sessiontimeout" method="post" name="sessiontimeout" onsubmit="if (window.ffInAlert) { return false; }">
        <input type="hidden" name="continueButton" id="continueButton" value="继续工作" /><input type="hidden" name="doNotTimeoutLocation" id="doNotTimeoutLocation" value="/page/timeoutrefresh.jsp" /><input type="hidden" name="doTimeoutLocation" id="doTimeoutLocation" value="https://login.salesforce.com/?ec=301&amp;startURL=%2Fpage%2Ftimeoutrefresh.jsp&amp;stbdtimeout=1" /><input type="hidden" name="logoutButton" id="logoutButton" value="退出" /><input type="hidden" name="timeoutText" id="timeoutText" value="由于安全原因，您的 Salesforce 会话即将超时。<br><br>您希望作何选择？" /></form>
    <script>var secondsLeftValue = 7173, secondsPopupValue = 7143, lastPageActivityTime = (new Date).getTime(), forceLogout = true; function startSessionTimer() { schedulePopup(7173, 7143) } function schedulePopup(a, b) { null != timeoutUniqueId && clearTimeout(timeoutUniqueId); forceLogout && null != redirectUniqueId && clearTimeout(redirectUniqueId); if (forceLogout) { redirectUniqueId = setTimeout(logout, 1E3 * a); } timeoutUniqueId = setTimeout(alertTimeout, 1E3 * b) } function logout() { (forceLogout && "function" == typeof getRTimeout) ? getRTimeout() : doLogout() } function doLogout() { window.location = "/secur/logout.aspx" } var alertWindow = null, parentWindow = null, timeoutUniqueId = null; redirectUniqueId = null; function updateSessionTimeouts(a, b) { "undefined" != typeof a && (secondsLeftValue = a); "undefined" != typeof b && (secondsPopupValue = b); lastPageActivityTime = (new Date).getTime(); schedulePopup(secondsLeftValue, secondsPopupValue); if (window.Sfdc && Sfdc.require && "undefined" != typeof SFDCSessionVars) { Sfdc.require("SfdcApp.SfdcSession", function () { SfdcApp.SfdcSession.updateExpires({ oid: SFDCSessionVars.oid, uid: UserContext.userId, expire: lastPageActivityTime + (secondsLeftValue * 1000) }) }); } } function updateRedirectTimeouts(a) { "undefined" != typeof a && (secondsLeftValue = a); null != redirectUniqueId && clearTimeout(redirectUniqueId); redirectUniqueId = setTimeout(logout, 1E3 * (secondsLeftValue)); } function alertTimeout() { "function" == typeof getSTimeout ? getSTimeout() : doAlertTimeout() } function doAlertTimeout() { timeoutUniqueId = null; alertWindow = window.open("/page/timeoutwarn.jsp", "_sToap1_salesforce_com", "width=360,height=280,location=no,dependent=no,resizable=yes,toolbar=no,status=no,directories=no,menubar=no,scrollbars=yes", !1); parentWindow = window; !alertWindow && forceLogout && setTimeout(parentWindow.doLogout(), 25E3); document.body.onfocus = alertFocus } function checkSessionTimeout() { var a = (new Date).getTime(); 5 >= secondsLeftValue - (a - lastPageActivityTime) / 1E3 ? (a = window.location.pathname + window.location.hash, window.location.search && 1 < window.location.search.length && (a += window.location.search), a = "/?ec=302&startURL=" + encodeURIComponent(a), top.location = a) : (lastPageActivityTime = a, startSessionTimer()) } function alertFocus() { alertWindow && (alertWindow.closed ? (alertWindow = null, document.body.onfocus = closePopup) : alertWindow.focus()) }</script>
    
    <div id="body_content" style="display: none;">
        <div id="container_pageHeader"></div>
        <div id="bubbleMask"></div>
                <div id="container_bubble" class="container_unused overlaycontainer overlayDialog">
            <div id="bubble_point"></div>
            <div class="topRight">
                <div class="topLeft">                    
                    <a href="javascript:void(0);" id="bubble_close" class="dialogClose" style="cursor: pointer;" title="&#20851;&#38381;" onclick="Shepherd.run('bubble', 'hide', {shepherdToken : 'VmpFPSxNakF4TlMweE1pMHhNRlF3TnpvME1Eb3hNQzQxTnpGYSxwTmVRd2RjSzZURjduZHBzM3hfWU5yLE9HVTVNamd6'});return false;"></a>
                    <h2>&nbsp;</h2>
                </div>
            </div>
            <div class="middle">
                <div class="innerContent overlaycontentbox" id="content_container">
                </div>
            </div>
            <div class="bottomRight">
                <div class="bottomLeft"></div>
            </div>
        </div>        
        <div id="bodyDiv" class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="trayWrapper">
                <div id="tray" style="display: none;"></div>
            </div>
            <table class="outer" border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td id="sidebarCell" class="sidebarCell">
                        <div id="sidebarDiv" class="fixed">
                            <div id="container_sidebar"></div>
                        </div>
                    </td>
                    <td class="oRight" valign="top">
                        <div id="container_content" class="container_unused">
                            <div class="bPageTitle" id="trayHolder">
                                <div class="ptBody secondaryPalette">
                                    <div class="content">
                                        <div id="versionIcon"></div>
                                        <img src="/s.gif" class="pageTitleIcon" id="pageTitleIcon" />
                                        <h1 class="pageType" id="pageTitle"></h1>
                                        <h2 class="pageDescription" id="pageDescription"></h2>
                                    </div>
                                    <div id="container_pageHelp"></div>
                                </div>
                                <div class="ptBreadcrumb">
                                    &nbsp;&#171;&nbsp;
					<a href="javascript:window.history.back();" id="backLink">&#36820;&#22238;</a>
                                </div>
                            </div>
                            <div id="cphBody"></div>
                            <div id="Div1">
                            </div>
                        </div>

                    </td>
                </tr>
            </table>
        </div>
        <div id="container_pageFooter"></div>
        <span id="hiddenIFrameHolder"></span>
    </div>
    <script>var docViewerOverlay = OverlayDialogElement.getDialog('docViewerOverlay');
        docViewerOverlay.isModal = true;
        docViewerOverlay.width = 730;
        docViewerOverlay.hasButtonsBar = false;
        docViewerOverlay.displayX = true;
        docViewerOverlay.allowKeyboardEsc = true;
        docViewerOverlay.extraClass = 'docViewerOverlay';
        docViewerOverlay.isAbsolutePositioned = false;
        docViewerOverlay.refreshOnClose = false;
        docViewerOverlay.isMovable = false;
        docViewerOverlay.setTitle('文件预览');
        docViewerOverlay.contents = '\u003Cdiv class=\"docViewerContainerParent\" id=\"docViewerContainerParent\"\u003E\u003Cdiv class=\"docViewerContainer\" id=\"docViewerContainer\"\u003E\u003C/div\u003E\u003C/div\u003E';
    </script>
    <iframe title="" style="display: none;" name="downloadIFrame" id="downloadIFrame" src="/sfc/null.htm"></iframe>
    <div id="devFooter" class="container_unused"></div>
    <script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "https://login..com/login/sessionserver190.html", "act": "u", "host": "login.salesforce.com", "oid": "00D90000000yvHG", "exp": 1449481183000 };</script>
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
    <script>		    (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1448407022000/sfdc/SfdcSessionBase198.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>		    (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1448407022000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
</body>
</html>







