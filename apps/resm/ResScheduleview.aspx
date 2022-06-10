<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResScheduleview.aspx.cs" Inherits="WebClient.apps.resm.ResScheduleview" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title><%=ResourceTypeName%> - <%=PageTitle%> ~ .com - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/ManyWhoStyles.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/Calendar.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Session["Skin_BrowserName"]%>/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Session["Skin_BrowserName"]%>/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Session["Skin_BrowserName"]%>/extended.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .recurrenceFrequency {
            margin: 0;
        }
    </style>
    <style type="text/css">
        .bPageBlock .detailList .recurrenceTable td {
            vertical-align: middle;
            padding: 10px;
        }
    </style>
    <style type="text/css">
        .calendarTable th.timeCol {
            padding-right: .3em;
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Activity.js"></script>
    <script src="/jslibrary/1412954762000/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/ManyWhoActivity.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd tth:m")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Event';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script type="text/javascript">
            function loadNew()
            {
                //if (!commonUtils.isBrowserSupported()) {
                //{
                //    window.location="/apps/resm/resCal.aspx?t=025";
                //}
            }
            //loadNew();
    </script>
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '118.186.239.66', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00U%2Fc%3FcType%3D2%26md2%3D24%26md0%3D2015');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif eventTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
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
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a>
                        <div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img src="/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1 class="pageType noSecondHeader">
                                        <%=ResourceTypeName%> - <%=PageTitle%> </h1>
                                    <div class="blank">
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="links">
                                    <!--
                                            <a href="javascript:printWin(%27/025/c?rType=<%=ResourceType%>&amp;md2=24&amp;md0=2015&amp;gso=0&amp;pCal=1%27)"
                                                class="configLinks" title="可打印视图 （新窗口）">可打印视图</a> | <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                    title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                        class="helpIcon" /></a>-->
                                </div>
                            </div>
                            <div class="calendarHeaderBG calendarHeader">
                                <span class="userIcons">
                                    <!--/apps/resm/appointlst.aspx?entityType=025&t=025-->
                                    <a href="/025/filter" title="会议室预约列表视图">
                                        <img src="/s.gif" alt="活动列表视图" class="listViewIcon" onblur="this.className = 'listViewIcon';" onfocus="this.className = 'listViewIconOn';" onmouseout="this.className = 'listViewIcon';this.className = 'listViewIcon';" onmouseover="this.className = 'listViewIconOn';this.className = 'listViewIconOn';" title="活动列表视图" /></a>
                                </span>
                                <span class="dwmIcons">
                                    <%if (IsDayCalendar)
                                      {
                                    %>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md3=<%=Md3%>" title="日视图">
                                        <img title="日视图" class="dayViewIconOn" alt="日视图" src="/s.gif" /></a>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md2=<%=Md2%>" title="星期视图">
                                        <img title="星期视图" onmouseover="this.className = 'weekViewIconOn';this.className = 'weekViewIconOn';" onmouseout="this.className = 'weekViewIcon';this.className = 'weekViewIcon';" onfocus="this.className = 'weekViewIconOn';" onblur="this.className = 'weekViewIcon';" class="weekViewIcon" alt="星期视图" src="/s.gif" /></a>
                                    <% }
                                      else
                                      {%>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md3=<%=Md3%>" title="日视图">
                                        <img title="日视图" onmouseover="this.className = 'dayViewIconOn';this.className = 'dayViewIconOn';" onmouseout="this.className = 'dayViewIcon';this.className = 'dayViewIcon';" onfocus="this.className = 'dayViewIconOn';" onblur="this.className = 'dayViewIcon';" class="dayViewIcon" alt="日视图" src="/s.gif" /></a>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md0=<%=Md0%>&amp;md2=<%=Md2%>" title="星期视图">
                                        <img src="/s.gif" alt="星期视图" class="weekViewIconOn" title="星期视图" /></a>
                                    <%} %>
                                    <!--<a href="/025/c?rType=1&amp;md0=<%=Md0%>&amp;md1=<%=Md1%>" title="月视图 - 已选"><img title="月视图" onmouseover="this.className = 'monthViewIconOn';this.className = 'monthViewIconOn';" onmouseout="this.className = 'monthViewIcon';this.className = 'monthViewIcon';" onfocus="this.className = 'monthViewIconOn';" onblur="this.className = 'monthViewIcon';" class="monthViewIcon" alt="月视图" src="/s.gif" /></a>-->
                                </span>
                                <span class="dateText"><%=WeekRangeDate %></span>
                                <span class="arrowIcons">
                                    <%if (IsWeeekCalendar)
                                      { %>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=PreMd2%>&amp;md0=<%=PreMd0%>" class="prev" title="上星期">
                                        <img src="/s.gif" alt="上星期" class="prevCalArrow" title="上星期" /></a>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=NextMd2%>&amp;md0=<%=NextMd0%>" class="next" title="下星期">
                                        <img src="/s.gif" alt="下星期" class="nextCalArrow" title="下星期" /></a>
                                    <%} %>
                                    <%if (IsDayCalendar)
                                      { %>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md3=<%=PreMd3%>&amp;md0=<%=PreMd0%>" class="prev" title="前一天">
                                        <img src="/s.gif" alt="前一天" class="prevCalArrow" title="前一天" /></a>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md3=<%=NextMd3%>&amp;md0=<%=NextMd0%>" class="next" title="下一天">
                                        <img src="/s.gif" alt="下一天" class="nextCalArrow" title="下一天" /></a>
                                    <%} %>
                                </span>
                                <span class="dateLinks">
                                    <form action="/<%=ModuleType%>/e" id="dtfm" method="GET" name="dtfm" onsubmit="if (window.ffInAlert) { return false; }" style="display: inline">
                                        <input type="hidden" name="rType" id="rType" value="<%=ResourceType%>" />
                                        <input type="hidden" name="cType" id="dphe_cType" value="1" /><input type="hidden" name="md0" id="dphe_md0" value="<%=Md0%>" /><input type="hidden" name="md2" id="dphe_md2" value="<%=Md2%>" /><input id="dtfd" name="dtfd" onchange="document.getElementById('dtfm').submit();" type="hidden" value="<%=RequestDate%>" />
                                    </form>
                                    <img src="/s.gif" alt="选择日期" class="datePickerIcon" onclick="DatePicker.pickDate(true, 'dtfd', false, this);DatePicker.datePicker.cancelHide(getEvent(event));" title="选择日期" />
                                    <%if (IsWeeekCalendar)
                                      { %>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md2=<%=ThisMd2%>&amp;md0=<%=ThisMd0%>">本星期</a>
                                    <%} %>
                                    <%if (IsDayCalendar)
                                      { %>
                                    <a href="/<%=ModuleType%>/c?rType=<%=ResourceType%>&amp;md3=<%=TodayMd3%>&amp;md0=<%=ThisMd0%>">今天</a>
                                    <%} %>
                                </span>
                                <span class="buttons">
                                    <input type="button" title="新建预约" onclick="document.getElementById('ids').submit();return false;" name="new" class="btn" value=" 新建预约 "></span>
                                <%if (Request["md2"] != null)
                                  { %>
                                <span class="wEndCheckBox">
                                    <input id="shWkendsCheckbox" name="shWkendsCheckbox" onclick="window.location='/<%=ModuleType%>    /c?rType=<%=ResourceType%>    &amp;md2=<%=ThisMd2%>    &amp;md0=<%=Md0%>    &amp;shWkends=true';" type="checkbox" value="1" checked="checked" /><label class="checkboxLabel" for="shWkendsCheckbox">显示周末</label></span>
                                <%} %>
                                <div class="legend">
                                    <div class="busy" style="background-color: #00ff21;">&nbsp;</div>
                                    <span>占用</span><div class="outOfOffice" style=""></div>
                                    <span>未审批</span></div>
                                <div class="clear"></div>
                            </div>
                            <div class="multiUserCalendarHeader">
                                <form action="/<%=ModuleType%>/c" id="filter_element" method="GET" name="filter_element" onsubmit="if (window.ffInAlert) { return false; }">
                                    <input type="hidden" id="rType" name="rType" value="2" /><input type="hidden" id="md2" name="md2" value="<%=Md2%>" />
                                    <input type="hidden" id="md0" name="md0" value="<%=Md0%>" />
                                    <div class="bFilterView">
                                        <!--
                                                <span class="bFilter">
                                                    <label for="fcf" style="text-align: left; font-weight: bold; padding-right: .69em;">
                                                        <span class="requiredMark">*</span>视图：</label><span class="fBody"><select id="fcf"
                                                            name="fcf" onchange="javascript:this.form.submit();" title="视图："><option value=""
                                                                selected="selected">全部用户</option>
                                                        </select></span><span class="fFooter"><a href="/ui/list/FilterEditPage?ftype=Z&amp;retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D24%26md0%3D2015">新建视图</a></span></span>-->
                                    </div>
                                </form>
                                <div class="bNext">
                                    <div class="next">
                                        <span class="greyedLink">
                                            <img src="/img/greyedout_previous_arrow.gif" alt="上一页" width="12" height="13" align="texttop"
                                                title="上一页" />上一页</span><span>&nbsp;|&nbsp;</span><span class="greyedLink">下一页<img
                                                    src="/img/greyedout_next_arrow.gif" alt="下一页" width="12" height="13" align="texttop"
                                                    title="下一页" /></span>
                                    </div>
                                </div>
                            </div>
                            <div class="ptBreadcrumb">
                            </div>
                        </div>
                        <div class="bMultiuserCalendar">
                            <!--
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
                        <div class="bNext">
                            <div class="next">
                                <span class="greyedLink">
                                    <img src="/img/greyedout_previous_arrow.gif" alt="上一页" width="12" height="13" align="texttop"
                                        title="上一页" />上一页</span><span>&nbsp;|&nbsp;</span><span class="greyedLink">下一页<img
                                            src="/img/greyedout_next_arrow.gif" alt="下一页" width="12" height="13" align="texttop"
                                            title="下一页" /></span>
                            </div>
                        </div>
                        <% if (Supermore.WebContext.IsAdministrator)
                           { %>
                        <table id="toolsContent" class="toolsContent">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="toolsContentLeft">
                                            <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                <h3 class="lbHeader">报表</h3>
                                                <!--
                                                <div class="lbBody">
                                                   
                                                    <ul>
                                                        <li><a href="/00O?rt=1&amp;retURL=%2F001%2Fo&amp;edit=yes&amp;scope=user&amp;sort=ACCOUNT.NAME&amp;t=title1&amp;colDt_c=DUE_DATE&amp;colDt_s=2015-6-22&amp;c=AO&amp;c=AN&amp;c=A1SA&amp;c=TY&amp;c=RT&amp;c=IN&amp;c=CD&amp;details=yes">
                                                            已启用客户</a></li><li><a href="/00O?rt=1&amp;retURL=%2F001%2Fo&amp;edit=yes&amp;scope=user&amp;sort=DUE_DATE&amp;t=title2&amp;colDt_c=DUE_DATE&amp;colDt_e=2015-5-29&amp;c=DD&amp;c=AO&amp;c=AN&amp;c=A1SA&amp;c=TY&amp;c=RT&amp;c=UD&amp;details=yes">
                                                                有上次活动 &gt; 30 天的 客户</a></li><li><a href="/00O?rt=47&amp;retURL=%2F001%2Fo&amp;paramform=yes&amp;sort=ACCOUNT_NAME&amp;name_op=sw&amp;t=title1&amp;details=yes">
                                                                    客户所有人</a></li><li><a href="/00O?rt=69&amp;retURL=%2F001%2Fo&amp;edit=yes&amp;scope=user&amp;sort=ACCOUNT.NAME&amp;t=titleContactRole&amp;c=MA&amp;c=PR&amp;c=RN&amp;c=FN&amp;c=LN&amp;c=DD&amp;c=AO&amp;c=AN&amp;c=A1SA&amp;c=TY&amp;c=RT&amp;c=UD&amp;details=yes">
                                                                        联系人角色报表</a></li><li><a href="/00O?rt=111&amp;retURL=%2F001%2Fo&amp;sortdir=down&amp;sort=CD&amp;sdate=2015-6-29&amp;edate=2015-6-29&amp;break0=AN&amp;c=AN&amp;c=OW&amp;c=CR&amp;c=FD&amp;c=OV&amp;c=NV&amp;c=CD&amp;details=yes&amp;format=t">
                                                                            客户历史报表</a></li><li><a href="/00O?rt=45&amp;retURL=%2F001%2Fo&amp;edit=yes&amp;scope=user&amp;sort=ACCOUNT.NAME&amp;c=AO&amp;c=AN&amp;c=TY&amp;c=P_AN&amp;c=P_RO&amp;details=yes">
                                                                                合作伙伴客户</a></li></ul>
                                                </div>-->
                                                <div class="lbBody">
                                                    <div class="mainLink">
                                                        <a href="/025/filter">预约列表</a>&nbsp;»
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="toolsContentRight" style="">
                                            <div class="bSubBlock brandSecondaryBrd secondaryPalette">
                                                <h3 class="lbHeader">快速</h3>
                                                <div class="lbBody" style="display: block">
                                                    <ul>
                                                        <li><span><a href="/apps/resm/Reslist.aspx?rType=2">会议室管理</a></span></li>
                                                        <!--<li><span><a href="/02k/o">车辆管理</a></span></li>-->
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <%} %>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'BA0FFpWyvElS3JiIybXY3EBNxnn7N9JNy63YImhJg3n2AxLzUASqA5AH9LrEKK9cplqjFsr3r0B6aslF1F_rYBcJiWGArIpVsMn7padJHuUFtSFIvsjh1DiMxwmZ_ck_svs5mXD8w8uple7IogBpB9XLl4X_1gktuPQJf32oz2e7VIqe'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D24%26md0%3D2015&isAjaxRequest=1&renderMode=RETRO&nocache=1433730693825'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "iK0EGi0R6iO9DL4lUFHPUE1WayonJfN7Z84Hqu_u1SUOdH4ZE0X401bOj2PqS7w4uD6dOPDUUtSSTqNGbm65Pe5Tnn_iL2KA.n1LfX4DOcoroUUsRoJytLu789KZXKVE6TkCluyQ75pZ0pB.DCy2Lri41V4u2rhEadCzaKiU0sVOw3UQY6wrQE7MsWLiW92QWDjvaQ=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
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
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                        </select>
                            </div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a>
                                </div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <!--
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1433737837000, "host": "", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1424969980000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1425578748000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
<!-- page generation time: 215ms -->

