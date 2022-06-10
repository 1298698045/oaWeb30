<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewVersionFile.aspx.cs" Inherits="WebClient.workspaces.ViewVersionFile" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:ui="http://www..com/ui/accent/sfdccmp/ui" xmlns:config="http://www..com/ui/accent/sfdccmp/ui" xmlns:facet="http://www..com/ui/accent/sfdccmp/ui" xmlns:data="http://www..com/ui/accent/sfdccmp/data" xmlns:chatter="http://www..com/ui/accent/sfdccmp/chatter" xmlns:sfdc="http://www..com/ui/accent/sfdccmp/sfdc" class="  ext-strict">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>CRM Content：协查员</title>
    <link href="/favicon.ico" rel="shortcut icon">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css">
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" type="text/css" rel="stylesheet">
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ExtCSS-SFDC.css" type="text/css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/contentStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterCore.css">
    <script src="/static/111213/sfc/javascript/lib/firebug/firebug.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/zh/base/GuidedTour.css">
    <script src="/static/111213/sfc/javascript/lib/prototype.js" type="text/javascript"></script>
    <script src="/EXT/ext-3.3.3/ext.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script src="/jslibrary/sfdc/ShepherdBootstrap.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script>window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "salesforceURL": "", "dateFormat": "yyyy-M-d", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "ap1.lightning.force.com", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1457127020000", "today": "2016-3-7 上午11:50", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
