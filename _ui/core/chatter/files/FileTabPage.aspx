<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileTabPage.aspx.cs" Inherits="WebClient._ui.core.chatter.files.FileTabPage" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/ZenPageHeader.ascx" TagName="FileMainNav" TagPrefix="uc1" %>
<!DOCTYPE html>
<html class="ext-strict zen brandQuaternaryBgr" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>文件 ~  - Developer Edition</title>
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-container.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zenifiedChatterPageBase.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/HelpBubble.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterCore.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterExtended.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/chatterBreadcrumbs.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ChatterFiles.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/ChatterFiles.js"></script>
    <script src="/jslibrary/sfdc/ChatterFilesTab.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1435272370000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-7-6 下午5:35", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "ZEN", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'File';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/zen-container.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/zenifiedChatterPageBase.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/chatterBreadcrumbs.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif fileTab  FileTabPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div class="zen-page" id="page">
        <div role="banner">
            <!--<header><div class="zen-headerTop zen-bgdThemed brandZeronaryBgr" id="appHeaderTop"><div class="zen-branding"><img src="/img/seasonLogos/2015_winter_aloha.png" alt="Salesforce Chatter" width="200" height="65" id="phHeaderLogoImage" title="Salesforce Chatter" /></div><div class="zen-navViaSearch" role="search"><form  action="/_ui/search/ui/UnifiedSearchResults" id="phSearchForm" method="GET" name="sbsearch" onsubmit="if (window.ffInAlert) { return false; }" ><input type="hidden" name="searchType" id="searchType" value="2" /><div class="headerSearchContainer" id="phSearchContainer"><div class="headerSearchLeftRoundedCorner"><div class="searchBoxClearContainer"><input  autocomplete="off" id="phSearchInput" maxlength="100" name="str" placeholder="搜索..." size="20" title="搜索..." type="text" value="" /><a class="headerSearchClearButton" href="javascript: void(0);" id="phSearchClearButton" name="phSearchClearButton" style="visibility:hidden" title="清除搜索词"></a></div><div class="headerSearchRightRoundedCorner" id="searchButtonContainer"><input value=" 搜索 "  id="phSearchButton" type="button" /></div></div></div></form></div><div class="zen-navViaMenus"><div role="navigation"><h1 class="zen-assistiveText">菜单</h1><nav><ul class="zen-navMenus"><li class="zen-menu zen-hasSubmenu zen-mrl"><div class="menuButton menuButtonRounded" id="userNav" title="liu jack 的用户菜单"><div class="menuButtonButton" id="userNavButton"><span  class="menuButtonLabel" id="userNavLabel" tabindex="0">liu jack</span><div class="userNav-buttonArrow mbrButtonArrow" id="userNav-arrow"></div><div class="userNavButton-btm mbrButton-btm mbrButton-rc"></div></div><div class="menuButtonMenu" id="userNavMenu"><div class="userNavMenu-tr mbrMenu-tr mbrMenu-rc"></div><div class="userNavMenu-tl mbrMenu-tl mbrMenu-rc"></div><div class="mbrMenuItems" id="userNav-menuItems"><a href="/_ui/core/userprofile/UserProfilePage" class="menuButtonMenuLink firstMenuItem" title="我的简档">我的简档</a><a href="/ui/setup/Setup?setupid=PersonalSetup" class="menuButtonMenuLink" title="我的设置">我的设置</a><a href="javascript:openPopupFocus%28%27%29%3B" class="menuButtonMenuLink debugLogLink" title="开发人员控制台 （新窗口）">开发人员控制台</a><a href="/secur/logout.aspx" class="menuButtonMenuLink" title="退出">退出</a></div><div class="userNavMenu-br mbrMenu-br mbrMenu-rc"></div><div class="userNavMenu-bc mbrMenu-bc"></div><div class="userNavMenu-bl mbrMenu-bl mbrMenu-rc"></div></div></div><script>   new MenuButtonRounded('userNav', false, 16);</script></li><li class="zen-menu zen-noSubmenu zen-mrl"><ul class="zen-inlineList zen-listLarge"><li class="zen-active"><a href="/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2F_ui%2Fcore%2Fchatter%2Ffiles%2FFileTabPage" id="setupLink" title="设置">设置</a></li><li class="zen-active"><a href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Flanguage%253Dzh_CN%2526release%253D192.8.8%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);" class="brandZeronaryFgr" title="帮助 （新窗口）">帮助</a></li></ul></li><li class="zen-menu zen-hasSubmenu zen-mrm"><div class="menuButton menuButtonRounded appSwitcher" id="tsid" title="Force.com 应用程序菜单"><div class="menuButtonButton" id="tsidButton"><span  class="menuButtonLabel" id="tsidLabel" tabindex="0">Salesforce Chatter</span><div class="tsid-buttonArrow mbrButtonArrow" id="tsid-arrow"></div><div class="tsidButton-btm mbrButton-btm mbrButton-rc"></div></div><div class="menuButtonMenu" id="tsidMenu"><div class="tsidMenu-tr mbrMenu-tr mbrMenu-rc"></div><div class="tsidMenu-tl mbrMenu-tl mbrMenu-rc"></div><div class="mbrMenuItems" id="tsid-menuItems"><a href="/home/home.jsp?tsid=02u900000017n3K" class="menuButtonMenuLink firstMenuItem">销售</a><a href="/home/home.jsp?tsid=02u900000017n3L" class="menuButtonMenuLink">Call Center</a><a href="/home/home.aspx?tsid=02u900000017n3M" class="menuButtonMenuLink">市场营销</a><a href="/app/mgmt/applauncher/appLauncher.apexp?tsid=02u90000001A4Br" class="menuButtonMenuLink">应用程序启动器</a><a href="/home/home.jsp?tsid=02u90000001A4Bs" class="menuButtonMenuLink">社区</a><a href="/home/home.jsp?tsid=02u90000001A4Bt" class="menuButtonMenuLink">Site.com</a><a href="/home/home.jsp?tsid=02u90000001A4Bz" class="menuButtonMenuLink">内容</a><a href="/servlet/servlet.Integration?lid=01r90000000wxsQ&amp;ic=1&amp;tsid=02u90000001A8WX" class="menuButtonMenuLink">MailChimp for Salesforce</a><hr class="menuSeparator" /><a href="https://www..com/appexchange" class="menuButtonMenuLink" target="_blank">AppExchange</a><a href="http://developer.force.com" class="menuButtonMenuLink" target="_blank">开发人员社区</a><a href="https://success.salesforce.com" class="menuButtonMenuLink" target="_blank">成功社区</a></div><div class="tsidMenu-br mbrMenu-br mbrMenu-rc"></div><div class="tsidMenu-bc mbrMenu-bc"></div><div class="tsidMenu-bl mbrMenu-bl mbrMenu-rc"></div></div></div><script>  new MenuButtonRounded('tsid', false, 16);</script></li></ul></nav></div></div></div><div class="zen-hasTabOrganizer zen-headerBottom brdPalette" id="tabContainer" role="navigation"><h1 class="zen-assistiveText">选项卡导航</h1><nav><ul class="zen-inlineList zen-tabMenu" id="tabBar"><li class="zen-firstItem" id="home_Tab"><a href="/home/home.aspx" title="主页选项卡">主页</a></li><li id="Chatter_Tab"><a href="/_ui/core/chatter/ui/ChatterPage" title="Chatter选项卡">Chatter</a></li><li id="UserProfile_Tab"><a href="/_ui/core/userprofile/UserProfilePage" title="简档选项卡">简档</a></li><li id="OtherUserProfile_Tab"><a href="/_ui/core/chatter/people/PeopleListPage" title="人员选项卡">人员</a></li><li id="CollaborationGroup_Tab"><a href="/_ui/core/chatter/groups/GroupListPage" title="小组选项卡">小组</a></li><li class="brandPrimaryBgr zen-active primaryPalette" id="File_Tab"><a href="/_ui/core/chatter/files/FileTabPage" class="brandPrimaryFgr" title="文件选项卡 - 已选取">文件</a><span class="zen-assistiveText">（当前选择的）</span></li><li id="AllTab_Tab"><a href="/home/showAllTabs.jsp">&nbsp;<img src="/s.gif" alt="所有选项卡"  class="allTabsArrow" title="所有选项卡"/>&nbsp;</a></li><li class="zen-notNeeded zen-lastItem zen-moreTabs" id="MoreTabs_Tab"><a href="javascript:void(0);" class="zen-assistiveLink" id="zen-moreTabsAssistiveLink" title="更多选项卡菜单（结束）"><b></b></a><ul id="MoreTabs_List"></ul></li></ul></nav></div></header>-->
            <uc1:FileMainNav runat="server" ID="FileMainNav1" />
        </div>
        <div class="zen-bodyZen brdPalette brandPrimaryBrd">
            <div id="bodyInner" class="zen-bodyInner">
                <div role="main" class="zen-main">
                    <a name="skiplink">
                        <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                            alt="内容在此开始" src="/s.gif"></a><div class="mainContentHeader zen-mbm"><!--
                                <ul class="zen-pipedList zen-end">
                                    <li class="zen-lastItem zen-firstItem"><span class="zen-media zen-mediaExt"><span
                                        class="zen-mediaBody"><a class="zen-deemphasize" href="javascript:openPopupFocusEscapePounds('', %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                            此页面的帮助</a><a title="此页面的帮助 （新窗口）" class="zen-imgExt" href="javascript:openPopupFocusEscapePounds('', %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><img
                                                title="帮助" class="helpIcon" alt="帮助" src="/s.gif"></a></span></span></li></ul>-->
                                <div class="zen-media">
                                    <img title="文件" class="zen-mls zen-img pageTitleIcon" alt="文件" src="/s.gif"><div
                                        class="zen-mediaBody">
                                        <h1 class="zen-man">
                                            文件</h1>
                                    </div>
                                </div>
                                <div class="ptBreadcrumb">
                                </div>
                            </div>
                    <script>                        //   chatter.getToolbox().setToken('4Ews6AmU0yJU7BoYt34PnmQwyPdFk1pYeU2VtdJTHjHMY6l1NHFKS6iwkh54iKp2n4c0KVrc8_ogqDIxBdoCxwf9qNelSaryoKotNKJY6afm7oqnm9Gc2t7GRXlRqs3Zkl2lzTSUhJpIVs6GwJvqDFiKats=');</script>
                    <div class="chatterFilesTabPage chatterListViewContainer">
                        <div class="chatterFilesTabPageHeader">
                            <div role="navigation" class="chatterBreadcrumbs">
                                <span id="headBreadcrumbNode"><a href="#">文档管理</a></span><img
                                    width="1" height="1" title="" class="breadcrumbSeparator breadcrumbSeparatorLtr"
                                    alt="" src="/s.gif"><span id="tailBreadcrumbNode" class="tailNode cxTailNode">文件</span></div>
                            <div class="pageHelpIconPanel"><!--
                                <a href="javascript:openPopupFocusEscapePounds('', %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                    <span class="helpLink">此页面的帮助</span>
                                    <img src="/s.gif" class="helpIcon" alt="此页面的帮助 （新窗口）" title="此页面的帮助 （新窗口）">
                                </a>-->
                            </div>
                        </div>
                        <div class="leftContent">
                            <div class="chatterFileBrowsePanel" id="chatterFileBrowsePanel">
                                <ul class="brandSideNav">
                                    <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '00D90000000yvHG', Chatter.FileBrowse.SELECTION_TYPES.ORG, '所有文件'); return false"
                                        class="linkItem selectedLinkItem" id="allFilesBrowseItem" title="所有文件 - 已选取"
                                        href="javascript:void(0);"><span class="hyperlinkTextSpan">所有文件</span></a> </li>
                                    <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '00D90000000yvHG', Chatter.FileBrowse.SELECTION_TYPES.RECENT, '最近'); return false"
                                        class="linkItem" id="recentFilesBrowseItem" title="最近" href="javascript:void(0);">
                                        <span class="hyperlinkTextSpan">最近</span></a> </li>
                                    <div class="subHeaderSpacer">
                                    </div>
                                    <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.ALL_USER_FILES, '我的文件', true); return false"
                                        class="linkItem fileBrowseSubHeader" title="我的文件" href="javascript:void(0);"><span
                                            class="hyperlinkTextSpan">我的文件</span></a>
                                        <ul id="chatterAllMyFiles">
                                            <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.USER, '由我所有'); return false"
                                                class="subLinkItem" title="由我所有" href="javascript:void(0);"><span class="hyperlinkTextSpan">
                                                    由我所有</span></a> </li>
                                            <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.SHARED_WITH_ME, '与我共享', true); return false"
                                                class="subLinkItem" title="与我共享" href="javascript:void(0);"><span class="hyperlinkTextSpan">
                                                    与我共享</span></a> </li><!--
                                            <li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.FOLLOWED_FILES_ONLY, '正在追随', true, false); return false"
                                                class="subLinkItem" title="正在追随" href="javascript:void(0);"><span class="hyperlinkTextSpan">
                                                    正在追随</span></a> </li>-->
                                        </ul>
                                    </li>
                                    <li class="liItem" style="display:block">
                                        <div class="subHeaderSpacer">
                                        </div>
                                        <div id="chatterFilesInScrollPanel">
                                           <!-- <a onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.ALL_GROUPS, '我的小组中的文件'); return false"
                                                class="linkItem fileBrowseSubHeader" id="chatterFilesInMyGroupsLink" title="我的小组中的文件"
                                                href="javascript:void(0);"><span class="hyperlinkTextSpan">我的小组中的文件</span></a>
                                            <ul id="chatterFilesInMyGroups">
                                            </ul>-->
                                            <div class="subHeaderSpacer">
                                            </div>
                                            <a onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.ALL_LIBRARIES, '我的文档库中的文件'); return false"
                                                class="linkItem fileBrowseSubHeader" id="contentFilesInWorkspacesLink" title="我的文档库中的文件"
                                                href="javascript:void(0);"><span class="hyperlinkTextSpan">我的文档库中的文件</span></a>
                                            <ul id="contentFilesInWorkspaces">
                                                <li class="liItem"><a class="subLinkItem" onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.PERSONAL_WORKSPACE, '专用库'); return false" title="专用库" href="javascript:void(0);"><span class="hyperlinkTextSpan">专用库</span></a></li>
                                                <%=FileLibHTML%>
                                                <!--<li class="liItem"><a onclick="Chatter.FileBrowse.clickHandler(this, '05890000000IfeE', Chatter.FileBrowse.SELECTION_TYPES.WORKSPACE, '办公文档'); return false"   class="subLinkItem" title="办公文档" href="javascript:void(0);"><span class="hyperlinkTextSpan">办公文档</span></a> </li>-->                                                        
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="rightContent">
                            <div class="browseLabelPanel" id="browseLabelPanel">
                                <h2 class="browseLabel" data-contentsfdc-filter="all" id="browseLabel">
                                    我具有访问权限的所有文件</h2>
                                <span class="browseDesc" id="browseDesc"></span>
                            </div>
                            <div class="zen fileSyncDowloadAndFeedbackHeaderDiv"><!--
                                <ul class="zen-pipedList">
                                    <li><a href="javascript:Sfdc.AccessibleFileSyncMobileDownloadDialog.open()">获取我们的移动应用程序</a></li></ul>-->
                            </div>
                            <div class="chatterFileListView">
                                <div class="chatterListViewContainer">
                                    <script src="/static/js/picklist.js"></script>
                                    <script>                                        //   new ContentListViewport('000000000000000', 'ContentVersionRecentlyViewedFileSearch', { "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "massEditable": false, "editable": false }, "rolodexIndex": -1, "entityButtons": [], "buttons": [], "listButtons": [], "retURL": "/_ui/core/chatter/files/FileDetailPage", "capped": false, "rowsPerPage": 25, "page": 1, "hasMassActions": false, "sortState": [{ "field": "last_modified", "dir": "DESC"}], "printURL": "/_ui/core/chatter/files/FileDetailPage", "listData": { "ACTION_COLUMN": [], "author": ["\u003Ca href=\"/_ui/core/userprofile/UserProfilePage?u=0059000000390Wh\" class=\"filesOwnerLink\" title=\"liu jack\"\u003Eliu jack\u003C/a\u003E"], "last_modified": ["\u003Cspan  title=\"今天, 下午2:54\"\u003E下午2:54\u003C/span\u003E"], "title": ["&amp;nbsp;\u003Ca href=\"/069900000017xZK\"\u003E\u003Cspan class=\"fileTypeIcon\"\u003E\u003Cimg src=\"/s.gif\" alt=\"CSV\" width=\"32\" height=\"32\" class=\"sprite-doctype_csv_32\" title=\"CSV\" /\u003E&amp;nbsp;\u003C/span\u003E\u003C/a\u003E\u003Ca href=\"/069900000017xZK\" class=\"fileNameLink\"\u003E\u003Cspan  class=\"fileName\" id=\"069900000017xZKAAY_title\" title=\"contact\"\u003Econtact\u003C/span\u003E\u003C/a\u003E"], "LIST_RECORD_ID": ["068900000018gIV"], "actions": ["\u003Cimg src=\"/s.gif\" alt=\"\"  class=\"emptyActionIcon\" /\u003E\u003Ca href=\"javascript: void(0);\" title=\"停止追随该文件以停止接收摘要中的更新。\" revtitle=\"追随该文件以接收摘要中的更新。\" entityid=\"069900000017xZK\" class=\"chatterFollowUnfollowAction  unfollow\" onclick=\"chatter.getFollowUnfollowListAction().toggle(this)\"\u003E\u003C/a\u003E\u003Ca href=\"javascript:Sfdc.ChatterFileFeedActions.openPopup%28%27ActionLink069900000017xZK%27%29%3B\" class=\"more-file-actions\" id=\"ActionLink069900000017xZK\" title=\"打开更多操作列表\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"content-action-link-arrow\" title=\"\" /\u003E\u003C/a\u003E\n\u003Cdiv id=\"contentActionMenuActionLink069900000017xZK\" class=\"contentActionMenu\" docId=\"069900000017xZK\" rendition=\"false\" subscribed=\"true\" sharing=\"true\" role=\"menu\"\u003E\n        \u003Ca href=\"javascript:Sfdc.ChatterFileFeedActions.closePopup(%27contentActionMenuActionLink069900000017xZK%27);\" title=\"关闭更多操作列表\" tabindex=\"-1\" class=\"more-file-actions compactLink\"\u003E\u003Cimg class=\"content-action-link-arrow\" src=\"/s.gif\" alt=\"\"/\u003E\u003C/a\u003E\n      \t    \n\t    \t       \u003Cdiv class=\"contentActionMenuItem\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"https://c.ap1.content.force.com/sfc/servlet.shepherd/version/download/068900000018gIV?asPdf=false&amp;amp;operationContext=CHATTER\" class=\"contentActionLink\" shouldstayinownframe=\"true\"\u003E\u003Cimg src=\"/img/s.gif\" alt=\"\"  width=\"1\" height=\"1\" class=\"chatterFileIcon downloadItemIcon\" /\u003E\u003Cspan  class=\"contentActionLabel\"\u003E下载  csv\u003C/span\u003E\u003Cspan  class=\"contentActionLabel fileSize\"\u003E(1&amp;nbsp;KB)\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n    \t    \n    \t       \u003Cdiv class=\"contentActionMenuItem upload unchecked blockLinkItem\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:void();\" class=\"contentActionLink\"\u003E\u003Cspan class=\"docid hidden\"\u003E069900000017xZK\u003C/span\u003E\u003Cimg class=\"chatterFileIcon uploadIcon\" alt=\"\" src=\"/s.gif\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E上载新版本\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n    \t    \n    \t\t\t\t\u003Cdiv class=\"hr\"\u003E\n        \t  \t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithPeople%28%27069900000017xZK%27%2C%27contact%27%2C%20%270059000000390Wh%27%2C%20%27%2Ffile%2Fsharedwithwizard%2F%27%2C%20%27%27%2C%20%27%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E与人共享\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n        \t  \t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithGroups%28%27069900000017xZK%27%2C%20%27contact%27%2C%270059000000390Wh%27%2C%20%27%2Ffile%2Fsharedwithwizard%2F%27%2C%27%27%2C%20%27%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E与小组共享\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n    \t\t  \t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFilePublicLinksDialog.showDialog%28%27069900000017xZK%27%2C%27068900000018gIV%27%2C%20%27contact%27%2C%20%27%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E通过链接共享\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n\t      \t\t\t\u003C/div\u003E\n      \t\t\t\u003Cdiv class=\"hr\"\u003E\n    \t\t\t\t\u003Cdiv class=\"contentActionMenuItem blockLinkItem emptyIcon\" tabindex=\"-1\" role=\"menuitem\"\u003E\u003Ca href=\"javascript:Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList%28%27contact%27%2C%20%27069900000017xZK%27%29%3B\" class=\"contentActionLink\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"emptyIcon\"/\u003E\u003Cspan class=\"contentActionLabel\"\u003E共享设置\u003C/span\u003E\u003C/a\u003E\u003C/div\u003E\n      \t\t\t\u003C/div\u003E\n\u003C/div\u003E\n"], "ACTION_COLUMN_LABELS": [] }, "filter": { "staticTranslation": true, "scopeEntity": "", "scope": -1, "entityType": "069", "type": "ContentVersionRecentlyViewedFileSearch", "editable": false, "id": "000000000000000", "scopeEntity2": "", "bodyClass": "contentSearchTab", "isCloneable": false, "showCheckBox": false, "name": "选择一个要附加的文件", "isCreateNewDisplayed": true, "owner": "000000000000000", "shownColumns": [{ "useRolodex": true, "isSortable": true, "columnName": "actions", "label": "操作" }, { "useRolodex": true, "isSortable": true, "columnName": "title", "label": "名称" }, { "useRolodex": true, "isSortable": true, "columnName": "author", "label": "所有人" }, { "useRolodex": false, "isSortable": true, "columnName": "last_modified", "label": "上次修改时间"}], "language": "CHINESE_SIMP", "filters": [] }, "totalRowCount": 1 }, '00D90000000yvHG', false, '搜索所有文件...', false, '', undefined, true, false, null, null);
                                        new ContentListViewport('000000000000000', 'ContentVersionRecentlyViewedFileSearch', { "inlineEditData": { "saveUrl": "/_ui/common/udd/object/InlineEditListSave", "massEditable": false, "editable": false }, "rolodexIndex": -1, "entityButtons": [], "buttons": [], "listButtons": [], "retURL": "/_ui/core/chatter/files/FileDetailPage", "capped": false, "rowsPerPage": 25, "page": 1, "hasMassActions": false, "sortState": [{ "field": "last_modified", "dir": "DESC"}], "printURL": "/_ui/core/chatter/files/FileDetailPage", "listData": {}, "filter": { "staticTranslation": true, "scopeEntity": "", "scope": -1, "entityType": "069", "type": "ContentVersionRecentlyViewedFileSearch", "editable": false, "id": "000000000000000", "scopeEntity2": "", "bodyClass": "contentSearchTab", "isCloneable": false, "showCheckBox": false, "name": "选择一个要附加的文件", "isCreateNewDisplayed": true, "owner": "000000000000000", "shownColumns": [{ "useRolodex": true, "isSortable": true, "columnName": "actions", "label": "操作" }, { "useRolodex": true, "isSortable": true, "columnName": "title", "label": "名称" }, { "useRolodex": true, "isSortable": true, "columnName": "author", "label": "所有人" }, { "useRolodex": false, "isSortable": true, "columnName": "last_modified", "label": "上次修改时间"}], "language": "CHINESE_SIMP", "filters": [] }, "totalRowCount": 1 }, '00D90000000yvHG', false, '搜索所有文件...', false, '', undefined, true, false, null, null);
                                        
                                    </script>
                                    <div id="000000000000000_wrapper" class="individualPalette listViewportWrapper">
                                        <div id="000000000000000_listViewport" class="listViewport chatterFileListBlock">
                                            <form onsubmit="return ListViewport.instances['000000000000000'].verify('请至少选择一行')"
                                            name="000000000000000_actionForm" method="POST" id="000000000000000_actionForm" action="">
                                            <input type="hidden" value="" name="000000000000000_pageState" id="000000000000000_pageState"><input
                                                type="hidden" value="" name="000000000000000_rolodexState" id="000000000000000_rolodexState"><input
                                                    type="hidden" value="/_ui/core/chatter/files/FileTabPage" name="retURL" id="retURL"><div
                                                        id="000000000000000_topNav" class="topNav primaryPalette">
                                                        <div class="controls multiUploadControl">
                                                            <div class="blueBar brandSecondaryBrd">
                                                            </div>
                                                            <div id="fileUploaderDiv" class="uploadFile dragDropZoneDiv" style="visibility: visible;">
                                                                <div id="fileUploadBtnDiv" class="btnImportant dragDropZoneButton" style="position: relative;
                                                                    overflow: hidden; direction: ltr;" data-uidsfdc="13">
                                                                    <img width="12" height="12" title="" class="uploadArrow" alt="" src="/static/184/img/chatterfiles/uploadWhiteArrow12.png"><a
                                                                        id="uploadFileButtonLink" class="uploadFileButtonLink" href="javascript:void(0)"
                                                                        onclick="" data-uidsfdc="12" style="display: none;">上载文件</a><!--<input type="file" name="chatterFile_upload"
                                                                            title="上载文件" multiple="multiple" class="multifile-upload-input-button" id="multiFileInput"
                                                                            data-uidsfdc="14" />--></div>
                                                                <script>

                                                                    Sfdc.onReady(function () {

                                                                        Sfdc.ChatterFileUploader.hookupInputForMultiFileUpload({ "btnDivId": "fileUploadBtnDiv", "enableMultiFileUploading": true, "enableMultiFileUploadingForIE": true, "filterParentId": "00D90000000yvHG", "parentEntityName": "yz", "maxFileSize": 2147483648, "maxFileSizeLabel": "2.0&amp;nbsp;GB", "swfUrlPrefix": "/_swf/192001/sfc", "multiUploadHelpUrl": "javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" });
                                                                    });
                                                                </script>
                                                                <div class="multifile-upload-draganddrop-indicactor">
                                                                    <span>或者拖放以添加文件...</span></div>
                                                            </div>
                                                            <div id="000000000000000_search">
                                                            </div>
                                                            <div class="clearingBox">
                                                            </div>
                                                        </div>
                                                    </div>
                                            <div id="000000000000000_subNav" class="subNav">
                                                <div class="linkBar brandSecondaryBrd">
                                                    <div id="000000000000000_listButtons" class="listButtons">
                                                    </div>
                                                    <div class="clearingBox">
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="000000000000000_listBody" class="listBody">
                                                <div class="zen-listView FileListView zen-listViewFixed zen-listView-sfdc_listView_335132"
                                                    id="sfdc:listView:335132" data-uidsfdc="78">
                                                    <div class="zen-header">
                                                        <h2 class="zen-title">
                                                        </h2>
                                                        <div class="zen-facet zen-facetheader">
                                                        </div>
                                                    </div>
                                                    <div class="zen-navigation">
                                                        <div class="zen-facet zen-facetnavigation">
                                                            <div class="zen-searchBox" id="searchBox:52" style="position: relative;" data-uidsfdc="54">
                                                                <label class="zen-assistiveText" for="searchBox:52:input">
                                                                    搜索所有文件...</label><input type="text" id="searchBox:52:input" title="搜索所有文件..." autocomplete="off"
                                                                        aria-expanded="false" aria-haspopup="true" placeholder="搜索所有文件..." value="" maxlength="100"
                                                                        style="position: relative;" data-uidsfdc="55"><a class="zen-clearInput" href="#"
                                                                            title="" data-uidsfdc="56"></a><a class="zen-mls zen-pas zen-btn zen-searchButton"
                                                                                href="#" title="搜索" data-uidsfdc="57">搜索</a></div>
                                                        </div>
                                                    </div>
                                                    <div class="zen-content">
                                                        <table class="zen-data zen-columnSort ui-listView-ui_listView_189530" id="ui:listView:189530"
                                                            data-uidsfdc="60">
                                                            <thead>
                                                                <tr class="">
                                                                    <th tabindex="-1" title="操作" class="zen-first-child actions" scope="col">
                                                                        操作<span class="zen-visualization"></span>
                                                                    </th>
                                                                    <th tabindex="-1" title="名称" class="title" scope="col">
                                                                        名称<span class="zen-visualization"></span>
                                                                    </th>
                                                                    <th tabindex="-1" title="所有人" class="author" scope="col">
                                                                        所有人<span class="zen-visualization"></span>
                                                                    </th>
                                                                    <th tabindex="-1" title="上次修改时间" class="zen-last-child last_modified" scope="col">
                                                                        上次修改时间<span class="zen-visualization"></span>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                            </tfoot>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                        <div class="zen-loader">
                                                            <div class="zen-background">
                                                            </div>
                                                            <div class="zen-content">
                                                                正在加载...</div>
                                                        </div>
                                                    </div>
                                                    <div class="zen-footer">
                                                        <div class="zen-facet zen-facetfooter">
                                                            <div class="zen-pager zen-pagerPageInfo" data-uidsfdc="67">
                                                                <span class="zen-pagerControl">1 - 1 共 个 1</span></div>
                                                            <div class="zen-pager zen-pagerNextPrevious" data-uidsfdc="68">
                                                                <a class="zen-pagerControl zen-first zen-disabled" href="#" aria-disabled="true"
                                                                    data-uidsfdc="69"><span title="第一页" class="zen-visualization"></span><span class="zen-label">
                                                                        第一页</span></a><a class="zen-pagerControl zen-previous zen-disabled" href="#" aria-disabled="true"
                                                                            data-uidsfdc="72"><span title="上一页" class="zen-visualization"></span><span class="zen-label">上一页</span></a><a
                                                                                class="zen-pagerControl zen-next zen-disabled" href="#" aria-disabled="true"
                                                                                data-uidsfdc="71"><span class="zen-label">下一页</span><span title="下一页" class="zen-visualization"></span></a><a
                                                                                    class="zen-pagerControl zen-last zen-disabled" href="#" aria-disabled="true"
                                                                                    data-uidsfdc="70"><span class="zen-label">最后一页</span><span title="最后一页" class="zen-visualization"></span></a></div>
                                                            <div class="zen-pager zen-pagerJumpToPage" data-uidsfdc="73">
                                                                <label for="pagerJumpToPage_649633">
                                                                    页</label><input type="text" data-skipfocus="true" class="zen-input zen-inputTiny zen-pagerControl"
                                                                        id="pagerJumpToPage_649633" aria-readonly="true" readonly="" data-uidsfdc="74"><label
                                                                            for="pagerJumpToPage_649633">共 个<span class="zen-pagerControl">1</span></label></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="000000000000000_offPageIds" class="offPageIds">
                                            </div>
                                            </form>
                                            <div id="000000000000000_bottomNav" class="bottomNav">
                                                正在加载...</div>
                                        </div>
                                        <div style="display: none" id="000000000000000_feedContainer" class="feedContainer">
                                            <div id="000000000000000_feedBody" class="feedBody">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Body events -->
                    <script type="text/javascript">
                        function bodyOnLoad() {
                            setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
                            if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ;
                            //if (this.loadChatFrameJs) loadChatFrameJs();
                            //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                            new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                            new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                            if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                        }
                        function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                        function bodyOnFocus() { closePopupOnBodyFocus(); }
                        function bodyOnUnload() { }
                    </script>
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
                                    href="javascript:%20void%280%29%3B">今天</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <cc1:ZenPageFooter runat="server" ID="ZenPageFooter1" />        
    </div>
    <!--<script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1413822887000, "host": "", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>-->
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
    <!--<script>            var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1406927496000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script async="" defer="" src="/jslibrary/sfdc/SfdcSessionBase190.js"></script>-->
</body>
</html>