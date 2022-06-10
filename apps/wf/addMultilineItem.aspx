<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addMultilineItem.aspx.cs" Inherits="WebClient.apps.wf.addMultilineItem" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>批量添加 ~  - Developer Edition</title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/static/js/picklist.js"></script>
    <script src="/static/js/spch.js"></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Opportunity';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1471979298000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1471979298000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1470854292000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <script src="/js/Business.js"></script>
    <script type="text/javascript" src="/js/custom/customform.js?as=3"></script>   
   <script type="text/javascript">
       function closePop()
       {
           window.close();
           document.getElementById("action").value = "1";
           //window.opener.location.reload();
       }
   </script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif opportunityTab  ContactRoleEditUi sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <div id="contentWrapper">
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td id="sidebarCell" class=" sidebarCell sidebarCollapsible sidebarCollapsed">
                    </td>
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                                <div class="ptBody">
                                    <div class="content">
                                        <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="noSecondHeader pageType"></h1>
                                        <div class="blank">&nbsp;</div>
                                    </div>
                                    <div class="links"></div>
                                </div>
                                <div class="ptBreadcrumb"></div>
                            </div>
                        <form action="/apps/wf/addMultilineItem.aspx" id="editPage" method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
                            <script src="/apps/CommandProcessor.ashx?cmd=picklist&e=<%=ObjectTypeCode%>"></script>
                             <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <input type="hidden" name="action" id="action" />
                            <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette" id="ep">
                                <div class="pbHeader">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle"></h2>
                                            </td>
                                            <td class="pbButton" id="topButtonRow">
                                                <input value=" 保存并关闭 " class="btn" name="save" title="保存并关闭" type="submit" />
                                                 <input value=" 关闭返回 " class="btn" name="cancel" title="关闭返回" type="button" onclick="closePop()" /></td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <div class="pbBody">
                                    <div class="pbError" id="errorDiv_ep" style="display: none">错误：无效数据。<br />
                                        请查看下列所有错误消息以纠正数据。</div>
                                    <div class="brandTertiaryBgr first pbSubheader tertiaryPalette" id="head_1_ep"><span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter"><span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span class="requiredText"> = 必填信息，不录入不能保存进入数据库</span></span></span><h3>批量信息<span class="titleSeparatingColon">:</span></h3></div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr class="last detailRow">
                                                <td colspan='4'>
                                                   <%=MultilineHTML%>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="pbBottomButtons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;</td>
                                            <td class="pbButtonb" id="bottomButtonRow">
                                                <input value=" 保存并关闭 " class="btn" name="save" title="保存并关闭" type="submit" />
                                                 <input value=" 关闭返回 " class="btn" name="cancel" title="关闭返回" type="button" onclick="closePop()" /></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg"></div>
                                </div>
                            </div>
                            <script>if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "cancel"]); }</script>
                            <script>     sfdcPage.updateDirtyState(GenericSfdcPage.STATE_DIRTY);</script>
                        </form>
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() {
    setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };;
    //if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
//new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
//new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
SfdcApp.MruHovers.global_data.url = 'retURL=%2Fp%2Fopp%2FContactRoleEditUi%2Fe%3Foppid%3D0069000000QASJY%26retURL%3D%252F0069000000QASJY&isAjaxRequest=1&renderMode=RETRO&nocache=1473143626058';
if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
if (window.PreferenceBits) {
    window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd09TMHdPVlF3Tmpvek16bzBOaTR3TmpCYSx2QVJibWt0SmRCYkJQb0dndkQ3M3hfLE1HVXdaalF3";
};
} function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); }
                            function bodyOnUnload() {
                                var ac = document.getElementById("action").value;
                                if (ac != "1") {
                                    window.opener.location.reload();
                                    window.close();
                                }
                            }

                        </script>
                        <script type="text/javascript">
                           function initDatePicker()
                            {
                                var date = new Date();
                                var curYear = date.getFullYear();
                                var startYear = curYear-70;
                                var endYear =curYear+3;
                                var eleSelect = document.getElementById("calYearPicker");
                                //debugger;
                                for (var y = startYear; y <= endYear; y++)
                                {
                                    var opt = new Option(y, y);
                                    if (y == curYear)
                                    {
                                        opt.selected = true;
                                    }
                                    eleSelect.options.add(opt);
                                }
                            }
                           
                        </script>
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年">
                                            
                                        </select></div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">
                                            星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">
                                            星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">
                                        今天</a></div>
                            </div>
                        </div>
                        <!-- End page content -->
                        <script> initDatePicker();</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
    </div>  
</body>
</html>
<!-- page generation time: 182ms -->