</script>
  
    <script type="text/javascript">
        var MOTIF_KEY = 'ContentSearch';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1457100476000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1457100476000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/static/111213/sfc/javascript/lib/scriptaculous/scriptaculous.js" type="text/javascript"></script>
    <script src="/static/111213/sfc/javascript/lib/scriptaculous/builder.js" type="text/javascript"></script>
    <script src="/static/111213/sfc/javascript/lib/scriptaculous/effects.js" type="text/javascript"></script>
    <script src="/static/111213/sfc/javascript/lib/scriptaculous/dragdrop.js" type="text/javascript"></script>
    <script src="/static/111213/sfc/javascript/lib/scriptaculous/controls.js" type="text/javascript"></script>
    <script src="/static/111213/js/picklist.js" type="text/javascript"></script>
    <script>
        Sfdc.onReady(function () {
            Shepherd.setIsRunningTests(false);
            Shepherd.Transport.initTransport({
                contentBaseUrl: '/sfc',
                shepherdServletPath: '/sfc/servlet.shepherd',
                contentStaticResourcesBase: '/static/111213/sfc',
                contentDomainUrl: 'https://c.ap1.content.force.com'
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
    <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Eb3pPQzQyTURaYSxwN0xBNml6Vk9BVXd5aGYtZU0zeU9YLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { } function bodyOnUnload() { }</script>

</head>

<body id="ext-gen3" class="contentSearchTab sfdcBody brandQuaternaryBgr version">
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div style="" id="body_content">
        <div id="container_pageHeader" class="container">
            <span style="display: none;" id="ieHiddenHead">.</span><div id="contentWrapper">
                <div id="AppBodyHeader" class="bPageHeader"><!--
                    <table cellspacing="0" cellpadding="0" border="0" id="phHeader" class="phHeader brandZeronaryBgr phHeaderCustomLogo">
                        <tbody>
                            <tr>
                                <td class="left">
                                    <img height="65" width="175" title="Salesforce.com" id="phHeaderLogoImage" alt="Salesforce.com" src="/img/seasonLogos/2016_spring.png"><img height="1" width="1" title="" class="spacer" alt="" src="/s.gif"></td>
                                <td class="searchCell">
                                    <form onsubmit="if (window.ffInAlert) { return false; }" name="sbsearch" method="GET" id="phSearchForm" action="/_ui/search/ui/UnifiedSearchResults">
                                        <input type="hidden" value="2" id="searchType" name="searchType"><input type="hidden" value="a00" id="sen0" name="sen"><input type="hidden" value="a0A" id="sen1" name="sen"><input type="hidden" value="003" id="sen2" name="sen"><input type="hidden" value="800" id="sen3" name="sen"><input type="hidden" value="701" id="sen4" name="sen"><div id="phSearchContainer" class="headerSearchContainer">
                                            <div class="headerSearchLeftRoundedCorner">
                                                <div class="searchBoxClearContainer">
                                                    <input type="text" value="" title="搜索..." size="20" placeholder="搜索..." name="str" maxlength="100" id="phSearchInput" autocomplete="off" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false"><a title="清除搜索词" style="visibility: hidden" name="phSearchClearButton" id="phSearchClearButton" href="javascript: void(0);" class="headerSearchClearButton"></a>
                                                </div>
                                                <div id="searchButtonContainer" class="headerSearchRightRoundedCorner">
                                                    <input type="button" id="phSearchButton" value=" 搜索 ">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                                <td class="right">
                                    <div class="multiforce">
                                        <div class="messages"></div>
                                        <div class="navLinks">
                                            <div class="linkElements">
                                                <div title="liu jack 的用户菜单" id="userNav" class="menuButton menuButtonRounded">
                                                    <div id="userNavButton" class="menuButtonButton">
                                                        <span tabindex="0" id="userNavLabel" class="menuButtonLabel">liu jack</span><div id="userNav-arrow" class="userNav-buttonArrow mbrButtonArrow"></div>
                                                        <div class="userNavButton-btm mbrButton-btm mbrButton-rc"></div>
                                                    </div>
                                                    <div id="userNavMenu" class="menuButtonMenu">
                                                        <div class="userNavMenu-tr mbrMenu-tr mbrMenu-rc"></div>
                                                        <div class="userNavMenu-tl mbrMenu-tl mbrMenu-rc"></div>
                                                        <div id="userNav-menuItems" class="mbrMenuItems"><a title="我的简档" class="menuButtonMenuLink firstMenuItem" href="/_ui/core/userprofile/UserProfilePage">我的简档</a><a title="我的设置" class="menuButtonMenuLink" href="/ui/setup/Setup?setupid=PersonalSetup">我的设置</a><a title="开发人员控制台 （新窗口）" class="debugLogLink menuButtonMenuLink" href="javascript:openPopupFocus%28%27https%3A%2F%2Fap1.salesforce.com%2F_ui%2Fcommon%2Fapex%2Fdebug%2FApexCSIPage%27%2C%20%27DeveloperConsole%27%2C%201000%2C%20800%2C%20%27width%3D1000%2Cheight%3D800%2Cresizable%3Dyes%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cscrollbars%3Dyes%2Cmenubar%3Dno%2Cdirectories%3Dyes%2Clocation%3Dno%2Cdependant%3Dno%27%2C%20false%2C%20false%29%3B">开发人员控制台</a><a title="切换到 Lightning Experience" class="menuButtonMenuLink" href="javascript:sfdcPage.handleSwitchToLightningClick(%27LightningExperiencePreferred%27,true,%27/one/one.app?source=aloha%27);">切换到 Lightning Experience</a><a title="退出" class="menuButtonMenuLink" href="/secur/logout.jsp">退出</a></div>
                                                        <div class="userNavMenu-br mbrMenu-br mbrMenu-rc"></div>
                                                        <div class="userNavMenu-bc mbrMenu-bc"></div>
                                                        <div class="userNavMenu-bl mbrMenu-bl mbrMenu-rc"></div>
                                                    </div>
                                                </div>                                              
                                                <a title="设置" id="setupLink" href="/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2Fsfc%2Fservlet.shepherd">设置</a><a title="帮助 （新窗口）" class="brandZeronaryFgr" href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Flanguage%253Dzh_CN%2526release%253D200.11.2%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">帮助</a>
                                            </div>
                                        </div>
                                        <div id="toolbar">
                                           
                                            <div title="Force.com 应用程序菜单" id="tsid" class="menuButton menuButtonRounded appSwitcher">
                                                <div id="tsidButton" class="menuButtonButton">
                                                    <span tabindex="0" id="tsidLabel" class="menuButtonLabel">内容</span><div id="tsid-arrow" class="tsid-buttonArrow mbrButtonArrow"></div>
                                                    <div class="tsidButton-btm mbrButton-btm mbrButton-rc"></div>
                                                </div>
                                                <div id="tsidMenu" class="menuButtonMenu">
                                                    <div class="tsidMenu-tr mbrMenu-tr mbrMenu-rc"></div>
                                                    <div class="tsidMenu-tl mbrMenu-tl mbrMenu-rc"></div>
                                                    <div id="tsid-menuItems" class="mbrMenuItems">
                                                        <a class="menuButtonMenuLink firstMenuItem" href="/home/home.jsp?tsid=02u900000017n3K">销售</a><a class="menuButtonMenuLink" href="/home/home.jsp?tsid=02u900000017n3L">呼叫中心</a><a class="menuButtonMenuLink" href="/home/home.jsp?tsid=02u900000017n3M">市场营销</a><a class="menuButtonMenuLink" href="/_ui/core/userprofile/UserProfilePage?tsid=02u90000001A4Bq">Work.com</a><a class="menuButtonMenuLink" href="/app/mgmt/applauncher/appLauncher.apexp?tsid=02u90000001A4Br">应用程序启动器</a><a class="menuButtonMenuLink" href="/home/home.jsp?tsid=02u90000001A4Bs">社区</a><a class="menuButtonMenuLink" href="/home/home.jsp?tsid=02u90000001A4Bt">Site.com</a><a class="menuButtonMenuLink" href="/home/home.jsp?tsid=02u90000001A4Bu">Salesforce Chatter</a><a class="menuButtonMenuLink" href="/servlet/servlet.Integration?lid=01r90000000xGpw&amp;ic=1&amp;linkToken=VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTR6TmpSYSxZcnZJQXdKWEFnLVJjVUtFakdsdnNFLFlXWmtNR0po&amp;tsid=02u90000001AXJS">Milestones PM</a><a class="menuButtonMenuLink" href="/home/home.jsp?tsid=02u90000001AkjZ">日常事务</a><a class="menuButtonMenuLink" href="/servlet/servlet.Integration?lid=01r90000000xZPF&amp;ic=1&amp;linkToken=VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTR6TmpSYSxZcnZJQXdKWEFnLVJjVUtFakdsdnNFLFlXWmtNR0po&amp;tsid=02u90000001AqWA">VCS Smart Email Inbox</a><a class="menuButtonMenuLink" href="/servlet/servlet.Integration?lid=01r90000001AcdQ&amp;ic=1&amp;linkToken=VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTR6TmpSYSxZcnZJQXdKWEFnLVJjVUtFakdsdnNFLFlXWmtNR0po&amp;tsid=02u90000001NE8j">Survey Force</a><hr class="menuSeparator">
                                                        <a target="_blank" class="menuButtonMenuLink" href="https://appexchange.salesforce.com">AppExchange</a><a target="_blank" class="menuButtonMenuLink" href="http://developer.force.com">开发人员社区</a><a target="_blank" class="menuButtonMenuLink" href="https://success.salesforce.com">成功社区</a>
                                                    </div>
                                                    <div class="tsidMenu-br mbrMenu-br mbrMenu-rc"></div>
                                                    <div class="tsidMenu-bc mbrMenu-bc"></div>
                                                    <div class="tsidMenu-bl mbrMenu-bl mbrMenu-rc"></div>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="zen">
                        <div role="navigation" id="tabContainer" class="brdPalette zen-headerBottom zen-hasTabOrganizer">
                            <h1 class="zen-assistiveText">选项卡导航</h1>
                            <nav><ul id="tabBar" class="zen-inlineList zen-tabMenu"><li id="home_Tab" class="zen-firstItem"><a title="主页选项卡" href="/home/home.jsp">主页</a></li><li id="Chatter_Tab"><a title="Chatter选项卡" href="/_ui/core/chatter/ui/ChatterPage">Chatter</a></li><li id="Workspace_Tab"><a title="文档库选项卡" href="/sfc/#workspaces">文档库</a></li><li id="ContentSearch_Tab" class="zen-active brandPrimaryBgr primaryPalette"><a title="内容选项卡 - 已选取" class="brandPrimaryFgr" href="/sfc/#search">内容</a><span class="zen-assistiveText">（当前选择的）</span></li><li id="ContentSubscriptions_Tab"><a title="订阅选项卡" href="/sfc/#subscriptions">订阅</a></li><li id="AllTab_Tab"><a href="/home/showAllTabs.jsp">&nbsp;<img title="所有选项卡" class="allTabsArrow" alt="所有选项卡" src="/s.gif">&nbsp;</a></li><li id="MoreTabs_Tab" class="zen-moreTabs zen-notNeeded zen-lastItem"><a title="更多选项卡菜单（结束）" id="zen-moreTabsAssistiveLink" class="zen-assistiveLink" href="javascript:void(0);"><b></b></a><ul id="MoreTabs_List"></ul></li></ul></nav>
                        </div>
                    </div>-->
                      <uc1:TopRight ID="TopRight1" runat="server" />
                     <uc1:MainNav ID="MainNav1" runat="server" />
                </div>
                <div class="bodyDiv brdPalette brandPrimaryBrd">
                    <table cellspacing="0" cellpadding="0" border="0" id="bodyTable" class="outerNoSidebar">
                        <tbody>
                            <tr>
                                <td class="noSidebarCell">
                                    <!-- Start page content table -->
                                    <a name="skiplink">
                                        <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" alt="内容在此开始" src="/s.gif"></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="bubbleMask" class="hide" style="opacity: 0; display: none;"></div>
        <div class="container_unused" id="container_bubble" style="position: fixed;">
            <div id="bubble_point"></div>
            <div class="topRight">
                <div class="topLeft">
                    <a onclick="Shepherd.run('bubble', 'hide', {shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Eb3pPQzQyTVRSYSxYZXJncHVRc1pEUVYzemhaXzRRTWdtLE9HVTVNamd6'});return false;" title="关闭" style="cursor: pointer;" class="dialogClose" id="bubble_close" href="javascript:void(0);"></a>
                    <h2>&nbsp;</h2>
                </div>
            </div>
            <div class="middle">
                <div id="content_container" class="innerContent overlaycontentbox"></div>
            </div>
            <div class="bottomRight">
                <div class="bottomLeft"></div>
            </div>
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv" style="height: auto; min-height: 483px;">
            <div class="trayWrapper">
                <div style="display: none;" id="tray"></div>
            </div>
            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="outer">
                <tbody>
                    <tr>
                        <td class="sidebarCell" id="sidebarCell">
                            <div class="fixed" id="sidebarDiv">
                                <div id="container_sidebar" class="container">
                                    <div class="sidebarModule contentSearchModule">
                                        <div class="sidebarModuleHeader brandPrimaryBgr">
                                            <h2>
                                                <div class="icon"></div>
                                                内容搜索</h2>
                                        </div>
                                        <div class="sidebarModuleBody">
                                            <form onsubmit="Shepherd.submitForm('search','search',this, {}, '');" enctype="multipart/form-data" method="POST" action="javascript:void(null);" class=" editPage" name="sidebarSearch" id="sidebarSearch">
                                                <ul id="sidebarSearchFormMessage" class="errorMsg"></ul>
                                                <table cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>































































                                                                <select onblur="" onchange="" tabindex="100" class="" name="searchWorkspaceId" id="searchWorkspaces">





                                                                    <option title="全部文档库" value="ALL_WORKSPACES">全部文档库
			</option>

                                                                    <option title="专用库" value="PERSONAL_WORKSPACE">专用库
			</option>

                                                                    <option disabled="" title="-----" value="__sfc__disabled__">-----
			</option>

                                                                    <option title="信息科" value="05890000000JY2e">信息科
			</option>

                                                                    <option title="办公文档" value="05890000000IfeE">办公文档
			</option>

                                                                    <option title="医院" value="05890000000ermc">医院
			</option>

                                                                    <option title="工作流" value="05890000000IfvU">工作流
			</option>

                                                                </select>


























                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>






























































                                                                <input lang="" type="text" onfocus="" onblur="" onchange="" value="" tabindex="100" id="searchTerm" name="searchTerm" maxlength="" class=" text">
                                                                &nbsp;
                  


















	
		
	
	


	




	
	
		
	






































                                                                <button onclick=";Shepherd.runForm('search','search',this, {shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTR6TkRaYSxTX3V3VklJSmlJM2Uwakk3WlFVRnVrLE5tWm1ZbUk1'}, '');return false;" title="" class="btn  " id="sidebarSearchButton">搜索</button>

                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <input type="submit" value="" tabindex="-1" class="formHiddenSubmit">







































































                                                <input lang="" type="hidden" onfocus="" onblur="" onchange="" value="VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTR6TWpGYSxGMWdfMnp0RXN4VjlqS1JRQ0E5cE5HLE5tWm1ZbUk1" tabindex="100" id="shepherdToken" name="shepherdToken" class=" text">
                                            </form>





                                            <!--s-cript>
	
	

</s-cript-->



                                        </div>
                                    </div>
































































                                    <div class="sidebarModule recentItemModule">
                                        <div class="sidebarModuleHeader brandPrimaryBgr">
                                            <h2>最近项目</h2>
                                        </div>
                                        <div class="sidebarModuleBody">
                                            <div id="urlQueryStr" data-urlquerystr="retURL=%2Fsfc%2Fservlet.shepherd&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1457322663355&amp;hl=06990000002nMBY%3A%2CkA090000000Mr6d%3A%2C0699000000181La%3A%2C80090000000dAcT%3A%2C80190000000PJyk%3A%2C70190000000uODU%3A%2C0069000000QASJY%3A%2C5009000000lRqdV%3A%2Ca0A9000000e5Jl9%3A%2C0059000000390Wh%3A%2C" class="hidden"></div>
                                            <div data-hovdata="dir=chatterHover-right" class="mruList individualPalette" data-uidsfdc="57" id="57">
                                                <div data-hovid="80190000000PJyk" class="orderBlock" data-uidsfdc="58" id="hoverItem58">
                                                    <div id="mru80190000000PJyk" class="mruItem" data-uidsfdc="71">
                                                        <a tabindex="0" accesskey="1" class="orderMru" href="/80190000000PJyk" data-uidsfdc="70">
                                                            <img class="mruIcon" alt="订单: 00000100" src="/s.gif" data-uidsfdc="68"><span class="mruText" data-uidsfdc="69">00000100</span></a>
                                                    </div>
                                                </div>
                                                <div id="80190000000PJykHover" style="position: absolute; display: none; z-index: 105; top: 279px; left: 205px;" data-uidsfdc="72">
                                                    <div class="chatterHover chatterHover-right">
                                                        <div class="wrapper">
                                                            <div class="loadHover">正在加载...</div>
                                                        </div>
                                                        <div class="arrow"></div>
                                                    </div>
                                                </div>
                                                <div data-hovid="80090000000dAcT" class="contractBlock" data-uidsfdc="59" id="hoverItem59">
                                                    <div id="mru80090000000dAcT" class="mruItem" data-uidsfdc="76">
                                                        <a tabindex="0" accesskey="2" class="contractMru" href="/80090000000dAcT" data-uidsfdc="75">
                                                            <img class="mruIcon" alt="合同: 00000100" src="/s.gif" data-uidsfdc="73"><span class="mruText" data-uidsfdc="74">00000100</span></a>
                                                    </div>
                                                </div>
                                                <div id="80090000000dAcTHover" style="position: absolute; display: none; z-index: 105; top: 301px; left: 205px;" data-uidsfdc="77">
                                                    <div class="chatterHover chatterHover-right">
                                                        <div class="wrapper">
                                                            <div class="loadHover">正在加载...</div>
                                                        </div>
                                                        <div class="arrow"></div>
                                                    </div>
                                                </div>
                                                <div data-hovid="0699000000181La" class="contentSearchBlock" data-uidsfdc="60" id="hoverItem60">
                                                    <div id="mru0699000000181La" class="mruItem" data-uidsfdc="81">
                                                        <a tabindex="0" accesskey="3" class="contentSearchMru" href="/0699000000181La" data-uidsfdc="80">
                                                            <img class="mruIcon" alt="内容文档: 饺子" src="/s.gif" data-uidsfdc="78"><span class="mruText" data-uidsfdc="79">饺子</span></a>
                                                    </div>
                                                </div>
                                                <div id="0699000000181LaHover" style="position: absolute; display: none; z-index: 105; top: 323px; left: 205px;" data-uidsfdc="82">
                                                    <div class="chatterHover chatterHover-right">
                                                        <div class="wrapper">
                                                            <div class="loadHover">正在加载...</div>
                                                        </div>
                                                        <div class="arrow"></div>
                                                    </div>
                                                </div>
                                                <div data-hovid="06990000002nMBY" class="contentSearchBlock" data-uidsfdc="61" id="hoverItem61">
                                                    <div id="mru06990000002nMBY" class="mruItem" data-uidsfdc="86">
                                                        <a tabindex="0" accesskey="4" class="contentSearchMru" href="/06990000002nMBY" data-uidsfdc="85">
                                                            <img class="mruIcon" alt="内容文档: 0A1F4965-ABCC-4... " src="/s.gif" data-uidsfdc="83"><span class="mruText" data-uidsfdc="84">0A1F4965-ABCC-4... </span></a>
                                                    </div>
                                                </div>
                                                <div id="06990000002nMBYHover" style="position: absolute; display: none; z-index: 105; top: 347px; left: 205px;" data-uidsfdc="87">
                                                    <div class="chatterHover chatterHover-right">
                                                        <div class="wrapper">
                                                            <div class="loadHover">正在加载...</div>
                                                        </div>
                                                        <div class="arrow"></div>
                                                    </div>
                                                </div>
                                                <div data-hovid="0069000000QASJY" class="opportunityBlock" data-uidsfdc="62" id="hoverItem62">
                                                    <div id="mru0069000000QASJY" class="mruItem" data-uidsfdc="91">
                                                        <a tabindex="0" accesskey="5" class="opportunityMru" href="/0069000000QASJY" data-uidsfdc="90">
                                                            <img class="mruIcon" alt="业务机会: 333 Deal" src="/s.gif" data-uidsfdc="88"><span class="mruText" data-uidsfdc="89">333 Deal</span></a>
                                                    </div>
                                                </div>
                                                <div id="0069000000QASJYHover" style="position: absolute; display: none; z-index: 105; top: 369px; left: 205px;" data-uidsfdc="92">
                                                    <div class="chatterHover chatterHover-right">
                                                        <div class="wrapper">
                                                            <div class="loadHover">正在加载...</div>
                                                        </div>
                                                        <div class="arrow"></div>
                                                    </div>
                                                </div>
                                                <div data-hovid="0059000000390Wh" class="userBlock" data-uidsfdc="63" id="hoverItem63">
                                                    <div id="mru0059000000390Wh" class="mruItem">
                                                        <a title="[Alt+6]" tabindex="0" accesskey="6" class="userMru" href="/0059000000390Wh">
                                                            <img title="用户: liu jack" class="mruIcon" alt="用户: liu jack" src="/s.gif"><span class="mruText">liu jack</span></a>
                                                    </div>
                                                </div>
                                                <div data-hovid="70190000000uODU" class="campaignBlock" data-uidsfdc="64" id="hoverItem64">
                                                    <div id="mru70190000000uODU" class="mruItem">
                                                        <a title="[Alt+7]" tabindex="0" accesskey="7" class="campaignMru" href="/70190000000uODU">
                                                            <img title="市场活动: GC Product Webinar - Jan 7, 2002" class="mruIcon" alt="市场活动: GC Product Webinar - Jan 7, 2002" src="/s.gif"><span class="mruText">GC Product Webinar - Jan 7, 2002</span></a>
                                                    </div>
                                                </div>
                                                <div data-hovid="5009000000lRqdV" class="caseBlock" data-uidsfdc="65" id="hoverItem65">
                                                    <div id="mru5009000000lRqdV" class="mruItem">
                                                        <a title="[Alt+8]" tabindex="0" accesskey="8" class="caseMru" href="/5009000000lRqdV">
                                                            <img title="个案: 00001027" class="mruIcon" alt="个案: 00001027" src="/s.gif"><span class="mruText">00001027</span></a>
                                                    </div>
                                                </div>
                                                <div data-hovid="a0A9000000e5Jl9" class="Custom57Block" data-uidsfdc="66" id="hoverItem66">
                                                    <div id="mrua0A9000000e5Jl9" class="mruItem">
                                                        <a title="[Alt+9]" tabindex="0" accesskey="9" class="Custom57Mru" href="/a0A9000000e5Jl9">
                                                            <img title="Survey: 考试" class="mruIcon" alt="Survey: 考试" src="/s.gif"><span class="mruText">考试</span></a>
                                                    </div>
                                                </div>
                                                <div data-hovid="kA090000000Mr6d" class="knowledgeBlock" data-uidsfdc="67" id="hoverItem67">
                                                    <div id="mrukA090000000Mr6d" class="mruItem">
                                                        <a title="[Alt+0]" tabindex="0" accesskey="0" class="knowledgeMru" href="/kA090000000Mr6d">
                                                            <img title="企业知识库: 关于CRM安装问题" class="mruIcon" alt="企业知识库: 关于CRM安装问题" src="/s.gif"><span class="mruText">关于CRM安装问题</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>




















































                                    <div class="recycleBinModule sidebarModule">
                                        <div class="sidebarModuleBody sidebarModuleBodyNoHeader">
                                            <a href="/search/UndeletePage">
                                                <img title="回收站" class="recycleIcon" alt="回收站" src="/s.gif"><span class="recycleText">回收站</span></a>
                                        </div>
                                    </div>

















                                </div>
                            </div>
                        </td>
                        <td valign="top" class="oRight">
                            <div class="container" id="container_content">
                                <div id="trayHolder" class="bPageTitle">
                                    <div class="ptBody secondaryPalette">
                                        <div class="content">
                                            <div id="versionIcon">

                                                <!-- FIXME: 158 - this conditional can be removed when all/most of the links have been reindexed after 156 (links were
                  made a first class type)
                  When you fix this, make sure you also fix AssemblyHelper

                   -->
                                                <div title="协查员.xlsx" class="docIcon_32 pageTitleIcon " style="background: url(/sfc/images/docicons/doctype_excel_32.png?v=188-1) top left no-repeat;">
                                                </div>
                                            </div>
                                            <img id="pageTitleIcon" class="pageTitleIcon" src="/s.gif" alt="内容" title="内容">
                                            <h1 id="pageTitle" class="pageType">内容</h1>
                                            <h2 id="pageDescription" class="pageDescription">协查员<div class="title" id="timeStampHolder">
                                                <div class="author">
                                                    创建人: 
                                                  
                                                    <span class="contextHolder">
                                                        <a onclick="Ninja.View.isTabLink=true;Shepherd.run('search', 'search', {searchCreatorIds : ['0059000000390Wh'], eid : '', rel : '', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TUROYSwzcmFGZWo1UnBTdFA2VUVUOEFfc2RtLE5tWm1ZbUk1'});return false;" title="" style="cursor: pointer;" class="contextText" id="__searchsearch__contextText" href="javascript:void(0);">liu jack</a>
                                                        <img onmousedown="Shepherd.run('menu','show', {handle : this, populateController : null, populateAction : null});" class="contextArrow" src="/sfc/images/context_arrow.gif">
                                                        <div class="contextMenu">
                                                            <ul>
                                                                <li class="item">
                                                                    <a onclick="Ninja.View.isTabLink=true;Shepherd.run('search', 'search', {searchCreatorIds : ['0059000000390Wh'], eid : '', rel : '', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TURSYSw0NVFMMDJoVWF5SVVRcWlYdXM2U3pILE5tWm1ZbUk1', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TURWYSxvbGlDUVc1WkM1S09BSTFVNDlxVFhRLE5tWm1ZbUk1'});return false;" title="" style="cursor: pointer;" class="item" id="__searchsearch_viewAuthorsContent_item" href="javascript:void(0);">查看作者的内容	</a>
                                                                </li>
                                                                <li class="item">
                                                                    <a onclick="Ninja.View.isTabLink=true;Shepherd.run('subscription', 'update', {id: '0059000000390Wh', update : 'add', type : 'account', shepherdSuccess : '\u60A8\u73B0\u5728\u8BA2\u8D2D\u6B64\u4F5C\u8005\u3002', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TURaYSxKcUFzM2I3T3lfOTFzUDhpZ2U4b3ZzLE1tTTNNemxo', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TURaYSxKcUFzM2I3T3lfOTFzUDhpZ2U4b3ZzLE1tTTNNemxo'});return false;" title="" style="cursor: pointer;" class="item" id="__subscriptionupdate_subscribeToAuthor_item" href="javascript:void(0);">订购作者	
			</a>                                                                </li>                                                            </ul>
                                                        </div>
                                                    </span>
                                                    <span class="timestamp">2015-12-7</span>
                                                </div>
                                            </div>
                                            </h2>
                                        </div>
                                        <div id="container_pageHelp" class="container">
                                            <div class="links">
                                                <a href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" title="了解详细信息！"><span class="helpLink">了解详细信息！</span></a>
                                                <a href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" title="此页面的帮助"><span class="helpLink">此页面的帮助</span><img src="/sfc/images/1x1_trans.gif" alt="" class="helpIcon" title=""></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                        &nbsp;«&nbsp;				
                                        <a id="backLink" href="javascript:window.history.back();">返回</a>
                                    </div>
                                </div>
                                <div id="cphBody"></div>
                                <div id="Div1">
                                    <div class="hiddenDomHolder" id="titleHolder"></div>
                                    <div class="hiddenDomHolder" id="versionIconHolder"></div>
                                    <div class="hiddenDomHolder" id="descHolder"></div>
                                    <!--s-cript>
	
		
			
				Shepherd.getHelper("view").moveElement('pageDescription','titleHolder');
				Shepherd.getHelper("view").moveElement('timeStampHolder','descHolder');
			
			
		
		Shepherd.getHelper("view").moveElement('versionIcon','versionIconHolder');
	
</s-cript-->
                                    <div class="bPageBlock brandSecondaryBrd  contentHeader" id="docDetails">
                                        <div class="pbHeader">
                                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img height="1" width="1" title="" class="minWidth" alt="" src="/s.gif">
                                                            <img title="" class="relatedListIcon" alt="" src="/s.gif">
                                                            <h3>内容详细信息</h3>
                                                        </td>
                                                        <td class="pbButton">
                                                            <div class="toolbar" id="versionButtons">
                                                                <div class="x-toolbar x-small-editor x-toolbar-layout-ct" id="docDetailsToolbar">
                                                                    <table cellspacing="0" class="x-toolbar-ct">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td align="left" class="x-toolbar-left">
                                                                                    <table cellspacing="0">
                                                                                        <tbody>
                                                                                            <tr class="x-toolbar-left-row">
                                                                                                <td class="x-toolbar-cell" id="ext-gen40">
                                                                                                    <div id="docRatings">
                                                                                                        <div class="ratings2">
                                                                                                            <div class="canRate">
                                                                                                                <a onclick="Ninja.View.isTabLink=true;Shepherd.run('document', 'rate', {rating : 1, selectedVersionId : '06890000002pZ1P', thumbs2 : this.parentNode, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TVRkYSxmZzRNZUNFLWxnWVNQY2ZGYTNsaVdSLE1ETTVNMlZt'});return false;" title="为此内容投赞成票" style="cursor: pointer;" class="up" id="ratingUp" href="javascript:void(0);">
                                                                                                                    <img alt="为此内容投赞成票" class="" id="ratingUpImg" src="/sfc/images/1x1_trans.gif">
                                                                                                                    <div id="ratingUpCount" class="count">0</div>
                                                                                                                </a>

                                                                                                                <a onclick="Ninja.View.isTabLink=true;Shepherd.run('document', 'rate', {rating : -1, selectedVersionId : '06890000002pZ1P', thumbs2 : this.parentNode, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TVRoYSx5VUFyRmNocnRxOEpSY2NsOExUYnRlLE1ETTVNMlZt'});return false;" title="为此内容投反对票" style="cursor: pointer;" class="down" id="ratingDown" href="javascript:void(0);">
                                                                                                                    <img alt="为此内容投反对票" class="" id="ratingDownImg" src="/sfc/images/1x1_trans.gif">
                                                                                                                    <div id="ratingDownCount" class="count">0</div>
                                                                                                                </a>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell x-hide-display" id="ext-gen41">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="ext-comp-1015" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="x-btn-arrow">
                                                                                                                    <button type="button" id="ext-gen42" style="background-image: url(&quot;/img/content/deliver16.png&quot;);" class=" x-btn-text">递送内容</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell x-hide-display" id="ext-gen43">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="ext-comp-1019" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="">
                                                                                                                    <button type="button" id="ext-gen44" style="background-image: url(&quot;/img/content/deliver16.png&quot;);" class=" x-btn-text">递送内容</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell" id="ext-gen45">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="ext-comp-1020" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="x-btn-arrow">
                                                                                                                    <button type="button" id="ext-gen46" style="background-image: url(&quot;/img/content/download16.gif&quot;);" class=" x-btn-text">下载</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell x-hide-display" id="ext-gen47">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon x-btn-noicon" id="ext-comp-1024">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="">
                                                                                                                    <button type="button" id="ext-gen48" class=" x-btn-text">&nbsp;</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell x-hide-display" id="ext-gen49">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="ext-comp-1025" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="">
                                                                                                                    <button type="button" id="ext-gen50" style="background-image: url(&quot;/img/content/download16.gif&quot;);" class=" x-btn-text">下载</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell x-hide-display" id="ext-gen51">
                                                                                                    <table cellspacing="0" class="x-btn  x-btn-text-icon" id="ext-comp-1026" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="">
                                                                                                                    <button type="button" id="ext-gen52" class=" x-btn-text publishIcon16">发布到文档库...</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell" id="ext-gen53">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="subBtn_06990000002nMB4" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="">
                                                                                                                    <button type="button" id="ext-gen54" class=" x-btn-text subOff">订购</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell" id="ext-gen55">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="ext-comp-1027" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="x-btn-arrow">
                                                                                                                    <button type="button" id="ext-gen56" class=" x-btn-text edit12">编辑</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td class="x-toolbar-cell x-hide-display" id="ext-gen57">
                                                                                                    <table cellspacing="0" class="x-btn x-btn-text-icon" id="ext-comp-1043" style="width: auto;">
                                                                                                        <tbody class="x-btn-small x-btn-icon-small-left">
                                                                                                            <tr>
                                                                                                                <td class="x-btn-tl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-tc"></td>
                                                                                                                <td class="x-btn-tr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-ml"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-mc"><em unselectable="on" class="">
                                                                                                                    <button type="button" id="ext-gen58" style="background-image: url(&quot;/img/icon/wrench16.png&quot;);" class=" x-btn-text">复制和自定义</button></em></td>
                                                                                                                <td class="x-btn-mr"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="x-btn-bl"><i>&nbsp;</i></td>
                                                                                                                <td class="x-btn-bc"></td>
                                                                                                                <td class="x-btn-br"><i>&nbsp;</i></td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" class="x-toolbar-right">
                                                                                    <table cellspacing="0" class="x-toolbar-right-ct">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <table cellspacing="0">
                                                                                                        <tbody>
                                                                                                            <tr class="x-toolbar-right-row"></tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <table cellspacing="0">
                                                                                                        <tbody>
                                                                                                            <tr class="x-toolbar-extras-row"></tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="pbHelp"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="pbBody">
                                            <table cellspacing="0" cellpadding="0" border="0" class="docDetails">
                                                <tbody>
                                                    <tr>
                                                        <td valign="top" class="detailsCell">
                                                            <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="description" colspan="2">

                                                                            <div></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol">
                                                                            <img alt="标记" src="/img/icon/tags16.gif">标记</td>
                                                                        <td class="dataCol">
                                                                            <div id="tagsList">
                                                                                <form onsubmit="Shepherd.submitForm('document','tagCreate',this, {}, '已成功添加标记');" enctype="multipart/form-data" method="POST" action="javascript:void(null);" class=" editPage" name="newTagForm" id="newTagForm">
                                                                                    <ul id="newTagFormFormMessage" class="errorMsg"></ul>
                                                                                    <input lang="" type="hidden" onfocus="" onblur="" onchange="" value="06890000002pZ1P" tabindex="100" id="versionId" name="versionId" class=" text">
                                                                                    
                                                                                    <input lang="" type="" onfocus="if(this.value=='添加标记...'){this.value='';}$('newTagForm').addClassName('on');" onblur="" onchange="" value="添加标记..." tabindex="100" id="newTag" name="newTag" class="newTag text" autocomplete="off">
                                                                                    
                                                                                    <button onclick=";Shepherd.runForm('document','tagCreate',this, {shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpCYSxaNkFZSVdIU0tHVU9VY1BnNF9IRWpLLFlqWm1PV0Zt'}, '已成功添加标记');return false;" title="" class="btn  " id="documenttagCreate_btnSave_">保存</button>
                                                                                    
                                                                                    <button onclick=";Shepherd.runForm('document','tagCreate',this, {cancel : true, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpCYSxaNkFZSVdIU0tHVU9VY1BnNF9IRWpLLFlqWm1PV0Zt'}, '已成功添加标记');return false;" title="" class="btn  " id="documenttagCreate_btnCancel_">取消</button>
                                                                                    
                                                                                    <input lang="" type="hidden" onfocus="" onblur="" onchange="" value="添加标记..." tabindex="100" id="defaultText" name="defaultText" class=" text">
                                                                                    <div class="autocomplete" id="tagFieldCompleter" style="display: none;"></div>

                                                                                    <input type="submit" value="" tabindex="-1" class="formHiddenSubmit">
                                                                                    
                                                                                    <input lang="" type="hidden" onfocus="" onblur="" onchange="" value="VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TkRGYSxWN2xsWHV6dFM1SkFoMGtrTzZYOXlGLFlqWm1PV0Zt" tabindex="100" id="Hidden1" name="shepherdToken" class=" text">
                                                                                </form>





                                                                                <!--s-cript>
	
	
		window.setTimeout("Shepherd.getHelper('view').focusForm($('newTagForm'));", 500);
	

</s-cript-->








                                                                                <!--s-cript>
	
			new Autocompleter.Local('newTag', 'tagFieldCompleter', ['']);
		
</s-cript-->

                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol">作者    </td>
                                                                        <td class="dataCol">
                                                                            <a style="text-decoration: none;" href="/_ui/core/userprofile/UserProfilePage?u=0059000000390Wh">
                                                                                <img alt="liu jack" class="thumbnail_visible" src="https://c.ap1.content.force.com/profilephoto/005/T" id="userThumbnailPhoto" title="单击以查看该用户简档">
                                                                            </a>
                                                                             <span class="contextHolder">
                                                                                                                                                                 <a onclick="Ninja.View.isTabLink=true;Shepherd.run('search', 'search', {searchCreatorIds : ['0059000000390Wh'], eid : '', rel : '', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpOYSxLdlg5c1hYZjFzS1VxalA2RmlGNXVULE5tWm1ZbUk1'});return false;" title="liu jack" style="cursor: pointer;" class="contextText" id="A1" href="javascript:void(0);">liu jack</a>



                                                                                <img onmousedown="Shepherd.run('menu','show', {handle : this, populateController : null, populateAction : null});" class="contextArrow" src="/sfc/images/context_arrow.gif">
                                                                                <div class="contextMenu">
                                                                                    <ul>
                                                                                        


                                                                                        <li class="item">
                                                                                            
                                                                                            <a onclick="Ninja.View.isTabLink=true;Shepherd.run('search', 'search', {searchCreatorIds : ['0059000000390Wh'], eid : '', rel : '', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpOYSxLdlg5c1hYZjFzS1VxalA2RmlGNXVULE5tWm1ZbUk1', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpSYSxhT1Z6Tzh2Tnp0Ni1ySV9fRUNkMm5BLE5tWm1ZbUk1'});return false;" title="" style="cursor: pointer;" class="item" id="A2" href="javascript:void(0);">查看作者的内容
				
			</a>



                                                                                        </li>





























                                                                                        <li class="item">


































































                                                                                            <a onclick="Ninja.View.isTabLink=true;Shepherd.run('subscription', 'update', {id: '0059000000390Wh', update : 'add', type : 'account',
                                    shepherdSuccess : '\u60A8\u73B0\u5728\u8BA2\u8D2D\u6B64\u4F5C\u8005\u3002', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpSYSxuOE9qcmxQejVBaTdBSjJWY3duMTVSLE1tTTNNemxo', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpSYSxuOE9qcmxQejVBaTdBSjJWY3duMTVSLE1tTTNNemxo'});return false;"
                                                                                                title="" style="cursor: pointer;" class="item" id="A3" href="javascript:void(0);">订购作者
				
			</a>



                                                                                        </li>




                                                                                    </ul>
                                                                                </div>
                                                                            </span>




                                                                            <span class="timestamp">2015-12-7
    
    

</span>



                                                                        </td>
                                                                    </tr>


                                                                    <tr>
                                                                        <td class="labelCol">版本</td>
                                                                        <td class="dataCol">1
	                    
	                </td>
                                                                    </tr>



                                                                    <tr>
                                                                        <td class="labelCol">已显示</td>
                                                                        <td class="dataCol">
                                                                            
                                                                            <span class="state_featuredContent_06990000002nMB4 " id="state_featuredContent_06990000002nMB4">
                                                                                <span class="hidden" id="state_featuredContent_06990000002nMB4.on">
                                                                                                                                                                        <a onclick="Ninja.View.isTabLink=true;Shepherd.run('document', 'feature', {documentId: '06990000002nMB4', featuredContentBoost : 0, shepherdSuccess : '\u60A8\u5DF2\u6210\u529F\u53D6\u6D88\u663E\u793A\u6B64\u5185\u5BB9\u3002' , shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpaYSw0aGFVbnFOMzhKdThkN0hkWnBJNlVZLFkyTmtaR0kw'});return false;" title="" style="cursor: pointer;" class="featuredContent" id="featureContentOff_06990000002nMB4" href="javascript:void(0);">
                                                                                        <img height="16" width="21" src="/img/checkbox_checked.gif" alt="已显示" class="checkImg" title="已显示">
                                                                                        [<span style="text-decoration: underline;">不显示</span>]
				</a>



                                                                                </span>







                                                                                <span class="" id="state_featuredContent_06990000002nMB4.off">
                                                                                                                                                                        <a onclick="Ninja.View.isTabLink=true;Shepherd.run('document', 'feature', {documentId: '06990000002nMB4', featuredContentBoost : 1, shepherdSuccess : '\u60A8\u5DF2\u6210\u529F\u663E\u793A\u6B64\u5185\u5BB9\u3002', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpkYSxGLTRfSXMyOVdrT1Y5LUkyTkZ4cFVRLFkyTmtaR0kw'});return false;" title="" style="cursor: pointer;" class="featuredContent" id="featureContentOn_06990000002nMB4" href="javascript:void(0);">
                                                                                        <img height="16" width="21" src="/img/checkbox_unchecked.gif" alt="不显示" class="checkImg" title="不显示">
                                                                                        [<span style="text-decoration: underline;">显示</span>]
				</a>



                                                                                </span>
                                                                                <span class="hidden" id="state_featuredContent_06990000002nMB4.updating">
                                                                                    <div onclick="Shepherd.run('view', 'toggle', {shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpoYSxDZ1NVWGFmTGp1eVhqV1RLWVVkbGNTLE5qUmlNRGt6'});return false;" title="" style="cursor: pointer;" class="wait" id="_div_viewtoggle_updating_wait">正在更新...</div>
                                                                                </span>

                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol">大小</td>
                                                                        <td class="dataCol">9&nbsp;KB</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol">在我的文档库中</td>
                                                                        <td class="dataCol">
                                                                            <span class="contextHolder">
                                                                                <a onclick="Ninja.View.isTabLink=true;Shepherd.run('view', 'showLayout', {layout: 'workspaceView', params : {selectedWorkspaceId : '05890000000IfeE'}, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpsYSxGRXBSTXV4WkN5NUZ5alRLRm9VRXFYLE16UXhZakV4'});return false;" title="办公文档" style="cursor: pointer;" class="contextText" id="__viewshowLayout__contextText" href="javascript:void(0);">办公文档</a>
                                                                                <img onmousedown="Shepherd.run('menu','show', {handle : this, populateController : null, populateAction : null});" class="contextArrow" src="/sfc/images/context_arrow.gif">
                                                                                <div class="contextMenu">
                                                                                    <ul>
                                                                                       <li class="item">
                                                                                            <a onclick="Ninja.View.isTabLink=true;Shepherd.run('view', 'showLayout', {layout: 'workspaceView', params : {selectedWorkspaceId : '05890000000IfeE'}, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TmpsYSxGRXBSTXV4WkN5NUZ5alRLRm9VRXFYLE16UXhZakV4', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TnpCYSxDRTYwVVg3TkozcjFXREk5SW5zVTU4LE16UXhZakV4'});return false;" title="" style="cursor: pointer;" class="item" id="__viewshowLayout_viewWorkspaceDetails_item" href="javascript:void(0);">查看文档库详细信息
				
			</a>
                                                                                        </li>
                                                                                        <li class="item">
                                                                                            <a onclick="Ninja.View.isTabLink=true;Shepherd.run('search', 'search', {searchWorkspaceIds: ['05890000000IfeE'], eid : '', rel : '', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TnpCYSx0QTd0SEM2Z29zU1RDaG02WXdjWnUxLE5tWm1ZbUk1', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TnpGYSxyZzF5RU9TV0JxWGh0OGs0cnZwUERqLE5tWm1ZbUk1'});return false;" title="" style="cursor: pointer;" class="item" id="__searchsearch_viewWorkspaceContent_item" href="javascript:void(0);">查看文档库内容
				
			</a>
                                                                                        </li>
                                                                                        <li class="item">
                                                                                            <a onclick="Ninja.View.isTabLink=true;Shepherd.run('subscription', 'update', {id: '05890000000IfeE', update : 'add', type : 'workspace',
						shepherdSuccess : '\u60A8\u73B0\u5728\u8BA2\u8D2D\u6B64\u6587\u6863\u5E93\u3002', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TnpGYSxPZUZMcDBhdmhCQldrNTVldlBKdy1lLE1tTTNNemxo', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ0TnpKYSxkcUpoT3RDQUVhZ0R2MGlnYXZ5SDZZLE1tTTNNemxo'});return false;"
                                                                                                title="" style="cursor: pointer;" class="item" id="__subscriptionupdate_subscribeToWorkspace_item" href="javascript:void(0);">订阅文档库...
				
			</a>



                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

                                                        </td>
                                                        <td valign="top" id="docTabs" class="tabsCell" style="width: auto;">
                                                            <div id="docContentTabs" class=" x-tab-panel" style="width: auto;">
                                                                <div class="x-tab-panel-header x-unselectable x-tab-panel-header-plain" id="ext-gen60" style="-moz-user-select: none;">
                                                                    <div class="x-tab-strip-wrap" id="ext-gen63" style="width: 539px;">
                                                                        <ul class="x-tab-strip x-tab-strip-top" id="ext-gen65">
                                                                            <li id="docContentTabs__previewTab" class=""><a class="x-tab-strip-close" id="ext-gen68"></a><a href="#" class="x-tab-right" id="ext-gen69"><em class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">预览</span></span></em></a></li>
                                                                            <li id="docContentTabs__commentsTab" class=""><a class="x-tab-strip-close" id="ext-gen70"></a><a href="#" class="x-tab-right" id="ext-gen71"><em class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">留言</span></span></em></a></li>
                                                                            <li id="docContentTabs__versionsTab" class=""><a class="x-tab-strip-close" id="ext-gen72"></a><a href="#" class="x-tab-right" id="ext-gen73"><em class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">版本</span></span></em></a></li>
                                                                            <li id="docContentTabs__DownloadsTab" class=""><a class="x-tab-strip-close" id="ext-gen74"></a><a href="#" class="x-tab-right" id="ext-gen75"><em class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">下载</span></span></em></a></li>
                                                                            <li id="docContentTabs__SubscriptionsTab" class=""><a class="x-tab-strip-close" id="ext-gen76"></a><a href="#" class="x-tab-right" id="ext-gen77"><em class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">订户</span></span></em></a></li>
                                                                            <li id="docContentTabs__ContentPacksTab" class="x-tab-strip-active"><a class="x-tab-strip-close" id="ext-gen78"></a><a href="#" class="x-tab-right" id="ext-gen79"><em class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">内容包</span></span></em></a></li>
                                                                            <li class="x-tab-edge" id="ext-gen66"><span class="x-tab-strip-text">&nbsp;</span></li>
                                                                            <div class="x-clear" id="ext-gen67"></div>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="x-tab-strip-spacer" id="ext-gen64"></div>
                                                                </div>
                                                                <div class="x-tab-panel-bwrap" id="ext-gen61">
                                                                    <div class="x-tab-panel-body x-tab-panel-body-top" id="ext-gen62" style="width: auto; height: 301px;">
                                                                        <div id="previewTab" class=" x-panel x-panel-noborder x-hide-display" style="width: auto;">
                                                                            <div class="x-panel-bwrap" id="ext-gen80">
                                                                                <div class="x-panel-body x-panel-body-noheader x-panel-body-noborder container" id="ext-gen81" style="overflow: auto; width: auto; height: 301px;">
                                                                                    <div style="height: 100%; width: 100%" id="div_rendition_small">
                                                                                        <embed height="100%" width="100%" align="middle" type="application/x-shockwave-flash" wmode="opaque" pluginspage="http://www.adobe.com/go/getflashplayer" allowfullscreen="true" allowscriptaccess="sameDomain" name="renditionSmall" bgcolor="#ffffff" quality="high" id="renditionSmall" flashvars="shepherd_prefix=/sfc/servlet.shepherd&amp;v=06890000002pZ1P&amp;mode=details" src="/_swf/196007/sfc/flex/DocViewer.swf"><noembed><p>Flash 文件预览</p></noembed>
                                                                                    </div>
                                                                            </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="commentsTab" class=" x-panel x-panel-noborder x-hide-display" style="width: auto;">
                                                                            <div class="x-panel-bwrap" id="ext-gen83">
                                                                                <div class="x-panel-body x-panel-body-noheader x-panel-body-noborder container" id="ext-gen84" style="overflow: auto; width: auto; height: 301px;">
                                                                                   <dl>
                                                                                        <dt class="chead">
                                                                                            <span class="state_commentOpen " id="state_commentOpen">
                                                                                                <span class="" id="state_commentOpen.off">
                                                                                                 <button onclick="Shepherd.run('view', 'toggle', {button : 'commentOpen', elementId : 'commentForm', setFocus : 'commentTextarea', toggleOn : true, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3hPQzQxTnpOYSxtbC1pNUlzQ3VSZEtuYjlqVDFCYm1zLE5qUmlNRGt6'});return false;" title="" style="cursor: pointer;" class="btn " id="_roundedButton_viewtoggle_btnAddComment_">写留言</button>



                                                                                                    <img src="/img/actionPlans/addCommentsIcon.gif" alt="">留言数量: 0
              	</span>


                                                                                                <span class="hidden" id="state_commentOpen.on"></span>
                                                                                                <span class="hidden" id="state_commentOpen.updating"></span>
                                                                                            </span>
                                                                                            <div id="commentForm" style="display: none;">
                                                                                                <form enctype="multipart/form-data" method="POST" action="javascript:void(null);" class=" editPage" name="commentFormArea" id="commentFormArea">
                                                                                                    <ul id="commentFormAreaFormMessage" class="errorMsg"></ul>
                                                                                                    <input type="hidden" value="06890000002pZ1P" name="versionId">
                                                                                                    <input type="hidden" value="06990000002nMB4" name="documentId">
                                                                                                    <table width="100%">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td valign="top" align="right">写留言</td>
                                                                                                                <td valign="top" align="left">
                                                                                                                   <textarea lang="" tabindex="100" onblur="" onchange="" class="" name="comment" id="commentTextarea"></textarea>
                                                                                                             </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td align="right" colspan="2">
                                                                                                               <span class="state_commentSave " id="state_commentSave">
                                                                                                                    <span class="" id="state_commentSave.on">

                                                                                                                            <button onclick="Shepherd.run('form', 'submit', {controller : 'comment', action : 'create', formId: 'commentFormArea', success : '您的留言已保存。', params : {shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3hPQzQxTnpWYSxqOVdOZ1N3ZWkwbWhqSkc2QmIxM0xfLE9ERTJOVE5q'}});return false;" title="" style="cursor: pointer;" class="btn " id="_roundedButton_formsubmit_btnSave_">保存</button>
                                                                                                                                                                                                                                                    <button onclick="Shepherd.run('view', 'toggle', {button : 'commentOpen', elementId : 'commentForm', setFocus : 'commentTextarea', toggleOn : false, shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3hPQzQxTnpaYSxOSWlRMlJLUjVtQ2lkb05VS2M0bkJTLE5qUmlNRGt6'});return false;" title="" style="cursor: pointer;" class="btn " id="_roundedButton_viewtoggle_btnCancel_">取消</button>



                                                                                                                        </span>







                                                                                                                        <span class="hidden" id="state_commentSave.updating">































































                                                                                                                            <button onclick="Shepherd.run('view', 'void', {shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3hPQzQxTnpkYSw3b1pSYWh5ZHMzMjByWFdTS1FMM0FOLE5tTXlPVGRt'});return false;" title="" style="cursor: pointer;" class="btn wait" id="_roundedButton_viewvoid_btnSaving_wait">保存中...</button>



                                                                                                                        </span>

                                                                                                                    </span>




                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>

                                                                                                    <input type="submit" value="" tabindex="-1" class="formHiddenSubmit">
                                                                                                </form>





                                                                                                <!--s-cript>
	
	
		window.setTimeout("Shepherd.getHelper('view').focusForm($('commentFormArea'));", 500);
	

