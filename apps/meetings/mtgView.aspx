<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mtgView.aspx.cs" Inherits="WebClient.apps.meetings.mtgView" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议: <%=this.EntityName%> ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/rlHovers.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterCore.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterExtended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/Calendar.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css">
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/chatterExtended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/EntityFeedPage.css" rel="stylesheet" type="text/css" />
    <link href="/CSS/cardview.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .recurrenceFrequency
        {
            margin: 0;
        }
    </style>
    <style type="text/css">
        .bPageBlock .detailList .recurrenceTable td
        {
            vertical-align: middle;
            padding: 10px;
        }
    </style>
    <style type="text/css">
        .calendarTable th.timeCol
        {
            padding-right: .3em;
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Activity.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/ManyWhoActivity.js"></script>
    <script src="/jslibrary/sfdc/EntityFeedPage.js"></script>
    <script>    window.sfdcPage = new DetailPage("00U9000001TzPjQ");
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-M-d", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "ap1.lightning.force.com", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1495479570000", "today": "2017-5-24 下午4:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Event';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1493343760000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1493343760000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/39.0/sprites/1489612250000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif eventTab  event detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed"></td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/img/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img src="/img/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1 class="pageType">会议<span class="titleSeparatingColon">:</span></h1>
                                        <h2 class="pageDescription"><%=this.EntityName%></h2>
                                        <div class="blank">&nbsp;</div>
                                    </div>
                                    <!--href="javascript:printWin(%27/00V/p?id=<%=Request["id"]%>&amp;retURL=%2F00190000015a7I0%27)" -->
                                    <div class="links"><%if(IsOwningUser) { %><a href="javascript:openPopupFocusEscapePounds(%27/00V/p?id=<%=Request["id"]%>&amp;retURL=%2F00190000015a7I0%27, 'qcodejoin', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" class="configLinks" title="可打印视图 （新窗口）">签到二维码</a> | 
                                        <a href="javascript:openPopupFocusEscapePounds(%27/00V/p?id=<%=Request["id"]%>&amp;exitQcode=1%27, 'qcodeexit', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" class="configLinks" title="可打印视图 （新窗口）">签退二维码</a> 
                                        | <a href="javascript:openPopupFocusEscapePounds(%27/apps/meetings/printMeetingPeoplelst.aspx?id=<%=Request["id"]%>&amp;status=2&amp;retURL=%2F00190000015a7I0%27, 'joinlist', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false)" class="configLinks" title="可打印视图 （新窗口）">打印参会人员</a>
                                         | <a href="javascript:openPopupFocusEscapePounds(%27/apps/meetings/printMeetingPeoplelst.aspx?id=<%=Request["id"]%>&amp;status=1&amp;retURL=%2F00190000015a7I0%27,'notclock', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false)" class="configLinks" title="可打印视图 （新窗口）">打印未参会人员</a><%} %></div>
                                </div>
                                <div class="metadata topics" id="section_header" style="display:none;">
                                    <script>chatter.getToolbox().setToken('');</script>
                                    <div class="topicsOnRecordPage">
                                        <div class="topics " id="topicContainer00U9000001TzPjQ" data-entityid="00U9000001TzPjQ"
                                            data-referrer="RECORD_PAGE" data-iswidget="true">
                                            <div class="view topic-widgetWithInfoBubble">
                                                <a href="javascript: void(0);" class="editLink">单击添加主题：</a>   &nbsp;

           <div class="topic-infoBubbleFixAbs">
               <div class="zen topic-infoBubbleFixRel">
                   <div class="topic-infoBubbleWrapper" data-topicwidget="TopicInfoBubble">
                       <a href="javascript:void(0);" title="您为什么要添加主题到记录？" class="iconParent">
                           <img class="visibilityicon" src="/s.gif" alt="您为什么要添加主题到记录？" width="1" height="1">
                       </a>
                       <div class="topic-infoBubble hidden zen-callout zen-arrowLeft zen-sideNorth">
                           <b class="zen-arrow"></b>
                           <div class="zen-inner">
                               <div class="zen-body zen-ptm zen-phm">
                                   <p>
                                       从主题页面或列表视图中添加主题到快速访问相关记录。尽管每个人都可看到主题名，但记录的可见性仍然不变。
                                   </p>
                               </div>
                               <div class="visibilityFooter">
                                   <a title="了解更多（新窗口）" href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);">了解更多</a>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearingBox"></div>
                                </div>
                                <!--
                                <div class="calendarHeader calendarHeaderBG">
                                    <span class="userIcons"><a href="/00U/c?cType=1" title="单用户视图">
                                        <img src="/img/s.gif" alt="单用户视图" class="singleUserViewIcon" onblur="this.className = 'singleUserViewIcon';" onfocus="this.className = 'singleUserViewIconOn';" onmouseout="this.className = 'singleUserViewIcon';this.className = 'singleUserViewIcon';" onmouseover="this.className = 'singleUserViewIconOn';this.className = 'singleUserViewIconOn';" title="单用户视图" /></a><a href="/00U/c?cType=2" title="多用户视图"><img src="/img/s.gif" alt="多用户视图" class="multiUserViewIcon" onblur="this.className = 'multiUserViewIcon';" onfocus="this.className = 'multiUserViewIconOn';" onmouseout="this.className = 'multiUserViewIcon';this.className = 'multiUserViewIcon';" onmouseover="this.className = 'multiUserViewIconOn';this.className = 'multiUserViewIconOn';" title="多用户视图" /></a><a href="/007" title="活动列表视图"><img src="/img/s.gif" alt="活动列表视图" class="listViewIcon" onblur="this.className = 'listViewIcon';" onfocus="this.className = 'listViewIconOn';" onmouseout="this.className = 'listViewIcon';this.className = 'listViewIcon';" onmouseover="this.className = 'listViewIconOn';this.className = 'listViewIconOn';" title="活动列表视图" /></a></span><span class="dwmIcons"><a href="/00U/c?md0=2017&amp;md3=144" title="日视图"><img src="/img/s.gif" alt="日视图" class="dayViewIcon" onblur="this.className = 'dayViewIcon';" onfocus="this.className = 'dayViewIconOn';" onmouseout="this.className = 'dayViewIcon';this.className = 'dayViewIcon';" onmouseover="this.className = 'dayViewIconOn';this.className = 'dayViewIconOn';" title="日视图" /></a><a href="/00U/c?md2=21&amp;md0=2017" title="星期视图"><img src="/img/s.gif" alt="星期视图" class="weekViewIcon" onblur="this.className = 'weekViewIcon';" onfocus="this.className = 'weekViewIconOn';" onmouseout="this.className = 'weekViewIcon';this.className = 'weekViewIcon';" onmouseover="this.className = 'weekViewIconOn';this.className = 'weekViewIconOn';" title="星期视图" /></a><a href="/00U/c?md0=2017&amp;md1=4" title="月视图"><img src="/img/s.gif" alt="月视图" class="monthViewIcon" onblur="this.className = 'monthViewIcon';" onfocus="this.className = 'monthViewIconOn';" onmouseout="this.className = 'monthViewIcon';this.className = 'monthViewIcon';" onmouseover="this.className = 'monthViewIconOn';this.className = 'monthViewIconOn';" title="月视图" /></a></span><div class="clear"></div>
                                </div>
                                <div class="ptBreadcrumb">&nbsp;&#171&nbsp;<a href="/007?fcf=00B90000008ViCl&amp;rolodexIndex=-1&amp;page=1">返回列表：活动</a></div>-->
                            </div>
                        <script type="text/javascript">
                        </script>                       
                        <div class="RLPanelShadow" id="RLPanelShadow">
                            <div class="rls_top">
                                <div class="rls_tl"></div>
                                <div class="rls_tr"></div>
                            </div>
                            <div class="rls_l"></div>
                            <div class="rls_r"></div>
                            <div class="RLPanel" id="RLPanel" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()">
                                <iframe frameborder="0" id="RLPanelFrame" name="RLPanelFrame" src="/emptyHtmlDoc.html" title="隐藏框架 - 忽略"></iframe>
                            </div>
                            <div class="rls_bottom">
                                <div class="rls_bl"></div>
                                <div class="rls_br"></div>
                            </div>
                        </div>
                        <div class="listHoverLinks"><span class="invisibleMinHeight">|</span></div>
                        <script>try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                         <div id="efpViews_5009000000lRqdV" class="efpPanelSelect efpsTopTabs efpViewSelect efpDetailsView">
                            <ul class="optionContainer">
                                <li class="hover">
                                    <a href="javascript:void(0)" id="efpViews_5009000000lRqdV_option1" class="optionItem efpDetailsView selected" onclick="Sfdc.EntityFeed.SelectPanel.selectOptionByName('efpViews_5009000000lRqdV', 'DetailsView')">
                                        <span class="iconContainer">
                                            <img src="/s.gif" class="icon ic_pubType ">
                                            <span class="iconFont"></span>
                                        </span>
                                        <span class="optionLabel">详细信息</span>
                                        <span class="selectArrow"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="javascript:void(0)" id="efpViews_5009000000lRqdV_option0" class="optionItem efpFeedView " onclick="Sfdc.EntityFeed.SelectPanel.selectOptionByName('efpViews_5009000000lRqdV', 'FeedView')">
                                        <span class="iconContainer">
                                            <img src="/s.gif" class="icon ic_pubType ">
                                            <span class="iconFont"></span>
                                        </span>
                                        <span class="optionLabel">会议纪要</span>
                                        <span class="selectArrow"></span>
                                    </a>
                                </li>
                                <li class="dropdownOption" style="visibility: hidden;">
                                    <a href="javascript:void(0)" class="dropdownOptionItem" onclick="Sfdc.EntityFeed.SelectPanel.showOptionsDropdown('efpViews_5009000000lRqdV')" id="ext-gen3">
                                        <span class="optionLabel">更多</span>
                                        <span class="arrowIcon">
                                            <img title="更多" alt="更多" src="/s.gif"></span>
                                        <span class="selectArrow"></span>
                                    </a>
                                    <ul class="dropdownContainer" style="visibility: hidden;">
                                    </ul>
                                </li>
                            </ul>
                            <div class="clearingBox"></div>
                            <script>Sfdc.EntityFeed.SelectPanel.init({"stateCookie":"CaseViews","componentId":"efpViews_5009000000lRqdV","options":{"efpViews_5009000000lRqdV_option1":{"panelId":"ef_details_5009000000lRqdV","visiblePanels":["efJumpLinks_5009000000lRqdV"],"cssClass":"efpDetailsView","selectionKey":"DetailsView","name":"DetailsView","optionId":"efpViews_5009000000lRqdV_option1","label":"详细信息","hiddenPanels":["entity_feed_filter_5009000000lRqdV","efpBody_5009000000lRqdV_lowerMain"]},"efpViews_5009000000lRqdV_option0":{"panelId":"efpBody_5009000000lRqdV_lowerMain","cssClass":"efpFeedView","name":"FeedView","optionId":"efpViews_5009000000lRqdV_option0","label":"摘要","onShowScript":new Function("Sfdc.EntityFeed.SelectPanel.onShow('efpPublishers_5009000000lRqdV');")}},"selectStyle":"TopTabs"});</script>
                        </div>
                        <div id="ef_details_5009000000lRqdV" class="eflDetails efpViewSelectPanel eflDetailsTopTabs">
                            <!--<div class="helpElement"><span class="helpLinkElement"><a href="/layouteditor/layoutEditor.apexp?type=Case&amp;lid=00h9000000RbNyd&amp;retURL=%2F5009000000lRqdV" name="editLayout" target="_top" title="编辑布局"><img src="/img/s.gif" alt="编辑布局" class="editLayoutIcon" title="编辑布局"></a><a href="javascript:printWin(%27/5009000000lRqdV/p?retURL=%2F5009000000lRqdV%27)" name="printView" title="可打印视图 （新窗口）"><img src="/img/s.gif" alt="可打印视图 （新窗口）" class="printerIconDisabled" title="可打印视图 （新窗口）"></a><a href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Dcase_interaction_overview.htm%2526section%253DCases%2526language%253Dzh_CN%2526release%253D212.15.2%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);" name="help" title="此页面的帮助 （新窗口）"><img src="/img/s.gif" alt="此页面的帮助 （新窗口）" class="helpIcon" title="此页面的帮助 （新窗口）"></a></span></div>-->
                            <div id="efDetails_5009000000lRqdV" class="efObjectDetails1">
                                <div class="efodBody">
                                    <div>

                               
                        <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">会议详细信息</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow" style="<%=ShowButtonHTML%>">
                                            <input value=" 保存 " class="btn" name="inlineEditSave" style="display: none;" title="保存" type="button" onclick="      sfdcPage.save();" />
                                            <input value=" 取消 " class="btn" name="inlineEditCancel" style="display: none;" title="取消" type="button" onclick="    sfdcPage.revert();" />
                                            
                                            <%if(IsOwningUser) { %>
                                            <input value=" 编辑 " class="btn" name="edit" title="编辑" type="button" onclick="    navigateToUrl('/00V/e?id=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>    ', 'DETAIL', 'edit');" style="height: 25px;" />                                            
                                            <input value=" 删除 " class="btn" name="del" title="删除" type="button" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?delID=<%=Request["id"]%>&amp;type=5000&amp;retURL=%2F00V%2Fc&amp;_CONFIRMATIONTOKEN=&amp;failRetURL=%2F70190000000uODU', 'DETAIL', 'del');" style="height: 25px;" />
                                            <input value="邀请添加议题" class="btn" name="newTask" title="邀请添加议题" type="button" onclick="  navigateToUrl('/ui/meeting/item/invitee?id=<%=Request["id"]%>    &amp;retURL=<%=NextRetURL%>    ', 'DETAIL', 'newTask');" style="height: 25px;" />
                                            <div class="menuButton" id="managedetail" style="height: 25px;">
                                                <div class="menuButtonButton" id="managedetailButton"><span class="menuButtonLabel" id="managedetailLabel" tabindex="0">邀请参会人</span></div>
                                                <div class="menuButtonMenu" id="managedetailMenu"><a href="#" onclick="javascript:navigateToUrl('/meeting/mem/addFromGroup?addTo=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>')" class="menuButtonMenuLink firstMenuItem">邀请参会 - 分组</a><a href="#" onclick="javascript:navigateToUrl('/meeting/mem/SelectSearch?addTo=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>')" class="menuButtonMenuLink">邀请参会 - 搜索</a></div>
                                            </div>
                                            <script>    new MenuButton('managedetail', false);</script>
                                            <input value=" 编辑会议纪要 " class="btn" name="editsumm" title="编辑会议纪要" type="button" onclick="    navigateToUrl('/apps/meetings/mtgSummary.aspx?id=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>', 'DETAIL', 'edit');" style="height: 25px;" />
                                            <%} %>
                                            
                                            <!--<input value="创建跟踪事件" class="btn" name="newEvent" title="创建跟踪事件" type="button" onclick="                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          navigateToUrl('/00U/e?retURL=%2F00U%2Fc%3Fmd0%3D2017%26md1%3D4%26cType%3D1&amp;evt5=%E5%A4%AA%E5%8E%9F', 'DETAIL', 'newEvent');" />
                                            <input value="添加到 Outlook" class="btn" name="vcal" title="添加到 Outlook" type="button" onclick="                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          navigateToUrl('/servlet/servlet.OutlookEvent?rnd=1495614346278&amp;id=00U9000001TzPjQ&amp;_CONFIRMATIONTOKEN=VmpFPSxNakF4Tnkwd05TMHlOMVF3T0RveU5UbzBOaTR5TnpoYSwzUV9LN2dGQ0xrR3pwQVRJVXgtVlN6LE0yRmhPR05t&amp;common.udd.actions.ActionsUtilORIG_URI=%2Fservlet%2Fservlet.OutlookEvent', 'DETAIL', 'vcal');" />
                                            -->
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">
                                    错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。
                                </div>
                                <div class="pbSubsection">
                                    <%=FormHTML%>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;</td>
                                        <td class="pbButtonb" id="bottomButtonRow"  style="<%=ShowButtonHTML%>" >
                                            <input value=" 保存 " class="btn" name="inlineEditSave" style="display: none;" title="保存" type="button" onclick="sfdcPage.save();" />
                                            <input value=" 取消 " class="btn" name="inlineEditCancel" style="display: none;" title="取消" type="button" onclick="    sfdcPage.revert();" />
                                             <%if(IsOwningUser) { %>
                                            <input value=" 编辑 " class="btn" name="edit" title="编辑" type="button" onclick="    navigateToUrl('/00V/e?id=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>    ', 'DETAIL', 'edit');" style="height: 25px;" />
                                            <input value=" 删除 " class="btn" name="del" title="删除" type="button" onclick="if ((Modal.confirm && Modal.confirm('是否确定？')) || (!Modal.confirm && window.confirm('是否确定？'))) navigateToUrl('/setup/own/deleteredirect.aspx?delID=<%=Request["id"]%>    &amp;type=5000&amp;retURL=%2F00V%2Fc&amp;_CONFIRMATIONTOKEN=&amp;failRetURL=%2F70190000000uODU', 'DETAIL', 'del');" style="height: 25px;" />
                                            <input value="邀请添加议题" class="btn" name="newTask" title="邀请添加议题" type="button" onclick="  navigateToUrl('/ui/meeting/item/invitee?id=<%=Request["id"]%>    &amp;retURL=<%=NextRetURL%>    ', 'DETAIL', 'newTask');" style="height: 25px;" />
                                            <div class="menuButton" id="inviteedetail">
                                                <div class="menuButtonButton" id="inviteedetailButton"><span class="menuButtonLabel" id="inviteedetailLabel" tabindex="0">邀请参会人</span></div>
                                                <div class="menuButtonMenu" id="inviteedetailMenu"><a href="#" onclick="javascript:navigateToUrl('/meeting/mem/addFromGroup?addTo=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>')" class="menuButtonMenuLink firstMenuItem">邀请参会 - 分组</a><a href="#" onclick="javascript:navigateToUrl('/meeting/mem/SelectSearch?addTo=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>')" class="menuButtonMenuLink">邀请参会 - 搜索</a></div>
                                            </div>
                                            <script>    new MenuButton('inviteedetail', false);</script>
                                            <input value=" 编辑会议纪要 " class="btn" name="editsumm" title="编辑会议纪要" type="button" onclick="navigateToUrl('/apps/meetings/mtgSummary.aspx?id=<%=Request["id"]%>&amp;retURL=<%=NextRetURL%>', 'DETAIL', 'edit');" style="height: 25px;" />
                                            <%} %>
                                            
                                            <!--<input value="创建跟踪任务" class="btn" name="newTask" title="创建跟踪任务" type="button" onclick="    navigateToUrl('/00T/e?retURL=%2F00U%2Fc%3Fmd0%3D2017%26md1%3D4%26cType%3D1&amp;tsk5=%E5%A4%AA%E5%8E%9F', 'DETAIL', 'newTask');" />
                                            <input value="创建跟踪事件" class="btn" name="newEvent" title="创建跟踪事件" type="button" onclick="    navigateToUrl('/00U/e?retURL=%2F00U%2Fc%3Fmd0%3D2017%26md1%3D4%26cType%3D1&amp;evt5=%E5%A4%AA%E5%8E%9F', 'DETAIL', 'newEvent');" />
                                            <input value="添加到 Outlook" class="btn" name="vcal" title="添加到 Outlook" type="button" onclick="    navigateToUrl('/servlet/servlet.OutlookEvent?rnd=1495614346278&amp;id=00U9000001TzPjQ&amp;_CONFIRMATIONTOKEN=VmpFPSxNakF4Tnkwd05TMHlOMVF3T0RveU5UbzBOaTR5TnpoYSwzUV9LN2dGQ0xrR3pwQVRJVXgtVlN6LE0yRmhPR05t&amp;common.udd.actions.ActionsUtilORIG_URI=%2Fservlet%2Fservlet.OutlookEvent', 'DETAIL', 'vcal');" />-->
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg"></div>
                            </div>
                        </div>
                           
                       
                        <script src="/static/111213/js/picklist4.js"></script>
                        <script>                            //new InlineEditData({ "editable": true, "_CONFIRMATIONTOKEN": "VmpFPSxNakF4Tnkwd05TMHlOMVF3T0RveU5UbzBOaTR5TXpCYSxPcUktV2NiVFBEUWdaUnU1WkxBN1UwLE1HRmtOVFV5", "entityId": "00U9000001TzPjQ", "sysMod": "15c398fc370", "fields": [{ "state": "NONE", "fieldType": "DATETIME", "initialValue": "2017-5-25 下午5:00", "fieldId": "StartDateTime" }, { "state": "NONE", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"], "fieldId": "evt1" }, { "state": "EDIT", "fieldType": "TEXTENUM", "initialValue": "太原", "required": true, "maxLength": 255, "fieldId": "evt5" }, { "state": "NONE", "fieldType": "ENTITYID", "initialValue": ["", "000000000000000"], "fieldId": "evt2" }, { "state": "NONE", "fieldType": "PHONE", "initialValue": "", "fieldId": "evt8" }, { "state": "NONE", "fieldType": "EMAIL", "initialValue": "", "fieldId": "evt7" }, { "state": "NONE", "fieldType": "ENTITYID", "initialValue": ["", "000000000000000"], "fieldId": "evt3" }, { "state": "EDIT", "fieldType": "TEXT", "initialValue": "", "required": false, "maxLength": 255, "fieldId": "evt12" }, { "state": "NONE", "fieldType": "DATETIME", "initialValue": "2017-5-25 下午6:00", "fieldId": "EndDateTime" }, { "state": "EDIT", "fieldType": "STRINGPLUSCLOB", "initialValue": "", "required": false, "maxLength": 32000, "fieldId": "evt6" }, { "state": "POSTONLY", "fieldType": "BOOLEAN", "initialValue": false, "fieldId": "evt15" }, { "state": "NONE", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"], "fieldId": "CreatedBy" }, { "state": "NONE", "fieldType": "ENTITYID", "initialValue": ["liu jack", "0059000000390Wh"], "fieldId": "LastModifiedBy" }] });</script>
                        <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
                        <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
                        <script src="/js/Business.js"></script>
                        <%=MeetingItemHTML%>
                        <script class="extra">  
                            //var doEditMeetingItem = function (id,event) { 
                            //alert(id);
                            // setLastMousePosition(event);
                            //  dialog.show(); 
                            //};
                            function prtMeetingItem(mtgItemId)
                            {
                            
                            }
                            function doEditMeetingItem(id,desc)
                            {
                                document.getElementById("meetingItemId").value=id;
                                document.getElementById("memo").value=desc;
                                //alert(id);
                                dialog.show(); 
                            }
                            function doSaveMeetingItem()
                            {
                                var meetingItemId = document.getElementById("meetingItemId").value;
                                var desc = document.getElementById("memo").value;
                                saveMeetingItem(meetingItemId,desc);
                                //alert(desc);
                                //window.location.reload();
                            }
                        </script>
                        <!-- Begin RelatedListElement -->
                        <%=RelatedListHTML%>
                        <div class="bRelatedList" id="00190000015a7I0_RelatedCaseList">
                            <a name="00190000015a7I0_RelatedCaseList_target"></a>
                            <!-- Begin ListElement -->
                            <!-- motif: Account -->
                            <!-- WrappingClass -->
                            <div class="listRelatedObject contactBlock">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/img/s.gif" alt="" class="minWidth" style="margin-right: 0.25em;" title="" width="12" height="1"><img src="/img/s.gif" alt="" class="relatedListIcon" title=""><h3 id="00190000015a7I0_RelatedCaseList_title">签到人员</h3>
                                                    </td>
                                                    <td class="pbButton"></td>
                                                    <td class="pbHelp"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="00190000015a7I0_RelatedCaseList_body">
                                        <table class="list" cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr class="headerRow">
                                                    <th class="actionColumn" scope="col">操作</th>
                                                    <th scope="col" class=" zen-deemphasize">姓名</th>
                                                    <th scope="col" class=" zen-deemphasize">部门</th>
                                                    <th scope="col" class=" zen-deemphasize">签到时间</th>
                                                    <th scope="col" class=" zen-deemphasize">签退时间</th>
                                                    <th scope="col" class=" zen-deemphasize">接受状态</th>
                                                    <th scope="col" class=" zen-deemphasize">签到状态</th>
                                                    <th scope="col" class=" zen-deemphasize">原因</th>
                                                </tr>
                                                <%=CheckinInviteesHTML%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('00190000015a7I0_RelatedCaseList', '2', '已签到人员', false, '/00190000015a7I0', 'relatedListId=RelatedCaseList&amp;hideDL=1&amp;noh=1&amp;keepPref=1', false, false, true, 'RelatedCaseList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                        <div class="bRelatedList" id="Div1">
                            <a name="00190000015a7I0_RelatedCaseList_target"></a>
                            <!-- Begin ListElement -->
                            <!-- motif: Account -->
                            <!-- WrappingClass -->
                            <div class="listRelatedObject contactBlock">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/img/s.gif" alt="" class="minWidth" style="margin-right: 0.25em;" title="" width="12" height="1"><img src="/img/s.gif" alt="" class="relatedListIcon" title=""><h3 id="H1">未签到</h3>
                                                    </td>
                                                    <td class="pbButton"></td>
                                                    <td class="pbHelp"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="Div2">
                                        <table class="list" cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr class="headerRow">
                                                    <th class="actionColumn" scope="col">操作</th>
                                                    <th scope="col" class=" zen-deemphasize">姓名</th>
                                                    <th scope="col" class=" zen-deemphasize">部门</th>
                                                    <th scope="col" class=" zen-deemphasize">签到时间</th>
                                                    <th scope="col" class=" zen-deemphasize">签退时间</th>
                                                    <th scope="col" class=" zen-deemphasize">接受状态</th>
                                                    <th scope="col" class=" zen-deemphasize">签到状态</th>
                                                    <th scope="col" class=" zen-deemphasize">原因</th>
                                                </tr>
                                                <%=CheckinNotInviteesHTML%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('00190000015a7I0_RelatedCaseList', '2', '未签到人员', false, '/00190000015a7I0', 'relatedListId=RelatedCaseList&amp;hideDL=1&amp;noh=1&amp;keepPref=1', false, false, true, 'RelatedCaseList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                        <div class="bRelatedList first" id="00U9000001TzPjQ_RelatedActivityAttachmentList">
                            <a name="00U9000001TzPjQ_RelatedActivityAttachmentList_target"></a>
                            <!-- Begin ListElement -->

                            <!-- motif: Event -->

                            <!-- WrappingClass -->
                            <div class="noStandardTab">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="pbTitle">
                                                    <img src="/img/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/img/s.gif" alt="" class="relatedListIcon" title="" /><h3 id="00U9000001TzPjQ_RelatedActivityAttachmentList_title">附件</h3>
                                                </td>
                                                <td class="pbButton">&nbsp;</td>
                                                <td class="pbHelp">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbBody" id="00U9000001TzPjQ_RelatedActivityAttachmentList_body">
                                        <table class="list" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="headerRow">
                                                <th scope="col" class="noRowsHeader">没有可显示的记录</th>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('00U9000001TzPjQ_RelatedActivityAttachmentList', '0', '附件', false, '/00U9000001TzPjQ?retURL=%2F00U%2Fc%3Fmd0%3D2017%26md1%3D4%26cType%3D1', 'retURL=%2F00U%2Fc%3Fmd0%3D2017%26md1%3D4%26cType%3D1&relatedListId=RelatedActivityAttachmentList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                            <!-- End ListElement -->
                        </div>
                      
                                         <!--end block-->
                                             </div>
                                </div>
                            </div>
                        </div>
                         <div id="efpBody_5009000000lRqdV_lowerMain" class="lowerMainSection" style="display: none;">
                              <span class="helpLinkElement" style="float:right;">                                  
                                    <a title="上传附件 （新窗口）" style="text-decoration:none; vertical-align:middle;"
                                        name="uploadView" href="#" onclick="setLastMousePosition(event);openPopup('/attach/ActivityAttach.aspx?relatedListId=InstanceAttachmentList&type=5004&pid=<%=Request["id"]%>', 'doc', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);">
                                        <img width="20" height="20" title="上传附件 （新窗口）" alt="上传附件 （新窗口）" class="uploadArrow" src="/img/fujian.gif" align="absmiddle"/>上传纪要附件
                                    </a>
                                </span>    
                             <div style="margin:10px;width:800px;">                               
                                <center>
                                    <div style="padding-top:20px;min-height:300px;max-width:800px;">
                                              <%=MeetingSummary%></div>
                                 </center> 
                             </div>
                               <%=MeetingSummaryRelatedListHTML%>

                             <div id="RelatedNoteList" class="bRelatedList">
    <a name="RelatedNoteList_target"></a>
    <!-- Begin ListElement -->
    <!-- motif: Setup -->
    <!-- WrappingClass -->
    <div class="listRelatedObject setupBlock">
        <div class="bPageBlock brandSecondaryBrd secondaryPalette">
            <div class="pbHeader">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr>
                            <td class="pbTitle">
                                <img width="12" height="1" style="margin-right: 0.25em; margin-right: 0.25em;" title="" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3>
                                            纪要附件</h3>
                            </td>
                            <td class="pbButton">
                                <input type="button" title="附加文件" style="font-weight:bold;height:25px;color:blue;" onclick="setLastMousePosition(event);openPopup('/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&amp;pid=86db0455-aba7-486d-918a-72dd7d7e2c5e&amp;type=5000&amp;retURL=%2F00V%2Fdetail?id=86db0455-aba7-486d-918a-72dd7d7e2c5e', 'RelatedActivityAttachmentList', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);" name="attachFile" class="btn" value=" 附加文件 ">
                            </td>
                            <td class="pbHelp">
                                <span title="备注和附件 帮助 （新窗口）" class="help"><a class="linkCol" href="javascript:openPopupFocusEscapePounds('','Help', 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                    <span class="linkSpan">备注和附件帮助</span>
                                    <img title="备注和附件 帮助 （新窗口）" class="helpIcon" alt="备注和附件 帮助 （新窗口）" src="/s.gif"></a></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="RelatedNoteList_body" class="pbBody">
                <table cellspacing="0" cellpadding="0" border="0" class="list"><tbody><tr class="headerRow"><th scope="col" class="actionColumn">操作</th><th class=" zen-deemphasize" scope="col">类型</th><th class=" zen-deemphasize" scope="col">标题</th><th class=" DateElement zen-deemphasize" scope="col">上次修改时间</th><th class=" zen-deemphasize" scope="col">创建人</th></tr><tr class="dataRow odd first" onblur="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onmouseover="if (window.hiOn){hiOn(this);}"><td class=" actionColumn  "><a title="编辑 - 记录 1 -" target="_blank" class="actionLink" href="/apps/files/DocEditor.aspx?id=9756b11a-8a55-4f22-8ddf-ea8c93ed6921&amp;EditType=1,1&amp;FileType=.xls&amp;filesource=1">编辑</a> | <a title="查看 - 记录 1 - 附件" class="actionLink" onclick="javascript:openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=9756b11a-8a55-4f22-8ddf-ea8c93ed6921&amp;EditType=1,0&amp;readonly=1&amp;FileType=.xls&amp;filesource=1', '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" href="#">在线查看</a> | <a class="actionLink" title="删除 - 记录 1 - 考勤月报表4.xls" onclick="return confirmDelete();" href="/setup/own/deleteredirect.aspx?delID=9756b11a-8a55-4f22-8ddf-ea8c93ed6921&amp;type=00P&amp;retURL=%2F00V%2Fdetail?id=86db0455-aba7-486d-918a-72dd7d7e2c5e">删除</a> | <a title="下载 - 记录 1 - 考勤月报表4.xls" target="_blank" class="actionLink" href="/apps/files/FileDownload.aspx?id=9756b11a-8a55-4f22-8ddf-ea8c93ed6921&amp;isAttach=1&amp;filesource=1">下载查看</a></td><th class=" dataCell  " scope="row">附件</th> <td class="dataCell"><a title="查看 - 记录 1 - 考勤月报表4.xls" href="/apps/files/DocEditor.aspx?id=9756b11a-8a55-4f22-8ddf-ea8c93ed6921&amp;EditType=1,0&amp;readonly=1&amp;FileType=.xls&amp;fullscreen=1&amp;filesource=1" target="_blank">考勤月报表4.xls</a></td> <td class="dataCell">2019/9/16 9:46:28</td> <td class="dataCell">刘子游</td></tr><tr class="dataRow even last" onblur="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onmouseover="if (window.hiOn){hiOn(this);}"><td class=" actionColumn  "><a title="编辑 - 记录 2 -" target="_blank" class="actionLink" href="/apps/files/DocEditor.aspx?id=b4e4a569-a178-495d-9bc3-0a7a3a04c1e9&amp;EditType=1,1&amp;FileType=.xls&amp;filesource=1">编辑</a> | <a title="查看 - 记录 2 - 附件" class="actionLink" onclick="javascript:openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id=b4e4a569-a178-495d-9bc3-0a7a3a04c1e9&amp;EditType=1,0&amp;readonly=1&amp;FileType=.xls&amp;filesource=1', '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" href="#">在线查看</a> | <a class="actionLink" title="删除 - 记录 2 - 全院考勤备份4.xls" onclick="return confirmDelete();" href="/setup/own/deleteredirect.aspx?delID=b4e4a569-a178-495d-9bc3-0a7a3a04c1e9&amp;type=00P&amp;retURL=%2F00V%2Fdetail?id=86db0455-aba7-486d-918a-72dd7d7e2c5e">删除</a> | <a title="下载 - 记录 2 - 全院考勤备份4.xls" target="_blank" class="actionLink" href="/apps/files/FileDownload.aspx?id=b4e4a569-a178-495d-9bc3-0a7a3a04c1e9&amp;isAttach=1&amp;filesource=1">下载查看</a></td><th class=" dataCell  " scope="row">附件</th> <td class="dataCell"><a title="查看 - 记录 2 - 全院考勤备份4.xls" href="/apps/files/DocEditor.aspx?id=b4e4a569-a178-495d-9bc3-0a7a3a04c1e9&amp;EditType=1,0&amp;readonly=1&amp;FileType=.xls&amp;fullscreen=1&amp;filesource=1" target="_blank">全院考勤备份4.xls</a></td> <td class="dataCell">2019/9/16 9:46:53</td> <td class="dataCell">刘子游</td></tr></tbody></table>
            </div>
            <div class="pbFooter secondaryPalette">
                <div class="bg">
                </div>
            </div>
        </div>
    </div>
    <div class="listElementBottomNav">
    </div>
    <script>        try { sfdcPage.registerRelatedList('RelatedNoteList', '', '备注和附件', false, 'null', 'null', false, false, true, null); } catch (e) { }</script>
    <!-- End ListElement -->
</div>
                        </div>

                          <script>                            var dialog = OverlayDialogElement.getDialog('meetingitem_picker_');
                            dialog.isModal = true;
                            dialog.width =470;// 762;
                            dialog.minHeight=500;
                            dialog.hasButtonsBar = true;
                            dialog.displayX = true;
                            dialog.allowKeyboardEsc = true;
                            dialog.extraClass = '';
                            dialog.isAbsolutePositioned = false;
                            dialog.refreshOnClose = false;
                            dialog.isMovable = true;
                            dialog.buttonContents = '\u003Cinput value=\" 保存 \" style=\"height:25px;\" class=\"btn\" id=\"meetingitem_picker_save_btn\" name=\"saveBtn\" onclick=\"doSaveMeetingItem();\" title=\"完成 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"meetingitem_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"dialog.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
                            dialog.setTitle('保存议题');
                            //dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"invitee_picker_header_label\"\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"invitee_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cselect  id=\"invitee_picker_search_types\" name=\"invitee_picker_search_types\"\u003E\u003Coption value=\"myunit\"\u003E本部门用户\u003C/option\u003E\n\u003Coption value=\"all\"\u003E用户、潜在客户和联系人\u003C/option\u003E\n\u003Coption value=\"005\"\u003E用户\u003C/option\u003E\n\u003Coption value=\"00Q\"\u003E潜在客户\u003C/option\u003E\n\u003Coption value=\"003\"\u003E联系人\u003C/option\u003E\n\u003Coption value=\"023\"\u003E资源\u003C/option\u003E\n\u003C/select\u003E\u003Cdiv class=\"search_text_div\" id=\"invitee_picker_search_text_div\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"invitee_picker_search_prefix\" maxlength=\"30\" name=\"invitee_picker_search_prefix\" onkeydown=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyDown(event)\" onkeyup=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"invitee_picker_search_clear_text_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"invitee_picker_search_btn\" name=\"invitee_picker_search_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message infoM4 overlimit_results\" id=\"invitee_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'invitee_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"invitee_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"invitee_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_found_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"invitee_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_selected_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"invitee_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';
                            dialog.contents = '\u003ctable width=\"100%\"\u003e\r\n    \u003ctr\u003e\r\n        \u003ctd\u003e\r\n           \u003ctextarea rows=\"12\" cols=\"70\" id=\"memo\"\u003e\u003c/textarea\u003e\r\n            \u003cinput type=\"hidden\" id=\"meetingItemId\" name=\"meetingItemId\" /\u003e\r\n        \u003c/td\u003e\r\n    \u003c/tr\u003e\r\n \u003c/table\u003e';
                        </script>
                           <script>                            var dialogRemark = OverlayDialogElement.getDialog('meetingaudience_');
                               dialogRemark.isModal = true;
                               dialogRemark.width =470;// 762;
                               dialogRemark.minHeight=500;
                               dialogRemark.hasButtonsBar = true;
                               dialogRemark.displayX = true;
                               dialogRemark.allowKeyboardEsc = true;
                               dialogRemark.extraClass = '';
                               dialogRemark.isAbsolutePositioned = false;
                               dialogRemark.refreshOnClose = false;
                               dialogRemark.isMovable = true;
                               dialogRemark.buttonContents = '\u003Cinput value=\" 保存 \" style=\"height:25px;\" class=\"btn\" id=\"meetingaudience_save_btn\" name=\"saveBtn\" onclick=\"doRemarkAudience();\" title=\"完成 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"meetingaudience__cancel_btn\" name=\"cancelBtn\" onclick=\"dialogRemark.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
                               dialogRemark.setTitle('备注人员');
                               //dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"invitee_picker_header_label\"\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"invitee_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cselect  id=\"invitee_picker_search_types\" name=\"invitee_picker_search_types\"\u003E\u003Coption value=\"myunit\"\u003E本部门用户\u003C/option\u003E\n\u003Coption value=\"all\"\u003E用户、潜在客户和联系人\u003C/option\u003E\n\u003Coption value=\"005\"\u003E用户\u003C/option\u003E\n\u003Coption value=\"00Q\"\u003E潜在客户\u003C/option\u003E\n\u003Coption value=\"003\"\u003E联系人\u003C/option\u003E\n\u003Coption value=\"023\"\u003E资源\u003C/option\u003E\n\u003C/select\u003E\u003Cdiv class=\"search_text_div\" id=\"invitee_picker_search_text_div\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"invitee_picker_search_prefix\" maxlength=\"30\" name=\"invitee_picker_search_prefix\" onkeydown=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyDown(event)\" onkeyup=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"invitee_picker_search_clear_text_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"invitee_picker_search_btn\" name=\"invitee_picker_search_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message infoM4 overlimit_results\" id=\"invitee_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'invitee_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"invitee_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"invitee_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_found_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"invitee_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_selected_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"invitee_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';
                               dialogRemark.contents = '\u003ctable width=\"100%\"\u003e\r\n    \u003ctr\u003e\r\n        \u003ctd\u003e\r\n           \u003ctextarea rows=\"5\" cols=\"70\" id=\"audienceMemo\"\u003e\u003c/textarea\u003e\r\n            \u003cinput type=\"hidden\" id=\"meetingAudienceId\" name=\"meetingAudienceId\" /\u003e\r\n        \u003c/td\u003e\r\n    \u003c/tr\u003e\r\n \u003c/table\u003e';
                        </script>
                        <script type="text/javascript">
                            
                            function markAudience(valid,name,objectTypeCode)
                            {
                                document.getElementById("meetingAudienceId").value=valid;
                                // showDialog("/setup/custent/formnameedit.aspx?id="+id+"&name="+encodeURIComponent(name),"renameFormName","修改名称",500,300);
                                dialogRemark.show();
                            }
                            function doRemarkAudience()
                            {                  
                                var id=document.getElementById("meetingAudienceId").value;
                                var desc=document.getElementById("audienceMemo").value;
                                //debugger;
                                var url = "/apps/CommandProcessor.ashx?cmd=meeting.audience.remark";
                                jQuery.ajax({
                                    async: true, cache: false, dataType: "json",
                                    data: {
                                        id: id,
                                        desc: encodeURIComponent(desc)
                                    },
                                    error: function (request, textStatus, errorThrown) {
                                        errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                                        //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
                                    },
                                    success: function (data, textStatus) {
                                        //debugger;
                                        window.location.reload();
                                        //renderCallback(data);
                                    },
                                    type: "POST",
                                    url: url
                                });
                                 
                            }
                        </script>
                        <!-- End RelatedListElement -->
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() { SfdcApp.TopicsFeed.setupHandlers('topicContainer00U9000001TzPjQ'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U9000001TzPjQ%3FretURL%3D%252F00U%252Fc%253Fmd0%253D2017%2526md1%253D4%2526cType%253D1&isAjaxRequest=1&renderMode=RETRO&nocache=1495614346273'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tnkwd05TMHlOMVF3T0RveU5UbzBOaTR5T0RGYSxkTlBfc3lZLVlfbWhFQWFVR1Nic0NxLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script defer="true" src="/jslibrary/sfdc/ChatterDefer.js"></script>
    <script defer="true" src="/jslibrary/sfdc/Zen.js"></script>
</body>
</html>
<!-- page generation time: 78ms -->
