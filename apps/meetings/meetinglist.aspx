<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meetinglist.aspx.cs" Inherits="WebClient.apps.meetings.meetinglist" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议管理 : 会议</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <!--<link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setupV2.css" rel="stylesheet" type="text/css" />-->
    <link href="/CSS/leftmenu.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/LineItem.js"></script>
    <script src="/jslibrary/sfdc/source/SearchOnly.js"></script>
    <script src="/jslibrary/sfdc/Setup.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
    </script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3",  "dateFormat": "yyyy-M-d", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1447190632000", "today": "2015-11-19 上午11:54", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false }, { "index": 368, "name": "LightningExperiencePreferred", "value": true }], "networkId": "" });
    </script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1446230834000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1447683674000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>             Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf');; });</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script>        window.sfdcPage = new LineItemSearchPage();</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '114.111.167.95', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Fsetup%2Fpersonal%2FLoginHistorySetupPage%3Fsetupid%3DLoginHistory%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DPersonalInfo');</script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif setupTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">
            <table class="outer setupV2" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="oLeft"><div class="">
                        <cc1:TabLeftMenu ID="SetupNavTree1" MenuName="meeting" runat="server" /></div>
                    </td>
                    <td id="bodyCell" class="oRight"><a name="skiplink">
                        <img class="skiplink skipLinkTargetInner zen-skipLinkTarget" width="1" height="1" title="内容在此开始" alt="内容在此开始" src="/s.gif"></a>
                        <div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img title="会议管理" class="pageTitleIcon" alt="会议管理" src="/s.gif"><h1 class="pageType">会议管理<span class="titleSeparatingColon">:</span></h1>
                                    <h2 class="pageDescription">主页</h2>
                                    <div class="blank">&nbsp;</div>
                                </div>
                                <div class="links"><!--<a title="了解详细信息！ （新窗口）" class="configLinks zen-deemphasize" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">了解详细信息！</a> | <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a>--></div>
                            </div>
                            <div class="ptBreadcrumb"></div>
                        </div>
                        <script type="text/javascript">
                        </script>
                        <!-- Begin ListElement -->
                         <div class="bPageBlock brandSecondaryBrd" style="display:none;">
                                        <div class="pbHeader" id="lineItemView_searchHeader">
                                            </div>
                             </div>
                        <!-- motif: Setup -->
                        <script src="/static/111213/js/picklist.js"></script>
                        <script>
                            <%=InitJson%>                           
                        </script>
                        <div class="individualPalette listViewportWrapper" id="lineItemView_wrapper">
                            <div class="listViewport opportunityBlock" id="lineItemView_listViewport">
                                <form action="" id="lineItemView_actionForm" method="POST" name="lineItemView_actionForm"
                                    onsubmit="return ListViewport.instances['lineItemView'].verify('请至少选择一行')">
                                    <input type="hidden" id="lineItemView_pageState" name="lineItemView_pageState" value="" /><input
                                        type="hidden" id="lineItemView_rolodexState" name="lineItemView_rolodexState"
                                        value="" /><div class="topNav primaryPalette" id="lineItemView_topNav" style="display: none">
                                            <div class="controls">
                                                <h2 class="title"></h2>
                                                <span class="divisionLabel" id="lineItemView_divisionLabel"></span>
                                                <div class="topNavTab" id="lineItemView_topNavTab">
                                                </div>
                                                <div class="clearingBox">
                                                </div>
                                            </div>
                                        </div>
                                    <div class="subNav" id="lineItemView_subNav">
                                        <div class="linkBar brandSecondaryBrd">
                                            <div class="listButtons" id="lineItemView_listButtons">
                                            </div>
                                            <div class="clearFilter" id="lineItemView_clearFilter">
                                            </div>
                                            <div class="rolodex" id="lineItemView_rolodex" style="visibility: hidden">
                                                <a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A0%7D%29"
                                                    class="listItem"><span class="listItemPad">A</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A1%7D%29"
                                                        class="listItem"><span class="listItemPad">B</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A2%7D%29"
                                                            class="listItem"><span class="listItemPad">C</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A3%7D%29"
                                                                class="listItem"><span class="listItemPad">D</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A4%7D%29"
                                                                    class="listItem"><span class="listItemPad">E</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A5%7D%29"
                                                                        class="listItem"><span class="listItemPad">F</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A6%7D%29"
                                                                            class="listItem"><span class="listItemPad">G</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A7%7D%29"
                                                                                class="listItem"><span class="listItemPad">H</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A8%7D%29"
                                                                                    class="listItem"><span class="listItemPad">I</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A9%7D%29"
                                                                                        class="listItem"><span class="listItemPad">J</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A10%7D%29"
                                                                                            class="listItem"><span class="listItemPad">K</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A11%7D%29"
                                                                                                class="listItem"><span class="listItemPad">L</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A12%7D%29"
                                                                                                    class="listItem"><span class="listItemPad">M</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A13%7D%29"
                                                                                                        class="listItem"><span class="listItemPad">N</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A14%7D%29"
                                                                                                            class="listItem"><span class="listItemPad">O</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A15%7D%29"
                                                                                                                class="listItem"><span class="listItemPad">P</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A16%7D%29"
                                                                                                                    class="listItem"><span class="listItemPad">Q</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A17%7D%29"
                                                                                                                        class="listItem"><span class="listItemPad">R</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A18%7D%29"
                                                                                                                            class="listItem"><span class="listItemPad">S</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A19%7D%29"
                                                                                                                                class="listItem"><span class="listItemPad">T</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A20%7D%29"
                                                                                                                                    class="listItem"><span class="listItemPad">U</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A21%7D%29"
                                                                                                                                        class="listItem"><span class="listItemPad">V</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A22%7D%29"
                                                                                                                                            class="listItem"><span class="listItemPad">W</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A23%7D%29"
                                                                                                                                                class="listItem"><span class="listItemPad">X</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A24%7D%29"
                                                                                                                                                    class="listItem"><span class="listItemPad">Y</span></a><a href="javascript:ListViewport.instances%5B%27lineItemView%27%5D.getListData%28%7B%27rolodexIndex%27%3A25%7D%29"
                                                                                                                                                        class="listItem"><span class="listItemPad">Z</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:26})"
                                                                                                                                                            class="listItem"><span class="listItemPad">其他</span></a><a href="javascript:ListViewport.instances[%27lineItemView%27].getListData({%27rolodexIndex%27:-1})"
                                                                                                                                                                class="listItem listItemLast"><span class="listItemPad">全部</span></a>
                                            </div>
                                            <div class="clearingBox">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="listBody" id="lineItemView_listBody">
                                        <div class="exception" id="lineItemView_exception">
                                        </div>
                                    </div>
                                    <div class="offPageIds" id="lineItemView_offPageIds">
                                    </div>
                                </form>
                                <div class="bottomNav" id="lineItemView_bottomNav">
                                    正在加载...
                                </div>
                            </div>
                            <div class="feedContainer" id="lineItemView_feedContainer" style="display: none">
                                <div class="feedBody" id="lineItemView_feedBody">
                                </div>
                            </div>
                        </div>

                        <!-- Body events -->
                        <script type="text/javascript">
                            function bodyOnLoad() {
                                 if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                /*new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true);*/
                                if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>





        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <!--<script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "https://login..com/login/sessionserver190.html", "act": "u", "host": "login..com", "oid": "00D90000000yvHG", "exp": 1447912330000 };</script>
    <script>var SFDCMktUrl = 'https://login..com/17181/logo180.png';</script>
    <script> (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1444699760000/sfdc/SfdcSessionBase198.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script> (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1444699760000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>-->
</body>
</html>
<!-- page generation time: 754ms -->
