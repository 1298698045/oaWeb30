<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showAllTabs.aspx.cs" Inherits="WebClient.home.showAllTabs" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>所有选项卡 ~ Salesforce.com - Professional Edition</title>
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/zen-componentsCompatible.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/elements.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/common.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/allTabs.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/ChatterFiles.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/chatterCore.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/chatterExtended.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1416942468000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416942468000/Theme3/00D90000001032O/005900000036IhK/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/WalkthroughCoreUI.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/1416323438000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/1417626712000/zh_CN.js"></script>
    <script src="/jslibrary/1416323438000/sfdc/Chatter.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1417626712000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-12-10 下午8:52", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": false }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": false }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000036IhK", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'AllTab';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/allTabs.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416942468000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416942468000/Theme3/00D90000001032O/005900000036IhK/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1416323438000/sfdc/Security.js"></script>
    <script>       // ClientHash.prototype.needsClientHash('sid_Client', '00000036IhK0000001032O', '118.186.239.76', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fhome%2FshowAllTabs.jsp');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif allTabTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" /><div
        id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible">
                        <a class="zen handlebarContainer" href="javascript:void(0);" id="handlebarContainer"
                            title="单击关闭侧栏 [Alt+S]"><span class="zen-assistiveText">单击以关闭侧栏</span><span class="indicator"
                                id="pinIndicator"></span><span class="indicator" id="pinIndicator2"></span><span
                                    class="pinBox" id="handle">&nbsp;</span></a><div class="collapsible sidebar" id="sidebarDiv">
                                        <div class="createNewModule sidebarModule">
                                            <div class="sidebarModuleBody sidebarModuleBodyNoHeader">
                                                <div class="menuButton" id="createNew">
                                                    <div class="menuButtonButton" id="createNewButton">
                                                        <span class="menuButtonLabel" id="createNewLabel" tabindex="0">新建...</span></div>
                                                    <div class="menuButtonMenu" id="createNewMenu">
                                                        <a href="/00U/e?retURL=%2Fhome%2FshowAllTabs.jsp" class="eventMru firstMenuItem menuButtonMenuLink">
                                                            <img src="/s.gif" alt="事件" class="mruIcon" title="事件" />事件</a><a href="/00T/e?retURL=%2Fhome%2FshowAllTabs.jsp"
                                                                class="menuButtonMenuLink taskMru"><img src="/s.gif" alt="任务" class="mruIcon" title="任务" />任务</a><a
                                                                    href="/003/e?retURL=%2Fhome%2FshowAllTabs.jsp" class="contactMru menuButtonMenuLink"><img
                                                                        src="/s.gif" alt="联系人" class="mruIcon" title="联系人" />联系人</a><a href="/001/e?retURL=%2Fhome%2FshowAllTabs.jsp"
                                                                            class="menuButtonMenuLink accountMru"><img src="/s.gif" alt="客户" class="mruIcon"
                                                                                title="客户" />客户</a><a href="/00Q/e?retURL=%2Fhome%2FshowAllTabs.jsp" class="leadMru menuButtonMenuLink"><img
                                                                                    src="/s.gif" alt="潜在客户" class="mruIcon" title="潜在客户" />潜在客户</a><a href="/006/e?retURL=%2Fhome%2FshowAllTabs.jsp"
                                                                                        class="menuButtonMenuLink opportunityMru"><img src="/s.gif" alt="业务机会" class="mruIcon"
                                                                                            title="业务机会" />业务机会</a><a href="/reportbuilder/reportType.apexp" class="menuButtonMenuLink reportMru"><img
                                                                                                src="/s.gif" alt="报表" class="mruIcon" title="报表" />报表</a><a href="javascript:Sfdc.AccessibleUploadFileDialog.open(null, %27MNEPe.WYwsiBRQnkD3ZYG_eOHuAObEa0tBpfTBygvhlUNKdtSS8g4yDkDzbtVrYq0Otb8DkysAN.L1mlK_4x.d8g9Ih2A2PU4cihYFt_ZIcu.P9e0GRKMkprZb6vxO973PwZqlZqUQ1MQrOcE2okPt2sY4Y=%27);"
                                                                                                    class="menuButtonMenuLink contentSearchMru"><img src="/s.gif" alt="" class="mruIcon"
                                                                                                        title="" />文件</a><a href="/01t/e?retURL=%2Fhome%2FshowAllTabs.jsp" class="productMru menuButtonMenuLink"><img
                                                                                                            src="/s.gif" alt="产品" class="mruIcon" title="产品" />产品</a></div>
                                                </div>
                                                <script>                                                    new MenuButton('createNew', false);</script>
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
                                                        <a href="/6AA?src=10">
                                                            <img src="/s.gif" alt="" class="unresolvedIcon" title="" />未解决的项目</a></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="recentItemModule sidebarModule">
                                            <div class="sidebarModuleHeader brandPrimaryBgr">
                                                <h2 class="brandPrimaryFgr">
                                                    最近项目</h2>
                                            </div>
                                            <div class="sidebarModuleBody">
                                                <div class="hidden" data-urlquerystr="retURL=%2Fhome%2FshowAllTabs.jsp&amp;isAjaxRequest=1&amp;renderMode=RETRO&amp;nocache=1418215952589&amp;hl=005900000036IiX%3A%2C0W190000000jLhH%3A%2C005900000036IhK%3A%2C005900000036Iic%3A%2C"
                                                    id="urlQueryStr">
                                                </div>
                                                <div class="mruList individualPalette" data-hovdata="dir=chatterHover-right">
                                                    <div class="userBlock" data-hovid="005900000036IhK">
                                                        <div class="mruItem" id="mru005900000036IhK">
                                                            <a href="/005900000036IhK" class="userMru" accesskey="1" tabindex="0" title="[Alt+1]">
                                                                <img src="/s.gif" alt="用户: lin peng" class="mruIcon" title="用户: lin peng" /><span
                                                                    class="mruText">lin peng</span></a></div>
                                                    </div>
                                                    <div class="badgeDefinitionBlock" data-hovid="0W190000000jLhH">
                                                        <div class="mruItem" id="mru0W190000000jLhH">
                                                            <a href="/0W190000000jLhH" class="badgeDefinitionMru" accesskey="2" tabindex="0"
                                                                title="[Alt+2]">
                                                                <img src="/s.gif" alt="徽章: Thanks" class="mruIcon" title="徽章: Thanks" /><span class="mruText">Thanks</span></a></div>
                                                    </div>
                                                    <div class="userBlock" data-hovid="005900000036IiX">
                                                        <div class="mruItem" id="mru005900000036IiX">
                                                            <a href="/005900000036IiX" class="userMru" accesskey="3" tabindex="0" title="[Alt+3]">
                                                                <img src="/s.gif" alt="用户: t1" class="mruIcon" title="用户: t1" /><span class="mruText">t1</span></a></div>
                                                    </div>
                                                    <div class="userBlock" data-hovid="005900000036Iic">
                                                        <div class="mruItem" id="mru005900000036Iic">
                                                            <a href="/005900000036Iic" class="userMru" accesskey="4" tabindex="0" title="[Alt+4]">
                                                                <img src="/s.gif" alt="用户: t2" class="mruIcon" title="用户: t2" /><span class="mruText">t2</span></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="recycleBinModule sidebarModule">
                                            <div class="sidebarModuleBody sidebarModuleBodyNoHeader">
                                                <a href="/search/UndeletePage">
                                                    <img src="/s.gif" alt="回收站" class="recycleIcon" title="回收站" /><span class="recycleText">回收站</span></a></div>
                                        </div>
                                    </div>
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <h1 class="pageType noSecondHeader">
                                                所有选项卡</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Duser_alltabs.htm%2526section%253DPersonal_Setup%2526language%253Dzh_CN%2526release%253D192.13.2%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="bDescription">
                            请使用以下链接以快速导航选项卡。或者，<a href="/p/setup/layout/ConfigureMyTabs?retURL=%2Fhome%2FshowAllTabs.jsp&amp;setupid=CustomizeTabs">添加选项卡</a>到显示窗口以更好地配合您的工作方式。
                        </div>
                        <div class="bPageBlock secondaryPalette">
                            <div class="pbHeader">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <form action="/home/showAllTabs.jsp" id="showAllTabSet" method="post" name="showAllTabSet"
                                            onsubmit="if (window.ffInAlert) { return false; }">
                                            <h3>
                                                <label for="p1">
                                                    <span class="requiredMark">*</span>视图：</label></h3>
                                            <select id="p1" name="p1" onchange="javascript:document.showAllTabSet.submit();">
                                                <option value="000000000000000" selected="selected">所有选项卡</option>
                                                <option value="02u900000018vv3">销售</option>
                                                <option value="02u900000018vv5">Salesforce Chatter</option>
                                                <option value="02u900000018vv6">市场营销</option>
                                                <option value="02u900000018vv7">Call Center</option>
                                            </select></form>
                                        </td>
                                        <td class="bCustomize">
                                            <span class="info">添加选项卡到默认显示</span><input value="自定义我的选项卡" class="btnImportant"
                                                name="customize" onclick="navigateToUrl('/p/setup/layout/ConfigureMyTabs?retURL=%2Fhome%2FshowAllTabs.jsp&setupid=CustomizeTabs',null,'customize');"
                                                title="自定义我的选项卡" type="button" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <table class="detailList tabs">
                                    <tr>
                                        <td class="dataCol chatterBlock">
                                            <a href="/_ui/core/chatter/ui/ChatterPage" class="listRelatedObject chatterBlock title">
                                                <img src="/s.gif" alt="Chatter" class="relatedListIcon" title="Chatter" />Chatter</a>
                                        </td>
                                        <td class="dataCol accountBlock col02">
                                            <a href="/001/o" class="listRelatedObject accountBlock title">
                                                <img src="/s.gif" alt="客户" class="relatedListIcon" title="客户" />客户</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol jigsawSearchBlock">
                                            <a href="/DataDotComSearch" class="listRelatedObject jigsawSearchBlock title">
                                                <img src="/s.gif" alt="Data.com" class="relatedListIcon" title="Data.com" />Data.com</a>
                                        </td>
                                        <td class="dataCol consoleBlock col02">
                                            <a href="/ui/desktop/DesktopPage" class="listRelatedObject consoleBlock title">
                                                <img src="/s.gif" alt="控制台" class="relatedListIcon" title="控制台" />控制台</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol Custom50Block">
                                            <a href="/servlet/servlet.Integration?lid=01r900000019SkE&amp;ic=1" class="listRelatedObject Custom50Block title">
                                                <img src="/s.gif" alt="Getting Started" class="relatedListIcon" title="Getting Started" />Getting
                                                Started</a>
                                        </td>
                                        <td class="dataCol contactBlock col02">
                                            <a href="/003/o" class="listRelatedObject contactBlock title">
                                                <img src="/s.gif" alt="联系人" class="relatedListIcon" title="联系人" />联系人</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol reportBlock">
                                            <a href="/00O/o" class="listRelatedObject reportBlock title">
                                                <img src="/s.gif" alt="报表" class="relatedListIcon" title="报表" />报表</a>
                                        </td>
                                        <td class="dataCol leadBlock col02">
                                            <a href="/00Q/o" class="listRelatedObject leadBlock title">
                                                <img src="/s.gif" alt="潜在客户" class="relatedListIcon" title="潜在客户" />潜在客户</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol recognitionBlock">
                                            <a href="/_ui/core/userprofile/UserProfilePage?tab=sfdc.Recognition" class="listRelatedObject recognitionBlock title">
                                                <img src="/s.gif" alt="表扬" class="relatedListIcon" title="表扬" />表扬</a>
                                        </td>
                                        <td class="dataCol userBlock col02">
                                            <a href="/_ui/core/chatter/people/PeopleListPage" class="listRelatedObject userBlock title">
                                                <img src="/s.gif" alt="人员" class="relatedListIcon" title="人员" />人员</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol productBlock">
                                            <a href="/01t/o" class="listRelatedObject productBlock title">
                                                <img src="/s.gif" alt="产品" class="relatedListIcon" title="产品" />产品</a>
                                        </td>
                                        <td class="dataCol campaignBlock col02">
                                            <a href="/701/o" class="listRelatedObject campaignBlock title">
                                                <img src="/s.gif" alt="市场活动" class="relatedListIcon" title="市场活动" />市场活动</a><a href="/p/camp/CampaignIntro"
                                                    class="tellMeMore">了解详细信息！</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol orderBlock">
                                            <a href="/801/o" class="listRelatedObject orderBlock title">
                                                <img src="/s.gif" alt="订单" class="relatedListIcon" title="订单" />订单</a>
                                        </td>
                                        <td class="dataCol documentBlock col02">
                                            <a href="/015/o" class="listRelatedObject documentBlock title">
                                                <img src="/s.gif" alt="文档" class="relatedListIcon" title="文档" />文档</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol caseBlock">
                                            <a href="/500/o" class="listRelatedObject caseBlock title">
                                                <img src="/s.gif" alt="个案" class="relatedListIcon" title="个案" />个案</a>
                                        </td>
                                        <td class="dataCol fileBlock col02">
                                            <a href="/_ui/core/chatter/files/FileTabPage" class="listRelatedObject fileBlock title">
                                                <img src="/s.gif" alt="文件" class="relatedListIcon" title="文件" />文件</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol contractBlock">
                                            <a href="/800/o" class="listRelatedObject contractBlock title">
                                                <img src="/s.gif" alt="合同" class="relatedListIcon" title="合同" />合同</a>
                                        </td>
                                        <td class="dataCol collaborationGroupBlock col02">
                                            <a href="/_ui/core/chatter/groups/GroupListPage" class="listRelatedObject collaborationGroupBlock title">
                                                <img src="/s.gif" alt="小组" class="relatedListIcon" title="小组" />小组</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol pricebook2Block">
                                            <a href="/01s/o" class="listRelatedObject pricebook2Block title">
                                                <img src="/s.gif" alt="价格手册" class="relatedListIcon" title="价格手册" />价格手册</a>
                                        </td>
                                        <td class="dataCol opportunityBlock col02">
                                            <a href="/006/o" class="listRelatedObject opportunityBlock title">
                                                <img src="/s.gif" alt="业务机会" class="relatedListIcon" title="业务机会" />业务机会</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol userBlock">
                                            <a href="/_ui/core/userprofile/UserProfilePage" class="listRelatedObject userBlock title">
                                                <img src="/s.gif" alt="简档" class="relatedListIcon" title="简档" />简档</a>
                                        </td>
                                        <td class="dataCol dashboardBlock col02">
                                            <a href="/01Z/o" class="listRelatedObject dashboardBlock title">
                                                <img src="/s.gif" alt="仪表板" class="relatedListIcon" title="仪表板" />仪表板</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol userBlock">
                                            <a href="/_ui/core/userprofile/UserProfilePage?tab=sfdc.ProfilePlatformOverview"
                                                class="listRelatedObject userBlock title">
                                                <img src="/s.gif" alt="简档概览" class="relatedListIcon" title="简档概览" />简档概览</a>
                                        </td>
                                        <td class="dataCol recognitionBlock col02">
                                            <a href="/0W2/o" class="listRelatedObject recognitionBlock title">
                                                <img src="/s.gif" alt="已收到徽章" class="relatedListIcon" title="已收到徽章" />已收到徽章</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataCol userBlock">
                                            <a href="/_ui/core/userprofile/UserProfilePage?tab=sfdc.ProfilePlatformFeed" class="listRelatedObject userBlock title">
                                                <img src="/s.gif" alt="简档摘要" class="relatedListIcon" title="简档摘要" />简档摘要</a>
                                        </td>
                                        <td class="dataCol forecastBlock col02">
                                            <a href="/_ui/sales/forecasting/ui/ForecastingTabPage" class="listRelatedObject forecastBlock title">
                                                <img src="/s.gif" alt="预测" class="relatedListIcon" title="预测" />预测</a>
                                        </td>
                                    </tr>
                                    <tr class="last">
                                        <td class="dataCol solutionBlock">
                                            <a href="/501/o" class="listRelatedObject solutionBlock title">
                                                <img src="/s.gif" alt="解决方案" class="relatedListIcon" title="解决方案" />解决方案</a>
                                        </td>
                                        <td class="dataCol homeBlock col02">
                                            <a href="/home/home.jsp" class="listRelatedObject homeBlock title">
                                                <img src="/s.gif" alt="主页" class="relatedListIcon" title="主页" />主页</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fhome%2FshowAllTabs.jsp&isAjaxRequest=1&renderMode=RETRO&nocache=1418215952589'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "qp9iDhsPQPwNpG_5kj5twCCCZUV6hGMsuF7TNtDuKj5hfUz2wnUB7OT1XbVQ20PC62DaiMTtlxJ4nMxEu6uYR.SiJMQyRoL9N2BnLSFDyHG1CjRsodUyKT1o4uqUOd_6IUTCp3iIXYxKvin2aXPZPrtqsXYYYSXgfFLw_fSJ43HpP5TcSPSDFlzeXMayI4QnNTk2Zg=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        var SFDCSessionVars = { "uid": "005900000036IhK", "exp": 1418222935000, "host": "login..com", "oid": "00D90000001032O", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>    
    <script defer="true" src="/jslibrary/1416323438000/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/1416323438000/sfdc/Zen.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1416323438000/sfdc/WalkthroughCorePlatform.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1416323438000/sfdc/WalkthroughTrials.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1416323438000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1416425598000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
<!-- page generation time: 75ms -->