</s-cript-->



                                                                                            </div>



                                                                                        </dt>
                                                                                        <dd id="commentListHolder" class="cbody">没有留言。
            
        
    </dd>
                                                                                    </dl>














                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="versionsTab" class=" x-panel x-panel-noborder x-hide-display" style="width: auto;">
                                                                            <div class="x-panel-bwrap" id="ext-gen98">
                                                                                <div class="x-panel-body x-panel-body-noheader x-panel-body-noborder container" id="ext-gen99" style="overflow: auto; width: auto; height: 301px;">




































                                                                                    <dl>
                                                                                        <dt class="chead">
































































                                                                                            <button onclick="Shepherd.run('contribute', 'show', {page : 'contributeDocument', width : 400, params : { selectedVersionId : '06890000002pZ1P' } , shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3pNQzQ0TXpCYSxEOTdZNTRNQjFwYWZkTGRvTjhMRUNDLE1UQmpZbVZr'});return false;" title="" style="cursor: pointer;" class="btn " id="_roundedButton_contributeshow_btnAddNewVersion_">上载新版本</button>




                                                                                            <img src="/img/content/content16.gif" alt="">版本数: 1
    </dt>
                                                                                        <dd class="cbody">


                                                                                            <dl class="commentEntry">
                                                                                                <dd class="comment">
                                                                                                    <strong>版本:</strong> 1<br>

                                                                                                    <strong>大小:</strong> 9&nbsp;KB<br>
                                                                                                </dd>
                                                                                                <dd class="byline">上载人： 
























    








    
    
        
    
    
    
        
    



    
    
    
        
    


    
    
        
        
            
            
                
            
        
    



































































                                                                                                    <a onclick="Ninja.View.isTabLink=true;Shepherd.run('search', 'search', {searchCreatorIds : ['0059000000390Wh'], shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3pNQzQ0TXpWYSxJVUNjcVdZNzFuMm5oaDhEc3NYNXkwLE5tWm1ZbUk1'});return false;" title="" style="cursor: pointer;" class="" id="_a_searchsearch__" href="javascript:void(0);">liu jack</a>



                                                                                                    <span class="timestamp">2015-12-7
    
    

