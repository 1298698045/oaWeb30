<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mtRooms.aspx.cs" Inherits="WebClient.apps.meetings.mtRooms" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议管理 : 会议</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet"
        type="text/css" />
     <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ManyWhoStyles.css" rel="stylesheet"  type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/Calendar.css" rel="stylesheet"  type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/CSS/leftmenu.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Activity.js"></script>
    <script src="/jslibrary/1412954762000/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/ManyWhoActivity.js"></script>
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
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-M-d", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1447190632000", "today": "2015-11-19 上午11:54", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false }, { "index": 368, "name": "LightningExperiencePreferred", "value": true }], "networkId": "" });
    </script><!--
    <script>             try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1446230834000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1447683674000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/35.0/sprites/1444933246000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>-->
    <script>             Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf');; });</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
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
                                    <img title="会议室" class="pageTitleIcon" alt="会议室" src="/s.gif"><h1 class="pageType">会议室<span class="titleSeparatingColon">:</span></h1>
                                    <h2 class="pageDescription">主页</h2>
                                    <div class="blank">&nbsp;</div>
                                </div>
                                <div class="links"><!--<a title="了解详细信息！ （新窗口）" class="configLinks zen-deemphasize" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">了解详细信息！</a> | <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Floc%253Dhelp%2526target%253Daccounts.htm%2526section%253DAccounts%2526language%253Dzh_CN%2526release%253D200.16%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"><span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a>--></div>
                            </div>
                            <div class="calendarHeaderBG calendarHeader">
                                       <span class="userIcons">  
                                                <!--<a href="/025" title="活动列表视图"><img src="/s.gif" alt="活动列表视图" class="listViewIcon" onblur="this.className = 'listViewIcon';" onfocus="this.className = 'listViewIconOn';" onmouseout="this.className = 'listViewIcon';this.className = 'listViewIcon';"  onmouseover="this.className = 'listViewIconOn';this.className = 'listViewIconOn';"   title="活动列表视图" /></a>-->
                                            </span>
                                            <span class="dwmIcons">
                                                <%if (IsDayCalendar)
                                                  {
                                                 %>
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md3=<%=Md3%>"  title="日视图"><img title="日视图"  class="dayViewIconOn" alt="日视图" src="/s.gif" /></a> 
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md2=<%=Md2%>" title="星期视图"><img title="星期视图" onmouseover="this.className = 'weekViewIconOn';this.className = 'weekViewIconOn';" onmouseout="this.className = 'weekViewIcon';this.className = 'weekViewIcon';" onfocus="this.className = 'weekViewIconOn';" onblur="this.className = 'weekViewIcon';" class="weekViewIcon" alt="星期视图" src="/s.gif" /></a>   
                                                 <% }
                                                  else
                                                  {%>
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md3=<%=Md3%>"  title="日视图"><img title="日视图" onmouseover="this.className = 'dayViewIconOn';this.className = 'dayViewIconOn';" onmouseout="this.className = 'dayViewIcon';this.className = 'dayViewIcon';" onfocus="this.className = 'dayViewIconOn';" onblur="this.className = 'dayViewIcon';" class="dayViewIcon" alt="日视图" src="/s.gif" /></a> 
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md2=<%=Md2%>" title="星期视图"><img src="/s.gif" alt="星期视图" class="weekViewIconOn"  title="星期视图" /></a> 
                                                <%} %>
                                                <!--<a href="/025/c?rType=1&amp;md0=<%=Md0%>&amp;md1=<%=Md1%>" title="月视图 - 已选"><img title="月视图" onmouseover="this.className = 'monthViewIconOn';this.className = 'monthViewIconOn';" onmouseout="this.className = 'monthViewIcon';this.className = 'monthViewIcon';" onfocus="this.className = 'monthViewIconOn';" onblur="this.className = 'monthViewIcon';" class="monthViewIcon" alt="月视图" src="/s.gif" /></a>-->
                                            </span>
                                            <span class="dateText"><%=WeekRangeDate %></span>
                                            <span class="arrowIcons">
                                                <%if (IsWeeekCalendar)
                                                  { %>
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=PreMd2%>&amp;md0=<%=Md0%>" class="prev" title="上星期"><img src="/s.gif" alt="上星期" class="prevCalArrow" title="上星期" /></a>
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=NextMd2%>&amp;md0=<%=Md0%>" class="next" title="下星期"><img src="/s.gif" alt="下星期" class="nextCalArrow" title="下星期" /></a>
                                                <%} %>
                                                <%if (IsDayCalendar)
                                                  { %>
                                                  <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md3=<%=PreMd3%>&amp;md0=<%=Md0%>" class="prev" title="前一天"><img src="/s.gif" alt="前一天" class="prevCalArrow" title="前一天" /></a>
                                                <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md3=<%=NextMd3%>&amp;md0=<%=Md0%>" class="next" title="下一天"><img src="/s.gif" alt="下一天" class="nextCalArrow" title="下一天" /></a> 
                                                 <%} %>
                                            </span>
                                            <span class="dateLinks">
                                            <form action="/<%=ModuleType%>/e" id="dtfm" method="GET" name="dtfm" onsubmit="if (window.ffInAlert) { return false; }"    style="display: inline">
                                                  <input type="hidden" name="rType" id="rType" value="<%=ResourceType%>" />
                                                  <input type="hidden" name="cType" id="dphe_cType" value="1" /><input type="hidden" name="md0" id="dphe_md0" value="<%=Md0%>" /><input type="hidden" name="md2" id="dphe_md2" value="<%=Md2%>" /><input id="dtfd" name="dtfd" onchange="document.getElementById('dtfm').submit();"  type="hidden" value="<%=RequestDate%>" />
                                            </form>
                                            <img src="/s.gif" alt="选择日期" class="datePickerIcon" onclick="DatePicker.pickDate(true, 'dtfd', false, this);DatePicker.datePicker.cancelHide(getEvent(event));" title="选择日期" />
                                             <%if (IsWeeekCalendar)
                                                  { %>
                                            <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=ThisMd2%>&amp;md0=<%=Md0%>">本星期</a>
                                             <%} %>
                                                <%if (IsDayCalendar)
                                                  { %>
                                            <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md3=<%=TodayMd3%>&amp;md0=<%=Md0%>">今天</a>
                                             <%} %>
                                             </span>
                                             <!--<span class="buttons"><input type="button" title="新建预约" onclick="document.getElementById('ids').submit();return false;" name="new" class="btn" value=" 新建预约 "></span>-->
                                             <%if (Request["md2"] != null)
                                                   { %>                                            
                                             <!--<span class="wEndCheckBox"><input id="shWkendsCheckbox" name="shWkendsCheckbox" onclick="window.location='/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=ThisMd2%>&amp;md0=<%=Md0%>&amp;shWkends=true';"  type="checkbox" value="1" checked="checked" /><label class="checkboxLabel" for="shWkendsCheckbox">显示周末</label></span>-->
                                              <%} %>
                                             <div class="legend"><div class="busy">&nbsp;</div><span>占用</span><div class="outOfOffice">  </div><span>未审批</span></div>
                                             <div class="clear"></div>                                                                          
                                    </div>
                            <div class="ptBreadcrumb"></div>
                        </div>
                        <div class="bMultiuserCalendar"><!--
                           <div class="bPageBlock brandSecondaryBrd">
                                <div class="pbBody">   -->                     
                                    <%
                                        if (IsWeeekCalendar)
                                        {
                                     %>
                                     <cc1:ResourceCalendar runat="server" ID="WeekCalendar1" CalendarType="2" />
                                     <%} %>
                                     <%
                                         if (IsDayCalendar)
                                        {
                                     %>
                                      <cc1:ResourceCalendar runat="server" ID="DayCalendar1" CalendarType="1" />
                                      <%} %>
                                     <!--
                                </div>
                                <div class="pbFooter secondaryPalette"><div class="bg"></div></div>
                            </div>
                            <div class="multiUserCalSpacer"></div>-->
                            <!--
                            <div class="hoverDetail eventBusy" id="EventHoverPage_00U9000000o0IwE" onmousemove="ActivityHover.getHover('EventHoverPage_00U9000000o0IwE').setPosition(event)"
                                onmouseout="ActivityHover.getHover('EventHoverPage_00U9000000o0IwE').hideHover()"
                                onmouseover="ActivityHover.getHover('EventHoverPage_00U9000000o0IwE').showHover(event, '/ui/core/activity/EventHoverPage?retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D24%26md0%3D2015&id=00U9000000o0IwE&isHvr=1&nocache=1433730693831&%E4%B8%BB%E9%A2%98=%E5%86%99%E6%97%A5%E5%8E%86%E6%A8%A1%E5%9D%97&%E6%97%B6%E9%97%B4=%E4%B8%8A%E5%8D%8810%3A00-%E4%B8%8A%E5%8D%8811%3A00&%E5%BC%80%E5%A7%8B=2015-6-9+%E4%B8%8A%E5%8D%8810%3A00&%E7%BB%93%E6%9D%9F=2015-6-9+%E4%B8%8A%E5%8D%8811%3A00&shBus=true')"
                                style="visibility: hidden;">
                                <div class="hoverOuter">
                                    <div class="hoverInner">
                                        <div class="hoverContentLoading hoverContent" id="EventHoverPage_00U9000000o0IwE_content">
                                            正在加载...<div class="pbFooter">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
                            <script>                                if (window.Hover) { setTimeout(Hover.disableHovers, 7144000) }</script>
                        </div>
                        <script type="text/javascript">
                        </script>
                      
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

