<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contentManageTab.aspx.cs" Inherits="WebClient.apps.scontent.contentManageTab" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>信息管理：<%=SubTitle%> ~ .com - Developer Edition</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/EXT/ext-3.2.2/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ExtCSS-SFDC.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/CampaignManageMembers.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet"   type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />
    <!--<link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/userEditContactInfo.css" />-->
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.2.2/ext.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>    
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/WorkflowInstanceDataManager.js"></script>
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
     <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
     
    <script src="/js/Business.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1425412794000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-3-12 下午2:52", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Campaign';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.2.2/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1423784394000/Theme3/zh/base/CampaignManageMembers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1424390604000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426127703000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1420068168000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.168', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Fcampaign%2FCampaignManageMembersAddTab%3FcampaignId%3D70190000000uODU');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab  CampaignManageMembersAddTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table cellspacing="0" cellpadding="0" width="100%" border="0" id="bodyTable" class="outer">
                <!-- Start page content table -->
                <tbody>
                    <tr>
                        <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                            <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                        </td>
                        <td id="bodyCell" class="oRight">
                            <!-- Start page content -->
                            <a name="skiplink">
                                <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                    alt="内容在此开始" src="/s.gif"></a>
                            <div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img title="<%=SubTitle%>" class="pageTitleIcon" alt="<%=SubTitle%>" src="/s.gif" /><h1 class="pageType">
                                             <%=SubTitle%><span class="titleSeparatingColon">:</span></h1>
                                        <h2 class="pageDescription">
                                            主页</h2>
                                        <div class="blank">
                                            &nbsp;</div>
                                    </div>
                                    <div class="links"><!--
                                        <a title="了解详细信息！ （新窗口）" class="configLinks zen-deemphasize" href="#">了解详细信息！</a>
                                        | <a title="此页面的帮助 （新窗口）" href="#"><span class="helpLink">此页面的帮助</span><img class="helpIcon"
                                            alt="" src="/s.gif"></a>--></div>
                                </div>
                                <div id="save_error" class="message errorM3" style="display: none;"><table cellspacing="0" cellpadding="0" border="0" class="messageTable"><tbody><tr><td><img title="错误" class="msgIcon" alt="错误" src="/s.gif"></td><td class="messageCell"><div class="messageText"><h4>保存更改时出现错误。</h4><span id="save_error_text"></span></div></td></tr>
</tbody></table></div>
                                <!--<div id="queueTabs" class="miniTab secondaryPalette">                                    
                                    <%=SubTabs%>
                                </div>-->
                            
                            </div>                           
                            <script type="text/javascript" >                                if (window.sfdcPage) sfdcPage.registerMessage('save_error');</script>
                            <%=SubTabContent%>
                            <br />   
                             <% if(Supermore.WebContext.IsAdministrator) { %> 
                            <table id="toolsContent" class="toolsContent">
                                <tbody>
                                    <tr>
                                       
                                        <td>
                                        <div>
                                                <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                    <h3 class="lbHeader">
                                                        设置</h3>
                                                    <div class="lbBody">
                                                        <ul>
                                                            <li><a href="/00l/o?oType=100201&t=090">
                                                                信息栏目</a></li><li><a href="/00l/o?oType=100202&t=091">
                                                                通知栏目</a></li></ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                         <td>
                                            <div>
                                                <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                    <h3 class="lbHeader">
                                                        其它</h3>
                                                    <div class="lbBody">
                                                        <ul>
                                                            <li><a href="/00l/o?oType=100230&t=090">标签 (设置文章标签)</a></li>
                                                         </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>   
                            <%} %>                     
                            <script type="text/javascript">
                                window.sfdcPage.appendToOnloadQueue(function () {
                                    //DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/p/setup/layout/LayoutFieldList?type=Campaign&amp;setupid=CampaignFields", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=Campaign&amp;retURL=%2F701%2Fo&amp;setupid=CampaignFields", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/ui/setup/Setup?setupid=Campaign", "newUrl": "/01I/e?retURL=%2F701%2Fo&amp;setupid=Campaign", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/p/setup/custent/ValidationFormulaListUI/d?retURL=%2F701%2Fo&amp;tableEnumOrId=Campaign&amp;setupid=CampaignValidations", "newUrl": "/03d/e?retURL=%2F701%2Fo&amp;TableEnumOrId=Campaign&amp;Active=1&amp;setupid=CampaignValidations", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017Abi/e?retURL=%2F701%2Fo&amp;setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑列", "hoverText": "自定义此列表中的列", "url": "/p/setup/layout/ListLayoutEdit?LayoutEntity=Campaign&amp;retURL=%2F701%2Fo&amp;LayoutType=KeyList&amp;setupid=CampaignSearchLayouts", "newWindow": false, "newInNewWindow": false, "section": 1}]);
                                    //new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D190.18.10%2526instance%253DAP1&amp;amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2F701%2Fo");
                                });
                            </script>
                            <script type="text/javascript">
                                CampaignManageMembersTab(0);
                                //CampaignManageMembersTab.toggleFilters(getElementById('toggler'));
                            </script>
                            <script type="text/javascript">
                                //CampaignMember_onLoadCriteria();
                                function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fui%2Fcampaign%2FCampaignManageMembersExistingTab%3FcampaignId%3D70190000000uODU&isAjaxRequest=1&renderMode=RETRO&nocache=1426131057337'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }
                            </script>
                            <!-- End page content -->
                            <input name="queryid" id="queryid" value="51B5A3B8-3925-49DA-B1EC-0BC018ADA43F" type="hidden" />
                            <script type="text/javascript">
                                /*
                                Load data
                                */
                                /*
                                jQuery(document).ready(function () {
                                var queryid = jQuery("#queryid").val();
                                itemGrid = new entityGrid(jQuery('#gridContainer'), queryid);
                                itemGrid.orderField = "__UpdatedOn";
                                itemGrid.orderDirection = "desc";
                                itemGrid.queryCondition = "";
                                itemGrid.getTotalRecords();
                                itemGrid.loadData();
                                });
                                */

                            </script>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <!--<script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>-->
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