</span>
                                                                                                    |
                   	所有者： liu jack
                    
                    
                    
                    
                    | 
























    




    





    
    
        
    
    
    
        
    



    
    
    
        
    


    
    
        
        
            
            
                
            
        
    





































































                                                                                                    <a onclick="Ninja.View.isTabLink=true;Shepherd.run('document', 'downloadBegin', {id: '06890000002pZ1P', contentUrl : '', target : 'downloadIFrame', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3pNQzQ0TkRWYSxrMS1oYTJFb29la21maUpoZ0lNZDd1LE1qUmpPV00y'});return false;" title="&amp;#19979;&amp;#36733;&amp;#27492;&amp;#25991;&amp;#26723;&amp;#30340;&amp;#29256;&amp;#26412; 1" style="cursor: pointer;" class="" id="__documentdownloadBegin_btnDownload_" href="javascript:void(0);">下载</a>




                                                                                                    | 
























    






    



    
    
        
    
    
    
        
    



    
    
    
        
    


    
    
        
        
            
            
                
            
        
    





































































                                                                                                    <a onclick="Ninja.View.isTabLink=true;Shepherd.run('document', 'viewRenditionLarge', {selectedVersionId : '06890000002pZ1P', positionId : '0', shepherdToken : 'VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3pNQzQ0TkRaYSxSbDl4N0IwUnpPaEtMcTg1TTQ5UjU2LFpXRXhNMkZp'});return false;" title="查看此文档的预览" style="cursor: pointer;" class="" id="__documentviewRenditionLarge_btnPreview_" href="javascript:void(0);">预览</a>




                                                                                                </dd>
                                                                                            </dl>

                                                                                        </dd>
                                                                                    </dl>













                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="DownloadsTab" class=" x-panel x-panel-noborder x-hide-display" style="width: auto;">
                                                                            <div class="x-panel-bwrap" id="ext-gen101">
                                                                                <div class="x-panel-body x-panel-body-noheader x-panel-body-noborder container" id="ext-gen102" style="overflow: auto; width: auto; height: 301px;">

































                                                                                    <dl>

                                                                                        <dt class="chead">
                                                                                            <img src="/img/content/download16.gif" alt="">
                                                                                            无人下载此内容。
				
				
							
		</dt>



                                                                                    </dl>













                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="SubscriptionsTab" class=" x-panel x-panel-noborder x-hide-display" style="width: auto;">
                                                                            <div class="x-panel-bwrap" id="ext-gen104">
                                                                                <div class="x-panel-body x-panel-body-noheader x-panel-body-noborder container" id="ext-gen105" style="overflow: auto; width: auto; height: 301px;">































                                                                                    <dl>
                                                                                        <dt class="chead">
                                                                                            <img src="/sfc/images/star_yellow.png" style="vertical-align: text-top; margin-right: 2px;" alt="">
                                                                                            无人订购此内容。
			
		
	</dt>

                                                                                    </dl>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="ContentPacksTab" class=" x-panel x-panel-noborder" style="width: auto;">
                                                                            <div class="x-panel-bwrap" id="ext-gen107">
                                                                                <div class="x-panel-body x-panel-body-noheader x-panel-body-noborder container" id="ext-gen108" style="overflow: auto; width: auto; height: 301px;">
                                                                                    <dl>
                                                                                        <dt class="chead">
                                                                                            <img src="/sfc/images/docicons/doctype_pack_16.png" style="vertical-align: text-top; margin-right: 2px;" alt="">
                                                                                            此内容不属于任何内容包。
			
		
	
		
                    		 
	</dt>

                                                                                    </dl>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="pbBottomButtons">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="pbTitle">
                                                            <img height="1" width="1" src="/s.gif" alt="" class="minWidth" title=""></td>
                                                        <td class="pbButtonb">
                                                            <div class="toolbar" id="Div2"></div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg"></div>
                                        </div>


                                    </div>
                                    <!--s-cript>
	
    Shepherd.run("bubble","hide");
    Shepherd.run("document", "loadDetails", {"btnPublish":"发布到文档库...","subscribeTo_document":"订阅内容","btnModifyDocPack":"编辑内容包","isDocumentDownloader":true,"subscribed":"已订购","btnModifyDeck":"编辑演示文稿","createDistributionURL":"/udd/ContentDistribution/wiz/details.apexp?versionId=06890000002pZ1P&retURL=%2Fsfc%2F%23version%2F06890000002pZ1P","shepherdTokenSubscriptionUpdate":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSx6c2U0UEpJcTFwT0E3Sy1vcVhmN1NlLE1tTTNNemxo","displayCustomize":false,"shepherdTokenDistributionCreate":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSxPMXRhZFhtcnRMejk3Rkp3X0tIWm92LE1HSmpZalpr","contentModifierId":"0059000000390Wh","shepherdTokenDocumentSoftDelete":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSxDLU5DUGI3WFI5aERQUWI0TjFnZTlCLE56VTRPR05s","btnDownloadTip":"下载此内容的最新版本","showVersionsTab":true,"previewTab":"预览","isDistributable":false,"isPublishedIntoAnyPersonalWorkspace":false,"isDownloadsTabViewer":true,"selectedVersionId":"06890000002pZ1P","btnRestoreContent":"恢复内容","downloadTarget":"downloadIFrame","isDocumentUpdater":true,"hasActionsAvailableForSelectedDocument":true,"spaceForUpload":true,"authorName":"liu jack","unsubscribeTo_document":"取消订阅内容","isArchived":false,"isDocumentContributor":true,"btnDownloadLabel":"下载","isDeck":false,"isLatest":true,"btnAddNewVersion":"上载新版本","displayPublishButton":false,"notSubscribedTip_document":"您未订购此文档。单击订购。","isReference":false,"isSubscribersTabViewer":true,"showContentDeliver":true,"docHasPotentialUnpublishableWorkspaces":false,"isPublished":true,"contentPacksTab":"内容包","authorId":"0059000000390Wh","commentsTab":"留言","docHasPotentialPublishableWorkspaces":true,"shareToAnotherWorkspace":"与其它文档库共享","commentViewer":true,"createdDate":1449473863000,"isLinkType":false,"btnCreateDistribution":"递送此内容","downloadsTab":"下载","showContentPacksTab":true,"displayModifyDocPack":false,"isOwnedByRegularWorkspace":true,"btnEditMenu":"编辑","hasPDFPreview":true,"btnDownloadAsNative":"原始","displayModifyDeck":false,"isSubscribed":false,"updating":"正在更新...","btnContentDistributions":"递送内容","removeFromWorkspaces":"从文档库中删除","windowTitleSelected":"Salesforce CRM Content：协查员","documentDownloadAction":"downloadBegin","isDocumentRevisor":true,"btnContentDistributionsTip":"发送此内容给同事、潜在客户或联系人","shepherdTokenDocumentRestore":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSxiNVltTnYzRjAydnp6RzFQREc2bm52LE9XWmlZakl6","notSubscribed":"订购","shepherdTokenDistributionShowRelated":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSw4LXRaOFlnME1vQXh3OWc1bmN3OVZVLE1EWTJaVFV5","btnPublishTip":"将此内容发布到已共享的文档库","contentModifierName":"liu jack","shepherdTokenDocumentArchive":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSx3eTZFVXlKUVJmQ3Q5d0ZRaEZDOU9lLFpHTmpOemt6","btnEditMenuTip":"编辑内容属性","displayDownload":true,"fileSize":"9 KB","hasPublishableWorkspaces":true,"subscribedTip_document":"您已订购此文档。单击取消订购。","isSyncedOrSharedWithCollaboratorRights":false,"isPack":false,"btnCustomizeTipPack":"添加、删除或重新排列文件来创建新的内容包","btnEditDetails":"编辑内容详细信息","workspaceActions":"文档库操作","title":"内容详细信息","btnArchiveContent":"归档内容","isDocumentRestorer":true,"subscribeTo_account":"订购作者","btnDownloadAsPDF":"PDF","versionsTab":"版本","isDocumentArchiver":true,"moveContent":"移动到其它文档库","hasPreview":true,"btnDeleteContent":"删除内容","downloadTargetForPdf":"downloadIFrame","btnCustomizeTipPres":"添加、删除或重新排列幻灯片来创建新的演示文稿","unsubscribeTo_account":"取消订阅作者","isDocumentDeleter":true,"shepherdTokenDocumentDownloadAction":"VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQ1T0RkYSw4V0o5TGF6WDd6TE9UajlUZlVoU3hpLE5UaGxNalF5","contentUrl":null,"btnRelatedDistributions":"显示内容递送","isDocumentMoveable":true,"displaySubscribeButton":true,"btnCustomize":"复制和自定义","documentId":"06990000002nMB4","isUserNameViewer":true,"subscribersTab":"订户"});
    
    
    
    
    
    
    

