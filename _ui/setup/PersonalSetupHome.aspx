<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalSetupHome.aspx.cs"
    Inherits="WebClient._ui.setup.PersonalSetupHome" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title><%=FullName%>，您好！ ~  - Professional Edition</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css" rel="stylesheet"  type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/setupV2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411677186000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-7 下午2:47", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": true }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.233', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalSetup');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif setupTab  Setup sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">
            <table class="outer setupV2" width="100%" id="bodyTable" border="0" cellspacing="0"
                cellpadding="0">
                <tr>
                    <td class="oLeft">
                        <cc1:SetupNavTree2 id="SetupNavTree1" Version="2" runat="server" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader">
                                                <%=FullName%>，您好！</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links"><!--
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a>--></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="zen contentWrapper">
                            <div class="mySettingsQuickList contentModule">
                                <div>
                                    <h3>
                                        快速链接</h3>
                                    <div class="zen-line">
                                        <a href="/_ui/system/security/ChangePassword.aspx?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo&amp;setupid=ChangePassword"
                                            class="zen-size1of2 item zen-unit"><span class="zen-media zen-mediaExt">
                                                <img src="/s.gif" alt="" width="64" height="64" class="zen-img" style="background-image: url(/img/setup/setupLandingSupersprite.png);
                                                    background-position: 0px -356px; width: 64px; height: 64px; background-repeat: no-repeat;"
                                                    title="" /><span class="zen-mediaBody"><span class="itemTitle">更改我的密码</span><span
                                                        class="itemDescription">个人 &gt; </span><span class="itemCategory">更改我的密码</span></span></span></a><a
                                                            href="/_ui/core/feeds/notification/FeedsNotificationPrefEdit?setupid=CollaborationEmailSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalCollaboration"
                                                            class="zen-size1of2 zen-lastUnit zen-unit item"><span class="zen-media zen-mediaExt"><img
                                                                src="/s.gif" alt="" width="64" height="64" class="zen-img" style="background-image: url(/img/setup/setupLandingSupersprite.png);
                                                                background-position: 0px -428px; width: 64px; height: 64px; background-repeat: no-repeat;"
                                                                title="" /><span class="zen-mediaBody"><span class="itemTitle">管理我的 Chatter 电子邮件通知</span><span
                                                                    class="itemDescription">Chatter &gt; </span><span class="itemCategory">电子邮件通知</span></span></span></a></div>
                                    <div class="zen-line">
                                        <a href="/setup/personalInformationSetup.aspx?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo&amp;setupid=PersonalInformation"
                                            class="zen-size1of2 item zen-unit"><span class="zen-media zen-mediaExt">
                                                <img src="/s.gif" alt="" width="64" height="64" class="zen-img" style="background-image: url(/img/setup/setupLandingSupersprite.png);
                                                    background-position: 0px -716px; width: 64px; height: 64px; background-repeat: no-repeat;"
                                                    title="" /><span class="zen-mediaBody"><span class="itemTitle">编辑我的个人信息</span><span
                                                        class="itemDescription">个人 &gt; </span><span class="itemCategory">个人信息</span></span></span></a><a
                                                            href="/setup/layout/ConfigureMyTabs.aspx?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDisplayAndLayout&amp;setupid=CustomizeTabs"
                                                            class="zen-size1of2 zen-lastUnit zen-unit item"><span class="zen-media zen-mediaExt"><img
                                                                src="/s.gif" alt="" width="64" height="64" class="zen-img" style="background-image: url(/img/setup/setupLandingSupersprite.png);
                                                                background-position: 0px -500px; width: 64px; height: 64px; background-repeat: no-repeat;"
                                                                title="" /><span class="zen-mediaBody"><span class="itemTitle">自定义我的选项卡</span><span
                                                                    class="itemDescription">显示与布局 &gt; </span><span class="itemCategory">自定义我的选项卡</span></span></span></a></div>
                                    <div class="clearingbox">
                                    </div>
                                </div>
                            </div>
                            <div class="mySettingsApplications contentModule">
                                <div>
                                    <h3>
                                        桌面加载项</h3>
                                    <div class="zen-line">
                                        <!--
                                        <div class="zen-size1of3 item zen-unit">
                                            <div class="zen-media">
                                                <a href="/setup/crmforoutlook/crmforoutlooksetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopIntegration&amp;setupid=OutlookEdition"
                                                    class="zen-img">
                                                    <img src="/s.gif" alt="" width="32" height="32" style="background-image: url(/img/setup/setupLandingSupersprite.png);
                                                        background-position: 0px -276px; width: 32px; height: 32px; background-repeat: no-repeat;"
                                                        title="" /></a><div class="zen-mediaBody">
                                                            Salesforce for Outlook<div class="itemDownload">
                                                                <a href="/setup/crmforoutlook/crmforoutlooksetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopIntegration&amp;setupid=OutlookEdition">
                                                                    立即下载</a></div>
                                                        </div>
                                            </div>
                                            <div class="itemText">
                                                保持同步 Outlook 和 Salesforce 之间的联系人、事件和任务。</div>
                                        </div>
                                        <div class="zen-lastUnit zen-size1of3 zen-unit item">
                                            <div class="zen-media">
                                                <a href="/setup/chatterdesktop/chatterdesktopsetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopIntegration&amp;setupid=ChatterDesktop"
                                                    class="zen-img">
                                                    <img src="/s.gif" alt="" width="32" height="32" style="background-image: url(/img/setup/setupLandingSupersprite.png);
                                                        background-position: 0px -36px; width: 32px; height: 32px; background-repeat: no-repeat;"
                                                        title="" /></a><div class="zen-mediaBody">
                                                            Chatter Desktop<div class="itemDownload">
                                                                <a href="/setup/chatterdesktop/chatterdesktopsetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopIntegration&amp;setupid=ChatterDesktop">
                                                                    立即下载</a></div>
                                                        </div>
                                            </div>
                                            <div class="itemText">
                                                我们的遗留 Chatter 桌面内容建立在 Adobe AIR 技术上。</div>
                                        </div>
                                        -->
                                    </div>
                                    <div class="clearingbox">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "pkEa1NWE6znDMmzzo5aFE_41sOqEUWXegC9WK_6Goo25yH5X9C4byDFR00BH06qDdw9EvhXRBzH57nFeYNrZAIGWeIuDsisenF8S4MVqeIxAwW3gbId3YozFT.eF3jJq1uu6NHdjYpmSom4OC6KL8iN3j4kVeXSMSPTHbCAjfRgVfhhuddyYQkJE2hmXIxdIIMWCBA=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        walkthrough = { log: function () { Sfdc.ClientLogging.addRelay(new Sfdc.ClientLogging.ConsoleLogger(), true); Sfdc.log("Console logging is ON."); } };</script>
    <script>        walkthrough.trials = {};</script>
    <script>        var SFDCSessionVars = { "uid": "005900000038QVZ", "exp": 1412671656000, "host": "login.salesforce.com", "oid": "00D90000000yI4o", "server": "", "act": "u" };</script>
    <script defer="true" src="/jslibrary/sfdc/Setup.js"></script>
    <script defer="true" src="/jslibrary/sfdc/SetupV2.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
<!-- page generation time: 103ms -->
