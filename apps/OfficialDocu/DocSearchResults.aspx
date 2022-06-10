<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocSearchResults.aspx.cs"
    Inherits="WebClient.apps.OfficialDocu.DocSearchResults" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>公文搜索结果 ~  - Developer Edition</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/TagSearchResultsPage.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/searchPage.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/searchPageV2.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterCore.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterExtended.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/HelpBubble.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterBreadcrumbs.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext-core.js"></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/ChatterGroups.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Scheduling.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/SearchClickTracking.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/SearchOnly.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/UnifiedSearchLogging.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/UnifiedSearch_source.js"></script>
    <script>        window.sfdcPage = new SfdcApp.Search.Page();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-5-26 上午10:05", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Setup';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/TagSearchResultsPage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/searchPage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/searchPageV2.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/chatterBreadcrumbs.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>      //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '111.161.17.27', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fsearch%2Fui%2FUnifiedSearchResults%3FsearchType%3D2%26sen%3D087%26sen%3Dka%26sen%3D800%26sen%3Da0F%26sen%3D801%26sen%3D005%26sen%3D006%26sen%3D701%26sen%3D00Q%26sen%3Da0I%26sen%3D501%26sen%3D001%26sen%3D003%26sen%3D500%26str%3Dexpr');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif homeTab searchResults UnifiedSearchResults  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
     <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" /><div
        id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
             <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outerNoSidebar" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="noSidebarCell">
                        <!-- Start page content table -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader">
                                                搜索结果</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:%20void%280%29%3B" class="configLinks zen-deemphasize" id="guidedTourLink">
                                                指导教程</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                    title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                        class="helpIcon" /></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <!-- this IFRAME is used only in IE7 for AJAX History support -->
                        <iframe id="history-iframe" class="hidden" title=""></iframe>
                        <div id="searchPageHolderDiv">
                            <div id="searchingMask">
                            </div>
                            <div id="searchingMessage">
                                <span>正在搜索...</span>
                            </div>
                            <div class="searchActionMenu" id="pinnedActionMenu">
                                <ul>
                                    <li class="searchActionMenuItem" data-menucommand="pin"><a href="javascript:void(0);">
                                        固定到顶部</a> </li>
                                    <li class="searchActionMenuItem" data-menucommand="unpin"><a href="javascript:void(0);">
                                        取消固定</a> </li>
                                </ul>
                            </div>
                            <table width="100%" height="100%" class="outer" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td class="searchSidetabsCell" id="searchSidetabs">
                                            <div class="setupMru sidetabsContainer" id="searchSidetabsDiv">
                                                <h2 id="feedToggle" class="feedToggle toggleoff" style="display:none">
                                                    <div class="feedToggleIcon">
                                                        <img title="搜索摘要" alt="搜索摘要" src="/s.gif" /></div>
                                                    <div class="feedToggleLink">
                                                        <a href="javascript:void(0);" class="feedToggleText">搜索摘要</a>
                                                    </div>
                                                    <div style="clear: both;">
                                                    </div>
                                                </h2>
                                                <h2 id="recordToggle" class="recordToggle toggleon">
                                                    <div class="recordToggleIcon">
                                                        <img title="" alt="" src="/s.gif" /></div>
                                                    <div class="recordToggleLink">
                                                        <a href="javascript:void(0);" class="recordToggleText">记录</a>
                                                    </div>
                                                </h2>
                                                <div id="records" class="records" style="display: block">
                                                    <ul class="searchEntityList leftNavWrapper leftNavWrapperV3" id="selectedDrilldown"
                                                        style="display: none">
                                                        <li class="itemLink"></li>
                                                    </ul>
                                                    <div id="leftnavwrapper" class="leftNavWrapper leftNavWrapperV3">
                                                        <div id="selectedObjects" class="selectedObjects selectedObjectsV3">
                                                            <h3 class="assistiveText">
                                                                常用对象</h3>
                                                            <ul class="searchEntityList" id="selectedSummary">
                                                                <li class="itemLink itemLinkV3">
                                                                    <div class="item itemV3" id='sidetabLink-A09' data_title="发文" data_relatedlistdomid="Contact"
                                                                        limit_item_i_own="enabled">
                                                                        <a href="javascript: void(0);" title="发文 (0)" class="noresults linkSelector  linkSelectorV3">
                                                                            <span class="truncate">发文</span> <span class="resultCount">&nbsp;(0)</span>
                                                                        </a>
                                                                        <div style="clear: both;">
                                                                        </div>
                                                                    </div>
                                                                    <a href="javascript:void(0);" title="将 发文 固定到顶部" id="action-A09" data_unpinnedtitle="将 发文 固定到顶部"
                                                                        data_pinnedtitle="打开更多操作菜单" class="itemActionBtn itemUnpinned"></a></li>
                                                                <li class="itemLink itemLinkV3">
                                                                    <div class="item itemV3" id='sidetabLink-A08' data_title="收文" data_relatedlistdomid="KnowledgeArticleVersion"
                                                                        limit_item_i_own="enabled">
                                                                        <a href="javascript: void(0);" title="收文 (0)" class="noresults linkSelector  linkSelectorV3">
                                                                            <span class="truncate">收文</span> <span class="resultCount">&nbsp;(0)</span>
                                                                        </a>
                                                                        <div style="clear: both;">
                                                                        </div>
                                                                    </div>
                                                                    <a href="javascript:void(0);" title="将 收文 固定到顶部" id="action-A08" data_unpinnedtitle="将 收文 固定到顶部"
                                                                        data_pinnedtitle="打开更多操作菜单" class="itemActionBtn itemUnpinned"></a></li>
                                                              
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h3 class="assistiveText">
                                                        搜索全部</h3>
                                                    <div class="searchAllLink dottedSeparator searchAllLinkV3">
                                                        <a href="javascript: void(0);" id="searchAll" title="搜索全部">搜索全部</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="searchResultsCell">
                                            <div id="secondSearchDiv">
                                                <form id="secondSearchForm">
                                                <div class="search2TextInputContainer">
                                                    <input id="secondSearchText" maxlength="100" type="text" value="" title="重新搜索" />
                                                </div>
                                                <div class="search2SubmitBtnContainer">
                                                    <input type="submit" id="secondSearchButton" class="btn" value="重新搜索" />
                                                    <span class="search2InfoIconContainer">
                                                        <div class="mouseOverInfoOuter" id="secondSearchInfo" onfocus="addMouseOver(this)"
                                                            onmouseover="addMouseOver(this)" tabindex="0">
                                                            <img src="/s.gif" alt="" class="infoIcon" title="" /><div class="mouseOverInfo" id="secondSearchInfo_inner"
                                                                style="display: none;">
                                                                使用当前视图中尝试新搜索。</div>
                                                        </div>
                                                    </span>
                                                </div>
                                                <div class="searchMoreOptions" id="searchMoreOptions">
                                                    <span id="searchMoreOptionsText"></span><a href="javascript:void(0);" id="searchMoreOptionsLink">
                                                        选项...</a>
                                                </div>
                                                <div style="visibility: hidden;" class="searchMoreOptionsOverlay" id="searchMoreOptionsOverlay">
                                                    <div class="searchMoreOptionsFieldsContainer">
                                                        <fieldset>
                                                            <legend class="moreOptionsHeader">选项</legend>
                                                            <ul>
                                                                <li>
                                                                    <input type="checkbox" id="moreOptionsLimitToItemsIOwn">
                                                                    <label for="moreOptionsLimitToItemsIOwn" class="moreOptionsLimitToItemsIOwnLabel">
                                                                        限于我拥有的项目
                                                                    </label>
                                                                </li>
                                                                <li>
                                                                    <input type="checkbox" id="moreOptionsExactPhrase">
                                                                    <label for="moreOptionsExactPhrase" class="moreOptionsExactPhraseLabel">
                                                                        精确短语</label>
                                                                </li>
                                                            </ul>
                                                        </fieldset>
                                                        <input type="button" class="btn moreOptionsSearchButton" title="保存&搜索" value="保存&搜索"
                                                            id="moreOptionsSearchBtn">
                                                    </div>
                                                    <a href="javascript:void(0);" title="关闭" id="searchMoreOptionsOverlayX" onmouseout="this.className = 'dialogClose'"
                                                        class="closeSearchMoreOptionOverlay dialogClose" onmouseover="this.className = 'dialogCloseOn'">
                                                    </a>
                                                </div>
                                                <div style="clear: both;">
                                                </div>
                                                </form>
                                            </div>
                                            <div id="searchBody">
                                                <!--make sure that, even if the summaryList is empty but if we have the partial search results, we still need the spacer-->
                                                <div class="individualPalette" id="searchResultsHolderDiv">
                                                    <script>                                                        chatter.getToolbox().setToken('SzhdyX2GHjH8Y4YQDD6vrz4Gnw4cy1h.AGQyYwxLpWRDmB69j98kjgWrCwQPojKeyouTKmCBcYpBWPmgkbfJsW5pyRLU.ha0GFd2sKEZuMf0_viBh.2.t..bRCYOSiGVlZtAfABvEgLECLWXBtoM09mQWCw=');</script>
                                                    <div class="messages">
                                                    </div>
                                                    <div class="searchResultsMessageContainer">
                                                        <div class="message warningM4" id="searchResultsWarningMessageBox">
                                                            <table class="messageTable" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <img src="/s.gif" alt="警告" class="msgIcon" title="警告" />
                                                                    </td>
                                                                    <td class="messageCell">
                                                                        <div class="messageText">
                                                                            找不到匹配目标</div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <script>                                                            if (window.sfdcPage) sfdcPage.registerMessage('searchResultsWarningMessageBox');</script>
                                                    </div>
                                                    <div class="searchResultsTipsContainer">
                                                        <div class="searchResultsTipsHeader">
                                                            搜索提示</div>
                                                        <ul>
                                                            <li>尝试搜索 <a href="/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=087&sen=ka&sen=800&sen=a0F&sen=801&sen=005&sen=006&sen=701&sen=00Q&sen=a0I&sen=501&sen=001&sen=003&sen=500&str=expr*">
                                                                expr*</a>（开头）。</li>
                                                            <li>查看&nbsp;<a href="/_ui/search/ui/UnifiedSearchResults?searchType=2&amp;sen=087&amp;sen=ka&amp;sen=800&amp;sen=a0F&amp;sen=801&amp;sen=005&amp;sen=006&amp;sen=701&amp;sen=00Q&amp;sen=a0I&amp;sen=501&amp;sen=001&amp;sen=003&amp;sen=500&amp;str=expr&amp;initialViewMode=feeds"
                                                                shouldstayinownframe="true">摘要结果.</a></li>
                                                            <li>用通配符和运算符精简搜索。 <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                                title="了解详细信息（新窗口）">了解详细信息</a> <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                                    title="了解详细信息（新窗口）">
                                                                    <img src="/s.gif" alt="" class="helpIcon" /></a> </li>
                                                        </ul>
                                                    </div>
                                                    <div class="searchResultsBottomButtons">
                                                        <div>
                                                            <a href="javascript: void(0);" class="btn" id="searchAllSummaryView" title="搜索全部">搜索全部</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- used for automated testing to identify version -->
                        <div id="searchResultUIVersion" style="visibility: hidden">
                            Pilot</div>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); window.sfdcPage.setSearchRequestInfo({ "initialViewMode": "summary", "str": "", "sen": ["A08", "A09"] }); window.sfdcPage.setSearchParameters({ "rankMap": { "087": 11, "800": 13, "a0F": 10, "801": 7, "ka": 2, "005": 5, "006": 9, "701": 3, "00Q": 6, "a0I": 14, "501": 12, "001": 8, "003": 1, "500": 4 }, "labelOrderMap": { "0WL": 19, "01t": 22, "00P": 14, "015": 6, "a0T": 7, "00O": 26, "a0Q": 9, "0F9": 3, "0WB": 20, "068": 5, "0WA": 17, "a0D": 30, "0WD": 15, "a0C": 21, "0WC": 18, "0WE": 8, "a0E": 29, "0W8": 16, "0JZ": 12, "a0G": 28, "0W7": 10, "a0J": 27, "007": 11, "002": 23, "06E": 32, "a0M": 4, "a00": 24, "02i": 1, "0TO": 2, "a07": 31, "00a": 13, "0Q0": 25 }, "isDefaultToSearchAll": false, "guidedTourUserPrefName": "HideUnifiedSearchGuidedTour", "pinnedMap": {}, "unifiedSearchPageVersion": "V3", "relatedListServletUrl": "/_ui/search/ui/UnifiedSearchResults", "firstPageQueryIdOverride": "-p6paefur", "ajaxServletUrl": "/_ui/common/search/client/ui/ajax/UnifiedSearchAjaxServlet", "ajaxServletCSRFToken": "0eOgAgPJkVce8rwEMf7knu.Qp5l3mA02HvAAisjCvBnvB3kHdu8nGWWLpWZJNAYSfWp9EMPPD37aed9YFV0H7jtqfq0.3fyS7kZ3x3YSE2ZxRGolZ_dUBqLtNiTGHbkMZPwnvarfJlm7sdkYvzkOFCdpLDa6cBggh9BpMx7Qa9GYR3XAdkGq11gWrDk8I.Xf_iVbvA==" }); window.sfdcPage.onLoadUpdateState(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'YL'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F_ui%2Fsearch%2Fui%2FUnifiedSearchResults%3FsearchType%3D2%26sen%3D087%26sen%3Dka%26sen%3D800%26sen%3Da0F%26sen%3D801%26sen%3D005%26sen%3D006%26sen%3D701%26sen%3D00Q%26sen%3Da0I%26sen%3D501%26sen%3D001%26sen%3D003%26sen%3D500%26str%3Dexpr&isAjaxRequest=1&renderMode=RETRO&nocache=1432605938523'; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { window.sfdcPage.addUnloadClearState(); }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>       
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>  
</body>
</html>
<!-- page generation time: 136ms -->