</s-cript-->
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="container_pageFooter" class="container">
            <span style="display: none;" id="ieHiddenFoot">.</span><div id="datePicker" class="datePicker">
                <div class="dateBar">
                    <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();" onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
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
                    </select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();" onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select title="年" name="calYearPicker" id="calYearPicker"><option value="2015">2015</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                    </select>
                </div>
                <div class="calBody">
                    <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                        <tbody>
                            <tr>
                                <th scope="col" class="dayOfWeek">星期日</th>
                                <th scope="col" class="dayOfWeek">星期一</th>
                                <th scope="col" class="dayOfWeek">星期二</th>
                                <th scope="col" class="dayOfWeek">星期三</th>
                                <th scope="col" class="dayOfWeek">星期四</th>
                                <th scope="col" class="dayOfWeek">星期五</th>
                                <th scope="col" class="dayOfWeek">星期六</th>
                            </tr>
                            <tr id="calRow1" class="calRow">
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                            </tr>
                            <tr id="calRow2" class="calRow">
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                            </tr>
                            <tr id="calRow3" class="calRow">
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                            </tr>
                            <tr id="calRow4" class="calRow">
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                            </tr>
                            <tr id="calRow5" class="calRow">
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                            </tr>
                            <tr id="calRow6" class="calRow">
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                                <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);" onblur="hiOff(this);">&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttonBar"><a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday" href="javascript:%20void%280%29%3B">今天</a></div>
                </div>
            </div>
            <!-- Body events -->
            <!--s-cript type="text/javascript">function bodyOnLoad(){SfdcApp.MruHovers.global_data.url='retURL=%2Fsfc%2Fservlet.shepherd&isAjaxRequest=1&renderMode=RETRO&nocache=1457322663355';setFocusOnLoad();if (typeof(startSessionTimer)!='undefined') {startSessionTimer(); };if (typeof(ActivityReminder)!='undefined') {ActivityReminder.initialize([], false, true);};if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)){sfdcPage.executeOnloadQueue();};; if (this.loadChatFrameJs) loadChatFrameJs();SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");new UnifiedSearchAutoCompleteElement("phSearchInput","/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet",1,{},false,null,"phSearchForm",["div","searchOwner","asPhrase","sen"],{},true,3,100);new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");if(window.PreferenceBits){window.PreferenceBits.prototype.csrfToken="VmpFPSxNakF4Tmkwd015MHhNRlF3TXpvMU1Ub3dNeTQwTURCYSxJYUlqNURQX3VqRkQtWWljcG92NXN3LE1HVXdaalF3";};}function bodyOnBeforeUnload(){if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)){sfdcPage.executeOnBeforeUnloadQueue();};}function bodyOnFocus(){}function bodyOnUnload(){}</s-cript-->
            <!-- End page content -->
            <cc1:PageFooter ID="SiteFooter1" runat="server" />
        </div>
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
    <iframe src="/sfc/null.htm" id="downloadIFrame" name="downloadIFrame" style="display: none;" title=""></iframe>
    <div class="container_unused" id="devFooter"></div>
    <script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "", "act": "u", "host": "", "oid": "00D90000000yvHG", "exp": 1457329585000 };</script>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script><!--
    <script>		    (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1452545182000/sfdc/SfdcSessionBase198.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script async="" defer="" src="/jslibrary/sfdc/SfdcSessionBase198.js"></script>
    <script>		    (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1450392800000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script async="" defer="" src="/jslibrary/sfdc/MarketingSurveyResponse.js"></script>-->
    <div class="x-shadow" id="ext-gen89" style="z-index: 20001; left: 759px; top: 289px; width: 78px; height: 22px; display: none;">
        <div class="xst">
            <div class="xstl"></div>
            <div class="xstc" style="width: 66px;"></div>
            <div class="xstr"></div>
        </div>
        <div class="xsc" style="height: 10px;">
            <div class="xsml"></div>
            <div class="xsmc" style="width: 66px;"></div>
            <div class="xsmr"></div>
        </div>
        <div class="xsb">
            <div class="xsbl"></div>
            <div class="xsbc" style="width: 66px;"></div>
            <div class="xsbr"></div>
        </div>
    </div>
    <div id="ext-comp-1001" class="x-tip" style="position: absolute; z-index: 20002; visibility: hidden; width: 78px; left: 755px; top: 286px; display: none;">
        <div class="x-tip-tl">
            <div class="x-tip-tr">
                <div class="x-tip-tc">
                    <div class="x-tip-header x-unselectable" id="ext-gen4" style="-moz-user-select: none;"><span class="x-tip-header-text" id="ext-gen90"></span></div>
                </div>
            </div>
        </div>
        <div class="x-tip-bwrap" id="ext-gen5">
            <div class="x-tip-ml">
                <div class="x-tip-mr">
                    <div class="x-tip-mc" id="ext-gen8">
                        <div class="x-tip-body" id="ext-gen6" style="height: auto; width: 66px;">编辑内容属性</div>
                    </div>
                </div>
            </div>
            <div class="x-tip-bl x-panel-nofooter" id="ext-gen7">
                <div class="x-tip-br">
                    <div class="x-tip-bc"></div>
                </div>
            </div>
        </div>
        <div class="x-tip-anchor x-tip-anchor-top" id="ext-gen9" style="z-index: 20003; display: none;"></div>
    </div>
    <div id="docViewerOverlay" role="dialog" aria-live="assertive" aria-describedby="docViewerOverlayTitle" class="overlayDialog docViewerOverlay" style="width: 730px; left: 683px; top: 188px;">
        <div class="topRight">
            <a onfocus="document.getElementById(&quot;docViewerOverlayX&quot;).focus()" title="对话框开头" style="width: 2px; height: 2px; position: absolute; border: 0; margin: 0; padding: 0; background: none; outline: none; z-index: -1; cursor: none;" onclick="return false;" href="javascript:void(0)" id="docViewerOverlayFocusPoint">对话框开头</a>
            <div class="topLeft">
                <a class="dialogClose" href="javascript:void(0)" onclick="sfdcPage.getDialogById('docViewerOverlay').cancel()" onmouseout="this.className = 'dialogClose'" onmouseover="this.className = 'dialogCloseOn'" tabindex="0" title="关闭" id="docViewerOverlayX">关闭</a><h2 id="docViewerOverlayTitle">文件预览</h2>
            </div>
        </div>
        <div class="middle">
            <div id="docViewerOverlayContent" class="innerContent">
                <div id="docViewerContainerParent" class="docViewerContainerParent">
                    <div id="docViewerContainer" class="docViewerContainer"></div>
                </div>
            </div>
        </div>
        <div class="bottomRight">
            <label for="docViewerOverlayBlurCatch" style="display: none;">'&nbsp;'</label>
            <input type="text" style="width: 2px; height: 2px; position: absolute; border: 0; margin: 0; padding: 0; background: none; outline: none; z-index: -1; cursor: none;" id="docViewerOverlayBlurCatch">
            <div class="bottomLeft"></div>
        </div>
    </div>
    <div style="position: absolute; z-index: 15000; visibility: hidden; left: -10000px; top: -10000px;" class="x-menu x-menu-floating x-layer x-hide-offsets" id="ext-comp-1021">
        <a tabindex="-1" onclick="return false;" href="#" class="x-menu-focus" id="ext-gen86"></a>
        <ul class="x-menu-list" id="ext-gen87" style="height: 52px;">
            <li class="x-menu-list-item" id="x-menu-el-ext-comp-1022"><a href="#" id="ext-comp-1022" class="x-menu-item">
                <img class="x-menu-item-icon " src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">原始</a></li>
            <li class="x-menu-list-item" id="x-menu-el-ext-comp-1023"><a href="#" id="ext-comp-1023" class="x-menu-item">
                <img class="x-menu-item-icon " src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">PDF</a></li>
        </ul>
    </div>
    <div id="ext-gen92" style="position: absolute; left: -1000px; top: -1000px; visibility: hidden; font-size: 11px; font-style: normal; font-weight: 400; font-family: Arial,Helvetica,sans-serif; line-height: 14px; text-transform: none; letter-spacing: normal; width: auto;"></div>
    <div class="x-shadow" id="ext-gen91" style="z-index: 14999; left: 678px; top: 282px; width: 176px; height: 154px; display: none;">
        <div class="xst">
            <div class="xstl"></div>
            <div class="xstc" style="width: 164px;"></div>
            <div class="xstr"></div>
        </div>
        <div class="xsc" style="height: 142px;">
            <div class="xsml"></div>
            <div class="xsmc" style="width: 164px;"></div>
            <div class="xsmr"></div>
        </div>
        <div class="xsb">
            <div class="xsbl"></div>
            <div class="xsbc" style="width: 164px;"></div>
            <div class="xsbr"></div>
        </div>
    </div>
    <div style="position: absolute; z-index: 15000; visibility: hidden; left: -10000px; top: -10000px;" class="x-menu x-menu-floating x-layer x-hide-offsets" id="ext-comp-1028">
        <a tabindex="-1" onclick="return false;" href="#" class="x-menu-focus" id="ext-gen93"></a>
        <ul class="x-menu-list" id="ext-gen94" style="height: 150px;">
            <li class="x-menu-list-item " id="x-menu-el-ext-comp-1029"><a href="#" id="ext-comp-1029" class="x-menu-item">
                <img class="x-menu-item-icon " src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">编辑内容详细信息</a></li>
            <li class="x-menu-list-item  x-hide-display" id="x-menu-el-ext-comp-1030"><a href="#" id="ext-comp-1030" class="x-menu-item">
                <img class="x-menu-item-icon pack16" src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">编辑内容包</a></li>
            <li class="x-menu-list-item  x-hide-display" id="x-menu-el-ext-comp-1031"><a href="#" id="ext-comp-1031" class="x-menu-item">
                <img class="x-menu-item-icon pres16" src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">编辑演示文稿</a></li>
            <li class="x-menu-list-item " id="x-menu-el-ext-comp-1032"><a href="#" id="ext-comp-1032" class="x-menu-item">
                <img class="x-menu-item-icon contributeIcon16" src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">上载新版本</a></li>
            <li class="x-menu-list-item  x-menu-sep-li" id="x-menu-el-ext-comp-1033"><span class="x-menu-sep" id="ext-gen96">&nbsp;</span></li>
            <li class="x-menu-list-item " id="x-menu-el-ext-comp-1034"><a href="#" id="ext-comp-1034" class="x-menu-item">
                <img class="x-menu-item-icon " src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">归档内容</a></li>
            <li class="x-menu-list-item  x-hide-display" id="x-menu-el-ext-comp-1035"><a href="#" id="ext-comp-1035" class="x-menu-item">
                <img class="x-menu-item-icon " src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">恢复内容</a></li>
            <li class="x-menu-list-item " id="x-menu-el-ext-comp-1036"><a href="#" id="ext-comp-1036" class="x-menu-item">
                <img class="x-menu-item-icon " src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="">删除内容</a></li>
            <li class="x-menu-list-item  x-menu-sep-li" id="x-menu-el-ext-comp-1037"><span class="x-menu-sep" id="ext-gen97">&nbsp;</span></li>
            <li class="x-menu-list-item " id="x-menu-el-ext-comp-1038"><a href="#" id="ext-comp-1038" class="x-menu-item x-menu-item-arrow">
                <img class="x-menu-item-icon " src="/img/content/workspace16.png" alt="">文档库操作</a></li>
        </ul>
    </div>
</body>
</html>