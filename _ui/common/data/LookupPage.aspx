﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LookupPage.aspx.cs" Inherits="WebClient._ui.common.data.LookupPage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html style="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>搜索 ~ .com - Professional Edition</title>
    <link href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411677186000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-29 上午10:22", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": true }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411676930000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411924653000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31.0/sprites/1411496412000/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //      ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '106.39.255.219', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26lknm%3Devt1%26lktp%3DStandardUserLookup%26lksrch%3Dliu%2Bjerryliu');</script>
</head>
<frameset rows='135,*' cols='250' framespacing='0' frameborder='0' border='0'>
<frame title='搜索' src='/_ui/common/data/LookupSearchFrame?lktp=<%=Request["lktp"]%>&lknm=<%=Request["lknm"]%>&lksrch=<%=Request["lksrch"]%>&lkfm=<%=Request["lkfm"]%>' name='searchFrame' id='searchFrame' frameborder='0' scrolling='Auto' noresize marginwidth='0' marginheight='0' framespacing='0'>
<frame title='结果' src='/_ui/common/data/LookupResultsFrame?lktp=<%=Request["lktp"]%>&lknm=<%=Request["lknm"]%>&lksrch=<%=Request["lksrch"]%>&lkfm=<%=Request["lkfm"]%>' name='resultsFrame' id='resultsFrame' frameborder='0' scrolling='Auto' marginwidth='0' marginheight='0' framespacing='0'>
</frameset>
</html>